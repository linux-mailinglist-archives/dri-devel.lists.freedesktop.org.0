Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGjAJxIBoWlVpQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 03:27:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 504861B205D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 03:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F06210EA27;
	Fri, 27 Feb 2026 02:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TD2yQzro";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E812B10EA1E;
 Fri, 27 Feb 2026 02:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772159240; x=1803695240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lPP+L8F/PjTTijYQ5GSyQ+RJl3+3mvBO3uiaBZO++/g=;
 b=TD2yQzrolmcmTNWS95Lzs9c4K15ZO2T7bWcBR/tx/dxvEReXe7hsdzd2
 cOd3cSYW3kk0LhYEFVyPDroAKpOwQ+1SEAOKRCb1MchsBZEQPuECVAswy
 POfbh75t65/0Jhymp2jt7Ke4s6K72SOqNVHWbZGkv8DLsPHwJuC2miaO3
 zpk9sAMMbQRXjShzkYZvK1vVwvdZDWvHDpTJr+P7w/bT+iTU3AsWFEHAP
 DipiDggrnGJNjlAg22MOO52p93fFmCrYRpK1CfiejjNYgGHLroL5DHAZ0
 GFn4wUvgI8OmNFxx5msZjzyhaMJBEVQ1VABeY2IpfqpXAOynkLKHGyqr8 w==;
X-CSE-ConnectionGUID: 1BG60hLoTjq7KL+CY/DkTw==
X-CSE-MsgGUID: VncjzwRxREicP4C1HMOStg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73283327"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73283327"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 18:27:18 -0800
X-CSE-ConnectionGUID: ywAOB0lGT/27sgZFn9J/Mw==
X-CSE-MsgGUID: +xfwIMgkTYOzZ0m+KWYDsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="214662264"
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
Subject: [PATCH v6 5/6] platform/x86/intel/vsec: Return real error codes from
 registration path
Date: Thu, 26 Feb 2026 18:27:09 -0800
Message-ID: <20260227022711.3513663-6-david.e.box@linux.intel.com>
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 504861B205D
X-Rspamd-Action: no action

Stop collapsing registration results into booleans. Make
intel_vsec_walk_header() return int and propagate the first non-zero error
from intel_vsec_register_device(). intel_vsec_register() now returns that
error directly and 0 on success.

This preserves success behavior while surfacing meaningful errors instead
of hiding them behind a bool/-ENODEV, which makes debugging and probe
ordering issues clearer.

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
Changes in v6:
  - No change

Changes in v5:
  - No change

Changes in v4:
  - No change

Changes in v3:
  - No change

Changes in v2:
  - No change (previous patch 3)

 drivers/platform/x86/intel/vsec.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index a547e4b98245..34b2c19ecff0 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -461,20 +461,19 @@ static int intel_vsec_register_device(struct device *=
dev,
 	return -EAGAIN;
 }
=20
-static bool intel_vsec_walk_header(struct device *dev,
-				   const struct intel_vsec_platform_info *info)
+static int intel_vsec_walk_header(struct device *dev,
+				  const struct intel_vsec_platform_info *info)
 {
 	struct intel_vsec_header **header =3D info->headers;
-	bool have_devices =3D false;
 	int ret;
=20
 	for ( ; *header; header++) {
 		ret =3D intel_vsec_register_device(dev, *header, info, info->base_addr);
-		if (!ret)
-			have_devices =3D true;
+		if (ret)
+			return ret;
 	}
=20
-	return have_devices;
+	return 0;
 }
=20
 static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
@@ -580,10 +579,7 @@ int intel_vsec_register(struct device *dev,
 	if (!dev || !info || !info->headers)
 		return -EINVAL;
=20
-	if (!intel_vsec_walk_header(dev, info))
-		return -ENODEV;
-	else
-		return 0;
+	return intel_vsec_walk_header(dev, info);
 }
 EXPORT_SYMBOL_NS_GPL(intel_vsec_register, "INTEL_VSEC");
=20
--=20
2.43.0

