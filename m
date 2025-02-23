Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7699CA4211C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED27A10E417;
	Mon, 24 Feb 2025 13:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GtdoKaRw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7068910E09E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:45:48 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2fa8ac56891so5837980a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740329148; x=1740933948; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
 b=GtdoKaRwOKKnM9hPSxFTI3tBzMpRzntF4bRqVJ8wFMGSRTbTNBSfLRLYMfGIq86O+W
 4bHTdD1uubONkwtcRrnzFzmJY4H43EZo/mW8szV02Gtr1odZZ3x5Eb1uNJgKJ9bDgTci
 sqyVNRQDtYY9abTF4x8MkjsbPS6aFH8An6SRWXdA+rHKWvEyjQ5RCJtdxI66bIZca0Bz
 RoMYB0Q8grTsRY5SDU5kCV3yE+Cn+An3ZbssjlDgXBQV62UmtmIRsVnv7JD7Qh6P8f3Y
 aqUGYmbJEQdKRQTXjFdRJXtAk8exDkX1IUypcqPuHz+6PKeo+cCjluXRdPbXAIZ7Hfyd
 lv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740329148; x=1740933948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
 b=tkDdXf8lngi19Z51Ozej+fj4DISni719yvJz4b8cUb8st5WPg0lxl7NIWkcF7nzubH
 NnFnZN44aNdQ+66OrqZY0lhKEMgjbrqj7nMg03yAJzAjvSKh9kLa2L9aAsQ6+lwrvVfr
 BCXgzk5w+3WlWAGnf3GWCJwkX/6vXdc+htgd/m5J1uwy/ysV145VoehiXpDfMlt6AHXv
 bcvPpUjnX4j6hocZSIa0eDt8ybCYTDEj2f8Z+m+Up/J058tgNqThMTlTVrNIkLKBeqyz
 a6STfOR2VKxOJazJLdxpI/f0Sghek9f9W/ncrQ4dtfY7Jt356zd1+hDktNaSWkErSD2b
 82/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDuzZTFBjATV+BdFUrXBJ9znWCHvFRZ/lf9G87errCw7XS1916BAcCNvIgkAJu9DPPwgK82N9dTAU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTQ5dAgc9kaiPEZ+cxGV0WHKtRtJMrVo895J99/XDB70fEq+Tb
 iwnPBeyGGxob4ecnMTzlbwhZ+/6UCkFPfQtTV9kCZz5HtbGTYh3Y
X-Gm-Gg: ASbGncs2Ep1PoerjVg1/i245mR7Z3wwla5Y95vHCIjC3YDhKxs8kXbSF2Q/7jygEOBc
 EJJvNF833BPNVOVxy9wXqGprybV4AVj6fb7fRWyPRqNFYjw2rqeX8mgBgZjpJnDsIhGheG8Kb9M
 0ehfQPVu6MD+dwgXkvxnC5VGkx5vXIMekIhyRzrvaKmfqGmRgtkzLsQFjObLrw0gHfcmICEye3H
 WTsJ3dTSaOqusxhmQpAv+HAW2vmUWgtSWPIOHOsBHdSte3tjUwJKJaggf+ellYEHJpwwtDa5hlk
 hsb6fHU19qZTx3PIQDCWlnrL5P2oi77kaNCSSLI7MTP6jTx+6xITjLWU
X-Google-Smtp-Source: AGHT+IH16ghKmcmHU0dMEzazIh6n32euSF7ezcTZFrtw55Mtl4npk2uitkdtvmkXgShJlJHnv8p1XQ==
X-Received: by 2002:a17:90b:3c03:b0:2fa:12be:f16a with SMTP id
 98e67ed59e1d1-2fce7b43488mr17785880a91.29.1740329147892; 
 Sun, 23 Feb 2025 08:45:47 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:45:47 -0800 (PST)
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
 Kuan-Wei Chiu <visitorckw@gmail.com>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH 16/17] Input: joystick - Replace open-coded parity calculation
 with parity64()
Date: Mon, 24 Feb 2025 00:42:16 +0800
Message-Id: <20250223164217.2139331-17-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
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

