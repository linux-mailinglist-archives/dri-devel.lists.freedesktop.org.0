Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE69C1FEC2A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CDA6EA8A;
	Thu, 18 Jun 2020 07:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0A36E7EF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 23:20:18 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 9so4964408ljc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 16:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cpCBAuxLIibpWTrEfnZ4pOnO24Bo4VASqlc3TYxbEqA=;
 b=YWp4V8jl4qNCfkH09ImPEg/X26d+XB7NXB0OmvxCehmOoqyI+rVejTY8WifV7InUUq
 QkgGFYEemD4osjkVU1bByc0u2A+3nUiZzY0JNph9iVtYoY92hpcAPVVJpVGXckxJ5oPa
 1W9A4T6fctWq1rjEuBd53ew0n9zGPf2uWnkIvRWu1SWd7+Afck1GfhPsJJCXLqDL9Pqs
 m+DJ1EqPiZvF8bD7mvze+DNK9Kgi4kUfzCYY7YQ10cIAbie5wFyzDd/ptBRaXpXcVgxU
 uLEIU7TqsCNKYdLJapIfLKge5eh3KX80nQ5oJ/Jen/YM0INukDi8k9KV7F+R3AtVHcqS
 glzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cpCBAuxLIibpWTrEfnZ4pOnO24Bo4VASqlc3TYxbEqA=;
 b=jLNifG78SZQ2DfdCF3QFVszr5eH0szQPxZJRh2+0h+jiRtGf4kgX7hbyiH8zcNVAlg
 9lV0fPvoXxg2uuEGaZijpJHsNerimBzZqS5NVK2TySVj5rDk0j7wH+tgKa4Y7IugRBzw
 hIf2f8k/jwFvQepMLfAFyJAxP5LIKVWCB0mPVOZm7a4+AM0xR+nYSq3q+6JVZY5akn2Q
 HYELHRUBTP8wP1LBdC+3kkmDGLAkabbM7MBSYHeP5yle0vtsvtmO20nXWtpAL/hpG4Qt
 IEH2GcHvoi5jAQ/A4EbxoAcGo8jJb+5801vpSzSvvZ05S9+Vw1Kb5J3/uwCR+zk/5ZBe
 qayg==
X-Gm-Message-State: AOAM5337Oe6dkFwUGyn1eSVBrjpoZSjUKCdTgjsDwZUmGnf5mHdS+Jcb
 0UIxFof0pQziashpyQn7VPj7NF6m
X-Google-Smtp-Source: ABdhPJw86GF1deCwvykUE9oiRjzFg8hcTUyO2I001jtlm7SREpb4mqoGvWD8uzGQ/IAZGl+tkwwkFg==
X-Received: by 2002:a2e:6a05:: with SMTP id f5mr830817ljc.272.1592436017044;
 Wed, 17 Jun 2020 16:20:17 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id x3sm235100ljc.82.2020.06.17.16.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 16:20:16 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: [PATCH v11 3/4] drm/panel: lvds: Read panel orientation
Date: Thu, 18 Jun 2020 02:18:41 +0300
Message-Id: <20200617231842.30671-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200617231842.30671-1-digetx@gmail.com>
References: <20200617231842.30671-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The panel orientation needs to parsed from a device-tree and assigned to
the panel's connector in order to make orientation property available to
userspace. That's what this patch does for the generic LVDS panel.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/panel/panel-lvds.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 5ce3f4a2b7a1..f62227059090 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -37,6 +37,8 @@ struct panel_lvds {
 
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *reset_gpio;
+
+	enum drm_panel_orientation orientation;
 };
 
 static inline struct panel_lvds *to_panel_lvds(struct drm_panel *panel)
@@ -99,6 +101,7 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	connector->display_info.bus_flags = lvds->data_mirror
 					  ? DRM_BUS_FLAG_DATA_LSB_TO_MSB
 					  : DRM_BUS_FLAG_DATA_MSB_TO_LSB;
+	drm_connector_set_panel_orientation(connector, lvds->orientation);
 
 	return 1;
 }
@@ -116,6 +119,13 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
 	const char *mapping;
 	int ret;
 
+	ret = of_drm_get_panel_orientation(np, &lvds->orientation);
+	if (ret < 0) {
+		dev_err(lvds->dev, "%pOF: problems parsing rotation (%d)\n",
+			np, ret);
+		return ret;
+	}
+
 	ret = of_get_display_timing(np, "panel-timing", &timing);
 	if (ret < 0) {
 		dev_err(lvds->dev, "%pOF: problems parsing panel-timing (%d)\n",
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
