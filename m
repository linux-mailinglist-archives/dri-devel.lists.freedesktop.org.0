Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PHAL45vpmmQPwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 06:20:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9F71E92CB
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 06:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A710710E638;
	Tue,  3 Mar 2026 05:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOTRLdUx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E6410E62C;
 Tue,  3 Mar 2026 05:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772515202; x=1804051202;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vqFtNWiZjESBFSbryd7cwD0GctC+NOXt9yFK2KorVtE=;
 b=OOTRLdUxRpHLO4srIWaADhLCBFeAl1JKUAMq8ztKxZvbQHB8FxEA2SF8
 EqN0kUU8AEZPPiZWk5J9r98JgHwxNI8tGsALT3JNb22TfeVc4fzEs8GTW
 w0u1SppzctSvIUz37vhfXiocvYhuDxtRW6Wgm+ZXXqB6qljyrNOdN/OFw
 igWy4CtzP9Mj8bkwUba+jupUVUejk/9dwBgLP/fPTU7P2y0uRbb0ViCS6
 WrksHrBybarxF9rbU/oFsiNVxj+f2Ts04oColcKEIzQlGJbgkC8d885Rz
 AOXUyJc8mZKLph6h8/s9MHrlnwirHCpW9u/jz1+Oyd/V1FTrP4KXnlRE4 g==;
X-CSE-ConnectionGUID: ml3W9/eBSPiTQXR8mrtpRA==
X-CSE-MsgGUID: OE8YOeUEQLupWG4qeBX2Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73445429"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="73445429"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 21:20:01 -0800
X-CSE-ConnectionGUID: h+eu2vRnSEu7Z0CeBczumA==
X-CSE-MsgGUID: USdiPNoZRGGGnlZ+wej8Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="217110184"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 21:20:01 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 irenic.rajneesh@gmail.com, ilpo.jarvinen@linux.intel.com,
 srinivas.pandruvada@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xi.pardee@linux.intel.com
Cc: david.e.box@linux.intel.com, hansg@kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH v7 6/6] platform/x86/intel/vsec: Plumb ACPI PMT discovery
 tables through vsec
Date: Mon,  2 Mar 2026 21:19:53 -0800
Message-ID: <20260303051953.1453372-7-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303051953.1453372-1-david.e.box@linux.intel.com>
References: <20260303051953.1453372-1-david.e.box@linux.intel.com>
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
X-Rspamd-Queue-Id: 5B9F71E92CB
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

Some platforms expose PMT discovery via ACPI instead of PCI BARs. Add a
generic discovery source flag and carry ACPI discovery entries alongside
the existing PCI resource path so PMT clients can consume either.

Changes:
  - Add enum intel_vsec_disc_source { _PCI, _ACPI }.
  - Extend intel_vsec_platform_info and intel_vsec_device with source enum
    and ACPI discovery table pointer/
  - When src=3D=3DACPI, skip BAR resource setup and copy the ACPI discovery
    entries into the aux device.

No user-visible behavior change yet; this only wires ACPI data through vsec
in preparation for ACPI-enumerated PMT clients.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
Changes in v7:
  - No change
=20=20=20=20
Changes in v6:
  - Fix checkpatch parens alignment warning
=20=20=20=20
Changes in v5:
  - No change
=20=20=20=20
Changes in v4:
  - Use check_mul_overflow() instead of array_size() which was
    incorrectly checking for 0 anyway.
=20=20=20=20
Changes in v3:
  - Re-send with all changes intended for v2 which was sent without them
    being applied.
=20=20=20=20
Changes in v2:
  - Improve comment to clarify BAR resource setup doesn't apply to ACPI
    discovery
  - Add missing #include for kmemdup()
  - Use array_size() for overflow protection
    (review comments by Ilpo J=C3=A4rvinen)

 drivers/platform/x86/intel/vsec.c | 23 +++++++++++++++++++++++
 include/linux/intel_vsec.h        | 20 +++++++++++++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 34b2c19ecff0..7d5dbc1c1d05 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -24,7 +24,9 @@
 #include <linux/intel_vsec.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/pci.h>
+#include <linux/string.h>
 #include <linux/types.h>
=20
 #define PMT_XA_START			0
@@ -109,6 +111,7 @@ static void intel_vsec_dev_release(struct device *dev)
=20
 	ida_free(intel_vsec_dev->ida, intel_vsec_dev->auxdev.id);
=20
+	kfree(intel_vsec_dev->acpi_disc);
 	kfree(intel_vsec_dev->resource);
 	kfree(intel_vsec_dev);
 }
@@ -320,6 +323,13 @@ static int intel_vsec_add_dev(struct device *dev, stru=
ct intel_vsec_header *head
 	 * auxiliary device driver.
 	 */
 	for (i =3D 0, tmp =3D res; i < header->num_entries; i++, tmp++) {
+		/*
+		 * Skip resource mapping check for ACPI-based discovery
+		 * since those tables are read from _DSD, not MMIO.
+		 */
+		if (info->src =3D=3D INTEL_VSEC_DISC_ACPI)
+			break;
+
 		tmp->start =3D base_addr + header->offset + i * (header->entry_size * si=
zeof(u32));
 		tmp->end =3D tmp->start + (header->entry_size * sizeof(u32)) - 1;
 		tmp->flags =3D IORESOURCE_MEM;
@@ -338,6 +348,19 @@ static int intel_vsec_add_dev(struct device *dev, stru=
ct intel_vsec_header *head
 	intel_vsec_dev->base_addr =3D info->base_addr;
 	intel_vsec_dev->priv_data =3D info->priv_data;
 	intel_vsec_dev->cap_id =3D cap_id;
+	intel_vsec_dev->src =3D info->src;
+
+	if (info->src =3D=3D INTEL_VSEC_DISC_ACPI) {
+		size_t bytes;
+
+		if (check_mul_overflow(intel_vsec_dev->num_resources,
+				       sizeof(*info->acpi_disc), &bytes))
+			return -EOVERFLOW;
+
+		intel_vsec_dev->acpi_disc =3D kmemdup(info->acpi_disc, bytes, GFP_KERNEL=
);
+		if (!intel_vsec_dev->acpi_disc)
+			return -ENOMEM;
+	}
=20
 	if (header->id =3D=3D VSEC_ID_SDSI)
 		intel_vsec_dev->ida =3D &intel_vsec_sdsi_ida;
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 4eecb2a6bac4..1fe5665a9d02 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -33,6 +33,11 @@ struct device;
 struct pci_dev;
 struct resource;
=20
+enum intel_vsec_disc_source {
+	INTEL_VSEC_DISC_PCI,	/* PCI, default */
+	INTEL_VSEC_DISC_ACPI,	/* ACPI */
+};
+
 enum intel_vsec_id {
 	VSEC_ID_TELEMETRY	=3D 2,
 	VSEC_ID_WATCHER		=3D 3,
@@ -103,6 +108,10 @@ struct vsec_feature_dependency {
  * @parent:    parent device in the auxbus chain
  * @headers:   list of headers to define the PMT client devices to create
  * @deps:      array of feature dependencies
+ * @acpi_disc: ACPI discovery tables, each entry is two QWORDs
+ *             in little-endian format as defined by the PMT ACPI spec.
+ *             Valid only when @provider =3D=3D INTEL_VSEC_DISC_ACPI.
+ * @src:       source of discovery table data
  * @priv_data: private data, usable by parent devices, currently a callback
  * @caps:      bitmask of PMT capabilities for the given headers
  * @quirks:    bitmask of VSEC device quirks
@@ -113,6 +122,8 @@ struct intel_vsec_platform_info {
 	struct device *parent;
 	struct intel_vsec_header **headers;
 	const struct vsec_feature_dependency *deps;
+	u32 (*acpi_disc)[4];
+	enum intel_vsec_disc_source src;
 	void *priv_data;
 	unsigned long caps;
 	unsigned long quirks;
@@ -124,7 +135,12 @@ struct intel_vsec_platform_info {
  * struct intel_vsec_device - Auxbus specific device information
  * @auxdev:        auxbus device struct for auxbus access
  * @dev:           struct device associated with the device
- * @resource:      any resources shared by the parent
+ * @resource:      PCI discovery resources (BAR windows), one per discovery
+ *                 instance. Valid only when @src =3D=3D INTEL_VSEC_DISC_P=
CI
+ * @acpi_disc:     ACPI discovery tables, each entry is two QWORDs
+ *                 in little-endian format as defined by the PMT ACPI spec.
+ *                 Valid only when @src =3D=3D INTEL_VSEC_DISC_ACPI.
+ * @src:           source of discovery table data
  * @ida:           id reference
  * @num_resources: number of resources
  * @id:            xarray id
@@ -138,6 +154,8 @@ struct intel_vsec_device {
 	struct auxiliary_device auxdev;
 	struct device *dev;
 	struct resource *resource;
+	u32 (*acpi_disc)[4];
+	enum intel_vsec_disc_source src;
 	struct ida *ida;
 	int num_resources;
 	int id; /* xa */
--=20
2.43.0

