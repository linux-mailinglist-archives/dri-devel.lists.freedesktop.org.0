Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652C55444C7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 09:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C73810FA97;
	Thu,  9 Jun 2022 07:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C113810FDE7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 07:27:58 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so20326796pjb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 00:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K7MRkR8auhgUPzxY/AhWyDzJkPMHJW4gIp7+t1KlPCE=;
 b=l7ZtrVUBq2GYXh2+SH235Ub+vP7lWLaHmSegb5FpWeD2UBMVxBbbSg+yfXe8Ha0sHa
 sRrJmsQrI/ZCdxQ+/mkSj46cerzBPD3JKq3Y5+z0BBzUgbEQ/2VS82VzI3LUsJM4QZbp
 QiY5PgrIjbT2MZf10Yl5LRotp6JHblUn1MP+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K7MRkR8auhgUPzxY/AhWyDzJkPMHJW4gIp7+t1KlPCE=;
 b=OTfSv1+aODg6qotkJsKrtHzuA7q9Ktke3T34UmyL6iRP0elehpPAaW33RkGltTTlHc
 uKfrT3KqPhS+bWD44oiqQkWgS08mZlKSJE2+M4phT/pjkxnrJSevPLFfWnSowtXaIROl
 l21VcK7u2uhJxSm5srQi+YPrsjEMjviLKrdJTvudHsEVBAgkfCu+D1hJRHRZYeILxQ5M
 PU0OZ29N/sRDocxaNfKL1OvIczCkBz/gEtzz9xuaaeb2A5v1jDI6a5OXT5VGqe/lbRN8
 JjSGB/TY/DKW5/xX1wVJjDjvox7AsCVAvHSP0VmIqRLxKpCYXUWWwHNrfIk4cIY7p3fh
 O40A==
X-Gm-Message-State: AOAM5317lmF9b1VFGxd6wOYUnH2PbDYDw0dPRfIGBL3ZVWTm/hAM9bFe
 8evPF/o7AKVJ9mZmztP6SC8+wg==
X-Google-Smtp-Source: ABdhPJz4dqkjFokdBYRKpv24v7t0WqPiApCHL3ML7AXlrOqT/NAZMvUv0SYaTx3mNhk2+YTvTonvkA==
X-Received: by 2002:a17:902:74c3:b0:167:6811:40 with SMTP id
 f3-20020a17090274c300b0016768110040mr25200983plt.120.1654759678228; 
 Thu, 09 Jun 2022 00:27:58 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5119:d95b:c6cd:77fb])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a1709027ed000b0016403cae7desm15312221plb.276.2022.06.09.00.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 00:27:57 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v7 6/8] drm/panel: ili9881c: Implement .get_orientation
 callback
Date: Thu,  9 Jun 2022 15:27:20 +0800
Message-Id: <20220609072722.3488207-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220609072722.3488207-1-hsinyi@chromium.org>
References: <20220609072722.3488207-1-hsinyi@chromium.org>
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index ba30d11547ade..58d6798c25ed8 100644
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

