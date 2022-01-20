Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E537494EFB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 14:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2242510E80D;
	Thu, 20 Jan 2022 13:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B65110E7FF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 13:27:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so13749704wmq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 05:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZOOWkC73PSVhRT0FPLika7h1bqOJ9nqV8+v2bYOzvlk=;
 b=UBR2K0LXvA6q899ewEbk5cHXPN48CBhwnITW5+jzl0QjmWV4iUrZb/m03lc7Gtr95N
 mSQGCb5n/WTibjCZila+49evvjycum7p6RnIs9Ql+cd8XjbQneAgi8RyXTKFvsr6sVAG
 JZ5Kx1SyVFNKI4FpZTIrFXExgq4ffuW5MLys+9mhhflDP4wkEoKN1bv6CbvK1jdqTXYj
 MM1rvnDpr+lmWbvTDIGoUonqrRWpeHZ6x/KibtCpJ5inlWamxxvdvnYHUfMk75BzTJRO
 nKTmjOIf8CMk/ILyJMF+6GX4QkCRot2n37FZpHQaJYKwGzMpHNggsSgJS4HrQKVtbYbg
 jqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZOOWkC73PSVhRT0FPLika7h1bqOJ9nqV8+v2bYOzvlk=;
 b=KEzLWs0MDE4RzuPSsp3IXD12n//bbce82lV99Ww+FACckubBI3Ryg9v0070q0zJdSn
 83K5+ZQX+/NfYjK/dyvA77TuxtnATQ7Z+TzazLZMQIIXzWZfXrsmF3SyqRFrVqd4OXwl
 kw94pC02ArF7IXFMXkKO+G4JMz4zkHkEr9qcXSiWklGByF3JZUUuExsp9REyoSKi8Ff+
 MduxmGpgtFVP7B1Lk8GFvUn0AC26FMGso3LzJoH7/PANgakY3+bxhY7cNz2leKVLfhVx
 WxfoXt/hLXxjvbXhKawDacrIO1BWvgYEjRK2GVuLqaUvekDG3rDs98aVXz/p61iH3RmQ
 Z9lA==
X-Gm-Message-State: AOAM533bJuTF3yyTV1JXsRCeJzBG24i3VmJkTUsPWzVrC42r0y1kTtP0
 qG0G4EuBsqxdzow0br+nWd4=
X-Google-Smtp-Source: ABdhPJwbsld08mlMfr/IBFDjNumOb6sFSstlPEWRopfXeMgcdFI3eq3KdHI69f9plBqiIWu/mX9OQQ==
X-Received: by 2002:a5d:6e83:: with SMTP id k3mr7256083wrz.506.1642685276730; 
 Thu, 20 Jan 2022 05:27:56 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id a9sm2658454wmm.32.2022.01.20.05.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 05:27:56 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 9/9] drm/vmwgfx: remove vmw_wait_dma_fence
Date: Thu, 20 Jan 2022 14:27:47 +0100
Message-Id: <20220120132747.2348-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120132747.2348-1-christian.koenig@amd.com>
References: <20220120132747.2348-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Decomposing fence containers don't seem to make any sense here.

So just remove the function entirely and call dma_fence_wait() directly.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c   | 46 -------------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.h   |  3 --
 3 files changed, 1 insertion(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 44ca23b0ea4e..0ff28f0e3eb4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -4500,7 +4500,7 @@ int vmw_execbuf_ioctl(struct drm_device *dev, void *data,
 			goto mksstats_out;
 		}
 
-		ret = vmw_wait_dma_fence(dev_priv->fman, in_fence);
+		ret = dma_fence_wait(in_fence, true);
 		if (ret)
 			goto out;
 	}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index c60d395f9e2e..430f83a1847c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -621,52 +621,6 @@ int vmw_user_fence_create(struct drm_file *file_priv,
 	return ret;
 }
 
-
-/**
- * vmw_wait_dma_fence - Wait for a dma fence
- *
- * @fman: pointer to a fence manager
- * @fence: DMA fence to wait on
- *
- * This function handles the case when the fence is actually a fence
- * array.  If that's the case, it'll wait on each of the child fence
- */
-int vmw_wait_dma_fence(struct vmw_fence_manager *fman,
-		       struct dma_fence *fence)
-{
-	struct dma_fence_array *fence_array;
-	int ret = 0;
-	int i;
-
-
-	if (dma_fence_is_signaled(fence))
-		return 0;
-
-	if (!dma_fence_is_array(fence))
-		return dma_fence_wait(fence, true);
-
-	/* From i915: Note that if the fence-array was created in
-	 * signal-on-any mode, we should *not* decompose it into its individual
-	 * fences. However, we don't currently store which mode the fence-array
-	 * is operating in. Fortunately, the only user of signal-on-any is
-	 * private to amdgpu and we should not see any incoming fence-array
-	 * from sync-file being in signal-on-any mode.
-	 */
-
-	fence_array = to_dma_fence_array(fence);
-	for (i = 0; i < fence_array->num_fences; i++) {
-		struct dma_fence *child = fence_array->fences[i];
-
-		ret = dma_fence_wait(child, true);
-
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
-
 /*
  * vmw_fence_fifo_down - signal all unsignaled fence objects.
  */
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
index 079ab4f3ba51..a7eee579c76a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
@@ -104,9 +104,6 @@ extern int vmw_user_fence_create(struct drm_file *file_priv,
 				 struct vmw_fence_obj **p_fence,
 				 uint32_t *p_handle);
 
-extern int vmw_wait_dma_fence(struct vmw_fence_manager *fman,
-			      struct dma_fence *fence);
-
 extern void vmw_fence_fifo_up(struct vmw_fence_manager *fman);
 
 extern void vmw_fence_fifo_down(struct vmw_fence_manager *fman);
-- 
2.25.1

