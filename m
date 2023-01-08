Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF6D6616E9
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 17:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DD910E1F3;
	Sun,  8 Jan 2023 16:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CB710E05F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 16:57:00 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bq39so9581895lfb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 08:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bMcMgMN2h9pQ0++woqWQkTwB0DopoRxUXMW3C3/QKYc=;
 b=P9dqkZZfHOIrHOTu0QxjNN5J0k/OqwxrnUDvwRdcdF/erP0JK2wzbixjkCGmcn8AmP
 CxTtz7XvXAHP1NZ2aTtfEhBhTKh4jO/WFzht4gw5vbgTiivyjH5nZYW+XDSykIgoNfC9
 1n6uEb7M/WOgAKBqodZb9Y5Ozwy1Dr6hKuaOkf8FdUNhtHW4lg500zrJYeEpMzKiJgPm
 zyz+vTfWDUIptKZyD9Ps6REXcCzOSau25MqKEBMU8o0saEyA0v5gKpq2dOOVFlUpBdOp
 r9SmnN0By/RWCTOUFjwhQywtH1zgb9Ha3WEUh38MPzN0a/icfRdSpq7S5xfXCvnRdXxg
 ZmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bMcMgMN2h9pQ0++woqWQkTwB0DopoRxUXMW3C3/QKYc=;
 b=lRuEhvxoJbkafkBOqx2zCna07Ts8AyVdk0X0L5YartQi3X4Ds+VYMjnv96kzRC/qvk
 jFr/tUH1urJhRWr54HeOOxGeqL7Y6/U0P7tMdDxWCP114rlBaEC38ORAt/aRB57s7L/Q
 mYmXHgDZnPNtJ/OOHYu5czQHRJwaHFQbWouPwAAF31HPzohcPfTnP8JsbyEUXwXqUMxN
 mUpDBifH5vu5Mb35cFse072LQZlz2WeYK9bldidHLyLiGUAe0n4mYhkG4JO3VLRx9jN4
 nTjLR0GVbZ3pBoQ17sJNlAt+ZIgFwOhJ9avkaMQcT8ZUK8goqOUmufa+D1S0S0vUtmTG
 AdjA==
X-Gm-Message-State: AFqh2kpFKDpjZaZDnZ+MmlP1TdM/e7ryNQFl1Z5EZwpg9+5h3rM6Ay7r
 Nl73CHrvvIBR0ZU/VdrgOe5nfQ==
X-Google-Smtp-Source: AMrXdXsSRYg+KJGElLjXPWCsXo8ii+CcZrDyeAXlnwyYhDZJuGqnEvGXDw/1RjhMYPVSdS2EH1jOmQ==
X-Received: by 2002:a05:6512:3f0c:b0:4b5:2ef3:fd2b with SMTP id
 y12-20020a0565123f0c00b004b52ef3fd2bmr20160912lfa.18.1673197018396; 
 Sun, 08 Jan 2023 08:56:58 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:56:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 01/13] drm/bridge: lt9611: fix sleep mode setup
Date: Sun,  8 Jan 2023 18:56:44 +0200
Message-Id: <20230108165656.136871-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On atomic_post_disable the bridge goes to the low power state. However
the code disables too much of the chip, so the HPD event is not being
detected and delivered to the host. Reduce the power saving in order to
get the HPD event.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 7c0a99173b39..2714184cc53f 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -448,12 +448,11 @@ static void lt9611_sleep_setup(struct lt9611 *lt9611)
 		{ 0x8023, 0x01 },
 		{ 0x8157, 0x03 }, /* set addr pin as output */
 		{ 0x8149, 0x0b },
-		{ 0x8151, 0x30 }, /* disable IRQ */
+
 		{ 0x8102, 0x48 }, /* MIPI Rx power down */
 		{ 0x8123, 0x80 },
 		{ 0x8130, 0x00 },
-		{ 0x8100, 0x01 }, /* bandgap power down */
-		{ 0x8101, 0x00 }, /* system clk power down */
+		{ 0x8011, 0x0a },
 	};
 
 	regmap_multi_reg_write(lt9611->regmap,
-- 
2.39.0

