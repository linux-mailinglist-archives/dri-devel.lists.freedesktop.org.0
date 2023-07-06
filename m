Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C7B749BF2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 14:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E1510E48F;
	Thu,  6 Jul 2023 12:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CE310E48F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 12:38:01 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31441dfbf97so611671f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688647079; x=1691239079;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F+HUvJ4QTDevtKTASgsl+F3VuwhUQ02Z1WI6sZoHENY=;
 b=Y7L2k2zULEUk2RZkC8o07CD393u9MlrprQK6eCqsaQm8oGvGshM4kpxXUkHfhKO+6/
 QrW0NAZz9RiGY4vTvZulHuyoW6duDzxM474kdiW7bSl5AlSX/XiBDZ5E0Y6RSDo7zGhn
 X201ZRb8prs1psvkVTyvqZlHqP0Q7z9JUK9MPGoapX5+BHU9V8jrzWojlyKQKWXSoJAc
 4Q3MU4gnhk8XdAVH8o2fbfkimoaQ/56A6SEVqxcTmp9emVfUOIh6NJ113EbFaP4KsYNF
 xlewu/EqBTb7T1ZJjwHbtJFx9RVlp1RtsChE07jHCg4sSQRyLYHk+M5VK+Vfe1Wh4Kk9
 5ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688647079; x=1691239079;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F+HUvJ4QTDevtKTASgsl+F3VuwhUQ02Z1WI6sZoHENY=;
 b=L8cuY/lQyNdDJh5KxldCmbG38hNIyLN2Ljvce+WWm/0Lx1w+cgsohfY29XIK2BSUY/
 peEfCXWLHoM7N7xEpoJ6CZNfGf5nHrukAbyEh3r4eAMyVl0XoIEGOW50NirfkmLNhRm0
 gDteLMmDWy0ohsbTu0v9LBDLNvhpYfnw/Yhu7MAP1YJpmWTaIkavSRP+ztZtya98WhJj
 q0q5QP8rZ7pvEQheVMnDSzbvXlAMiBLglMAG30CV0f4TKfD6zp1CYhxbdG56qF9zbomZ
 88Z9ydomvZNo1F0JiDaJgm9vRky2vxc/7h6pFBs3N9Vrc0JKuYBRe8Rj7JJUVQWIN+mW
 wDUQ==
X-Gm-Message-State: ABy/qLZ4raEKqhAu7zN1hlWW4UMi4Hfg6t76CiTmjA3K7J4+8KTJR3n8
 pIAHSETkShJ8tnpxBsnhr8LdlZImCmtI8jAk2dw=
X-Google-Smtp-Source: APBJJlGkLkipEot/qaG0ulR5j4ByuxASZM5urGdZalBCHsWht3pKbPMo60yuiZKbmAXZ7Tgw94X4Pw==
X-Received: by 2002:adf:f989:0:b0:313:fcea:db06 with SMTP id
 f9-20020adff989000000b00313fceadb06mr1437833wrr.12.1688647079678; 
 Thu, 06 Jul 2023 05:37:59 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 o5-20020a056000010500b0030c4d8930b1sm1780435wrx.91.2023.07.06.05.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 05:37:57 -0700 (PDT)
Date: Thu, 6 Jul 2023 15:37:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v2] dma-buf: fix an error pointer vs NULL bug
Message-ID: <b09f1996-3838-4fa2-9193-832b68262e43@moroto.mountain>
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
Cc: kernel-janitors@vger.kernel.org, Gustavo Padovan <gustavo@padovan.org>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch detected potential error pointer dereference.

    drivers/gpu/drm/drm_syncobj.c:888 drm_syncobj_transfer_to_timeline()
    error: 'fence' dereferencing possible ERR_PTR()

The error pointer comes from dma_fence_allocate_private_stub().  One
caller expected error pointers and one expected NULL pointers.  Change
it to return NULL and update the caller which expected error pointers,
drm_syncobj_assign_null_handle(), to check for NULL instead.

Fixes: f781f661e8c9 ("dma-buf: keep the signaling time of merged fences v3")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Fix it in dma_fence_allocate_private_stub() instead of
   __dma_fence_unwrap_merge().


 drivers/dma-buf/dma-fence.c   | 2 +-
 drivers/gpu/drm/drm_syncobj.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ad076f208760..8aa8f8cb7071 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -160,7 +160,7 @@ struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
 
 	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
 	if (fence == NULL)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	dma_fence_init(fence,
 		       &dma_fence_stub_ops,
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 04589a35eb09..e592c5da70ce 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -355,8 +355,8 @@ static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
 {
 	struct dma_fence *fence = dma_fence_allocate_private_stub(ktime_get());
 
-	if (IS_ERR(fence))
-		return PTR_ERR(fence);
+	if (!fence)
+		return -ENOMEM;
 
 	drm_syncobj_replace_fence(syncobj, fence);
 	dma_fence_put(fence);
-- 
2.39.2

