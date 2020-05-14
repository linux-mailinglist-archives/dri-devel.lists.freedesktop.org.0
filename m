Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683031D3C12
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D926EBA9;
	Thu, 14 May 2020 19:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4BA6EBAA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:10:18 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a21so4718179ljj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J916F81BKXSH1NRVPofwjNX6i7ySZukl1DQn7KOtjRY=;
 b=KhTkE42CZnDvo5d4tHCxFOUM/fdSLjbFY/mCcZEoAqhx8J5I7dtrJTI2Of9JD9wiu0
 ngMdA6sgzjKks/LuuWupwhrnbv0fh8R8+mCxe3sgMOguRjwh0ICfRqPYYWmcgIa3lC7g
 FBfd2sqHT3rlSOxo0Cxx+Hm1wuzoIfTuu/KKlkM+IiANb9Zi/DwYnj67dlZMXQsylTDo
 xtQrkDqz8Hu+5hloVAHFN6cGpn221+2SDJ20D8qtErm9fpIeca5I8w2u7Y2752HehSqu
 ou4r2diGpibjXDuFwwLJEI5+nxyHYBkMKCk9mQQEK0neEE7PlBJ4KB7iEZL2pPb+AWOQ
 xIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J916F81BKXSH1NRVPofwjNX6i7ySZukl1DQn7KOtjRY=;
 b=lw4OBxTqZMpmMuCv6SrWIk0p6hiqDBn2Tj1dkLhR1gDw4wdwoIffCLP2C6spMmtWh6
 YrQNe/BvQRZg8jqggOM9f8tvOGYOxN3/wUG1Y0OjqjmHLT0KcI5Vlrya/zBQajP7JfgL
 +KAVy1K5ozcDdSGI/r+4Jy17UKCodPFHiW6LC8aaWKevIfV4wZzP5GWx0FkA3E/Fp/yQ
 cTpT1KqbPeDWfPARgaMyYYn62BbNtXXtI9pw4mhf3yPtszGwq+1tK83gcj11HPI0n6Bn
 r2VryNhAGt5BW3JTGU2ZRxwphhueLhFdQ/78nQI5+6wf8sn7kjbJqElyIO/wcckdYWno
 aKuw==
X-Gm-Message-State: AOAM530mbVBsEiQDz42iFBAFt+tJaUiY5yk5wgWQ6kjLiAIrxyalqB7F
 V46I5HVrOvo+pBf6tjzdy7k4zpq8xV4zlQ==
X-Google-Smtp-Source: ABdhPJzmOnNVIJlWDEc/Vi8Cs/lkpqkVwdrbcdNjtNuimAeT/PfHkeObjIoyXMQnn9rV3ILgNFk0Hw==
X-Received: by 2002:a2e:860a:: with SMTP id a10mr3924004lji.20.1589483416265; 
 Thu, 14 May 2020 12:10:16 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:8d23:71d:e677:1c7c])
 by smtp.gmail.com with ESMTPSA id q30sm2362958lfd.32.2020.05.14.12.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:10:15 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 01/18] drm/omap: display: use devm_of_find_backlight
Date: Thu, 14 May 2020 21:09:44 +0200
Message-Id: <20200514191001.457441-2-sam@ravnborg.org>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Zheng Bin <zhengbin13@huawei.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>
Cc: Enrico Weigelt <info@metux.net>
Cc: Allison Randal <allison@lohutok.net>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c    | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 3484b5d4a91c..faca5c873bde 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -1163,7 +1163,7 @@ static const struct omap_dss_driver dsicm_dss_driver = {
 static int dsicm_probe_of(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
-	struct device_node *backlight;
+	struct backlight_device *backlight;
 	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
 	struct display_timing timing;
 	int err;
@@ -1216,17 +1216,15 @@ static int dsicm_probe_of(struct platform_device *pdev)
 		ddata->vddi = NULL;
 	}
 
-	backlight = of_parse_phandle(node, "backlight", 0);
-	if (backlight) {
-		ddata->extbldev = of_find_backlight_by_node(backlight);
-		of_node_put(backlight);
+	backlight = devm_of_find_backlight(&pdev->dev);
+	if (IS_ERR(backlight))
+		return PTR_ERR(backlight);
 
-		if (!ddata->extbldev)
-			return -EPROBE_DEFER;
-	} else {
-		/* assume native backlight support */
+	/* If no backlight device is found assume native backlight support */
+	if (backlight)
+		ddata->extbldev = backlight;
+	else
 		ddata->use_dsi_backlight = true;
-	}
 
 	/* TODO: ulps */
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
