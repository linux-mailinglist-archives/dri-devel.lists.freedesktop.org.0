Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C007C892C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 17:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C9510E00A;
	Fri, 13 Oct 2023 15:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 478 seconds by postgrey-1.36 at gabe;
 Fri, 13 Oct 2023 14:56:20 UTC
Received: from gw.red-soft.ru (red-soft.ru [188.246.186.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A81B10E17A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:56:20 +0000 (UTC)
Received: from localhost.biz (unknown [10.81.81.211])
 by gw.red-soft.ru (Postfix) with ESMTPA id DAADE3E0D09;
 Fri, 13 Oct 2023 17:48:18 +0300 (MSK)
From: Artem Chernyshev <artem.chernyshev@red-soft.ru>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH] drm/bridge: analogix: anx78xx: Check return value
Date: Fri, 13 Oct 2023 17:48:13 +0300
Message-Id: <20231013144813.354353-1-artem.chernyshev@red-soft.ru>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 180612 [Oct 13 2023]
X-KLMS-AntiSpam-Version: 6.0.0.2
X-KLMS-AntiSpam-Envelope-From: artem.chernyshev@red-soft.ru
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=none
X-KLMS-AntiSpam-Info: LuaCore: 539 539
 807534d9021bfe9ca369c363d15ac993cd93d4d9,
 {Tracking_from_domain_doesnt_match_to}, red-soft.ru:7.1.1; localhost.biz:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2023/10/13 13:20:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30,
 bases: 2023/10/13 11:13:00 #22181246
X-KLMS-AntiVirus-Status: Clean, skipped
X-Mailman-Approved-At: Fri, 13 Oct 2023 15:55:14 +0000
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
Cc: lvc-project@linuxtesting.org, Jonas Karlman <jonas@kwiboo.se>,
 Artem Chernyshev <artem.chernyshev@red-soft.ru>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In anx78xx_start() err value of anx78xx_clear_bits()
overwriting without check.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Artem Chernyshev <artem.chernyshev@red-soft.ru>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 800555aef97f..c966e661b9b9 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -537,6 +537,10 @@ static int anx78xx_start(struct anx78xx *anx78xx)
 				 SP_POWERDOWN_CTRL_REG,
 				 SP_HDCP_PD | SP_AUDIO_PD | SP_VIDEO_PD |
 				 SP_LINK_PD);
+	if (err) {
+		DRM_ERROR("Failed to clear bits: %d\n", err);
+		goto err_poweroff;
+	}
 
 	err = anx78xx_enable_interrupts(anx78xx);
 	if (err) {
-- 
2.37.3

