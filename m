Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26D83086D6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 09:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E969E6EA8F;
	Fri, 29 Jan 2021 08:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DEF6EA80
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 07:34:52 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id s23so4818903pgh.11
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 23:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jv+2JS9/1bK95pcHO0im9CAvoGtup1mDnivR04MejrA=;
 b=Wy5bJ3qFy8UxMKk04MxCVxkLzslgVcgIeUbeQqPPmUzi9N0uI/soGqP0zn1SWneXZp
 +FxeEOPdJgn6o8wRppIJC1X/QPu7VCWr2uMkRcm6IVX8GGQcJSEuuYI2nHYoSc25b5wu
 ARK5VW6qltB3qy1xNer6u33+8erAECyJOl40E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jv+2JS9/1bK95pcHO0im9CAvoGtup1mDnivR04MejrA=;
 b=Wg7Kq9a/nVNXIUrpUhy77xGXRo9Be+aaXPn00GMvGshGXR3MmYLXx3pW2qTqEs5O1z
 crBboDOK7sWqMojd41N7S5Wqn0Hxyb73uOLwHVwa6AGdbzNNljKWeRFFCHDFAEmT+3Lx
 Rn/e5Xpa9Q5+lOTLPBjlQrmj1OAbDe7aUJkoq0OwuDW+ryONp/kLZ9bSaDJmavZMvUAO
 h2T6VGgRafzwWnbVs8414NneDNWBFinQLKJiGKfmMYS/IFMjwnVDQ1cG6/F2GU0lF60l
 xzPqtqaki4TYkjkdeLCwNihX4/F+MWeUJ0igExBr63/CyaI6EqoWSOjmg1x01Wr5rllZ
 Et8w==
X-Gm-Message-State: AOAM532Eilk9yJCB/RU38dSD4AYls73Bg4DFD8s4glIFXJTvFkXgIiZs
 WM2StxlAIpn/NBb+m0PQJuQNQg==
X-Google-Smtp-Source: ABdhPJwf69hCMciq2Y+DX8eJKfTvpms85Hit7oril+FLzlt6OiRN8iWLPAuxIiAP5jzf6DYCWVnVGA==
X-Received: by 2002:a65:498e:: with SMTP id r14mr3481282pgs.235.1611905691669; 
 Thu, 28 Jan 2021 23:34:51 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p1sm7689980pfn.21.2021.01.28.23.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 23:34:51 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 4/8] drm/mediatek: enable OVL_LAYER_SMI_ID_EN for
 multi-layer usecase
Date: Fri, 29 Jan 2021 15:34:32 +0800
Message-Id: <20210129073436.2429834-5-hsinyi@chromium.org>
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

enable OVL_LAYER_SMI_ID_EN for multi-layer usecase, without this patch,
ovl will hang up when more than 1 layer enabled.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index da7e38a28759b..961f87f8d4d15 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -24,6 +24,7 @@
 #define DISP_REG_OVL_RST			0x0014
 #define DISP_REG_OVL_ROI_SIZE			0x0020
 #define DISP_REG_OVL_DATAPATH_CON		0x0024
+#define OVL_LAYER_SMI_ID_EN				BIT(0)
 #define OVL_BGCLR_SEL_IN				BIT(2)
 #define DISP_REG_OVL_ROI_BGCLR			0x0028
 #define DISP_REG_OVL_SRC_CON			0x002c
@@ -62,6 +63,7 @@ struct mtk_disp_ovl_data {
 	unsigned int gmc_bits;
 	unsigned int layer_nr;
 	bool fmt_rgb565_is_0;
+	bool smi_id_en;
 };
 
 /**
@@ -134,6 +136,13 @@ void mtk_ovl_start(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
+	if (ovl->data->smi_id_en) {
+		unsigned int reg;
+
+		reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
+		reg = reg | OVL_LAYER_SMI_ID_EN;
+		writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
+	}
 	writel_relaxed(0x1, ovl->regs + DISP_REG_OVL_EN);
 }
 
@@ -142,6 +151,14 @@ void mtk_ovl_stop(struct device *dev)
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_EN);
+	if (ovl->data->smi_id_en) {
+		unsigned int reg;
+
+		reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
+		reg = reg & ~OVL_LAYER_SMI_ID_EN;
+		writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
+	}
+
 }
 
 void mtk_ovl_config(struct device *dev, unsigned int w,
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
