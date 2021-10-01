Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A913841EA88
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01236EDF8;
	Fri,  1 Oct 2021 10:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6A36EDD4;
 Fri,  1 Oct 2021 10:06:34 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 m14-20020a05600c3b0e00b0030d4dffd04fso1049427wms.3; 
 Fri, 01 Oct 2021 03:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ETFFVmDbRxb5cxrXOen58gkxhSGsPJL2Y8O/7sOAJto=;
 b=QZ7jIyUtRkqWi3/s0K0fbEd02lkzUinpljPHbXZlqpmhMVHLiSbCFHJYGGybWrA8Jm
 HmlcLkCjz/B3Fueg7T2MO5A8CIU/W5rd4QtclWoBYabjupoj8UeoRe+umMh0ARSQw0/u
 LfYvx0aumLyVdqSznnKPD5m3G2+hL4QJPRT3HnfhrMe6+oTZBmZ1CCYjBgEaNjOExPEA
 sLEBaYfijWq74Ou5RZjifErnWjzojo2EBTlbg1IhoybYLlE2at/N66Jh/qcjIUH8RRmk
 LIs88T6grbCdFtMQCcdovIRrzZPeQToDAmDTSo6MlGwmippZzNCB4Ffi/D6qJipiYHLB
 +p9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ETFFVmDbRxb5cxrXOen58gkxhSGsPJL2Y8O/7sOAJto=;
 b=P/xyiVLZaQSwpiwgrhwYpKJDNylJWR4/ubiBfjvW3cy/uH3q48whB2+Z1QpA/fOtx8
 Pfx24ovOBKDC3ZN3rCiuC+hIjLHaFMS/P2PfKAgyfYbYo+Db86lnpRnvNwkqke/dPw4x
 Ppc2Euo7JVqODMn1Cp97X259ig86+eG/AuAw9ecjnEWtVaD2MowbcX5yKc/I3LHaQ3vM
 YZ40h/snfg7/vW5AUgIBPDUoAq4UekqkfwfF77ApZ8m5qxSLmBM1vaDUNbzNl6/VYk7x
 2i5RsHND59S+zwGRihchhtt3evLUxqcs5j9bPpPAVkpQ7O0qSQ3XSOWCmQZ13eYWwz2S
 3Uog==
X-Gm-Message-State: AOAM531y9CUboTEPihI+9fl3deGza8RwQrKkVOHLZoVxoG0ySXcBHjwQ
 hosb/M/6EO4EpNyesQ2Tx1M=
X-Google-Smtp-Source: ABdhPJwnczMK6QJ2ymumuKHZRC/JtWjIcbjAHbL+u7jejn8qlHzl8dTw34Cn0jdZd2kK2n/HjgmQuw==
X-Received: by 2002:a1c:f609:: with SMTP id w9mr3585301wmc.24.1633082792628;
 Fri, 01 Oct 2021 03:06:32 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 22/28] drm/i915: use new cursor in intel_prepare_plane_fb
Date: Fri,  1 Oct 2021 12:06:04 +0200
Message-Id: <20211001100610.2899-23-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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

