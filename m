Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E37D3D2376
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 14:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223096EC0D;
	Thu, 22 Jul 2021 12:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7D06EB1F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 12:41:31 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 k14-20020a05600c1c8eb02901f13dd1672aso2454686wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 05:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1KnUzpgyyCCIJdQ8OciWIgIUJg25NpalllOKaMEJXyA=;
 b=UD+b5ZSQ9Y1pqKq+synXnXjSXoioZRFY6MT3BpPYDLmuag7H7xonwNPG1eeIm3QNtj
 qI6Z4/7cDIzWwab9HKvNcEw/tcARSKpOTWdlhuPZ1/rjUzpRK395vUzyXUUDwCGurlwh
 q04dFgtvMjA0GBf4hDdE+KEymnnCCykHiJOszpSDEGUgEmQewpc8W8dpvgTLDzlZVt74
 7xkJloJcfqxYTCDOiAaIlp4XRe1OFQO/k5l/PoBU+vW36qf3f7K8cNBxljMS0G2u9T80
 ogkZ8LcoLC7kja5qMmiSEdDYRH7ja9prh4t0T6tfHsmoPtcCYvLFwr//rxI7VZPz7zf8
 xISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1KnUzpgyyCCIJdQ8OciWIgIUJg25NpalllOKaMEJXyA=;
 b=WmeO/bMeEXFmDpih8ky3GvGC5oCVVeUL9GkAqtZquJnIGLjn/kjpXYnZ9sAPFxesCc
 K57zv4kM4nZAqOgL0ZdE+WsJGOzm5KAaHDDO4mfjUbG0OIUV8FOl3jGqm/8q1RiBOjj0
 CCMqK8j4G17VVQFb8TGWbCi8x4st/1qFbRpyN8zUYVrz2keSmOCzXsGXLv/RWATtxJUb
 gnq6+rB2aerKJLnCk15OXMq6J99PltbjeCAd9SFz04r8oBi6w/UKr1et4v4Ec0U01+Kc
 ovFEYP7S69CzuYnc7EiaCQTwRcrnZLhBfbslKjHjSvw9GWeA/FdJTuH7mgPvu2XqHZv1
 TdWg==
X-Gm-Message-State: AOAM532UU+lV4xg4JidLJG4Wp6kUBlW3MeRwyeOFr9OAvx3OiiwWezdf
 oGKFcFrYf4hVyjoD/HWxAHdIyg/FjTQ=
X-Google-Smtp-Source: ABdhPJw2liPPKoQFQLfyFbayiiNxnP940Q0MiZpqLuG1z4gBuIlW/p6/34UzRm7AIuERePyx141gpw==
X-Received: by 2002:a1c:7dcf:: with SMTP id
 y198mr34646395wmc.140.1626957689738; 
 Thu, 22 Jul 2021 05:41:29 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6c5:784c:9ce7:760b])
 by smtp.gmail.com with ESMTPSA id w8sm18545133wrk.10.2021.07.22.05.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 05:41:29 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 2/5] drm/amdgpu: unbind in amdgpu_ttm_tt_unpopulate
Date: Thu, 22 Jul 2021 14:41:24 +0200
Message-Id: <20210722124127.17901-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722124127.17901-1-christian.koenig@amd.com>
References: <20210722124127.17901-1-christian.koenig@amd.com>
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

Doing this in amdgpu_ttm_backend_destroy() is to late.

It turned out that this is not a good idea at all because it leaves pointers
to freed up system memory pages in the GART tables of the drivers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index b46726e47bce..42b5162814b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1070,7 +1070,6 @@ static void amdgpu_ttm_backend_destroy(struct ttm_device *bdev,
 {
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 
-	amdgpu_ttm_backend_unbind(bdev, ttm);
 	ttm_tt_destroy_common(bdev, ttm);
 	if (gtt->usertask)
 		put_task_struct(gtt->usertask);
@@ -1154,6 +1153,8 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 	struct amdgpu_device *adev;
 
+	amdgpu_ttm_backend_unbind(bdev, ttm);
+
 	if (gtt && gtt->userptr) {
 		amdgpu_ttm_tt_set_user_pages(ttm, NULL);
 		kfree(ttm->sg);
-- 
2.25.1

