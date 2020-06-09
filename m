Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E74B71F4F3C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57646E46E;
	Wed, 10 Jun 2020 07:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDFD89F85
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:29:15 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y11so23413463ljm.9
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h/buGMp+Ss9uiUTlhYkjRB/SevbvsV7Suq67TOhl6lM=;
 b=ZFwKVZmJ8MZiS+yKqDOG1+DhkcEJJCq/2FLEmxlbnI8iOoQ0pvvcX+9WbJnEL4Y07y
 q0s3iTqppiEmQg/QWgIF1Hh38LG0s+86Y4cCi1NJY325/Lopu1av7FBHu0RuyEhrOCHo
 v3dI0Ke2MXFFbZRg3xm1m9Rz59DXhcn+5oYzXaLGP99IwsJVaWzk1LYRtIMx3JAKlxrm
 kfLLc/RO7ZUEDNvYOIatxGVHjr7vO25gfP4ECoZUXDMZ+lR8HkBjTvd6o8LoHd/+Hrs1
 tU/p5ClJJIl5wYjdTVXUvPcv6l2IYek75ImnUD/eilhDdAzF1monsFjDZvQzVtl5tt4f
 HBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h/buGMp+Ss9uiUTlhYkjRB/SevbvsV7Suq67TOhl6lM=;
 b=RvBGUl2mePFnCxy8uIzKcDbb5pyLsH8GDR2Kx0+goUJISgMxXjGja/sOiQ+bTcer/u
 r2kskczQrllOhRfgQ6Xgd82ogfhfq8JKVshqNX7qk/rnP9H0aRkWmbvAiFXC0LfOloAw
 NTFXghNqpRWGyUmWLu6rwlfcExeWvYEP8ciVuVAVor8x72DHHyii0uP5FjUuBlVDW/A1
 apMlu3Az+kD36qIlk+Q3QS6AElz18ltwiK1FE6nDD+Vj0ufPe7VtjNjkWn/+YS2DAuaG
 +z8Ff3V4KPK2U5oasYZQLwH+vZz3+LCSP1F1576WEQ7isNvagJcmgCDjNn4REP+oSOdd
 xHuA==
X-Gm-Message-State: AOAM530L02Rpgux61IVDGXdQ7tKL+i3p+eOiPiL7IJtiXJ2uAR28YEGJ
 X9pCNskT79frKfy0xOvXsgI=
X-Google-Smtp-Source: ABdhPJxoPCX31yr+6U+GKJT2eytYYVErrWCMsq+nf1jvEBCuB8LYKRf2OQ7DnGBobtfcAb7fJw8L1A==
X-Received: by 2002:a2e:8796:: with SMTP id n22mr12640360lji.15.1591709353929; 
 Tue, 09 Jun 2020 06:29:13 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id s8sm5069821lfc.83.2020.06.09.06.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:29:13 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v6 3/6] drm/tegra: output: Don't leak OF node on error
Date: Tue,  9 Jun 2020 16:28:52 +0300
Message-Id: <20200609132855.20975-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200609132855.20975-1-digetx@gmail.com>
References: <20200609132855.20975-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
