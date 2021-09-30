Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9C541D11F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 03:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6B86EB2E;
	Thu, 30 Sep 2021 01:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C3E6EB1A;
 Thu, 30 Sep 2021 01:44:43 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id e144so5578439iof.3;
 Wed, 29 Sep 2021 18:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eqWt1AT/nKFdPrLGOkMe+DiZuRwHUZkgfm0b5xYXC7E=;
 b=HVjcVjCZM9k2FoRt9qJe2w33eLBEJQRx8dtXUPuls4VUl1aBc+HrXXDxii195mUZeR
 yc4uXCU5373owLFDV7wVdFPOY8u3CxfvZJaW2s8dSquBmLHPwIC52mmKRmY87sixmnHX
 JhyjZxrcIYCBtQBCKQpwjbcxCv6ujPPQ1teXYDEQU366gpGvtPrb92OOP8EmDyykuiFV
 xhzfIzM2lfA7U5L2n60EHxdf0gFiVM097CIU11QOdEnAev3O5DD8CDkbHZmrmw7AZ9t0
 bJifnTUdRgXvb9T0n+P854S9/AtpeJC3P84Ql7TR1v6mpG+2EC3mKkN4gCKzmbADuw3S
 Y06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eqWt1AT/nKFdPrLGOkMe+DiZuRwHUZkgfm0b5xYXC7E=;
 b=1saxwXj6cUyLTPsCci+8PQ2dbIJUJh9WhicUXMpH/52e8AGP6gOXI5dzP7lwBNLz0q
 7rAwXDeHvki0tiOcv69Ugdn7Z5iM1VAvKmPRu0mUG8YepQOmzZuV+oIkH1Rw1ew6s3Cs
 xV/zAlVU+owaBhJRSSV0dBjyOejA9QNyrVui8jhSRQt2oaqcfA5Qeqmwyjnd0b750Z4P
 dHalJ86a+SaGofhY3jYY6dt0Uql4Na3JRjEeVReeC8biwWvgifh0PwfXiW/e5tF0jD7U
 Tx6Vy+Be+2CKOqLGzRLM0C+ROKlWCgYhUvJrGMw/y6I0cFbh2oVadAPwLsQwJGpR+g5z
 1vcg==
X-Gm-Message-State: AOAM530N3L3sJ+i3gB9GZnhvOz+NnU31FZrzPcQMlqL9tPHCuQPOQY/a
 Z/uuSQ1d3GPAdpJyu4I0qZbnMLaEdHs=
X-Google-Smtp-Source: ABdhPJyqJOZnrB6AlNc551XGYlGQnMW2K/MQje5PFFr50Q6DIuuNaOhpCkZd44KY7XunZ6I3N1GYFg==
X-Received: by 2002:a05:6638:59:: with SMTP id
 a25mr2583089jap.92.1632966282293; 
 Wed, 29 Sep 2021 18:44:42 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id h23sm1155414ila.32.2021.09.29.18.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 18:44:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 3/4] nouveau: fold multiple DRM_DEBUG_DRIVERs together
Date: Wed, 29 Sep 2021 19:44:26 -0600
Message-Id: <20210930014427.14239-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930014427.14239-1-jim.cromie@gmail.com>
References: <20210930014427.14239-1-jim.cromie@gmail.com>
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
index 1f828c9f691c..d9fbd249dbaa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1242,19 +1242,29 @@ nouveau_drm_pci_table[] = {
 
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

