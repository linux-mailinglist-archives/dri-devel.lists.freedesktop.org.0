Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF9140D89F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731FD6ECF8;
	Thu, 16 Sep 2021 11:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160006ECE7;
 Thu, 16 Sep 2021 11:30:59 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id y132so4568354wmc.1;
 Thu, 16 Sep 2021 04:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=619EAz9TvrXlFEEg1bXuHi1QdjRBbwVPPanVgBf3wcw=;
 b=eIOI2c8bvusaWxzxUusQ8CJabg6fj2kTwK1gPAobaKP6AFAu/5cx08fiSmduHcJHq3
 p7bCajLfrsbum4xAKMfk4Vi2QioxbtN2m8tO8blw0v2OvP9XGDiy8HIDN+p3KLcyPwzd
 dYnOJZXDpKrUFMIaSmwj5xygzcLUxKfyAsEckA063l4JTBjCuWm1JUi/wLr2r46wMOqv
 8DUjD1YILD7zccxDi1BJBkwhiOEzIomt3yTgwVo5jdQlv2P93jblrUFm8mN5vWDyUaiR
 AyPcHl6yOXcB8NZnppTApPT324tIsxF6uRR83kvHLE4uVDsFBUCw9TsGgKVxVVtz4qmV
 VZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=619EAz9TvrXlFEEg1bXuHi1QdjRBbwVPPanVgBf3wcw=;
 b=RUQ8J1NpGMT3td1xFFjtiH0krSa3gtfuESQEQjPLDwaVotLxVyjS0ahXTcI0N/WSAm
 IL+ALm/WpMxNtoG4fFYtl/1cYzaVT/W3Ey5l2z4IMv96Dhqd4xC+6OF/4mhfHqFKbQda
 0Hrj4PcfRsyCoINxA0Eq3X3L4V9vxGc6k+hsyVeC3gfWC6licdp3tkKkF6F/2L9PJJPj
 bpi7/Xcb/f4Fnxxn6onnu/7GXcSnsC3R1ahYN/yz7DvhRhQmEPZWNjWaZYD8A4XmwBV7
 em7fLL9c7syT43gLBic9bSf5V8TwxhCP8ggWjsLpvi7SlN/NLqyODSScC5YoIaqFm8o/
 JHbw==
X-Gm-Message-State: AOAM5337YJbrHPyEkWAx1DO5OCtmKIdUnRC6wqe/mUwB3h2tuH0af58t
 gq+p6x/MlUhn0OEZDuVbCSw=
X-Google-Smtp-Source: ABdhPJx+LVHV0RoCdRxrz79zGczQwIUfnEDaV9mE/KpbaDXh/TdYi9OVCpLSSb6QOCq+D3ep2yVHPQ==
X-Received: by 2002:a05:600c:2057:: with SMTP id
 p23mr9530967wmg.25.1631791857611; 
 Thu, 16 Sep 2021 04:30:57 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:30:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 13/26] drm/i915: use the new iterator in i915_gem_busy_ioctl
Date: Thu, 16 Sep 2021 13:30:29 +0200
Message-Id: <20210916113042.3631-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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

This makes the function much simpler since the complex
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_busy.c | 30 +++++++-----------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 6234e17259c1..adf9a8413446 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_gem_busy *args = data;
 	struct drm_i915_gem_object *obj;
-	struct dma_resv_list *list;
-	unsigned int seq;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int err;
 
 	err = -ENOENT;
@@ -109,28 +109,16 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 	 * to report the overall busyness. This is what the wait-ioctl does.
 	 *
 	 */
-retry:
-	seq = raw_read_seqcount(&obj->base.resv->seq);
-
-	/* Translate the exclusive fence to the READ *and* WRITE engine */
-	args->busy = busy_check_writer(dma_resv_excl_fence(obj->base.resv));
-
-	/* Translate shared fences to READ set of engines */
-	list = dma_resv_shared_list(obj->base.resv);
-	if (list) {
-		unsigned int shared_count = list->shared_count, i;
-
-		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence =
-				rcu_dereference(list->shared[i]);
-
+	args->busy = false;
+	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, true, fence) {
+		if (dma_resv_iter_is_exclusive(&cursor))
+			/* Translate the exclusive fence to the READ *and* WRITE engine */
+			args->busy = busy_check_writer(fence);
+		else
+			/* Translate shared fences to READ set of engines */
 			args->busy |= busy_check_reader(fence);
-		}
 	}
 
-	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
-		goto retry;
-
 	err = 0;
 out:
 	rcu_read_unlock();
-- 
2.25.1

