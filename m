Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA0435BF97
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C876E3B2;
	Mon, 12 Apr 2021 09:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562DE6E3A0;
 Mon, 12 Apr 2021 09:09:42 +0000 (UTC)
IronPort-SDR: hy5/jOp7ke7uL6xzyvnkXKCdJY8n6Tr55nM7BcS52rHDPjbR5F2BLyyaA6LfbT8Q8sH36h9W00
 NLA4cGVt271Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="193709748"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="193709748"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:42 -0700
IronPort-SDR: vJWJExWT94XSc6qkFjA6EUhVnGgFI3ta/uYWrmpPazzc+7ZwamhV7AgNzPO/BldAWpYo3uUehG
 zCrTQ2/wt6lQ==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="423712759"
Received: from tarynrox-mobl1.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.5.30])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:40 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 14/19] drm/i915/oprom: Basic sanitization
Date: Mon, 12 Apr 2021 10:05:21 +0100
Message-Id: <20210412090526.30547-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412090526.30547-1-matthew.auld@intel.com>
References: <20210412090526.30547-1-matthew.auld@intel.com>
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
 Mohammed Khajapasha <mohammed.khajapasha@intel.com>,
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

v2:
- Used macro for OPROM header magic 0xaa55 [Rodrigo]
- Added a OPROM layout. [Uma]
- Extract opregion from OPROM package and then extract
  VBT from opregion to have backward compatibility with
  older IFWI.

v3:
- Moved opreg stuff to intel_opregion.{c,h}. [Uma]
- Memory leak and intel_oprom_verify_signature return
  value fixes. [Uma]

v4:
 - Fix return code storage for oprom_image_parse_helper (Matt)

v5 by Jani:
- switch to intel_uncore_read/intel_uncore_write

v6 by Khajapasha:
- Rename intel_oprom_verify_signature() to
  intel_spi_get_oprom_opreg() [Jani, Nikula]
- Use u32 data type for opregion size [Jani, Nikula]

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c     |  47 +++--
 drivers/gpu/drm/i915/display/intel_opregion.c | 169 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_opregion.h |  38 +++-
 3 files changed, 227 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index f9dc651f1652..59eec8333723 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2240,37 +2240,36 @@ bool intel_bios_is_valid_vbt(const void *buf, size_t size)
 
 static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *i915)
 {
-	u32 count, data, found, store = 0;
-	u32 static_region, oprom_offset;
-	u32 oprom_size = 0x200000;
+	u32 count, found, opreg_size;
+	u32 *vbt, *oprom_opreg = NULL;
 	u16 vbt_size;
-	u32 *vbt;
+	u8 *parse_ptr;
 
-	static_region = intel_uncore_read(&i915->uncore, SPI_STATIC_REGIONS);
-	static_region &= OPTIONROM_SPI_REGIONID_MASK;
-	intel_uncore_write(&i915->uncore, PRIMARY_SPI_REGIONID, static_region);
-
-	oprom_offset = intel_uncore_read(&i915->uncore, OROM_OFFSET);
-	oprom_offset &= OROM_OFFSET_MASK;
+	if (intel_spi_get_oprom_opreg(i915, &oprom_opreg, &opreg_size)) {
+		drm_err(&i915->drm, "oprom signature verification failed\n");
+		goto err_not_found;
+	}
 
-	for (count = 0; count < oprom_size; count += 4) {
-		intel_uncore_write(&i915->uncore, PRIMARY_SPI_ADDRESS, oprom_offset + count);
-		data = intel_uncore_read(&i915->uncore, PRIMARY_SPI_TRIGGER);
+	if (!oprom_opreg) {
+		drm_err(&i915->drm, "opregion not found\n");
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
+		drm_err(&i915->drm, "VBT not found in opregion\n");
 		goto err_not_found;
+	}
 
 	/* Get VBT size and allocate space for the VBT */
-	intel_uncore_write(&i915->uncore, PRIMARY_SPI_ADDRESS, found +
-		   offsetof(struct vbt_header, vbt_size));
-	vbt_size = intel_uncore_read(&i915->uncore, PRIMARY_SPI_TRIGGER);
-	vbt_size &= 0xffff;
+	parse_ptr = (u8 *)oprom_opreg + found;
+	vbt_size = ((struct vbt_header *)parse_ptr)->vbt_size;
 
 	vbt = kzalloc(vbt_size, GFP_KERNEL);
 	if (!vbt) {
@@ -2279,16 +2278,12 @@ static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *i915)
 		goto err_not_found;
 	}
 
-	for (count = 0; count < vbt_size; count += 4) {
-		intel_uncore_write(&i915->uncore, PRIMARY_SPI_ADDRESS, found + count);
-		data = intel_uncore_read(&i915->uncore, PRIMARY_SPI_TRIGGER);
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
index dfd724e506b5..e9ccd8265a1f 100644
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
+		intel_uncore_write(&dev_priv->uncore, PRIMARY_SPI_ADDRESS, offset + count);
+		data = intel_uncore_read(&dev_priv->uncore, PRIMARY_SPI_TRIGGER);
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
+ * intel_spi_get_oprom_opreg() get OPROM image.
+ * @i915: pointer to i915 device.
+ * @opreg: pointer to opregion buffer output.
+ * @opreg_size: pointer to opregion size output.
+ */
+int
+intel_spi_get_oprom_opreg(struct drm_i915_private *i915, u32 **opreg,
+			  u32 *opreg_size)
+{
+	u8 img_sig[sizeof(OPREGION_SIGNATURE)];
+	u8 code_type, last_img;
+	u32 static_region, offset, img_len;
+	u32 *oprom_img, *oprom_img_hdr;
+	u16 opreg_base;
+	u8 *parse_ptr;
+	int img_size;
+	int ret = -EINVAL;
+
+	/* initialize SPI to read the OPROM */
+	static_region = intel_uncore_read(&i915->uncore, SPI_STATIC_REGIONS);
+	static_region &= OPTIONROM_SPI_REGIONID_MASK;
+	intel_uncore_write(&i915->uncore, PRIMARY_SPI_REGIONID, static_region);
+	/* read OPROM offset in SPI flash */
+	offset = intel_uncore_read(&i915->uncore, OROM_OFFSET);
+	offset &= OROM_OFFSET_MASK;
+
+	oprom_img_hdr = kzalloc(OPROM_INITIAL_READ_SIZE, GFP_KERNEL);
+	if (!oprom_img_hdr)
+		return -ENOMEM;
+
+	do {
+		spi_read_oprom_helper(OPROM_INITIAL_READ_SIZE, offset,
+				      oprom_img_hdr, i915);
+		img_size = oprom_image_parse_helper((u8 *)oprom_img_hdr, &last_img,
+						    &code_type, i915);
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
+		spi_read_oprom_helper(img_len, offset, oprom_img, i915);
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
+			drm_dbg_kms(&i915->drm, "Found opregion image\n");
+			ret = 0;
+			break;
+		} else if (!memcmp(img_sig, CPD_SIGNATURE, NUM_CPD_BYTES)) {
+			if (code_type != OPROM_CSS_CODE_TYPE) {
+				drm_err(&i915->drm, "Invalid OPROM\n");
+				ret = -EINVAL;
+				goto err_free_img;
+			}
+			drm_dbg_kms(&i915->drm, "Found CSS image\n");
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
index 4aa68ffbd30e..de53dde10dd9 100644
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
@@ -72,6 +100,9 @@ int intel_opregion_notify_adapter(struct drm_i915_private *dev_priv,
 				  pci_power_t state);
 int intel_opregion_get_panel_type(struct drm_i915_private *dev_priv);
 
+int intel_spi_get_oprom_opreg(struct drm_i915_private *i915, u32 **opreg,
+			      u32 *opreg_size);
+
 #else /* CONFIG_ACPI*/
 
 static inline int intel_opregion_setup(struct drm_i915_private *dev_priv)
@@ -117,6 +148,11 @@ static inline int intel_opregion_get_panel_type(struct drm_i915_private *dev)
 	return -ENODEV;
 }
 
-#endif /* CONFIG_ACPI */
+static int intel_spi_get_oprom_opreg(struct drm_i915_private *i915, u32 **opreg,
+				     u32 *opreg_size)
+{
+	return 0;
+}
 
+#endif /* CONFIG_ACPI */
 #endif
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
