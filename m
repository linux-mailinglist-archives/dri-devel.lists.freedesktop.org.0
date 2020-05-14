Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAF81D3C13
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356C76EBAA;
	Thu, 14 May 2020 19:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8766EBAA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:10:20 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id d22so3571773lfm.11
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iALLuERW1McwN1PgISrEqSKRl+DwcpATFhkrhtmrlJY=;
 b=OrqDrsx57GbIKMFC5gURmUlwlXbmOqs7a3uuD/o3zYSUdLnKOrLToMPE2u3vlFpT5V
 IeWIeABYAjFRkBDUmkWSD7Zo0BHCtMufMofSC4wm+JJX15TjGKcS3I3/DFmzqZ4/A838
 r8Xx7r7Fq+bAYTtUVfvDWLP0yqUSXEhYUytoyezBaSvjJ+EBiqNTid/xv2f3u0p10FLp
 6guun3D6rhS65c3eG0fOvGkSRCLYI4XT0HjP6EclM79x2NS4ZsRjkFsTes6d35P7D3rC
 FN9FegLPZAjO9n9n2+a9YTTfdgJDRL127KOe/jD+CtixSxlf4DJ02r/tSSxLWw9SOppY
 7ZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iALLuERW1McwN1PgISrEqSKRl+DwcpATFhkrhtmrlJY=;
 b=e29SuwTp4HtcVHAItNggJwLLDsn53rI51XS7inks/g2NolpZk/1NKYZBhrco16E9AC
 QHp675FbmOLulOfgNe19D2WfWCYCzNGdV4AOnvUUEK/sxze1xzGfhjgMmRnh01dc0r2o
 +megPXJkFyNh/TyxgOmUZU0LpQ0EBUjZyuwUv+K3v9QohbaMFKDjggJLnwjnSSaRWl3r
 hCK30CGlNanAU7a5KAhaMKV+a8g0dYMWaT+RpAK1FvU4GAXr97cA9DJd945ZPyK4BMKm
 LiJwQVLkMOc6PKZIiD7fuNDKruEH2cHhwm2FijSVkSAnmabFnhwmQav1Be74Vcd8iQk8
 7mNQ==
X-Gm-Message-State: AOAM533bQtKa3dclZoQE+Gl3wF0mVDhxOb1TrsQzbqYGcwupfE5Vtsx1
 rE7oUSbuaAFdi4r6emCgV+M993DmoIpgaA==
X-Google-Smtp-Source: ABdhPJxtOgNHrWlT1g6kVCkaO7bY7+x7AvNWUz2afNrA3i5zMlrlrAvEYJLlXd6AdF/rD1Dg4wHqew==
X-Received: by 2002:ac2:4304:: with SMTP id l4mr4314956lfh.87.1589483418267;
 Thu, 14 May 2020 12:10:18 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:8d23:71d:e677:1c7c])
 by smtp.gmail.com with ESMTPSA id q30sm2362958lfd.32.2020.05.14.12.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:10:17 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 02/18] drm/tilcdc: use devm_of_find_backlight
Date: Thu, 14 May 2020 21:09:45 +0200
Message-Id: <20200514191001.457441-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200514191001.457441-1-sam@ravnborg.org>
References: <20200514191001.457441-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Russell King <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>,
 Uwe Kleine Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Support Opensource <support.opensource@diasemi.com>,
 patches@opensource.cirrus.com, Douglas Anderson <dianders@chromium.org>,
 Zheng Bin <zhengbin13@huawei.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Look up backlight device using devm_of_find_backlight().
This simplifies the code and prevents us from hardcoding
the node name in the driver.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_panel.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index 12823d60c4e8..b207b2f19d42 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -299,7 +299,8 @@ static struct tilcdc_panel_info *of_get_panel_info(struct device_node *np)
 
 static int panel_probe(struct platform_device *pdev)
 {
-	struct device_node *bl_node, *node = pdev->dev.of_node;
+	struct device_node *node = pdev->dev.of_node;
+	struct backlight_device *backlight;
 	struct panel_module *panel_mod;
 	struct tilcdc_module *mod;
 	struct pinctrl *pinctrl;
@@ -315,16 +316,10 @@ static int panel_probe(struct platform_device *pdev)
 	if (!panel_mod)
 		return -ENOMEM;
 
-	bl_node = of_parse_phandle(node, "backlight", 0);
-	if (bl_node) {
-		panel_mod->backlight = of_find_backlight_by_node(bl_node);
-		of_node_put(bl_node);
-
-		if (!panel_mod->backlight)
-			return -EPROBE_DEFER;
-
-		dev_info(&pdev->dev, "found backlight\n");
-	}
+	backlight = devm_of_find_backlight(&pdev->dev);
+	if (IS_ERR(backlight))
+		return PTR_ERR(backlight);
+	panel_mod->backlight = backlight;
 
 	panel_mod->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
 							 GPIOD_OUT_LOW);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
