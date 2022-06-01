Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E09539F27
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CC51134B7;
	Wed,  1 Jun 2022 08:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8201134B0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:18:49 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id w3so1071058plp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 01:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s8d1zMyQL8ZiF08W1HsnKeLAzP5rqfEzV2IbS5Izuy0=;
 b=ksf8bG7XN7niA4y9qzTxWIPlIOFWTcLTSarHP02vVmoXUREl/ysj2VMRvOMzVquSZp
 74rYEsAYHeD9oNsiY+Xk9dezvNSEy8kQ9/ge4tXgXhzEPSugxwLbmLq5cKfe5XNIvu2k
 xkG1RIDytD/qALPSRIQ2XcJksj/Vu4jDPblQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s8d1zMyQL8ZiF08W1HsnKeLAzP5rqfEzV2IbS5Izuy0=;
 b=2HrcaN8ASc59lcAng9EuuRbBnlhRlnmKck9vrd37D1rF5gw1BzgQb7gEVh1x3iibdW
 Fyg6bIiQY6S41kwjRrW3MXz/2DIAn+pypdrrWUPOyXdYSstHsLksVxVkbx6Is9s46lGI
 zUAqUvDCfrKqsMLBeH4UgREThZTugpjJN0zx+XeIeKRuAFYpzzhzplmpMly8H6IjuVOa
 r51peovLsmEHtx4inlibp7re2nN36PivWVi6KozQeyqoo9zGOamCFwOSzvo5coAUjA77
 BuGWrWYdv3fBMJR5WItCYW1Q/ihGjghJyrrYd1HxpzRXrRvobWDWGD4BYGoINbrSSgfc
 AlFg==
X-Gm-Message-State: AOAM532wuzoLNO4dWgkM2c9yJzzPNLlxoOyS5NLz3lS0aVcmbOwm4oGm
 wP7VI7m3uABcQjHhOkSvwXhGGQ==
X-Google-Smtp-Source: ABdhPJzu2dskjcB1Tt4UKMFKzdt9KMOK3CIoubeiISeLw+ntZYQQClm4pmYrRg1PPV6+tb9enszBDA==
X-Received: by 2002:a17:90a:14a6:b0:1dc:f64f:ff2c with SMTP id
 k35-20020a17090a14a600b001dcf64fff2cmr33347670pja.161.1654071528928; 
 Wed, 01 Jun 2022 01:18:48 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 01:18:48 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 5/8] drm/panel: panel-simple: Implement .get_orientation
 callback
Date: Wed,  1 Jun 2022 16:18:20 +0800
Message-Id: <20220601081823.1038797-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601081823.1038797-1-hsinyi@chromium.org>
References: <20220601081823.1038797-1-hsinyi@chromium.org>
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
---
 drivers/gpu/drm/panel/panel-simple.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a34f4198a534..54e78d978dcb 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -434,6 +434,14 @@ static int panel_simple_get_timings(struct drm_panel *panel,
 	return p->desc->num_timings;
 }
 
+static enum drm_panel_orientation panel_simple_get_orientation(struct drm_panel *panel)
+{
+       struct panel_simple *p = to_panel_simple(panel);
+
+       return p->orientation;
+}
+
+
 static const struct drm_panel_funcs panel_simple_funcs = {
 	.disable = panel_simple_disable,
 	.unprepare = panel_simple_unprepare,
@@ -441,6 +449,7 @@ static const struct drm_panel_funcs panel_simple_funcs = {
 	.enable = panel_simple_enable,
 	.get_modes = panel_simple_get_modes,
 	.get_timings = panel_simple_get_timings,
+	.get_orientation = panel_simple_get_orientation,
 };
 
 static struct panel_desc panel_dpi;
-- 
2.36.1.255.ge46751e96f-goog

