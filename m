Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362E41CD550
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 11:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD48D6E418;
	Mon, 11 May 2020 09:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EAB6E415
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 09:36:06 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k1so10044328wrx.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 02:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Ir7TJSxw5q5w7D2aNk3E/aUWu32eOFoB7St8IoKp3I=;
 b=EIvtL04eDAWYFMgnpvXY860jstI6qzISn7BmVpIzEFuCbh2Y+ZoJBYTYnxCsO3dIQb
 vwA+Im0vcNx6g0X0nMtNHkNu9V1/bakVKQynr9IlgK714d/ITumUL6k0We4FV9YZqer5
 p2eUlikogNFzPt1hQf3nglNOPdFoqx9Jbiyno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Ir7TJSxw5q5w7D2aNk3E/aUWu32eOFoB7St8IoKp3I=;
 b=A88RxTvsTnaNbmfcntBYyC0CwImcRGjHHiKis6ZLik1ktKwgHog7/tkZCS9MxkZEhc
 /pyywMxyLidp/az5vDNfaxCk7+Zr5M1qOehhB+k9aKIWm2K7BmPhwgMzGCMnnRpLyYSB
 Iyo6mompmCSAReGYGLQOhniMj4k6qyq0YBBpp8wVBDwj7CT1kuxLC0eaZwzo/rfu/W0F
 Q0le7Pt5xalV9n2+vqKku9JgN5Lg82lAWFW4GFMPCrVTyfm8QbFPgkKTJsjJMowf4w/V
 R+7BFZiSswgvajyV8og5fGIqBYCoa1lJf9QUrENA5cgcWpN9PBTOitVQnLDvWFd7gtBu
 NvMw==
X-Gm-Message-State: AGi0PuYRe7dIhsp+I9xuP/Qlw80JMm9NmcyfLBjJC/l4XygcTVBGOOr0
 +KRQgFp1vjaAvVas6sgHIYauNtbRrBE=
X-Google-Smtp-Source: APiQypJV3XuZoFMauwsbabZrjZ13KMVDXGUYhiaMJeiGyabt6ydaz9Ks26iGQ4kT3KAXQG1oqUPUDA==
X-Received: by 2002:adf:fa04:: with SMTP id m4mr17753963wrr.30.1589189765296; 
 Mon, 11 May 2020 02:36:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q17sm9013945wmk.36.2020.05.11.02.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 02:36:04 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/9] drm/udl: Don't call get/put_pages on imported dma-buf
Date: Mon, 11 May 2020 11:35:50 +0200
Message-Id: <20200511093554.211493-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no direct harm, because for the shmem helpers these are noops
on imported buffers. The trouble is in the locks these take - I want
to change dma_buf_vmap locking, and so need to make sure that we only
ever take certain locks on one side of the dma-buf interface: Either
for exporters, or for importers.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/udl/udl_gem.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_gem.c b/drivers/gpu/drm/udl/udl_gem.c
index b6e26f98aa0a..c68d3e265329 100644
--- a/drivers/gpu/drm/udl/udl_gem.c
+++ b/drivers/gpu/drm/udl/udl_gem.c
@@ -46,29 +46,31 @@ static void *udl_gem_object_vmap(struct drm_gem_object *obj)
 	if (shmem->vmap_use_count++ > 0)
 		goto out;
 
-	ret = drm_gem_shmem_get_pages(shmem);
-	if (ret)
-		goto err_zero_use;
-
-	if (obj->import_attach)
+	if (obj->import_attach) {
 		shmem->vaddr = dma_buf_vmap(obj->import_attach->dmabuf);
-	else
+	} else {
+		ret = drm_gem_shmem_get_pages(shmem);
+		if (ret)
+			goto err;
+
 		shmem->vaddr = vmap(shmem->pages, obj->size >> PAGE_SHIFT,
 				    VM_MAP, PAGE_KERNEL);
 
+		if (!shmem->vaddr)
+			drm_gem_shmem_put_pages(shmem);
+	}
+
 	if (!shmem->vaddr) {
 		DRM_DEBUG_KMS("Failed to vmap pages\n");
 		ret = -ENOMEM;
-		goto err_put_pages;
+		goto err;
 	}
 
 out:
 	mutex_unlock(&shmem->vmap_lock);
 	return shmem->vaddr;
 
-err_put_pages:
-	drm_gem_shmem_put_pages(shmem);
-err_zero_use:
+err:
 	shmem->vmap_use_count = 0;
 	mutex_unlock(&shmem->vmap_lock);
 	return ERR_PTR(ret);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
