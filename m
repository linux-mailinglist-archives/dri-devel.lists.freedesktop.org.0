Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEDA542BE1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E716810E263;
	Wed,  8 Jun 2022 09:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B96310E263
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:48:41 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so17837954pjb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1HCnyXhOafzmcP69v2HLalUicns4RO/ZQ4qvjS6XyGk=;
 b=TKlka2JWr44ssLLTx/ABCtjfqthwug/PJ8osEPhlEiu9s3s0R2eFiNlLU2VVBCK2oY
 spEI6IcIC0Y7RuS5XIz/7AcpSgMzg9RJ+pNYuGhUAVQ+QcbzhgLC4+gLDblo9s8kXDwj
 LwKR6/SQt8R+YXpVbDMufrMBVQbFsJS6qxt74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1HCnyXhOafzmcP69v2HLalUicns4RO/ZQ4qvjS6XyGk=;
 b=xmLlZlrtMB7J8XAsEYVdLI4xa+A4ejCR7gPP0xNc0gm+hmwKPs69pU0afBNDa9Aa6N
 XG9CjFjhAfug9CRfK3w2qQLOBYxkNpdoRMCtaT05ZA+ygGclijaVHvkTjvm0ySI5vsny
 ADJNP25Pc82NPrEK9T/ZHXeaqVmarpPt9roH5B3tlaklrq8o0v5zBNJiw8uUUKDZDmow
 ne6iiQhQia3L4xwZ4wlFJfv71wsZwi+O/79uPxX9dKRIg5fdgFnK1nC8LjU4gL5gh77y
 tpM9zWf6ahRTNDX6X6K0KJnAz3CzIVPyJSIrPlkU/RozZZw5aSiHHg+EjAALx4F6gqUK
 QpYw==
X-Gm-Message-State: AOAM531UR9XGhHAVEWZYX7X3DeIWQ1iNUfzGaKo3udACqV25PPGk57+J
 CuGErd9TKsCtdZOzCsT/W6VH7A==
X-Google-Smtp-Source: ABdhPJziscByCaE36IM356mQcufbuxFzgH4ydP6X03lbRU/92TTGOXEDQhe7TphA6EcNjWJhBZO09g==
X-Received: by 2002:a17:90b:1d8e:b0:1e6:74da:97b4 with SMTP id
 pf14-20020a17090b1d8e00b001e674da97b4mr37453886pjb.147.1654681720998; 
 Wed, 08 Jun 2022 02:48:40 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c46b:e7b1:f6c8:5eb8])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a17090a950a00b001e28e80a8d6sm13584038pjo.38.2022.06.08.02.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 02:48:40 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 6/8] drm/panel: ili9881c: Implement .get_orientation
 callback
Date: Wed,  8 Jun 2022 17:48:14 +0800
Message-Id: <20220608094816.2898692-7-hsinyi@chromium.org>
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
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index ba30d11547ad..58d6798c25ed 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -853,17 +853,29 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
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

