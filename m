Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3510230B99F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044696E429;
	Tue,  2 Feb 2021 08:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A6D6E1A8
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 10:37:40 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id o63so11774028pgo.6
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 02:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AcC3toP6YBtCOgAxsdOHDHDQFB7sOehX2qicMsRRIyg=;
 b=NQWiLn9gqkxfhpJXhPNjH/PYK+Yr9dAPInm3WI34IERnw7bYbgIXtem1FdYDkW8wli
 64K+me37ilsz+RAdLo8ROqmhYolD78CcOhqqyCEuyDv3LO74AjJYWKhulVbPsQ+XOIu2
 0iOQ+0k+PpG79+HPSEUkeOPLejpZRw+LL1QOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AcC3toP6YBtCOgAxsdOHDHDQFB7sOehX2qicMsRRIyg=;
 b=D1873BarJKw9+KEPRPUkOZ/15okmXzPUtEzQFCY4Bi3SyPrMK6IWvSJjpE5mfsLgwc
 9f6Rg7VFB+aVvVFHDczpaSTOfXMUu88vJCt823W/ULM+IIZwee0dibXkskbOpkmOOInZ
 h/XUh/ngA5v0aPoMsw1Qaru+VOiiqqpH22g5AHI3yoseEgZBx7nR8ELQ/hf09ucVPTB+
 bSCzsGA1J1/f3BdeQS43VlqfBDW233kK6pSvR3ylQLSok5t4+fHBCQezN8UDkLblZBcm
 1fYV1VhiUL+wVuiXG86jdd6WIou+tX+rv9ANcWHyrSA+jRHiQEh55/fXwOn/C5ZKCTb1
 QDYQ==
X-Gm-Message-State: AOAM5338wnvDszV6ZUe/QnLei0FiMbjP1kQX/qlwac3KLCpzOvZmW1XP
 hiXfEZSruBY/2IkXu2andNM69A==
X-Google-Smtp-Source: ABdhPJyUJ0L9tWtBFh4v728vZPdOlcLKa6aRR4/JhTB0dvIReHwHwY4rPdSJH0Uc5AnHITGs61Vddw==
X-Received: by 2002:a63:1c08:: with SMTP id c8mr16542759pgc.228.1612175860174; 
 Mon, 01 Feb 2021 02:37:40 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0cd:1b84:6d56:68e1])
 by smtp.gmail.com with ESMTPSA id 76sm17610356pfz.174.2021.02.01.02.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:37:39 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 3/8] drm/mediatek: add component RDMA4
Date: Mon,  1 Feb 2021 18:37:22 +0800
Message-Id: <20210201103727.376721-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210201103727.376721-1-hsinyi@chromium.org>
References: <20210201103727.376721-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

This patch add component RDMA4

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 7a6efc849694b..d884807809635 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -494,6 +494,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_RDMA0]		= { MTK_DISP_RDMA,	0, &ddp_rdma },
 	[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,	1, &ddp_rdma },
 	[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,	2, &ddp_rdma },
+	[DDP_COMPONENT_RDMA4]		= { MTK_DISP_RDMA,      4, &ddp_rdma },
 	[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,	0, &ddp_ufoe },
 	[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,	0, NULL },
 	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,	1, NULL },
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
