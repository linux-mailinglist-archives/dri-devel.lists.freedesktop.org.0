Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B3C542C28
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A0910E5AD;
	Wed,  8 Jun 2022 09:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D973F10E47F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:48:45 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so26525543fac.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=URQgL2yUP1UPEGjFj3Vtkw+GlIVy5pPiHox/tAieZas=;
 b=guUBWKPAZLE2AlknSqalQJBGhSqpjjGX0nCX7fEpw8mzo0ObUjigy0AnDfLEAgdFk7
 Y8GbNFpn/KksfZR0VbXB03OYgAEdrAzGbZiNOhgBNz3CaGmcY822U1qi1ig0Bh6r+fBz
 n+dMy4c5aZO+9GYZOnCLA+xXQx2vcJI4LqdQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=URQgL2yUP1UPEGjFj3Vtkw+GlIVy5pPiHox/tAieZas=;
 b=SukJLWkUJAsNkaszBNbfLOw51LKHy4jVLx9ZRQbriDg1FcR3S8g/CIR//jCKOy2Jz1
 c+41t0m4wHS7hayG/0KGzXlr8njDWHUWhW5Jr8xSTtTF1K9+aMXBx3g0obfpaCM160hX
 Xuklgazepf9ozqKhZMpV0ApsBd+cYpUMPr76mCWj3ewBcUFAbtq/rVnE6ehu9cpE+eM9
 CKr8YJfXvNkzE0FhJrVU7SeUlizjl+r16mS17hK3ku1Of5y8eblNPrqN9wGJ27Y8JUom
 W+n58sq3x9Awt/sJETPjRoa9LHs3oQfpqyoP5j78DlZ/2oGA7MVJhapMsCEVS0gCn4Sz
 Y0Ww==
X-Gm-Message-State: AOAM532d7Y9B7IHVO1p+PesOM0uahbfHbaTFV+CB+RhO2D8rnH6Bskt+
 gnoesC8mw9uHgl8p1Aw1YUy3rB1AQ0HqwQ==
X-Google-Smtp-Source: ABdhPJwy4JZc4zb4+EKQwQ9hvDSYmC3kXEw76KbN7E6cksRjAfK4BeN+5E0C6Ehlqqimys/OXDBLMw==
X-Received: by 2002:a17:90a:4897:b0:1c7:5fce:cbcd with SMTP id
 b23-20020a17090a489700b001c75fcecbcdmr72094458pjh.45.1654681714929; 
 Wed, 08 Jun 2022 02:48:34 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c46b:e7b1:f6c8:5eb8])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a17090a950a00b001e28e80a8d6sm13584038pjo.38.2022.06.08.02.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 02:48:34 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 4/8] drm/panel: lvds: Implement .get_orientation callback
Date: Wed,  8 Jun 2022 17:48:12 +0800
Message-Id: <20220608094816.2898692-5-hsinyi@chromium.org>
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
 drivers/gpu/drm/panel/panel-lvds.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index f11252fb00fe..7a4fedc63e8e 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -99,15 +99,28 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	drm_display_info_set_bus_formats(&connector->display_info,
 					 &lvds->bus_format, 1);
 	connector->display_info.bus_flags = lvds->bus_flags;
+
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, lvds->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation panel_lvds_get_orientation(struct drm_panel *panel)
+{
+       struct panel_lvds *lvds = to_panel_lvds(panel);
+
+       return lvds->orientation;
+}
+
 static const struct drm_panel_funcs panel_lvds_funcs = {
 	.unprepare = panel_lvds_unprepare,
 	.prepare = panel_lvds_prepare,
 	.get_modes = panel_lvds_get_modes,
+	.get_orientation = panel_lvds_get_orientation,
 };
 
 static int panel_lvds_parse_dt(struct panel_lvds *lvds)
-- 
2.36.1.255.ge46751e96f-goog

