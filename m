Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F597CFB728
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 01:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798C410E55C;
	Wed,  7 Jan 2026 00:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TABZZKGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661D010E1EE;
 Wed,  7 Jan 2026 00:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767745330; x=1799281330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7S7c3pZN/iTzPROnYIDCYdk2TAauovgGMY7LtD8OslI=;
 b=TABZZKGqZoa0FGxGbA2+tsibL8MlCoQY5pTb8TIVKNXJBTXzTqC9TvuX
 Dopwh/YiolV26h+IGR4eAI9YGENxEHxfH3vlPqbQVEXkbR3bQgx86UH5V
 lZF81Sy/dNoMlQcbm2kL5afvxMK9CzboK14awovRLlfX1vAsOePtZcNXx
 3FzRHORMXKxxU3azYqZm4/sJDyTgPtps2IhhQK0LQYwkqv+tcM3rotU3A
 0QAN/wOS/SNb8xGFt4jawULIrUB/76ffgUUHtb5fmhajJLsY42045SPqU
 13z9MqZH8T5NQFxRHu2pCUbkOL+18DFe4IKp8QDzaj4B378L1tdC5qVtO Q==;
X-CSE-ConnectionGUID: N0GF0pmNQg6h4fehDswT2g==
X-CSE-MsgGUID: hxkOq+JXTu2ZrHBo/PHTZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69164102"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="69164102"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 16:22:09 -0800
X-CSE-ConnectionGUID: eIEwkaKwRhCotaqLkXwtfA==
X-CSE-MsgGUID: jpn5RhaLS/i2kPgyQcTbHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="206931522"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 16:22:08 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 irenic.rajneesh@gmail.com, ilpo.jarvinen@linux.intel.com,
 srinivas.pandruvada@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xi.pardee@linux.intel.comn
Cc: "David E. Box" <david.e.box@linux.intel.com>, hansg@kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/4] platform/x86/intel/vsec: Switch exported helpers from
 pci_dev to device
Date: Tue,  6 Jan 2026 16:21:49 -0800
Message-ID: <20260107002153.63830-3-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107002153.63830-1-david.e.box@linux.intel.com>
References: <20260107002153.63830-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
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

Preparatory refactor for ACPI-enumerated PMT endpoints. Several exported
PMT/VSEC interfaces and structs carried struct pci_dev * even though
callers only need a generic struct device. Move those to struct device * so
the same APIs work for PCI and ACPI parents.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c               |  2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                 |  2 +-
 drivers/gpu/drm/xe/xe_vsec.c                  |  7 +-
 drivers/gpu/drm/xe/xe_vsec.h                  |  2 +-
 drivers/platform/x86/intel/pmc/core.c         |  4 +-
 .../platform/x86/intel/pmc/ssram_telemetry.c  |  2 +-
 drivers/platform/x86/intel/pmt/class.c        |  8 +-
 drivers/platform/x86/intel/pmt/class.h        |  4 +-
 drivers/platform/x86/intel/pmt/discovery.c    |  4 +-
 drivers/platform/x86/intel/pmt/telemetry.c    | 13 ++--
 drivers/platform/x86/intel/pmt/telemetry.h    | 11 ++-
 drivers/platform/x86/intel/sdsi.c             |  5 +-
 drivers/platform/x86/intel/vsec.c             | 74 +++++++++++--------
 drivers/platform/x86/intel/vsec_tpmi.c        |  6 +-
 include/linux/intel_vsec.h                    | 18 ++---
 15 files changed, 86 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugf=
s.c
index e91da9589c5f..d07b2aad300f 100644
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
index 97879daeefc1..556072a0ac10 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -464,7 +464,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel=
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
index 8f23a27871b6..997fe0c8858e 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -141,10 +141,10 @@ static int xe_guid_decode(u32 guid, int *index, u32 *=
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
@@ -197,7 +197,6 @@ void xe_vsec_init(struct xe_device *xe)
 {
 	struct intel_vsec_platform_info *info;
 	struct device *dev =3D xe->drm.dev;
-	struct pci_dev *pdev =3D to_pci_dev(dev);
 	enum xe_vsec platform;
=20
 	platform =3D get_platform_info(xe);
@@ -220,6 +219,6 @@ void xe_vsec_init(struct xe_device *xe)
 	 * Register a VSEC. Cleanup is handled using device managed
 	 * resources.
 	 */
-	intel_vsec_register(pdev, info);
+	intel_vsec_register(dev, info);
 }
 MODULE_IMPORT_NS("INTEL_VSEC");
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
index dabfb4e02d70..74ac575cd68c 100644
--- a/drivers/gpu/drm/xe/xe_vsec.h
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -10,6 +10,6 @@ struct pci_dev;
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
index 7d7ae8a40b0e..4abe5e1f574d 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1288,7 +1288,7 @@ static struct telem_endpoint *pmc_core_register_endpo=
int(struct pci_dev *pcidev,
 	unsigned int i;
=20
 	for (i =3D 0; guids[i]; i++) {
-		ep =3D pmt_telem_find_and_register_endpoint(pcidev, guids[i], 0);
+		ep =3D pmt_telem_find_and_register_endpoint(&pcidev->dev, guids[i], 0);
 		if (!IS_ERR(ep))
 			return ep;
 	}
@@ -1573,7 +1573,7 @@ static int pmc_core_get_telem_info(struct pmc_dev *pm=
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
index 7c3023d5d91d..8077274726b5 100644
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
index 3c5ad5f52bca..3eb8ab97dd87 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -23,7 +23,7 @@ struct pci_dev;
 extern struct class intel_pmt_class;
=20
 struct telem_endpoint {
-	struct pci_dev		*pcidev;
+	struct device		*dev;
 	struct telem_header	header;
 	struct pmt_callbacks	*cb;
 	void __iomem		*base;
@@ -65,7 +65,7 @@ struct intel_pmt_namespace {
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
index 32713a194a55..66f1ae931e05 100644
--- a/drivers/platform/x86/intel/pmt/discovery.c
+++ b/drivers/platform/x86/intel/pmt/discovery.c
@@ -540,7 +540,7 @@ static int pmt_features_probe(struct auxiliary_device *=
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
@@ -607,7 +607,7 @@ void intel_pmt_get_features(struct intel_pmt_entry *ent=
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
index a4dfca6cac19..e11f7bde41b2 100644
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
index d45af5512b4e..a4fa2178adef 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.h
+++ b/drivers/platform/x86/intel/pmt/telemetry.h
@@ -7,7 +7,6 @@
 #define PMT_TELEM_CRASHLOG	1
=20
 struct telem_endpoint;
-struct pci_dev;
=20
 struct telem_header {
 	u8	access_type;
@@ -17,7 +16,7 @@ struct telem_header {
 };
=20
 struct telem_endpoint_info {
-	struct pci_dev		*pdev;
+	struct device		*dev;
 	struct telem_header	header;
 };
=20
@@ -71,8 +70,8 @@ int pmt_telem_get_endpoint_info(int devid, struct telem_e=
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
@@ -80,8 +79,8 @@ int pmt_telem_get_endpoint_info(int devid, struct telem_e=
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
index 130577061a51..b84bb92624ef 100644
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
 			      struct intel_vsec_platform_info *info,
 			      unsigned long cap_id)
 {
@@ -283,24 +283,24 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, s=
truct intel_vsec_header *he
 	struct resource *tmp;
 	struct device *parent;
 	unsigned long quirks =3D info->quirks;
-	u64 base_addr;
+	u64 base_addr =3D info->base_addr;
 	int i;
=20
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
@@ -315,11 +315,6 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, st=
ruct intel_vsec_header *he
 	if (quirks & VSEC_QUIRK_TABLE_SHIFT)
 		header->offset >>=3D TABLE_OFFSET_SHIFT;
=20
-	if (info->base_addr)
-		base_addr =3D info->base_addr;
-	else
-		base_addr =3D pdev->resource[header->tbir].start;
-
 	/*
 	 * The DVSEC/VSEC contains the starting offset and count for a block of
 	 * discovery tables. Create a resource array of these tables to the
@@ -337,7 +332,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, str=
uct intel_vsec_header *he
 		release_mem_region(tmp->start, resource_size(tmp));
 	}
=20
-	intel_vsec_dev->pcidev =3D pdev;
+	intel_vsec_dev->dev =3D dev;
 	intel_vsec_dev->resource =3D no_free_ptr(res);
 	intel_vsec_dev->num_resources =3D header->num_entries;
 	intel_vsec_dev->quirks =3D info->quirks;
@@ -415,12 +410,13 @@ static int get_cap_id(u32 header_id, unsigned long *c=
ap_id)
 	return 0;
 }
=20
-static int intel_vsec_register_device(struct pci_dev *pdev,
+static int intel_vsec_register_device(struct device *dev,
 				      struct intel_vsec_header *header,
 				      struct intel_vsec_platform_info *info)
 {
 	const struct vsec_feature_dependency *consumer_deps;
 	struct vsec_priv *priv;
+	struct pci_dev *pdev;
 	unsigned long cap_id;
 	int ret;
=20
@@ -432,8 +428,12 @@ static int intel_vsec_register_device(struct pci_dev *=
pdev,
 	 * Only track dependencies for devices probed by the VSEC driver.
 	 * For others using the exported APIs, add the device directly.
 	 */
+	if (!dev_is_pci(dev))
+		return intel_vsec_add_dev(dev, header, info, cap_id);
+
+	pdev =3D to_pci_dev(dev);
 	if (!pci_match_id(intel_vsec_pci_ids, pdev))
-		return intel_vsec_add_dev(pdev, header, info, cap_id);
+		return intel_vsec_add_dev(dev, header, info, cap_id);
=20
 	priv =3D pci_get_drvdata(pdev);
 	if (priv->state[cap_id] =3D=3D STATE_REGISTERED ||
@@ -449,7 +449,7 @@ static int intel_vsec_register_device(struct pci_dev *p=
dev,
=20
 	consumer_deps =3D get_consumer_dependencies(priv, cap_id);
 	if (!consumer_deps || suppliers_ready(priv, consumer_deps, cap_id)) {
-		ret =3D intel_vsec_add_dev(pdev, header, info, cap_id);
+		ret =3D intel_vsec_add_dev(dev, header, info, cap_id);
 		if (ret)
 			priv->state[cap_id] =3D STATE_SKIP;
 		else
@@ -461,7 +461,7 @@ static int intel_vsec_register_device(struct pci_dev *p=
dev,
 	return -EAGAIN;
 }
=20
-static bool intel_vsec_walk_header(struct pci_dev *pdev,
+static bool intel_vsec_walk_header(struct device *dev,
 				   struct intel_vsec_platform_info *info)
 {
 	struct intel_vsec_header **header =3D info->headers;
@@ -469,7 +469,7 @@ static bool intel_vsec_walk_header(struct pci_dev *pdev,
 	int ret;
=20
 	for ( ; *header; header++) {
-		ret =3D intel_vsec_register_device(pdev, *header, info);
+		ret =3D intel_vsec_register_device(dev, *header, info);
 		if (!ret)
 			have_devices =3D true;
 	}
@@ -517,7 +517,9 @@ static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
 		pci_read_config_dword(pdev, pos + PCI_DVSEC_HEADER2, &hdr);
 		header.id =3D PCI_DVSEC_HEADER2_ID(hdr);
=20
-		ret =3D intel_vsec_register_device(pdev, &header, info);
+		info->base_addr =3D pdev->resource[header.tbir].start;
+
+		ret =3D intel_vsec_register_device(&pdev->dev, &header, info);
 		if (ret)
 			continue;
=20
@@ -562,7 +564,9 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
 		header.tbir =3D INTEL_DVSEC_TABLE_BAR(table);
 		header.offset =3D INTEL_DVSEC_TABLE_OFFSET(table);
=20
-		ret =3D intel_vsec_register_device(pdev, &header, info);
+		info->base_addr =3D pdev->resource[header.tbir].start;
+
+		ret =3D intel_vsec_register_device(&pdev->dev, &header, info);
 		if (ret)
 			continue;
=20
@@ -572,13 +576,13 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
 	return have_devices;
 }
=20
-int intel_vsec_register(struct pci_dev *pdev,
-			 struct intel_vsec_platform_info *info)
+int intel_vsec_register(struct device *dev,
+			struct intel_vsec_platform_info *info)
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
@@ -604,7 +608,7 @@ static bool intel_vsec_get_features(struct pci_dev *pde=
v,
 		found =3D true;
=20
 	if (info && (info->quirks & VSEC_QUIRK_NO_DVSEC) &&
-	    intel_vsec_walk_header(pdev, info))
+	    intel_vsec_walk_header(&pdev->dev, info))
 		found =3D true;
=20
 	return found;
@@ -630,7 +634,7 @@ static void intel_vsec_skip_missing_dependencies(struct=
 pci_dev *pdev)
=20
 static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_dev=
ice_id *id)
 {
-	struct intel_vsec_platform_info *info;
+	struct intel_vsec_platform_info info, *info_temp;
 	struct vsec_priv *priv;
 	int num_caps, ret;
 	int run_once =3D 0;
@@ -641,22 +645,25 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev,=
 const struct pci_device_id
 		return ret;
=20
 	pci_save_state(pdev);
-	info =3D (struct intel_vsec_platform_info *)id->driver_data;
-	if (!info)
+	info_temp =3D (struct intel_vsec_platform_info *)id->driver_data;
+	if (!info_temp)
 		return -EINVAL;
=20
+	/* XXX: Needs better fix */
+	info =3D *info_temp;
+
 	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
=20
-	priv->info =3D info;
+	priv->info =3D &info;
 	pci_set_drvdata(pdev, priv);
=20
-	num_caps =3D hweight_long(info->caps);
+	num_caps =3D hweight_long(info.caps);
 	while (num_caps--) {
-		found_any |=3D intel_vsec_get_features(pdev, info);
+		found_any |=3D intel_vsec_get_features(pdev, &info);
=20
-		if (priv->found_caps =3D=3D info->caps)
+		if (priv->found_caps =3D=3D info.caps)
 			break;
=20
 		if (!run_once) {
@@ -676,7 +683,10 @@ int intel_vsec_set_mapping(struct oobmsm_plat_info *pl=
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
@@ -822,7 +832,7 @@ static pci_ers_result_t intel_vsec_pci_slot_reset(struc=
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
index 2ccde86c529f..254273392639 100644
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
index 28c2f5855a11..931ff42361a9 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -29,8 +29,8 @@
 #define INTEL_DVSEC_TABLE_OFFSET(x)	((x) & GENMASK(31, 3))
 #define TABLE_OFFSET_SHIFT		3
=20
-struct pci_dev;
 struct resource;
+struct pci_dev;
=20
 enum intel_vsec_id {
 	VSEC_ID_TELEMETRY	=3D 2,
@@ -82,14 +82,14 @@ enum intel_vsec_quirks {
  * struct pmt_callbacks - Callback infrastructure for PMT devices
  * ->read_telem() when specified, called by client driver to access PMT da=
ta (instead
  * of direct copy).
- * @pdev:  PCI device reference for the callback's use
+ * @dev:   device reference for the callback's use
  * @guid:  ID of data to acccss
  * @data:  buffer for the data to be copied
  * @off:   offset into the requested buffer
  * @count: size of buffer
  */
 struct pmt_callbacks {
-	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t off, =
u32 count);
+	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u3=
2 count);
 };
=20
 struct vsec_feature_dependency {
@@ -122,7 +122,7 @@ struct intel_vsec_platform_info {
 /**
  * struct intel_sec_device - Auxbus specific device information
  * @auxdev:        auxbus device struct for auxbus access
- * @pcidev:        pci device associated with the device
+ * @dev:           struct device associated with the device
  * @resource:      any resources shared by the parent
  * @ida:           id reference
  * @num_resources: number of resources
@@ -134,7 +134,7 @@ struct intel_vsec_platform_info {
  */
 struct intel_vsec_device {
 	struct auxiliary_device auxdev;
-	struct pci_dev *pcidev;
+	struct device *dev;
 	struct resource *resource;
 	struct ida *ida;
 	int num_resources;
@@ -198,14 +198,14 @@ static inline struct intel_vsec_device *auxdev_to_ivd=
ev(struct auxiliary_device
 }
=20
 #if IS_ENABLED(CONFIG_INTEL_VSEC)
-int intel_vsec_register(struct pci_dev *pdev,
-			 struct intel_vsec_platform_info *info);
+int intel_vsec_register(struct device *dev,
+			struct intel_vsec_platform_info *info);
 int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
 			   struct intel_vsec_device *vsec_dev);
 struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pdev);
 #else
-static inline int intel_vsec_register(struct pci_dev *pdev,
-				       struct intel_vsec_platform_info *info)
+static inline int intel_vsec_register(struct device *dev,
+				      struct intel_vsec_platform_info *info)
 {
 	return -ENODEV;
 }
--=20
2.43.0

