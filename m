Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD971F8FB5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4166E2A8;
	Mon, 15 Jun 2020 07:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBDE89E0D
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 17:23:23 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id c17so16383067lji.11
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 10:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h/buGMp+Ss9uiUTlhYkjRB/SevbvsV7Suq67TOhl6lM=;
 b=jX7MFaOw3cExCgSaekXMQiFMv/ykxYaiV4t1aMfdM6ABkfwSen/ZrGgy+12hgi+r7Q
 q+72FwMZe4K1nHuX9cdGrxxAOywfo8z7x4qIC1IpLu8fm4i/7d98M309qR5nj2AD+5FY
 OJNX+EyWKohGRt8WNLBY+ePLkjZD6EGLjYoMwqm24LfowY2b8D5cJIpl7ubwIlhBuL5H
 unENs4NsWiU+Sz7EO0Kn+F6lk94UD7aK7VHGbD8SPepdrJGm16z2biCZYTFZNLASoiAc
 iP4BWAQujyinZ7D6PEBtv6fUC2PuWmSFqcLCTD6vP2aUXv4CUIw2fy+mDQgW5HWzbLHK
 yP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h/buGMp+Ss9uiUTlhYkjRB/SevbvsV7Suq67TOhl6lM=;
 b=ricilcD6uKqhJGglcO2N5AwgO/dfQT0zt3gqZRoq00IUoittMaOEnuz0X++reIuSaS
 Cxpho4b6q3oiukjhR/G+ga87dD2tyDq2eiP4DPAjq5dp47cnRfLsJO3grBSniYPsaBZ0
 2qgrQlb0Qaq2QBMKdKw/hBKCaUMIXTTrUNO7iSYLp/7gQKd6nGGqsaDJGkkqehJ0GUIN
 0wv4CYll27cpAlK3D3juE07Tb/e/+KK2NOuXrgBVwIVXatyJcRxgzxDS81iVv11cFeBq
 EsQilvsT77fuRxlH+PiD3apSTaih5Vy1FZEmht4JDVuWpCZcJdEV1ezB/urpBA4o0Z5j
 tEXw==
X-Gm-Message-State: AOAM532fG3eecZODlD1whmwlJZq/WUobGjPIP81sr7joURJQ/sFzxRNQ
 jXH5MFynmGuKCkAyM2bacV8=
X-Google-Smtp-Source: ABdhPJwSMAH7jtbReoRcuYHV06Fh8WgMrqBhXiLq3LLTXowtYAwZwDpcHXi+//vFWQlT9aXjggdY3Q==
X-Received: by 2002:a2e:b0e3:: with SMTP id h3mr11925153ljl.16.1592155401538; 
 Sun, 14 Jun 2020 10:23:21 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id m14sm55144lfp.18.2020.06.14.10.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 10:23:21 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v7 3/6] drm/tegra: output: Don't leak OF node on error
Date: Sun, 14 Jun 2020 20:22:31 +0300
Message-Id: <20200614172234.8856-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200614172234.8856-1-digetx@gmail.com>
References: <20200614172234.8856-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
