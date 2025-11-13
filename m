Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857E0C59C0C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 20:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059AA10E1F5;
	Thu, 13 Nov 2025 19:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d3diS56N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7114110E1F5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 19:32:10 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-7c7060a2a53so342163a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 11:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763062329; x=1763667129; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ojyXh9J+hBwCNMVLciyvICBaCTIpiiyWT0C0jl060F0=;
 b=d3diS56Nao20prqdWyI/Nrh07L8cGVvTzC8SOFuA3/aUt1QPOlcmQorPObszaBCeDH
 Qa1OX6PCePVSCORk1BlDLTLOmJoLXWlJR3vmYdGA1nrM5wzjFf3NRPH8CMUhH+58MZ8P
 CpE7ZVf+XBVqqb10Y1+MFLA47/5NRhouG3ZHyIHvtMYyJxIZYr6EiSoQsWj9jD6rgcZA
 8ety6oWZqmG5mzZR1MN2IxNaqk0b5m/4Ow36Z4WxcTn06qTsbiZ0E5DPJR/EpM5y5J5z
 Y2xYJdVFih8IE/bIMXSNCC7Ag9Rp/f5hD9euHRR+JUoe7m2rVNudbrdBPjsveWC/JBmj
 dsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763062330; x=1763667130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ojyXh9J+hBwCNMVLciyvICBaCTIpiiyWT0C0jl060F0=;
 b=oLGqpLGB+i7FbvqDrM8rb1fC3Q6+0i6pqIgI/OpYfVsbxiAlXLEOjwKD5aNtcnOJUc
 cEv9OVjBKoSWTGQ9CmXh3vTbzY6P/zs2DlMyIxI9v+3j8FGFKdUyu4IHwHxf+CCE8HAq
 sbbIz55n1/M+zVL3huBElKFenqxjFBoa4+gmRDR+A9NRSiLKcE8VWPWu2X1ENPyWgCWi
 OYEhfP8yoW//6zw9aFbs+gH61Pzz9CAC6UNMnewf+digPtnZifrZiqeM9DBjuVgyX58w
 hg6BXJOgNMXQDkcI2TQWW4c6ndPrttW+vDKBLeEgHMSNOWs6xm7/THjxeogeY45dMBrx
 iIxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnAq0YooCkTsDwALv7wt2eBK1H7KZDK6jWTzZUkjv1yDER1EAlqn2gmi6g+y3O1aE8gJkPEKwjIvQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqnFZoZgsoGWMzpW3/62Z14RvZvNPI9uSsBGyJSQSNDOcFak/N
 IsYFK2AWDRlfPrOHAuKgrTbJFBOebMIUwr1da8nBv7Lz1nZ3wOAtq19p
X-Gm-Gg: ASbGncvFoBZFFscrIk08UdkOb8srMjfGotl88qmG80mEBbMJXQ3wvlamH2AgUIVfqrq
 kMpGOBi5AdKrjuZXTygGuMSE7laazfCtBbS3Oc2/ojWMRha/E/PvQ8tTTvDfuWg9/Duren3V3q9
 47gVJPkaULxs+j+8hJcoILnnDMNjoZq54kGXq9aOZARVpKH2YqImPxiVKCxc8zwkwTkLa6+xCaN
 1pQDXZ1Buyo36saKtSfUHWq3XuRZydZ/sshFxVQP+sE75Y4VkQU/Zg+wCn9lxciIeNEm0a8NIAt
 qEPWHRxeqyaVUYrsy1E0x0mkyJqybr4flm0/HJC3vl7GDNhHcjfDVl6URjXIXSbK7JiC+b0k3tR
 8Meqa+E+LuPUXjRapUNzCaOTJNzeITBDUH3AnLv82/SZCembdXrSHTLC1zJIXxen6KfUKD5nJ0Y
 K+6XIReV1S
X-Google-Smtp-Source: AGHT+IFxeDPnr+c8wuNGsY9u69U5OD00ERq1Zo4Tm+ccQl+K/E1e0bde7KqzTrSFky5MSRTost79jQ==
X-Received: by 2002:a05:6830:348e:b0:745:9272:4a39 with SMTP id
 46e09a7af769-7c7445506c0mr510040a34.25.1763062329639; 
 Thu, 13 Nov 2025 11:32:09 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7c73a392fa5sm1693527a34.19.2025.11.13.11.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 11:32:08 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mripard@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, rfoss@kernel.org,
 tzimmermann@suse.de, jonas@kwiboo.se, neil.armstrong@linaro.org,
 heiko@sntech.de, sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 Laurent.pinchart@ideasonboard.com,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: display: rockchip: Add no-hpd for
 dw-hdmi-qp controller
Date: Thu, 13 Nov 2025 13:29:37 -0600
Message-ID: <20251113192939.30031-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113192939.30031-1-macroalpha82@gmail.com>
References: <20251113192939.30031-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add an attribute of "no-hpd" for the Rockchip dw-hdmi-qp controller.
This is used to describe implementations where the HPD pin is not
connected or used for other purposes, such as in the RK3588S based
Gameforce Ace which repurposed the GPIO for an additional face
button.

The "no-hpd" option was chosen to be consistent with other devices
which already define this parameter for broken or missing hpd
functionality.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
index 96b4b088eebe..07342838cd52 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
@@ -69,6 +69,12 @@ properties:
       - const: main
       - const: hpd
 
+  no-hpd:
+    type: boolean
+    description:
+      The HPD pin is not present or used for another purpose, and the EDID
+      must be polled instead to determine if a device is attached.
+
   phys:
     maxItems: 1
     description: The HDMI/eDP PHY
-- 
2.43.0

