Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5717767C747
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 10:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0D210E296;
	Thu, 26 Jan 2023 09:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5668210E296
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 09:28:55 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso694365wms.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 01:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/IxBVmoaeMHgo4qohihhRMExp2vqEbWrBTuk2dZo30k=;
 b=MfLleEFuHVk5Eqk2rl0bV08WiVj4OMVvz1lAR8CvfOzu4JZhnamDCEDGgw9pcxewwc
 QBKA/M54UwJS50/Za8zbcHI2HX7J5HAlG+8Nt62iTxKSQSDwhymzbIDQq5D5PbZLZ2En
 tlbtVPoQftM06dwGqqKniTBMLs1jZOO4xqSy2Bp6pfQN/1+1jaVOBrbaQFQLcEh8I4zw
 ZSnbwvbqDzJ/kzSunWbJCeZns6ytbsCdttKSXnPUfnIBNtN1dIO/zdXTaYuCaaVekxGZ
 SmJHG/vnxnzAtWl7jZ9MRixmmuqrpcs9KWG1clJYHXmRXEJPWBOz7gKGddyY7WBoTByR
 MeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/IxBVmoaeMHgo4qohihhRMExp2vqEbWrBTuk2dZo30k=;
 b=39+Flf9r/9o9f2nUe81lqc5KKQnfshFjKfK0SQrzNqqPV8AjQ3N0I5CY2JGe1uy71A
 gxzybMmSe/KqABXIsoV2bxeeg3+JQcRDvEAt967HLfUs+6bUp7bXS09LgFfr5+6wFfuv
 psAM07jFjg3tKXNZjJog1r2AahMxrS8MWpDXgvXoKym0djRpj7KphVIsPTeF5rtUD/NP
 voKW+QziCXkATxjXn2B04kEQJeLS3WFa7zN25NpP4b59E5ee+ESvK8AbdwVoLj94HGJy
 SNqrA0KmhwJEM5LRxe7csbn9YgvP/P9NEe36VZf9C3zQl7Yqx3bfHbkNJmjgmXAJ07vG
 8FXQ==
X-Gm-Message-State: AFqh2kqx1Lf9gdgJb4tkvHomBYPxOybYBv1errDkLkrsaNWvi9T5QHlM
 FNnhYNWSSmzsJ5kVi0Zunv0=
X-Google-Smtp-Source: AMrXdXvuPjKYrz6r9VXVEKS7W8Gs0rtLGgODZ1eB3jGVWEsIQmy5BB/BO50YeASdR8746CRa4aJQTw==
X-Received: by 2002:a05:600c:35cf:b0:3d3:49db:d95 with SMTP id
 r15-20020a05600c35cf00b003d349db0d95mr34482619wmq.37.1674725333855; 
 Thu, 26 Jan 2023 01:28:53 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 c42-20020a05600c4a2a00b003da105437besm932937wmp.29.2023.01.26.01.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 01:28:53 -0800 (PST)
Date: Thu, 26 Jan 2023 12:28:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Thierry Reding <treding@nvidia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/simpledrm: Fix an NULL vs IS_ERR() bug
Message-ID: <Y9JHzImRcUaa0mi1@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The devm_memremap() function doesn't return NULL, it returns error
pointers.

Fixes: 9a10c7e6519b ("drm/simpledrm: Add support for system memory framebuffers")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 2acc0eb32489..63881a3754f8 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -719,8 +719,8 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 		drm_dbg(dev, "using system memory framebuffer at %pr\n", mem);
 
 		screen_base = devm_memremap(dev->dev, mem->start, resource_size(mem), MEMREMAP_WC);
-		if (!screen_base)
-			return ERR_PTR(-ENOMEM);
+		if (IS_ERR(screen_base))
+			return screen_base;
 
 		iosys_map_set_vaddr(&sdev->screen_base, screen_base);
 	} else {
-- 
2.35.1

