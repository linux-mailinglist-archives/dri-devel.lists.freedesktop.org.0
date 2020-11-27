Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D70C2C6546
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412316ECFF;
	Fri, 27 Nov 2020 12:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34776ECFA;
 Fri, 27 Nov 2020 12:11:22 +0000 (UTC)
IronPort-SDR: MMBqHYSsP5Lr/a5yX8QumuJTEjjqTXhaBkVSAq1K/XP/xe0pIiXi6Ix3Brr+zWVKXKJwPMkGxc
 krUgXBgYC2Dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092890"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092890"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:22 -0800
IronPort-SDR: 93cO1b6xB6IJ7W3Wqg9B8s/+VJuWyP3yH023Mh7oBPJDIcoV8Idp3/QqWSNgT7g1x22upPMFae
 Z1Li24UBA4gQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029758"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:20 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 120/162] drm/i915/oprom: Basic sanitization
Date: Fri, 27 Nov 2020 12:06:36 +0000
Message-Id: <20201127120718.454037-121-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Jani Nikula <jani.nikula@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Anshuman Gupta <anshuman.gupta@intel.com>

Sanitize OPROM header, CPD signature and OPROM PCI version.
OPROM_HEADER, EXPANSION_ROM_HEADER and OPROM_MEU_BLOB structures
and PCI struct offsets are provided by GSC counterparts.
These are yet to be Documented in B.Spec.
After successful sanitization, extract VBT from opregion
image.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c     |  49 +++--
 drivers/gpu/drm/i915/display/intel_opregion.c | 169 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_opregion.h |  31 +++-
 3 files changed, 221 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 91044fc52acb..358576bc0be2 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2088,37 +2088,36 @@ bool intel_bios_is_valid_vbt(const void *buf, size_t size)
 
 static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *dev_priv)
 {
-	u32 count, data, found, store = 0;
-	u32 static_region, oprom_offset;
-	u32 oprom_size = 0x200000;
-	u16 vbt_size;
-	u32 *vbt;
-
-	static_region = I915_READ(SPI_STATIC_REGIONS);
-	static_region &= OPTIONROM_SPI_REGIONID_MASK;
-	I915_WRITE(PRIMARY_SPI_REGIONID, static_region);
+	u32 count, found;
+	u32 *vbt, *oprom_opreg = NULL;
+	u16 vbt_size, opreg_size;
+	u8 *parse_ptr;
 
-	oprom_offset = I915_READ(OROM_OFFSET);
-	oprom_offset &= OROM_OFFSET_MASK;
+	if (intel_oprom_verify_signature(&oprom_opreg, &opreg_size, dev_priv)) {
+		drm_err(&dev_priv->drm, "oprom signature verification failed\n");
+		goto err_not_found;
+	}
 
-	for (count = 0; count < oprom_size; count += 4) {
-		I915_WRITE(PRIMARY_SPI_ADDRESS, oprom_offset + count);
-		data = I915_READ(PRIMARY_SPI_TRIGGER);
+	if (!oprom_opreg) {
+		drm_err(&dev_priv->drm, "opregion not found\n");
+		goto err_not_found;
+	}
 
-		if (data == *((const u32 *)"$VBT")) {
-			found = oprom_offset + count;
+	for (count = 0; count < opreg_size; count += 4) {
+		if (oprom_opreg[count / 4] == *((const u32 *)"$VBT")) {
+			found = count;
 			break;
 		}
 	}
 
-	if (count >= oprom_size)
+	if (count >= opreg_size) {
+		drm_err(&dev_priv->drm, "VBT not found in opregion\n");
 		goto err_not_found;
+	}
 
 	/* Get VBT size and allocate space for the VBT */
-	I915_WRITE(PRIMARY_SPI_ADDRESS, found +
-		   offsetof(struct vbt_header, vbt_size));
-	vbt_size = I915_READ(PRIMARY_SPI_TRIGGER);
-	vbt_size &= 0xffff;
+	parse_ptr = (u8 *)oprom_opreg + found;
+	vbt_size = ((struct vbt_header *)parse_ptr)->vbt_size;
 
 	vbt = kzalloc(vbt_size, GFP_KERNEL);
 	if (!vbt) {
@@ -2127,16 +2126,12 @@ static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *dev_priv)
 		goto err_not_found;
 	}
 
-	for (count = 0; count < vbt_size; count += 4) {
-		I915_WRITE(PRIMARY_SPI_ADDRESS, found + count);
-		data = I915_READ(PRIMARY_SPI_TRIGGER);
-		*(vbt + store++) = data;
-	}
-
+	memcpy(vbt, parse_ptr, vbt_size);
 	if (!intel_bios_is_valid_vbt(vbt, vbt_size))
 		goto err_free_vbt;
 
 	DRM_DEBUG_KMS("Found valid VBT in SPI flash\n");
+	kfree(oprom_opreg);
 
 	return (struct vbt_header *)vbt;
 
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index 4f77cf849171..81e5946393dd 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -983,6 +983,175 @@ int intel_opregion_setup(struct drm_i915_private *dev_priv)
 	return err;
 }
 
+static int oprom_image_parse_helper(u8 *parse_ptr, u8 *last_img, u8 *code_type,
+				    struct drm_i915_private *i915)
+{
+	u8 size_512_bytes;
+
+	if (((union oprom_header *)parse_ptr)->signature != OPROM_IMAGE_MAGIC) {
+		drm_err(&i915->drm, "Wrong OPROM header signature.\n");
+		return -EINVAL;
+	}
+
+	size_512_bytes = parse_ptr[((struct expansion_rom_header *)parse_ptr)->pcistructoffset + PCI_IMAGE_LENGTH_OFFSET];
+	*code_type = parse_ptr[((struct expansion_rom_header *)parse_ptr)->pcistructoffset + PCI_CODE_TYPE_OFFSET];
+	*last_img = parse_ptr[((struct expansion_rom_header *)parse_ptr)->pcistructoffset + PCI_LAST_IMAGE_INDICATOR_OFFSET];
+
+	return size_512_bytes;
+}
+
+static void spi_read_oprom_helper(size_t len, u32 offset, u32 *buf,
+				  struct drm_i915_private *dev_priv)
+{
+	u32 count, data;
+
+	for (count = 0; count < len; count += 4) {
+		I915_WRITE(PRIMARY_SPI_ADDRESS, offset + count);
+		data = I915_READ(PRIMARY_SPI_TRIGGER);
+		buf[count / 4] = data;
+	}
+}
+
+/**
+ *	+        DASH+G OPROM IMAGE LAYOUT           +
+ *	+--------+-------+---------------------------+
+ *	| Offset | Value |   ROM Header Fields       +-----> Image 1 (CSS)
+ *	+--------------------------------------------+
+ *	|    0h  |  55h  |   ROM Signature Byte1     |
+ *	|    1h  |  AAh  |   ROM Signature Byte2     |
+ *	|    2h  |  xx   |        Reserved           |
+ *	|  18+19h|  xx   |  Ptr to PCI DataStructure |
+ *	+----------------+---------------------------+
+ *	|           PCI Data Structure               |
+ *	+--------------------------------------------+
+ *	|    .       .             .                 |
+ *	|    .       .             .                 |
+ *	|    10  +  xx   +     Image Length          |
+ *	|    14  +  xx   +     Code Type             |
+ *	|    15  +  xx   +  Last Image Indicator     |
+ *	|    .       .             .                 |
+ *	+--------------------------------------------+
+ *	|               MEU BLOB                     |
+ *	+--------------------------------------------+
+ *	|              CPD Header                    |
+ *	|              CPD Entry                     |
+ *	|              Reserved                      |
+ *	|           SignedDataPart1                  |
+ *	|              PublicKey                     |
+ *	|            RSA Signature                   |
+ *	|           SignedDataPart2                  |
+ *	|            IFWI Metadata                   |
+ *	+--------+-------+---------------------------+
+ *	|    .   |   .   |         .                 |
+ *	|    .   |   .   |         .                 |
+ *	+--------------------------------------------+
+ *	| Offset | Value |   ROM Header Fields       +-----> Image 2 (Config Data) (Offset: 0x800)
+ *	+--------------------------------------------+
+ *	|    0h  |  55h  |   ROM Signature Byte1     |
+ *	|    1h  |  AAh  |   ROM Signature Byte2     |
+ *	|    2h  |  xx   |        Reserved           |
+ *	|  18+19h|  xx   |  Ptr to PCI DataStructure |
+ *	+----------------+---------------------------+
+ *	|           PCI Data Structure               |
+ *	+--------------------------------------------+
+ *	|    .       .             .                 |
+ *	|    .       .             .                 |
+ *	|    10  +  xx   +     Image Length          |
+ *	|    14  +  xx   +      Code Type            |
+ *	|    15  +  xx   +   Last Image Indicator    |
+ *	|    .       .             .                 |
+ *	|    1A  +  3C   + Ptr to Opregion Signature |
+ *	|    .       .             .                 |
+ *	|    .       .             .                 |
+ *	|   83Ch + IntelGraphicsMem                  | <---+ Opregion Signature
+ *	+--------+-----------------------------------+
+ *
+ * intel_oprom_verify_signature() verify OPROM signature.
+ * @opreg: pointer to opregion buffer output.
+ * @opreg_size: pointer to opregion size output.
+ * @dev_priv: i915 device.
+ */
+int
+intel_oprom_verify_signature(u32 **opreg, u16 *opreg_size,
+			     struct drm_i915_private *dev_priv)
+{
+	u8 img_sig[sizeof(OPREGION_SIGNATURE)];
+	u8 code_type, last_img;
+	u32 static_region, offset;
+	u32 *oprom_img, *oprom_img_hdr;
+	u16 opreg_base, img_len;
+	u8 *parse_ptr;
+	int img_size;
+	int ret = -EINVAL;
+
+	/* initialize SPI to read the OPROM */
+	static_region = I915_READ(SPI_STATIC_REGIONS);
+	static_region &= OPTIONROM_SPI_REGIONID_MASK;
+	I915_WRITE(PRIMARY_SPI_REGIONID, static_region);
+	/* read OPROM offset in SPI flash */
+	offset = I915_READ(OROM_OFFSET);
+	offset &= OROM_OFFSET_MASK;
+
+	oprom_img_hdr = kzalloc(OPROM_INITIAL_READ_SIZE, GFP_KERNEL);
+	if (!oprom_img_hdr)
+		return -ENOMEM;
+
+	do {
+		spi_read_oprom_helper(OPROM_INITIAL_READ_SIZE, offset,
+				      oprom_img_hdr, dev_priv);
+		img_size = oprom_image_parse_helper((u8 *)oprom_img_hdr, &last_img,
+						    &code_type, dev_priv);
+		if (img_size <= 0) {
+			ret = -EINVAL;
+			goto err_free_hdr;
+		}
+
+		img_len = img_size * OPROM_BYTE_BOUNDARY;
+		oprom_img = kzalloc(img_len, GFP_KERNEL);
+		if (!oprom_img) {
+			ret = -ENOMEM;
+			goto err_free_hdr;
+		}
+
+		spi_read_oprom_helper(img_len, offset, oprom_img, dev_priv);
+		parse_ptr = (u8 *)oprom_img;
+		offset = offset + img_len;
+
+		/* opregion base offset */
+		opreg_base = ((struct expansion_rom_header *)parse_ptr)->opregion_base;
+		/* CPD or opreg signature is present at opregion_base offset */
+		memcpy(img_sig, parse_ptr + opreg_base, sizeof(OPREGION_SIGNATURE));
+
+		if (!memcmp(img_sig, OPREGION_SIGNATURE, sizeof(OPREGION_SIGNATURE) - 1)) {
+			*opreg = oprom_img;
+			*opreg_size = img_len;
+			drm_dbg_kms(&dev_priv->drm, "Found opregion image\n");
+			ret = 0;
+			break;
+		} else if (!memcmp(img_sig, CPD_SIGNATURE, NUM_CPD_BYTES)) {
+			if (code_type != OPROM_CSS_CODE_TYPE) {
+				drm_err(&dev_priv->drm, "Invalid OPROM\n");
+				ret = -EINVAL;
+				goto err_free_img;
+			}
+			drm_dbg_kms(&dev_priv->drm, "Found CSS image\n");
+			/* proceed here onwards for signature authentication */
+			kfree(oprom_img);
+			continue;
+		}
+
+	} while (last_img != LAST_IMG_INDICATOR);
+
+	return ret;
+
+err_free_img:
+	kfree(oprom_img);
+err_free_hdr:
+	kfree(oprom_img_hdr);
+
+	return ret;
+}
+
 static int intel_use_opregion_panel_type_callback(const struct dmi_system_id *id)
 {
 	DRM_INFO("Using panel type from OpRegion on %s\n", id->ident);
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.h b/drivers/gpu/drm/i915/display/intel_opregion.h
index 4aa68ffbd30e..4e2eeadf101e 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.h
+++ b/drivers/gpu/drm/i915/display/intel_opregion.h
@@ -54,6 +54,34 @@ struct intel_opregion {
 
 #define OPREGION_SIZE            (8 * 1024)
 
+#define CPD_SIGNATURE "$CPD"                  /* CPD Signature */
+#define NUM_CPD_BYTES 4
+#define PCI_IMAGE_LENGTH_OFFSET 0x10
+#define PCI_CODE_TYPE_OFFSET 0x14
+#define PCI_LAST_IMAGE_INDICATOR_OFFSET 0x15
+#define LAST_IMG_INDICATOR 0x80
+#define OPROM_IMAGE_MAGIC 0xAA55       /* Little Endian */
+#define OPROM_CSS_CODE_TYPE 0xF0
+#define OPROM_BYTE_BOUNDARY 512        /* OPROM image sizes are indicated in 512 byte boundaries */
+#define OPROM_INITIAL_READ_SIZE 60     /* Read 60 bytes to compute the Img Len from PCI structure */
+
+union oprom_header {
+	u32 data;
+	struct {
+		u16 signature;  /* Offset[0x0]: Header 0x55 0xAA */
+		u8 sizein512bytes;
+		u8 reserved;
+	};
+};
+
+struct expansion_rom_header {
+	union oprom_header header;      /* Offset[0x0]: Oprom Header */
+	u16 vbiospostoffset;    /* Offset[0x4]: pointer to VBIOS entry point */
+	u8 resvd[0x12];
+	u16 pcistructoffset;    /* Offset[0x18]: Contains pointer PCI Data Structure */
+	u16 opregion_base;      /* Offset[0x1A]: Offset to Opregion Base start */
+};
+
 #ifdef CONFIG_ACPI
 
 int intel_opregion_setup(struct drm_i915_private *dev_priv);
@@ -118,5 +146,6 @@ static inline int intel_opregion_get_panel_type(struct drm_i915_private *dev)
 }
 
 #endif /* CONFIG_ACPI */
-
+int intel_oprom_verify_signature(u32 **opreg, u16 *opreg_size,
+				 struct drm_i915_private *i915);
 #endif
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
