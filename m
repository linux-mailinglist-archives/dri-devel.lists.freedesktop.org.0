Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4DE6A1C87
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 13:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAC510E0D7;
	Fri, 24 Feb 2023 12:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BCB10E0D7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 12:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1677243447; x=1708779447;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YPDUeuHHlo3wlJW//buD61dRI7WKES35YA2aXIb2Pjg=;
 b=Zq++FGP7+aEVBaoPjx5xBrxoDDOXZe/+bBFR3n66wUjKp2SyalCVAsTd
 3EjafSjQPeQb5kmatVh7hE+oaRRibck+7FiKK7IeVjgs2kfDZqj6sY5Ow
 GzlUP30YNriKaaxORNzaX9DJp9MpLJs1G7DJAtuMJ6Sc7aLZHnaIOiaSy
 6OT308esINe95CW9/M+qTLF4gi/u7S/1V0+whb966uOqNJHPWb9hNKWR4
 284JifZ1WBULnW6V5StOVetuDnjcn6IkQ1NkQ9G1O6JiqkZVDjQ+2Spvb
 U9s6wXCc0ZBmloCp+H3Swmy9ZfySAalrLY0532lpe09xUo48uRUH6ZC75 Q==;
X-IronPort-AV: E=Sophos;i="5.97,324,1669071600"; d="scan'208";a="29300464"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 24 Feb 2023 13:57:25 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 24 Feb 2023 13:57:24 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 24 Feb 2023 13:57:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1677243445; x=1708779445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YPDUeuHHlo3wlJW//buD61dRI7WKES35YA2aXIb2Pjg=;
 b=i3e1JPU/POJmrfQTZ8Vj2y4ftwVIjBSXqq416sFTabb4CZ7Yg0B2WK6i
 jDG4sQ2WV8ysA1+ZdUA2N1m1HCx/T5szCRUVVa4RySuj7gJHfnDWPGRDS
 w7tzB6R3nBP/KxsWlmVgpKhSVqznAUpHSn+Vu5Gd/5scCjRhXnOFKhYvB
 aBREqLoZHqqsQSsnmwLT7MUxuH9NyiZi3SEiLo8gbsYKEyc5YfdWryJpu
 BgfBjnTItBh3AZB7gwlJfi4BGvWo6Ish4o/GHBgDmay5w82gN3T6m5pHo
 pi2YkJDQR+zTCPZfJ7dJqwgW9KsXap79X5YDbr4QaaaDjmUTUtLKEbuEq w==;
X-IronPort-AV: E=Sophos;i="5.97,324,1669071600"; d="scan'208";a="29300463"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 24 Feb 2023 13:57:24 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 90029280056;
 Fri, 24 Feb 2023 13:57:24 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm: panel: simple: convert LG LB070WV8 fixed mode into
 display timings
Date: Fri, 24 Feb 2023 13:57:19 +0100
Message-Id: <20230224125719.3272098-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At least the pixelclock has a range which can vary. Convert fixed mode
into display timings so they can be overwritten in DT if necessary.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 065f378bba9d..5048be54ffd9 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2458,21 +2458,21 @@ static const struct panel_desc lemaker_bl035_rgb_002 = {
 	.bus_flags = DRM_BUS_FLAG_DE_LOW,
 };
 
-static const struct drm_display_mode lg_lb070wv8_mode = {
-	.clock = 33246,
-	.hdisplay = 800,
-	.hsync_start = 800 + 88,
-	.hsync_end = 800 + 88 + 80,
-	.htotal = 800 + 88 + 80 + 88,
-	.vdisplay = 480,
-	.vsync_start = 480 + 10,
-	.vsync_end = 480 + 10 + 25,
-	.vtotal = 480 + 10 + 25 + 10,
+static const struct display_timing lg_lb070wv8_timing = {
+	.pixelclock = { 31950000, 33260000, 34600000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 88, 88, 88 },
+	.hback_porch = { 88, 88, 88 },
+	.hsync_len = { 80, 80, 80 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 10, 10, 10 },
+	.vback_porch = { 10, 10, 10 },
+	.vsync_len = { 25, 25, 25 },
 };
 
 static const struct panel_desc lg_lb070wv8 = {
-	.modes = &lg_lb070wv8_mode,
-	.num_modes = 1,
+	.timings = &lg_lb070wv8_timing,
+	.num_timings = 1,
 	.bpc = 8,
 	.size = {
 		.width = 151,
-- 
2.34.1

