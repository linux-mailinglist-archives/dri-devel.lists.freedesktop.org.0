Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 780844AD3B2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75B610E5C0;
	Tue,  8 Feb 2022 08:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B972110E5A7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 08:42:43 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id y5so16762040pfe.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 00:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B51vztbAqanx3odcGYslN+f+8QXuSl3IGdZkOcgCEP4=;
 b=hSZaqn46Eg0k230j9msW8ZWdSycTD9QMSFONsAMN8N1GCF9epels6qCenWB+VLnHwi
 teHq4HupE7iMOHfyDa7zXdzjdrXplNx1GCcS6au9TnF+ZWtgVkOseJI3ghUEeNeJhkPZ
 shrywUSRRfEgTRLCyYagH0Kb0aulUHKv+f3OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B51vztbAqanx3odcGYslN+f+8QXuSl3IGdZkOcgCEP4=;
 b=hdYQOSS6k+ShGzWGsYxjgSX//KlpbnyyzGVuc2sEeOPTaDEDTa57zJPZmW7/LghA3+
 4sXdtAYuL7hY7f0eXlzBO+pmnfqAc2OCmlf2xYwv5u9Olc2MRN4HbFHYJB4zt6y3WiYb
 wAdgZqMS53Va25vxhei3szHcuYhJw8ZBoUMZ/cNOkKG9JNsaJV2/eQ7D2tctWZyo6Vhb
 kLRnYKnye2xlgP2bAsVOEBxmAL2v46k5aTUbfMVJK+B21xGeB0zWt/sPlUu19t/fssPB
 jIHq5Ryj45oP/QUUUXwtoCWoTtftE5JBnfjuXpuvjKbISeji6i4PuFPBTnMMLiHsTZ/V
 belg==
X-Gm-Message-State: AOAM531hEdTx/lJanOvx0SFmalsaM7l3zvYhQMpf0OqdHUC9+M2uJYAd
 KGUr9lmiOAeXHVvOxZfEV6LaIbu07iGRxA==
X-Google-Smtp-Source: ABdhPJwHECSzf8M58olhYXNLvBSmJuhfsp/CcQrf6d4N0193YY0h7uxL1BuFys94fBnhwtRkxle5pw==
X-Received: by 2002:a63:f709:: with SMTP id x9mr2665838pgh.428.1644309763116; 
 Tue, 08 Feb 2022 00:42:43 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:7d9a:166e:9d34:ff4f])
 by smtp.gmail.com with ESMTPSA id m14sm15362390pfc.170.2022.02.08.00.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 00:42:42 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v8 2/3] drm/mediatek: init panel orientation property
Date: Tue,  8 Feb 2022 16:42:33 +0800
Message-Id: <20220208084234.1684930-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208084234.1684930-1-hsinyi@chromium.org>
References: <20220208084234.1684930-1-hsinyi@chromium.org>
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
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
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
index 5d90d2eb001935..491bf5b0a2b984 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -965,6 +965,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
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
2.35.0.263.gb82422642f-goog

