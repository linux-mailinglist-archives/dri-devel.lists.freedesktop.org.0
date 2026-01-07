Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E97CFB725
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 01:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8531A10E55B;
	Wed,  7 Jan 2026 00:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2sjWwAh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424AD10E249;
 Wed,  7 Jan 2026 00:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767745330; x=1799281330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ODz8vQM06hZpoUx5eKexuLW904bBK0VE0zDOrwdA9y8=;
 b=f2sjWwAhgR2Q3n4tL70h0dsa6ZW6KHmiMBdHBawXAtfn8/2O0zzIQ3RZ
 kmjc6y+qRxo4y++Jih1dLEih2nJ477D/rqztY3DKVj/5r+Rqj0NtZrVqK
 5su6MaZmPr6VDYd8TL2Q9MpMZLQHgA54smCuNJnlqjPhiXWcCsMUlEbe6
 FltH8lRYWGagfmFM9MQYvNe6zQHAjky2RzyZCRb7KJnuDNEaV5fFy8Dfn
 fTMxFv+mHmGvpLP+3bY/77iw0vtPKoRlaLdDRQsWlB5SJBj+98EeW+ZKG
 e5SwB9E0JcwgfOKdge2B8CoJAEPZ6pUxtx62P4WrOl1iiVfHRWaEj+CU7 Q==;
X-CSE-ConnectionGUID: 5UZrbKeSQ9qvyjDMce19Rg==
X-CSE-MsgGUID: 8AzHa4HZSCyx7hhuBSiNdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69164109"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="69164109"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 16:22:09 -0800
X-CSE-ConnectionGUID: oBG1V4ZQTdGsPP/XPPj7pg==
X-CSE-MsgGUID: QdFPWMbtRxOYVL8C6Jajcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="206931519"
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
Subject: [PATCH 1/4] platform/x86/intel/vsec: Decouple add/link helpers from
 PCI
Date: Tue,  6 Jan 2026 16:21:48 -0800
Message-ID: <20260107002153.63830-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107002153.63830-1-david.e.box@linux.intel.com>
References: <20260107002153.63830-1-david.e.box@linux.intel.com>
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

This refactor is preparatory for ACPI-enumerated PMT endpoints. While
intel_vsec is bound to PCI today, some helpers are used by code that will
also register PMT endpoints from non-PCI (ACPI) paths. Clean up
PCI-specific plumbing where it isn=E2=80=99t strictly required and rely on
generic struct device where possible.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c      | 13 +++++++++----
 drivers/platform/x86/intel/vsec_tpmi.c |  2 +-
 include/linux/intel_vsec.h             |  2 +-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index ecfc7703f201..130577061a51 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -158,18 +158,23 @@ static bool vsec_driver_present(int cap_id)
  */
 static const struct pci_device_id intel_vsec_pci_ids[];
=20
-static int intel_vsec_link_devices(struct pci_dev *pdev, struct device *de=
v,
+static int intel_vsec_link_devices(struct device *parent, struct device *d=
ev,
 				   int consumer_id)
 {
 	const struct vsec_feature_dependency *deps;
 	enum vsec_device_state *state;
 	struct device **suppliers;
 	struct vsec_priv *priv;
+	struct pci_dev *pdev;
 	int supplier_id;
=20
 	if (!consumer_id)
 		return 0;
=20
+	if (!dev_is_pci(parent))
+		return 0;
+
+	pdev =3D to_pci_dev(parent);
 	if (!pci_match_id(intel_vsec_pci_ids, pdev))
 		return 0;
=20
@@ -204,7 +209,7 @@ static int intel_vsec_link_devices(struct pci_dev *pdev=
, struct device *dev,
 	return 0;
 }
=20
-int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
+int intel_vsec_add_aux(struct device *parent,
 		       struct intel_vsec_device *intel_vsec_dev,
 		       const char *name)
 {
@@ -252,7 +257,7 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct dev=
ice *parent,
 	if (ret)
 		goto cleanup_aux;
=20
-	ret =3D intel_vsec_link_devices(pdev, &auxdev->dev, intel_vsec_dev->cap_i=
d);
+	ret =3D intel_vsec_link_devices(parent, &auxdev->dev, intel_vsec_dev->cap=
_id);
 	if (ret)
 		goto cleanup_aux;
=20
@@ -349,7 +354,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, str=
uct intel_vsec_header *he
 	 * Pass the ownership of intel_vsec_dev and resource within it to
 	 * intel_vsec_add_aux()
 	 */
-	return intel_vsec_add_aux(pdev, parent, no_free_ptr(intel_vsec_dev),
+	return intel_vsec_add_aux(parent, no_free_ptr(intel_vsec_dev),
 				  intel_vsec_name(header->id));
 }
=20
diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/=
intel/vsec_tpmi.c
index 7748b5557a18..2ccde86c529f 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -655,7 +655,7 @@ static int tpmi_create_device(struct intel_tpmi_info *t=
pmi_info,
 	 * feature_vsec_dev and res memory are also freed as part of
 	 * device deletion.
 	 */
-	return intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev->auxdev.dev,
+	return intel_vsec_add_aux(&vsec_dev->auxdev.dev,
 				  feature_vsec_dev, feature_id_name);
 }
=20
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 53f6fe88e369..28c2f5855a11 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -183,7 +183,7 @@ struct pmt_feature_group {
 	struct telemetry_region	regions[];
 };
=20
-int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
+int intel_vsec_add_aux(struct device *parent,
 		       struct intel_vsec_device *intel_vsec_dev,
 		       const char *name);
=20
--=20
2.43.0

