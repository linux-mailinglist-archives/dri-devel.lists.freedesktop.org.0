Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647B983F4EA
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 11:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7863611252E;
	Sun, 28 Jan 2024 10:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CC310F2A7
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 02:13:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-40eac352733so26499875e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 18:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706407941; x=1707012741; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vaG9KCSeyB34qgF/GNTtOPQC1Bqh3X7Odz7HpRaDlRU=;
 b=VkqqpSGLqssud6Td0tDE4/XkuY6Ps02PEUVLQ1UFUu/4185aoK9wyIB57NOGBSVA68
 2Ph9xrONekCpB4/PhsClrX+khHk3nT7TqvkKXhsXjUJEdIhe4McQx9EACZ1DCwjvt4Nf
 uCxUsl5/SWXTjoNzYGSzbSzyBrVnMKQV/fL+KtfT/b23f/OoTaamIBCPEqqMgcIyp2NO
 b2QUZ1sD6H2kSrOdzAW/LsM/b7a4P7j1Cjgm6BIRmeh9uIM7SKxldjXXlJbamYYQp9UL
 6mCWmwqYsN504lyi1njIsMfD6Ax7Y+HMvXJAlTnMc85HQo3+XBwu1ZFRlgGM+lfQVl34
 Q6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706407941; x=1707012741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vaG9KCSeyB34qgF/GNTtOPQC1Bqh3X7Odz7HpRaDlRU=;
 b=v82yv/oWVttCElxifvW7KyIwsJwYRz+T1EpAa80hyl9hv+PvlpUS/r1/x4sWplfLlf
 EH2sn/UK58B7806MWZW1mjwfKCQ+ptE71fcqz/GrTr5pnvRYcBk82YaBzYL1UdeEKdwZ
 B7XrEdSBmx+BCAux7AQ6z2tmBgcMNz580UHbygzcW7eB8fT1Ps91V6eeO6SJo23wrGHK
 fAUjKCmk/lNDjkqFuTP/msSM/6T8ErR+wdepr1BoyowiHaBbX+GlyL0MOTG5HpSf20+R
 kyVj/b9ky5rxMPls8VWUq+jaB8qZ5dGnnymQZJLhIrcLBpo2a+aizvHpZFuoe8mDkRLf
 VCqg==
X-Gm-Message-State: AOJu0Yy7GbIAWn6+mveL6JliHNBOBvjq8ejs6jEb4rTm0zAbE8mEcgIh
 EZecYNf7qwjgJuf7qW96WDtihyrx2OS7RFdXN13rmCtWTU+msqvt
X-Google-Smtp-Source: AGHT+IH4x9bAVhKwPxzQ0yqkvmcyjkXVmKjymiwZeivZQUE73sfJFh3bPmvlrudgVsVr680JTbg/iQ==
X-Received: by 2002:a05:600c:5123:b0:40e:5118:5046 with SMTP id
 o35-20020a05600c512300b0040e51185046mr2204373wms.21.1706407940522; 
 Sat, 27 Jan 2024 18:12:20 -0800 (PST)
Received: from Hacc-ARM64-PC.. ([2a02:908:4f4:84e1::1051])
 by smtp.gmail.com with ESMTPSA id
 cl10-20020a5d5f0a000000b0033aeb20f5b8sm64584wrb.13.2024.01.27.18.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jan 2024 18:12:20 -0800 (PST)
From: Ao Zhong <hacc1225@gmail.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH RESEND 1/1] drm/panel: st7703: Fix Panel Initialization for
 Anbernic RG353V-V2
Date: Sun, 28 Jan 2024 03:10:48 +0100
Message-ID: <20240128021048.6059-2-hacc1225@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128021048.6059-1-hacc1225@gmail.com>
References: <20240128021048.6059-1-hacc1225@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 Jan 2024 10:11:19 +0000
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
Cc: Ao Zhong <hacc1225@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Purism Kernel Team <kernel@puri.sm>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch resolves the issue with the panel initialization of the
Anbernic RG353V-V2 caused by incorrect parameters.

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

