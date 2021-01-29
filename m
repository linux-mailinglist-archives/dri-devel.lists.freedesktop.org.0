Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3143086E1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 09:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84516EA9C;
	Fri, 29 Jan 2021 08:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F066E440
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 07:34:44 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id j12so5679609pfj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 23:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=btgeE7WFp2D5CajIBGg9VSazWzop69EBezIQPArUvCU=;
 b=TZR4kB1G2bNsAE+qgZ8eiVZhoITJ+kJe13lmCYltsK/S+Dl7QIbP0uBsH5bgPI1nlK
 oI6rLHMK4aoIka4pEUX/UaZdqrsDe3GfEj+RLGGD8VCrLhKe/Z2T/mTfIe/z7uJQCymc
 dbHh9mVrEHFEmklKptMB80KUEcUe4A8JcKnH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=btgeE7WFp2D5CajIBGg9VSazWzop69EBezIQPArUvCU=;
 b=LtG/5UhHoG1/bC5BWujINnvgTYHRhWrTbCAAX45IG0gZKP/MoPpDXLvoglqUOd110V
 ddtWbfBrChV2BJJoBC2SYlwxk2z/hxpcBpAzc/4EM30pKA3EeULWPiFajo2Kz9yj+qSs
 0Bj4gfE1eAlJHN5UubVm8QnJlGX94N9zZvenpLOWbmjosgf+s3oUWg3yrRv325cOxzxR
 MEWTCYl8C1GzynRLL3K9I5hjAbLq74jpFsarJnRM9HbDeCwuyP4n9Hr6kO2manJC2MZq
 Pg52zXguTQk9wdwQQD5MLCiofqvzhOdLHFMS1fZUDmyAw0SlBrb0t5lE3TbKtwDDSa85
 ZE1A==
X-Gm-Message-State: AOAM531S0joZy0uUEylkb28hqS7WLGuSY8DjrUvxGBVbZkLJyzENovi3
 yQADUolTPPZW+Jb01JR9MUgCLD5z4la0HA==
X-Google-Smtp-Source: ABdhPJwGzKQhp5dhDV4z37t3vWRcdeRiZPfmH1ZQVoT8Y7zVZiDpWmQcW2Y/z2SYPG1flbKPmDszkw==
X-Received: by 2002:aa7:93a2:0:b029:1bf:23a3:a945 with SMTP id
 x2-20020aa793a20000b02901bf23a3a945mr3154824pff.70.1611905684192; 
 Thu, 28 Jan 2021 23:34:44 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p1sm7689980pfn.21.2021.01.28.23.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 23:34:43 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 1/8] drm/mediatek: add component OVL_2L2
Date: Fri, 29 Jan 2021 15:34:29 +0800
Message-Id: <20210129073436.2429834-2-hsinyi@chromium.org>
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

This patch add component OVL_2L2

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 5b7fcedb9f9a8..ccfaada998cf5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -479,6 +479,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
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
