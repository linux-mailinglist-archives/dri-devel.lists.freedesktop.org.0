Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A32C3D077
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 19:11:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D42910E9A0;
	Thu,  6 Nov 2025 18:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EPQv2Owv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE2F10E9A0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 18:11:39 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-3e0f19a38d0so874581fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 10:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762452698; x=1763057498; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T0LfZV6ZvHIu2m+187yq+/hilPWa6I1ikCEzp8Vg+NA=;
 b=EPQv2Owvott6vDp/aLnuM8X+LVr9gRns23Bmb4u25hfexK1zmt2bwEQAOG/CbqombP
 RuLnj4VT5+BgSPMM6eg+n1XE+L8Kvc2F1PW+/ox8RZCrRLhtmU/rylG16Npq7oaaShHz
 vtdJIwRAi0ZkNPdL5W52srHnk95wZcnEgvOLkeRPxGKIxHoyC7rr10QN+EWJAekH4UBE
 OrbStTtgqOam150nYZxC/4dmswFx9MTy9uMy3N7O5N8Mt6DURc7sEkCN7a9qoJIJinlh
 jiw4rg9TWQZvpZr8TKM621ENyDBnh49kgwa1KN1eQwdX6crSwAa5POC4ZcUKkW2q3tyA
 q5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762452698; x=1763057498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T0LfZV6ZvHIu2m+187yq+/hilPWa6I1ikCEzp8Vg+NA=;
 b=YBRLMQIFsS7mB7UX2I0pR5S1IHXujZ2mL6lZTJqUKQ/xfNCXPA/puvQfjhdnzDzur/
 3g4uu8+WHZhqX4LiME30BehQi32YnT3lzXQrUfxSZP23ZENknVdP2rcRYagPmUtVhUjD
 DjvhNbksjv4shZaH4RVdpCsb8XzQPNFzdx56zgbPnB/ayrwnmw5D5nmFAGXUhAhU3b+I
 nT0W0zEvotrWuboD94YxL4DP/4SplLG/ncROo7Llh2NWqb9PWiPsdNc+GOAQVowdF25M
 7Kr7rvDI4lsMpj7gHQsNj0KXAxqWNzEPUr7z1E/xTvjXhbJAIWrqq74omutYRQwhldyW
 06fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC2PzzeINyndGSmcd7TMLKTkcIw2mLtx0y/a4wwIGP6XF1abtOIDR1Pg2pa8dCNnRgOmizwL4G/Ug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRkl2XMCPen8vvCvvrd1VyHBfvchaG0buAmMAJqg+W2YfC5AXa
 5PfUOPKSzDfELn2ZP898qSpGUeX3OgrMm7YBHsQEZon3+7fgjDSlKPktPWHyyQ==
X-Gm-Gg: ASbGncubLtd5ekfrzbd5pSrJYGVqHz7VE42W9j+bfWjZN2vAykHCbr5sBE2OOdiF27J
 c/UWXyY2oCa7Shk4eJgcVyq+h/2Vpsp/eQhDzM/3wljTd2YYa5+6/a0CPTg3V8Nw71cElQXsPdN
 IBX5vdIvHY/slER3U5op2XO+0RUMffEC6qgq9kzqsM/NKzaO6rqZpj+OjV5g9ft+pWjf/u17JU0
 WPaiE8Xi4IEqfpKIFLXQGPgYaEEnHxS+Rddl7Qk4ZcSUnxLce4b7FoQ0ecLrC2y6iNbQmegqNUs
 xAPhr64fdD8JUjIZ67d7QHZM3HjVgXcptO7JFvFtjNciHZZvGpVuvxebzjfJRwpL2uRE8eaktkl
 BPCrFkpLjEjrCsp6oGl27Pa7cNVrPhUZ1fALZBEvvCARvQ+1FDd5k20QbOXQtwqJ0AV4dE61gQt
 ANdC6JiiK8UgbcQ+TUqTVXbd3yuqAnvw==
X-Google-Smtp-Source: AGHT+IEuLeAiIcFbvckZdi0fEGQUB8Xf6ZhxDDLX2HCSRm7iQ+wj5DqmHKY9RpQQmONnKJ+cIm7Vyw==
X-Received: by 2002:a05:6871:1d5:b0:3d3:5f85:af68 with SMTP id
 586e51a60fabf-3e41e3c250emr345117fac.10.1762452698548; 
 Thu, 06 Nov 2025 10:11:38 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:41f9:c9d3:db30:c36a])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3e41ed0aa06sm137739fac.8.2025.11.06.10.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 10:11:38 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, rfoss@kernel.org,
 neil.armstrong@linaro.org, andrzej.hajda@intel.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, andy.yan@rock-chips.com, heiko@sntech.de,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/3] dt-bindings: display: rockchip: Add no-hpd for dw-hdmi-qp
 controller
Date: Thu,  6 Nov 2025 12:09:12 -0600
Message-ID: <20251106180914.768502-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106180914.768502-1-macroalpha82@gmail.com>
References: <20251106180914.768502-1-macroalpha82@gmail.com>
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

