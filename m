Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B07B42254B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 13:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9C66F5BA;
	Tue,  5 Oct 2021 11:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFD06EB53;
 Tue,  5 Oct 2021 11:38:07 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v25so26045603wra.2;
 Tue, 05 Oct 2021 04:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ETFFVmDbRxb5cxrXOen58gkxhSGsPJL2Y8O/7sOAJto=;
 b=Q8EUxwvnAaw0KU8R9kZ0Sz+WeJ22WlDpfAEoJOb7XLrNnpTLSLMRzcx6RlGvoS/Amg
 i3Mi4/rvMmTh9KKheFN771iKJ1+xRJbTILtLHNdXPW3cS11jVXm47mQCeYaWdiO+5sVO
 sKDVxWqU+qfD8UunB/fwMoTsU+Fgpztynk9j3oeMaP8QNprsq+KTCS6BFDyZLOu93gjO
 N/WEvtA1iJuUkzHUCsvWtW/SQlUzENXrKHoBeZclFiDHnHV45eZnSnghl7YA5mCmQv5r
 o75JjeEVUbuiCw1MNgbszDij3OINaNWqYkFRiIE1lr780ie+fG8gB005VSQ0dxlJc789
 giiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ETFFVmDbRxb5cxrXOen58gkxhSGsPJL2Y8O/7sOAJto=;
 b=amEzn5dO57F49Qdb6aj8sLtWPCDCQO96Um9IBGrwLx5STpB3s6GBnGd0RRHEmVkg0Z
 fNx+zSA0XQ0pwmqvEZG6NNjBNgG9mQMUvHtPvJLOU8cmttB8ZcInxL/bVLiOuShPSKza
 +4fyu+Y3WV3Yc6ZCeVRGSbnpWVPnnqnKGI9wPKNlQlIZ2JGue2F2lXK0CcETWjPTMmoS
 +otM9kfO9wz1gVM4WfcLpXR740lcruNIka5kPkE/zyGMGhuZDISAJDIAqNKKC8JvUfja
 BvjsWGIInRpvtJ2/pbuhDdMXq0ixIELGLNcgrFCuRnSqTX4e1C3uph1MS8T1BOteY0mc
 g2bg==
X-Gm-Message-State: AOAM530T9Zguu+bL9FIGuk3YqQ4Mv21WKIMJWnGDCNc41b3q0yGpCJb/
 STz7wscdhibWKdewfhQhe7b6n7nVYQc=
X-Google-Smtp-Source: ABdhPJxHAmrnhVoif7im+jImnXfY9tw0u6/XOS5J2l/2vyGHeMz9zAZjxIcwRbxfexG/MHiPmUURng==
X-Received: by 2002:adf:e8d2:: with SMTP id k18mr1176818wrn.219.1633433884867; 
 Tue, 05 Oct 2021 04:38:04 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c5sm1739912wml.9.2021.10.05.04.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:38:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 22/28] drm/i915: use new cursor in intel_prepare_plane_fb
Date: Tue,  5 Oct 2021 13:37:36 +0200
Message-Id: <20211005113742.1101-23-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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

