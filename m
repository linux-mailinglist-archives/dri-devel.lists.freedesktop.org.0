Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 661FA5623CB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AC310EDB0;
	Thu, 30 Jun 2022 20:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DCA10E4BF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:04:42 +0000 (UTC)
Received: from dimapc.. (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A469D6601970;
 Thu, 30 Jun 2022 21:04:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656619481;
 bh=7x6AJ+nAU7oVPHACGhPnUxGYHzyBq1CqfYXDnLu1/Bc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GdilAPDMiQL2cL9J6NfgbXiDGvtR3aTAgsa6i/2P28x3LXUBV8BnYibscyqslf2No
 oZoMmND3Suw/SkhTu1krlX0+ClE/nke8PC0nyp4S4SHXTcr+tCn+m/9A1xlkkiI2p0
 wK1+u3wMeb7HUgtDnAydupo1fnTyiM+t8YEf6C6LHUs3LqkKiBPU0LjgKbJYQWhU0R
 z+bEhhoA4OiLA8Jpb5BgouG8icauonG7SrKTUnII34RigUIG+RCcoZSugCTgV/IrPy
 oUOTbjzq/KaSgL4Mscnx6ANgIg9v5bUUrMIp1++NEbsyOWpiNZ/P2tKnfy9JpUFgV7
 v0C1udTPtZySQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Subject: [PATCH v7 1/2] drm/gem: Properly annotate WW context on
 drm_gem_lock_reservations() error
Date: Thu, 30 Jun 2022 23:04:04 +0300
Message-Id: <20220630200405.1883897-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630200405.1883897-1-dmitry.osipenko@collabora.com>
References: <20220630200405.1883897-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use ww_acquire_fini() in the error code paths. Otherwise lockdep
thinks that lock is held when lock's memory is freed after the
drm_gem_lock_reservations() error. The ww_acquire_context needs to be
annotated as "released", which fixes the noisy "WARNING: held lock freed!"
splat of VirtIO-GPU driver with CONFIG_DEBUG_MUTEXES=y and enabled lockdep.

Cc: stable@vger.kernel.org
Fixes: 7edc3e3b975b5 ("drm: Add helpers for locking an array of BO reservations.")
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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
2.36.1

