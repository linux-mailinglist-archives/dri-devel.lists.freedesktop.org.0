Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EB04E28DE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628AC10E457;
	Mon, 21 Mar 2022 13:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A6310E443;
 Mon, 21 Mar 2022 13:59:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 o30-20020a05600c511e00b0038c9cfb79cbso34415wms.1; 
 Mon, 21 Mar 2022 06:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AC2jodS4S4QFxGOEJSN7mlW7nUgXJtTuKolh9bpfYuc=;
 b=aQjWhyHVCPqI9vinaf2ZSXWucEX5DqoEUoyZ4j6oMG2UHnDkVpvv2CsmW7OrpNYV72
 u0/XLRvK+lL2oxfh1qP8HRJs7ErjGyS7skzJruNf0uQy5s7KNVnrR+iwwiMvlAbKziyL
 lNJZExnSc2/r6NMsaCaujBfh1RXJj+bFQxJx1x8GJORGpoQP1sg1Od6G5pCM0XCoif5j
 Ki8Td9EdrQPQgDHNgLVrNhp8+Gbaq11eFE2MVNHCI6Ph3RWeANTLaBHCOgWVGGQXPl9I
 oGH+W3hNZgbpFL9une1PkNdrx4NQB6jtDsvMJx6t4qF1vzjrhtTTsv0Vwr+zkWy50RbH
 FJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AC2jodS4S4QFxGOEJSN7mlW7nUgXJtTuKolh9bpfYuc=;
 b=1zNgjleoHP9LsQz5jkCqcvk8GMMkQWumbNu1vsMw7ACJ9qmvYqhf+Jv/rCqDan9RRK
 OkM/rDH8gvadIltorp/AlxDKAOUlnokMrTaE3hnyl181sabEvOedv6CByXlYvLON4A4u
 ek6QXtbEkXHlC4LRro7kjUcucDBSfnAFRFUDHjn52YHQtGiWgpEDaRCOF3DDBthOMtmf
 bvK99S1SyZIiD4/avNw/NuSddFJQn3zNvS58g1jQcJny1XtMdj2jyiG9GBtuRSwZMdoZ
 AOjR7NUhKMWHipIREI3jHp5sHfeZcKzhA+do8mY9Z+gYXcy0WOiM1ZKtgXekTL5BfjDo
 DJbw==
X-Gm-Message-State: AOAM531CDCzzwCWbptBhzdX+l0xtlDQu4IrzqkRx+uH1lHGCiRPnM4eA
 5WqlvVlzSuhdyKbXloSTrU8=
X-Google-Smtp-Source: ABdhPJxnQocnNplyIJMCpIq+YarSsKhVDk8dU4JSlwCtBcHbBei0irHJBIgwxBb1C0tObZP+1sNuhA==
X-Received: by 2002:a05:600c:21a:b0:38b:d06e:e0f7 with SMTP id
 26-20020a05600c021a00b0038bd06ee0f7mr19449152wmi.105.1647871151035; 
 Mon, 21 Mar 2022 06:59:11 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:59:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 14/23] drm/nouveau: support more than one write fence in
 fenv50_wndw_prepare_fb
Date: Mon, 21 Mar 2022 14:58:47 +0100
Message-Id: <20220321135856.1331-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
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
Cc: nouveau@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use dma_resv_get_singleton() here to eventually get more than one write
fence as single fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 0c1a2ea0ed04..e2faf92e4831 100644
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

