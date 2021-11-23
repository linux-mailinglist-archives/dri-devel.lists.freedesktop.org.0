Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F4F45A567
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D918F6E897;
	Tue, 23 Nov 2021 14:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C69B6E7DC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id p18so18871189wmq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xR1nHIQR+HY5rurJTXhG523nepCCoi6AKz+ZxgPV9e4=;
 b=BTqipD6axEdvFS1qNdyue067ov95lW4E2a6zp708LmkVTtkeerVpwqnJhPFVrfumv5
 xuFk26cb70nj8GVHRLOG39Vvc7V/P2EZdcXBxNZNOD2NsKSknt5c27AARzTevTtm2l+v
 IzcyNOSovh/8bHnvDDoZQM60pa9MIUQBtVINjJqOtiAhluOxMhPtqxK89mdvMu+vOyFX
 JLWKvlTQxKjNKHvhQVl8vfh+LMGXeWTb0Gz95PfKUPbVp58UHNSo96bX6Nn8H6Oh6mKO
 1GyeZKiYXijk1nFVpBzuBdxGOBTnm7lFJbmry3asbr57LXcqvIAS3Wp4y6jmjODSdzFf
 KGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xR1nHIQR+HY5rurJTXhG523nepCCoi6AKz+ZxgPV9e4=;
 b=Us9XQ88hiaOdc1fEtW7wPiLiQLAfprGGlYpcUMv8ya1+6Z5zTBcjdjxSP1Q9UcCLKk
 Tsyur86+ib8X32JLnmPH2LB580HNiDiGziCfoImClQkgW3yIhkJ1s1+n8pfr85qOCvt0
 aRgbAxkDj2H4AtVkYF1pzGIzQsOTRDfWLIYUbZqK5cqvn+wwcw9ettVRGzKsbYkv5YT4
 d9TwePRDvv9qd0xG/Yz92ZmgBeuqFrPQezbryev850s/gFfUbqc0kj2Rhg0FF2RBt71e
 s5dn8KggoYjPAUc3cJudenxYJhMoZw0c/PPvp9/C6GZscN/qHVILd7DD05Hexrrnhp78
 8/cA==
X-Gm-Message-State: AOAM530HbWxnFb/y7iCSf3u64m09LMgUkjDJNS2b1M+gpX1nq6dAlrol
 /wnQbTKBMjPHUqs3nA8QPvs=
X-Google-Smtp-Source: ABdhPJwsYTfsgAB3lOAVoiiFf/7GcQC8rbzKcBIGp6cEfhtBHCNSmGTA2nFXLk/Ck8OjVaGW+Vb6rg==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr3443925wmi.115.1637677308688; 
 Tue, 23 Nov 2021 06:21:48 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:48 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 19/26] drm: support more than one write fence in
 drm_gem_plane_helper_prepare_fb
Date: Tue, 23 Nov 2021 15:21:04 +0100
Message-Id: <20211123142111.3885-20-christian.koenig@amd.com>
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

Use dma_resv_get_singleton() here to eventually get more than one write
fence as single fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index c3189afe10cb..9338ddb7edff 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,25 +143,21 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
-	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
+	int ret;
 
 	if (!state->fb)
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	dma_resv_iter_begin(&cursor, obj->resv, false);
-	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		/* TODO: Currently there should be only one write fence, so this
-		 * here works fine. But drm_atomic_set_fence_for_plane() should
-		 * be changed to be able to handle more fences in general for
-		 * multiple BOs per fb anyway. */
-		dma_fence_get(fence);
-		break;
-	}
-	dma_resv_iter_end(&cursor);
+	ret = dma_resv_get_singleton(obj->resv, false, &fence);
+	if (ret)
+		return ret;
 
+	/* TODO: drm_atomic_set_fence_for_plane() should be changed to be able
+	 * to handle more fences in general for multiple BOs per fb.
+	 */
 	drm_atomic_set_fence_for_plane(state, fence);
 	return 0;
 }
-- 
2.25.1

