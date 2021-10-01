Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C129D41EA8B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9D36EDEC;
	Fri,  1 Oct 2021 10:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7E16EDEE;
 Fri,  1 Oct 2021 10:06:37 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k7so14492950wrd.13;
 Fri, 01 Oct 2021 03:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KGewx1QiQQVkw015IvGnnogZeqnpnoxIhP9ykI50FyQ=;
 b=Cyh1S+VO3uhIzwT/x7r/+ke6Tw/sa5XVJuThgyu+evB5Z5y/CWutZVCiwpCfFHZegQ
 26g2VRhhPd9KX0OahtFF1IqXac+YyHgvNSG+BpcuOZhLk6rSPqls/sVfH9Wsl6pjbXUB
 XsRKnopUjSmdmOFWLn/0SAswKVinKLLZIOOJ68Rji+ehsq9pT/XNSYhgJl3p4zqWjxdG
 qRMNY3UTJrNN4+H9YzyNpl5HDZW6MDXbSwuFyS6RhLSt5i+dUEBzxA8h8vacLvnZfnK4
 XkBWBukDRFSr/FdkYI1aumJo88N0+S3UmvOt/8HN1d6x0qt8I6r1t141kR5TM+/8VbRq
 N11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KGewx1QiQQVkw015IvGnnogZeqnpnoxIhP9ykI50FyQ=;
 b=1SV5xAOIuCgLk1reartEK72ATx0bde5J+OMgqnAS26v4KpZglWBxAgt1K1rTxmZueh
 0XNHVdvcXsyw+4NrBf3PikUTMC+jF5H0kzRTb06m3Gc18Y6efFeIoeXQYajp/dkQJXMl
 fpFwqd1vrk1KY0wkVC6xiC59lFjx1wDg6FAZ5WuufjJ48BGwagrlSzQgy8llGataiZfo
 frUFMLc4av0KeWZMvO3kbFZymd04Rv3TN1abHNpx2tdWaLY/Oz7VWB1tf9RjqVRIu7YD
 mvmIVphP9Ix62GX8Tm3EwGpVN4oJOuvqqCB4msTspg0nKoHw7SnBvYEN89Vn2r/UHF/v
 IfkQ==
X-Gm-Message-State: AOAM530ywV8pgvFVU4ldZVGSfXJf3GH+dklKK/vnCuKho7BS4lCo6kBW
 UzYleBs0dwnwUB/XZRF0RIQ=
X-Google-Smtp-Source: ABdhPJwhtgvOI7xyayup3oIPTfuGI4IkHPBzz6DTtAC78R48IvmCzllr7F2U4ngGqkW0ygDIrfd4qA==
X-Received: by 2002:adf:dc0d:: with SMTP id t13mr11183115wri.158.1633082795955; 
 Fri, 01 Oct 2021 03:06:35 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 26/28] drm/nouveau: use the new interator in
 nv50_wndw_prepare_fb
Date: Fri,  1 Oct 2021 12:06:08 +0200
Message-Id: <20211001100610.2899-27-christian.koenig@amd.com>
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

