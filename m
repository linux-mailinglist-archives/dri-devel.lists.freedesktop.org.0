Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FD73904BF
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 17:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1ED6EA5B;
	Tue, 25 May 2021 15:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01356EA48;
 Tue, 25 May 2021 15:11:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621955460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mc9NTeMuazcCtJ+aE4DVfTULbpMUye+p7AX2g+8grdg=;
 b=EyzYUg2dYQmf3RfWU/Cv0YarW2RUY0jDLf9Iq8A/tSYdN1E7ERHIsNpa320BRJLufNH4RH
 e+7cPMWInsqXhL3U4l/10e2LmHE6s8DzOcz9eyri3tEJOmIuB6AitZhSaTBt+BwkuxSNSB
 TXc9bXFoRIG6c5nWVjYyMrWWVy7+S0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621955460;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mc9NTeMuazcCtJ+aE4DVfTULbpMUye+p7AX2g+8grdg=;
 b=uCbkBQS4wLLzz5/RShM+IRc37COsVmErbRDjVtdqFX7N/vxEorXGiQoWdxVMqhlAxJcBiN
 yqRDF+ncYSd/w0DQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A6CAAEFB;
 Tue, 25 May 2021 15:11:00 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
Subject: [PATCH v4 6/7] drm/vmwgfx: Inline vmw_verify_access()
Date: Tue, 25 May 2021 17:10:54 +0200
Message-Id: <20210525151055.8174-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525151055.8174-1-tzimmermann@suse.de>
References: <20210525151055.8174-1-tzimmermann@suse.de>
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vmwgfx is the only user of the TTM's verify_access callback. Inline
the call and avoid the indirection through the function pointer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 9 ---------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c   | 7 ++-----
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 7bfe83c936ff..35b03fe21161 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -661,14 +661,6 @@ static void vmw_evict_flags(struct ttm_buffer_object *bo,
 	*placement = vmw_sys_placement;
 }
 
-static int vmw_verify_access(struct ttm_buffer_object *bo, struct file *filp)
-{
-	struct ttm_object_file *tfile =
-		vmw_fpriv((struct drm_file *)filp->private_data)->tfile;
-
-	return vmw_user_bo_verify_access(bo, tfile);
-}
-
 static int vmw_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *mem)
 {
 	struct vmw_private *dev_priv = container_of(bdev, struct vmw_private, bdev);
@@ -771,7 +763,6 @@ struct ttm_device_funcs vmw_bo_driver = {
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = vmw_evict_flags,
 	.move = vmw_move,
-	.verify_access = vmw_verify_access,
 	.swap_notify = vmw_swap_notify,
 	.io_mem_reserve = &vmw_ttm_io_mem_reserve,
 };
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
index c8b6543b4e39..e6b1f98ec99f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
@@ -67,6 +67,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 	};
 	struct drm_file *file_priv = filp->private_data;
 	struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
+	struct ttm_object_file *tfile = vmw_fpriv(file_priv)->tfile;
 	struct ttm_device *bdev = &dev_priv->bdev;
 	struct ttm_buffer_object *bo;
 	int ret;
@@ -78,11 +79,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 	if (unlikely(!bo))
 		return -EINVAL;
 
-	if (unlikely(!bo->bdev->funcs->verify_access)) {
-		ret = -EPERM;
-		goto out_unref;
-	}
-	ret = bo->bdev->funcs->verify_access(bo, filp);
+	ret = vmw_user_bo_verify_access(bo, tfile);
 	if (unlikely(ret != 0))
 		goto out_unref;
 
-- 
2.31.1

