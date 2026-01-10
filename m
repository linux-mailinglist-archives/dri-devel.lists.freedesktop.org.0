Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD754D0D894
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 16:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A3710E0A4;
	Sat, 10 Jan 2026 15:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nabladev.com header.i=@nabladev.com header.b="YBk+EmSv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544FB10E0A4
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 15:27:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 392B4103478; Sat, 10 Jan 2026 16:27:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1768058874; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=jPuCYz9M+uS+LPyzVn6gpI54syQVbiK+1G5ZGXrjAeI=;
 b=YBk+EmSvl6cMfa/yJiRh8yDvKSH9+w+Y62/z7nF4Ji4Jm5jPW9LHQpMAC2Zefy9kFRXiut
 9MA3peqFkvGfvgcS/i4pcIbbCSx8jtaiYgk2T41TobuODZyU5YOPk+Xo1dpCP3DaWcIsEV
 7somRUZfuI5pdHqOegvl4kd3OjTxXFZx46Iw3NzYTwx4fRHVRTgz/3CB2KccBzmyjGDhEl
 94AaCSa0HSxDNU5WgJfRifK3i9RkJ688MlueWtBagcJDEApTUoa3zF1uUndplvAJuCWF0N
 fP871G7A8lvHq7VJv7uiBbBZjdIigf2yOsD2+xoFNreN+Wf6jJPfDxy9EsBU0w==
From: Marek Vasut <marex@nabladev.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@nabladev.com>, stable@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 kernel@dh-electronics.com, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel-simple: fix connector type for DataImage
 SCF0700C48GGU18 panel
Date: Sat, 10 Jan 2026 16:27:28 +0100
Message-ID: <20260110152750.73848-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

The connector type for the DataImage SCF0700C48GGU18 panel is missing and
devm_drm_panel_bridge_add() requires connector type to be set. This leads
to a warning and a backtrace in the kernel log and panel does not work:
"
WARNING: CPU: 3 PID: 38 at drivers/gpu/drm/bridge/panel.c:379 devm_drm_of_get_bridge+0xac/0xb8
"
The warning is triggered by a check for valid connector type in
devm_drm_panel_bridge_add(). If there is no valid connector type
set for a panel, the warning is printed and panel is not added.
Fill in the missing connector type to fix the warning and make
the panel operational once again.

Cc: stable@vger.kernel.org
Fixes: 97ceb1fb08b6 ("drm/panel: simple: Add support for DataImage SCF0700C48GGU18")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: kernel@dh-electronics.com
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3acc9f3dac16a..e33ee2308e715 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1900,6 +1900,7 @@ static const struct panel_desc dataimage_scf0700c48ggu18 = {
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
 static const struct display_timing dlc_dlc0700yzg_1_timing = {
-- 
2.51.0

