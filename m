Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E788853E091
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 06:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0708112371;
	Mon,  6 Jun 2022 04:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAB2112371
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 04:47:48 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id j7so11870414pjn.4
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 21:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OBG3ddtj+ZgIQfqLNbcmwFIyPm4EVBcaHeaGb5pT53Q=;
 b=YTN/yrUXNy7AmhJsYdMLLEXrXzJNpCpiojsuW+/5T6R8odawYfdjXEzZ+B7EFnw/W6
 vYpDD9rzbiFP9XqgXZteF3gEyBPpL6GV8oBttP2HW053YVX1vnDQASxMTW9EXSt4MaCX
 dydxq0zVhK/pKtHCsXczIiTtwm7cPPHuSBmBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OBG3ddtj+ZgIQfqLNbcmwFIyPm4EVBcaHeaGb5pT53Q=;
 b=mYUz2h1pQoCMNDQmedehIOhV0oaVlqgU/vYlICGHis8RAFSc4GTvguVxwC317jNw99
 +1RgpdGuS1S0AbCIGhD3bZ4iZzvHcek51txBTiGCk8zV8FLYYqUch8eJOAcn+pkOzBOm
 ZNeUkFAW6+T6n6DDwFdmGnhe2bUGJaWGy+XdaJG6Jt6i39krCEFp82Qiwycjs4UGfln6
 lDYGGcyu95vqlhHEewxjpG0UIDS2lkwd4my/au1WZLUZgqosYxpd45gPcocuP7MIV514
 cfNNM/Bj5Qlg3XKdxVcvYCxTjSLmljSKLoyEDKQn73fxsM9MhV+gcPhyf+sLDPqESRXQ
 gNkQ==
X-Gm-Message-State: AOAM530CocO3xkaejxxZYVFljEe3DGhaKX/aVLttxyNrjADEKGdb97Xp
 GT88DvqIZik+EMOe4v4lwAG/8w==
X-Google-Smtp-Source: ABdhPJy0cD/wB0NQeYXWO8VZhTzsLbFYO/xjtJmuOarvo+HHpEF1EMPNpX5LHTHmFds8OdivJ/CaRg==
X-Received: by 2002:a17:90b:1e01:b0:1e3:1f4c:dd71 with SMTP id
 pg1-20020a17090b1e0100b001e31f4cdd71mr24916639pjb.168.1654490867923; 
 Sun, 05 Jun 2022 21:47:47 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ced3:b110:401b:b32c])
 by smtp.gmail.com with ESMTPSA id
 t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 21:47:47 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3 6/8] drm/panel: ili9881c: Implement .get_orientation
 callback
Date: Mon,  6 Jun 2022 12:47:18 +0800
Message-Id: <20220606044720.945964-7-hsinyi@chromium.org>
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
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index ba30d11547ad..c098a0ed6be7 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -853,17 +853,31 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 
+	/*
+	 * drm drivers are expected to call drm_panel_get_orientation() to get
+	 * panel's orientation then drm_connector_set_panel_orientation() to
+	 * set the property before drm_dev_register(). Otherwise there will be
+	 * a WARN_ON if orientation is set after drm is registered.
+	 */
 	drm_connector_set_panel_orientation(connector, ctx->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation ili9881c_get_orientation(struct drm_panel *panel)
+{
+       struct ili9881c *ctx = panel_to_ili9881c(panel);
+
+       return ctx->orientation;
+}
+
 static const struct drm_panel_funcs ili9881c_funcs = {
 	.prepare	= ili9881c_prepare,
 	.unprepare	= ili9881c_unprepare,
 	.enable		= ili9881c_enable,
 	.disable	= ili9881c_disable,
 	.get_modes	= ili9881c_get_modes,
+	.get_orientation = ili9881c_get_orientation,
 };
 
 static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
-- 
2.36.1.255.ge46751e96f-goog

