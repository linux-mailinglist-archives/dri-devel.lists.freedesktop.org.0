Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E6CCDA3A2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 19:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0532310E29A;
	Tue, 23 Dec 2025 18:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="ka8V5seX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0266710E297
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 18:04:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766513045; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=L/kwjEaHzCRUNMi5m8EdjvSCdckMoTGOjLkr4/oyus2EaOnrbdm8icpRNaHjB4JTgBkxq0sNaEKNUC8FA7/sIFdR28jCXYVxXM0y4o5rb8dSr/kE6W7XddiBo9zGMoO6gqj2u+3xuSMPuyM4o0fmDgyMuh4UWndfF25YCMosBV8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766513045;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=xe7KX5/ffCktYxkt+30TjEUOn+MQMMGBLrHbUWsPl9A=; 
 b=BZ5RfP8yciLpoJHO5yiR7jSLiBzmlw32ms79z8jN7GO2fBYKsehAFNQlBUAUBIFEH5RkVuORku7802i8066Kkf+OivV//o1M18Kv8Tn9yiRxTkfH6eSxL1N9YBLZIZ3JPYREaxq2Y/V2V0mh7unKXX7Sk17T+0TSZ3c5x+EzfrU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766513045; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=xe7KX5/ffCktYxkt+30TjEUOn+MQMMGBLrHbUWsPl9A=;
 b=ka8V5seXaIF3CFDwLp1fSjmihLyggWSapuajig5Lp3cA9lYRQXCeQKEnw+r6ctiT
 qHq07Ns6yNJnghE+O7ULCUmzJ61rUHy7gIgkU/nmNy044lOHr8P5LYWg3l6lWEEY/Mt
 r1GEchNSGAy9zttWORY51DM4Wdujs5CaVbxsBhOE=
Received: by mx.zohomail.com with SMTPS id 1766513043096141.82196198415215;
 Tue, 23 Dec 2025 10:04:03 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:41 -0300
Subject: [PATCH v3 21/21] drm/vkms: Set CRTC color pipeline driver cap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-21-7d969f9a37a0@collabora.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=1111;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=gQFC766tccP0PdIOKUEQiK11Tirgc3AWqnqe3NzY2Vo=;
 b=jhCoAhoS0Grzt6YiW0jqVUY3CjSqOVgbkX+1ILgEPeIuZv3KL8AgIQhDVXL4s+BwVJfx/rX58
 WfyawBOXlioCmhneTj7YU6dIkWfgqUUZRpgwO7dSKkeV4Jxi++RNdL0
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

Now that the driver implements CRTC (post-blend) color pipelines, set
the driver cap so they can be used from userspace.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 39195540fe2b1..62cd36c805e45 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -94,7 +94,8 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 }
 
 static const struct drm_driver vkms_driver = {
-	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
+	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM |
+				  DRIVER_CRTC_COLOR_PIPELINE,
 	.fops			= &vkms_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,

-- 
2.51.0

