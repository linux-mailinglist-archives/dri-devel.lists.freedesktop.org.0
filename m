Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E538484879C
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 17:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0F210EC10;
	Sat,  3 Feb 2024 16:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UE3OpuGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0A910EA64
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 16:54:37 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-363c28eb463so819285ab.3
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 08:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706979276; x=1707584076; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vyFysKI+ulqGIrIVYWeP6alGWB5geZ7uKPOowV05Tlo=;
 b=UE3OpuGNXFnXLyTkK2QbQ22Aop9a+tqANfHKIdBg1MwLPDO56Oje29Jtnu0/S6r7rA
 KYz4WWlybx49KgQ6+w/Erop6XTmiLSolTUSR/cwVQaIoqcVjkq20W5uAxtBdH3OhTent
 70V9e+wGlQC5vobEOB8HbF7VFGyK12+Imj9BEIS+DAALYr/6sPbG3H5S2eXGUYjvyNuF
 uJG51o9rL9ZRGMIauxEi0Wwudw23O1LyxOyvPsFDAj7AsiLRZeKX8OehThuQT2tFDc9W
 m4oV0YdkeiVPzTsL6VbjLM/Iu6CTb/OAtlRL3p7CD9zcFffV/emjnGLjH8t2rX/gQBbT
 u2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706979276; x=1707584076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vyFysKI+ulqGIrIVYWeP6alGWB5geZ7uKPOowV05Tlo=;
 b=k2KIwANj6MklQFpSZbAPvkZVyi+ZQppjZ0+eyB7GQv0jp1q361VTJQ5WZNsR3MQyu4
 zAbjA4fsndWECX7Ez9JaNFS179dr7ilU4GiEpyzXmmuzLUv7w6Kjk2So/nkVGUXCeJs8
 5x4LgqdQSAxnwsvqEg+/PS7JrB9AsnVqa5UZmdj0HxqditO6fJFBLEAeqNId5+se3R44
 w/YdskYti1dZVSQA1kEeVnVzdvUns6KC50BwEjN6I0EDFk702Hh5swDBEkIaZOCH6U9h
 ytZ6DDT6SsdFNI9/G/s0tz7/dtxt5f4QcJ4ppRZ6wb4+inVGHj+KbhuAID70ALaGp/PD
 PDjA==
X-Gm-Message-State: AOJu0Yzlhxoo2pEUoS7ei3EKlsP2GhhSzRFwFj3j00AcKeRqW6jOdl8Z
 BKXvx0DEfcRM6LnDnWY5netee9MinhhsBKAglVNe+KLeAIYqPU0G
X-Google-Smtp-Source: AGHT+IF1aACYQI7zwb4q5hLiUZpptfXorBFS4iS5gGCHnkIEhvZqaIY+gUX6CxiigB4ll3DqgkpL/w==
X-Received: by 2002:a05:6e02:1d01:b0:363:ac17:f529 with SMTP id
 i1-20020a056e021d0100b00363ac17f529mr8191065ila.9.1706979276564; 
 Sat, 03 Feb 2024 08:54:36 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVljTFGqHUSDda9IQphGIjLtMyFUmJsD5/fnOAFZYp2KpiC41NPfYVmEJNncZEAjdeLOrMUzdpOV5TbIlRuJLdiUGYnrmJbe41q13QCeCPiB4j+CHYs8WDll/NAuhl3pkt3eXzSWivXd/aXcCDCFBeeLXBvU9kyEhEqZZ/eUrewxxe2CwctMrTQYkJRL0xNw2AK3RX4xAeRXReeeWiCLNTAonyxyEAH4iiwBktEmXvbCu6eh58loDAY78XJsgrBp0gxfxxSB3KpbxvbznhG6ugQy0RHkFGg8ADrXOhxL7TPQBSRu2IqAyPopNRGXlwlzsOwD0Hg4RD8Ln2fjUD7uNk368Z1ZtaOuXnh/Z/g/W1hEnPiFUzLtP57Hl+G68yJ9OmYP5X0GGiMfmxdXJ3aa6YX+YTrhkgbUnjIPe4tBXyaNp2UN+qUZi8bGhE9ah9VRB6zKxAdunomFwGVngvOAwa5B9Dx2PILpUY0bfyN/ir6lzJCrsuyXO1o8F5T9S1cfriObbMiEPNHZa0qZ2okO/1w9JJj2sJ2sim4jLAsTOFDq+e/qxSfM9C6RI0bJImP57JqQg1G7O2wzDofYy+mf0ZuTCNYTHnAOIbqeAqvy896QqFaulKzd9yWq8IR99RiUFkRL0gJHob+80GOrvW5AJiQWS62k5Mtbh3O7ckOQfNveRcTw/E7XU5SouMLkcvsAdO5ePF12rv1Pzj3rLeMcHfyYgaWxiGs0i+IubvfyBABcO6xRt7LEHpYJijivKUpwW7juAGu939vJs0Fr/ebqBENphxakW6KwZYGtPja8EAxdRr9fVlrzgckTLX/szX2NxeyohtcmqIoPvt2vp1ld/eL258lQbGt3DiDGzr5ALeTbchKxeNt8vqIXl2zrSO9E6OcB+md7JB40W5GI9ByeKZI9AiA5d3NXhDNU81E7wOZt8PjCKtoWtF84pbIkA+2cKoD0g
 3XwtNaf3IbP/ifREnAcq+5U3JXWrBWvuZg4Lm5VzSB+3EXvlL8OCnXdfpE5mp2peJ6R+cYt7c7baJLe25xPG0v4H8XAwA/pNVH1YuvC8oPK7Snx4QC/qXMw7M5l1WQN55hX+TVd5z6XkZX6KnyRHUiSMPvb17dSTk7B3F7ldYrcx+JrSkuAmx2OMjXShCBwUA2xbCQGwRrMBEp833JC+DPrJ1ZRzus5Q==
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:d9b2:bb4f:5531:6aa9])
 by smtp.gmail.com with ESMTPSA id
 t30-20020a05663836de00b00470b29b82b1sm1086256jau.154.2024.02.03.08.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 08:54:32 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: marex@denx.de, alexander.stein@ew.tq-group.com,
 frieder.schrempf@kontron.de, Adam Ford <aford173@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Subject: [PATCH V8 12/12] arm64: defconfig: Enable DRM_IMX8MP_DW_HDMI_BRIDGE
 as module
Date: Sat,  3 Feb 2024 10:52:52 -0600
Message-ID: <20240203165307.7806-13-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240203165307.7806-1-aford173@gmail.com>
References: <20240203165307.7806-1-aford173@gmail.com>
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

The i.MX8M Plus has support for an HDMI transmitter.  The
video is genereated by lcdif3, routed to the hdmi parallel
video interface, then fed to a DW HDMI bridge to support
up to 4K video output.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e6cf3e5d63c3..3e33825f0ed7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -880,6 +880,7 @@ CONFIG_DRM_ANALOGIX_ANX7625=m
 CONFIG_DRM_I2C_ADV7511=m
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_DRM_CDNS_MHDP8546=m
+CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=m
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
 CONFIG_DRM_DW_HDMI_CEC=m
 CONFIG_DRM_IMX_DCSS=m
-- 
2.43.0

