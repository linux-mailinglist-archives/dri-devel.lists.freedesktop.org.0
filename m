Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D291FEC32
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277266EADF;
	Thu, 18 Jun 2020 07:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C17A882AF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 22:27:59 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id z9so4820173ljh.13
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 15:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h/buGMp+Ss9uiUTlhYkjRB/SevbvsV7Suq67TOhl6lM=;
 b=D/CVSkO2CC++b8uBZgrP1E+qFdW4kJcztCNPpHH9x6AGt9kFw3c7ePV/phmO6Ng6ZB
 SOztQqoE/nYP7nhphM/Mt7GHf61uh37odiZzuIGY8uwlBYzqZjlMt5XxrcGjMndKN4rK
 qHPhSrd2y8guyLfFlejAen4aMP75xpwznOcKOZdsEXMK+GtsBkLGCSTKH6Ts+T6xYiKJ
 DFw/cvwh5lsHR7uNk7jt+ZKNjaHwPR6Pp6+mMxeSvFpW2C2IVh8BOX73d7CussyW7Ufk
 krsN2+lCDNs06zdNF5YvW4O53FVoAsjG+PHF/pi33iMXUUh/ys1cHePLnlpjE6vhuEem
 AHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h/buGMp+Ss9uiUTlhYkjRB/SevbvsV7Suq67TOhl6lM=;
 b=HJYwIlNnjcSZ85+BoKZhvQjAvxtd+qBK6+CLMnm/QYNESvHy7wC06KUIZQz+yXo3FC
 VrtFK2qu4TrGpFk8iq+bX/6E2wD5lmA8onqK2QwB4OMBTracpAow7DI/YUswdAhlzsVr
 z+xvR9H8ud/yXzBmnlK62ZN5TUUUdkv8VgkMRPYvTsz3O1dQQDesXc9Onndg4uRr9UrB
 gH0e5NMnPiILIpBvQyIm5bFI7vkuSMSOzqeJZ9Yh7lZoR4FLoKk9MZzZmC5aSauUz6F8
 KUq4GVyTCCAnIFn/GsutrEW3G0Ttb/JfG+TyLYLv0uCNuzPviUHWCtJl+ZM1wHwo23oP
 5zPQ==
X-Gm-Message-State: AOAM532PAfbtFn7lRRU11Cr8VNZzYuw3vwFIs2uyDoB9SapqL++YdQKX
 NzaHooNmkGxEjTgd2JEYbN7o4fE2
X-Google-Smtp-Source: ABdhPJz0MyoPM7RAlYae5zeKJonCtS9xXXa02ONOLAjERMK8yve0QEl8ro8GhLlHMxRQ43L058CrCg==
X-Received: by 2002:a2e:8994:: with SMTP id c20mr719571lji.378.1592432877594; 
 Wed, 17 Jun 2020 15:27:57 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id a1sm210378ljk.133.2020.06.17.15.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:27:57 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v8 3/7] drm/tegra: output: Don't leak OF node on error
Date: Thu, 18 Jun 2020 01:26:59 +0300
Message-Id: <20200617222703.17080-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200617222703.17080-1-digetx@gmail.com>
References: <20200617222703.17080-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OF node should be put before returning error in tegra_output_probe(),
otherwise node's refcount will be leaked.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/output.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index e36e5e7c2f69..a6a711d54e88 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -102,10 +102,10 @@ int tegra_output_probe(struct tegra_output *output)
 	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
 	if (panel) {
 		output->panel = of_drm_find_panel(panel);
+		of_node_put(panel);
+
 		if (IS_ERR(output->panel))
 			return PTR_ERR(output->panel);
-
-		of_node_put(panel);
 	}
 
 	output->edid = of_get_property(output->of_node, "nvidia,edid", &size);
@@ -113,13 +113,12 @@ int tegra_output_probe(struct tegra_output *output)
 	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
 	if (ddc) {
 		output->ddc = of_find_i2c_adapter_by_node(ddc);
+		of_node_put(ddc);
+
 		if (!output->ddc) {
 			err = -EPROBE_DEFER;
-			of_node_put(ddc);
 			return err;
 		}
-
-		of_node_put(ddc);
 	}
 
 	output->hpd_gpio = devm_gpiod_get_from_of_node(output->dev,
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
