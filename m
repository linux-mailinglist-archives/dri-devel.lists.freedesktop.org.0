Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E92B5049C2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 00:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B80C10E283;
	Sun, 17 Apr 2022 22:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D3010E12D
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 22:37:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 44C641F40EAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650235074;
 bh=AocJApo4ydFCVzv5kkL5J5T725jSrlmEEAg0KTvbJJ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XxYaf6SbIIT2JsBtHRD1b6DEtIV0jtTFZO33qLm0XQzbvV8nHNC/E3PAxvPMlj5un
 T5nz0IJ/0MMIMO6STTSRs/ZIhhPkPmwDEd024Uhg1nUKWCk69lkrdAccJ76O7YzJMb
 UQ0bnd7ZaU2ronhWuBgmHZ3XvIqDjEvl3fPFrVvnmBAdjDXKbYM1BA8aYHId3Da9mn
 xfk35CZfHFQQrCGCNEXlrx1j/2AiuLGjzPPtE3TSUs+Euc+KkC4QHerZDtd7+k87VV
 gCk+8gemnNqR7FVDNpq7G2+EHbgR2GJqYGtCllkFSNCLjT9/tbMSVkm1gCKEhY2KFa
 M3IzR3BN4qI1g==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v4 15/15] drm/shmem-helper: Remove drm_gem_shmem_purge()
Date: Mon, 18 Apr 2022 01:37:07 +0300
Message-Id: <20220417223707.157113-16-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220417223707.157113-1-dmitry.osipenko@collabora.com>
References: <20220417223707.157113-1-dmitry.osipenko@collabora.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_gem_shmem_purge() was added back in 2019 and never had a user
since then. GEM's purging is now managed by the generic shrinker and
only the "locked" variant of the function is wanted. Remove the obsoleted
function.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 11 -----------
 include/drm/drm_gem_shmem_helper.h     |  2 --
 2 files changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 6d83d11211fc..3695fdb24ac8 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -991,17 +991,6 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL(drm_gem_shmem_purge_locked);
 
-bool drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
-{
-	if (!dma_resv_trylock(shmem->base.resv))
-		return false;
-	drm_gem_shmem_purge_locked(shmem);
-	dma_resv_unlock(shmem->base.resv);
-
-	return true;
-}
-EXPORT_SYMBOL(drm_gem_shmem_purge);
-
 /**
  * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
  * @file: DRM file structure to create the dumb buffer for
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 84316c281292..91e97aa829a7 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -179,8 +179,6 @@ int drm_gem_shmem_swap_in_pages_locked(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_swap_in_locked(struct drm_gem_shmem_object *shmem);
 
 void drm_gem_shmem_evict_locked(struct drm_gem_shmem_object *shmem);
-
-bool drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem);
 
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
-- 
2.35.1

