Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 750C81F244E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 01:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D406E9BD;
	Mon,  8 Jun 2020 23:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF04A6E9BD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 23:21:02 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D831E2074B;
 Mon,  8 Jun 2020 23:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658462;
 bh=aM9ULyBlhC/+a/IhZeB2y5rQYzwihJZCtyaLvol+r10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KpI9SkuxChi4ZiFJag8glRdInLAaAR4OU9SwNf74deBASHcZYV0ebkHfdhBafXnmi
 5E/MT/DGNC4yzUfYNhVLS4XqDg7j20PIzY5SdpTwjzY8DFP3mY15hCiA5JFdpY7dBe
 tsfnHGWMPUpxAH6239vtuxbymo2mQJ4tknjU8Y10=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 102/175] drm/vkms: Hold gem object while still
 in-use
Date: Mon,  8 Jun 2020 19:17:35 -0400
Message-Id: <20200608231848.3366970-102-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231848.3366970-1-sashal@kernel.org>
References: <20200608231848.3366970-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 syzbot+e3372a2afe1e7ef04bc7@syzkaller.appspotmail.com,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ezequiel Garcia <ezequiel@collabora.com>

[ Upstream commit 0ea2ea42b31abc1141f2fd3911f952a97d401fcb ]

We need to keep the reference to the drm_gem_object
until the last access by vkms_dumb_create.

Therefore, the put the object after it is used.

This fixes a use-after-free issue reported by syzbot.

While here, change vkms_gem_create() symbol to static.

Reported-and-tested-by: syzbot+e3372a2afe1e7ef04bc7@syzkaller.appspotmail.com
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20200427214405.13069-1-ezequiel@collabora.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vkms/vkms_drv.h |  5 -----
 drivers/gpu/drm/vkms/vkms_gem.c | 11 ++++++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 5a95100fa18b..03b05c54722d 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -121,11 +121,6 @@ struct drm_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 				  enum drm_plane_type type, int index);
 
 /* Gem stuff */
-struct drm_gem_object *vkms_gem_create(struct drm_device *dev,
-				       struct drm_file *file,
-				       u32 *handle,
-				       u64 size);
-
 vm_fault_t vkms_gem_fault(struct vm_fault *vmf);
 
 int vkms_dumb_create(struct drm_file *file, struct drm_device *dev,
diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_gem.c
index 6489bfe0a149..8ba8b87d0c99 100644
--- a/drivers/gpu/drm/vkms/vkms_gem.c
+++ b/drivers/gpu/drm/vkms/vkms_gem.c
@@ -95,10 +95,10 @@ vm_fault_t vkms_gem_fault(struct vm_fault *vmf)
 	return ret;
 }
 
-struct drm_gem_object *vkms_gem_create(struct drm_device *dev,
-				       struct drm_file *file,
-				       u32 *handle,
-				       u64 size)
+static struct drm_gem_object *vkms_gem_create(struct drm_device *dev,
+					      struct drm_file *file,
+					      u32 *handle,
+					      u64 size)
 {
 	struct vkms_gem_object *obj;
 	int ret;
@@ -111,7 +111,6 @@ struct drm_gem_object *vkms_gem_create(struct drm_device *dev,
 		return ERR_CAST(obj);
 
 	ret = drm_gem_handle_create(file, &obj->gem, handle);
-	drm_gem_object_put_unlocked(&obj->gem);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -140,6 +139,8 @@ int vkms_dumb_create(struct drm_file *file, struct drm_device *dev,
 	args->size = gem_obj->size;
 	args->pitch = pitch;
 
+	drm_gem_object_put_unlocked(gem_obj);
+
 	DRM_DEBUG_DRIVER("Created object of size %lld\n", size);
 
 	return 0;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
