Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037B0A55520
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 19:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3E210E2A9;
	Thu,  6 Mar 2025 18:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="LaTTcecW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ksmg01.maxima.ru (ksmg01.maxima.ru [81.200.124.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6A410E942
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 11:21:13 +0000 (UTC)
Received: from ksmg01.maxima.ru (localhost [127.0.0.1])
 by ksmg01.maxima.ru (Postfix) with ESMTP id C30F3C001C;
 Thu,  6 Mar 2025 14:21:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg01.maxima.ru C30F3C001C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
 s=sl; t=1741260063; bh=MmWbnkvxTWpWb2whbf/jOtIqexvkM+1MV4X5/egi+Ms=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=LaTTcecWlQAOWV78/EKG2DvRG2JHubMsnXdleXHduJtZm6B2y88rc9U9HBg2AE1Ze
 u//H0hKaM9qIKsAk1QJ9l27Y8X91WlEC85HAaYfm2cM/wZBA4JNhoLL0C4LBAec8q5
 O4UOuzxkXvY2/uhVt+RBOLQ4b6kUwUwOtD2fHgzgPe1kvt1znRBqtwV+Y+BPvIHP/Z
 F1bTvaP2kYcbYrAaX0VW/VS8DFNHxzP7kd7vEKJxUKcZ0dq1Hz2Xg8y3DUriDAstEb
 rIC4zHVrxh8WqsmdG/MJHxtfB/l/d7Lk3E3CkMo5MJP4H/V7Bi4QbPqi3X5lXza673
 lN80NpEguXaLg==
Received: from ksmg01.maxima.ru (autodiscover.maxima.ru [81.200.124.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.maxima.ru",
 Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
 by ksmg01.maxima.ru (Postfix) with ESMTPS;
 Thu,  6 Mar 2025 14:21:03 +0300 (MSK)
Received: from localhost.localdomain (94.19.79.228) by mmail-p-exch01.mt.ru
 (81.200.124.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.4; Thu, 6 Mar 2025
 14:21:02 +0300
From: Ivan Abramov <i.abramov@mt-integration.ru>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
CC: Ivan Abramov <i.abramov@mt-integration.ru>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alan Cox <alan@linux.intel.com>, Dave Airlie
 <airlied@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH v2] drm/gma500: Add NULL check for pci_gfx_root in
 mid_get_vbt_data()
Date: Thu, 6 Mar 2025 14:20:45 +0300
Message-ID: <20250306112046.17144-1-i.abramov@mt-integration.ru>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [94.19.79.228]
X-ClientProxiedBy: mt-exch-01.mt.ru (91.220.120.210) To mmail-p-exch01.mt.ru
 (81.200.124.61)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;
 spf=none smtp.mailfrom=mt-integration.ru; dkim=none
X-KSMG-AntiSpam-Envelope-From: i.abramov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51
 68896fb0083a027476849bf400a331a2d5d94398, {rep_avail},
 {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;
 ksmg01.maxima.ru:7.1.1; 81.200.124.61:7.1.2; mt-integration.ru:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s,
 ApMailHostAddress: 81.200.124.61
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 191533 [Mar 06 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310,
 bases: 2025/03/06 10:27:00 #27639335
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7
X-Mailman-Approved-At: Thu, 06 Mar 2025 18:35:34 +0000
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

Since pci_get_domain_bus_and_slot() can return NULL, add NULL check for
pci_gfx_root in the mid_get_vbt_data().

This change is similar to the checks implemented in mid_get_fuse_settings()
and mid_get_pci_revID(), which were introduced by commit 0cecdd818cd7
("gma500: Final enables for Oaktrail") as "additional minor
bulletproofing".

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: f910b411053f ("gma500: Add the glue to the various BIOS and firmware interfaces")
Signed-off-by: Ivan Abramov <i.abramov@mt-integration.ru>
---
v2: Update Fixes tag as per Patrik Jakobsson's observation.

 drivers/gpu/drm/gma500/mid_bios.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/mid_bios.c
index 7e76790c6a81..cba97d7db131 100644
--- a/drivers/gpu/drm/gma500/mid_bios.c
+++ b/drivers/gpu/drm/gma500/mid_bios.c
@@ -279,6 +279,11 @@ static void mid_get_vbt_data(struct drm_psb_private *dev_priv)
 					    0, PCI_DEVFN(2, 0));
 	int ret = -1;
 
+	if (pci_gfx_root == NULL) {
+		WARN_ON(1);
+		return;
+	}
+
 	/* Get the address of the platform config vbt */
 	pci_read_config_dword(pci_gfx_root, 0xFC, &addr);
 	pci_dev_put(pci_gfx_root);
-- 
2.48.1

