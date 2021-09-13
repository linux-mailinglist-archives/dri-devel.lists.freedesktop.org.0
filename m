Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EA0408C63
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6E76EB17;
	Mon, 13 Sep 2021 13:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15406E1B5;
 Mon, 13 Sep 2021 13:17:40 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q11so14636188wrr.9;
 Mon, 13 Sep 2021 06:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3dTnv0wZDKxkTKIX7G+9uQukAnU514pBLlNXg29d5fI=;
 b=Lgl8jFt56FEVABP4weWNvGk/OVvu10QCGLGUUofKJsRqFEbGhFfGR1qdVYJQvKSWWT
 nTAjH5rflOIuPro5rPslw3CLOKtWa1ZNMLOiwwT9gOgnTACex5+PlP3KWDyCggFjje7A
 Bbe+GMZq9MbwL2sQsiZTB8YcwWW9vBhWSCfSFK7X+12l3fYMDHuLKiZ++DMXsSrwkJr3
 qCMqaZYpcHHEcPIz0HCpzA/RGM8yJhiXdXEObIKr/fyyiW9DMa3RfvteN8NRzyOQuSRP
 ug8LiQq46fFt1Kk5caTZm+hLk8R1MVAVCXYVWzP0S7314Ra7SERyUcWGcRCJDm6mnZVM
 c4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3dTnv0wZDKxkTKIX7G+9uQukAnU514pBLlNXg29d5fI=;
 b=wLKIx62GCPpCuFhzv7QV5+GyH/BoUjFLjlo/CQtxQi0E9lGGY2q98gh3SDoEoPYMN0
 Q0tw+HrS4nCyFJP3Ttm1/EhMZEdSFo4iil6p0ZNao6VqodXI4NfWLr2MKH9TaNE8oYNw
 aAqtReCrCSlpZYx7qhKTHFCavpdFwio2xRa2/Si0mwvgsdYWpfh2nuMVKmfsMcELcAcD
 MzAkTYJgJ/wVc6NEE9gQMhQGg7qklj30sEanLsqYiIKLk/4IOnN2og5SbgCzLwNa4ppu
 XWh6XkvUrfAyf9l4gm0cH+96T9ysuc9Yk65NoZd+EdD3RCdbDDYq7yeFCufIUeZBNSty
 fogQ==
X-Gm-Message-State: AOAM531ToEiAazrquSUnW7WMIe/252dMPXVTOysVCyrUv2aFWJ3oSUSN
 p1+YfCNQdBcCJy0gyecd/SQ=
X-Google-Smtp-Source: ABdhPJzDYlRjaCjqMmgzMr0ONYoy8hQKmWyShaF7QubY5uWmm6+5jeTpCRHXkCQI288FNs6ni5jddg==
X-Received: by 2002:a5d:6292:: with SMTP id k18mr7102371wru.110.1631539059525; 
 Mon, 13 Sep 2021 06:17:39 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 21/26] drm: use new iterator in drm_gem_plane_helper_prepare_fb
Date: Mon, 13 Sep 2021 15:17:02 +0200
Message-Id: <20210913131707.45639-22-christian.koenig@amd.com>
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

Makes the handling a bit more complex, but avoids the use of
dma_resv_get_excl_unlocked().

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e570398abd78..9f51fef82644 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,6 +143,7 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
+	struct dma_resv_cursor cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
 
@@ -150,9 +151,13 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	fence = dma_resv_get_excl_unlocked(obj->resv);
-	drm_atomic_set_fence_for_plane(state, fence);
+	dma_resv_for_each_fence_unlocked(obj->resv, &cursor, false, fence) {
+		/* TODO: We only use the first write fence here */
+		drm_atomic_set_fence_for_plane(state, fence);
+		return 0;
+	}
 
+	drm_atomic_set_fence_for_plane(state, NULL);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
-- 
2.25.1

