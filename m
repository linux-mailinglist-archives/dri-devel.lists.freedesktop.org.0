Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE969526F2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 02:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7279210E34E;
	Thu, 15 Aug 2024 00:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="A0XM+13i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F5E10E34E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 00:34:25 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-2689f749649so124168fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 17:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723682065; x=1724286865;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d8LFD02UwCQn/9JJcB/9igBsgy8I8NKOocEuza3szqI=;
 b=A0XM+13ieVfbqOfbNQKkKQpgqnXyGUKQc8SXAWRFAm5XeDohs/o+AVPgUAPnL+t0T7
 En31c0uV89BhaMtelpO/uX6mdl1xWYlsf51vIN1bo4gqVvPO2dheXQa9HvlsPtEP+suQ
 m8MzZWpLbp1Mx1n3QjJFYe+mAMTO8d9SyPWzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723682065; x=1724286865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d8LFD02UwCQn/9JJcB/9igBsgy8I8NKOocEuza3szqI=;
 b=G0at9lEGuhUx4PgF5QGweKZASY2WI9LmE8wqbpnXoG9ajxzNQPKo95UgBQ7Z7vDCXA
 CiFPjs+LueJ/RVXaFpBcN67ZYC3BNOyjyddotj6SRAWyxhoF3RiEbgZE8IERcE3vA8IP
 LUv6ZmVKZE329ursMOzCXT2DLyBr2siUUMgOXXF4taA0RbivaDoX8F5cS1pPdppcFdQT
 6nG54VCxHxYkWuhxajb1qC8vfcpaXeVjEiZyu5WQjApgxdMpz/xas3K3u89eC4IkpWUX
 SJh09xlvegBzBcEVZu5+Z/9ad8sBhu8miDr2+QjfJCLDuSAko/3UXa4dbzktj5wKQpjo
 Xm6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8JknzSuGnJSF9cvB/zx4TfVHlTo4LIeE4VqupS/M7kcAfhmJjsrgjzt767+mU+EIyWGI9kKnAVTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMCIelrVhwlBtGMVfEPMjD2ZEf1PA3B19/yyyrzyIZ9pn5KObq
 C4yYD+/8zYsAyQFoR5nt5IqXb/alBUob4j5MnJVrkZVo9AlwfEjLF21bwOsT8Q==
X-Google-Smtp-Source: AGHT+IHQ7gSlptFP9Id6oIfb1DYj5dhoaDHNDxGZJ/4xjnv8noXdgyY+U3CVRT3wmtzXjxj/nEvUrg==
X-Received: by 2002:a05:6870:89a4:b0:260:f5c6:e9ec with SMTP id
 586e51a60fabf-26fe5a70546mr5180121fac.17.1723682065111; 
 Wed, 14 Aug 2024 17:34:25 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7127af3fae8sm151797b3a.208.2024.08.14.17.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 17:34:24 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 02/11] drm/bridge: Verify lane assignment is going to work
 during atomic_check
Date: Wed, 14 Aug 2024 17:34:07 -0700
Message-ID: <20240815003417.1175506-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
In-Reply-To: <20240815003417.1175506-1-swboyd@chromium.org>
References: <20240815003417.1175506-1-swboyd@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Verify during drm_atomic_bridge_check() that the lane assignment set in
a bridge's atomic_check() callback is going to be satisfied by the
previous bridge. If the next bridge is requiring something besides the
default 1:1 lane assignment on its input then there must be an output
lane assignment on the previous bridge's output. Otherwise the next
bridge won't get the lanes assigned that it needs.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: <dri-devel@lists.freedesktop.org>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/drm_bridge.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index bd18c1e91dee..68c7a321b9b3 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -860,6 +860,10 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
 				   struct drm_crtc_state *crtc_state,
 				   struct drm_connector_state *conn_state)
 {
+	u8 num_input_lanes, num_output_lanes = 0;
+	const struct drm_lane_cfg *input_lanes;
+	int i;
+
 	if (bridge->funcs->atomic_check) {
 		struct drm_bridge_state *bridge_state;
 		int ret;
@@ -873,12 +877,24 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
 						  crtc_state, conn_state);
 		if (ret)
 			return ret;
+		num_output_lanes = bridge_state->output_bus_cfg.num_lanes;
 	} else if (bridge->funcs->mode_fixup) {
 		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
 					       &crtc_state->adjusted_mode))
 			return -EINVAL;
 	}
 
+	input_lanes = drm_bridge_next_bridge_lane_cfg(bridge,
+						      crtc_state->state,
+						      &num_input_lanes);
+	/*
+	 * Ensure this bridge is aware that the next bridge wants to
+	 * reassign lanes.
+	 */
+	for (i = 0; i < num_input_lanes; i++)
+		if (i != input_lanes[i].logical && !num_output_lanes)
+			return -ENOTSUPP;
+
 	return 0;
 }
 
-- 
https://chromeos.dev

