Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9AE53E08E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 06:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B400410F31B;
	Mon,  6 Jun 2022 04:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFB410F31B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 04:47:34 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id j7so11870414pjn.4
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 21:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hGnDD5r5M3UXCU6BZiTbTzLZsBiSocgUQfxs0cDS1G4=;
 b=l30rCOLic8LaKGIFsKhI6vz67rGgjxbrO3jiCldFNIW8I5OkLf9aDeJzRGh8jMUXQr
 SdCvlbgXiwhwr5/BW2rNXyL5J0Ps9u1DEZr8MjIpgqYLPWpvNzo7Yl+yZKxpXm2JIANR
 IIiMhDTbZV4a5Cc7egdsQqqF+o3IIyQ41+HPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hGnDD5r5M3UXCU6BZiTbTzLZsBiSocgUQfxs0cDS1G4=;
 b=nqKWROMgMHMAY9Kqo3/3vPBKatn6bRFcB9SeRPS3OpHF0Ok8kLzfpvjPsLnk94wK50
 Mtacrv9i9o0K6lLhyg6Biw1Jl0PXq0hqU0u0WLL+/j0SUCupak8amzEEsSnjXzJv4tML
 q6ezq7Rd1lBzKivlA00YJ3Z8G4bL12VV88Q7q+5mCUtcDODiyB511Zz9707w21e5Msys
 YIIS7AMKJuaa9bUYR2VmN9cFi/gacpybiX0DngVtO6IyKxKRORw/RkbwrgrN/XuGqtKv
 wMwphmq6MFB9UoVmHw1prHcUAQL7fizxPVkoFkRJiFde4kwP7XbxJ8J4VmYtXLGc77fE
 FX1Q==
X-Gm-Message-State: AOAM533mfDAxOr1yNoVeiNsha/d+8TzitcZYAqXjBoooMoel8SdI2H4P
 AdfcAhocpeCrwOJi2+avnoRdRA==
X-Google-Smtp-Source: ABdhPJzbBbErXs2PWbpEsxPCivcXPl2J9WhwCBQUubS9o01KqgtcAIWDGinwPaxoXPioh5PpozS7CA==
X-Received: by 2002:a17:902:c407:b0:163:df01:bbbc with SMTP id
 k7-20020a170902c40700b00163df01bbbcmr22376780plk.4.1654490854118; 
 Sun, 05 Jun 2022 21:47:34 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ced3:b110:401b:b32c])
 by smtp.gmail.com with ESMTPSA id
 t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 21:47:33 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3 2/8] drm/panel: boe-tv101wum-nl6: Implement
 .get_orientation callback
Date: Mon,  6 Jun 2022 12:47:14 +0800
Message-Id: <20220606044720.945964-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606044720.945964-1-hsinyi@chromium.org>
References: <20220606044720.945964-1-hsinyi@chromium.org>
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
---
v2->v3: add comments for notice.
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 1be150ac758f..a9cd07234179 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1511,16 +1511,30 @@ static int boe_panel_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = boe->desc->size.width_mm;
 	connector->display_info.height_mm = boe->desc->size.height_mm;
 	connector->display_info.bpc = boe->desc->bpc;
+	/*
+	 * drm drivers are expected to call drm_panel_get_orientation() to get
+	 * panel's orientation then drm_connector_set_panel_orientation() to
+	 * set the property before drm_dev_register(). Otherwise there will be
+	 * a WARN_ON if orientation is set after drm is registered.
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

