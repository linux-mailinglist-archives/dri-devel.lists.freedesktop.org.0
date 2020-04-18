Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BF31B0201
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E34E6E248;
	Mon, 20 Apr 2020 06:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674346ECB6
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 17:07:22 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id g10so3954102lfj.13
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 10:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pVig2XpcIi1wUU1dzHSjXjcQnTVD/QNrePxBnDzBNIU=;
 b=q6O2vRM2j90iSyGYSzu+HAnw6lxsn7evud23Uvn5jGlos/gNwnCPxaUWaQ9XGbgx9d
 soLIh7aFCW90WQ/oKVjEBIz3r/kZ/T1HxcvuvLkskSx6o7dw4btmQ1mhpNCWrkWillhB
 Uf8C1qV6EJ/JyYt/7l88m3KYZGvaCFrEA/jAew3FCea43VeOV5FVznOaRo/lQoEOhfx7
 qcjKWVeI7bKI5fbPPSlYjLDhypXBw3qptTPU4AuAB0nhymN2NiS9WlsE7jZqkN6In4uX
 UVohA4jswnEmQhv983uejcydMdMl5vcu7aNsQuLPdjqH0OZttOsQqyXr1LSqbxzxPqGp
 uVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pVig2XpcIi1wUU1dzHSjXjcQnTVD/QNrePxBnDzBNIU=;
 b=SVS2+H3YBBlouRv755MuepQ5T0LcBQf2HIGnos9DATVc93pE6zgrYRmJglAQ2r3jcH
 ueuGqnbLidHcrVwVPgA2QbwLsJzm7L1hr4+rF6XMGXaLu3xYzvamkA73XcqWnDjMTeZN
 BS8OA/IcsXyvvIYxSZ9yHsvbF96ctUCWYSueVjI7KM8OpDx8exTT96sb2PTPxnslHh0J
 uERpdYU3rp5dnLyxtl+J572r2+hQses23HSUwbuwveME5GnNaNoMjMqyNLd3uaURV15Y
 vQXA6P+ChhjdTm86u+Zh/vnJ7tiOGGOVlf+glyRC9e2tKyg3bPaeA7R2SdIIuQ1ab+L1
 TJgQ==
X-Gm-Message-State: AGi0PubAETVBSYV//qr3oJiKeam++VNzNTmayV8X7ZmoUc6WZhFBElyW
 MtjY2mrdflLOu6NUY2uhWt0=
X-Google-Smtp-Source: APiQypIhxIyWT/S7Fta9RYW+bfGXh8dePj+daAJW5u9iCbAWiAyKA7IzL+Sv5RBbG8KNBVL8jv4zkg==
X-Received: by 2002:a05:6512:108a:: with SMTP id
 j10mr5470969lfg.38.1587229640823; 
 Sat, 18 Apr 2020 10:07:20 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id e15sm8768909ljb.25.2020.04.18.10.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 10:07:20 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v5 3/6] drm/tegra: output: Don't leak OF node on error
Date: Sat, 18 Apr 2020 20:07:00 +0300
Message-Id: <20200418170703.1583-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200418170703.1583-1-digetx@gmail.com>
References: <20200418170703.1583-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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
