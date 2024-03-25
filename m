Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E3E88A2EF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 14:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF6D10E160;
	Mon, 25 Mar 2024 13:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FvG4Ce5y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403C410E160
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 13:50:08 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-2220a3b3871so2146589fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 06:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711374607; x=1711979407; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TZEm7dLC7DLgBBuXFeLiLeXWBBGx7yk8NhEbIQaE86A=;
 b=FvG4Ce5yEc8asXxt8Qp1Mf11ylXJUoDRBrAHdP/2d0mdn09UB0uAAgBX6uGKVrrv/z
 5ef6il7wOe7KIQFk7V4PL8RDbMkUKg4ItlISnsZOO7VI4oDDSObMyR/MY6elPpGUv+c3
 dImGnhMK5f6y5b8x+L9IFGrKcxC35F50INaGOnVOR2UI2HkLXdxOXaDLE+lkCTopTb6k
 h4tbbJ9zxGUgmtIcMfXcRnDmN6azHmXDz6L3WThQ4zcEPEbdPeBmPAMp9odyiO7z/2Ov
 Dpgmd4rQXPyF5ksXUx2JzF+ojN7tBtZZBwtvLOJWV7bmNt75t6TDXO1DCaBTNDWWQnHi
 oSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711374607; x=1711979407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TZEm7dLC7DLgBBuXFeLiLeXWBBGx7yk8NhEbIQaE86A=;
 b=RZkJn4r2HlJOOPuaFVpdkej1U7GkxP6jvfy0okXApmtKNuQL2C95Bh8u5qOySZYI+0
 wnRapCePW++kcQ5aGyjFr/8GBtY/EJ7jnWLPZnEbOOOBRrjDcnpKa52Wa+TbfUpvkwGT
 6gVpTOJA4YrYwRDDewuLKZSI8FmXMMksDcSzMjbmtjowKBNP+rfrIQsmM3uZfyg6tzCx
 NEZeyC9EoikozFQnc+yz2BR0nltX7wf7nfLry7ZrgjaZUr4s5LzHJH2zvnTSRW30iq0c
 Xadk8YNkBDK0ecnqs/icag1Ve74+aaf5hneK7JUjCevjswuUyuvNHCuDKEtkS1Ij4L78
 ICMQ==
X-Gm-Message-State: AOJu0YziAr9FwoQ3r8qqWWHlVQ8gWqYKvGyZLp1JrLDAIokKn9L52Yyf
 2WVrKisvWoC82JJHtgz4DadGkCOC3SORL02LxdN+iIQBUWqmJ0MO
X-Google-Smtp-Source: AGHT+IEuxzOZwBoIMGZhGDau9fYZ1S9BgGTKCMVOyBdlostVlEY2F4PkvLWDocaBgYB5mDFwp371nw==
X-Received: by 2002:a05:6870:2251:b0:221:5739:a144 with SMTP id
 j17-20020a056870225100b002215739a144mr7518495oaf.37.1711374607232; 
 Mon, 25 Mar 2024 06:50:07 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a05683010c800b006e673e2d2a3sm1118250oto.77.2024.03.25.06.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 06:50:07 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, agx@sigxcpu.org, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/5] Add Support for RK3326 GameForce Chi
Date: Mon, 25 Mar 2024 08:49:54 -0500
Message-Id: <20240325134959.11807-1-macroalpha82@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the GameForce Chi [1].

The GameForce Chi has the following hardware:
Tested:
 - 3.5" dual lane 640x480 DSI display.
 - 15 GPIO based face buttons.
 - 2 ADC based face buttons.
 - 1 ADC joystick (left) connected to internal SARADC.
 - RGB LED arrays for key backlighting
 - Dual internal speakers.
 - Realtek RTL8723BS SDIO WiFi.
 - Single SDMMC slot.

Not Working (with notes in device-tree):
 - Bluetooth - missing firmware
 - 1 ADC joystick (right) connected to unknown UART based ADC.

[1] https://gameforce.fun/pages/gallery-of-gameforce-retro-gaming-handheld

Chris Morgan (5):
  dt-bindings: vendor-prefix: Add prefix for GameForce
  dt-bindings: display: Add GameForce Chi Panel
  drm/panel: st7703: Add GameForce Chi Panel Support
  dt-bindings: arm: rockchip: Add GameForce Chi
  arm64: dts: rockchip: Add GameForce Chi

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../display/panel/rocktech,jh057n00900.yaml   |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3326-gameforce-chi.dts     | 811 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-sitronix-st7703.c |  87 ++
 6 files changed, 908 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts

-- 
2.34.1

