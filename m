Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2194BA08FD7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 12:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E5B10F079;
	Fri, 10 Jan 2025 11:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=maxima.ru header.i=@maxima.ru header.b="TIFqLRkp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 435 seconds by postgrey-1.36 at gabe;
 Fri, 10 Jan 2025 11:57:40 UTC
Received: from ksmg01.maxima.ru (ksmg01.maxima.ru [81.200.124.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFB510F084
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:57:40 +0000 (UTC)
Received: from ksmg01.maxima.ru (localhost [127.0.0.1])
 by ksmg01.maxima.ru (Postfix) with ESMTP id 35065C000C;
 Fri, 10 Jan 2025 14:50:17 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg01.maxima.ru 35065C000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxima.ru; s=sl;
 t=1736509817; bh=CuOfY3qbIPC792aUU8ynaQ3dOV35Ia7fD7QZCJinD84=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=TIFqLRkpYRpANo3uo4IzidwkuQt1UGGhqwo/KHMDOirGGsdEAY5WyGIMUa5IQizu3
 s16XOzUU2rUmiThyG3R8nlZ88jPgrN4gJ8ZIyrFkhcmKz90e/aP9ljxink1vwzolY2
 kogUjqp3Hj+qUpBgIne4ZSx/G1Oevdubq5DadanUFvR87JWWTu6MN4dSxE9roMdzaL
 isdVrpKpVS3VBmwv9pUfnYdsXejSdK3OjFTh/chxUHQQ26R5/FGcXSVDBOIFEamny7
 0SJOxSlcDKUyAeEBqQQLf41ybY9G9QLdxFYwfWFMyyoLhGA+Eh0UsHNtAjS+uQbAOI
 A/J1DXxk/SAPw==
Received: from ksmg01.maxima.ru (autodiscover.maxima.ru [81.200.124.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.maxima.ru",
 Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
 by ksmg01.maxima.ru (Postfix) with ESMTPS;
 Fri, 10 Jan 2025 14:50:17 +0300 (MSK)
Received: from localhost.maximatelecom.ru (217.116.54.35) by
 mmail-p-exch01.mt.ru (81.200.124.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.4; Fri, 10 Jan 2025 14:50:15 +0300
From: Vitaliy Shevtsov <v.shevtsov@maxima.ru>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Vitaliy Shevtsov <v.shevtsov@maxima.ru>,
 <syzbot+9a8f87865d5e2e8ef57f@syzkaller.appspotmail.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Michel=20D=C3=A4nzer?=
 <michel.daenzer@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>,
 <stable@vger.kernel.org>
Subject: [PATCH] drm/vblank: fix misuse of drm_WARN in drm_wait_one_vblank()
Date: Fri, 10 Jan 2025 16:49:13 +0000
Message-ID: <20250110164914.15013-1-v.shevtsov@maxima.ru>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [217.116.54.35]
X-ClientProxiedBy: mt-exch-01.mt.ru (91.220.120.210) To mmail-p-exch01.mt.ru
 (81.200.124.61)
X-KSMG-AntiPhishing: NotDetected, bases: 2025/01/10 09:46:00
X-KSMG-AntiSpam-Auth: dmarc=none header.from=maxima.ru;
 spf=none smtp.mailfrom=mt-integration.ru; dkim=none
X-KSMG-AntiSpam-Envelope-From: v.shevtsov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49
 28b3b64a43732373258a371bd1554adb2caa23cb, {rep_avail},
 {Tracking_smtp_not_equal_from}, {Tracking_one_url, url3},
 {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to},
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; maxima.ru:7.1.1;
 81.200.124.61:7.1.2; 127.0.0.199:7.1.2; mt-integration.ru:7.1.1;
 ksmg01.maxima.ru:7.1.1;
 syzkaller.appspot.com:5.0.1,7.1.1, {Tracking_smtp_domain_mismatch},
 {Tracking_smtp_domain_2level_mismatch}, FromAlignment: n, ApMailHostAddress:
 81.200.124.61
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 190253 [Jan 10 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310,
 bases: 2025/01/10 08:29:00 #26967733
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2025/01/10 09:46:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7
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

drm_wait_one_vblank() uses drm_WARN() to check for a time-dependent
condition. Since syzkaller runs the kernel with the panic_on_warn set, this
causes the entire kernel to panic with a "vblank wait timed out on crtc %i"
message.

In this case it does not mean that there is something wrong with the kernel
but is caused by time delays in vblanks handling that the fuzzer introduces
as a side effect when fail_alloc_pages, failslab, fail_usercopy faults are
injected with maximum verbosity. With lower verbosity this issue disappears.

drm_WARN() was introduced here by e8450f51a4b3 ("drm/irq: Implement a
generic vblank_wait function") and it is intended to indicate a failure with
vblank irqs handling by the underlying driver. The issue is raised during
testing of the vkms driver, but it may be potentially reproduced with other
drivers.

Fix this by using drm_warn() instead which does not cause the kernel to
panic with panic_on_warn set, but still provides a way to tell users about
this unexpected condition.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: e8450f51a4b3 ("drm/irq: Implement a generic vblank_wait function")
Cc: stable@vger.kernel.org
Reported-by: syzbot+9a8f87865d5e2e8ef57f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9a8f87865d5e2e8ef57f
Signed-off-by: Vitaliy Shevtsov <v.shevtsov@maxima.ru>
---
 drivers/gpu/drm/drm_vblank.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 94e45ed6869d..fa09ff5b1d48 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1304,7 +1304,8 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 				 last != drm_vblank_count(dev, pipe),
 				 msecs_to_jiffies(100));
 
-	drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
+	if (!ret)
+		drm_warn(dev, "vblank wait timed out on crtc %i\n", pipe);
 
 	drm_vblank_put(dev, pipe);
 }
-- 
2.47.1

