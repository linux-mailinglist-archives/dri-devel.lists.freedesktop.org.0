Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE8D128E30
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2019 14:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838DF6E530;
	Sun, 22 Dec 2019 13:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEAD6E530
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 13:29:50 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id u63so5039681pjb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 05:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZXOcwXSpTDZpb+/TcTbfTiplV6hYObjzRW1vf2xFZRA=;
 b=I3PQ33U14EAolLLj8jlrmUJ/O9DIkC6SXNrRVAoW9isHRRLbh0z685MsUAAtjr60en
 UzggneMmXWh6Sdorq0YMf2qD+5Zi4RnYC350HCHCRJPy4evKsI1sZcsdE2rXY2dTYvT7
 1PQ9gScLj5oAiJ/wwt8CJTwOu416Ss5/Im9YE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXOcwXSpTDZpb+/TcTbfTiplV6hYObjzRW1vf2xFZRA=;
 b=rwG9A/YBDhqv8lyEK89tbRJNFRrDjqf6+p+Tt+Ge2qz/i9jnzpQJno22AZkrbSxHwB
 vJPUhAiCVVurRCDMVQrub1vv2GmV9nSecr7rGMTLOcLU0UERhazEVrNi9BjIE8FILoJj
 fi7dV7L1y7ezV7ldlsuIzDo3Fy3va6qeCHzUQYEMQO0iAocb6OqQUcYEY7/5EyGvK7iy
 LgGn2LrDWMhpoHZCZwuY3J/mKeAbVRK6ov4w1jnYJ1Rv04rm1Twyu5TbKSxjLXwmPIVK
 1Ba/PyFYiwHMrIGrVX0w7EjYhaC6u2k7iOyD/4o0TyN51AK21zuPeXLJUOLO1Je/Tszo
 +dgw==
X-Gm-Message-State: APjAAAUT2DfMheb8NG1Wc2gwGifxvvPFcpW1ity8Qqo+BWF9RkA35tCT
 Bw30T613aQMMwy7eLLXjiSr4nw==
X-Google-Smtp-Source: APXvYqyIL1psXc/olK/QSRgQqBxtxjvsmTJrG5PZsaaCso/VKkCbYbl+cm8ubF+spBhD1JmKttrayw==
X-Received: by 2002:a17:902:48:: with SMTP id
 66mr25655198pla.182.1577021390160; 
 Sun, 22 Dec 2019 05:29:50 -0800 (PST)
Received: from localhost.localdomain ([49.206.202.16])
 by smtp.gmail.com with ESMTPSA id o2sm12073058pjo.26.2019.12.22.05.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2019 05:29:49 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v14 5/7] drm/sun4i: dsi: Add Allwinner A64 MIPI DSI support
Date: Sun, 22 Dec 2019 18:52:27 +0530
Message-Id: <20191222132229.30276-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191222132229.30276-1-jagan@amarulasolutions.com>
References: <20191222132229.30276-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MIPI DSI controller in Allwinner A64 is similar to A33.

But unlike A33, A64 doesn't have DSI_SCLK gating so add compatible
for Allwinner A64 with uninitialized has_mod_clk driver.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
Changes for v14:
- none

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 2577b237d06a..4a024951aa11 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1256,6 +1256,7 @@ static const struct dev_pm_ops sun6i_dsi_pm_ops = {
 
 static const struct of_device_id sun6i_dsi_of_table[] = {
 	{ .compatible = "allwinner,sun6i-a31-mipi-dsi" },
+	{ .compatible = "allwinner,sun50i-a64-mipi-dsi" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dsi_of_table);
-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
