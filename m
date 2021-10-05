Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135B6422558
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 13:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAE96EB6B;
	Tue,  5 Oct 2021 11:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CBA6EB69;
 Tue,  5 Oct 2021 11:38:09 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id e12so16509002wra.4;
 Tue, 05 Oct 2021 04:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HMzUm0lSAp/TufSF81gwSiHnNGVLq2ZvLYEQaLMOzyo=;
 b=hhHpVvwfMnnHwI+vQ3XITa1aQYsSBFoaZX0m247XUTVUdPyi95aZsOWAs7pWOTaUf3
 HyrNaZMY3shrmKT6IZaoAgBOlgpaLvyxlEKzD5Aa4co3S38LnrObkBVf26lJlSiiZ78E
 wPBaDXTyaPiWKt8NUSKjz8+S21sWA8WRXW4vHLXV1PNsmqbNmFIrAHO7AnmWQeWaQgI+
 /tNXHVnNmRPmFecmPczhHyy2ofUQjy2Cy6a2or4Hts3yJe0Jk7UBZ/XbJMB7RbHSFSJk
 lJ4l4nFr2v9xdRbe/N9A38ee3e85egb0XrEAsR97AAIyBe4Lqg67phZau19YDCuextaW
 nl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HMzUm0lSAp/TufSF81gwSiHnNGVLq2ZvLYEQaLMOzyo=;
 b=ruw0Y0fqiFhADzpYGM//+bqhAF1zCQAjL6VrIO8yzbQ15RHQqs1wuDnj4QQ+AUXvrz
 HgYm8IlYym5M7z1jKQZxA2b+5McH/AmTm2maMoGlqdAnjbyUDCqQRtNtHiDIeM/GilOT
 WWcPmqbxKMfE6XWHqhxF3ZlbSJqMCnk6/i6umHNfGQSYzB9Uv/06/17niP6EZ+iw+vln
 LAfLXhXzHnm1iDDskfCni6NaEk4UuThYToWYXvxYqlgX3u871sxyOzphUDChS2OhmpW2
 lphq5amB6EXXLvyPWSTZ+C0T/LK0Jn0Am1SxHpYHzQX3PrpFiia8n3cF+QKikGXOSS6H
 KXVA==
X-Gm-Message-State: AOAM532pl1sqj3/sor8AE8Mhs6Guah9mU8935veo+/Yyf0f86FMuJs74
 OwhacW657lQ6xVvsnQDboMM=
X-Google-Smtp-Source: ABdhPJyUGvcV1ZwGKRs9V2vqonO4HKIO8QTHt0jxiHgx2NA7aB6xjsD2Mr9jkJgmiZDsWbX6ey+rEA==
X-Received: by 2002:a5d:500f:: with SMTP id e15mr6173258wrt.90.1633433886565; 
 Tue, 05 Oct 2021 04:38:06 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c5sm1739912wml.9.2021.10.05.04.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:38:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 24/28] drm: use new iterator in
 drm_gem_plane_helper_prepare_fb v2
Date: Tue,  5 Oct 2021 13:37:38 +0200
Message-Id: <20211005113742.1101-25-christian.koenig@amd.com>
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

Makes the handling a bit more complex, but avoids the use of
dma_resv_get_excl_unlocked().

v2: improve coding and documentation

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e570398abd78..8534f78d4d6d 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,6 +143,7 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
+	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
 
@@ -150,9 +151,17 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	fence = dma_resv_get_excl_unlocked(obj->resv);
-	drm_atomic_set_fence_for_plane(state, fence);
+	dma_resv_iter_begin(&cursor, obj->resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		/* TODO: We only use the first write fence here and need to fix
+		 * the drm_atomic_set_fence_for_plane() API to accept more than
+		 * one. */
+		dma_fence_get(fence);
+		break;
+	}
+	dma_resv_iter_end(&cursor);
 
+	drm_atomic_set_fence_for_plane(state, fence);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
-- 
2.25.1

