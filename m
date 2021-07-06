Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6203BCEF9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280386E441;
	Tue,  6 Jul 2021 11:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEF26E441
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:26:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99A3461C9B;
 Tue,  6 Jul 2021 11:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570816;
 bh=4SACsFJG8/9jJecMl2IR/V5GA4+8aU0CP4m8Q7Ajasg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C6WUn1zChwRjp/VLW54vZl0rdCa5+2/a87A3XtqaAk2FP2OAtcQ0UE1nML744vOye
 6Sg+Iwe05fOsXFCz1J0xD0KdEDmJA4PbpTyRpNYbq4Ql8m2cxQQCA22xFFZN6q4Wg7
 0qxZgBFjNXeRkgDbuuvNdk80moP3tcFSfVyaZMejJhPL0G72FWXAfExcSKUkKOCErO
 ZCh6Ns9+YAmW/ZRzp7gPD98plHQE+ethGpzuuciKMTvV1vvux/fRD9jva5Unn3Pd+1
 PEYhzvU3JpG2c/ZTzpBPezlXANdftnASbF+a7RDD38Hc6tpKgFYba82Hb6B5ei7uWV
 kHzrq9BljUsJQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 13/55] drm/virtio: Fixes a potential NULL pointer
 dereference on probe failure
Date: Tue,  6 Jul 2021 07:25:56 -0400
Message-Id: <20210706112638.2065023-13-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112638.2065023-1-sashal@kernel.org>
References: <20210706112638.2065023-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Xie Yongji <xieyongji@bytedance.com>,
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xie Yongji <xieyongji@bytedance.com>

[ Upstream commit 17f46f488a5d82c5568e6e786cd760bba1c2ee09 ]

The dev->dev_private might not be allocated if virtio_gpu_pci_quirk()
or virtio_gpu_init() failed. In this case, we should avoid the cleanup
in virtio_gpu_release().

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20210517084913.403-1-xieyongji@bytedance.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 22397a23780c..2cfd0016bd70 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -261,6 +261,9 @@ void virtio_gpu_driver_unload(struct drm_device *dev)
 	flush_work(&vgdev->config_changed_work);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
 
+	if (!vgdev)
+		return;
+
 	virtio_gpu_modeset_fini(vgdev);
 	virtio_gpu_ttm_fini(vgdev);
 	virtio_gpu_free_vbufs(vgdev);
-- 
2.30.2

