Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A981F1E7D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 19:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D46A6E1B2;
	Mon,  8 Jun 2020 17:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104C06E198
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 17:48:57 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id m2so148141pjv.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 10:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dYz+Xl/FEuDPplFOt9XJcftofUYzSfEPkgENfM7upRY=;
 b=W4Z+8xahUegQR5m34xKJyXKb95xGcM4nDB/HcR8qyKD7HD1yTyy8nTggMScCzWXhRR
 yNF5f0v2m1kwdsvoEs29JXCFlfzARbkRKV2BXVLgFlbq66XhIcfokxUz9LFPg2S+ocH7
 m2bSZxdNaIP6rF27XkOKysscJo47pXXpMITQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dYz+Xl/FEuDPplFOt9XJcftofUYzSfEPkgENfM7upRY=;
 b=bnn9euOGfZ1stPnCjHkuBxbczL3t30SCUrmrIU8CbKvhgArSREmYh/znB/teNpXQy+
 Eoq3El7eAl1qVYNmA5qixwuRRUhXScPwuB9f8Tvh0dQyibdt4tr3bs25eLr4UqVeA6pa
 YnhkuYyktZI9KnRZ0dBlgi+SEnnKtChi4v3eSBOnVnwui9XZswiNT4vSdPDvNrX4nXqV
 Nqs3yOtBsRnEf9G9tZx92vLY93nsgjNrr1RzRdhU+PaXS6Ou6tTbjCQWARL6eTWFQQAI
 fZRcSmk2QtFGej0CtXU12qs4eMeIBezCdFqCgtqGglzE/yRo6dCetAFz1aR8AoCOogsr
 dVOA==
X-Gm-Message-State: AOAM533StS3w3oWP7J1Z2u4fdlYoUVNaNTVGlhe7Ks128+aJq0y+RK1C
 1nMZYaFI41xZYG9uRjnzrpNTZQ==
X-Google-Smtp-Source: ABdhPJzUQ/95idKfShP8Nh5BuMq/OjblF/QTB/uWi6Bvcc8cxblw6O5yxEJRwy2WRXEJxwvbl9d5jw==
X-Received: by 2002:a17:902:c40c:: with SMTP id
 k12mr22052765plk.105.1591638536526; 
 Mon, 08 Jun 2020 10:48:56 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id n7sm162682pjq.22.2020.06.08.10.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 10:48:55 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: a.hajda@samsung.com,
	narmstrong@baylibre.com,
	sam@ravnborg.org
Subject: [PATCH 1/4] drm/bridge: ti-sn65dsi86: Don't compile GPIO bits if not
 CONFIG_OF_GPIO
Date: Mon,  8 Jun 2020 10:48:32 -0700
Message-Id: <20200608104832.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Douglas Anderson <dianders@chromium.org>, kernel test robot <lkp@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, spanda@codeaurora.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 bjorn.andersson@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kernel test robot noted that if "OF" is defined (which is needed
to select DRM_TI_SN65DSI86 at all) but not OF_GPIO that we'd get
compile failures because some of the members that we access in "struct
gpio_chip" are only defined "#if defined(CONFIG_OF_GPIO)".

All the GPIO bits in the driver are all nicely separated out.  We'll
guard them with the same "#if defined" that the header has and add a
little stub function if OF_GPIO is not defined.

Fixes: 27ed2b3f22ed ("drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 2240e9973178..6fa7e10b31af 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -151,8 +151,10 @@ struct ti_sn_bridge {
 	u8				ln_assign;
 	u8				ln_polrs;
 
+#if defined(CONFIG_OF_GPIO)
 	struct gpio_chip		gchip;
 	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
+#endif
 };
 
 static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
@@ -925,6 +927,8 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn_bridge *pdata)
 	return 0;
 }
 
+#if defined(CONFIG_OF_GPIO)
+
 static int tn_sn_bridge_of_xlate(struct gpio_chip *chip,
 				 const struct of_phandle_args *gpiospec,
 				 u32 *flags)
@@ -1092,6 +1096,15 @@ static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
 	return ret;
 }
 
+#else
+
+static inline int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
+{
+	return 0;
+}
+
+#endif
+
 static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
 				     struct device_node *np)
 {
-- 
2.27.0.278.ge193c7cf3a9-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
