Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD825623D9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C80A12B1AA;
	Thu, 30 Jun 2022 20:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F366212B1A2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:07:54 +0000 (UTC)
Received: from dimapc.. (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DFFA36601970;
 Thu, 30 Jun 2022 21:07:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656619673;
 bh=3p9Ax8YAOsHUmi2qoBP7nReTf2A79FyPDDyD8wxhcZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SzwraIxSbXHVLJwmwaTh203yYwrP6halqYrD0iBg+mhiqm/+dZOWo6xH4ZpF+OJCU
 517Ju1mDMlDAZG00gsgFMTApSFrsdbcHF4wL08QIxAAZVLYeuC0ulWIhStDJw4by8X
 OVetO6dF2Z8wRHl4vqT0AXNQ14BQS2WGEGanViMyxi+iHLMS1oceELmWNS86GLpCP+
 7OZ0oGqnCVZHX+QHfLgfwi9z2oHEehEelMuvL77nlOpTMu00vpPdtEiSVe7wwNjMvV
 sLwjV89b9+PIdxOf5Ogd+FDIP11u2NCDU/yAy55f4Sv3kWiH6tp8vyNz4djToLOcfw
 FUpnsyU76OZFA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Subject: [PATCH v7 1/9] drm/virtio: Correct drm_gem_shmem_get_sg_table() error
 handling
Date: Thu, 30 Jun 2022 23:07:18 +0300
Message-Id: <20220630200726.1884320-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630200726.1884320-1-dmitry.osipenko@collabora.com>
References: <20220630200726.1884320-1-dmitry.osipenko@collabora.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previous commit fixed checking of the ERR_PTR value returned by
drm_gem_shmem_get_sg_table(), but it missed to zero out the shmem->pages,
which will crash virtio_gpu_cleanup_object(). Add the missing zeroing of
the shmem->pages.

Fixes: c24968734abf ("drm/virtio: Fix NULL vs IS_ERR checking in virtio_gpu_object_shmem_init")
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 1cc8f3fc8e4b..87b19b3b96e0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -170,6 +170,7 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	shmem->pages = drm_gem_shmem_get_sg_table(&bo->base);
 	if (IS_ERR(shmem->pages)) {
 		drm_gem_shmem_unpin(&bo->base);
+		shmem->pages = NULL;
 		return PTR_ERR(shmem->pages);
 	}
 
-- 
2.36.1

