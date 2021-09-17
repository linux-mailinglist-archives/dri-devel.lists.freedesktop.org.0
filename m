Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 311774101B3
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 01:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8942C6EEA1;
	Fri, 17 Sep 2021 23:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE0E6EEA0;
 Fri, 17 Sep 2021 23:29:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="221013093"
X-IronPort-AV: E=Sophos;i="5.85,302,1624345200"; d="scan'208";a="221013093"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 16:29:13 -0700
X-IronPort-AV: E=Sophos;i="5.85,302,1624345200"; d="scan'208";a="652021709"
Received: from yseah-mobl.gar.corp.intel.com (HELO ldmartin-desk2)
 ([10.252.130.247])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 16:29:13 -0700
Date: Fri, 17 Sep 2021 16:29:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>
Subject: Re: [Intel-gfx] [PATCH 13/19] drm/i915/dg1: Read OPROM via SPI
 controller
Message-ID: <20210917232913.hbvwec77u5hjp74a@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-14-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210412090526.30547-14-matthew.auld@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 10:05:20AM +0100, Matthew Auld wrote:
>From: Clint Taylor <clinton.a.taylor@intel.com>
>
>Read OPROM SPI through MMIO and find VBT entry since we can't use
>OpRegion and PCI mapping may not work on some systems due to the BIOS
>not leaving the Option ROM mapped.

I was surprised to see we still don't have this patch applied. There is
some coding style to fix, but if we don't have it we are basically
relying on the fallback of using a fake/hardcoded vbt. I will do some
fixups and re-submit.

Lucas De Marchi

>
>v2 by Jani:
>- switch to intel_uncore_read/intel_uncore_write
>
>Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>Cc: Tomas Winkler <tomas.winkler@intel.com>
>Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> drivers/gpu/drm/i915/display/intel_bios.c | 80 +++++++++++++++++++++--
> drivers/gpu/drm/i915/i915_reg.h           |  8 +++
> 2 files changed, 82 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
>index ea4837d485a1..f9dc651f1652 100644
>--- a/drivers/gpu/drm/i915/display/intel_bios.c
>+++ b/drivers/gpu/drm/i915/display/intel_bios.c
>@@ -2238,6 +2238,66 @@ bool intel_bios_is_valid_vbt(const void *buf, size_t size)
> 	return vbt;
> }
>
>+static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *i915)
>+{
>+	u32 count, data, found, store = 0;
>+	u32 static_region, oprom_offset;
>+	u32 oprom_size = 0x200000;
>+	u16 vbt_size;
>+	u32 *vbt;
>+
>+	static_region = intel_uncore_read(&i915->uncore, SPI_STATIC_REGIONS);
>+	static_region &= OPTIONROM_SPI_REGIONID_MASK;
>+	intel_uncore_write(&i915->uncore, PRIMARY_SPI_REGIONID, static_region);
>+
>+	oprom_offset = intel_uncore_read(&i915->uncore, OROM_OFFSET);
>+	oprom_offset &= OROM_OFFSET_MASK;
>+
>+	for (count = 0; count < oprom_size; count += 4) {
>+		intel_uncore_write(&i915->uncore, PRIMARY_SPI_ADDRESS, oprom_offset + count);
>+		data = intel_uncore_read(&i915->uncore, PRIMARY_SPI_TRIGGER);
>+
>+		if (data == *((const u32 *)"$VBT")) {
>+			found = oprom_offset + count;
>+			break;
>+		}
>+	}
>+
>+	if (count >= oprom_size)
>+		goto err_not_found;
>+
>+	/* Get VBT size and allocate space for the VBT */
>+	intel_uncore_write(&i915->uncore, PRIMARY_SPI_ADDRESS, found +
>+		   offsetof(struct vbt_header, vbt_size));
>+	vbt_size = intel_uncore_read(&i915->uncore, PRIMARY_SPI_TRIGGER);
>+	vbt_size &= 0xffff;
>+
>+	vbt = kzalloc(vbt_size, GFP_KERNEL);
>+	if (!vbt) {
>+		DRM_ERROR("Unable to allocate %u bytes for VBT storage\n",
>+			  vbt_size);
>+		goto err_not_found;
>+	}
>+
>+	for (count = 0; count < vbt_size; count += 4) {
>+		intel_uncore_write(&i915->uncore, PRIMARY_SPI_ADDRESS, found + count);
>+		data = intel_uncore_read(&i915->uncore, PRIMARY_SPI_TRIGGER);
>+		*(vbt + store++) = data;
>+	}
>+
>+	if (!intel_bios_is_valid_vbt(vbt, vbt_size))
>+		goto err_free_vbt;
>+
>+	DRM_DEBUG_KMS("Found valid VBT in SPI flash\n");
>+
>+	return (struct vbt_header *)vbt;
>+
>+err_free_vbt:
>+	kfree(vbt);
>+err_not_found:
>+	return NULL;
>+}
>+
> static struct vbt_header *oprom_get_vbt(struct drm_i915_private *i915)
> {
> 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>@@ -2287,6 +2347,8 @@ static struct vbt_header *oprom_get_vbt(struct drm_i915_private *i915)
>
> 	pci_unmap_rom(pdev, oprom);
>
>+	DRM_DEBUG_KMS("Found valid VBT in PCI ROM\n");
>+
> 	return vbt;
>
> err_free_vbt:
>@@ -2321,17 +2383,23 @@ void intel_bios_init(struct drm_i915_private *i915)
>
> 	init_vbt_defaults(i915);
>
>-	/* If the OpRegion does not have VBT, look in PCI ROM. */
>+	/*
>+	 * If the OpRegion does not have VBT, look in SPI flash through MMIO or
>+	 * PCI mapping
>+	 */
>+	if (!vbt && IS_DGFX(i915)) {
>+		oprom_vbt = spi_oprom_get_vbt(i915);
>+		vbt = oprom_vbt;
>+	}
>+
> 	if (!vbt) {
> 		oprom_vbt = oprom_get_vbt(i915);
>-		if (!oprom_vbt)
>-			goto out;
>-
> 		vbt = oprom_vbt;
>-
>-		drm_dbg_kms(&i915->drm, "Found valid VBT in PCI ROM\n");
> 	}
>
>+	if (!vbt)
>+		goto out;
>+
> 	bdb = get_bdb_header(vbt);
> 	i915->vbt.version = bdb->version;
>
>diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>index da73dc939e58..54ff63b86df6 100644
>--- a/drivers/gpu/drm/i915/i915_reg.h
>+++ b/drivers/gpu/drm/i915/i915_reg.h
>@@ -12540,6 +12540,14 @@ enum skl_power_gate {
> #define   DP_PIN_ASSIGNMENT_MASK(idx)		(0xf << ((idx) * 4))
> #define   DP_PIN_ASSIGNMENT(idx, x)		((x) << ((idx) * 4))
>
>+#define PRIMARY_SPI_TRIGGER			_MMIO(0x102040)
>+#define PRIMARY_SPI_ADDRESS			_MMIO(0x102080)
>+#define PRIMARY_SPI_REGIONID			_MMIO(0x102084)
>+#define SPI_STATIC_REGIONS			_MMIO(0x102090)
>+#define   OPTIONROM_SPI_REGIONID_MASK		REG_GENMASK(7, 0)
>+#define OROM_OFFSET				_MMIO(0x1020c0)
>+#define   OROM_OFFSET_MASK			REG_GENMASK(20, 16)
>+
> /* This register controls the Display State Buffer (DSB) engines. */
> #define _DSBSL_INSTANCE_BASE		0x70B00
> #define DSBSL_INSTANCE(pipe, id)	(_DSBSL_INSTANCE_BASE + \
>-- 
>2.26.3
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
