Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B30340CAD8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 18:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A356E9C5;
	Wed, 15 Sep 2021 16:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83076E9A0;
 Wed, 15 Sep 2021 16:40:58 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id b200so4216313iof.13;
 Wed, 15 Sep 2021 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L+08hq9MDL1yzT8HxFNaQNtrlEM6Xv6fhZuNRn1F1mc=;
 b=SPHkRDp72gZ0c3y6KviDI/XqZYrcZIJbitZr0Tn3ly4ZDKRUWJN+H5ImQ/Xu97dYZw
 I3Imaalk8TcTOyP1LWMt//qfSBnXW11JO+x9EhO7ppI7EoAarp0lD+jKvVtc6G2m+9hn
 0v8Zq65qDkSVsUcg41H6kE16HDhUxXJzIuPAg2/xA7Bbx98rtr7WIm8NlHkR7JCxfHqt
 YFfAHa5JPkHHVTRuxQ5MP8pkyxC+boUZyVJYi2S3+gOHdRUMflGNWKrkY+7IamKxGw+h
 ICoDXqE7nbQ8HPSJ5RvRNGpw56F/zDe5NIlUd/uUyJOa7uQvEgmOuk4HFqa/rCItm4H0
 ZL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L+08hq9MDL1yzT8HxFNaQNtrlEM6Xv6fhZuNRn1F1mc=;
 b=O3ru6AJTMXwra3c27ARXYVnUExOV7wGfjdiy24hxnIKWiYwc0YJewLYtvU590vmG4Q
 /U5Riyd7YQDg16/bBmsdbObE5CZW7vFBIbIQEnkS0TnpRr4C95gyvl7M2Ej96WwS3HFd
 8iAYns18iPzNTQ6t2jQAPBuYOefvFyUpmX3GCqe9BevZfJYmdHJDPvwmkITYBb0S6at9
 hHgJ1GEOPl2HdFO2Hm3wzvadFwVO9x865hUqL572bx3nH3clm+d+vuiIGiTIyHHlhUxR
 bmRshWNHbUDmwoJrIDLOtet4gFYCAuO9UH2LRgyHxfK1aR9bF7I9Mxlf8bY7ciwACGQ/
 BT7Q==
X-Gm-Message-State: AOAM532paXHUQl07aYUxPBI2XuQWXxXDAyUh8tMZAc50jSVo0bjI96JK
 02lHHZuoVD3O2AppkOp4U/c=
X-Google-Smtp-Source: ABdhPJzSyZoM8g2dKxoNfe2FZae8tupg/vf6LyJMERVhe0uSm1eAISI0AaPoWL5D3InPcL3OH4xdGQ==
X-Received: by 2002:a05:6638:1484:: with SMTP id
 j4mr802097jak.80.1631724058166; 
 Wed, 15 Sep 2021 09:40:58 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a5sm299540ilf.27.2021.09.15.09.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 09:40:57 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 16/16] nouveau: fold multiple DRM_DEBUG_DRIVERs together
Date: Wed, 15 Sep 2021 10:39:57 -0600
Message-Id: <20210915163957.2949166-17-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915163957.2949166-1-jim.cromie@gmail.com>
References: <20210915163957.2949166-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With DRM_USE_DYNAMIC_DEBUG, each callsite record requires 56 bytes.
We can combine 12 into one here and save ~620 bytes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 36 +++++++++++++++++----------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ba4cd5f83725..0f45399535bf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1245,19 +1245,29 @@ nouveau_drm_pci_table[] = {
 
 static void nouveau_display_options(void)
 {
-	DRM_DEBUG_DRIVER("Loading Nouveau with parameters:\n");
-
-	DRM_DEBUG_DRIVER("... tv_disable   : %d\n", nouveau_tv_disable);
-	DRM_DEBUG_DRIVER("... ignorelid    : %d\n", nouveau_ignorelid);
-	DRM_DEBUG_DRIVER("... duallink     : %d\n", nouveau_duallink);
-	DRM_DEBUG_DRIVER("... nofbaccel    : %d\n", nouveau_nofbaccel);
-	DRM_DEBUG_DRIVER("... config       : %s\n", nouveau_config);
-	DRM_DEBUG_DRIVER("... debug        : %s\n", nouveau_debug);
-	DRM_DEBUG_DRIVER("... noaccel      : %d\n", nouveau_noaccel);
-	DRM_DEBUG_DRIVER("... modeset      : %d\n", nouveau_modeset);
-	DRM_DEBUG_DRIVER("... runpm        : %d\n", nouveau_runtime_pm);
-	DRM_DEBUG_DRIVER("... vram_pushbuf : %d\n", nouveau_vram_pushbuf);
-	DRM_DEBUG_DRIVER("... hdmimhz      : %d\n", nouveau_hdmimhz);
+	DRM_DEBUG_DRIVER("Loading Nouveau with parameters:\n"
+			 "... tv_disable   : %d\n"
+			 "... ignorelid    : %d\n"
+			 "... duallink     : %d\n"
+			 "... nofbaccel    : %d\n"
+			 "... config       : %s\n"
+			 "... debug        : %s\n"
+			 "... noaccel      : %d\n"
+			 "... modeset      : %d\n"
+			 "... runpm        : %d\n"
+			 "... vram_pushbuf : %d\n"
+			 "... hdmimhz      : %d\n"
+			 , nouveau_tv_disable
+			 , nouveau_ignorelid
+			 , nouveau_duallink
+			 , nouveau_nofbaccel
+			 , nouveau_config
+			 , nouveau_debug
+			 , nouveau_noaccel
+			 , nouveau_modeset
+			 , nouveau_runtime_pm
+			 , nouveau_vram_pushbuf
+			 , nouveau_hdmimhz);
 }
 
 static const struct dev_pm_ops nouveau_pm_ops = {
-- 
2.31.1

