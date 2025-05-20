Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC37BABD0A7
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1D710E46E;
	Tue, 20 May 2025 07:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VN3W+A/z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF5F10E46E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:41:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5F0C56113B;
 Tue, 20 May 2025 07:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E563C4CEE9;
 Tue, 20 May 2025 07:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747726887;
 bh=r4jX8Azs8v5DrAXiFmtO9nabjgP5A44o2RnL8fPrWS0=;
 h=From:To:Cc:Subject:Date:From;
 b=VN3W+A/zNLw3hbn2mYfVm8M2mhK4jjRrbg1rD16Y+KOcsugzsq81QflRKhkRXK8YY
 GJznMwZZ4h8U8C6z0mEmRn6i/PWXZ3LYzWO76PiDl9XN4SnEacBXlKIdjVyVtVnum1
 VvWQVotMJn7KAD9EXxY0br9afo9BZ+lbhbPaYfAUO1tirIBor5IhyW7BujYtpia7hS
 fLUvVkGb0FFvSDMWCgzLyvPQgG+onRkHBntwf/HImijHJus40H6QEfoGGfIhW+ijRH
 VQS1KBiu4cbl8TMczJz5rEtNqFAlsKFVNz/OpekFapfjv32pGhgqnRnbXfXeeNEMLC
 aF1Rl0KLq+z9Q==
From: Michael Walle <mwalle@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Michael Walle <mwalle@kernel.org>
Subject: [PATCH] drm/panel-simple: fix the warnings for the Evervision
 VGG644804
Date: Tue, 20 May 2025 09:41:10 +0200
Message-Id: <20250520074110.655114-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The panel lacked the connector type which causes a warning. Adding the
connector type reveals wrong bus_flags and bits per pixel. Fix all of
it.

Fixes: 1319f2178bdf ("drm/panel-simple: add Evervision VGG644804 panel entry")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 82ee2f12b8d2..0a3b26bb4d73 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2198,13 +2198,14 @@ static const struct display_timing evervision_vgg644804_timing = {
 static const struct panel_desc evervision_vgg644804 = {
 	.timings = &evervision_vgg644804_timing,
 	.num_timings = 1,
-	.bpc = 8,
+	.bpc = 6,
 	.size = {
 		.width = 115,
 		.height = 86,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
-	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
 static const struct display_timing evervision_vgg804821_timing = {
-- 
2.39.5

