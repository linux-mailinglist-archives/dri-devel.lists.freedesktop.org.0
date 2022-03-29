Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D43684EABD2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6555210EFEF;
	Tue, 29 Mar 2022 11:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845E710EFEE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 11:02:52 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id lr4so25893029ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 04:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZiEng24wPNv4JGTz2+Vix3CngM1x6Ne8dQkD2d9nK88=;
 b=UVmm+VkSqkE26kLpPx7nE50G3IsuJLbZ1LjJbp2SJYTIi9gAGG3DgxFlCvQ7pNLvL3
 oUD/PZP+CtnKX1yyKXanH92c94Cou0Iy03GlrgGmLCn0sNofjZfmhWxrn5T10I6HrhL6
 NwQBsOB+WJrxAwIY/n0Z1/cyD8tEPD3gwMtezdXsDq+RxdGceZTsUA9SEt6WUaH17ggN
 UxhcT0pPpcHD+0iWkDGhWzt+KXliJmawyfBLGLm0Dcc+sVMMwoy30sgvPmNx+Mo4rOis
 2FKtRgjRZ10cf4QQxihFiyZ9EUtnct9l8hPceWuDLR9aW9hd8Il8ucgBGQNrU+SvMur4
 rqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZiEng24wPNv4JGTz2+Vix3CngM1x6Ne8dQkD2d9nK88=;
 b=z6dvckJHlVrhTt5ByFCDz3ckqQBC/eV6M0iKgelSkpsJB1c2qZl+q7xP9N8iLOrPZI
 6Mmmcpy+QH5onJ+Tm+iKPqK7GNOGxZXiK019KiaGR4gphMileCvF93a/PY1XDbZMUDRY
 OFT+tEDQikw4V9M6JvIaNwkjv911dKda/gQGiilnGwI+s3jzLSjiWubUmXh+JX+eX2vL
 hDADDetxNCx/LukVCekv/SGN94XMI64GULoHgW/qANEQc+UAe87ijbyDZN9A7jLEj/dZ
 XOh3Pi6wd5O+zUNvspZunZPOD+VSEuO1LjY43/aAKZsQui26O89/IS+eqG0L8S711Ss7
 I+YA==
X-Gm-Message-State: AOAM530il9IfazfWAvULpNphVsmAecnCc/R5nSgCnic92zRCJNqlXFvS
 Jvl0GZIgvQ+CQSFqQIFTJuzCEL+iNkM=
X-Google-Smtp-Source: ABdhPJxDJfkvz7BnIfAZR7X+Y1bMZ0ExiKkd00tXcPCeSH5uX999SczHAALGhkUXX6zB1M0fbKtxYA==
X-Received: by 2002:a17:906:7315:b0:6df:6a3f:d61a with SMTP id
 di21-20020a170906731500b006df6a3fd61amr34122745ejc.405.1648551770949; 
 Tue, 29 Mar 2022 04:02:50 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709060f5400b006d6d54b9203sm6958402ejj.38.2022.03.29.04.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 04:02:49 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/11] drm/nouveau: switch over to ttm_bo_init_reserved
Date: Tue, 29 Mar 2022 13:02:34 +0200
Message-Id: <20220329110243.6335-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329110243.6335-1-christian.koenig@amd.com>
References: <20220329110243.6335-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new interface instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index fa73fe57f97b..ceac591a7c01 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -302,19 +302,23 @@ nouveau_bo_init(struct nouveau_bo *nvbo, u64 size, int align, u32 domain,
 		struct sg_table *sg, struct dma_resv *robj)
 {
 	int type = sg ? ttm_bo_type_sg : ttm_bo_type_device;
+	struct ttm_operation_ctx ctx = { false, false };
 	int ret;
 
 	nouveau_bo_placement_set(nvbo, domain, 0);
 	INIT_LIST_HEAD(&nvbo->io_reserve_lru);
 
-	ret = ttm_bo_init(nvbo->bo.bdev, &nvbo->bo, size, type,
-			  &nvbo->placement, align >> PAGE_SHIFT, false, sg,
-			  robj, nouveau_bo_del_ttm);
+	ret = ttm_bo_init_reserved(nvbo->bo.bdev, &nvbo->bo, size, type,
+				   &nvbo->placement, align >> PAGE_SHIFT, &ctx,
+				   sg, robj, nouveau_bo_del_ttm);
 	if (ret) {
 		/* ttm will call nouveau_bo_del_ttm if it fails.. */
 		return ret;
 	}
 
+	if (!robj)
+		ttm_bo_unreserve(&nvbo->bo);
+
 	return 0;
 }
 
-- 
2.25.1

