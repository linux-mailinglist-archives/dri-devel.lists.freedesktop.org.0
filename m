Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633AD30712D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7605E6E961;
	Thu, 28 Jan 2021 08:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9336E8EB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 07:28:17 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id w14so3447097pfi.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 23:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HSBHxC6BVq05Sqe74BC637dMAggq9obPvY1bN+IbxX8=;
 b=DJj103V2Njc+NoO4woEfA6J6X06d1HNMixRSgUCD5i0E/Q5qZzyKLjmNvPwif/eGKc
 x4uj6ZJJvdI53nD54eSOpHTcXDkRa701yNtQND0RXA6a5jtK9+81T9fY9zqgFvbzM2Tg
 tyU27jVZZ3Sn59hSSX/CVQLatnBFMHE/s5XNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HSBHxC6BVq05Sqe74BC637dMAggq9obPvY1bN+IbxX8=;
 b=VQezc8glKYcsf++aKYxW+l6p+PNIkYSIJMMygwZoh8igClmpdO5uznTuY/ZEZNlHOj
 BZM54UnkLgOTKcP/jKa/r7YIeoeSat7FyvLXDVPpk5JA82CInftxyRJlVgJi3rW+Atzb
 sB5RqKbxDsYC0UKlLFHVt3mlYoHG1V3GZOyUULWmsOKWaZ4xrGjDa9HbUYp3UZF7k5rp
 plVOsLlQWsBKMPX73K6Mt/uVLPp5pFWga8B4T+TEH1fgCN4q7xPNJqR30gQdXBUqz3Ra
 AfVgoB4PyOPPvC9VwCcXWGS1qE2FsHQ/NNV8neZStnfXZUpGD/vYZUwskVkbeljcffP4
 SLGw==
X-Gm-Message-State: AOAM530CBkW7RHLlfdsfgCJHdQOg4McekI5m7b96dLRRJqvXoMwk1k+t
 R13sxwrfz+4fnBTBXAVbH0cQSw==
X-Google-Smtp-Source: ABdhPJwxuGlbJMSCFjgxLE5OD4BDM1JEJbkoAhNZxMSevFQzC2n/y/UMOceeaZv3CtUn/6bVeLGZbA==
X-Received: by 2002:a63:c444:: with SMTP id m4mr15080576pgg.420.1611818897031; 
 Wed, 27 Jan 2021 23:28:17 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id h2sm4800304pfk.4.2021.01.27.23.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 23:28:16 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v11 3/9] drm/mediatek: add RDMA fifo size error handle
Date: Thu, 28 Jan 2021 15:27:56 +0800
Message-Id: <20210128072802.830971-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210128072802.830971-1-hsinyi@chromium.org>
References: <20210128072802.830971-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:35 +0000
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
