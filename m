Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF1F46BB42
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 13:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CC17B7AA;
	Tue,  7 Dec 2021 12:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6F673858
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 12:34:24 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u17so21837907wrt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 04:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MHiuy8hFM9J8q0FM4IEtsQAAAvGX3NWM32T+WyyUIsc=;
 b=Y+hr4KgXcRYlg2AL5TUx/Lvbyq/Xvn6LXODTNFfEvNUT6g8YsKLk+Alfj9N0hV2tKQ
 ki75IGuOZjQejcLYDNFc9H1I1cYdcFUBAzX+ArSb8Y4hNpOe2psbq1NIvuyOL8N2tYg9
 2dy5S/Mqk5YsSvuMZaBiAPvSk05GQDlpEpIrpQGqzmRr0ahPUzn0ob+VFGZVg5xFGduO
 WMOrJxZiYmLQE4pom3D46irwgpj6BlHi5y/6NKbi7CJtMLErVVxxxOlMd4aHnXQB+DIq
 7uczyZIAwsse0HXaJbFh1Oqa8PD5BpSr9/kVmJaZEbMS9QIJeFvcPDx3IW9bKC95Ad0k
 9+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MHiuy8hFM9J8q0FM4IEtsQAAAvGX3NWM32T+WyyUIsc=;
 b=0UVTEDGF1k95iy/qJt4cRaLNSUwtPzmSjApxp+c41KRizyT8MP0uY3rfVc6racT0Mo
 pMh/jKMdKR/GLumFa6fDaVPJUY+IwBOuTc2PmTunm9+NRM8+PR8jT0pOZw4H0d84KPIt
 bLOe1Hu+IMi2lHdERwk13DAWu1jok3KnNR0UYIJS8lbm545v/EgC8fMSGRwfVhudDwxn
 TbGwC/nWvJrbllrFXmwB2msU2YkeybOtjKEQlzShtQP3wHKbOrs9SyNue3BRPNBeOO9U
 /yOZY/yd6G6iC9B7WoHgb/0zJVfsxJrHy9VsWq85iwdOlQRcTmCVkyQ5nqV9USZ0s5ra
 G7Yw==
X-Gm-Message-State: AOAM531BpqzN1iKWrR938NusmHXRzrb7gCdxZGsx95EctyxhnxjVhDL8
 wYzv2Pi4GHyzhgBA/qKZXbk=
X-Google-Smtp-Source: ABdhPJxTYxD0RI3PjI0sUFLGAXoyxrSp+JUq8J9ytxbHZy3ajralYS/NFY+EP9Eg+mIgbsLFAcKFNg==
X-Received: by 2002:adf:f749:: with SMTP id z9mr52001158wrp.379.1638880462755; 
 Tue, 07 Dec 2021 04:34:22 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 04:34:22 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 09/24] drm/radeon: stop using dma_resv_excl_fence
Date: Tue,  7 Dec 2021 13:33:56 +0100
Message-Id: <20211207123411.167006-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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

