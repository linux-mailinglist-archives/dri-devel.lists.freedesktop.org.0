Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4931FEC36
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5D86EADA;
	Thu, 18 Jun 2020 07:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2AD6EA03
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 23:20:19 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id i3so4994518ljg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 16:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDuNPkLsn+qFGP55GoH5xYzbgggRa+4B+kAR6hG962I=;
 b=g5Lw8nME1Hx+IKrcWvFOiOO3x5pYdTMxJsp+tioyT1hBv02M1bMp5s01sY8XgGifIG
 So0Ny31B115rEJ9QMjDp8X36aSgKBRzJ2CatKNoSGXImoQh3Qx7fue8sdYY9qh+MDLNJ
 bGkpUXtm00F4oUHZqwtlOflj2lGUYqYqSiip1o1TdsYhFYJ24inX8mpaj8I6qFht7eaw
 gGdhYgGitPewoIYECH11D3uCl4slXBSWGKjprY+5/PZinDjsXNg48UdQMI9LI3xnKkG2
 zMRBNZoGnnQVZ+1a1jURa/3L6pxFCMPAYiGoKEYJduzsOsIeN5hN7nBLpP1YT6KKzZ4l
 M19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xDuNPkLsn+qFGP55GoH5xYzbgggRa+4B+kAR6hG962I=;
 b=gnWrhKYDJwmCuBgGvDtjUk3hniPlpCmmPNrYgXenYup74LuBRMvzETjJnR7utFfIzF
 UPUA7jlz5OwO2rlQMz2ReaQV1n9jWRWFKjPcRzKYyPHSIjM5W2jGlpqKWXYZxpm/GYfM
 wqaWs5CWBJ4KpH6HWk3284eEBQs8sAOsaupV1/TlBvNTMjJYZGDzm3tG9xxfyi4fAy7E
 aJvI3YhyqOcCcUrIDWhjtzTPzU+b+fdDIJQcsCFxzC7imE0DtwfCkI+kqQqg3c1dtMWm
 +HbFnWMMRlD0ZyH6YPBCBBivYL67azYWytMBix/R2BOiGu/jb+Ix2xr9as0RTsqtqru+
 nReg==
X-Gm-Message-State: AOAM533+IC3WDNaLtaZeQrfIRdf/oR/8mWuznkcz2Fjn/p1I1ZP+6hFe
 ucRB8FSvz/ulTKFptNcmA/I=
X-Google-Smtp-Source: ABdhPJxT3+3ITtvZoxfpauwQtWfxUAcDCm937r+DCvi1iRnPkjGrWGExiRvyaUOt2t6UOl7y6A9wsQ==
X-Received: by 2002:a2e:b550:: with SMTP id a16mr830166ljn.345.1592436018131; 
 Wed, 17 Jun 2020 16:20:18 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id x3sm235100ljc.82.2020.06.17.16.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 16:20:17 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: [PATCH v11 4/4] drm/panel-simple: Read panel orientation
Date: Thu, 18 Jun 2020 02:18:42 +0300
Message-Id: <20200617231842.30671-5-digetx@gmail.com>
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
userspace. That's what this patch does for the panel-simple driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 6764ac630e22..2dee1320216c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -112,6 +112,8 @@ struct panel_simple {
 	struct gpio_desc *hpd_gpio;
 
 	struct drm_display_mode override_mode;
+
+	enum drm_panel_orientation orientation;
 };
 
 static inline struct panel_simple *to_panel_simple(struct drm_panel *panel)
@@ -371,6 +373,9 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 	/* add hard-coded panel modes */
 	num += panel_simple_get_non_edid_modes(p, connector);
 
+	/* set up connector's "panel orientation" property */
+	drm_connector_set_panel_orientation(connector, p->orientation);
+
 	return num;
 }
 
@@ -530,6 +535,12 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		return err;
 	}
 
+	err = of_drm_get_panel_orientation(dev->of_node, &panel->orientation);
+	if (err) {
+		dev_err(dev, "failed to parse rotation property: %d\n", err);
+		return err;
+	}
+
 	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
 	if (ddc) {
 		panel->ddc = of_find_i2c_adapter_by_node(ddc);
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
