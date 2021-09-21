Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE754138A4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F576E9DA;
	Tue, 21 Sep 2021 17:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDB16E9DB;
 Tue, 21 Sep 2021 17:37:21 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id w29so41598707wra.8;
 Tue, 21 Sep 2021 10:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ETFFVmDbRxb5cxrXOen58gkxhSGsPJL2Y8O/7sOAJto=;
 b=QhCKrDzPfcfEU0KtJvi1gojE6N+/J83swBeOpDwU3RnRQYCM5FjQMnzSWCWOE2sA67
 XgVLmnm0pruKqhf5pyxpjN5oQ1Nx99Hp1OmIhp1BB0y6IEAekIA4YkclBroqS6GfBPPV
 r5CvBvgposNwBuJ6DxZunG37NHd+9LQh+NyEt2PfvZi3v5t/fMvtCGgGr2AqKHLKZNox
 slesdiklcO5UmcbA0OtgiVGygFvSauR6WWVk2fVZ4nfeozVEmZepK5VU7pCJPydCS0cw
 IxTCo3Ho7q/eBUaImRIQYxgp23nVkoE9069kHfqIyxdOgCAXSmO9CQPYQRJlyv0gReaR
 +SAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ETFFVmDbRxb5cxrXOen58gkxhSGsPJL2Y8O/7sOAJto=;
 b=UDO1W2ZlPZtACDxOfnIIUsRv6MtjAyLZdbShHCFxoXCQbeCGo+De95VVeBE+8kP7wC
 T0YdaYwgoWl/cJ+4Jjnt3dcy13c2tBDIHNLpZd8C1gXNrtYg3fdHtX2gFxgUZsg4udx7
 sl/g1TmVZSDpC29U7Oina8wNtGg+UztICBoMne/4CtNsd9fKJdlJ2oryXInIk6WoejTA
 fCrTCLD7zYhuzAYUQGeMv4oaPfMmhONSQKB5SFl1Uv44iip1mwAK/oOo7LLhrsSNT96E
 idS0LvsPotYypUjNYU6ied7y3S6XU3roIMvCPEHrkW3c/1x2Bxt9cz3f3iaAg1axFyGc
 iIag==
X-Gm-Message-State: AOAM531PX4gYJQe7mxdAVQyn8OsD/kJf0ekVj/CqXcM9Z65IZqD5yFEt
 ++4bqLEg4h68WSHexndDpTs=
X-Google-Smtp-Source: ABdhPJylGvEYr8kt+PxFanhf0YCoo/262g+dhG0tZ/kg118lPNrqeIl8pVy5RsNKsDS4Y5A66FprQQ==
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr35888328wrs.316.1632245840393; 
 Tue, 21 Sep 2021 10:37:20 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 19/26] drm/i915: use new cursor in intel_prepare_plane_fb
Date: Tue, 21 Sep 2021 19:36:52 +0200
Message-Id: <20210921173659.246165-19-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 134a6acbd8fb..d32137a84694 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11290,6 +11290,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	i915_gem_object_flush_frontbuffer(obj, ORIGIN_DIRTYFB);
 
 	if (!new_plane_state->uapi.fence) { /* implicit fencing */
+		struct dma_resv_iter cursor;
 		struct dma_fence *fence;
 
 		ret = i915_sw_fence_await_reservation(&state->commit_ready,
@@ -11300,12 +11301,12 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
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

