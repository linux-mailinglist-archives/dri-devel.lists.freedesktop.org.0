Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950F74614A8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026496F51B;
	Mon, 29 Nov 2021 12:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058AD6FA62
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:28 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id c4so36234870wrd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xR1nHIQR+HY5rurJTXhG523nepCCoi6AKz+ZxgPV9e4=;
 b=PrARlWxKE10sEnLh/awOxujQsuzZME2kfIbZ+NkhLa+a1Qwd2/2TqBRn0A5c6/U+/H
 6cze3wVzcIwRa5jjPtk1yQFK1it42KOsc0sNHCn1mnIhM4+GyfkCZoVfDiuSrnASA9vH
 wHoxJ4svxVIoKDsb3JHo0J94QdXFxViXp3S6M/PBc60kQNefGtT6wk1U4ee0/YeJk4mj
 JfWgPkr4UhBwlZeeoJaD0bRumi/tTc/PeO3CDiQ4LG21GIaroOmlXTuF7EvxwIfhaVoR
 IENliQaPJQdjz9B63cWkJ/0fU5uDoP2kGhujJGfAtObxIZKwCFEV1beEvQReHNPlywyD
 ib4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xR1nHIQR+HY5rurJTXhG523nepCCoi6AKz+ZxgPV9e4=;
 b=Ouo4cwq5K/n8v1YrnVxqjOgEMq7MBcL6yj/r9avt9bGmF23FFn2KPio0jwutep+Ku6
 YpIt8rRf6ZrjdumEJ71vUD6v9wFvVoH/I6znHNlL+EqHnyFDbFCncORAHt3EDwkVkqYE
 M2FhkK0TEde1GfGRv3+P3mOtawREAZ3KTt8/69juDl/3L2GW0Ej53e3hz1flpssxy/w4
 h9S6oV1ijAj2APvOtWMD88LjfTRihLVVTpZsClv+ktQavzLC25A67yRAFtxhOYr6U1CI
 FX0vEomOJsgnjjRaVb5IPdl+gI6A54gSxOq7rXGP8cmW+Qc44q8AfspQYIvEPmTisGVF
 ib3w==
X-Gm-Message-State: AOAM530/TmhCUd4IOjiVJ5WdxcWHqy2TtVmNpXYqTYe52/MKz47Rwyrf
 mGQWWRkQYoBH9ii1PYkthXMCiWdEmJE=
X-Google-Smtp-Source: ABdhPJzzdlceodIRBmlFEQhUB8Cs4Zy3gLWxC1Aw5MEGHc38yEUkK/zYjhOxO867+NmHzoUgucPFdQ==
X-Received: by 2002:a05:6000:2ae:: with SMTP id
 l14mr33388815wry.142.1638187646630; 
 Mon, 29 Nov 2021 04:07:26 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:26 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 19/28] drm: support more than one write fence in
 drm_gem_plane_helper_prepare_fb
Date: Mon, 29 Nov 2021 13:06:50 +0100
Message-Id: <20211129120659.1815-20-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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

