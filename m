Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15A6A1D13D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 08:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB3410E495;
	Mon, 27 Jan 2025 07:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F6oRl9wP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEF810E495
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 07:11:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4EAA2A40B80;
 Mon, 27 Jan 2025 07:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26554C4CED2;
 Mon, 27 Jan 2025 07:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737961868;
 bh=jbkElb41o2w2SgRe5NYxjMlK/n+hh4hoG0XCEvONDAM=;
 h=From:To:Cc:Subject:Date:From;
 b=F6oRl9wP89kPQeMRFuTaBziV7+Jsk1lIrGW7359vj32IsgNEVOWb4e065UCtIovJj
 44fhprrhyJZaaQ7jICFLivbD1Cj6V4U6V1zAsb9Y9FSnzxJUV/5EfEjsyfbeIbmZuL
 DjSLyekX7NpIRUNSNtMsn2Aa52yGu7sHGHbAOkUAmoavj54vL6jM9S+SRIP2jvRiv/
 L3OWcqxUUe6c4bIB2sMnWpoTSZjvkOuYhNE9OvPsNqrP4hRmbfVk24KLKrjCmeyXol
 WX+mXTk7JtmelYLTUBJH6FIgzTgsVqfdNOOD8EXHcVk4ArMtlBmSEfvlV4rVXBFDeS
 KGrGYInEo5clg==
From: Arnd Bergmann <arnd@kernel.org>
To: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/hisilicon/hibmc: select CONFIG_DRM_DISPLAY_DP_HELPER
Date: Mon, 27 Jan 2025 08:10:02 +0100
Message-Id: <20250127071059.617567-1-arnd@kernel.org>
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

Without the DP helper code, the newly added displayport support
causes a link failure:

x86_64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.o: in function `hibmc_dp_aux_init':
dp_aux.c:(.text+0x37e): undefined reference to `drm_dp_aux_init'
x86_64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.o: in function `hibmc_dp_link_set_pattern':
dp_link.c:(.text+0xae): undefined reference to `drm_dp_dpcd_write'
x86_64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.o: in function `hibmc_dp_link_get_adjust_train':
dp_link.c:(.text+0x121): undefined reference to `drm_dp_get_adjust_request_voltage'
x86_64-linux-ld: dp_link.c:(.text+0x12e): undefined reference to `drm_dp_get_adjust_request_pre_emphasis'
x86_64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.o: in function `hibmc_dp_link_training':
dp_link.c:(.text+0x2b0): undefined reference to `drm_dp_dpcd_write'
x86_64-linux-ld: dp_link.c:(.text+0x2e3): undefined reference to `drm_dp_dpcd_write'

Add both DRM_DISPLAY_DP_HELPER and DRM_DISPLAY_HELPER, which is
in turn required by the former.

Fixes: 0ab6ea261c1f ("drm/hisilicon/hibmc: add dp module in hibmc")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
index 93b8d32e3be1..98d77d74999d 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
+++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
@@ -4,6 +4,8 @@ config DRM_HISI_HIBMC
 	depends on DRM && PCI
 	depends on MMU
 	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HELPER
+	select DRM_DISPLAY_DP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_VRAM_HELPER
 	select DRM_TTM
-- 
2.39.5

