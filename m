Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F2630B9C6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E196E95A;
	Tue,  2 Feb 2021 08:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CCF6E8D9
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 08:12:50 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id s23so13127696pgh.11
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 00:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5kE2WPdhtm7LXIUh2wEzkDNY4SHQKg7ATXWyFrajYR8=;
 b=Eg6CDrl+RJ4MpFUiUiMgXmZASqgfKOIwbIa61fp78u2rBFEP9o/YcaOVulfsUPtPkM
 otE0nC+mp0q2r6ch9XyJOVJbr7jyyloXXJBiBtCZ/Zd6b3TymhvWMmRVrRLSLVP45mIi
 r4Aa0GvF1SzKkwWMlq/exS6IIzZNNxRDwtN3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5kE2WPdhtm7LXIUh2wEzkDNY4SHQKg7ATXWyFrajYR8=;
 b=ubpNqBikQeVT7K5CbYdVUL6KsRcpS5Yv38OTmt4gKiFzja4GNRpcj6h/o2QYv3+Uoh
 UCx3RX4BFmg26BIm+jz9NUomDun76tPcWb/TJohRRWLviJBlu7sflanOfBLnmbjDftw8
 BR+QrXuBir8e+DT1HhDTB8UvBV2lSQfCV82152y/7w6aSkadG84ptz9b9aeCO1grkO2J
 6Htke++NRmyTzPtSeuyxzR1fOdL1TSkgd8KLVMQSXqGDMt1A0o/xPMYHPiZtusHid5oN
 ini/sIeslqmbZhSZvSr1V58QWr/eTrNKqyuriHPSZWiQrNzRaIbbWoLN+FQpgNXrRGG+
 7cQA==
X-Gm-Message-State: AOAM530xrE0PYoLLrkYzI31X8RxL47GwRW+TgYw44SqreDD+wZHbG6jn
 8slShMmoyJ1Xt+eZFTxeQsFM9Q==
X-Google-Smtp-Source: ABdhPJxqKLT2Pn2GRfqixmny1yg2Ep3WCjWXRRx3Ovn5OhUAa7//XVPTABEqYbWDoYTs21yJe/rwrg==
X-Received: by 2002:a63:5952:: with SMTP id j18mr20940749pgm.29.1612253570226; 
 Tue, 02 Feb 2021 00:12:50 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:743e:7944:50c8:ff72])
 by smtp.gmail.com with ESMTPSA id c8sm21343325pfo.148.2021.02.02.00.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 00:12:49 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 3/8] drm/mediatek: add component RDMA4
Date: Tue,  2 Feb 2021 16:12:32 +0800
Message-Id: <20210202081237.774442-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210202081237.774442-1-hsinyi@chromium.org>
References: <20210202081237.774442-1-hsinyi@chromium.org>
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
index 0a84ae53eb72a..7f5614a6faab8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -526,6 +526,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
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
