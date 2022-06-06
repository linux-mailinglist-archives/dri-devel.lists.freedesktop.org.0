Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E5153E56A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 17:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B507C11235B;
	Mon,  6 Jun 2022 15:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB21E11235B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 15:25:01 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id 129so13181613pgc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 08:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pK8Pia3oWcO6LvRo8JULHgdKZyhIvY64SIstYz7E0T8=;
 b=j8KrEYwzpTl5wHCO3UxGm1TqLbk/MMUjBXH7zs5T2HtQD/NymmchMMT2FhwajxbvDA
 /NGiGjbOKNhODqs6sZLzSOIu7dkS7XzlyhcmJNGvmaouF1zHr6tpgxhRc544Z15q2oF9
 L+qG4WbV8zWJL+HU6jxVCj6uINhkvLcAgNEFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pK8Pia3oWcO6LvRo8JULHgdKZyhIvY64SIstYz7E0T8=;
 b=dFk1TrnnrcjWij+P5yAff/8VlOap1V9S3tEN/kNP+l2HwraFHbuaaR5/Ho5ncamVOX
 TNwHQb/ARzNkOMxqUKwEJUWuyqxL2L7/H+UXd5hy29htWKVxogIi3HHmXqRt2hJgIjAF
 TokSP5oepaC5CgrV7yQtn5I11PLBKR4CKa+31mEyTAbKBHVapg9tQsFtRk6ZwuSC14Fb
 McmQHr8Rjk20U36W2LHvUDLQYp0fgIGKPmiArAyVTpM4mt5wWDbOmQUiOqZUO0ui1fKp
 aSfVa+BBchDMMz9lB/YzI40JTtnYuKTwHIgm4ligRXAalvRexIJQ5Djg7VQ7zTxu7ZEc
 ARkQ==
X-Gm-Message-State: AOAM532YEulxnETSXl6/VY98eCz5tIVku6DNYBf8mpR2r7km6zjTEDpA
 9Rb0PkPrRJqeo5MuvvRbq0rfvA==
X-Google-Smtp-Source: ABdhPJze2xpVhRS2YvADrwZ5t2z07QcQ7pjO+EuDJqVX6Oxw8Uzy747DsOh3B4OxKDgctHwtGwZUxg==
X-Received: by 2002:a05:6a00:338e:b0:51b:c452:4210 with SMTP id
 cm14-20020a056a00338e00b0051bc4524210mr24166501pfb.69.1654529101396; 
 Mon, 06 Jun 2022 08:25:01 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0a:5e4:e24:c8c4]) by smtp.gmail.com with ESMTPSA id
 h1-20020a655181000000b003fbaae74971sm10749306pgq.72.2022.06.06.08.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 08:25:01 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v4 7/8] drm/panel: elida-kd35t133: Implement .get_orientation
 callback
Date: Mon,  6 Jun 2022 23:24:30 +0800
Message-Id: <20220606152431.1889185-8-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606152431.1889185-1-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
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
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 80227617a4d6..fa85a288afdc 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -217,15 +217,29 @@ static int kd35t133_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 	drm_mode_probed_add(connector, mode);
+	/*
+	 * drm drivers are expected to call drm_panel_get_orientation() to get
+	 * panel's orientation then drm_connector_set_panel_orientation() to
+	 * set the property before drm_dev_register(). Otherwise there will be
+	 * a WARN_ON if orientation is set after drm is registered.
+	 */
 	drm_connector_set_panel_orientation(connector, ctx->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation kd35t133_get_orientation(struct drm_panel *panel)
+{
+       struct kd35t133 *ctx = panel_to_kd35t133(panel);
+
+       return ctx->orientation;
+}
+
 static const struct drm_panel_funcs kd35t133_funcs = {
 	.unprepare	= kd35t133_unprepare,
 	.prepare	= kd35t133_prepare,
 	.get_modes	= kd35t133_get_modes,
+	.get_orientation = kd35t133_get_orientation,
 };
 
 static int kd35t133_probe(struct mipi_dsi_device *dsi)
-- 
2.36.1.255.ge46751e96f-goog

