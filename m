Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FEA1D3EBB
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 22:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D066EBBF;
	Thu, 14 May 2020 20:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5ACD6EBA2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 20:11:24 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e1so314574wrt.5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 13:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u5+ZIsepmANUb25rp8z2+IfwFZccCxjdXSGCg+HwNG8=;
 b=inEPheZK6U783qRJhkzWRpmM2fI++8ygHH4D+jRYdwfk13oSlcSH5TIdtyUS3a9T8+
 ygc6H70ykiMA4j5aqpKMv7VgZHV6lFT7H28kRXzI3dlqaZB8DWa+oEyaGv3U26Da8UHS
 +sjzVxs+fGPUwbt7WH+FD4J5d19UwkMzQiY7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u5+ZIsepmANUb25rp8z2+IfwFZccCxjdXSGCg+HwNG8=;
 b=pJLQ6D1TNHvxudVXkMrOXPk6tXY1WWhYSEbAygWOUPRAGEyNM6Q3zTOWbp3F+VZgrZ
 R9tb0eXFrIudtZXQ1mCAo9LwLogRUhbdGYiNXLr/mvEUBM9y8C/MacFNEdjRV7M9weDN
 j5NzTKvTn68GZlS+iraTGDkvKDmkiiC1F27Gm0+yQvRXV0l0zo//WTPec3ud5dha2VMM
 DWKMn93m/Pt49dCG7rDZY92NMm3u6ca5PMlpHPQzqsnMRM+CpQJXlzDz6v/mCVqS+6ae
 JtGR+Cq+dsLv0xHTqJhpRAwuxuneCSq7oqjl1BzrrcrpoqgYosSaUo1UGbEnBK/Ds5A3
 p8Ew==
X-Gm-Message-State: AOAM530jtGFgonNRqiGM14tEk4wgK1TYjqr90+IA+xs7H1sJb0nE2KkW
 /dXBV3TymaAIhJsR/xVAK1Xq47evZRc=
X-Google-Smtp-Source: ABdhPJysl6I2xvCb7jPdlVQDQlxQlPIyMi7UVtnoTkHcbr+49z0N4ds2zUKEDu32/GtpZz8jBcnZ4A==
X-Received: by 2002:adf:df12:: with SMTP id y18mr173997wrl.94.1589487082845;
 Thu, 14 May 2020 13:11:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q74sm248655wme.14.2020.05.14.13.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 13:11:22 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/msm: Don't call dma_buf_vunmap without _vmap
Date: Thu, 14 May 2020 22:11:17 +0200
Message-Id: <20200514201117.465146-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511093554.211493-2-daniel.vetter@ffwll.ch>
References: <20200511093554.211493-2-daniel.vetter@ffwll.ch>
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
Cc: Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I honestly don't exactly understand what's going on here, but the
current code is wrong for sure: It calls dma_buf_vunmap without ever
calling dma_buf_vmap.

What I'm not sure about is whether the WARN_ON is correct:
- msm imports dma-buf using drm_prime_sg_to_page_addr_arrays. Which is
  a pretty neat layering violation of how you shouldn't peek behind
  the curtain of the dma-buf exporter, but par for course. Note that
  all the nice new helpers don't (and we should probably have a bit a
  warning about this in the kerneldoc).

- but then in the get_vaddr() in msm_gem.c, we seems to happily wrap a
  vmap() around any object with ->pages set (so including imported
  dma-buf).

- I'm not seeing any guarantees that userspace can't use an imported
  dma-buf for e.g. MSM_SUBMIT_CMD_BUF in a5xx_submit_in_rb, so no
  guarantees that an imported dma-buf won't end up with a ->vaddr set.

But even if that WARN_ON is wrong, cleaning up a vmap() done by msm by
calling dma_buf_vunmap is the wrong thing to do.

v2: Rob said in review that we do indeed have a gap in get_vaddr() that
needs to be plugged. But the users I've found aren't legit users on
imported dma-buf, so we can just reject that.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5a6a79fbc9d6..e70abd1cde43 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -554,6 +554,9 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	int ret = 0;
 
+	if (obj->import_attach)
+		return ERR_PTR(-ENODEV);
+
 	mutex_lock(&msm_obj->lock);
 
 	if (WARN_ON(msm_obj->madv > madv)) {
@@ -907,8 +910,7 @@ static void free_object(struct msm_gem_object *msm_obj)
 	put_iova(obj);
 
 	if (obj->import_attach) {
-		if (msm_obj->vaddr)
-			dma_buf_vunmap(obj->import_attach->dmabuf, msm_obj->vaddr);
+		WARN_ON(msm_obj->vaddr);
 
 		/* Don't drop the pages for imported dmabuf, as they are not
 		 * ours, just free the array we allocated:
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
