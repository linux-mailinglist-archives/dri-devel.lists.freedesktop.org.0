Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A860043DD58
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 10:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE716E941;
	Thu, 28 Oct 2021 08:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6AE6E938;
 Thu, 28 Oct 2021 08:58:34 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso8648532wmd.3; 
 Thu, 28 Oct 2021 01:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6i0TILSChMzKedgIRlQxmjqUOkHsjq/nCVlt/Lvwgi8=;
 b=QygpYOhUkudEJ5eF+BqP+MPdtid8Z5JegqUKDJoG3b4Gzc9Jwd6mGsg1KsEr4hEEU3
 IcGwxgniQNWU5VObJumOOAVCwPXdfrZ4Ldd/00nQ/fikfjzW9ULVfKFzTJDoyIt1otp8
 wNWZ4M+sZP0c5wZJrOzxg4UkHJHSNxLMVCbZrt+tu9DEzQw5J+Ol83c3es73Dwgt90Oq
 bIHGttyt8S1p3gU3dwdqjp9kYAFVzQLWSDMw+ITwnrlq746rG9+DhDAniVG8OS/HCQDH
 CVV+o6S1apv5JRlWf9JW7nXOGkOG8Y2hGKhoqTX3xGD7eeaqiEAcmqFD/H2A5g37zyl5
 iJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6i0TILSChMzKedgIRlQxmjqUOkHsjq/nCVlt/Lvwgi8=;
 b=dM9PIiHD835zm5K4FGak6NIViKgveMwM86yszfwhz+yWVPF+aWw1wQoKSVhyIfyYeG
 yVKpB4ghnZX3gxRUV8RfHx3ErlZb9nD3lDMqC27FcH5YbXO1KCngEQg2so7jnR2Fimv3
 8Z4uWP+VOQ4v86aPLMSM9bD3SGDEkPsvG0aP/3IcSbh8lRSlcIDIB3VSILPIwFOcdhG3
 Vs/wtHHJKwaWlJqv5rqNqJuXVimX8oPHu/XE//415ZvK9mLOOWtFyDZoeOtVYvtl55mi
 fyggN9NrjJqczMEr+YmyKIybqwRGCGX0bHAmiuXfJxUeY87i8GtNw7YCmbY/kcDH62K4
 GSjQ==
X-Gm-Message-State: AOAM532RrKUZPXkZvVrQyZK+BShp1McJTWUUo5Y8Gct/TUZBTQcR86ZE
 HZ9uL000wTPx5b9GXD4+S0vfryfByMY=
X-Google-Smtp-Source: ABdhPJyunwbQl67vWAeCOZxuApaRU12OkPj/DV3QTXOhqgjUkwXU/oANthE3I1spKyH9PmmyBFthJg==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr11139378wmc.126.1635411513115; 
 Thu, 28 Oct 2021 01:58:33 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 k22sm2412143wrd.59.2021.10.28.01.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 01:58:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org
Cc: etnaviv@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/etnaviv: use dma_resv_describe
Date: Thu, 28 Oct 2021 10:58:28 +0200
Message-Id: <20211028085829.1726-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028085829.1726-1-christian.koenig@amd.com>
References: <20211028085829.1726-1-christian.koenig@amd.com>
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

Instead of dumping the fence info manually.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b018693e3877..d5314aa28ff7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -424,36 +424,24 @@ int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
 }
 
 #ifdef CONFIG_DEBUG_FS
-static void etnaviv_gem_describe_fence(struct dma_fence *fence,
-	const char *type, struct seq_file *m)
-{
-	seq_printf(m, "\t%9s: %s %s seq %llu\n", type,
-		   fence->ops->get_driver_name(fence),
-		   fence->ops->get_timeline_name(fence),
-		   fence->seqno);
-}
-
 static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
 	unsigned long off = drm_vma_node_start(&obj->vma_node);
+	int r;
 
 	seq_printf(m, "%08x: %c %2d (%2d) %08lx %p %zd\n",
 			etnaviv_obj->flags, is_active(etnaviv_obj) ? 'A' : 'I',
 			obj->name, kref_read(&obj->refcount),
 			off, etnaviv_obj->vaddr, obj->size);
 
-	dma_resv_iter_begin(&cursor, robj, true);
-	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		if (dma_resv_iter_is_exclusive(&cursor))
-			etnaviv_gem_describe_fence(fence, "Exclusive", m);
-		else
-			etnaviv_gem_describe_fence(fence, "Shared", m);
-	}
-	dma_resv_iter_end(&cursor);
+	r = dma_resv_lock(robj, NULL);
+	if (r)
+		return;
+
+	dma_resv_describe(robj, m);
+	dma_resv_unlock(robj);
 }
 
 void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
-- 
2.25.1

