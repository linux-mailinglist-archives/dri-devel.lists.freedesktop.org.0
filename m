Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F46B6613F7
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 08:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C05B10E1E8;
	Sun,  8 Jan 2023 07:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F7810E15E
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 07:25:59 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id cf42so8343538lfb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 23:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aURTF4UTNK5+9lO/Hwf/8gndFQ6qOIZny88iB+hQmBk=;
 b=JQfLu38OzHhOGOpjHz6hL/thvfykYXwcXA/BrTqoxzOYKQi3haPoFARVyiugkivHoW
 +nOtE7nuFQew3yR5hqX/hW2GUQiK5S/ygrFFov2pP2yY+wetLO9tQ3b5oZ6b7v61n9RC
 AdtTjc6HexAqxkUKEyP1zUiMLQmoHW/ZQz2Z49HO+YHluJXWZrGfBuAeAC25u8CPsPYb
 i/6NItsEnxrr/jz1oL9VvY13JdWUwHHox1bDAE4XYJVh0LJH/LKYI0plp30z4nJBsdIA
 wRFIzn9aD++oJYTU0X7ilw/NAJfgZNYD6GtT+ExJxkfTIoEkg7xjgigpSjh/7O/YIZ9R
 sEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aURTF4UTNK5+9lO/Hwf/8gndFQ6qOIZny88iB+hQmBk=;
 b=ATjPRHRj5IYTMJgSY4qT3yCwEfpG8QjvRqXRoQk1THoZPnoaCFXDFeyUIfum1uO8R+
 iIeavldVZ1UbW6O6kxXkbeovWCnz4fZW4pubYmHawisL8vM1lbBZE/WsGuuWG6Cxq6iS
 LfXMFgIwQZkrztpsnTKVQ94X4aQ3Wv/y0doeEs5ug50VCMXFLvhOcTzB7QgdpIir5hOf
 ZAj+TbNMVQhMXX98CgGcZgfQnGzJgcpIju6LDETcUe9A2S+DxpM+xlbYa/pLSWLmxr4J
 5iSPagJuLgSjX6v/7S8b1iY5wmOtWXgZHDKB+Duhs9bosHQN4MGCO2+JB3eZ8YooHHbi
 hgAQ==
X-Gm-Message-State: AFqh2krcvlMa7xS0lzak6el+X0xh87UiWTnn8KFiTDzRR5fWsfdR4dTG
 3IqOsOyPNCQyDqa6Efv7eVlmVg==
X-Google-Smtp-Source: AMrXdXtD1Ms6QHgJbyzw18g4gB+ZV+fLHCzDMEnc9sUT6uiMFlALRu+tVvuW2pgby722Jc3YGPZyEQ==
X-Received: by 2002:a05:6512:79:b0:4b5:43ef:a555 with SMTP id
 i25-20020a056512007900b004b543efa555mr16669900lfo.69.1673162758085; 
 Sat, 07 Jan 2023 23:25:58 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 23:25:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 02/12] drm/bridge: lt9611: fix HPD reenablement
Date: Sun,  8 Jan 2023 09:25:45 +0200
Message-Id: <20230108072555.2905260-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
References: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
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

The driver will reset the bridge in the atomic_pre_enable(). However
this will also drop the HPD interrupt state. Instead of resetting the
bridge, properly wake it up. This fixes the HPD interrupt delivery after
the disable/enable cycle.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 2714184cc53f..58f39b279217 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -856,12 +856,18 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	static const struct reg_sequence reg_cfg[] = {
+		{ 0x8102, 0x12 },
+		{ 0x8123, 0x40 },
+		{ 0x8130, 0xea },
+		{ 0x8011, 0xfa },
+	};
 
 	if (!lt9611->sleep)
 		return;
 
-	lt9611_reset(lt9611);
-	regmap_write(lt9611->regmap, 0x80ee, 0x01);
+	regmap_multi_reg_write(lt9611->regmap,
+			       reg_cfg, ARRAY_SIZE(reg_cfg));
 
 	lt9611->sleep = false;
 }
-- 
2.39.0

