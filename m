Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05056408C65
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4BC6ECA8;
	Mon, 13 Sep 2021 13:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459656E1B5;
 Mon, 13 Sep 2021 13:17:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t18so14702044wrb.0;
 Mon, 13 Sep 2021 06:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lbgl/54L0ByItbAbC8EzWBEvSdtx8l90TnELASVZX00=;
 b=iJOKoRQZom4Sc7ZUlbp5EvyaFDX2nTXiE90tOHQr5LZQj1/XM3/yBZ8JU1ePegl24p
 r6nsTk86W7bicIEP0bSzE9Y+5WtaysTHNMU6W0g6hgtJr7rhx2NXZiQ8eke4Ja3ngow8
 p9K9T/pz2BZmONYjQWE5ehxEaT0FrXul22H0cSO4m5p+FAawdREtEtlaqtJ6+I9ip9Ep
 HwX2lJwtK9U/VpioFFhIp/9yGUy+s1yPkI/aiS1EWekffaUXmOQm60cnDRb+cs/6zy+C
 03PMjR3yDLMvjvDRKgddWpLbuJ7u2CAW4Yo4jIXoPcu3HdZo4h51MIuAjU38t4bl3QkN
 Sdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lbgl/54L0ByItbAbC8EzWBEvSdtx8l90TnELASVZX00=;
 b=e5GkHGah8DGnuweXNYZAXhYsD2ji6UvoHmj7ta6LH0eGybNQNcbtkRl+Qw6x/9Xfsx
 XXUiUFJKDQZbIQJux9luQRlhbZIgVZ8QYYqGy/OdugadYZJ7d9Bil4JHIDhaBTfxOCvN
 g2LPp9XWVCZoQHX40gYFEG60YlZgGEw3hSl+ZAwthiaEctHJE5LvYvAn/9Ydp1NbHw3c
 q5alr0gtsyKxqk2wtpJb0Ty2ii/Rq8jZtMQoGtuCeelVM+3UDzdXjFXRfeNVZ4Nia3bK
 kup/iJMq3AtpusNnSoGel+Gd7NJjrr2tWVj6XANK6NK7YeUXbvIj5gaoAdlp7L5nZ9t8
 rzIQ==
X-Gm-Message-State: AOAM532WkvHK5U6s4rChoPF7bApQWVgwlx2c8G/VxphIIeVBx6J5eQ/V
 l+Zfx4yAXIJ1llImE87MZFGjP9SAvb7FZkFZ
X-Google-Smtp-Source: ABdhPJwPrQJseqgxCrrGZ8zPFDwH+kh7wzQ8kZ7/U69mWduIMhCl9vLHUzDTMpvVj7Y2mZQF8XonXw==
X-Received: by 2002:adf:c54f:: with SMTP id s15mr12536413wrf.222.1631539056894; 
 Mon, 13 Sep 2021 06:17:36 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 19/26] drm/i915: use new cursor in intel_prepare_plane_fb
Date: Mon, 13 Sep 2021 15:17:00 +0200
Message-Id: <20210913131707.45639-20-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/i915/display/intel_display.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index eec6c9e9cda7..11c38e0f7fe0 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11133,6 +11133,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	i915_gem_object_flush_frontbuffer(obj, ORIGIN_DIRTYFB);
 
 	if (!new_plane_state->uapi.fence) { /* implicit fencing */
+		struct dma_resv_cursor cursor;
 		struct dma_fence *fence;
 
 		ret = i915_sw_fence_await_reservation(&state->commit_ready,
@@ -11143,11 +11144,10 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		if (ret < 0)
 			goto unpin_fb;
 
-		fence = dma_resv_get_excl_unlocked(obj->base.resv);
-		if (fence) {
+		dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, false,
+						 fence) {
 			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
 						   fence);
-			dma_fence_put(fence);
 		}
 	} else {
 		add_rps_boost_after_vblank(new_plane_state->hw.crtc,
-- 
2.25.1

