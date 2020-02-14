Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0F615DC32
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27FD6F9C9;
	Fri, 14 Feb 2020 15:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAF06F9C6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 15:52:34 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E366A24673;
 Fri, 14 Feb 2020 15:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695554;
 bh=0H9o+zn/rO8CvUSKr63eVb30rG8pTCghBnbta8SAEAk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kF66+g9IONO5Bc4zxX8AizsQdVcQW66mlml4DvLkBB2hBQGdzCgqg214SkFT1KbQU
 MVN8BZrvYjYI0IBXzjJ2oYiQSIr0lX+Ue2JQh58NNhL5G8LDgl0Ovv6JfJCWCjd/rw
 FN+QfAIBh8Iad/kVjBlLAicyCnvvUzpHR11QliRY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 169/542] drm/panel: simple: Add Logic PD Type 28
 display support
Date: Fri, 14 Feb 2020 10:42:41 -0500
Message-Id: <20200214154854.6746-169-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Adam Ford <aford173@gmail.com>

[ Upstream commit 0d35408afbeb603bc9972ae91e4dd2638bcffe52 ]

Previously, there was an omap panel-dpi driver that would
read generic timings from the device tree and set the display
timing accordingly.  This driver was removed so the screen
no longer functions.  This patch modifies the panel-simple
file to setup the timings to the same values previously used.

Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191016135147.7743-1-aford173@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5d487686d25c5..72f69709f3493 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2061,6 +2061,40 @@ static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
 	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 };
 
+static const struct drm_display_mode logicpd_type_28_mode = {
+	.clock = 9000,
+	.hdisplay = 480,
+	.hsync_start = 480 + 3,
+	.hsync_end = 480 + 3 + 42,
+	.htotal = 480 + 3 + 42 + 2,
+
+	.vdisplay = 272,
+	.vsync_start = 272 + 2,
+	.vsync_end = 272 + 2 + 11,
+	.vtotal = 272 + 2 + 11 + 3,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
+static const struct panel_desc logicpd_type_28 = {
+	.modes = &logicpd_type_28_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 105,
+		.height = 67,
+	},
+	.delay = {
+		.prepare = 200,
+		.enable = 200,
+		.unprepare = 200,
+		.disable = 200,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
+		     DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE,
+};
+
 static const struct panel_desc mitsubishi_aa070mc01 = {
 	.modes = &mitsubishi_aa070mc01_mode,
 	.num_modes = 1,
@@ -3287,6 +3321,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "lg,lp129qe",
 		.data = &lg_lp129qe,
+	}, {
+		.compatible = "logicpd,type28",
+		.data = &logicpd_type_28,
 	}, {
 		.compatible = "mitsubishi,aa070mc01-ca1",
 		.data = &mitsubishi_aa070mc01,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
