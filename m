Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A9053F904
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A856B112AEC;
	Tue,  7 Jun 2022 09:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE78F112AEC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 09:06:02 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id q18so14279328pln.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 02:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FkC4wQn3+nXU7dST9FaxB+QRGREtiwsJHA3bRU8iD1Q=;
 b=KBM2BBQMMLkgUMsyR9jAjWANoeklgbSZu54h1hNjBmSk+dJ8U+LkBMOQU9IEslajqr
 IMWKVu3kPIKAiCJEzAlwxvBzAZUNCr9GzM0AXvUMoGO3F/K9fF3Irci+SpskTJtYvYsm
 XH6CtIIBAipgd4VblS3HvTpbYCYgpm9EN69YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FkC4wQn3+nXU7dST9FaxB+QRGREtiwsJHA3bRU8iD1Q=;
 b=i+IhYJRC9RtjV4fgyjS3kRTP/+E3CEY5wmvVjlKTIU9ujXwHpL8cEOT7jNRNR2ECbT
 UhiuYNYd65tu7tsYPA6IFGHG/bkXuAcPJMn8B1A/5rhY7IM7puD7rRf7w/95pKLEvmBk
 m6b6dnTrtlrbIFoaoDpBfPOzCsUkQUcqu4NgK2ra9H+E1YYSSNkyJHPbCGYJxq4p/CNz
 06In1NtLeITG7rg5XuvAOzYWEPSb1BD94G1b1U7X5SDwSVVCLrSMSSxlqQyTb6/LUfx9
 pvHSccEs6eiCUfNn1hcSxQgNWVu4IiuVSLcHB4kmb187Tm7wFb9wA0bMAxFkJdAhOh3r
 O6yQ==
X-Gm-Message-State: AOAM533ccKuaphr6PBE+nJYUFH7E8/7saIDr3b0mc8SAAnjbpgJyaqBv
 1en0zhz1D63vjyQaLAwwOaGY8Q==
X-Google-Smtp-Source: ABdhPJxtMveNapxOscHpOj1UN38se05kULc+7JDGp1azNMKPpid/CV/xKFokwk5MP3Wyrs0aUn69hA==
X-Received: by 2002:a17:902:6a85:b0:163:d764:e1a9 with SMTP id
 n5-20020a1709026a8500b00163d764e1a9mr28522297plk.50.1654592762305; 
 Tue, 07 Jun 2022 02:06:02 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
 by smtp.gmail.com with ESMTPSA id
 t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:06:01 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v5 2/8] drm/panel: boe-tv101wum-nl6: Implement
 .get_orientation callback
Date: Tue,  7 Jun 2022 17:05:43 +0800
Message-Id: <20220607090549.2345795-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607090549.2345795-1-hsinyi@chromium.org>
References: <20220607090549.2345795-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To return the orientation property to drm/kms driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v4->v5:
Move the usage text from caller to function doc. Leave todo instead.
Same for other panel patches.
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 1be150ac758f..07f722f33fc5 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1511,16 +1511,28 @@ static int boe_panel_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = boe->desc->size.width_mm;
 	connector->display_info.height_mm = boe->desc->size.height_mm;
 	connector->display_info.bpc = boe->desc->bpc;
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, boe->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation boe_panel_get_orientation(struct drm_panel *panel)
+{
+	struct boe_panel *boe = to_boe_panel(panel);
+
+	return boe->orientation;
+}
+
 static const struct drm_panel_funcs boe_panel_funcs = {
 	.unprepare = boe_panel_unprepare,
 	.prepare = boe_panel_prepare,
 	.enable = boe_panel_enable,
 	.get_modes = boe_panel_get_modes,
+	.get_orientation = boe_panel_get_orientation,
 };
 
 static int boe_panel_add(struct boe_panel *boe)
-- 
2.36.1.255.ge46751e96f-goog

