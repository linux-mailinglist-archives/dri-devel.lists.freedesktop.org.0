Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5555E245D53
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD3D6E4D2;
	Mon, 17 Aug 2020 07:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DB66E265
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 21:56:35 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id b30so3808360lfj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 14:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTkK39BlZkedB5Vph2dghueoQAO2WsRm0+GwhySEKyY=;
 b=l0O3VVSf0dYKebIDxndlR/t/F2RLrn/zKRoOGjnGLxMx8bnX2hwymf1eZQsqys6tsD
 AsqopKdS0kfkrtQsAu82vdMzBGR7Cv0BTspPLjqarhzMSjriKXQoCPn9Hojsj+ytQ3jR
 iyAadB948zlIFHN0on94OvcSNqH4IWuy/TTGVrSqFfpKiDgvaib5VeB6jlEpnBuKP9o/
 KnLLArRk61U3HdFvPqziKxw2auZnkr5X6uFnZ64CT6gIDUGmg/i6YePcFCKJm47YecUs
 d/d2pOtRMdxHjlnZ/39/byJJz8bpiOjzw+YNWkB9KO44utPF6KV1sr5UHMz9z9phIVuI
 wyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTkK39BlZkedB5Vph2dghueoQAO2WsRm0+GwhySEKyY=;
 b=cVxUP4z243U35yGHo3hdYCClo4wEsDkLgRxcA8bab6/fSA3XknA3jesoTK7G4uJvwL
 RyfuAdCjghv9DkAnhJu6eFaM17l09m1LOkLmFfBaRSKw4zpyiLIDEdfNoC6zQpCLL6y1
 YwEh04rQcxoMB4x5DnXORbV7cVx45Ss8YtIlZtckBmURks9d/woTSX+AcPlpkbZpJ29r
 gJCEP0XQ2+ywsLKU4VyTvABzdGElAKXniHYilPfPtkjd4QxWcN0QOeYEoX4eRByDCxfl
 FBKikxXVR3CPpWZkCNAsz46Ou2j5ClP9NFdzlHvSa6hfMXRGcYbWqzUEr7SSDrbW5wT7
 EpLA==
X-Gm-Message-State: AOAM5324VvFgoT9mP1G4HYzsIE/CyCf2W8hg2FjoQtIVRb74kLl1JHZ4
 QTi0+zIeXW1cnp3uCKZpHXM=
X-Google-Smtp-Source: ABdhPJwpXkbGHsxGhgR7mAcufwuWAY7AnTmGU57eUQgfeST1zhEUCzFswSyjx17Cd53DZIZBQEiSTg==
X-Received: by 2002:a19:418a:: with SMTP id o132mr3214359lfa.63.1597355794110; 
 Thu, 13 Aug 2020 14:56:34 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id z20sm1349977ljk.97.2020.08.13.14.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 14:56:33 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: [PATCH RESEND v12 4/4] drm/panel-simple: Read panel orientation
Date: Fri, 14 Aug 2020 00:56:09 +0300
Message-Id: <20200813215609.28643-5-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813215609.28643-1-digetx@gmail.com>
References: <20200813215609.28643-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
index cb6550d37e85..6e3e99a30d85 100644
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
