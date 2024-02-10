Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6828502F1
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 08:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C849511239E;
	Sat, 10 Feb 2024 07:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Edcgma+g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B45D11239C
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 07:09:50 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6e096229192so1082427b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 23:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1707548990; x=1708153790;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lH45L1cL1xUVSD3papAAYvPuLoLqwTUuYKVsS6HzrjY=;
 b=Edcgma+gOV0SZ2tf8/tlPp/uRQ8xJZ3hGDNWQHqUJe3pJQIsEw+3a56TYijh7O0Zlw
 tSH1Nmnzdm+MczsyTkjhNP00rsSPOGT8YtMLeTwR/KrxSV7j1KehLoaTSuVgOej+mGxK
 bv8VMtlVMjLuFjKEPPKdfqavKnvVJyGg/ee38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707548990; x=1708153790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lH45L1cL1xUVSD3papAAYvPuLoLqwTUuYKVsS6HzrjY=;
 b=KKqaVg14AFpkBVY53+aAEyPKv/dPJPRfKizudE8V8Sasez4QgwkMBBl1dViSDSkZIG
 foqydMU9PI0d5qRWhYXNR10MN9U7Rrdfs/ENCxDxBU4++RYT7SiP+FUQVhn5G+RUjGz2
 AfOrprlGZN4gw+fAtskdf4YAXmakhKFcBMXUhnEq2T6/hQZJ4/eYVzlOYKlr4OZfNCQB
 AAxcok5pbuLPUupPn2aXwAyukmtkmx3n99wo4NkvMkP7oWxvN3sy9aQtN57cbqSz9wx+
 8e5tQobuErI6EbgBQSTxRQmjxgZEDyIcbtH5ghoLHn3OrDrs0n88/1KcUq2fagKEKynk
 EfOA==
X-Gm-Message-State: AOJu0YyKhgmQI1VkAmH/FWbqBDqdYk4ow/zej+k633VMGMWu9+/4Cdoe
 X2NkQ+X7M+s3IqKDeUtp+sw5f+sjhgFGFJ+b45kPUO9gCeFIk7hSW5Kys0onZQ==
X-Google-Smtp-Source: AGHT+IF0OfRh9qwjMJ8nkTI/1ytBpIHZQTbHm7hF9TOgR4QlJF/faR+Z7kP8TgEPZBH4Qz9yiy4X3Q==
X-Received: by 2002:a05:6a20:ce4e:b0:19c:9c1d:6090 with SMTP id
 id14-20020a056a20ce4e00b0019c9c1d6090mr1772103pzb.6.1707548990096; 
 Fri, 09 Feb 2024 23:09:50 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUaHaP7nLmXfSvHc7FAhO6xSnWm2pSdndktsvLRg9SOw9ntG09kMLqAGaWWETpHm/KUgqubzPqjL/Ug1m0wuCZQFQAfipUOOv/4ObeMpoa78rcvpWY7qWqMiI3J1J6K1xJDQqGMqUsjqGR5VKNNvb3UrIvQBvWZqScgSEjo2EFLs3jxE1+yNe5/Y0KFvJBDYOEyaxeLPqm7s8HXa9VuXNj1qJTnM6eKE0RP2o9DDWTZd1MylApc/eKY4r6gqdiBX+NyrBUBvfhwFmrDdVPkY/3RYmmM2COXuk+/+uYKVghN/SKHdYPzOhxv/ClNxcF2rNhndqchWKLLIooMMmxKC7HWTUASBqF2lCMlyc2A2J9PyQy1ZqXFPMzSfTshHaSJOQlr1QLH/Pxuoi0lfeegRyzss9b11hyOGQ3KsNNKAyhnzm4mC0tG8dMYkbedAhCPyV1eLkbqY3poeMOCQxPZsgbYCSYKiIHLUKI9FGYcD8WO4bj7Ap7cACyM7ndWBIzqVFbmJFIsj8ezXhgP2hTaQkO/AtmkTQixy4QQrYUM17+2lS+zVJVCTqJZMqz1jgM2zSNv7FSXGcFMC8kL0ov5mHp+fvCqwCZaZDhD7Pbe5OdfbB5NQIeIHZ5M1bpOEHVYYn4Uo1fRX9PgIvBF+V34KXDJtkmpWbFmFNJVWAz9
Received: from localhost (175.199.125.34.bc.googleusercontent.com.
 [34.125.199.175]) by smtp.gmail.com with UTF8SMTPSA id
 se14-20020a17090b518e00b00296d3598f9asm2910769pjb.35.2024.02.09.23.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 23:09:49 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH 06/22] drm/bridge: Verify lane assignment is going to work
 during atomic_check
Date: Fri,  9 Feb 2024 23:09:17 -0800
Message-ID: <20240210070934.2549994-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240210070934.2549994-1-swboyd@chromium.org>
References: <20240210070934.2549994-1-swboyd@chromium.org>
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
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/drm_bridge.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 3fce0d8d7dcb..5097e7c65ddf 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -881,6 +881,10 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
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
@@ -894,12 +898,24 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
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

