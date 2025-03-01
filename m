Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58532A4ABE1
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB61510E26C;
	Sat,  1 Mar 2025 14:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q9Cd+zzQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495E510E26C
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:28:02 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2232aead377so58835075ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839282; x=1741444082; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
 b=Q9Cd+zzQrC+W203SyNKbAjGP//Z3ubmXlAYM54RB5iXWsuvGAxwgw/rzbclrZkCjnt
 j6i8DS6qE1IroRm2nIUKmsPtHq3+6EOjG0ebwIk96OgJI8p0gW+sFCCrG1PuUdWJ0A33
 MwUgk6XAIi9igzBBBapceCw8ADFX8eDt0gvyOmyJycJj5PgNEJko5Sq2pAh1tb7xUIff
 JAiiw7dyfnlDMJiHdh7zvvdoa1aW2hhCcPJLtmUaYqSVEMA+eMgkvyqK1EMxM4T58o3L
 0EZSd4xr3nSiOGStSTVmuvFI51g+wEsJMxjcm/FTqW/qBXVyVEVoTn9b9oJGUzCRIzIP
 zF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839282; x=1741444082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
 b=ulKbYS2rNYWupiyIlLUIHS6mscBGhwq9W8lTR3pmmL7wHjQ9TobZNXQ6LuVtrIo40J
 hSyJCa6xsjyvlPLI/2+ffQKXXxPE6Jzg0AAjjXC9xPdGMI+2fi1G1M4IL3V/ruNRjyz5
 YPu2RJbTvG//PMI7eeMG1U3KucOvE1egAwDjBoYEWmLurBTB8R2s17tUUbDe9iq+hTqp
 F19XamsOxYYMEqBEqhBIha9BxvR7KtlfBKQhZ+/MxdXO8P8QGGZXqIbk4hiQonY1UvLr
 yze+OhVAwN1mr6cOELnf50NVXwB00hPj0xp7oOsJQtkxNjhu9ZOwbdrQ5Mcg7L6FKBwe
 pyDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw9VwraWRjxqRNc+mlaYyns3Au0J4DSybSTYAxvAXPY0ar5TLfUc0D+ZcDOgyzfuKFjoB8M6zKA0M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlDpJ2V3AHfB5VjEjkXlFC4HprujqBEI7axJ64VYF2vxGYHnbZ
 P0PZpS0mN8/HdtjvuYqAEHGW185U6bj0MxqN7vhBCJ3WBDgh20vJ
X-Gm-Gg: ASbGncuT8MKPyIZEtodGfWC+O4ZeUV0Mm7qlFpFxWwpTwwap+TgZm7U7kw+4aCtdgIG
 ycSh9gxDDuX3yJUyud7MalkT13VHZuSon8NIG84JcQ9RpODChOJ2Xfbfgt9vdEQnninkQhikNAw
 CN7Q5Tadta5UROr9Kfy1R1rBZ2LoLVmzZCyvO27k2oqRYqdhXWkqB3FMW7iE9Uq3DmquFUT43m/
 xuR1oExt0LjoYCFgwxY+qLDV6Ku+hvxjBVQ4e5/xwuxHTrQjE16FDXhJucHxMoRMCY0mE7oOk8j
 OSUQguoXwyX2hHErh+HNPv9duhJgReGUJz+QsUhk3IwYr4tjwwNkmN8cP/WxSeeH2THmlBMOtRY
 =
X-Google-Smtp-Source: AGHT+IE6Wlnx/zKBNSK8vHDH90VpNnFUcC/6AIsKwE//R5+rZAZsk6Mdwf+K5eJJM57bLHOOu0BXag==
X-Received: by 2002:a17:903:f86:b0:223:536d:f67b with SMTP id
 d9443c01a7336-2236920780dmr123851985ad.38.1740839281880; 
 Sat, 01 Mar 2025 06:28:01 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:28:01 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 16/18] Input: joystick - Replace open-coded parity
 calculation with parity64()
Date: Sat,  1 Mar 2025 22:24:07 +0800
Message-Id: <20250301142409.2513835-17-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity64() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/input/joystick/sidewinder.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/input/joystick/sidewinder.c b/drivers/input/joystick/sidewinder.c
index 3a5873e5fcb3..9fe980096f70 100644
--- a/drivers/input/joystick/sidewinder.c
+++ b/drivers/input/joystick/sidewinder.c
@@ -7,6 +7,7 @@
  * Microsoft SideWinder joystick family driver for Linux
  */
 
+#include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -240,21 +241,6 @@ static void sw_init_digital(struct gameport *gameport)
 	local_irq_restore(flags);
 }
 
-/*
- * sw_parity() computes parity of __u64
- */
-
-static int sw_parity(__u64 t)
-{
-	int x = t ^ (t >> 32);
-
-	x ^= x >> 16;
-	x ^= x >> 8;
-	x ^= x >> 4;
-	x ^= x >> 2;
-	x ^= x >> 1;
-	return x & 1;
-}
 
 /*
  * sw_ccheck() checks synchronization bits and computes checksum of nibbles.
@@ -316,7 +302,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 			for (i = 0; i < sw->number; i ++) {
 
-				if (sw_parity(GB(i*15,15)))
+				if (parity64(GB(i*15,15)))
 					return -1;
 
 				input_report_abs(sw->dev[i], ABS_X, GB(i*15+3,1) - GB(i*15+2,1));
@@ -333,7 +319,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 		case SW_ID_PP:
 		case SW_ID_FFP:
 
-			if (!sw_parity(GB(0,48)) || (hat = GB(42,4)) > 8)
+			if (!parity64(GB(0,48)) || (hat = GB(42,4)) > 8)
 				return -1;
 
 			dev = sw->dev[0];
@@ -354,7 +340,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 		case SW_ID_FSP:
 
-			if (!sw_parity(GB(0,43)) || (hat = GB(28,4)) > 8)
+			if (!parity64(GB(0,43)) || (hat = GB(28,4)) > 8)
 				return -1;
 
 			dev = sw->dev[0];
@@ -379,7 +365,7 @@ static int sw_parse(unsigned char *buf, struct sw *sw)
 
 		case SW_ID_FFW:
 
-			if (!sw_parity(GB(0,33)))
+			if (!parity64(GB(0,33)))
 				return -1;
 
 			dev = sw->dev[0];
-- 
2.34.1

