Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FF88294F3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 09:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDA910E56F;
	Wed, 10 Jan 2024 08:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D38E10E56F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 08:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1704874970; x=1736410970;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/e8Aa9n/2GeI9N77/y0ahWDdnz2nYudZO+H7EdauP/4=;
 b=dGYqvR7xMPGC4aFIJITnsj9uVshb755X3Qjz9f9X9p5p2UAUjx0JC0IC
 jYMCGh8oOCA2VyRCgrPHV6T72y1V8G/WyJoi80djvmNg7vN22pbfCt1P6
 dW1443IhlrXNwdGw0MoJGAMhhcK6wnAPUJN9CbP0aaWQqgDo5X+5IUUuX
 O8vZjt3/gDcbrgTMOFpZzik/HuHNIjmzCePaZPaln9F4K0NDYq8WjhC17
 C+mGv7qJECDWNdIBHnmC6qqhER8jPnycM6OWMs9MI/qAu2wC4UXUI9POu
 uBq8xAGXfcJsv2xEOj9alZAeLh9HhEsm8695zoo8l97PYSVMF8PtKYo9I Q==;
X-IronPort-AV: E=Sophos;i="6.04,184,1695679200"; d="scan'208";a="34821730"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Jan 2024 09:22:48 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 29FDF280075;
 Wed, 10 Jan 2024 09:22:48 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/1] drm: panel: simple: convert LG LB070WV8 fixed mode
 into display timings
Date: Wed, 10 Jan 2024 09:22:45 +0100
Message-Id: <20240110082245.417736-1-alexander.stein@ew.tq-group.com>
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
Changes in v2:
* Rebase to next-20240110

 drivers/gpu/drm/panel/panel-simple.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index d3ba94f796a32..754e154f22bfc 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2793,21 +2793,21 @@ static const struct panel_desc lemaker_bl035_rgb_002 = {
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

