Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDJ5GBQBoWlVpQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 03:27:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB06E1B206C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 03:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA0210EA2E;
	Fri, 27 Feb 2026 02:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/NqPDWv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD30110E0DB;
 Fri, 27 Feb 2026 02:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772159240; x=1803695240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+KoBO3Lhn7MBE9PrGwR+LblOJMGuLFCI3xlucaVLTmE=;
 b=g/NqPDWva/sWBluXd2N7N71b5RgdL34cZACBVccg17sUx4pfU79n2rmb
 M8dJX26/QZL9SdCPzekYdH/5z7rqmu5IwOV/Vbt90o7e8mUtyFOT3gH3U
 VmScg1ZizbTQz8+LqHRESdZm1cYICdHcTzySLUXV8vaM/cUYsL61DpN9L
 OQEkiPYS1uvZnZ2uSAdeNzQxMmdSBGQE3+kIaqdAiNCflTexMvIPoeIDg
 jplnpT2P20Roysv+59rYgCFjW39JzU9LUAZ5YweOyptFxhfsqqHO2iww1
 NiBgh+FmG1qn+lpFhatG8r52LZB/6rVcGjETnomE7MYO/+ocee2M6+FzA A==;
X-CSE-ConnectionGUID: Mrl+i5YbTVukr0Y1vSQl2g==
X-CSE-MsgGUID: MTmhjGboQzG0RKzMPQhNkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73283323"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73283323"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 18:27:18 -0800
X-CSE-ConnectionGUID: uE5wVZjkRGKcJV6LMRZCXg==
X-CSE-MsgGUID: fRKh10FYRTCAmxVF8gPw8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="214662261"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 18:27:17 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 irenic.rajneesh@gmail.com, ilpo.jarvinen@linux.intel.com,
 srinivas.pandruvada@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xi.pardee@linux.intel.com
Cc: david.e.box@linux.intel.com, hansg@kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH v6 4/6] platform/x86/intel/vsec: Switch exported helpers from
 pci_dev to device
Date: Thu, 26 Feb 2026 18:27:08 -0800
Message-ID: <20260227022711.3513663-5-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227022711.3513663-1-david.e.box@linux.intel.com>
References: <20260227022711.3513663-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,gmail.com,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david.e.box@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[header.id:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ep_info.dev:url]
X-Rspamd-Queue-Id: EB06E1B206C
X-Rspamd-Action: no action

Preparatory refactor for ACPI-enumerated PMT endpoints. Several exported
PMT/VSEC interfaces and structs carried struct pci_dev * even though
callers only need a generic struct device. Move those to struct device * so
the same APIs work for PCI and ACPI parents.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
Changes in v6:
  - No change

Changes in v5:
  - xe_vsec.h: Remove forward declaration for pci_dev and add for device

Changes in v4:
  - No change

Changes in v3:
  - No change

Changes in v2:
  - Add forward declarations for struct device in class.h, telemetry.h
  - Restore struct pci_dev forward declaration in intel_vsec.h that was
    removed
  - Remove base_addr parameter changes (moved to separate patch)
  - Remove erroneous hunk in intel_vsec_pci_probe()
    (review comments by Ilpo J=C3=A4rvinen)

 drivers/gpu/drm/xe/xe_debugfs.c               |  2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                 |  2 +-
 drivers/gpu/drm/xe/xe_vsec.c                  |  7 ++-
 drivers/gpu/drm/xe/xe_vsec.h                  |  4 +-
 drivers/platform/x86/intel/pmc/core.c         |  4 +-
 .../platform/x86/intel/pmc/ssram_telemetry.c  |  2 +-
 drivers/platform/x86/intel/pmt/class.c        |  8 ++--
 drivers/platform/x86/intel/pmt/class.h        |  5 ++-
 drivers/platform/x86/intel/pmt/discovery.c    |  4 +-
 drivers/platform/x86/intel/pmt/telemetry.c    | 13 +++---
 drivers/platform/x86/intel/pmt/telemetry.h    | 12 ++---
 drivers/platform/x86/intel/sdsi.c             |  5 ++-
 drivers/platform/x86/intel/vsec.c             | 44 +++++++++++--------
 drivers/platform/x86/intel/vsec_tpmi.c        | 10 ++---
 include/linux/intel_vsec.h                    | 13 +++---
 15 files changed, 73 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugf=
s.c
index 844cfafe1ec7..ad2d8f179eb6 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -45,7 +45,7 @@ static void read_residency_counter(struct xe_device *xe, =
struct xe_mmio *mmio,
 	u64 residency =3D 0;
 	int ret;
=20
-	ret =3D xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
+	ret =3D xe_pmt_telem_read(xe->drm.dev,
 				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
 				&residency, offset, sizeof(residency));
 	if (ret !=3D sizeof(residency)) {
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 0fd4d4f1014a..92e423a339f1 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -506,7 +506,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel=
, long *energy)
 	if (hwmon->xe->info.platform =3D=3D XE_BATTLEMAGE) {
 		u64 pmt_val;
=20
-		ret =3D xe_pmt_telem_read(to_pci_dev(hwmon->xe->drm.dev),
+		ret =3D xe_pmt_telem_read(hwmon->xe->drm.dev,
 					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
 					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
 		if (ret !=3D sizeof(pmt_val)) {
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 4ebb4dbe1c9b..a9baf0bfe572 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -140,10 +140,10 @@ static int xe_guid_decode(u32 guid, int *index, u32 *=
offset)
 	return 0;
 }
=20
-int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t us=
er_offset,
+int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user=
_offset,
 		      u32 count)
 {
-	struct xe_device *xe =3D pdev_to_xe_device(pdev);
+	struct xe_device *xe =3D kdev_to_xe_device(dev);
 	void __iomem *telem_addr =3D xe->mmio.regs + BMG_TELEMETRY_OFFSET;
 	u32 mem_region;
 	u32 offset;
@@ -198,7 +198,6 @@ void xe_vsec_init(struct xe_device *xe)
 {
 	struct intel_vsec_platform_info *info;
 	struct device *dev =3D xe->drm.dev;
-	struct pci_dev *pdev =3D to_pci_dev(dev);
 	enum xe_vsec platform;
=20
 	platform =3D get_platform_info(xe);
@@ -221,6 +220,6 @@ void xe_vsec_init(struct xe_device *xe)
 	 * Register a VSEC. Cleanup is handled using device managed
 	 * resources.
 	 */
-	intel_vsec_register(pdev, info);
+	intel_vsec_register(dev, info);
 }
 MODULE_IMPORT_NS("INTEL_VSEC");
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
index dabfb4e02d70..a25b4e6e681b 100644
--- a/drivers/gpu/drm/xe/xe_vsec.h
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -6,10 +6,10 @@
=20
 #include <linux/types.h>
=20
-struct pci_dev;
+struct device;
 struct xe_device;
=20
 void xe_vsec_init(struct xe_device *xe);
-int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t us=
er_offset, u32 count);
+int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user=
_offset, u32 count);
=20
 #endif
diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/i=
ntel/pmc/core.c
index 02b303418d18..d91e1ab842d6 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1315,7 +1315,7 @@ static struct telem_endpoint *pmc_core_register_endpo=
int(struct pci_dev *pcidev,
 	unsigned int i;
=20
 	for (i =3D 0; guids[i]; i++) {
-		ep =3D pmt_telem_find_and_register_endpoint(pcidev, guids[i], 0);
+		ep =3D pmt_telem_find_and_register_endpoint(&pcidev->dev, guids[i], 0);
 		if (!IS_ERR(ep))
 			return ep;
 	}
@@ -1600,7 +1600,7 @@ static int pmc_core_get_telem_info(struct pmc_dev *pm=
cdev, struct pmc_dev_info *
 		if (!pmc->map->lpm_req_guid)
 			return -ENXIO;
=20
-		ep =3D pmt_telem_find_and_register_endpoint(pcidev, pmc->map->lpm_req_gu=
id, 0);
+		ep =3D pmt_telem_find_and_register_endpoint(&pcidev->dev, pmc->map->lpm_=
req_guid, 0);
 		if (IS_ERR(ep)) {
 			dev_dbg(&pmcdev->pdev->dev, "couldn't get telem endpoint %pe", ep);
 			return -EPROBE_DEFER;
diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 03fad9331fc0..6f6e83e70fc5 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -60,7 +60,7 @@ pmc_ssram_telemetry_add_pmt(struct pci_dev *pcidev, u64 s=
sram_base, void __iomem
 	info.base_addr =3D ssram_base;
 	info.parent =3D &pcidev->dev;
=20
-	return intel_vsec_register(pcidev, &info);
+	return intel_vsec_register(&pcidev->dev, &info);
 }
=20
 static inline u64 get_base(void __iomem *addr, u32 offset)
diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/=
intel/pmt/class.c
index be3c8d9e4fff..b4c9964df807 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -60,11 +60,11 @@ pmt_memcpy64_fromio(void *to, const u64 __iomem *from, =
size_t count)
 	return count;
 }
=20
-int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u3=
2 guid, void *buf,
+int pmt_telem_read_mmio(struct device *dev, struct pmt_callbacks *cb, u32 =
guid, void *buf,
 			void __iomem *addr, loff_t off, u32 count)
 {
 	if (cb && cb->read_telem)
-		return cb->read_telem(pdev, guid, buf, off, count);
+		return cb->read_telem(dev, guid, buf, off, count);
=20
 	addr +=3D off;
=20
@@ -99,7 +99,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
 	if (count > entry->size - off)
 		count =3D entry->size - off;
=20
-	count =3D pmt_telem_read_mmio(entry->pcidev, entry->cb, entry->header.gui=
d, buf,
+	count =3D pmt_telem_read_mmio(entry->ep->dev, entry->cb, entry->header.gu=
id, buf,
 				    entry->base, off, count);
=20
 	return count;
@@ -208,7 +208,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_en=
try *entry,
 				    struct intel_vsec_device *ivdev,
 				    struct resource *disc_res)
 {
-	struct pci_dev *pci_dev =3D ivdev->pcidev;
+	struct pci_dev *pci_dev =3D to_pci_dev(ivdev->dev);
 	struct device *dev =3D &ivdev->auxdev.dev;
 	struct intel_pmt_header *header =3D &entry->header;
 	u8 bir;
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/=
intel/pmt/class.h
index 3c5ad5f52bca..1ae56a5baad2 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -19,11 +19,12 @@
 #define GET_BIR(v)		((v) & GENMASK(2, 0))
 #define GET_ADDRESS(v)		((v) & GENMASK(31, 3))
=20
+struct device;
 struct pci_dev;
 extern struct class intel_pmt_class;
=20
 struct telem_endpoint {
-	struct pci_dev		*pcidev;
+	struct device		*dev;
 	struct telem_header	header;
 	struct pmt_callbacks	*cb;
 	void __iomem		*base;
@@ -65,7 +66,7 @@ struct intel_pmt_namespace {
 				struct intel_pmt_entry *entry);
 };
=20
-int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u3=
2 guid, void *buf,
+int pmt_telem_read_mmio(struct device *dev, struct pmt_callbacks *cb, u32 =
guid, void *buf,
 			void __iomem *addr, loff_t off, u32 count);
 bool intel_pmt_is_early_client_hw(struct device *dev);
 int intel_pmt_dev_create(struct intel_pmt_entry *entry,
diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/=
x86/intel/pmt/discovery.c
index e500aa327d23..c482368bfaae 100644
--- a/drivers/platform/x86/intel/pmt/discovery.c
+++ b/drivers/platform/x86/intel/pmt/discovery.c
@@ -542,7 +542,7 @@ static int pmt_features_probe(struct auxiliary_device *=
auxdev, const struct auxi
 	if (!priv)
 		return -ENOMEM;
=20
-	priv->parent =3D &ivdev->pcidev->dev;
+	priv->parent =3D ivdev->dev;
 	auxiliary_set_drvdata(auxdev, priv);
=20
 	priv->dev =3D device_create(&intel_pmt_class, &auxdev->dev, MKDEV(0, 0), =
priv,
@@ -609,7 +609,7 @@ void intel_pmt_get_features(struct intel_pmt_entry *ent=
ry)
=20
 	mutex_lock(&feature_list_lock);
 	list_for_each_entry(feature, &pmt_feature_list, list) {
-		if (feature->priv->parent !=3D &entry->ep->pcidev->dev)
+		if (feature->priv->parent !=3D entry->ep->dev)
 			continue;
=20
 		pmt_get_features(entry, feature);
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/=
x86/intel/pmt/telemetry.c
index a52803bfe124..bdc7c24a3678 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -112,7 +112,7 @@ static int pmt_telem_add_endpoint(struct intel_vsec_dev=
ice *ivdev,
 		return -ENOMEM;
=20
 	ep =3D entry->ep;
-	ep->pcidev =3D ivdev->pcidev;
+	ep->dev =3D ivdev->dev;
 	ep->header.access_type =3D entry->header.access_type;
 	ep->header.guid =3D entry->header.guid;
 	ep->header.base_offset =3D entry->header.base_offset;
@@ -204,7 +204,7 @@ int pmt_telem_get_endpoint_info(int devid, struct telem=
_endpoint_info *info)
 		goto unlock;
 	}
=20
-	info->pdev =3D entry->ep->pcidev;
+	info->dev =3D entry->ep->dev;
 	info->header =3D entry->ep->header;
=20
 unlock:
@@ -218,9 +218,10 @@ static int pmt_copy_region(struct telemetry_region *re=
gion,
 			   struct intel_pmt_entry *entry)
 {
=20
+	struct pci_dev *pdev =3D to_pci_dev(entry->ep->dev);
 	struct oobmsm_plat_info *plat_info;
=20
-	plat_info =3D intel_vsec_get_mapping(entry->ep->pcidev);
+	plat_info =3D intel_vsec_get_mapping(pdev);
 	if (IS_ERR(plat_info))
 		return PTR_ERR(plat_info);
=20
@@ -308,7 +309,7 @@ int pmt_telem_read(struct telem_endpoint *ep, u32 id, u=
64 *data, u32 count)
 	if (offset + NUM_BYTES_QWORD(count) > size)
 		return -EINVAL;
=20
-	pmt_telem_read_mmio(ep->pcidev, ep->cb, ep->header.guid, data, ep->base, =
offset,
+	pmt_telem_read_mmio(ep->dev, ep->cb, ep->header.guid, data, ep->base, off=
set,
 			    NUM_BYTES_QWORD(count));
=20
 	return ep->present ? 0 : -EPIPE;
@@ -335,7 +336,7 @@ int pmt_telem_read32(struct telem_endpoint *ep, u32 id,=
 u32 *data, u32 count)
 EXPORT_SYMBOL_NS_GPL(pmt_telem_read32, "INTEL_PMT_TELEMETRY");
=20
 struct telem_endpoint *
-pmt_telem_find_and_register_endpoint(struct pci_dev *pcidev, u32 guid, u16=
 pos)
+pmt_telem_find_and_register_endpoint(struct device *dev, u32 guid, u16 pos)
 {
 	int devid =3D 0;
 	int inst =3D 0;
@@ -348,7 +349,7 @@ pmt_telem_find_and_register_endpoint(struct pci_dev *pc=
idev, u32 guid, u16 pos)
 		if (err)
 			return ERR_PTR(err);
=20
-		if (ep_info.header.guid =3D=3D guid && ep_info.pdev =3D=3D pcidev) {
+		if (ep_info.header.guid =3D=3D guid && ep_info.dev =3D=3D dev) {
 			if (inst =3D=3D pos)
 				return pmt_telem_register_endpoint(devid);
 			++inst;
diff --git a/drivers/platform/x86/intel/pmt/telemetry.h b/drivers/platform/=
x86/intel/pmt/telemetry.h
index d45af5512b4e..0f88c5e7d90e 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.h
+++ b/drivers/platform/x86/intel/pmt/telemetry.h
@@ -6,8 +6,8 @@
 #define PMT_TELEM_TELEMETRY	0
 #define PMT_TELEM_CRASHLOG	1
=20
+struct device;
 struct telem_endpoint;
-struct pci_dev;
=20
 struct telem_header {
 	u8	access_type;
@@ -17,7 +17,7 @@ struct telem_header {
 };
=20
 struct telem_endpoint_info {
-	struct pci_dev		*pdev;
+	struct device		*dev;
 	struct telem_header	header;
 };
=20
@@ -71,8 +71,8 @@ int pmt_telem_get_endpoint_info(int devid, struct telem_e=
ndpoint_info *info);
=20
 /**
  * pmt_telem_find_and_register_endpoint() - Get a telemetry endpoint from
- * pci_dev device, guid and pos
- * @pdev:   PCI device inside the Intel vsec
+ * device, guid and pos
+ * @dev:    device inside the Intel vsec
  * @guid:   GUID of the telemetry space
  * @pos:    Instance of the guid
  *
@@ -80,8 +80,8 @@ int pmt_telem_get_endpoint_info(int devid, struct telem_e=
ndpoint_info *info);
  * * endpoint    - On success returns pointer to the telemetry endpoint
  * * -ENXIO      - telemetry endpoint not found
  */
-struct telem_endpoint *pmt_telem_find_and_register_endpoint(struct pci_dev=
 *pcidev,
-				u32 guid, u16 pos);
+struct telem_endpoint *
+pmt_telem_find_and_register_endpoint(struct device *dev, u32 guid, u16 pos=
);
=20
 /**
  * pmt_telem_read() - Read qwords from counter sram using sample id
diff --git a/drivers/platform/x86/intel/sdsi.c b/drivers/platform/x86/intel=
/sdsi.c
index da75f53d0bcc..d7e37d4ace23 100644
--- a/drivers/platform/x86/intel/sdsi.c
+++ b/drivers/platform/x86/intel/sdsi.c
@@ -599,13 +599,14 @@ static int sdsi_get_layout(struct sdsi_priv *priv, st=
ruct disc_table *table)
 	return 0;
 }
=20
-static int sdsi_map_mbox_registers(struct sdsi_priv *priv, struct pci_dev =
*parent,
+static int sdsi_map_mbox_registers(struct sdsi_priv *priv, struct device *=
dev,
 				   struct disc_table *disc_table, struct resource *disc_res)
 {
 	u32 access_type =3D FIELD_GET(DT_ACCESS_TYPE, disc_table->access_info);
 	u32 size =3D FIELD_GET(DT_SIZE, disc_table->access_info);
 	u32 tbir =3D FIELD_GET(DT_TBIR, disc_table->offset);
 	u32 offset =3D DT_OFFSET(disc_table->offset);
+	struct pci_dev *parent =3D to_pci_dev(dev);
 	struct resource res =3D {};
=20
 	/* Starting location of SDSi MMIO region based on access type */
@@ -681,7 +682,7 @@ static int sdsi_probe(struct auxiliary_device *auxdev, =
const struct auxiliary_de
 		return ret;
=20
 	/* Map the SDSi mailbox registers */
-	ret =3D sdsi_map_mbox_registers(priv, intel_cap_dev->pcidev, &disc_table,=
 disc_res);
+	ret =3D sdsi_map_mbox_registers(priv, intel_cap_dev->dev, &disc_table, di=
sc_res);
 	if (ret)
 		return ret;
=20
diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 938648b9ef09..a547e4b98245 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -274,7 +274,7 @@ int intel_vsec_add_aux(struct device *parent,
 }
 EXPORT_SYMBOL_NS_GPL(intel_vsec_add_aux, "INTEL_VSEC");
=20
-static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_head=
er *header,
+static int intel_vsec_add_dev(struct device *dev, struct intel_vsec_header=
 *header,
 			      const struct intel_vsec_platform_info *info,
 			      unsigned long cap_id, u64 base_addr)
 {
@@ -288,18 +288,18 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, s=
truct intel_vsec_header *he
 	if (info->parent)
 		parent =3D info->parent;
 	else
-		parent =3D &pdev->dev;
+		parent =3D dev;
=20
 	if (!intel_vsec_supported(header->id, info->caps))
 		return -EINVAL;
=20
 	if (!header->num_entries) {
-		dev_dbg(&pdev->dev, "Invalid 0 entry count for header id %d\n", header->=
id);
+		dev_dbg(dev, "Invalid 0 entry count for header id %d\n", header->id);
 		return -EINVAL;
 	}
=20
 	if (!header->entry_size) {
-		dev_dbg(&pdev->dev, "Invalid 0 entry size for header id %d\n", header->i=
d);
+		dev_dbg(dev, "Invalid 0 entry size for header id %d\n", header->id);
 		return -EINVAL;
 	}
=20
@@ -331,7 +331,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, str=
uct intel_vsec_header *he
 		release_mem_region(tmp->start, resource_size(tmp));
 	}
=20
-	intel_vsec_dev->pcidev =3D pdev;
+	intel_vsec_dev->dev =3D dev;
 	intel_vsec_dev->resource =3D no_free_ptr(res);
 	intel_vsec_dev->num_resources =3D header->num_entries;
 	intel_vsec_dev->quirks =3D info->quirks;
@@ -409,13 +409,14 @@ static int get_cap_id(u32 header_id, unsigned long *c=
ap_id)
 	return 0;
 }
=20
-static int intel_vsec_register_device(struct pci_dev *pdev,
+static int intel_vsec_register_device(struct device *dev,
 				      struct intel_vsec_header *header,
 				      const struct intel_vsec_platform_info *info,
 				      u64 base_addr)
 {
 	const struct vsec_feature_dependency *consumer_deps;
 	struct vsec_priv *priv;
+	struct pci_dev *pdev;
 	unsigned long cap_id;
 	int ret;
=20
@@ -427,8 +428,12 @@ static int intel_vsec_register_device(struct pci_dev *=
pdev,
 	 * Only track dependencies for devices probed by the VSEC driver.
 	 * For others using the exported APIs, add the device directly.
 	 */
+	if (!dev_is_pci(dev))
+		return intel_vsec_add_dev(dev, header, info, cap_id, base_addr);
+
+	pdev =3D to_pci_dev(dev);
 	if (!pci_match_id(intel_vsec_pci_ids, pdev))
-		return intel_vsec_add_dev(pdev, header, info, cap_id, base_addr);
+		return intel_vsec_add_dev(dev, header, info, cap_id, base_addr);
=20
 	priv =3D pci_get_drvdata(pdev);
 	if (priv->state[cap_id] =3D=3D STATE_REGISTERED ||
@@ -444,7 +449,7 @@ static int intel_vsec_register_device(struct pci_dev *p=
dev,
=20
 	consumer_deps =3D get_consumer_dependencies(priv, cap_id);
 	if (!consumer_deps || suppliers_ready(priv, consumer_deps, cap_id)) {
-		ret =3D intel_vsec_add_dev(pdev, header, info, cap_id, base_addr);
+		ret =3D intel_vsec_add_dev(dev, header, info, cap_id, base_addr);
 		if (ret)
 			priv->state[cap_id] =3D STATE_SKIP;
 		else
@@ -456,7 +461,7 @@ static int intel_vsec_register_device(struct pci_dev *p=
dev,
 	return -EAGAIN;
 }
=20
-static bool intel_vsec_walk_header(struct pci_dev *pdev,
+static bool intel_vsec_walk_header(struct device *dev,
 				   const struct intel_vsec_platform_info *info)
 {
 	struct intel_vsec_header **header =3D info->headers;
@@ -464,7 +469,7 @@ static bool intel_vsec_walk_header(struct pci_dev *pdev,
 	int ret;
=20
 	for ( ; *header; header++) {
-		ret =3D intel_vsec_register_device(pdev, *header, info, info->base_addr);
+		ret =3D intel_vsec_register_device(dev, *header, info, info->base_addr);
 		if (!ret)
 			have_devices =3D true;
 	}
@@ -512,7 +517,7 @@ static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
 		pci_read_config_dword(pdev, pos + PCI_DVSEC_HEADER2, &hdr);
 		header.id =3D PCI_DVSEC_HEADER2_ID(hdr);
=20
-		ret =3D intel_vsec_register_device(pdev, &header, info,
+		ret =3D intel_vsec_register_device(&pdev->dev, &header, info,
 						 pci_resource_start(pdev, header.tbir));
 		if (ret)
 			continue;
@@ -558,7 +563,7 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
 		header.tbir =3D INTEL_DVSEC_TABLE_BAR(table);
 		header.offset =3D INTEL_DVSEC_TABLE_OFFSET(table);
=20
-		ret =3D intel_vsec_register_device(pdev, &header, info,
+		ret =3D intel_vsec_register_device(&pdev->dev, &header, info,
 						 pci_resource_start(pdev, header.tbir));
 		if (ret)
 			continue;
@@ -569,13 +574,13 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
 	return have_devices;
 }
=20
-int intel_vsec_register(struct pci_dev *pdev,
+int intel_vsec_register(struct device *dev,
 			const struct intel_vsec_platform_info *info)
 {
-	if (!pdev || !info || !info->headers)
+	if (!dev || !info || !info->headers)
 		return -EINVAL;
=20
-	if (!intel_vsec_walk_header(pdev, info))
+	if (!intel_vsec_walk_header(dev, info))
 		return -ENODEV;
 	else
 		return 0;
@@ -601,7 +606,7 @@ static bool intel_vsec_get_features(struct pci_dev *pde=
v,
 		found =3D true;
=20
 	if (info && (info->quirks & VSEC_QUIRK_NO_DVSEC) &&
-	    intel_vsec_walk_header(pdev, info))
+	    intel_vsec_walk_header(&pdev->dev, info))
 		found =3D true;
=20
 	return found;
@@ -673,7 +678,10 @@ int intel_vsec_set_mapping(struct oobmsm_plat_info *pl=
at_info,
 {
 	struct vsec_priv *priv;
=20
-	priv =3D pci_get_drvdata(vsec_dev->pcidev);
+	if (!dev_is_pci(vsec_dev->dev))
+		return -ENODEV;
+
+	priv =3D pci_get_drvdata(to_pci_dev(vsec_dev->dev));
 	if (!priv)
 		return -EINVAL;
=20
@@ -821,7 +829,7 @@ static pci_ers_result_t intel_vsec_pci_slot_reset(struc=
t pci_dev *pdev)
=20
 	xa_for_each(&auxdev_array, index, intel_vsec_dev) {
 		/* check if pdev doesn't match */
-		if (pdev !=3D intel_vsec_dev->pcidev)
+		if (&pdev->dev !=3D intel_vsec_dev->dev)
 			continue;
 		devm_release_action(&pdev->dev, intel_vsec_remove_aux,
 				    &intel_vsec_dev->auxdev);
diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/=
intel/vsec_tpmi.c
index e08af071fe87..259addf664e8 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -530,7 +530,7 @@ static const struct file_operations mem_write_ops =3D {
 	.release        =3D single_release,
 };
=20
-#define tpmi_to_dev(info)	(&info->vsec_dev->pcidev->dev)
+#define tpmi_to_dev(info)	((info)->vsec_dev->dev)
=20
 static void tpmi_dbgfs_register(struct intel_tpmi_info *tpmi_info)
 {
@@ -642,7 +642,7 @@ static int tpmi_create_device(struct intel_tpmi_info *t=
pmi_info,
 		tmp->flags =3D IORESOURCE_MEM;
 	}
=20
-	feature_vsec_dev->pcidev =3D vsec_dev->pcidev;
+	feature_vsec_dev->dev =3D vsec_dev->dev;
 	feature_vsec_dev->resource =3D res;
 	feature_vsec_dev->num_resources =3D pfs->pfs_header.num_entries;
 	feature_vsec_dev->priv_data =3D &tpmi_info->plat_info;
@@ -655,8 +655,8 @@ static int tpmi_create_device(struct intel_tpmi_info *t=
pmi_info,
 	 * feature_vsec_dev and res memory are also freed as part of
 	 * device deletion.
 	 */
-	return intel_vsec_add_aux(&vsec_dev->pcidev->dev,
-				  feature_vsec_dev, feature_id_name);
+	return intel_vsec_add_aux(vsec_dev->dev, feature_vsec_dev,
+				  feature_id_name);
 }
=20
 static int tpmi_create_devices(struct intel_tpmi_info *tpmi_info)
@@ -742,7 +742,7 @@ static int tpmi_fetch_pfs_header(struct intel_tpmi_pm_f=
eature *pfs, u64 start, i
 static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
 {
 	struct intel_vsec_device *vsec_dev =3D auxdev_to_ivdev(auxdev);
-	struct pci_dev *pci_dev =3D vsec_dev->pcidev;
+	struct pci_dev *pci_dev =3D to_pci_dev(vsec_dev->dev);
 	struct intel_tpmi_info *tpmi_info;
 	u64 pfs_start =3D 0;
 	int ret, i;
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 49a746ec0128..4eecb2a6bac4 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -29,6 +29,7 @@
 #define INTEL_DVSEC_TABLE_OFFSET(x)	((x) & GENMASK(31, 3))
 #define TABLE_OFFSET_SHIFT		3
=20
+struct device;
 struct pci_dev;
 struct resource;
=20
@@ -82,14 +83,14 @@ enum intel_vsec_quirks {
  * struct pmt_callbacks - Callback infrastructure for PMT devices
  * @read_telem: when specified, called by client driver to access PMT
  * data (instead of direct copy).
- * * pdev:  PCI device reference for the callback's use
+ * * dev:   device reference for the callback's use
  * * guid:  ID of data to acccss
  * * data:  buffer for the data to be copied
  * * off:   offset into the requested buffer
  * * count: size of buffer
  */
 struct pmt_callbacks {
-	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t off, =
u32 count);
+	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u3=
2 count);
 };
=20
 struct vsec_feature_dependency {
@@ -122,7 +123,7 @@ struct intel_vsec_platform_info {
 /**
  * struct intel_vsec_device - Auxbus specific device information
  * @auxdev:        auxbus device struct for auxbus access
- * @pcidev:        pci device associated with the device
+ * @dev:           struct device associated with the device
  * @resource:      any resources shared by the parent
  * @ida:           id reference
  * @num_resources: number of resources
@@ -135,7 +136,7 @@ struct intel_vsec_platform_info {
  */
 struct intel_vsec_device {
 	struct auxiliary_device auxdev;
-	struct pci_dev *pcidev;
+	struct device *dev;
 	struct resource *resource;
 	struct ida *ida;
 	int num_resources;
@@ -199,13 +200,13 @@ static inline struct intel_vsec_device *auxdev_to_ivd=
ev(struct auxiliary_device
 }
=20
 #if IS_ENABLED(CONFIG_INTEL_VSEC)
-int intel_vsec_register(struct pci_dev *pdev,
+int intel_vsec_register(struct device *dev,
 			const struct intel_vsec_platform_info *info);
 int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
 			   struct intel_vsec_device *vsec_dev);
 struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pdev);
 #else
-static inline int intel_vsec_register(struct pci_dev *pdev,
+static inline int intel_vsec_register(struct device *dev,
 				      const struct intel_vsec_platform_info *info)
 {
 	return -ENODEV;
--=20
2.43.0

