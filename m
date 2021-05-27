Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 920513928C3
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 09:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998776EDED;
	Thu, 27 May 2021 07:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCCC6EDA6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 07:42:13 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id q67so3009965pfb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 00:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iKPatIdYRxq+Xo6lopop8fgePb2STDXynanM3KtfV2E=;
 b=UzhS0TSGWLsdtGeMsRR9DXcxIAZf9yxmavKOZAwL5cSNom1Ge/Ba1Uxw/Lg2KECen/
 iW7Zv/AEndzzyqjRQt6icQYPlYTsLewTmTmaVB52vkI8cdlyq6cNV/gJHPyTlRgk2jlz
 hxRQdQI2gTCY3qLIN81UKFt5s3KHLP3Vt1TtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iKPatIdYRxq+Xo6lopop8fgePb2STDXynanM3KtfV2E=;
 b=MEG17Vz9AsZOr+lCcnyIls1/9i20JT/Jb7BPs2Ugh8faa/ZSDvjQmTu0KGCYIL2/u4
 XwqeGoq61zNgfUgIPKn+ysAQgzAaSCkKy8hRLkV/RO/7DeBsFqk27aluVpkB3JPhuzK3
 z0T6KmPGYY4AI9c5WyC2Za5kybJbW4wqFZcvltfZNGNaVFy63aIztcNBBqDERYFOAZNL
 mJlQ68Ax8eP0jZs7OrviYkwiIN6Y45tnVPfobVOVugQEODNMVe68e1ok72uhYJ/Qbz0x
 LOgknPfyIWJWry1FJZBZaP5lZtTizFuwubM1hqcaFuNY6q4ummLSTWAvkvZjEmkvorRp
 4o5g==
X-Gm-Message-State: AOAM532r4QzeW7niNaXRgjPPf59nnajxqAKCOWrCip/4QvSoxSYoBzD1
 NR4AniJq1VY/9Eci14BQZiJxEXLsmnyDEA==
X-Google-Smtp-Source: ABdhPJySHEslyEih5kQLA88oXODQQ0Wi1oBA6Q/oIq4BZUbKZolgVJv44EvipwhBEGygRsph69B2tQ==
X-Received: by 2002:aa7:8703:0:b029:2da:b87f:7d38 with SMTP id
 b3-20020aa787030000b02902dab87f7d38mr2569228pfo.20.1622101332688; 
 Thu, 27 May 2021 00:42:12 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ece5:55a4:6ad3:d20f])
 by smtp.gmail.com with ESMTPSA id h24sm1184857pfn.180.2021.05.27.00.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 00:42:12 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 RESEND 2/3] drm/mediatek: init panel orientation property
Date: Thu, 27 May 2021 15:42:01 +0800
Message-Id: <20210527074202.1706724-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210527074202.1706724-1-hsinyi@chromium.org>
References: <20210527074202.1706724-1-hsinyi@chromium.org>
MIME-Version: 1.0
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Init panel orientation property after connector is initialized. Let the
panel driver decides the orientation value later.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ae403c67cbd9..9da1fd649131 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -964,6 +964,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	ret = drm_connector_init_panel_orientation_property(dsi->connector);
+	if (ret) {
+		DRM_ERROR("Unable to init panel orientation\n");
+		goto err_cleanup_encoder;
+	}
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
-- 
2.31.1.818.g46aad6cb9e-goog

