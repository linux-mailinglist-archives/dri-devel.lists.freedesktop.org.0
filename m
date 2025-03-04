Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51938A4E0DF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F89010E60C;
	Tue,  4 Mar 2025 14:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gU/b9v4A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3594D10E5FD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:29:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 87444A455D7;
 Tue,  4 Mar 2025 14:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B88EC4CEE5;
 Tue,  4 Mar 2025 14:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741098553;
 bh=khdG65bPlGvNQL4Lss2vc1W5hJeqULPsPGO4kSfUOOE=;
 h=From:To:Cc:Subject:Date:From;
 b=gU/b9v4AVvPUXBnn+BB6c9u5mTLIBgVJoceQLI2ZCuGQdIjqsF4IsNKGyDbPsR/Xu
 YrPfLzGU24s7tVZ+/dF7z3Lbg1ph+6zA1C7yCsJq/giRpTO/kWtfVa2xIy3ZQb91sO
 qRxHyYlYO/bvOlTK1Q11NlbIY9Gx9RfVsznsnqzfOVftiTuUWszFI1b4OxWpFm7M8y
 xNeQtb3+tVdcovbE1Fghmuduid5JsUnpCScStMN94RAkm7NqnFkKre6mefEJ6lyTxt
 uz8qK0CHewetnlN1CEV0PNj2204xS7CjBjBuOhE4Qt+tTUVOyezJbU3xZk7jCQREgo
 rEYWCh1E30+vQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Danila Tikhonov <danila@jiaxyga.com>,
 Eugene Lepshy <fekz115@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Wronek <david@mainlining.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: fix Visionox RM692E5 dependencies
Date: Tue,  4 Mar 2025 15:29:02 +0100
Message-Id: <20250304142907.732196-1-arnd@kernel.org>
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

The newly added driver uses the DSC helpers, so the corresponding
Kconfig option must be enabled:

ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-visionox-rm692e5.ko] undefined!

Fixes: 7cb3274341bf ("drm/panel: Add Visionox RM692E5 panel driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/panel/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 5927806cb4a9..e059b06e0239 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -1020,6 +1020,8 @@ config DRM_PANEL_VISIONOX_RM692E5
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DSC_HELPER
+	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for Visionox RM692E5 amoled
 	  display panels, such as the one found in the Nothing Phone (1)
-- 
2.39.5

