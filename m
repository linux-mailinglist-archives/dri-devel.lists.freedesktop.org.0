Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6527382B94
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 13:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C33C6E04B;
	Mon, 17 May 2021 11:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C526E936
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 11:57:07 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id h16so6529698edr.6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 04:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RnGXj2NW9FvwL1U6bZyIirlr8kq9qLriuQ97eWvq66o=;
 b=gpxhADq5q/S26guUVsHY5qzJYr8kp42YH/g3hHGBDF8CV5K1Ro0dh2xP5MrN7Wjvh7
 OrcsLwNkja6dNscDxUCg4DxEF+VHTBsmmJ1ua/JAkyaQ+ynMwQahFKxOxqfR/yFJtpoM
 lYKfWMNGV85KhESfuDQwDRHQG1x2G4dlvGYaf7UGSN6yGEcUQoF17iv3XPXFPKvcVG30
 IumKxN6h37XIEzhTpR5Alh0W8rN1u2YfilwXotIvgtOjQJmGWYLIP0Uiy5Z4kv1iT0Js
 6CPvkGpHXzRqRvvLRSz/fl0Jrcn/P1Q9VU9s2wT8Hn2eY0neAZHbn2uwTqsKoqK3TX0d
 b0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RnGXj2NW9FvwL1U6bZyIirlr8kq9qLriuQ97eWvq66o=;
 b=c5W2UydZL4d1T1p5ZmknNIGZ4+mpP3HyF4/MNSMK1KPTvOftVluw2i3/df2UdFeIlK
 3ev/kufmvUm1upM6/ZY+NCOyBzgd6Zp5CtcPk3EmT1/LbuHQKYSsDOGendcm+9p8Dqot
 /j4aDRyoXs7C444/GBsqEqR0dp2As5J4bqzlCviYBeOviVHc2L6uZOL7kxINOJqlaFh9
 FFAv8y966XsSDtXYG4rECTDyKjZ9H4STzSWU+AnjOWhgiVeWQui8KkIcU/4JGnMtyDfD
 lOnZiLRlBLXFI59a32KBOpt8VyMN9rZQobMNHj28MD0dOBhwUto3Vsd3obKwCPnEvFn+
 ZSxA==
X-Gm-Message-State: AOAM531mlQWuU4KuZD2oDyUy5n1vNpT+xZPSr0rvozTzzk1qGGDgocCW
 IShfyrTY8g4IibV9B3YBmaYM1ZdEr+8=
X-Google-Smtp-Source: ABdhPJzVzNZUwyk8nefrMnx/oOjxopZ0uw6ylAuQMN6/WZQetnGFdNsMPqZ/OzVA0mPwGebzvwe9AA==
X-Received: by 2002:a05:6402:35c5:: with SMTP id
 z5mr3758380edc.210.1621252626574; 
 Mon, 17 May 2021 04:57:06 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:5134:9462:d117:4be4])
 by smtp.gmail.com with ESMTPSA id k26sm8579083eje.67.2021.05.17.04.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:57:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch
Subject: [PATCH] dma-buf: fix unintended pin/unpin warnings
Date: Mon, 17 May 2021 13:57:05 +0200
Message-Id: <20210517115705.2141-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

DMA-buf internal users call the pin/unpin functions without having a
dynamic attachment. Avoid the warning and backtrace in the logs.

Signed-off-by: Christian König <christian.koenig@amd.com>
Bugs: https://gitlab.freedesktop.org/drm/intel/-/issues/3481
Fixes: c545781e1c55 ("dma-buf: doc polish for pin/unpin")
CC: stable@kernel.org
---
 drivers/dma-buf/dma-buf.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f264b70c383e..eadd1eaa2fb5 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -760,7 +760,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 
 		if (dma_buf_is_dynamic(attach->dmabuf)) {
 			dma_resv_lock(attach->dmabuf->resv, NULL);
-			ret = dma_buf_pin(attach);
+			ret = dmabuf->ops->pin(attach);
 			if (ret)
 				goto err_unlock;
 		}
@@ -786,7 +786,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 
 err_unpin:
 	if (dma_buf_is_dynamic(attach->dmabuf))
-		dma_buf_unpin(attach);
+		dmabuf->ops->unpin(attach);
 
 err_unlock:
 	if (dma_buf_is_dynamic(attach->dmabuf))
@@ -843,7 +843,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 		__unmap_dma_buf(attach, attach->sgt, attach->dir);
 
 		if (dma_buf_is_dynamic(attach->dmabuf)) {
-			dma_buf_unpin(attach);
+			dmabuf->ops->unpin(attach);
 			dma_resv_unlock(attach->dmabuf->resv);
 		}
 	}
@@ -956,7 +956,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 	if (dma_buf_is_dynamic(attach->dmabuf)) {
 		dma_resv_assert_held(attach->dmabuf->resv);
 		if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
-			r = dma_buf_pin(attach);
+			r = attach->dmabuf->ops->pin(attach);
 			if (r)
 				return ERR_PTR(r);
 		}
@@ -968,7 +968,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 
 	if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
 	     !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
-		dma_buf_unpin(attach);
+		attach->dmabuf->ops->unpin(attach);
 
 	if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) {
 		attach->sgt = sg_table;
-- 
2.25.1

