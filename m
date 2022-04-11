Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4504FC762
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 00:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E6510E0F3;
	Mon, 11 Apr 2022 22:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D9310E0F3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 22:10:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 95EDA1F43004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649715020;
 bh=xxZbbQGzl20wgM6d48ErpqWnBvlaGA/mCsp0j9sfpCE=;
 h=From:To:Cc:Subject:Date:From;
 b=eVs86J7D1KP/BKWl17TbYF7v7xgUT4XhqMnyhrHM5QOzKLhnbPKG147HmWDu/cIQY
 x29Wrtn3FfHAfYeKFG6M8SYsbZinxtoIWozK7p/0/Iu1AgTiqCebVU0qD4Xdqqxy2+
 gqXSW+QJOCBtBSR4ndgGHF9hn+YlZlbVUdsJjmLGKsUKQxfzz4ZQ+nYMrDqeWmEJc9
 nF/e5XQc//gsXd5Fw3XNWZoVmBKf3WKrHh34IAtpF0hqcsHXLEUOFl2BgNIHCBGGsX
 N4u/UfCxSNFENPKcEuzNYrhK7Bs/DLqKtu1+ixbxe6kr6FHm8LsqZhCTAcn6JdIyAi
 /KgEfv56agtDw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH v1] drm/gem: Properly annotate WW context on
 drm_gem_lock_reservations() error
Date: Tue, 12 Apr 2022 01:09:55 +0300
Message-Id: <20220411220955.282617-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use ww_acquire_fini() in the error code paths. Otherwise lockdep
thinks that lock is held when lock's memory is freed after the
drm_gem_lock_reservations() error. The WW needs to be annotated
as "freed", which fixes the noisy "WARNING: held lock freed!" splat
of VirtIO-GPU driver with CONFIG_DEBUG_MUTEXES=y and enabled lockdep.

Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index eb0c2d041f13..86d670c71286 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1226,7 +1226,7 @@ drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
 		ret = dma_resv_lock_slow_interruptible(obj->resv,
 								 acquire_ctx);
 		if (ret) {
-			ww_acquire_done(acquire_ctx);
+			ww_acquire_fini(acquire_ctx);
 			return ret;
 		}
 	}
@@ -1251,7 +1251,7 @@ drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
 				goto retry;
 			}
 
-			ww_acquire_done(acquire_ctx);
+			ww_acquire_fini(acquire_ctx);
 			return ret;
 		}
 	}
-- 
2.35.1

