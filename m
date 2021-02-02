Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2915A30B9B7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8856E93D;
	Tue,  2 Feb 2021 08:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1F06E8C5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 08:12:45 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id r38so14371821pgk.13
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 00:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CrTdRFcnWQzuRTgnluBbuBsSEw406Rl06q57E8Rqlko=;
 b=cXgC+/ID7uN0KeiEPRB8ZyCAqF/n44TWLPfMud8lHdekuNyRfsiUfhrv8rqsQONdqL
 j53Zj4C6D1B3jspMgWZw3MrYY0ar31fWmOjdBrCFcQIsBJT1/PjFjZ79tsFNMH8G9Rnc
 xJfNxJUQ13Oj+7H4l3/YlPd6dvClk/Abu3gOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CrTdRFcnWQzuRTgnluBbuBsSEw406Rl06q57E8Rqlko=;
 b=GOKdw6vPBccV4HC5xbCwa6HgfgjIyLqQDZqYRI06mrp2oFK7N7In2p7BKBfUpodVWv
 UtElLym7mav9ZMTG33izIMRQ78H9TeKheWXT1s9JuuRCj9GXz9/4SQwebHmS8YzZxoq+
 Mu+yTHmaezqycXh3MFF06S0lDVP4Z+RZMsIDrlUSSNLPYzRJbAaru7fQQ9Fc9JyZQaj4
 qdrymH3QBDczviyN+RpiQSWpXS6zYD/CuHKtczwG51pxDgNBzurT/hAg84f4jgr0vw6I
 3aTeY5XSokK5Z7pRIeJgmMascOLzJePCNAwS4ghyd1lPZ820ogeQFOVYDHu1NPpE68nk
 cKDA==
X-Gm-Message-State: AOAM5317HSDeEKeQs/YDsXyFHdjIpKI0btDlSSMlfVkbbkFo++ET1aNH
 7Uwveh4lXgnK9fkoOblQe/78hg==
X-Google-Smtp-Source: ABdhPJzwA6TM5xlw4fGkgp1hD5x1e44JtTKG1EamjsOqepbXH/0fOeChNqzkXLXr2SIlSCiPFNYE0g==
X-Received: by 2002:a63:ec09:: with SMTP id j9mr11561675pgh.179.1612253565186; 
 Tue, 02 Feb 2021 00:12:45 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:743e:7944:50c8:ff72])
 by smtp.gmail.com with ESMTPSA id c8sm21343325pfo.148.2021.02.02.00.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 00:12:44 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 1/8] drm/mediatek: add component OVL_2L2
Date: Tue,  2 Feb 2021 16:12:30 +0800
Message-Id: <20210202081237.774442-2-hsinyi@chromium.org>
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

This patch add component OVL_2L2

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 0444b429daf00..b6c4e73031ca6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -477,6 +477,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, &ddp_ovl },
 	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
 	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L2] = { MTK_DISP_OVL_2L,    2, &ddp_ovl },
 	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
 	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
 	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
