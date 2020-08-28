Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B252558B6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 12:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C0B6EBA7;
	Fri, 28 Aug 2020 10:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508416EBA1;
 Fri, 28 Aug 2020 10:40:37 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id m22so857646eje.10;
 Fri, 28 Aug 2020 03:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cZjwjdKDE7Z9JH0Yf5SRapyIEuJFd9xOwbXYAQjCTq0=;
 b=MKb0Itu5DqHdcq/03/kCqW6X8wHpe9cVf2K2T78UY8jHxbkiUFGSTNoau8E6VimRCh
 R5SqetUVAY/+rAjkNZ9/DV+8kNRxYUJGHEoIF0WVIGu852/9GUKZhFpQ+hqLCS7YUTmP
 uWuCHi+HAWOFmMfDhAH/2CW3EaSvlt+O0AH2Sl8+1ZSVH4PJwYnTN8b0ha3fEc/6ODqA
 08+Q/TTRtWhroVw9w0zEnxOGdNe9rNeAom1gSd/ZdfThHsv06Ak+Mxdfl8DTOWWlRqyp
 AwSGYLjcHAzPCTbtM+dTXVTZ6mYOLeQxPNwD2eAMHOApqW3SEyNd181+EhnXlS5wYtpq
 NGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cZjwjdKDE7Z9JH0Yf5SRapyIEuJFd9xOwbXYAQjCTq0=;
 b=Xp13XOuYxsG1meW6nnYUexoZ/nDIMnSBI6M32jVY/CJL75K434yKhiy92JgqB1kAhf
 N3yvQUwuNG1wHp9e3VWbFd34T+CXLYlPogcL/zYPUxquuO67B1NZ/H8Y52ktzkPuusDS
 yfAG3By5lDLpxQB8nCcZFBfy2+V5NjEfapPV9jMq49MDbcZTRZxZO0z2Po5lS3LGmDZ4
 cTcZCmkS0tClFnYssuBYggQ7PJ8i5oiNp105tSsDHYQTW+T4v3MlSSlL5A/QRRjqG4oz
 R49Ejlo8u7SCYMHBEvLMYwzwivTXgXFu1mgNfkLk4BkQQIEPn/h1ipVJKM4SxLCtXyNC
 MNow==
X-Gm-Message-State: AOAM530F4RLu472BFTHIINsdWSHopXd3HPV08+4LlB43i6xBwPo/EpE/
 sG1toQO4bOeVVYIDkl236frSey+kYfaJJg==
X-Google-Smtp-Source: ABdhPJzbXg6U30GI1ZnfuAW2xIXmfUXujJEW3Fs7vXE2HphJovYHFnpySSYx2SOp3eTPQHBP9pPnXQ==
X-Received: by 2002:a17:906:a1c2:: with SMTP id
 bx2mr1151699ejb.426.1598611235956; 
 Fri, 28 Aug 2020 03:40:35 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id r26sm636475edp.62.2020.08.28.03.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:40:34 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 6/6] drm/nouveau: Allow zero pushbuffer submits
Date: Fri, 28 Aug 2020 12:40:16 +0200
Message-Id: <20200828104016.1672195-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828104016.1672195-1-thierry.reding@gmail.com>
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

These are useful in cases where only a fence is to be created to wait
for existing jobs in the command stream.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 197 +++++++++++++-------------
 1 file changed, 99 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index b3ece731e4e1..c70a045d7141 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -816,9 +816,9 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 	struct nouveau_abi16_chan *temp;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct drm_nouveau_gem_pushbuf *req = &request->base;
-	struct drm_nouveau_gem_pushbuf_push *push;
 	struct drm_nouveau_gem_pushbuf_reloc *reloc = NULL;
-	struct drm_nouveau_gem_pushbuf_bo *bo;
+	struct drm_nouveau_gem_pushbuf_push *push = NULL;
+	struct drm_nouveau_gem_pushbuf_bo *bo = NULL;
 	struct drm_nouveau_gem_fence *fences = NULL;
 	struct nouveau_channel *chan = NULL;
 	struct validate_op op;
@@ -850,8 +850,6 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 
 	req->vram_available = drm->gem.vram_available;
 	req->gart_available = drm->gem.gart_available;
-	if (unlikely(req->nr_push == 0))
-		goto out_next;
 
 	if (unlikely(req->nr_push > NOUVEAU_GEM_MAX_PUSH)) {
 		NV_PRINTK(err, cli, "pushbuf push count exceeds limit: %d max %d\n",
@@ -871,33 +869,35 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 		return nouveau_abi16_put(abi16, -EINVAL);
 	}
 
-	push = u_memcpya(req->push, req->nr_push, sizeof(*push));
-	if (IS_ERR(push))
-		return nouveau_abi16_put(abi16, PTR_ERR(push));
+	if (req->nr_push > 0) {
+		push = u_memcpya(req->push, req->nr_push, sizeof(*push));
+		if (IS_ERR(push))
+			return nouveau_abi16_put(abi16, PTR_ERR(push));
 
-	bo = u_memcpya(req->buffers, req->nr_buffers, sizeof(*bo));
-	if (IS_ERR(bo)) {
-		u_free(push);
-		return nouveau_abi16_put(abi16, PTR_ERR(bo));
-	}
+		bo = u_memcpya(req->buffers, req->nr_buffers, sizeof(*bo));
+		if (IS_ERR(bo)) {
+			u_free(push);
+			return nouveau_abi16_put(abi16, PTR_ERR(bo));
+		}
 
-	/* Ensure all push buffers are on validate list */
-	for (i = 0; i < req->nr_push; i++) {
-		if (push[i].bo_index >= req->nr_buffers) {
-			NV_PRINTK(err, cli, "push %d buffer not in list\n", i);
-			ret = -EINVAL;
-			goto out_prevalid;
+		/* Ensure all push buffers are on validate list */
+		for (i = 0; i < req->nr_push; i++) {
+			if (push[i].bo_index >= req->nr_buffers) {
+				NV_PRINTK(err, cli, "push %d buffer not in list\n", i);
+				ret = -EINVAL;
+				goto out_prevalid;
+			}
 		}
-	}
 
-	/* Validate buffer list */
+		/* Validate buffer list */
 revalidate:
-	ret = nouveau_gem_pushbuf_validate(chan, file_priv, bo,
-					   req->nr_buffers, &op, &do_reloc);
-	if (ret) {
-		if (ret != -ERESTARTSYS)
-			NV_PRINTK(err, cli, "validate: %d\n", ret);
-		goto out_prevalid;
+		ret = nouveau_gem_pushbuf_validate(chan, file_priv, bo,
+						   req->nr_buffers, &op, &do_reloc);
+		if (ret) {
+			if (ret != -ERESTARTSYS)
+				NV_PRINTK(err, cli, "validate: %d\n", ret);
+			goto out_prevalid;
+		}
 	}
 
 	if (request->num_fences > 0) {
@@ -915,89 +915,89 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 	}
 
 	/* Apply any relocations that are required */
-	if (do_reloc) {
-		if (!reloc) {
-			validate_fini(&op, chan, NULL, bo);
-			reloc = u_memcpya(req->relocs, req->nr_relocs, sizeof(*reloc));
-			if (IS_ERR(reloc)) {
-				ret = PTR_ERR(reloc);
-				goto out_prevalid;
-			}
+	if (req->nr_push > 0) {
+		if (do_reloc) {
+			if (!reloc) {
+				validate_fini(&op, chan, NULL, bo);
+				reloc = u_memcpya(req->relocs, req->nr_relocs, sizeof(*reloc));
+				if (IS_ERR(reloc)) {
+					ret = PTR_ERR(reloc);
+					goto out_prevalid;
+				}
 
-			goto revalidate;
-		}
+				goto revalidate;
+			}
 
-		ret = nouveau_gem_pushbuf_reloc_apply(cli, req, reloc, bo);
-		if (ret) {
-			NV_PRINTK(err, cli, "reloc apply: %d\n", ret);
-			goto out;
+			ret = nouveau_gem_pushbuf_reloc_apply(cli, req, reloc, bo);
+			if (ret) {
+				NV_PRINTK(err, cli, "reloc apply: %d\n", ret);
+				goto out;
+			}
 		}
-	}
 
-	if (chan->dma.ib_max) {
-		ret = nouveau_dma_wait(chan, req->nr_push + 1, 16);
-		if (ret) {
-			NV_PRINTK(err, cli, "nv50cal_space: %d\n", ret);
-			goto out;
-		}
+		if (chan->dma.ib_max) {
+			ret = nouveau_dma_wait(chan, req->nr_push + 1, 16);
+			if (ret) {
+				NV_PRINTK(err, cli, "nv50cal_space: %d\n", ret);
+				goto out;
+			}
 
-		for (i = 0; i < req->nr_push; i++) {
-			struct nouveau_vma *vma = (void *)(unsigned long)
-				bo[push[i].bo_index].user_priv;
+			for (i = 0; i < req->nr_push; i++) {
+				struct nouveau_vma *vma = (void *)(unsigned long)
+					bo[push[i].bo_index].user_priv;
 
-			nv50_dma_push(chan, vma->addr + push[i].offset,
-				      push[i].length);
-		}
-	} else
-	if (drm->client.device.info.chipset >= 0x25) {
-		ret = PUSH_WAIT(chan->chan.push, req->nr_push * 2);
-		if (ret) {
-			NV_PRINTK(err, cli, "cal_space: %d\n", ret);
-			goto out;
-		}
+				nv50_dma_push(chan, vma->addr + push[i].offset,
+					      push[i].length);
+			}
+		} else if (drm->client.device.info.chipset >= 0x25) {
+			ret = PUSH_WAIT(chan->chan.push, req->nr_push * 2);
+			if (ret) {
+				NV_PRINTK(err, cli, "cal_space: %d\n", ret);
+				goto out;
+			}
 
-		for (i = 0; i < req->nr_push; i++) {
-			struct nouveau_bo *nvbo = (void *)(unsigned long)
-				bo[push[i].bo_index].user_priv;
+			for (i = 0; i < req->nr_push; i++) {
+				struct nouveau_bo *nvbo = (void *)(unsigned long)
+					bo[push[i].bo_index].user_priv;
 
-			PUSH_CALL(chan->chan.push, nvbo->offset + push[i].offset);
-			PUSH_DATA(chan->chan.push, 0);
-		}
-	} else {
-		ret = PUSH_WAIT(chan->chan.push, req->nr_push * (2 + NOUVEAU_DMA_SKIPS));
-		if (ret) {
-			NV_PRINTK(err, cli, "jmp_space: %d\n", ret);
-			goto out;
-		}
+				PUSH_CALL(chan->chan.push, nvbo->offset + push[i].offset);
+				PUSH_DATA(chan->chan.push, 0);
+			}
+		} else {
+			ret = PUSH_WAIT(chan->chan.push, req->nr_push * (2 + NOUVEAU_DMA_SKIPS));
+			if (ret) {
+				NV_PRINTK(err, cli, "jmp_space: %d\n", ret);
+				goto out;
+			}
 
-		for (i = 0; i < req->nr_push; i++) {
-			struct nouveau_bo *nvbo = (void *)(unsigned long)
-				bo[push[i].bo_index].user_priv;
-			uint32_t cmd;
-
-			cmd = chan->push.addr + ((chan->dma.cur + 2) << 2);
-			cmd |= 0x20000000;
-			if (unlikely(cmd != req->suffix0)) {
-				if (!nvbo->kmap.virtual) {
-					ret = ttm_bo_kmap(&nvbo->bo, 0,
-							  nvbo->bo.mem.
-							  num_pages,
-							  &nvbo->kmap);
-					if (ret) {
-						WIND_RING(chan);
-						goto out;
+			for (i = 0; i < req->nr_push; i++) {
+				struct nouveau_bo *nvbo = (void *)(unsigned long)
+					bo[push[i].bo_index].user_priv;
+				uint32_t cmd;
+
+				cmd = chan->push.addr + ((chan->dma.cur + 2) << 2);
+				cmd |= 0x20000000;
+				if (unlikely(cmd != req->suffix0)) {
+					if (!nvbo->kmap.virtual) {
+						ret = ttm_bo_kmap(&nvbo->bo, 0,
+								  nvbo->bo.mem.num_pages,
+								  &nvbo->kmap);
+						if (ret) {
+							WIND_RING(chan);
+							goto out;
+						}
+						nvbo->validate_mapped = true;
 					}
-					nvbo->validate_mapped = true;
-				}
 
-				nouveau_bo_wr32(nvbo, (push[i].offset +
-						push[i].length - 8) / 4, cmd);
-			}
+					nouveau_bo_wr32(nvbo, (push[i].offset +
+							push[i].length - 8) / 4, cmd);
+				}
 
-			PUSH_JUMP(chan->chan.push, nvbo->offset + push[i].offset);
-			PUSH_DATA(chan->chan.push, 0);
-			for (j = 0; j < NOUVEAU_DMA_SKIPS; j++)
+				PUSH_JUMP(chan->chan.push, nvbo->offset + push[i].offset);
 				PUSH_DATA(chan->chan.push, 0);
+				for (j = 0; j < NOUVEAU_DMA_SKIPS; j++)
+					PUSH_DATA(chan->chan.push, 0);
+			}
 		}
 	}
 
@@ -1031,7 +1031,9 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 out:
 	u_free(fences);
 
-	validate_fini(&op, chan, fence, bo);
+	if (req->nr_push > 0)
+		validate_fini(&op, chan, fence, bo);
+
 	nouveau_fence_unref(&fence);
 
 	if (do_reloc) {
@@ -1054,7 +1056,6 @@ __nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
 	u_free(bo);
 	u_free(push);
 
-out_next:
 	if (chan->dma.ib_max) {
 		req->suffix0 = 0x00000000;
 		req->suffix1 = 0x00000000;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
