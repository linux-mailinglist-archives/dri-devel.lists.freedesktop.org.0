Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DB81B01FF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08A86E23B;
	Mon, 20 Apr 2020 06:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2C16ECB6
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 17:07:23 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j14so4389218lfg.9
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 10:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bzHxFhcgWD/fZsCe3fmC7U0LkboW0qpnWF3suCBMKYk=;
 b=T3DnJSRYxNDt1AYmdsFRorYQ4sIbtNy/6+H3c+6NJY7aaU79vwN+SYTDidg4TKuA98
 uo4I5ZY60m++jXGywzj3RODdSlR+iDtP8z2XXjco1sz7bRQyRnlzp5IsvyBTyX0H4rmR
 xehROXC4fNe+sL0U221SX/K7W7RbscCMft2bMFgvZd6TjLh72jCMy4F5TniArQO+IBOO
 D93gu3+bXptqcq0F7L3j6319aoKk78KvxJrkdiGljpKuXescvmutAqEd7WzY5VB2FSBd
 JKf1bU4Erlmlx/BQ/ZDXIY6YIZxrKHT2LSSg1jmE1OQpBIXiC1JC7VJgXMQwBJNA5B9S
 pMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bzHxFhcgWD/fZsCe3fmC7U0LkboW0qpnWF3suCBMKYk=;
 b=kYlbP96ikT+65QAXeBFCWZibdyahnAP8qwiUcHif4p6coIUzk8fKfakiFTOxw+lkDm
 PkB8Ez2q0H+96DVhHLCRIU4qGy24PSC8m91VgJuN9MLau9DwceGzsHsEoxK90NTfXYoV
 uK8ebfJfDsjcN4bLkVfV/SYUykqqzUMsv3mc/rMeRnPGBy2FnfTg888N6NqG+0eRfUxN
 dBA5Pf2zDWg0Y3WUvpz2AojSjSlXIXa3bvVALcQ7e52ZIEsiO1MhWPP8FAlxCMWA6DKv
 qY51/7//cQmR7u6Ula+VaWE0qmLJGei0UGM03BKNC48DBeGyZ7n/VsdFY6A6zlEnKcm0
 Bj3Q==
X-Gm-Message-State: AGi0PuZgZBxq28YGD1tBfqcbWGtt0iloBflr3c37uOOxoTo+edHwunN2
 s2/yQ+c0iAHslFrKan98pzM=
X-Google-Smtp-Source: APiQypJOiKhEF7D0gxeLQ/r3Rd9nuz90wAPm/Ps9vRcN1st7U3WZUnpoxcnAew3oAkwi1D7S5rp4Dw==
X-Received: by 2002:ac2:58ee:: with SMTP id v14mr5017916lfo.25.1587229641823; 
 Sat, 18 Apr 2020 10:07:21 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id e15sm8768909ljb.25.2020.04.18.10.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 10:07:21 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v5 4/6] drm/tegra: output: Support DRM bridges
Date: Sat, 18 Apr 2020 20:07:01 +0300
Message-Id: <20200418170703.1583-5-digetx@gmail.com>
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

Newer Tegra device-trees will specify a video output graph which involves
a bridge. This patch adds initial support for the DRM bridges to the Tegra
DRM output.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 804869799305..cccd368b6752 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -12,6 +12,7 @@
 #include <linux/of_gpio.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
@@ -116,6 +117,7 @@ struct tegra_output {
 	struct device_node *of_node;
 	struct device *dev;
 
+	struct drm_bridge *bridge;
 	struct drm_panel *panel;
 	struct i2c_adapter *ddc;
 	const struct edid *edid;
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index a6a711d54e88..ccd1421f1b24 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -5,6 +5,7 @@
  */
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -99,8 +100,19 @@ int tegra_output_probe(struct tegra_output *output)
 	if (!output->of_node)
 		output->of_node = output->dev->of_node;
 
+	err = drm_of_find_panel_or_bridge(output->of_node, -1, -1,
+					  &output->panel, &output->bridge);
+	if (err && err != -ENODEV)
+		return err;
+
 	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
 	if (panel) {
+		/*
+		 * Don't mix nvidia,panel phandle with the graph in a
+		 * device-tree.
+		 */
+		WARN_ON(output->panel || output->bridge);
+
 		output->panel = of_drm_find_panel(panel);
 		of_node_put(panel);
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
