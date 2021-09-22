Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DABC84144D8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A7F6EB2D;
	Wed, 22 Sep 2021 09:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA986EB27;
 Wed, 22 Sep 2021 09:11:06 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q26so4655131wrc.7;
 Wed, 22 Sep 2021 02:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ETFFVmDbRxb5cxrXOen58gkxhSGsPJL2Y8O/7sOAJto=;
 b=LqUJwJ5dTwz9Ccg3zxiCpRnEV/yA9uLawfa6FJiR/0RnWrkkuh4XjA6iKcDyOptDx1
 z92jkLWEozHSvUqtcXvUK5mF4aTZN8jqBuYlyn34Xw3W1209+5lTU6G9pCL4HRbCHgHJ
 oOkm+IAueTXTM13tQ0KhXsscI0rAEJtDzxfSzAEsDyf+/Inew/YDr4C0LVFog169GoRY
 ETL6HQ+XkIlBGqepCHPiLIMNusrSgmsqU04677rjaMpg8VPvVKAN7lPEEmRgIumKshDJ
 inB6Pw0ZBLsAsXYGsGUUR98oysMERXY80DjNyMNz1u8HHjnb6T8U3b7YUoOdLgOjllG7
 Aksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ETFFVmDbRxb5cxrXOen58gkxhSGsPJL2Y8O/7sOAJto=;
 b=glXnQUek4BEUICxua8Cv5qryAJttNoBZy4i41Yeyq4hbyxj3ZC4Tages92b7cXG17U
 Fq26fhdSoDXbsf/OPEu5FcCCLFfipzc78blimMPayD8O8vFo3dYwp7mJ+SzJZ6tS0vxL
 an3+opbylFUZE5QrCAYG8TK9aLo+hkjGrID6NhjAoxM9uSK7sWG8uiK2fUph9/pY+v61
 b37+YfRLNOLB1/2fe3xO1w9VCBI7SUHYfDiYXgd0G5Zjl7Z7p1GeuXeiumtJ3KGFNAkp
 bw5v1LsKP3BkoxNGQ37hLpIYxlnfEu8ga7xZbEJwMEr5sMP+kWU/nbyN7om1T8eWt1Uo
 fJ/g==
X-Gm-Message-State: AOAM533i48xQ5sViNqe6Ai8+PjQSv1r7nxGKdbnvOBbX7NXZuMuz3RKq
 I9Oi7GabCaT5p/8L/ZZlKJE=
X-Google-Smtp-Source: ABdhPJyboeav3w2cn/8uy1T7X+6TV4gmd8exyOvXYiSyHGHiYKGpMjjhAgvC3dJNRa+PVsbBJcPqww==
X-Received: by 2002:adf:fb89:: with SMTP id a9mr9829560wrr.164.1632301865462; 
 Wed, 22 Sep 2021 02:11:05 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r25sm1535515wra.76.2021.09.22.02.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:11:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 19/26] drm/i915: use new cursor in intel_prepare_plane_fb
Date: Wed, 22 Sep 2021 11:10:37 +0200
Message-Id: <20210922091044.2612-20-christian.koenig@amd.com>
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

