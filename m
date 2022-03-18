Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB294DD627
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 09:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7210489187;
	Fri, 18 Mar 2022 08:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D152890EE
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 08:29:19 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d19so8863089pfv.7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 01:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q2qDv8+2Xs33bi39/5/bjWNq0xuzMLMZxKb+gV1x31A=;
 b=eTONqs9Y3piBGOdMGuMMcivDYzwSqMFZNucfhrjl17FHlTN4WIDwk19K4HOLMrk1iG
 Z9JW2BgOFS6i/9zHUZ4edoYzRasX/YYBjOmMTiYZs7tNSG0obMlHx/UiAhEyi5mPC4pm
 v6CMgLmDzK6uqrkCKkhh8Yn/oXduyc8b1UTyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q2qDv8+2Xs33bi39/5/bjWNq0xuzMLMZxKb+gV1x31A=;
 b=JuQnBT7QmfFGca8eHioBCdTM+2ox/L8fIaHNOqVT0VrouxiMMt/bToH4mS+Tbr7CiZ
 iGGkwf1/nVgEzAl08D7HzvzGaw8uHnXa3O3Gh5pzRlPIZ0tS3lMICNKsxw5j92rrdbFj
 VB6ONO0LFSx2g/0Q6boL8aQhZKFL4QfMhzd5hDnYQFf8nMRgsMss/TCR+DGq/HFz45DR
 Ygam806j3e2E2xoYyJ+QlbG0hm5gvQFP8LtgNyPSSwQHlIE0uxNqwvS9ul9GyBTZfTbx
 JbcsdfI+HyUW596nPVl8oQDxPvvfLqhjV4O93mvMl0MLEvcBxyEKE2SmEaMhi+W+LCKS
 AsIQ==
X-Gm-Message-State: AOAM531seIw1vLtwrpcf1LxfUspb8wMjSh1uTpaxyFmWZH51bdMAfOiG
 bVWE/c+AakhvmsyFs4rNVVbSjR4zFTWvXA==
X-Google-Smtp-Source: ABdhPJwY+UTwJjQ5VdFDo/eVbZpRc9OL3AwGqrGv0hDioITcQk7K+bwpwLu/Vcu5+u/31peEfDYCaQ==
X-Received: by 2002:a05:6a00:1310:b0:4ca:cc46:20c7 with SMTP id
 j16-20020a056a00131000b004cacc4620c7mr9191847pfu.44.1647592158327; 
 Fri, 18 Mar 2022 01:29:18 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:435a:ce78:7223:1e88])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a056a00084200b004f761a7287dsm9404044pfk.131.2022.03.18.01.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 01:29:18 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 2/4] drm/mediatek: init panel orientation property
Date: Fri, 18 Mar 2022 15:48:23 +0800
Message-Id: <20220318074825.3359978-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
In-Reply-To: <20220318074825.3359978-1-hsinyi@chromium.org>
References: <20220318074825.3359978-1-hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
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
index ccb0511b9cd5..0376b33e9651 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -810,6 +810,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
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
2.35.1.894.gb6a874cedc-goog

