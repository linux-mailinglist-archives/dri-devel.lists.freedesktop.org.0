Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH5BEmpVnmnyUgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 02:50:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEF319000F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 02:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7025910E684;
	Wed, 25 Feb 2026 01:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wdd9ntbp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A4210E676;
 Wed, 25 Feb 2026 01:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771984223; x=1803520223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zkr/TNpT38rWj6NCsWdUY9VzNU4dK69T3qZk3voE1CI=;
 b=Wdd9ntbp4hagoa82dMILdPljBfLaXIoq/wt2k7rUNdwPf3IfpmtzKIqC
 LxrQ5F5VEsxEdWESaCmUmXMcMNFzi6AoAYVrfsIQM6uD/8CoJB7Y35w/w
 Z6+hOThI5zDkDXf0MBYvzYmshAOLPGq35huAe6xEbipPNH9H5uMR2P3ds
 1y21/EK9m2QW/YerY1/fie5Ft124BtQUtHoEGAd+Tagj5pHzD64Uj/SyS
 MxNxLXmTTCrCNf5mIfOJ+beW2RaHmYBQNMhz2vqKSSQJsLN0f17q1tzPV
 DykO3C9KTNGlMDrd9VMTAu26Ry5go+tCSL6DjOTGyFirAluq1NqmGjlxa g==;
X-CSE-ConnectionGUID: 7QqZXpbGSN2iJbpFQqG+aQ==
X-CSE-MsgGUID: HaMAqKgLShKX0pVs6NlkwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76622908"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="76622908"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 17:50:21 -0800
X-CSE-ConnectionGUID: zaID+INzR7CS5/Kyodsynw==
X-CSE-MsgGUID: Br46YNjtRZipy3hkTnuMSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="216096180"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 17:50:20 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 irenic.rajneesh@gmail.com, ilpo.jarvinen@linux.intel.com,
 srinivas.pandruvada@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xi.pardee@linux.intel.com
Cc: david.e.box@linux.intel.com, hansg@kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 3/6] platform/x86/intel/vsec: Decouple add/link helpers
 from PCI
Date: Tue, 24 Feb 2026 17:50:09 -0800
Message-ID: <20260224-upstream-pmt-acpi-v5-v5-3-8dd73bcf049c@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224-upstream-pmt-acpi-v5-v5-0-8dd73bcf049c@linux.intel.com>
References: <20260224-upstream-pmt-acpi-v5-v5-0-8dd73bcf049c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,gmail.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david.e.box@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: EDEF319000F
X-Rspamd-Action: no action

This refactor is prepares for adding ACPI-enumerated PMT endpoints. While
intel_vsec is bound to PCI today, some helpers are used by code that will
also register PMT endpoints from non-PCI (ACPI) paths. Clean up
PCI-specific plumbing where it isn=E2=80=99t strictly required and rely on
generic struct device where possible.

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
Changes in v5:
- No change

Changes in v4:
- No change

Changes in v3:
- No change

Changes in v2:
- No chnage (previous patch 1)

 drivers/platform/x86/intel/vsec.c      | 13 +++++++++----
 drivers/platform/x86/intel/vsec_tpmi.c |  2 +-
 include/linux/intel_vsec.h             |  2 +-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index e0096be605d9..938648b9ef09 100644
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
@@ -343,7 +348,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, str=
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
index 98846e88d3d0..e08af071fe87 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -655,7 +655,7 @@ static int tpmi_create_device(struct intel_tpmi_info *t=
pmi_info,
 	 * feature_vsec_dev and res memory are also freed as part of
 	 * device deletion.
 	 */
-	return intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev->auxdev.dev,
+	return intel_vsec_add_aux(&vsec_dev->pcidev->dev,
 				  feature_vsec_dev, feature_id_name);
 }
=20
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index d551174b0049..49a746ec0128 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -184,7 +184,7 @@ struct pmt_feature_group {
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
