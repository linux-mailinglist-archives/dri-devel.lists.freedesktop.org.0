Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3273BCDFA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C0F6E3EC;
	Tue,  6 Jul 2021 11:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752DC6E3EC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:22:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C35D61D00;
 Tue,  6 Jul 2021 11:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570553;
 bh=t+WR/nCFP0tngsNLIaNM1FbBfFvCfQ7k0s1hVT10z28=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DEL0Cou3XpAhGqLg4kX6XmOVZ9sEOGO25Vw4J90BwvH2sL2Yn+xonYoorZeXYiFrl
 9gHagRAsJ9N0U8xrZsUey13vyxYfbzgKkAyHsekHzvOto3cMNkVJBbL4ymyoZit8B1
 Wx7SES2Yn/TXLtu1PRn3d8LG+nryjUkgjC4WzuJKtJWgATzQZRHRQYMTjb9hkaR2w9
 jo8ufqw7ITWn9fw2EZnoPFssgRW/eHo4NpwZohVHABclcyOnchVMecRZbSBbEmeZVw
 vu3UX5wpx/AQrUlQooM5BBe+ceuizhGMXXoej//aXnGrc7/Opplov0skdo5hLjfvAv
 8wNGDR61uVl9A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 022/137] drm/virtio: Fix double free on probe
 failure
Date: Tue,  6 Jul 2021 07:20:08 -0400
Message-Id: <20210706112203.2062605-22-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112203.2062605-1-sashal@kernel.org>
References: <20210706112203.2062605-1-sashal@kernel.org>
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

[ Upstream commit cec7f1774605a5ef47c134af62afe7c75c30b0ee ]

The virtio_gpu_init() will free vgdev and vgdev->vbufs on failure.
But such failure will be caught by virtio_gpu_probe() and then
virtio_gpu_release() will be called to do some cleanup which
will free vgdev and vgdev->vbufs again. So let's set dev->dev_private
to NULL to avoid double free.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20210517084913.403-2-xieyongji@bytedance.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 5e716199ccee..618e46afcfc7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -209,6 +209,7 @@ int virtio_gpu_init(struct drm_device *dev)
 err_vbufs:
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
 err_vqs:
+	dev->dev_private = NULL;
 	kfree(vgdev);
 	return ret;
 }
-- 
2.30.2

