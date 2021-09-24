Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C80044177CB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 17:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84EB6EE5A;
	Fri, 24 Sep 2021 15:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5870B6E1D8;
 Fri, 24 Sep 2021 15:31:43 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d6so28550946wrc.11;
 Fri, 24 Sep 2021 08:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KGewx1QiQQVkw015IvGnnogZeqnpnoxIhP9ykI50FyQ=;
 b=hef6b05hQy+5lGerGWpcfLcr9CeyiiWOn1lDY3P3sgSPdAg6Nb+txTI3e7Ym276Coc
 BUmcrvtRlg63/BmdOK5uhpfgtLSoyr/L6RUKzu/Ct7NAbo17Qhb8aR/3KwXoMnJFNDFp
 RDbXA2+0Bnwyi7I47FHZUjyj1KN7amdrhZiCQJ406fGjD6o/vP5JydsEWwgtZpdTYvyB
 wOFv/6F/YNr1LHOsUb8SbVNSQTRM/VUovKgc751PksR3+qI27eTUQmsaglPU7+crkhXG
 gvXcPxVHpse/eyifuhbJrWCL22RzvujeHGxTcbVN3e/O6yi/0vd2LtfLGY01dJC2Yrks
 Dxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KGewx1QiQQVkw015IvGnnogZeqnpnoxIhP9ykI50FyQ=;
 b=DCrmPMbXsaKPR+cxhECWfUBLuWrTd6AqxQSUFuAIDvGB5zA4EsDLLJiCI7crmqotBU
 WA6HipoP60Npgql5iFVjfTVtS1Y5Z/T3yLYiWe0IQh9vV82paW6WfQRuNWQgGGK0ED9q
 jgjWhJHBk6bfZb+uGmH0U8uo+3Gxw6HZFKotMbkPyDwvDQ4M+gmpczWTHoZmE3o+G6UB
 u8jx4H4UdUkY5bwFYbu5sGjW0rcaWh+mMqqHmxKp0v4T8oiiXBQEH+EI2UKxgH1zzxX9
 P/H3U7gEhNMSSc8xwql8SD9WFJKJCHDKnQA3I5YGT/eGQWNavtfpDmht8O4dxAICnWvZ
 oPLA==
X-Gm-Message-State: AOAM533kXlu9G/wCalj+/tdNPlg8u+SlleOH5KrrO8w1fHr/pvEyOVKn
 uWLx4Me8f2j/SWHgbz+vKAo=
X-Google-Smtp-Source: ABdhPJwCQ50FiYFb6laK69EQMOH+0x7uDi595rBzL2mWBKY4VTN0iDpCqcFixhE+dNDw9UjaQDD1KQ==
X-Received: by 2002:a05:6000:184e:: with SMTP id
 c14mr12162487wri.242.1632497501846; 
 Fri, 24 Sep 2021 08:31:41 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u25sm9902248wmm.5.2021.09.24.08.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:31:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 25/27] drm/nouveau: use the new interator in
 nv50_wndw_prepare_fb
Date: Fri, 24 Sep 2021 17:31:11 +0200
Message-Id: <20210924153113.2159-25-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 8d048bacd6f0..30712a681e2a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -539,6 +539,8 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	struct nouveau_bo *nvbo;
 	struct nv50_head_atom *asyh;
 	struct nv50_wndw_ctxdma *ctxdma;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int ret;
 
 	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
@@ -561,7 +563,13 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 			asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	asyw->state.fence = dma_resv_get_excl_unlocked(nvbo->bo.base.resv);
+	dma_resv_iter_begin(&cursor, nvbo->bo.base.resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		/* TODO: We only use the first writer here */
+		asyw->state.fence = dma_fence_get(fence);
+		break;
+	}
+	dma_resv_iter_end(&cursor);
 	asyw->image.offset[0] = nvbo->offset;
 
 	if (wndw->func->prepare) {
-- 
2.25.1

