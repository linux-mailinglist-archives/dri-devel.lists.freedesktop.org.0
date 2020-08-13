Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB312245D0A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5734B6E453;
	Mon, 17 Aug 2020 07:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F53D6E264
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 22:07:07 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id t23so7898179ljc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 15:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UhpftvxhrGW/I5vMTkvaan80pR3Bf4Ukt8/Qr1N367o=;
 b=U4El73tuzw8u2iTw2U3rFgaS36+EbTzTxzil61hPtSoIHRP/nGy/sYT4669apwUZ56
 1fLO1E+40xwQUYiilDfsE+6LFATlD28+Pv5r7petk4yla8wj1M+zx2l4gxnC07Melcb2
 xY2TjnzvlzzHuNT8+t97d/f+tE9aXsW4vuM8jisUNzcp2cfeq4PFosOS7g9OUeSF78hp
 b3trwaz9jl/zDRDaGRfliXTUFTjDhrnkUttmhFc9AOxVP1Utl/wfPrAgZY64xyKorDe1
 EZ1U+ti6KcGW072dmi+99zAiCq9MlJw7FEtE3P2B21pJGsUF26w3JwVu4DbXoO6lJ9U2
 OloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UhpftvxhrGW/I5vMTkvaan80pR3Bf4Ukt8/Qr1N367o=;
 b=gvqnaVEq+gzpkhwce6946/3zvH6811bn0bWifLQjb7ZCodU+icpJ35zi32EvWPZ6XK
 KQTEqJMRmQ9o65xiNNYhR3X2x65IjCeSBDhNuTiolCO4FMbH+88Q1Ng5tHjJ2quvycRF
 d/shqOi+BqmN3V9+3woEyVdLvEM/kX8wP1doQ6JLB2FpBw0D5c86RuJCoGy5P4wAvZ8e
 wNwN+3wLjRJog4IYRSeq/jAH+LBuQSoGl0g4p3YGeEHZTPjTv/jrdAE796h9N1oYUD5Q
 Lw9FF0KQ++EapM4GRitFbV0Nnvl/zHXU+qz3HGxnDEcusxV72WGKF6sgFarPuTCTxiH7
 Ud/w==
X-Gm-Message-State: AOAM531mQObHKNM5Q2LP9x7sT+CPAfvltEI4PCn6IUBHe86O6WaXvBEc
 cl3F9VQPJxVzTbzkWH9uhJo=
X-Google-Smtp-Source: ABdhPJxdE8SJN6Fl3O8SlSPSFn7L3H7MJoggtpc0XWT3dFeJWVU0/K7OehXS6p0pQlnWdtOB/5iZUQ==
X-Received: by 2002:a2e:b61c:: with SMTP id r28mr2741025ljn.23.1597356425541; 
 Thu, 13 Aug 2020 15:07:05 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id z20sm1354452ljk.97.2020.08.13.15.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 15:07:04 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH RESEND v10 1/4] drm/tegra: output: Don't leak OF node on error
Date: Fri, 14 Aug 2020 01:06:53 +0300
Message-Id: <20200813220656.30838-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813220656.30838-1-digetx@gmail.com>
References: <20200813220656.30838-1-digetx@gmail.com>
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
