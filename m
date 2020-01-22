Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E139014634C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 09:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEE26FB2A;
	Thu, 23 Jan 2020 08:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 22 Jan 2020 20:17:38 UTC
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5FB6F60D;
 Wed, 22 Jan 2020 20:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579724259;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=MJa4eYt3crjAenr4CmXGe3xMFCLr5PGiS6d0YsXiFss=;
 b=ebdFQtgt42IHpMLQ1IKWrjFBoL/H/Ls8hN3GBDSQCRm6YmlmmS7VeawZ
 j/hxkBAQOdeKPpC2TRvdbYXsdvfpQnmCDmdShtfYmIKq+FBpKKg8PTLcl
 J6VKi1VoPyXRvNpIwKcYiai317SxtgGtcwMX2Zbb2rOWprtelVcuXACx2 U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TaUqzM78xDduaVYHQYABbgc2RX5soS0fqo+gu6ahOmZnliE9XG165ViAidcFXDPe5C7WJDiskD
 RtlvoRkTnx74PwdcwhiG7h3JByPXH1KF/czSSrWh+X4n6oc0NcpZk5yyGecXTZ3XwqrJchhpjL
 H6GVEjxuTq4Bh4jcTWQ4QTFDAMyb/ayPQg0/cPIfpFNNzSwnYI2AD4V15F2yuENc3hZPrsmGhB
 7E77TP4yCJYzZBVd61hpTV3nRoF3VNgTC9RfWBgdmAVbp8N7t7OwJ0S8FLNDRqdB91jLvOiW3m
 zu8=
X-SBRS: 2.7
X-MesageID: 11306633
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,350,1574139600"; d="scan'208";a="11306633"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <intel-gvt-dev@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/i915/gvt: fix high-order allocation failure on late load
Date: Wed, 22 Jan 2020 20:10:24 +0000
Message-ID: <1579723824-25711-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Jan 2020 08:19:47 +0000
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
Cc: Igor
 Druzhinin <igor.druzhinin@citrix.com>, airlied@linux.ie, rodrigo.vivi@intel.com,
 zhi.a.wang@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the module happens to be loaded later at runtime there is a chance
memory is already fragmented enough to fail allocation of firmware
blob storage and consequently GVT init. Since it doesn't seem to be
necessary to have the blob contiguous, use vmalloc() instead to avoid
the issue.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 drivers/gpu/drm/i915/gvt/firmware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/firmware.c b/drivers/gpu/drm/i915/gvt/firmware.c
index 049775e..b0c1fda 100644
--- a/drivers/gpu/drm/i915/gvt/firmware.c
+++ b/drivers/gpu/drm/i915/gvt/firmware.c
@@ -146,7 +146,7 @@ void intel_gvt_free_firmware(struct intel_gvt *gvt)
 		clean_firmware_sysfs(gvt);
 
 	kfree(gvt->firmware.cfg_space);
-	kfree(gvt->firmware.mmio);
+	vfree(gvt->firmware.mmio);
 }
 
 static int verify_firmware(struct intel_gvt *gvt,
@@ -229,7 +229,7 @@ int intel_gvt_load_firmware(struct intel_gvt *gvt)
 
 	firmware->cfg_space = mem;
 
-	mem = kmalloc(info->mmio_size, GFP_KERNEL);
+	mem = vmalloc(info->mmio_size);
 	if (!mem) {
 		kfree(path);
 		kfree(firmware->cfg_space);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
