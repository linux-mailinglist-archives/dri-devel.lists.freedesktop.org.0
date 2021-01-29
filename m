Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F463086D7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 09:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA176EA8A;
	Fri, 29 Jan 2021 08:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83F26EA7C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 07:34:49 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id e9so4786038plh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 23:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ZWXOVsKIxcx+tGQm76xdUBCxirqlUu+mbOtPxuu9AE=;
 b=leoqf+1hTP4H2PyDaC2xZP2m2uUPHXR5pGWVrCK34boQBgu2ADdiKOqVdRJgQEo9TR
 9p5kv+xcuqa2WJcl5zK1Yna/BxYoBX7gGOnDfNGW5F/bl6VGwU01ceEpKkCgBgW9t8Ij
 cw0EJ04W3ir5FmuYOVsxM491joxVdzFf9M60s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ZWXOVsKIxcx+tGQm76xdUBCxirqlUu+mbOtPxuu9AE=;
 b=Bjd+/NHxUwJSxuf3kKDsOF11+eKVMV969dalB0IgUlD6qmIFWYXz8o56OauYLBukGD
 +CZtjPtub0TZQp1NVMh3JFG3lG4RjLlN/icQuDPX2U6NIWTaH1vgdrE5wAXg/64X8Nmp
 rdcvRCA8Fx2llgzO/QPS86oalnA5/W/Jol+XATpaEXMvY62LNPjPMU0IWG/qEWMu+bsv
 FLRyzbMCcwChlrLdpfZrw6tS+DyGMVUSsDNed8xb1T6F9ZPPRHmXOU+UkJ6qGnhJiK69
 i0gM2Otf3HW462bOVZthJd16gLKZgATwTmJVw6hUyXLAPx9CFvuYt3h/v78FUtVZ8J7a
 SJaw==
X-Gm-Message-State: AOAM530tBwZko7a7M5WmtKC5mWw+QSRoayv9LwDmO97Mz0SxfjXT9eHf
 lLSNTQI6ftWNwmz0dS0yy/oIXg==
X-Google-Smtp-Source: ABdhPJzFhYJSIIxoG5CMdSpK9JhxCqNvNkZfWnMW28x1fFvVi+kdtvyTLL/rylCjR4CSvx9Vq84J5A==
X-Received: by 2002:a17:90a:cb0f:: with SMTP id
 z15mr3446744pjt.88.1611905689225; 
 Thu, 28 Jan 2021 23:34:49 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p1sm7689980pfn.21.2021.01.28.23.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 23:34:48 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 3/8] drm/mediatek: add component RDMA4
Date: Fri, 29 Jan 2021 15:34:31 +0800
Message-Id: <20210129073436.2429834-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129073436.2429834-1-hsinyi@chromium.org>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 29 Jan 2021 08:11:32 +0000
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
index 6c539783118dd..543cbfc9c5d85 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -496,6 +496,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_RDMA0]	= { MTK_DISP_RDMA,	0, &ddp_rdma },
 	[DDP_COMPONENT_RDMA1]	= { MTK_DISP_RDMA,	1, &ddp_rdma },
 	[DDP_COMPONENT_RDMA2]	= { MTK_DISP_RDMA,	2, &ddp_rdma },
+	[DDP_COMPONENT_RDMA4]   = { MTK_DISP_RDMA,      4, &ddp_rdma },
 	[DDP_COMPONENT_UFOE]	= { MTK_DISP_UFOE,	0, &ddp_ufoe },
 	[DDP_COMPONENT_WDMA0]	= { MTK_DISP_WDMA,	0, NULL },
 	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
