Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 535844539C0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 20:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9D06E111;
	Tue, 16 Nov 2021 19:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CD66E0FB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 19:05:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 148D56321B;
 Tue, 16 Nov 2021 19:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637089505;
 bh=pUC+/2H427L7tAVUY+8YM20rMCV65nBnq4xSfR84FZc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=arWDxm81MhlbXKoc6f9V25if+gxL5Fjf6hKZbroC6mJOnpdJVyv20RJvFA00Jt/aN
 kDsO78F+7Ueg3j1OE3PMDqmexiiaI+ufVrbBt+aPK+jH8roAZf/fU4vdj9hdgkCh5y
 EBFpR9ZT/vHA/tmAs9Hx0tmmx1svYpssTEDLsf+zO0AFpZLlOPJgXwVoJrK5Ux4Fep
 Yn1hmu6kGH6HuVE8E1+CEROqEV2TEV6XS3Bt74abSMp1JHx9FxGS4QpM3oDObylhyX
 YoZ91Z6NsGnqg4ylp+Mx7BTPV9IEqJxMN9lZLhssmFBTu8xyVYy4VOT86FnqHqRDwx
 9kcz7Dh0DJW1A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 08/65] drm/virtio: fix the missed
 drm_gem_object_put() in virtio_gpu_user_framebuffer_create()
Date: Tue, 16 Nov 2021 14:03:28 -0500
Message-Id: <20211116190443.2418144-8-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211116190443.2418144-1-sashal@kernel.org>
References: <20211116190443.2418144-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Jing Xiangfeng <jingxiangfeng@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jing Xiangfeng <jingxiangfeng@huawei.com>

[ Upstream commit a63f393dd7e1ebee707c9dee1d197fdc33d6486b ]

virtio_gpu_user_framebuffer_create() misses to call drm_gem_object_put()
in an error path. Add the missed function call to fix it.

Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
Link: http://patchwork.freedesktop.org/patch/msgid/1633770560-11658-1-git-send-email-jingxiangfeng@huawei.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index a6caebd4a0dd6..5b00310ac4cd4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -308,8 +308,10 @@ virtio_gpu_user_framebuffer_create(struct drm_device *dev,
 		return ERR_PTR(-EINVAL);
 
 	virtio_gpu_fb = kzalloc(sizeof(*virtio_gpu_fb), GFP_KERNEL);
-	if (virtio_gpu_fb == NULL)
+	if (virtio_gpu_fb == NULL) {
+		drm_gem_object_put(obj);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	ret = virtio_gpu_framebuffer_init(dev, virtio_gpu_fb, mode_cmd, obj);
 	if (ret) {
-- 
2.33.0

