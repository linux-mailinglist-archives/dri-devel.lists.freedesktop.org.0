Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33B4452EFB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 11:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E41C6EA5E;
	Tue, 16 Nov 2021 10:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A826E1B5;
 Tue, 16 Nov 2021 10:24:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i5so36561612wrb.2;
 Tue, 16 Nov 2021 02:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/4l9UpfpZvlcAJNqS1oueUKAgaTadj3L3dcu3aCeFd0=;
 b=X6YtO8fQFgHeAM78h1drfhlaE/8TTV0MtTOgWsG8UaHat9K//dTItofi9o1fVhvDWx
 i6doqxMw0iVQUGtbGygBljZWhYVi5WCpcxiTeCOsNRtx3MMzV25YqR5j2DyUgc2lCMCy
 p23QrtoCC8i41mDpvMCD3V1d4bC9Qn8gZEABZMRn2UQkYKkrUQtUoQWFgBTyItNISpgL
 OomRNHhv56CwICwHWrCcqYxURZSW6fqQgVDqAI5EwD+01Ozj3/kEmzehIxlKg5TDzfvP
 BdjBoft5Y2bZemAnKgJcSyjKNWQNJqIm9ZDj0ygTyiZCGZ0V6CaaDu1b9BwhxJAwEcPD
 CdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/4l9UpfpZvlcAJNqS1oueUKAgaTadj3L3dcu3aCeFd0=;
 b=SuI5ZQSzURGBY9t6udLowMbI4WMHm6dsNt9HDVK+x00xCucK7pQS/eEK6osoNCnui2
 kxNa9r3r2fzRMeP24C2fszSsjUUoWOaaWVQb7zmkAqN0+kQCEjWRZL5p1f5a43sabKfE
 xUWQriNv64GXPu7p1JJCUBRn54xHqlLgqwawUCOG5ZegUBxzKHCh8F61nJihyn3C6f9L
 fAwuEiDyzmx/KTxj27mphrRp2GK++1JpzNR4zoPUCwbvlorirJmsR0tHrbpZU1nvI1rj
 +WvBnctBbCkT6zWJE6T0Aj/Pfo8KfXmXizN9xSncESWiq1Qq9LzZGVTeSVHiIU9sddQB
 1YkQ==
X-Gm-Message-State: AOAM530NVeF58/SWGA724ObBdMOIw8mETQ45hvcxiI9tuAsnJfwKRImw
 bq0DzyapjL+Q8fjhGf9tzvhYFKW34m4OLQ==
X-Google-Smtp-Source: ABdhPJzBbsuMAlzgo6pQRHAkbRYqahbSlTQixxFF9G+xUmm2lvGRQeddunENZlSax7WELSUAX1/xvA==
X-Received: by 2002:adf:fa81:: with SMTP id h1mr7890427wrr.27.1637058278542;
 Tue, 16 Nov 2021 02:24:38 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id 4sm22119334wrz.90.2021.11.16.02.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 02:24:38 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] drm/i915: use new cursor in intel_prepare_plane_fb v2
Date: Tue, 16 Nov 2021 11:24:29 +0100
Message-Id: <20211116102431.198905-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116102431.198905-1-christian.koenig@amd.com>
References: <20211116102431.198905-1-christian.koenig@amd.com>
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

v2: rebased

Signed-off-by: Christian König <christian.koenig@amd.com>
Acked-by: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 0be8c00e3db9..cdc68fb51ba6 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -738,6 +738,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	i915_gem_object_wait_priority(obj, 0, &attr);
 
 	if (!new_plane_state->uapi.fence) { /* implicit fencing */
+		struct dma_resv_iter cursor;
 		struct dma_fence *fence;
 
 		ret = i915_sw_fence_await_reservation(&state->commit_ready,
@@ -748,12 +749,12 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		if (ret < 0)
 			goto unpin_fb;
 
-		fence = dma_resv_get_excl_unlocked(obj->base.resv);
-		if (fence) {
+		dma_resv_iter_begin(&cursor, obj->base.resv, false);
+		dma_resv_for_each_fence_unlocked(&cursor, fence) {
 			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
 						   fence);
-			dma_fence_put(fence);
 		}
+		dma_resv_iter_end(&cursor);
 	} else {
 		add_rps_boost_after_vblank(new_plane_state->hw.crtc,
 					   new_plane_state->uapi.fence);
-- 
2.25.1

