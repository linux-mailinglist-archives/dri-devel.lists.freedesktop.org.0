Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD1D9A481C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 22:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7862610E980;
	Fri, 18 Oct 2024 20:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tSA+bg5o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6FF10E980
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 20:34:42 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539e5c15fd3so2468036e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 13:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729283680; x=1729888480; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jQVWVw/idsCMZK/QpoLkRhrGm63gf8m8ez6XsTKeLHM=;
 b=tSA+bg5o8LseRthkv5sYgxXNaYLME1ZKNOKgXYj20Hbb1L7994aYZiGao8HiNC/eWF
 +zk6UmP8MECY9IAXvobgZ9pWV/2lqZMBp7sNZHspTN3nNBk4DxsBz21mVB0Dh3/QHQ3e
 vcvxLZdK6c5GcZ8cvnokDdppOEZk9zsLN0AfvhvRC20gu6zgNU17rKEAirxPuJ6Fwpm0
 esqyDaX9+zFGlqmjAam7i+0thWb921hLn1EsMJEeuDzw/uuAwf2X6N+ME492K/CM8cZf
 F+e3z99EWzdy8EZsaIaK5vFsh1S+981dgfWzwguXjg/TZWSqLtugeGmPCc2H5Ce/+0rS
 gEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729283680; x=1729888480;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jQVWVw/idsCMZK/QpoLkRhrGm63gf8m8ez6XsTKeLHM=;
 b=oJf9RP4KQ4gOmJUgky5EYpBXMruG6f3BsGM/YAvTIOX6oTeIrcMEAp8919/Grc2leZ
 XawUPmMHyrJxyk7tPmp2n78zeQ8MvXSPJLRHKbHxvLU6/4Zkkpg4skfBfU2J1n6YHYS5
 bCweXgdBP8N3frTpbKN9d1PjzfVqnk1qDe2TQz0GDKHrWtZSTRiF70WwcsugVR8qpbW0
 YUJzzseWgIrbTiRCprpUcsh04uU+zOHeDAxHIecePd0Dxs6pOPgaTV3mc5CFUmpSRgv7
 Zy9lvMuHmkcbS6QMGBnqYTLRssKiIiOJvVxSOdzfl0GCm7+RMZ+SA3yDsEoesQmAM7/e
 ZRLA==
X-Gm-Message-State: AOJu0Yww/U4R3JyJfw4CvzSSngnht/2waFOY3GW6k7ZcoKApRYIhLrP9
 sl2o7/9+CwoB2HeO1u0/a6e3cMoXnL/H3SO3ouDNMIbAf9dTzyGUCx8AT4zs74U=
X-Google-Smtp-Source: AGHT+IGoSpeJeqVcn2bBpU1CDeVL7TbnH9BzbJ+fJdWG6AlVnAH1yvvW7YML8X25GofhaYelXl/hnA==
X-Received: by 2002:a05:6512:3ba6:b0:539:ea54:8d22 with SMTP id
 2adb3069b0e04-53a15218aafmr2609863e87.18.1729283680110; 
 Fri, 18 Oct 2024 13:34:40 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0e09sm314047e87.146.2024.10.18.13.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 13:34:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Oct 2024 23:34:23 +0300
Subject: [PATCH 5/6] drm/bridge: lontium-lt9611: drop TMDS char rate check
 in mode_valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-hdmi-mode-valid-v1-5-6e49ae4801f7@linaro.org>
References: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
In-Reply-To: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=osIrL7yWr+4pmjn4TVjBTzhg7zx8VCnWZvSiQ2XJamw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEsZX2CRSrVD6zRlV3sf79iOpwhz41ku4gX4qc
 tGYqxdPC/uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLGVwAKCRCLPIo+Aiko
 1RyYB/9E+wiPd2wCJklbxNW0iDngze8b+l1vYstAn14YjudFSUOj7PzR+r+wuO8oBzGp30jLWxr
 2hv3hyWP7IHMsIgLkbUSkoabiCeCcw00YJ8pTNRNA03XEUYNPShaFGKncbTJjclO8N02NDuqbbG
 EVBl6Wn92lNxdYi1TseW2pacNmyCH3D+R8WRBF2OFFYKVx/lcV47U6CAT7vh4Oh9sdmiYQKg9+s
 nK5XOLg0lX2/m1gGOePKId5J4Sz18NrsoOXoEUXbeyUJynFaWCg8HwtmA1ZmeiqbEBu/DF1TVVo
 zuOH+2JIHO9gjlZ3jT4dd918nxB+waOmoaThOushOweRJPOs
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Drop manual check of the TMDS char rate in the mode_valid callback. This
check is now being performed by the core.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 1b31fdebe164..b8ccffdf515a 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -757,7 +757,6 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 						     const struct drm_display_mode *mode)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	unsigned long long rate;
 
 	if (mode->hdisplay > 3840)
 		return MODE_BAD_HVALUE;
@@ -765,8 +764,7 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
 		return MODE_PANEL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, rate);
+	return MODE_OK;
 }
 
 static int lt9611_bridge_atomic_check(struct drm_bridge *bridge,

-- 
2.39.5

