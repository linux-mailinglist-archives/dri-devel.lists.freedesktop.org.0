Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DA630B9A9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286F96E8ED;
	Tue,  2 Feb 2021 08:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC25899A7
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 10:37:35 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id z9so2095087pjl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 02:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CrTdRFcnWQzuRTgnluBbuBsSEw406Rl06q57E8Rqlko=;
 b=WpMFU6q6a/odWPME6nItLViwl7Dk4d/YMVq+6O3MTBuys+RR+6xKK03+6xWYZNQafu
 RCjRWP/ZuL1ErIm/I3aJFJ7UJdIxuBHrlni6lXyJgfGmYkZ6IL9N4OHN7FsIbhgvD/w4
 HWvvHyAZkaZC4yYPDYo/sf8u4/vJZasNpbUp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CrTdRFcnWQzuRTgnluBbuBsSEw406Rl06q57E8Rqlko=;
 b=QdDCrLfYwqoFT5WHBtSIQrxeCQ1heS4C44/O3U27qYtr5NFdAe7/DtEl0a7+mwFm7t
 bBCPdOeiiOTO4ir+jELSOoId01hF8k2EF7fcQAAFbCF9IeiV83BWT/gW5PhXc7jUBXrQ
 VKJVV4BRI86I5a8vlUPJbsuWsWqjmOgkF9FPjc+VfToBDbL/HEQKqX1xmZS+1p4jVRd7
 rHMVBrbPw7hUqLdRZ0ukiGI3ZGGOQLZ303nFVVqvZTMO60QZGxX8dWaGHW45K48mhri1
 iQ1SNb1CmcqCwsA02w0fTpAl/o8AiahIw46eDDKmgr0EkjNk/BLzQtHYJ8Esy66WA4+5
 YlJw==
X-Gm-Message-State: AOAM530X/MkfMY92RT76f1HZm2QcbV1xLqhYyTcsj8Gx0+9jTDw0ySdZ
 6t/8sF5x6HKKpFgrZwVzXvty4Q==
X-Google-Smtp-Source: ABdhPJy/H/X+tkbdFrbG/4/lVmtjqOFlXPhdSQz3Lua3UzweTfJfL6z3kMdFS1JR99nvh6s9hj/6yg==
X-Received: by 2002:a17:90a:f0c4:: with SMTP id
 fa4mr15709655pjb.132.1612175855167; 
 Mon, 01 Feb 2021 02:37:35 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0cd:1b84:6d56:68e1])
 by smtp.gmail.com with ESMTPSA id 76sm17610356pfz.174.2021.02.01.02.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:37:34 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 1/8] drm/mediatek: add component OVL_2L2
Date: Mon,  1 Feb 2021 18:37:20 +0800
Message-Id: <20210201103727.376721-2-hsinyi@chromium.org>
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
