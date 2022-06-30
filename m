Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B2C5623DF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8699D12B1C4;
	Thu, 30 Jun 2022 20:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C2912B1AE
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:08:04 +0000 (UTC)
Received: from dimapc.. (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0FDB36601A30;
 Thu, 30 Jun 2022 21:08:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656619682;
 bh=MzOopUjJq3tk9V0f5TEz4iy0ZSBWZue9l9nRV9B/kW0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HZ2vEXyX6KuWca354KrOgnGHyT+xu7SMFjusgPN/9keJ8LE+JhEw7LnrxBV6uKqAk
 6iipIku0v1dHqDmfxAGQVgL1qO3fCF0ypHceRs13DjidPz6xggB12PxSUsxTXuKZOS
 3xgxGRmnjKR+EetH5Cw7Bx1UwBeSEYeBfP1YfFf1s8eW4pYMbJDcGjoiifyTkFqeYV
 H+UvLu7JXTDwOSMzK8QXi8wupToEn2nEMlNhgTSbF8sCc7WT81MNzj6qrS2qDNlZc9
 sCfyeRhge8Hm5WLvGHp6CJ/gJit4UkqGtb1x/JjGSoxdKz7p7CKy+exn/TR55BGXpS
 5iicLRtUphgEA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Subject: [PATCH v7 9/9] drm/virtio: Return proper error codes instead of -1
Date: Thu, 30 Jun 2022 23:07:26 +0300
Message-Id: <20220630200726.1884320-10-dmitry.osipenko@collabora.com>
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

Don't return -1 in error cases, return proper error code. The returned
error codes propagate to error messages and to userspace and it's always
good to have a meaningful error number for debugging purposes.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index ee84256946ab..9ff8660b50ad 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -322,7 +322,7 @@ static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 		if (fence && vbuf->objs)
 			virtio_gpu_array_unlock_resv(vbuf->objs);
 		free_vbuf(vgdev, vbuf);
-		return -1;
+		return -ENODEV;
 	}
 
 	if (vgdev->has_indirect)
@@ -386,7 +386,7 @@ static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 			if (!sgt) {
 				if (fence && vbuf->objs)
 					virtio_gpu_array_unlock_resv(vbuf->objs);
-				return -1;
+				return -ENOMEM;
 			}
 
 			elemcnt += sg_ents;
@@ -720,7 +720,7 @@ static int virtio_get_edid_block(void *data, u8 *buf,
 	size_t start = block * EDID_LENGTH;
 
 	if (start + len > le32_to_cpu(resp->size))
-		return -1;
+		return -EINVAL;
 	memcpy(buf, resp->edid + start, len);
 	return 0;
 }
-- 
2.36.1

