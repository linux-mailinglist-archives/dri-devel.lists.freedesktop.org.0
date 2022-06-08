Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF96542BEA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D57310E549;
	Wed,  8 Jun 2022 09:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B369510E38F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:48:44 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id bo5so17908659pfb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k48F1xGdZKHAitodolvWiz5jWt34V6z7uuaNSWQHz/4=;
 b=mjuft6W3VEPdNGWKnaMySpl6rJhexsAI7rf4/oPj/3tXgbm/bcKGzqwDhkVuWJKaoW
 6ZkK7zLQTboNF1KItp4Oxfn3PweihWVf1xrivLIyCgakTPyxHhEPSn37kHoOU5EpDFgD
 fYZKTD6N8AwubVrXTmhjJCn+kUhyJL/ibOvnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k48F1xGdZKHAitodolvWiz5jWt34V6z7uuaNSWQHz/4=;
 b=EN0OOwVGLUsucz2JSHOtNKQf1cnWLzUI+x6uuc0Mp8b4mDc5qGSnNQ1AfccGfqt3la
 sDOcya89EAxJIH/ncSbQ+kbRy8bGHL8Rn0PFxdWdnDPr7hJ8HPFDvBQu5TQy194UKu7j
 hEjp+/ATh1whw2hJiScOxNpxR7cd3aioq5HpCMptMDATlK4ZWk6HF6f9bZcRAUdjzwiy
 uGDpp2DgzSz1yMbIzfFrI3FFPEeaVzHm7Dz9jZbUtlUvgbQzIIaW8yCBKQGRt+2G6usO
 tUZWOBX0PmWeQ9NFfONIE06r7vPY6ph+WySTuZHpjWA79zkMCUt9rELUj088PgfsA1Lc
 AS1w==
X-Gm-Message-State: AOAM5328eM/O7UPGenWc+BMh/4hs39Pv7DhzCRaUw/RpKszqciTfU+Pj
 LzrPUoWtRes079Ypg4bUThQPdg==
X-Google-Smtp-Source: ABdhPJw0BdPzl0+1r4mTbW1xYGaRkwt3tvYvHMMvISgXDyTrIfNUNk9FoJ++5/FT423uIbh+qaXxnA==
X-Received: by 2002:a65:644b:0:b0:3fd:d5d5:8c7e with SMTP id
 s11-20020a65644b000000b003fdd5d58c7emr11242077pgv.590.1654681724058; 
 Wed, 08 Jun 2022 02:48:44 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c46b:e7b1:f6c8:5eb8])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a17090a950a00b001e28e80a8d6sm13584038pjo.38.2022.06.08.02.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 02:48:43 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 7/8] drm/panel: elida-kd35t133: Implement .get_orientation
 callback
Date: Wed,  8 Jun 2022 17:48:15 +0800
Message-Id: <20220608094816.2898692-8-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220608094816.2898692-1-hsinyi@chromium.org>
References: <20220608094816.2898692-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To return the orientation property to drm/kms driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 80227617a4d6..fa613d1d7a8f 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -217,15 +217,27 @@ static int kd35t133_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 	drm_mode_probed_add(connector, mode);
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
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

