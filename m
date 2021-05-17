Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 140E1382EEB
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A7C6E980;
	Mon, 17 May 2021 14:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA5F6E975
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:11:41 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id z12so8007160ejw.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W11mXKWcsgX7hWec6U/7bPN1TKPKud+OdiigSRcXfK8=;
 b=He0km0T8PG5bF9jFbUshFNXZUiPiReALyoCGvydRtBKi5Z8+z2nuJJP7s7j7lIcTRF
 yTYnr3Tnu2s4KPwoKKcs16/+TVSOZxuy0CIQjqk3hm9GuEcAL6EsyWu15Zf/b1CdRbyV
 wn/YQOUUw5rG5FrwR9A5Le+L8LoVXNO5EQBky4qX0D5z2YPygvgedasn7LddlZbhzfNH
 9mw+gh3rOdNMGQ/z78dE16Xo/V3+vdcFS0U3zWrcXgt3/8HFi3Rvb0Yv5vagrK4PjToP
 Pbdijzq7OoopKdRax35zB9yAJkbvaNnFwyMx3yNfcbRNaQJFx6DOWSOI59N7Eu+I9GJb
 aHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W11mXKWcsgX7hWec6U/7bPN1TKPKud+OdiigSRcXfK8=;
 b=WBdsuUJVuOhs4sKx3flBQVip5YJz0XsdZMmZEpdsLuXKDb0no0/YrRgPCOchYDv4s8
 rKIuZJsUzmavlhUwc/tvAhmCpQzPRnCqbk9+OVXbauaHHEwUxcZX3i5Vk5bEzRM8oL+h
 ZjYgbZI1bbQBb2d0CrwnDiyVYkkjsJQQd3N1Xe7Nku4P4KnmDYrJ5oVRnfff2ceSAHHs
 zCVWLdGQg9bR92No3hxIj2ZXbawSp3WB13HhVr5sLlzPACsEBNB4us4MXG/E2ynPJzOo
 Sge6NYumhDCY9zc4FZUSusi46hNvB4vkTZenrgLf63W31wIUyeI9FJ0zT4TIuOH63V3A
 yVlA==
X-Gm-Message-State: AOAM532M5bIe9Y9ooGNPoaAf6qCvOFkwjhkyO4GnYTmuDg6p+uIVj3UC
 7pz+a4MjZoJxRj9BERE8o3n4sT0S5ZE=
X-Google-Smtp-Source: ABdhPJzRWeSaDKKkFZR0BZaXUbSfYv/mAUa7X5vF2DL/3XGxR7b0Ar6NJ26P4Ii0eSpaXEbofkUpNQ==
X-Received: by 2002:a17:907:161e:: with SMTP id
 hb30mr117019ejc.360.1621260699812; 
 Mon, 17 May 2021 07:11:39 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1df4:c5b6:b8fd:3c4b])
 by smtp.gmail.com with ESMTPSA id b9sm2419624edt.71.2021.05.17.07.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:11:39 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 10/11] drm/i915: also wait for shared dmabuf fences before flip
Date: Mon, 17 May 2021 16:11:28 +0200
Message-Id: <20210517141129.2225-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517141129.2225-1-christian.koenig@amd.com>
References: <20210517141129.2225-1-christian.koenig@amd.com>
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

Add dependencies for implicit sync to shared fences as well to i915.

This was lengthy discussed about four years ago, but since the workaround we
did in amdgpu is now causing more and more problems we need to fix this
properly.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9b9b538b0cb6..197b54fdefa2 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -10640,6 +10640,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	i915_gem_object_flush_frontbuffer(obj, ORIGIN_DIRTYFB);
 
 	if (!new_plane_state->uapi.fence) { /* implicit fencing */
+		struct dma_resv_cursor cursor;
 		struct dma_fence *fence;
 
 		ret = i915_sw_fence_await_reservation(&state->commit_ready,
@@ -10656,6 +10657,21 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 						   fence);
 			dma_fence_put(fence);
 		}
+
+retry:
+		dma_resv_for_each_shared(obj->base.resv, &cursor, fence) {
+			if (!(cursor.usage & DMA_RESV_USAGE_WRITE))
+				continue;
+
+			if (!dma_fence_get_rcu(fence))
+				goto retry;
+
+			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
+						   fence);
+			dma_fence_put(fence);
+		}
+
+
 	} else {
 		add_rps_boost_after_vblank(new_plane_state->hw.crtc,
 					   new_plane_state->uapi.fence);
-- 
2.25.1

