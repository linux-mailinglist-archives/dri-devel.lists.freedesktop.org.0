Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359203055B5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8274B6E5B9;
	Wed, 27 Jan 2021 08:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00646E517
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 04:54:40 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id kx7so543658pjb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 20:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HSBHxC6BVq05Sqe74BC637dMAggq9obPvY1bN+IbxX8=;
 b=QLrYujKWg6brD9Dn4569hiEZyanZ/c1eZlO9Y8Xkr3ZSqZ1GIkkMBWnx2iweqHKFzN
 98LgtgS7J1HKyPBfvqi3D+M21Balppe5d6zFiEFpyw+/iVnP8zFYOM+lB8LdHlVKjcOr
 XiAKpeDyKeqCp9VkmeyO3GpLbsopCwWYpXvAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HSBHxC6BVq05Sqe74BC637dMAggq9obPvY1bN+IbxX8=;
 b=mCujI5pDzChdSbSRQid3V1Qd+XPrCzLCJWQocmIMxGZSaTFMovXMwqqQyKCNne40zf
 IUyPV5WJXhDyKv3FbqedkUbJSlQzeCpV0I54kp8+auTE21+KOHQ53/925CXxYF2UI+90
 Rk2tUIfwG9XECz+JK10uJDwNwX1J5eDh1rx+yF+0GhUE+rjszXla0ab+gOnFQaXPXwFl
 GMl+v7Rc5mjeZOZJymagSak3afdDdzMarj+IuvN4BmIws2mIiPE0aJhCpF4ORi7972Ni
 cvGBioj102fhuUDQyg51BTqtJPTkG1z09/Od4libv3jilERCLBIXemyOXsBqUuddxePs
 4K2w==
X-Gm-Message-State: AOAM530sGdGb74fHNU2/g6dChXPBozgnus2Wxz9huPYt692kA4d5+Qv+
 4ggyVaW58Giuf5xKH6pY1twRnA==
X-Google-Smtp-Source: ABdhPJy/lxAmlDmjnchY5j6fyQaiGPSUiu+V7cni9mncc8A/hA+9bzzULC0varJkx+Ggb//BqKRJVQ==
X-Received: by 2002:a17:902:70c6:b029:df:d62a:8c69 with SMTP id
 l6-20020a17090270c6b02900dfd62a8c69mr9586813plt.20.1611723280370; 
 Tue, 26 Jan 2021 20:54:40 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id a141sm684484pfa.189.2021.01.26.20.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 20:54:39 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v10 3/9] drm/mediatek: add RDMA fifo size error handle
Date: Wed, 27 Jan 2021 12:54:16 +0800
Message-Id: <20210127045422.2418917-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210127045422.2418917-1-hsinyi@chromium.org>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Jan 2021 08:29:46 +0000
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

This patch add RDMA fifo size error handle
rdma fifo size will not always bigger than the calculated threshold
if that case happened, we need set fifo size as the threshold

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index b84004394970f..04b9542010b00 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -168,6 +168,10 @@ void mtk_rdma_config(struct device *dev, unsigned int width,
 	 * account for blanking, and with a pixel depth of 4 bytes:
 	 */
 	threshold = width * height * vrefresh * 4 * 7 / 1000000;
+
+	if (threshold > rdma_fifo_size)
+		threshold = rdma_fifo_size;
+
 	reg = RDMA_FIFO_UNDERFLOW_EN |
 	      RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
 	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
-- 
2.30.0.280.ga3ce27912f-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
