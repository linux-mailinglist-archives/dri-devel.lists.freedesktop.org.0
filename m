Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED474D18F7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 14:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87CE10E555;
	Tue,  8 Mar 2022 13:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF6010E558
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 13:17:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 07A121F44057
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646745460;
 bh=0Mvk1IbY4ynFDHSPlmHlslCnsE7WaqbmgIPWG1EbnKE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kaqgtcgzu26X8gQF1ipy3eQWvpRAnS5s0mwVRyvOhE9uMfheAJorIXQP6iA8ADpfK
 dtaOS3hLwFB67I/L8D5kLY/JdZ998dx5IXDMneiruQ70BgEzYUW9OD9XYCPCHrj1U3
 PksSyvVwgTl0VwmCEBLWDtUgV49bxU7Zj6wRundPjSHyezSM4N5dm3QCCmzfuOkZhd
 wrM67efRYYhg9AK7eUo83EHjjvW5Zh3EN7SYWkb6Im8hEnxgNTf6MrZ+nD1BHFTX7H
 Zf8H5D4MJSs5Au7ZdBDPvsMR0RUPmMqntsq+2lWzg32jhc6Acl3vKvrw8tksrWAlsa
 LBMwo/hQx4YCw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH v1 3/5] drm/virtio: Unlock GEM reservations in error code path
Date: Tue,  8 Mar 2022 16:17:23 +0300
Message-Id: <20220308131725.60607-4-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlock reservations in the error code path of virtio_gpu_object_create()
to silence debug warning splat produced by ww_mutex_destroy(&obj->lock)
when GEM is released with the held lock.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index bea7806a3ae3..0b8cbb87f8d8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -250,6 +250,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
 	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
 	if (ret != 0) {
+		if (fence)
+			virtio_gpu_array_unlock_resv(objs);
 		virtio_gpu_array_put_free(objs);
 		virtio_gpu_free_object(&shmem_obj->base);
 		return ret;
-- 
2.35.1

