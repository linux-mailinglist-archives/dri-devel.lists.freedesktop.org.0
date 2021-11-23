Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6018545A56B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D016E8B3;
	Tue, 23 Nov 2021 14:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA866E863
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:51 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id o29so18892838wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VGR7sEyP5xUI57aswHQi5HhbTWAZp7wO5W8n1Qo9nVA=;
 b=Ja54Ddld8qqcZzstvG4AWszv693k3+shcyjQQbG2LPx7hKiWSdJNF2r3KSmAbJXvdm
 8McOvaW400TjaB2kWzfse3ek0xNbhsiKxJ0kmCOq/Zb3P078UY+yYrLPDCyQ16MmUXFL
 60wxFFhfIDxNHxTQCAJ34NqXkVp4RpdzXHRVhqwlPUD7ffpMYR/6TDD9l88ECCjV8kI+
 kzKCX90I2GvSJSo3rnMES+fwkX2bHC7ujjVEnJiAalnRBsClJLm5xl7wVjv1BaHFdL+c
 kjWWj23ceMuVppYKU9CJhxgap7sY46qvF1aRJVpm/wNzsfnHY5amUQtG8C5E4KdyBU3w
 WryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGR7sEyP5xUI57aswHQi5HhbTWAZp7wO5W8n1Qo9nVA=;
 b=rdoCRKMsm8OHW3meKO4xKc3P8NT7Aad0BdF5fLQoAyZpZAxVayWAGLMl5aPZNl/5+T
 Gw7kD4nGz2l0wr//9aSsSASDol3hGxf5CS2s+pkKFQzeXaJ2rYOMU9qZhhuCUKd/eTS9
 RCzPD6Nxio91wQWW5fhIWoxNh3wfQGvQAHRPO6tTh2KVN7sTFDAsclxvGC8yDAE9h9hz
 Kni1NJDql4g3+CW7vAnX+akWbJXoZzqAwxkX1vHnf4HnoJ20lUSs46FgRb17lvhcCLuX
 OzfpxBvrOgp5Pp2iuP1bxlvpBwzvmXXJyDn90xtJ9JMJd/1KVxJQS/S0z53qsGZDsHnH
 0r2w==
X-Gm-Message-State: AOAM533H9J8IUXqUetdN/3iWKfGrhb1NoIJr13FsxaQVy0CA24F+4WX9
 Gxf/5cV7tD5NAHRo3dUWIYk=
X-Google-Smtp-Source: ABdhPJxz92PdTZx0DqNVL5rxsfV9YMFTqsBGNNgkSTOxdwTO2DMKRD+TWoxN1P6DgrLeGDMhFYfXhA==
X-Received: by 2002:a05:600c:224a:: with SMTP id
 a10mr3515571wmm.154.1637677309951; 
 Tue, 23 Nov 2021 06:21:49 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:49 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 20/26] drm/nouveau: support more than one write fence in
 fenv50_wndw_prepare_fb
Date: Tue, 23 Nov 2021 15:21:05 +0100
Message-Id: <20211123142111.3885-21-christian.koenig@amd.com>
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
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 133c8736426a..b55a8a723581 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -536,8 +536,6 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	struct nouveau_bo *nvbo;
 	struct nv50_head_atom *asyh;
 	struct nv50_wndw_ctxdma *ctxdma;
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
 	int ret;
 
 	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
@@ -560,13 +558,11 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 			asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	dma_resv_iter_begin(&cursor, nvbo->bo.base.resv, false);
-	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		/* TODO: We only use the first writer here */
-		asyw->state.fence = dma_fence_get(fence);
-		break;
-	}
-	dma_resv_iter_end(&cursor);
+	ret = dma_resv_get_singleton(nvbo->bo.base.resv, false,
+				     &asyw->state.fence);
+	if (ret)
+		return ret;
+
 	asyw->image.offset[0] = nvbo->offset;
 
 	if (wndw->func->prepare) {
-- 
2.25.1

