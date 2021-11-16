Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C050453A07
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 20:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61EC6E118;
	Tue, 16 Nov 2021 19:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339286E118
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 19:18:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38CD363222;
 Tue, 16 Nov 2021 19:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637090295;
 bh=pUC+/2H427L7tAVUY+8YM20rMCV65nBnq4xSfR84FZc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JCYF0xNMcHupOKf6Hr+F6U5NfWBleIffhW0+44H/V9ffQkJ1IXwiRD0NJ3wUDdxa6
 XaqtSN9guUF7nX1EvzKRqR9w2PaocSCa6nGd86S77iUjhSS5OONB0XFMY748WxNFO+
 +RfTCHfU4xVLWjyz9sk+oDOOU2UHNwaBGhak487XgRc56KBg1gf8h/vHcEYxnXJu5u
 uSc4qqag99QggJWHPGbbw8/KWZygXeHw6uL/rkVm94Qo50Ni7p/lfVY7HBugEAM/Rg
 5GxliFPB+HT1EZaG5LG9LQ4AQkFIwvqfQpOM1xi/nq6oSvVWjFKrM//XD2A6D9FO/l
 SNDzoaDSQ0rLg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 08/65] drm/virtio: fix the missed
 drm_gem_object_put() in virtio_gpu_user_framebuffer_create()
Date: Tue, 16 Nov 2021 14:16:53 -0500
Message-Id: <20211116191754.2419097-8-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211116191754.2419097-1-sashal@kernel.org>
References: <20211116191754.2419097-1-sashal@kernel.org>
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

