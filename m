Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9EF2104C1
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78A46E855;
	Wed,  1 Jul 2020 07:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04146E39E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 02:23:57 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n23so25114054ljh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 19:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h/buGMp+Ss9uiUTlhYkjRB/SevbvsV7Suq67TOhl6lM=;
 b=ZcFylXjOLKEs1YEHNYW5SEnwvyP1m2KYyDK40/iSh+wd1xzgRYRzAkZ02SDRdHlvKS
 FgrWvv/f3DqvqBTjLmLMu4Vgb37oufCQuhSiLv7Q8iMnxlMii3z2EN99y3ogpR5LzBEt
 0fn0iX2x4kpfMChJJ1RtTXPIBNkK0+CXoEQIIOnJgB9wcneA3QNTxl5UBz6qmXB4MpD1
 qLT+F+1ONyFbEv9w+pZzH42FrR1hpE8wt08Gr9xjhZWw4kJmx47RfgK8qOhTzI3Usqvf
 EUJDevskWnGxAUq5YBorUMVQzkr7/o32+e8vp7FaZrropV+fV4n2v7q6GABdOBvgbR1r
 CbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h/buGMp+Ss9uiUTlhYkjRB/SevbvsV7Suq67TOhl6lM=;
 b=qzKERRWc4QPfZ7t0TQBCkLKxyFQ1joB3pGfa0rMDGyt3qIhb/VCfnpu3fIL1D5o4Ff
 N4mL5uJ60ipZZ6EmctcZXFGBf8wo8RhPnxzVH2dhbcD1gEhBkWVfMhc5yR0hcesqcvMG
 uWNUEaIXXWdN0U2BnzO/NlUA7XA4ec6GlBJze/tuDUX/00gDLQ5Y4K6f8mah4tH2qP2l
 dEXw+0NDssS3xEoTfgnDoTz03W2k5BHc1r2/0TsrLzAW3oCa/mUrxP1GzxVMwmuv/dC9
 Qck9oGbergi6upqRnZCYHJgZh+rHImQrGZEs7ZTgvYWAbQffGlD1++qTe7zxufKJk2NO
 cUiA==
X-Gm-Message-State: AOAM532ASsdyHifH2ltGP4VWAFBUuJHzy95OQD9WjS/QunZUUDa6T7ZK
 Y646crSMTSROC2co7o6PPhE=
X-Google-Smtp-Source: ABdhPJzLVu+pc8eNoqlmFJWxGvBMY4WUCgYsygKPGHe9uic2XNC86UNcEKaXm3lAtRK2Rl63z8Fk0Q==
X-Received: by 2002:a05:651c:3cf:: with SMTP id
 f15mr9939751ljp.365.1593570236235; 
 Tue, 30 Jun 2020 19:23:56 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id f21sm1303557ljj.121.2020.06.30.19.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 19:23:55 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v9 1/4] drm/tegra: output: Don't leak OF node on error
Date: Wed,  1 Jul 2020 05:21:25 +0300
Message-Id: <20200701022128.12968-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200701022128.12968-1-digetx@gmail.com>
References: <20200701022128.12968-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
