Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BF140F7DB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E936EC66;
	Fri, 17 Sep 2021 12:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A436EC50;
 Fri, 17 Sep 2021 12:35:33 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso6789119wmc.1; 
 Fri, 17 Sep 2021 05:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kXKjeGBADw7OkfdzhZSt4MyIYI/kiJUFDi8gqE27MEk=;
 b=XGeEkOBDKSxjLIr9h/2LXxg9b9Qp9nQ1jeAbxOHQ+Y2aKqPLBmAEgc5hv8ZllcOneH
 SXLXD4Mlufs09lr7ateqOtcrvkmEeRMotR+E4NhWQCyLAYRPsfbdDJ8QfQihjOVRtBb/
 xCd1cQ8thLx5ZidjLtsClZ4an9qRTn3z+LA+qfuFiJJKwZSMcLebr9doAJ8QSVJK5CHz
 ygSW/dgDvOCbV2ZTz9v5mgMlKmTm9mWcPKxCldkP9CEENogrstu9w/h1Qn7IC1T6zdFi
 OQhQVLbMuZCAhuj0EXJXdrqUBXxpexyAaR3qsYU9TGdqdQHnqbdisIfWYbgmHxzCrgBG
 0UBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kXKjeGBADw7OkfdzhZSt4MyIYI/kiJUFDi8gqE27MEk=;
 b=Tbdzx4DFTbZfBhErbEUSs7GvwfamgGFeUf1YeRIeTlOX1fw+ht21GqSOKfe6CgF/tl
 AWObr1FEyjleHqN4yAikq5mK0WaZ4AsaFbud27/FE2t2JBsxIFK3zdc4UtXWuYFZb3GY
 FA0ED0jICyKO0A/VDfaYvkJLuF+kOsrK3w7/1nkhpA9rEQjL+9Ybfswtc3TBra3B40uV
 6L0I1/oijoQPuYWEWGJ9UBxOpKVVWko0j75aapQwoxjLriyQeAA5QZH60dHYOkstN/YV
 2iok1d7nukWx8Zh1HjgDsV7b0kEObFEzAG/gkzjxkC4gn4AWWoscycmrIe90a/Xha/iI
 HIrg==
X-Gm-Message-State: AOAM531bbGT+fpA5DNhrLKhrrWtsFadzIr48t5PtKIYB58AipGyyHo3c
 56SbI1tTmwHGgfNYMSmIK+I=
X-Google-Smtp-Source: ABdhPJxnRPxEMk2FxBtoUnZidz/iVaBR9QM19ZzVdBgpzDZjd+/cY+u8xzzlOzFvnY7JyZ0eNQMvpQ==
X-Received: by 2002:a7b:cc96:: with SMTP id p22mr10074382wma.83.1631882132299; 
 Fri, 17 Sep 2021 05:35:32 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 19/26] drm/i915: use new cursor in intel_prepare_plane_fb v2
Date: Fri, 17 Sep 2021 14:35:06 +0200
Message-Id: <20210917123513.1106-20-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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

Simplifying the code a bit.

v2: add rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 134a6acbd8fb..51e3df0de1ce 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11290,6 +11290,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	i915_gem_object_flush_frontbuffer(obj, ORIGIN_DIRTYFB);
 
 	if (!new_plane_state->uapi.fence) { /* implicit fencing */
+		struct dma_resv_iter cursor;
 		struct dma_fence *fence;
 
 		ret = i915_sw_fence_await_reservation(&state->commit_ready,
@@ -11300,12 +11301,16 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		if (ret < 0)
 			goto unpin_fb;
 
-		fence = dma_resv_get_excl_unlocked(obj->base.resv);
-		if (fence) {
+		rcu_read_lock();
+		dma_resv_iter_begin(&cursor, obj->base.resv, false);
+		dma_resv_for_each_fence_unlocked(&cursor, fence) {
+			rcu_read_unlock();
 			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
 						   fence);
-			dma_fence_put(fence);
+			rcu_read_lock();
 		}
+		dma_resv_iter_end(&cursor);
+		rcu_read_unlock();
 	} else {
 		add_rps_boost_after_vblank(new_plane_state->hw.crtc,
 					   new_plane_state->uapi.fence);
-- 
2.25.1

