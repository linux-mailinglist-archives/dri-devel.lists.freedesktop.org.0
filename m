Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 113B240D8C9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735546ECFE;
	Thu, 16 Sep 2021 11:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38B26ECF2;
 Thu, 16 Sep 2021 11:31:07 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id y132so4568759wmc.1;
 Thu, 16 Sep 2021 04:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pzZPh7XEKFX9DQzQoersnh2LelUn+sP83XNXRaX1Isg=;
 b=cFKsiKGlG/f3eiSwtPbleVuyqrn0pPzIM4OcXD5nXC8MRfH2xZayXCNGMJwpidt5fn
 6sX7NSsk8TCwNLhVtDlNDcw0StcrF4OwN/6HX2VMcoCWr3psAdgH6pC0Ygvp94kGwsu/
 4t2USnodUSc3oGYa6Vf+hfWuL7AHuiDozepdTTZwOl5IpJ9ucTniOKAvXiUj+l+om43m
 2F/ajuVbIMAcrlI19avwyOly20KlNh3enijkzZZm5ICKBzayBJ4VF6g0+LfGUOBBe/s3
 c1oLkrvrxtIcVbnmjatuVIeBQxUThsN6ZyneT6OJP95VDQqgNB2n+rf8Rqq7ErYwF0eH
 xWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pzZPh7XEKFX9DQzQoersnh2LelUn+sP83XNXRaX1Isg=;
 b=wqYQdEJNX9hxL5Pfo5g3tfGApVpgzyAEk/G+O7LiQw9xEio0aJoq5Pvykg5luSTRnN
 h1X7ZO9F+WrqHrg7Kmcr4U9CkEnvz1t9CtKeskiHXvkNkV0KenujbZmfxVB388G4Coro
 mABiJ3buY3L6YirQMi7b+3bMmoHC2o1cV39IC+WdxgdQH1kQtTh3VzydH4x2ckny1XoH
 smAYiC9HG0kEfKcbNaM5uEPkpJTmhWKnmuAyiG6LzmvqQzmT4Rp1q0rBp25Jjndu9sti
 kGbxroPh9LWnz+sVwN7IzqKH2MhyPJd+6H1gb0RSUqH5arnZr0LIMk+ia5JDqux4GFcR
 hpnA==
X-Gm-Message-State: AOAM531beNUQyoyGjKB+dcWbVCcK2BDGwQmPYYpRZ0/pCTB2Cp89bZtH
 kOHaDAjitR9NtUxWi3uavyf6G+HIKIqr6gmk
X-Google-Smtp-Source: ABdhPJyitUIgIRzXAmim8/WliKeWbdpvyqFeJqK2QTXfN7K8jT5S9EqdRoSfGLjOHSpocHOx1rsuzQ==
X-Received: by 2002:a05:600c:1c9e:: with SMTP id
 k30mr4429372wms.74.1631791866397; 
 Thu, 16 Sep 2021 04:31:06 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:31:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 23/26] drm/nouveau: use the new interator in
 nv50_wndw_prepare_fb v2
Date: Thu, 16 Sep 2021 13:30:39 +0200
Message-Id: <20210916113042.3631-24-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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

v2: add missing rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 8d048bacd6f0..0f5cdb897f06 100644
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
@@ -561,7 +563,14 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 			asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	asyw->state.fence = dma_resv_get_excl_unlocked(nvbo->bo.base.resv);
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(nvbo->bo.base.resv, &cursor, false,
+					 fence) {
+		/* TODO: We only use the first writer here */
+		asyw->state.fence = fence;
+		break;
+	}
+	rcu_read_unlock();
 	asyw->image.offset[0] = nvbo->offset;
 
 	if (wndw->func->prepare) {
-- 
2.25.1

