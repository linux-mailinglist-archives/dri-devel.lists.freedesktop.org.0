Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DE2A550CE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E6610E751;
	Thu,  6 Mar 2025 16:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DCS5f+y5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A283D10E751
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:28:29 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2f44353649aso1509216a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278509; x=1741883309; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
 b=DCS5f+y5w4DB79FrvlOvfSHLF4AKMpisfTa7wQOl3uHUqQcOCJjmCLqyYj+zaP5bcn
 0IVZyCS+qIi7tcHCsfgurUM7AKL2DGZCorMDYEKPImQC+Ayq419Ftsk5Dq+m5dfJJj2f
 9va/FzyyuXZpFJi2t3t9MRkfd+G7tYRkuVQ9PBbANNGZwMn+jPObTR0j2Ihhtqv5xPJ3
 MGk0b+kMBJ78Cd8v9AywSCpGP8jwKWUGpW99ZNuSTTvrqO5wVATdSwycKHKpdsvVtXog
 6SNwA9pWeZcXRCbPFOwyZS/hxyFiCB/FHV8yeblToURXmJXQvAKwRGD2PyFDnmHmnsN3
 vRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278509; x=1741883309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rykqQnwPkGRFwR5KILLeuUxXhWjh1d/Lo2VO4W9LQtQ=;
 b=JOMLIEHb4bKSxE2Six5N3lR+uxmlSq2uXZ5fBM+FWiVuViSZ5X6LK47bFX6VHKV/Vg
 gqmv6FuAP/bHIusjG7vclqluL+rBbSXtWFTwqiHehHU/XNleOkQDFU0CeCjTxBOD1AYr
 WY1oqUTxmfCK/MPWw5af11c6qOA3lHBD0C1hYLyRTDnz1kbKuoraL1PHx4tr3JNTdIZ6
 GIw4AUoSp/lPTCc2Jpi3rKm3XDFsn97vrP/2krxkftFpe+JQoqOXVeqXYn5kfS75u3kT
 cgp3vkQ/v3CgA0dzS4+4ggNu1PCAsgbsHfHiqzlme8B4LfjG82jl/XEWgTNS450v7QKE
 ZNdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm0G6YuU6Z8pK4PobZTPILX/2zGZ/bpGFqqeW91f+D8BQz3o/zlEIG1dCiGEw3JWUVhGPMgYTOwY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUo7njfoAn7pGil0EY/chGcBXuEgi386ywQHS7V5o9eL75inGc
 O6iGdfqAASKPaTYiuwsWD5hYOCosTQPyDEBVJJQTKAHjYTnbP9fd
X-Gm-Gg: ASbGncvGnG4Uvkr+c+Lr/nQ5gCOsErcTXi21j9IsFNgPvN1lJUdGkg0wq6d9nsjl9SY
 sNuAUFGdlDapfw1Rm65G3gqWuKhhddzm6HWwnMXujPHAwPqngMZYSvrulHyzJK9cSdZyLkITRUL
 ZwOu8Tnt4lUiWl47NhXBbl451L9jkSOBmjZw+cl5m1L+DmthwBx2Hdlcl+LYyTus/7S5Ob78R3b
 SIc9Mih6l7O/cA2LtyNHuj0BpXfcMI4RyuZUXaCoVkDP5l2jWKCNbIP3K2C6s0YENK7oVwbARDh
 5VOwMyRUlMIH+C7mUsw2lGNhmvPBdoiBBsPBMRXr6uSOERkS8rQe9pGLx/plTJsDSlYxdXrupgI
 =
X-Google-Smtp-Source: AGHT+IE7CMC10LMwovhBW4tB6jZafU5napSqaqhkL82rznmGKafZamE59+csgSshd0lW2KvQujLljw==
X-Received: by 2002:a17:90b:568b:b0:2f9:c139:b61f with SMTP id
 98e67ed59e1d1-2ff49728389mr14240353a91.14.1741278507670; 
 Thu, 06 Mar 2025 08:28:27 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:28:27 -0800 (PST)
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
Subject: [PATCH v3 15/16] Input: joystick - Replace open-coded parity
 calculation with parity64()
Date: Fri,  7 Mar 2025 00:25:40 +0800
Message-Id: <20250306162541.2633025-16-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
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

