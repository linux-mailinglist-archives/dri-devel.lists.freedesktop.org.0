Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55A41F7D9A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 21:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101A86E193;
	Fri, 12 Jun 2020 19:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1496E193
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 19:30:59 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id b7so4489492pju.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 12:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IGMzjkhMjOHffrm0MUbn2WAGnae39l2+rYHo11+y6eM=;
 b=WzECtsn5cH0OoinAmzjjiwAaORsCILg5BjcE2ScC3ercyJwv5IqLLyN+nSVp3brQOl
 KJmIA9SVjkYNpI1ACF38HqARcQKD1PUgmbK1dFdFm1SFZDjT4vfQAVMQoQ9yKTb54ukO
 l8pJ8POvMkV9L7YxvMLwGk1P/1/eR3yj2X9ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IGMzjkhMjOHffrm0MUbn2WAGnae39l2+rYHo11+y6eM=;
 b=nmxFJh+ENDLcFOxa6Hooqys/H9XxUj+4UPLRxMCqMJDsOXzDzVUF4D5y90J2f8SbvP
 ZiAuORNP7j5PYjd48IjlEMAzsBEy06ZHGQ5ZZoSJ4fdjmJnE/RJ1IzpiV3kdto3N1Tc0
 umd84xnEaurctMYtxygqgZ6pJGzlEChmb2bonNvnELcleER25M5S0O9oE7DSN7kPWhU6
 TZX72rJkyhLIcey8QshnXu/Qq7/dzonJ/yQQSKfQcmrE5g+KwQjP5HxTI+1G9AFI5E4D
 cMVBFI8p7r02LlBAXgJoDYxc9Goz/495t1XdgtAm49ZH2dRim89GFocaT4CE2S0SdqTw
 r3Ww==
X-Gm-Message-State: AOAM5308xw97yjzalYXLNrrlPNsR2hylr/xg7e28TWDyRpIcM3jHSLdE
 juEZD8jcibKAFufuc3c3phkMCg==
X-Google-Smtp-Source: ABdhPJxQdLqwY7OobVFFXwfOjXMluaqP9V1tFz7TRtrtpqculJa7afZWCLVRCtERdeCqb/8V9M2KtA==
X-Received: by 2002:a17:90a:6483:: with SMTP id
 h3mr390383pjj.229.1591990258822; 
 Fri, 12 Jun 2020 12:30:58 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id n69sm6966934pjc.25.2020.06.12.12.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 12:30:58 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: a.hajda@samsung.com,
	narmstrong@baylibre.com,
	sam@ravnborg.org
Subject: [PATCH v2 1/4] drm/bridge: ti-sn65dsi86: Don't compile GPIO bits if
 not CONFIG_OF_GPIO
Date: Fri, 12 Jun 2020 12:30:47 -0700
Message-Id: <20200612123003.v2.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
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
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, swboyd@chromium.org
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v2: None

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
2.27.0.290.gba653c62da-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
