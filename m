Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2554A36D178
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 06:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACB36EA88;
	Wed, 28 Apr 2021 04:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4848D6EA85
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 04:55:41 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id c19so7007950pfv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 21:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q5arbhYfGXT82qjQUTN0xccKMerRCIU7+UPVnm07W9Y=;
 b=VTFFF9OFqyw2YMLqAax+N1JMxY/fNr/W5AB4MeQ5uAC48RGc0An02b+Se479ddBizx
 XD/X1KjCcrsMtSQlNf2LW5waQiFV1rfGU+052WMVU0QQcBCnRqMhDXmhEWMSBSbhd1iI
 2p/YqB6CSg/fIreO6cajKo9N3kjiKV7dDgsHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5arbhYfGXT82qjQUTN0xccKMerRCIU7+UPVnm07W9Y=;
 b=BINx1HhYmBUQ9tjmTeYQc2sIxPwgTfNMpHqMTKN7Osz2yGCRRqcvOXXOub3ItI8XyV
 xYls21YPF+HIHqwE8lZ6Qu0m/D7zC9ji7Ir5/k+1bqL5oUARPL/H0DppAzccZTpJ5cZK
 8E9UoSzHLK7kRrEa014fY2+qlUz5T66j6iSWBCC1ZZveg1fzclti6rh+LKCRbtApdMOl
 4/IviiU114rAT3XpkwXMg1oVp2LOJSfyAcNcscciTYlBEfg+z/VQ6pcz8T7HDxjutEju
 2jFb6IM/brzSgb1TC0lhaQ7OWSGj/BD1V4h6X51yhTc5+hPKnwJwMs8O6PsStg5Ns9Xd
 scow==
X-Gm-Message-State: AOAM530CFVUf0SoX7s/etv2g0BlpHDHCSY7fbWA+twqW1ravuHNJhxpM
 3tdbTBqrLYMS54iuVrq3mJAWoBXnlsilQw==
X-Google-Smtp-Source: ABdhPJzGs2DXC6vNxlFEZ8RvRfGO4uOiE+lprziJ7+wryJ2YehvrOUkYJqxr2cPuDE5cVXFo3KiZsw==
X-Received: by 2002:a63:942:: with SMTP id 63mr25683673pgj.67.1619585740596;
 Tue, 27 Apr 2021 21:55:40 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:8076:36e5:2db0:967])
 by smtp.gmail.com with ESMTPSA id x13sm1193170pgf.13.2021.04.27.21.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 21:55:40 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/3] drm/mediatek: init panel orientation property
Date: Wed, 28 Apr 2021 12:55:32 +0800
Message-Id: <20210428045533.564724-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210428045533.564724-1-hsinyi@chromium.org>
References: <20210428045533.564724-1-hsinyi@chromium.org>
MIME-Version: 1.0
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Init panel orientation property after connector is initialized. Let the
panel driver decides the orientation value later.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
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
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
