Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3CAB86213
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 18:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0534D10E14E;
	Thu, 18 Sep 2025 16:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="VuKWD2f6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 418 seconds by postgrey-1.36 at gabe;
 Thu, 18 Sep 2025 15:15:00 UTC
Received: from ksmg01.maxima.ru (ksmg01.mt-integration.ru [81.200.124.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA1C10E1F7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 15:15:00 +0000 (UTC)
Received: from ksmg01.maxima.ru (localhost [127.0.0.1])
 by ksmg01.maxima.ru (Postfix) with ESMTP id 566C4C004B;
 Thu, 18 Sep 2025 18:07:58 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg01.maxima.ru 566C4C004B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
 s=sl; t=1758208078; bh=zkYI2j6MoOOBH+AZctoahOHwRP79UMOw4c4nlVg8TN0=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=VuKWD2f6L0IriUGD+DWuNLrQ6bnCUGoRcZ+CzY6Z5Fw99vX1D+hdgnT8RsU03nlba
 Iza9QMvTEiiAdV2W6w2DEmvKqPQ6fRzYcbmiwiKg2LFc6itfPHNy743JZKRetbV56Z
 UAkSkCIGvhdiy1CzNUEuJUxDFzMbWGleOeAVYITqKXoAS9i2K97Nhia22TVUVrnaN3
 IngIJptYjfU7qPwPjLdnCJL5MLf4f+0x8lMOxzfrVOwr/+Pvkm1xvoLCzPxlQJdicE
 pZehFfXOmK6Y/Fc/W/FrVNnQJ6euAg73hl9ZqvyIZx8vnHoEHo1Ojtqb8oKFS4j/Vw
 H912SM64GhmOQ==
Received: from ksmg01.maxima.ru (mail.maxima.ru [81.200.124.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by ksmg01.maxima.ru (Postfix) with ESMTPS;
 Thu, 18 Sep 2025 18:07:58 +0300 (MSK)
Received: from ub24-1-zabelin-t-22-tests.mti-lab.com (172.25.20.198) by
 mmail-p-exch01.mt.ru (81.200.124.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 18 Sep 2025 18:07:56 +0300
From: Zabelin Nikita <n.zabelin@mt-integration.ru>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
CC: Zabelin Nikita <n.zabelin@mt-integration.ru>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Dave Airlie
 <airlied@redhat.com>, Alan Cox <alan@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <lvc-project@linuxtesting.org>
Subject: [PATCH] drm/gma500: Fix null dereference in hdmi teardown
Date: Thu, 18 Sep 2025 18:06:59 +0300
Message-ID: <20250918150703.2562604-1-n.zabelin@mt-integration.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.20.198]
X-ClientProxiedBy: mmail-p-exch02.mt.ru (81.200.124.62) To
 mmail-p-exch01.mt.ru (81.200.124.61)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;
 spf=none smtp.mailfrom=mt-integration.ru; dkim=none
X-KSMG-AntiSpam-Envelope-From: n.zabelin@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 67 0.3.67
 f6b3a124585516de4e61e2bf9df040d8947a2fd5, {rep_avail},
 {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to},
 127.0.0.199:7.1.2; ksmg01.maxima.ru:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; mt-integration.ru:7.1.1;
 81.200.124.61:7.1.2, FromAlignment: s, ApMailHostAddress: 81.200.124.61
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 196408 [Sep 18 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310,
 bases: 2025/09/18 13:01:00 #27830703
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7
X-Mailman-Approved-At: Thu, 18 Sep 2025 16:55:39 +0000
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

pci_set_drvdata sets the value of pdev->driver_data to NULL,
after which the driver_data obtained from the same dev is 
dereferenced in oaktrail_hdmi_i2c_exit, and the i2c_dev is 
extracted from it. To prevent this, swap these calls.

Fixes: 1b082cc ("gma500: Add Oaktrail support")

Found by Linux Verification Center (linuxtesting.org) with Svacer.

Signed-off-by: Zabelin Nikita <n.zabelin@mt-integration.ru>
---
 drivers/gpu/drm/gma500/oaktrail_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
index 95b7cb099e63..9c7d9584aac7 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
@@ -724,8 +724,8 @@ void oaktrail_hdmi_teardown(struct drm_device *dev)
 
 	if (hdmi_dev) {
 		pdev = hdmi_dev->dev;
-		pci_set_drvdata(pdev, NULL);
 		oaktrail_hdmi_i2c_exit(pdev);
+		pci_set_drvdata(pdev, NULL);
 		iounmap(hdmi_dev->regs);
 		kfree(hdmi_dev);
 		pci_dev_put(pdev);
-- 
2.43.0

