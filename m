Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3585F1AEB48
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1436EC85;
	Sat, 18 Apr 2020 09:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90656E124
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 17:54:50 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k21so2958456ljh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 10:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pVig2XpcIi1wUU1dzHSjXjcQnTVD/QNrePxBnDzBNIU=;
 b=DPUU6a0iy8DAotclL1Bt81ah0Or3GtD0+dChp+lHlSXmGB8kysZ6r9FbOXAJpnTGWV
 1MJBh+CPPbv10t1SEDUcTT1dZaeEibqoZgtykLH9W+Uj8yPQDAuaqb2ks8quw98r3nrg
 XU796S36wcrw+VUSyNhtpqbCsWd+DkxdlLGD3gurgw46GR9jNln95Ek0MNYGpPIJXrkU
 DzrhGmnDmtA8v+/EXeTwIojY/zLzTyYqP4Qw+/G35DCjughaQYJd6KeektIKllo+IJ+E
 8/OXrhyEWqKiS0PyW+66aeFi3T1TxA5NkXsncM81a31F9bsttj8BLMOlbxMdE/+Banbf
 GINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pVig2XpcIi1wUU1dzHSjXjcQnTVD/QNrePxBnDzBNIU=;
 b=jgLqHhRYHvyfc1n2rXQRqC6cpdjlTJtNotIL5OfHC1U/64oKRgvQc/yEGXXpexvru9
 kNkKp5h9ICkYPegosO9HtEVWVQQ87PG5b5Zv0vGiMRH5RC8NFuEzUY2UVTxiJdV2XSOj
 fParY9fFS+61LQFzfkObuk4aLzFtBDMLK4sutCgSIYRtpfp0x0ItyqJOPbGxSNSrp4F6
 65XGnzuojgaYlyksArmH9ryFrF+4n3DIWabTIHaVHUnZxItOZO2V49em8LtknRPRrNXE
 rF5yPbP/48LUuq6ntjYUPbdi45opoPwpR7yvqIS5Ea+N6hIFjHfnrZuqfJjN3jUersyu
 +L9Q==
X-Gm-Message-State: AGi0PuZm87GHX3bGxOlUMOE6MRfd0ACzPEpKHhKUkmLlRW3KZxcFG6Xe
 +q7+8tqS8kr1oc+Vp6pdk/s=
X-Google-Smtp-Source: APiQypILZrkqG5hAVUaDseO32nMzi3/C2Q7vP4vjEu67S83PDI8GaNjtl9ZwQ/N5SYtCxQUfGILT3w==
X-Received: by 2002:a2e:6c05:: with SMTP id h5mr2810388ljc.217.1587146089229; 
 Fri, 17 Apr 2020 10:54:49 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id j15sm7204358lja.71.2020.04.17.10.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 10:54:48 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 1/3] drm/tegra: output: Don't leak OF node on error
Date: Fri, 17 Apr 2020 20:52:36 +0300
Message-Id: <20200417175238.27154-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200417175238.27154-1-digetx@gmail.com>
References: <20200417175238.27154-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
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
