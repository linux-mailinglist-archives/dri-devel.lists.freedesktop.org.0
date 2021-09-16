Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEEB40D8A4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7A16ECFD;
	Thu, 16 Sep 2021 11:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B75D6ECF1;
 Thu, 16 Sep 2021 11:31:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so7101003wmd.5; 
 Thu, 16 Sep 2021 04:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S9Hd2E/Qpw61lQsH4cIVU2nxOsEUFiGZ/6cSSR0b+MQ=;
 b=UNyJUqywH99MZUewMqfuHAyRR9k0ZDG2hlA54YvbD1BFn7IuWO7Hk/VawAuA8tgOK8
 RaDxZ1olqGN2esx0aeHkP38wv+cVnzrsaycL7aZ86g7aRhsRxG/CyQa9netS/JwZ0Nbe
 fZ17s0rdh91VWhhUarazp43XFF6svifzFvdZ2KyLfKV55nNd4K+fMr0fU0FaSPBYixJo
 SZ4nuhd/HWgUiRPEnKttRyINO6POyW7LXVl9y5OAO7WL8AA3cNH7NNp2wQZ6QTeqQ3u+
 l6Q40E7spPkd0z7TOIa+b8acjY3KjiR+K8XZm+rlB7GlI5mmlwlZKpdtDapUbBhUaSb1
 R3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S9Hd2E/Qpw61lQsH4cIVU2nxOsEUFiGZ/6cSSR0b+MQ=;
 b=R87z6J1+hZQ8JLzq+HXvuWOp6zrVnyuXZPJ5onxFbbBUlcJBqgs/wmdUHpT/AIwj/M
 RGicMt0/vn+gukKC+oN5kQq6r6oVm3U8Yp5tVm+ZG4OUbH0nHIXI98xe0lVj2BWJCv/1
 zdey3NF1BLrrFFUc9vK6fZNqZTD+HlfgyuIXTRs80h9exP1ohfoWjjkG3ut7otNZjS/6
 49QNSHEE/noM4AwpaQmGI6XDMXWL5IPzpEsTWR2ALWnJvWOTYvG7rzq0ofi5R/rTVoml
 0RVnMmUEgDG/EEh3iK7XePqFl5k9qfIKNxoilZ3wvbAGlMkkyNK60a8COisDSg4FhkaY
 kSgg==
X-Gm-Message-State: AOAM532wrD3kqQaEz3bE8fOU2qUO6b1r/kmyrTNBVUYdtBxHOWmsbgzY
 V+LFe0/DkYPlOd2Vjwc6WKAQY96y6w9c99Aq
X-Google-Smtp-Source: ABdhPJw+n/81+bpgY1iJPJEdQb0d1AjWt4CwW29ZoleJlOjQCEcaCayiyhG72d8upanpa4b3XJHf+g==
X-Received: by 2002:a1c:1dcd:: with SMTP id d196mr4409956wmd.9.1631791862891; 
 Thu, 16 Sep 2021 04:31:02 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:31:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 19/26] drm/i915: use new cursor in intel_prepare_plane_fb v2
Date: Thu, 16 Sep 2021 13:30:35 +0200
Message-Id: <20210916113042.3631-20-christian.koenig@amd.com>
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

Simplifying the code a bit.

v2: add rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 134a6acbd8fb..fa73a6754373 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11290,6 +11290,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	i915_gem_object_flush_frontbuffer(obj, ORIGIN_DIRTYFB);
 
 	if (!new_plane_state->uapi.fence) { /* implicit fencing */
+		struct dma_resv_iter cursor;
 		struct dma_fence *fence;
 
 		ret = i915_sw_fence_await_reservation(&state->commit_ready,
@@ -11300,12 +11301,15 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		if (ret < 0)
 			goto unpin_fb;
 
-		fence = dma_resv_get_excl_unlocked(obj->base.resv);
-		if (fence) {
+		rcu_read_lock();
+		dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, false,
+						 fence) {
+			rcu_read_unlock();
 			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
 						   fence);
-			dma_fence_put(fence);
+			rcu_read_lock();
 		}
+		rcu_read_unlock();
 	} else {
 		add_rps_boost_after_vblank(new_plane_state->hw.crtc,
 					   new_plane_state->uapi.fence);
-- 
2.25.1

