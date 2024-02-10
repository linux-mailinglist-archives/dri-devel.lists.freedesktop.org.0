Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE8850119
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 01:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FE210FFEC;
	Sat, 10 Feb 2024 00:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a2RMqGv8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920BE10FFEC
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 00:25:30 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-33934567777so860291f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 16:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707524729; x=1708129529; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a8xk3mqbYD2t8NSfIH1rbmvc6gsVPLc11or8CbJG30I=;
 b=a2RMqGv8GlGAl7CSwJBFZ2AXUpuB650Xlw2XvappOnHJL1TzUpuMV49IdHv+Zssemq
 zGfzbUV5+V2AtH0ZYySvCV2oxBcJc5WWNscT9DYHvxTQbGfFmIatmQGzoMXa3CrdTDrm
 ZJHir6xwic4PzSkf0j8HDWvWnfGlYspMsYJgs4KPNiNNovd+THAN0QGijhjCkfg0Eini
 q73R0NV3o2svEh/trLebhAZwu1s+a9N1CUnrXwIWmbdJ5c4p6/6NJHUhO+mI3BFQ6QDh
 4gO9W9vXePzPbnidmcyTt+32u7subDKh2Q+G1/Jzrr6W/PbeKoe7nsnmQM1cci3MFCTW
 KqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707524729; x=1708129529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a8xk3mqbYD2t8NSfIH1rbmvc6gsVPLc11or8CbJG30I=;
 b=etzIUwrpEsEicgigupBYkOgZaD5NZuU4PYq/KKOJKIW6PESB8AkbjMETKVM7P0VhpQ
 dPak7bJd5vn8T6+KF+6rICNnbS9W48UW49H8D3BheiNfE/sJMY4hCE9hmbei0j1RKTzx
 s1SzN9aW+JHmuF1J/C5vyTKq2zMwBQi2eE8SJzvYMgW42MgeuxdmbQbHpaF9npRPGL4/
 8Cp15e4KbiZOa2pN7A15BAA2x2sZqnZ/Di/YAZ01hDWWRR6U0QMTn76we1Ntq8ehDdy5
 dzV/cUbeREmsHJMMLxGGIoY9oOdqptdtDhUXqSTrV0x8Nc1sEJBppQy+LkEzJxr/KbIx
 JxRQ==
X-Gm-Message-State: AOJu0YxRWDBYr2/YnX2e/MruCjou6jMjeiYF050kUGn2AWv+zCb7yJk6
 JjP8xYiq9Re+AX5NMNiU+mvfFK+myV+qZGyXv5N0keXlCfRUwK1reiVKE4PS/jtNNw==
X-Google-Smtp-Source: AGHT+IHnRy/9Pc6hCsbmbtcCgJKOrxrxcqVWSlPF4yJN1t/b8YKTmhQHSZDrS9480Y96+4ZxRKeqRQ==
X-Received: by 2002:a5d:574d:0:b0:33b:58cb:4a55 with SMTP id
 q13-20020a5d574d000000b0033b58cb4a55mr315165wrw.70.1707524728600; 
 Fri, 09 Feb 2024 16:25:28 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUWM+Dgq3HqSHStSJuKMRGyYwYs/QS39eM7qTzQd9uDTK5l0JJrdxnifrSeagNTcYpb6iORL1UHLQ/SdYMMj6reKOvzNp2Eao6lpO8JgnChDWyS76pDgM7n2Jwj8fSogOwvs24a9/pfEdkiWbdLeQdK3EG1qaXpFpgVA6WwiTfLc38EftxPJOIFQQ==
Received: from Hacc-ARM64-PC.. ([2a02:908:4f4:84e1::1051])
 by smtp.gmail.com with ESMTPSA id
 bs25-20020a056000071900b0033b406bc689sm451035wrb.75.2024.02.09.16.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 16:25:28 -0800 (PST)
From: Ao Zhong <hacc1225@gmail.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Chris Morgan <macromorgan@hotmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ao Zhong <hacc1225@gmail.com>
Subject: [PATCH v3] drm/panel: st7703: Fix Panel Initialization for Anbernic
 RG353V-V2
Date: Sat, 10 Feb 2024 01:24:43 +0100
Message-ID: <20240210002443.5590-1-hacc1225@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZcX5ljSCc7nyr_NE@qwark.sigxcpu.org>
References: <ZcX5ljSCc7nyr_NE@qwark.sigxcpu.org>
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

This patch addresses an issue with the Anbernic RG353V-V2 panel
initialization that was caused by incorrect parameter. The correct
initialization sequence was derived by referencing the JELOS (Just
Enough Linux OS) BSP kernel's device tree for the V2 panel, which is
identified by the ID "38 21". The relevant device tree can be found at:

https://github.com/JustEnoughLinuxOS/rk356x-kernel/blob/d4d7335a5ca18fc216a29712d5c6cecfb86147d2/arch/arm64/boot/dts/rockchip/rk3568-evb-rg353v.dtsi#L582

The proper initialization sequence was further informed by dissecting
instructions as outlined in the "Rockchip_DRM_Panel_Porting_Guide",
specifically in Chapter 3.3 of the document.

https://web.archive.org/web/20240209211932if_/http://download.t-firefly.com/product/Board/Common/Document/Developer/Rockchip_Developer_Guide_DRM_Panel_Porting_CN.pdf

Upon comparing the initialization sequence within the
rg353v2_init_sequence function against the device tree in the BSP
kernel, discrepancies were identified in two instructions. The relevant
instructions in the device tree are:

1. 15 00 03 b6 7f 7f corresponding to the ST7703_CMD_SETVCOM command
   with parameters 7f 7f
2. 39 00 05 b8 26 62 f0 63 corresponding to the ST7703_CMD_SETPOWER_EXT
   command with parameters 26 62 f0 63

Adjusting the parameters to match those specified in the BSP kernel's
device tree allow the panel to initialize correctly.

Signed-off-by: Ao Zhong <hacc1225@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index b55bafd1a8be..a346d6c3d283 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -357,8 +357,8 @@ static int rg353v2_init_sequence(struct st7703 *ctx)
 			       0x28, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00);
 	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
 	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x0a, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x92, 0x92);
-	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x25, 0x22,
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x7f, 0x7f);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x26, 0x62,
 			       0xf0, 0x63);
 	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI, 0x33, 0x81, 0x05,
 			       0xf9, 0x0e, 0x0e, 0x20, 0x00, 0x00, 0x00, 0x00,
-- 
2.43.0

