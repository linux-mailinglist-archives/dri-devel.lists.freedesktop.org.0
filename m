Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHdcLynicmkyrAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 03:51:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C1D6FD04
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 03:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4B310EA93;
	Fri, 23 Jan 2026 02:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cly84nfw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A26310EA70;
 Fri, 23 Jan 2026 02:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769136677; x=1800672677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R+PMaHvJ4BzDcIX1OQkqshVDVNSPzh3ZCUGdJTP+GN8=;
 b=cly84nfwXJ/92fK9b6EQyddKE8KvlK5seQd8LbN5v7JcX5iGRQNspeMU
 qEbwup8FsmIbtnj3ZY/eI5W7V2zzeyqKAZG70g01T/CW1BQSqNZUwYIrb
 y7/wftmH0jvYgCZwHbvWOykxjiOxBiU3styut6xTIXgb1LhVFxevTwfNX
 agI64rjpYxIELY6XffYkaXsXC+QW55MMInQvNi9qc7X06oFsm4U2XiGZ/
 gaz5diyKIY82cql6LUVZtcGqGEnVSCGnpSqOm5vPNfDyNFl/AXGgzEp8k
 nrZs1h5rb663IubRVT06DuY7WJhURNJ7Bf6xs1nccona7VUnqYJYXRMZn g==;
X-CSE-ConnectionGUID: IFbEwtm+SpClMkPzCtpcOQ==
X-CSE-MsgGUID: Iidpi/lxTG+4ZWRSt8VSCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81016452"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="81016452"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 18:51:17 -0800
X-CSE-ConnectionGUID: 4jLgXdA1Q1OEWj2p7R//UQ==
X-CSE-MsgGUID: LXeN4vcjRAyHRaGwhIig+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="211773089"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 18:51:16 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 irenic.rajneesh@gmail.com, ilpo.jarvinen@linux.intel.com,
 srinivas.pandruvada@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xi.pardee@linux.intel.com
Cc: "David E. Box" <david.e.box@linux.intel.com>, hansg@kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 1/6] platform/x86/intel/vsec: Refactor base_addr handling
Date: Thu, 22 Jan 2026 18:51:02 -0800
Message-ID: <20260123025108.3772255-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123025108.3772255-1-david.e.box@linux.intel.com>
References: <20260123025108.3772255-1-david.e.box@linux.intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,gmail.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david.e.box@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 25C1D6FD04
X-Rspamd-Action: no action

The base_addr field in intel_vsec_platform_info was originally added to
support devices that emulate PCI VSEC capabilities in MMIO. Previously,
the code would check at registration time whether base_addr was set,
falling back to the PCI BAR if not.

Refactor this by making base_addr an explicit function parameter. This
clarifies ownership of the value and removes conditional logic from
intel_vsec_add_dev(). It also enables making intel_vsec_platform_info
const in a later patch, since the function no longer needs to write to
info->base_addr.

No functional change intended.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
v4:
  - No change

v3:
  - No change

v2:
  - Use pci_resource_start() macro instead of direct pdev->resource array a=
ccess
    (suggested by Ilpo)
 drivers/platform/x86/intel/vsec.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index ecfc7703f201..a10e2c65205c 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -271,14 +271,13 @@ EXPORT_SYMBOL_NS_GPL(intel_vsec_add_aux, "INTEL_VSEC"=
);
=20
 static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_head=
er *header,
 			      struct intel_vsec_platform_info *info,
-			      unsigned long cap_id)
+			      unsigned long cap_id, u64 base_addr)
 {
 	struct intel_vsec_device __free(kfree) *intel_vsec_dev =3D NULL;
 	struct resource __free(kfree) *res =3D NULL;
 	struct resource *tmp;
 	struct device *parent;
 	unsigned long quirks =3D info->quirks;
-	u64 base_addr;
 	int i;
=20
 	if (info->parent)
@@ -310,11 +309,6 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, st=
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
@@ -412,7 +406,8 @@ static int get_cap_id(u32 header_id, unsigned long *cap=
_id)
=20
 static int intel_vsec_register_device(struct pci_dev *pdev,
 				      struct intel_vsec_header *header,
-				      struct intel_vsec_platform_info *info)
+				      struct intel_vsec_platform_info *info,
+				      u64 base_addr)
 {
 	const struct vsec_feature_dependency *consumer_deps;
 	struct vsec_priv *priv;
@@ -428,7 +423,7 @@ static int intel_vsec_register_device(struct pci_dev *p=
dev,
 	 * For others using the exported APIs, add the device directly.
 	 */
 	if (!pci_match_id(intel_vsec_pci_ids, pdev))
-		return intel_vsec_add_dev(pdev, header, info, cap_id);
+		return intel_vsec_add_dev(pdev, header, info, cap_id, base_addr);
=20
 	priv =3D pci_get_drvdata(pdev);
 	if (priv->state[cap_id] =3D=3D STATE_REGISTERED ||
@@ -444,7 +439,7 @@ static int intel_vsec_register_device(struct pci_dev *p=
dev,
=20
 	consumer_deps =3D get_consumer_dependencies(priv, cap_id);
 	if (!consumer_deps || suppliers_ready(priv, consumer_deps, cap_id)) {
-		ret =3D intel_vsec_add_dev(pdev, header, info, cap_id);
+		ret =3D intel_vsec_add_dev(pdev, header, info, cap_id, base_addr);
 		if (ret)
 			priv->state[cap_id] =3D STATE_SKIP;
 		else
@@ -464,7 +459,7 @@ static bool intel_vsec_walk_header(struct pci_dev *pdev,
 	int ret;
=20
 	for ( ; *header; header++) {
-		ret =3D intel_vsec_register_device(pdev, *header, info);
+		ret =3D intel_vsec_register_device(pdev, *header, info, info->base_addr);
 		if (!ret)
 			have_devices =3D true;
 	}
@@ -512,7 +507,8 @@ static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
 		pci_read_config_dword(pdev, pos + PCI_DVSEC_HEADER2, &hdr);
 		header.id =3D PCI_DVSEC_HEADER2_ID(hdr);
=20
-		ret =3D intel_vsec_register_device(pdev, &header, info);
+		ret =3D intel_vsec_register_device(pdev, &header, info,
+						 pci_resource_start(pdev, header.tbir));
 		if (ret)
 			continue;
=20
@@ -557,7 +553,8 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
 		header.tbir =3D INTEL_DVSEC_TABLE_BAR(table);
 		header.offset =3D INTEL_DVSEC_TABLE_OFFSET(table);
=20
-		ret =3D intel_vsec_register_device(pdev, &header, info);
+		ret =3D intel_vsec_register_device(pdev, &header, info,
+						 pci_resource_start(pdev, header.tbir));
 		if (ret)
 			continue;
=20
--=20
2.43.0

