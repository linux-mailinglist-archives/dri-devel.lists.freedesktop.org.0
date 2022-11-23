Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC1C6366FC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 18:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EBA10E5CC;
	Wed, 23 Nov 2022 17:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFB910E5C5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 17:28:09 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z20so24304821edc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 09:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jk48AyLSDi8KgO/jcvwC9thfJJ+cSuUqjrztEF8zj+Y=;
 b=Z1NZORIdXeE+plv6i6w2RXTd9567sqBL6Iy/Kx8aS8fdPQRcRZCpLJKFbjTtU8yp2H
 hG3Qw6+XqpgMWfq4/XvckLBdMuLJCt7ldBKHoMdUR/mLNHkQbfTubmTPlYy8ZgiqbCkm
 rTTlSlIAuFAJhJpF3zf/vkChQdc7uX99JLTP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jk48AyLSDi8KgO/jcvwC9thfJJ+cSuUqjrztEF8zj+Y=;
 b=2FRDK6SeNB1JFCrfJ4wizZXzCRWe3Oh7ZLSpRNS75sDsNfexsXZ4+GyNUWITalHLiL
 BAY+f4yzroggZr6lGigMiJNgITKbSWIdxjMLHT9xYMKT/IIgPGl4WdBq/HhQsc1cXhzI
 6lfpJ9kTW3IUU6SXmgt0P+tKToKdWhcCu4SAl4QJcKwCPL71a8CRK669RbWqNsJTcZxP
 ummWmDT94+aWy2Y82G0pk48ECj8n+QbXgaGjOHq8IVDRatxmLMn103n9zxtiGpuRQf6t
 z70h4l3Z5RIxn54KNGer7hbI2S44BSjZJkBCdKxZC7+P9yTFRMuY9w8D+oto7+osbtHu
 PcVw==
X-Gm-Message-State: ANoB5pm4aI3i9q8OddkVX8OOHMNuykYpJTDlC7NphUZhIkOjeLlQhbmW
 xlKQ5Lu0/cvYQKQVmF1nKCLP/idGekO5OA==
X-Google-Smtp-Source: AA0mqf7QuZRbIs+mdU+rH21TH13ZHcJ5R43KzVR/YwLNWx4W8o7u/nZRi/7UmE1vPF7NGPNr1W/hMA==
X-Received: by 2002:aa7:cf07:0:b0:469:5aae:5807 with SMTP id
 a7-20020aa7cf07000000b004695aae5807mr17843335edy.133.1669224487809; 
 Wed, 23 Nov 2022 09:28:07 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 k5-20020a17090627c500b00773f3ccd989sm7460852ejc.68.2022.11.23.09.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 09:28:07 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/dma-helpers: Don't change vma flags
Date: Wed, 23 Nov 2022 18:28:02 +0100
Message-Id: <20221123172802.1049424-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.37.2
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code was added in b65e64f7ccd4 ("drm/cma: Use
dma_mmap_writecombine() to mmap buffer"), but does not explain why
it's needed.

It should be entirely unnecessary, because remap_pfn_range(), which is
what the various dma_mmap functiosn are built on top of, does already
unconditionally adjust the vma flags:

https://elixir.bootlin.com/linux/v6.1-rc6/source/mm/memory.c#L2518

More importantly, it does uncondtionally set VM_PFNMAP, so clearing
that does not make much sense.

Patch motived by discussions around enforcing VM_PFNMAP semantics for
all dma-buf users, where Thomas asked why dma helpers will work with
that dma_buf_mmap() contract.

References: https://lore.kernel.org/dri-devel/5c3c8d4f-2c06-9210-b00a-4d0ff6f6fbb7@suse.de/
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_gem_dma_helper.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 1e658c448366..637a5cc62457 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -525,13 +525,10 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
 	int ret;
 
 	/*
-	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
-	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to map
-	 * the whole buffer.
+	 * Set the vm_pgoff (used as a fake buffer offset by DRM) to 0 as we
+	 * want to map the whole buffer.
 	 */
 	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
-	vma->vm_flags &= ~VM_PFNMAP;
-	vma->vm_flags |= VM_DONTEXPAND;
 
 	if (dma_obj->map_noncoherent) {
 		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
-- 
2.37.2

