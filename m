Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11404675922
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 16:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B426510E013;
	Fri, 20 Jan 2023 15:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C344E10E013
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 15:53:25 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown
 [IPv6:2a01:e0a:120:3210:39c:df77:ee30:30ed])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1516D660230B;
 Fri, 20 Jan 2023 15:53:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674230004;
 bh=Cp5VUuqqJWZfxAGM2uaTUY9gCqzgtCRO8doDbJe8GqU=;
 h=From:To:Cc:Subject:Date:From;
 b=M9FJRCXumXZyllfBUymJDAg/xqqBxgux2WaLhsqhCKIrAjfXjcilBwr7G1XiPTcbg
 9sHeggBzESOuYrHxZDbzQ2iRMtL/okHAY2zis9Nrkq9J4i/cvMbvJIJtQmilvUzzh/
 BCupkNeJhvg3EJj+bXpTuEAKvx3+pacIZI8A1hR513p7pwVSy6bqy1j1IMuOC4Zz3P
 TTr74jFzrH8J/ShW9G7RPd4jAOSYzWikhEUFmcy43YO4aWUQ+6xPVSWYRE7nYxZNRb
 Aua1yVCinmdNZ9p2wpiW4EvHBwBuZLWWzDqmV9QUQRtaMKDBGdMRQKjqaq6AJg2kV6
 nqhNuUrOK0PNw==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 airlied@gmail.com, daniel@ffwll.ch, krzysztof.kozlowski@linaro.org,
 alim.akhtar@samsung.com, m.szyprowski@samsung.com
Subject: [PATCH] drm: exynos: Make g2d_open() and g2d_close() static
Date: Fri, 20 Jan 2023 16:53:17 +0100
Message-Id: <20230120155317.819786-1-benjamin.gaignard@collabora.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix "no previous prototype" warning when compiling with W=1 by making
the functions static like the ones above them.

Fixes: eb4d9796fa34 ("drm/exynos: g2d: Convert to driver component API")
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.h b/drivers/gpu/drm/exynos/exynos_drm_g2d.h
index 74ea3c26dead..4631c0579fb9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.h
@@ -34,11 +34,11 @@ static inline int exynos_g2d_exec_ioctl(struct drm_device *dev, void *data,
 	return -ENODEV;
 }
 
-int g2d_open(struct drm_device *drm_dev, struct drm_file *file)
+static int g2d_open(struct drm_device *drm_dev, struct drm_file *file)
 {
 	return 0;
 }
 
-void g2d_close(struct drm_device *drm_dev, struct drm_file *file)
+static void g2d_close(struct drm_device *drm_dev, struct drm_file *file)
 { }
 #endif
-- 
2.34.1

