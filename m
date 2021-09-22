Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFBE4144D4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1056EB25;
	Wed, 22 Sep 2021 09:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98966EB27;
 Wed, 22 Sep 2021 09:11:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d6so4583291wrc.11;
 Wed, 22 Sep 2021 02:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hCpA+E2br43WJP4Y9CGTvHgISqNC0oMJe7QwHdjU6w8=;
 b=Y/kS/NftrpX0ijLcmSu6hcExyAyMR56qikqNimworP2eqSrP/qu8NCC29oax1MpWOU
 40oXjnsAR4Gwjl4BBJppo1OZIgBwsrGT7f9MwqCMeBANA6zntFEDap3cQNF9VEns6VnQ
 n/Y6KazzHP/Q+BsSFgUrvrLGQnb9zzYo6E5Z5+pM3jftNQqnZHxuvVdqJb3R0vgpRNLV
 LG+lW9FFwRH7+Jc4OhcwUJ4tHPBCizp/iqPanI9z43tUL9AMDDJiqaWuEcE8u81MldGW
 G8Qk+BL4XGSga0oCJT8e2qv/JgBV/wRAhh8mE76/Ryti0wgTZ0k3UA1E0gildRpXzZ3R
 Po7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hCpA+E2br43WJP4Y9CGTvHgISqNC0oMJe7QwHdjU6w8=;
 b=6XGrmibvyXwUX0oGCg0rALoiy32e+T40nnX6Eiz/2RmnIZYlIuFuP7MGgTFiRYIm0m
 eAbr3kHyNQjWHiGqeo3XMnxFfU+j3AQ5jfP0A+PM2cTd7KdPcB7dt6aQo3XKu+TJoHHx
 /GNL7N1jbnSVnsKHAWBrezfRuocEjZzGlR4NenPrg4bAEP29cMf7u2assWBoMNdNYy1t
 EK2HCWkfyZEpEtb2KdBSWQr51Vb3KNzuVsn0tyLlut+NfxymkhskmfSY7GGB7zIKJgJh
 JEaxw7GivwxWNxL72fzsegVX5G5VJIhroWUilUVF0MxALNyYn4FOY8nP1mSGTsSt0rH3
 Wy2Q==
X-Gm-Message-State: AOAM5303oBP71CethPHcups3NkgMKEsLK38yD+nojP+Si8W6CL4nx+TH
 3jx37kHte658/vCg/PeTQ+o=
X-Google-Smtp-Source: ABdhPJx9as+sEsCUrBNh/QCRLWGDtkLVpXctd0qhCAydZwgnZ5oFMKcX6dtRLBYNG54ifj4UEUNUzg==
X-Received: by 2002:a5d:510b:: with SMTP id s11mr39364292wrt.79.1632301864519; 
 Wed, 22 Sep 2021 02:11:04 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r25sm1535515wra.76.2021.09.22.02.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:11:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 18/26] drm/i915: use new iterator in
 i915_gem_object_last_write_engine
Date: Wed, 22 Sep 2021 11:10:36 +0200
Message-Id: <20210922091044.2612-19-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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

This is maybe even a fix since the RCU usage here looks incorrect.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 48112b9d76df..e20efffce3a9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -507,16 +507,16 @@ static inline struct intel_engine_cs *
 i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
 {
 	struct intel_engine_cs *engine = NULL;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
-	rcu_read_lock();
-	fence = dma_resv_get_excl_unlocked(obj->base.resv);
-	rcu_read_unlock();
-
-	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
-		engine = to_request(fence)->engine;
-	dma_fence_put(fence);
-
+	dma_resv_iter_begin(&cursor, obj->base.resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (fence && dma_fence_is_i915(fence) &&
+		    !dma_fence_is_signaled(fence))
+			engine = to_request(fence)->engine;
+	}
+	dma_resv_iter_end(&cursor);
 	return engine;
 }
 
-- 
2.25.1

