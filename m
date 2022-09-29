Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA8C5EEAF1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 03:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D3710E892;
	Thu, 29 Sep 2022 01:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5053110E892
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 01:29:22 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d11so13162502pll.8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 18:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paradetech-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=SM4jqQ6Il3GWV92a+UhDIXmom3xi+6T+8WqpFvA2YOI=;
 b=BxwFbi7sJXlRrhgH0WVMvi9wNAqdJvg8wsDNaPA1Y2P8J7Odr3QtDlVrPzYeSs/Sb7
 1SgoHrKtmewvv3/gCkL/k1lnuzNEgwIlxckRL/6YALlI758+YcuPXOtHDPVoupvBYhc2
 o8lexPw9R3nHrQYXcgNdZWvqt1+bYPoXUESBJaAqQoaSoHquHNXmn1/MxhqyjpriQc4Z
 EC2KupWYG30Gq6mHk8aKxGuSqGuAjWTlJJlYQgIsIy/c6P/oCG5AEeot3ttBv0mApLKr
 XnsqIcn6FOoY11lCVT4KYgMj/o9WvGaAmMU7MzQWYPJbSwcCSXll4/ZW15hbmApdHD7p
 vUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=SM4jqQ6Il3GWV92a+UhDIXmom3xi+6T+8WqpFvA2YOI=;
 b=bCwb59v1jmrM4kGGfIAS9s0iDeZLW/3BWNgMt4gpWyQFY5rGxnjQTEIQH3Hlyt4M2V
 I889mXqjL8jOOYR3kKDkT1yHzabKTUCcv7/SO+z6C6luWeIRIv3gq5Qs9G7T1mGdKWWN
 olWZqD1wgh9FqIT+QIWTPTvQc3uCseAgnutWQuQ7G7rOEBYo6KF7X+rN3S6n2/gbKsIx
 ugxpgnE6UkFVYMtFrj6zMlaul8KHRd53Gw8AHSVIivCmjyKj9K/FmapDrzYNKDT9tX0r
 xpj5wS+2fxVqzC8uuPUQB0uLaPWDbkK/3ga02m5SmFyTA6FnubEeYOJmI0IXyX7Y4MQN
 R41w==
X-Gm-Message-State: ACrzQf03FZWuzem0W5cwrGKg6mR9daZ/1aM0EGIyitqLFHeMnEClGkox
 iOLeSytE8/J70ZkvMqVATh9gXA==
X-Google-Smtp-Source: AMsMyM4/VlvMw8aYyDVMgL6aP4TCJ54nI5FUpLRLPgGUaN5WTsGzu1Zib90d70GDDRWiW7G0kbDSog==
X-Received: by 2002:a17:902:b182:b0:178:8977:4013 with SMTP id
 s2-20020a170902b18200b0017889774013mr790987plr.27.1664414961796; 
 Wed, 28 Sep 2022 18:29:21 -0700 (PDT)
Received: from jason-ThinkPad-L15-Gen-2.. ([203.67.103.146])
 by smtp.gmail.com with ESMTPSA id
 a15-20020aa78e8f000000b00540f3ac5fb8sm4750848pfr.69.2022.09.28.18.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 18:29:21 -0700 (PDT)
From: Jason Yen <jason.yen@paradetech.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: ps8640: Add software to support aux defer
Date: Thu, 29 Sep 2022 09:29:11 +0800
Message-Id: <20220929012911.2521786-1-jason.yen@paradetech.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Jason Yen <jason.yen@paradetech.corp-partner.google.com>,
 treapking@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This chip can not handle aux defer if the host directly program
its aux registers to access edid/dpcd. So we need let software
to handle the aux defer situation.

Signed-off-by: Jason Yen <jason.yen@paradetech.corp-partner.google.com>
---

 drivers/gpu/drm/bridge/parade-ps8640.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 31e88cb39f8a..967dec840b91 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -303,6 +303,14 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
 	case SWAUX_STATUS_ACKM:
 		len = data & SWAUX_M_MASK;
 		break;
+	case SWAUX_STATUS_DEFER:
+	case SWAUX_STATUS_I2C_DEFER:
+		if (is_native_aux)
+			msg->reply |= DP_AUX_NATIVE_REPLY_DEFER;
+		else
+			msg->reply |= DP_AUX_I2C_REPLY_DEFER;
+		len = data & SWAUX_M_MASK;
+		break;
 	case SWAUX_STATUS_INVALID:
 		return -EOPNOTSUPP;
 	case SWAUX_STATUS_TIMEOUT:
-- 
2.34.1

