Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFE845A557
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2E96E831;
	Tue, 23 Nov 2021 14:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8836B6E59F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:39 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id i12so18894807wmq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MHiuy8hFM9J8q0FM4IEtsQAAAvGX3NWM32T+WyyUIsc=;
 b=Aap9qb0CGJMazHPh76Zb+XR1OFS8Jd/j6yOThIDHqJ6I7ART5j3CY5Ipx2vkhBzcze
 QlI7onwvUrpPJY9975hB53OwS3Vy9uPVDO8z2uqK00BFn3NtLS2WWDTH0nYEq17ZRaXd
 NVbIAAtVVhRUkFwmDnCpIVN9MZW6l0/i0L2b14TR7QHs2hPT3sUW0i+Z4VjpSc6KF0KL
 MCWEIlyf8P8lAHUGA0f9oj7TSfxyjtJq4VjJ5OYtQ/R4allQQPRZpEZZFaWkaRYcvN+3
 jigULy1EE+5MzZLa4ZjE5k1kDEKydxv1lyxw1JiIokAki8vmDSBdOTuz0dyMU8YbVFzD
 sBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MHiuy8hFM9J8q0FM4IEtsQAAAvGX3NWM32T+WyyUIsc=;
 b=dVsKVNSe0Jz8rHgD+adt3Bfhej9kZ4jLBxhelHO4ju4aQr6SRD67Gswbh2SCWflsiF
 U+COYUv8TuwdM59xN403wKjd3B89ANz15Rhhbhuz6BDS88TGtPf9p7Ksm515WzsaV3rh
 au42+uy/kzVsQQigDcHTjKdzo6ZymakHZstJx9HcOcGKmSOUO9UVrKWDx6RAFJq0xUc5
 +FG1OsXWGqi4C+6tKkmoUEQrVZQ4LeU7ALNmoFl4cJwqzjUqBLZEQPdVsZyxViahkRhN
 /s5dINbbs6k0PIUzjaLY1Ed4RLNs6Au6sg+nZwqNMjBRSdRMwWHojJMl6tXTHT2fcNg3
 9cIw==
X-Gm-Message-State: AOAM532iDQYX3FHA340SB6V8cE5lPxjfQVJVN4Rysm4zjW3Js2DDeK8U
 IDJWrsQPVtULiIUAwrbT7UE=
X-Google-Smtp-Source: ABdhPJyZg/cZ9stJjKdPoHG3fhLgr87QipAPe+4ZbOIDj9J1X5VBkse+LtX/RaUO8k5CsW0Rixncew==
X-Received: by 2002:a1c:1c8:: with SMTP id 191mr3498372wmb.90.1637677298054;
 Tue, 23 Nov 2021 06:21:38 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:37 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 13/26] drm/radeon: stop using dma_resv_excl_fence
Date: Tue, 23 Nov 2021 15:20:58 +0100
Message-Id: <20211123142111.3885-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead use the new dma_resv_get_singleton function.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_display.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 573154268d43..a6f875118f01 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -533,7 +533,12 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
 		DRM_ERROR("failed to pin new rbo buffer before flip\n");
 		goto cleanup;
 	}
-	work->fence = dma_fence_get(dma_resv_excl_fence(new_rbo->tbo.base.resv));
+	r = dma_resv_get_singleton(new_rbo->tbo.base.resv, false, &work->fence);
+	if (r) {
+		radeon_bo_unreserve(new_rbo);
+		DRM_ERROR("failed to get new rbo buffer fences\n");
+		goto cleanup;
+	}
 	radeon_bo_get_tiling_flags(new_rbo, &tiling_flags, NULL);
 	radeon_bo_unreserve(new_rbo);
 
-- 
2.25.1

