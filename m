Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 669385BA7E1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 10:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F09C10E3EA;
	Fri, 16 Sep 2022 08:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF7910E3BC
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 08:14:30 +0000 (UTC)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 28G7rljF078927;
 Fri, 16 Sep 2022 15:53:47 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 16 Sep 2022 16:14:18 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <airlied@redhat.com>, <tzimmermann@suse.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/ast: Add resolution support for 1152x864@75
Date: Fri, 16 Sep 2022 16:14:16 +0800
Message-ID: <20220916081416.1824-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 28G7rljF078927
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

Add 1152x864 into support list.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_mode.c   | 3 +++
 drivers/gpu/drm/ast/ast_tables.h | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 214b10178454..0b2c5fe8dc2c 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -114,6 +114,9 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
 	case 1024:
 		vbios_mode->enh_table = &res_1024x768[refresh_rate_index];
 		break;
+	case 1152:
+		vbios_mode->enh_table = &res_1152x864[refresh_rate_index];
+		break;
 	case 1280:
 		if (mode->crtc_vdisplay == 800)
 			vbios_mode->enh_table = &res_1280x800[refresh_rate_index];
diff --git a/drivers/gpu/drm/ast/ast_tables.h b/drivers/gpu/drm/ast/ast_tables.h
index dbe1cc620f6e..0378c9bc079b 100644
--- a/drivers/gpu/drm/ast/ast_tables.h
+++ b/drivers/gpu/drm/ast/ast_tables.h
@@ -272,6 +272,13 @@ static const struct ast_vbios_enhtable res_1600x1200[] = {
 	 (SyncPP | Charx8Dot), 0xFF, 1, 0x33 },
 };
 
+static const struct ast_vbios_enhtable res_1152x864[] = {
+	{1600, 1152, 64, 128,  900,  864, 1, 3, VCLK108,	/* 75Hz */
+	 (SyncPP | Charx8Dot | NewModeInfo), 75, 1, 0x3B },
+	{1600, 1152, 64, 128,  900,  864, 1, 3, VCLK108,	/* end */
+	 (SyncPP | Charx8Dot | NewModeInfo), 0xFF, 1, 0x3B },
+};
+
 /* 16:9 */
 static const struct ast_vbios_enhtable res_1360x768[] = {
 	{1792, 1360, 64, 112, 795, 768, 3, 6, VCLK85_5,		/* 60Hz */
-- 
2.25.1

