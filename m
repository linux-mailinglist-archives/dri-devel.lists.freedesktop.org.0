Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CCA99DF54
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 09:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2231610E52A;
	Tue, 15 Oct 2024 07:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c5RxPUCr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA43710E51C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 07:31:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 066FF5C5CA3;
 Tue, 15 Oct 2024 07:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2E8C4CEC7;
 Tue, 15 Oct 2024 07:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728977481;
 bh=Q9g8DeRx0E0haActJkNDnfZjJ2WLhwa/6Ap91qIZX7M=;
 h=From:To:Cc:Subject:Date:From;
 b=c5RxPUCreYGHsx0j/dGQl6LL7wZ+FBGyDJ3m+SJVfIjuxcL5IJSxhkVW/9n79cAyU
 /dLhI0uvfp4UbECZ6JF7FmLB5lNrKbCyS5wueTrIyrUsVfe3Jj5x1gJ8rPt9DxNdP2
 v9vQzRbheD1QYTC8mN2R4uP/L6HrvKNS8D0Iuf/s27HNYNTEzX18+tcvcokt8IWCkH
 +/aniVFuzpCT4Vgd3xSo/xWzKC6x2SJ/YwVHNCf1cwotSTWkMT15DbPYJYRYx/Dhg+
 7S6T0ONzw1hOrru5DkSlDF4oH/xmy/isQYFZ2M6/c0YEzCH016s/RUOrsJkxxL+S3w
 ytOKF3BweUOHA==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: s6e3ha8: select CONFIG_DRM_DISPLAY_DSC_HELPER
Date: Tue, 15 Oct 2024 07:30:50 +0000
Message-Id: <20241015073115.4128727-1-arnd@kernel.org>
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

From: Arnd Bergmann <arnd@arndb.de>

The new driver needs the dsc helper code to be available:

x86_64-linux-ld: vmlinux.o: in function `s6e3ha8_amb577px01_wqhd_prepare':
panel-samsung-s6e3ha8.c:(.text+0x16b1e65): undefined reference to `drm_dsc_pps_payload_pack'

Select it from Kconfig as we do for other similar drivers.

Fixes: 779679d3c164 ("drm/panel: Add support for S6E3HA8 panel driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/panel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ddfaa99ea9dd..ffe7eff71496 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -626,6 +626,7 @@ config DRM_PANEL_SAMSUNG_AMS639RQ08
 config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
 	tristate "Samsung AMS452EF01 panel with S6E88A0 DSI video mode controller"
 	depends on OF
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_MIPI_DSI
 	select VIDEOMODE_HELPERS
 
-- 
2.39.5

