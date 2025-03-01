Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CB1A4ABC9
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340BD10E239;
	Sat,  1 Mar 2025 14:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gT49F2jQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F5D10E239
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:26:50 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-22359001f1aso67247265ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839209; x=1741444009; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U4Bkihj4DGACHQctYAnhtp6nEz1RGAPDBfirVsTzUzk=;
 b=gT49F2jQaMeIfeGhvaJmGJME1nGs70h8jf9OInYd+DXg+M2P9xaELrc6p/5KoOomQ7
 Ucrt541BucASGM5W+I3bPFu0OaKemgoLg8lgmlIU8hLMJ2BHeKds9pnEUOgu6LvV9Hpr
 aQUP88R9j4bsB0y1CIpMTtIYPhFkkK5RsQPY+JcEJBY0NAo9rrzNWsJ3zEKDjc+CHyXP
 0BB5H3mvHNAcrfdEF6IR+slJz7SlGBw8bez2w6XtNlhnOH0armb/D7aba2VnGFP8F48D
 UAe6CqhDsj26xsYBgKIMrWiqAQZCyxeSUdhbZaYW6he75j9FDuyhwMQnvqSiBr/ZWgDV
 n6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839209; x=1741444009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U4Bkihj4DGACHQctYAnhtp6nEz1RGAPDBfirVsTzUzk=;
 b=D0yNsqdpuZZxnVamzqMN0SAnjCS6z5dNckmbMN+IVDaT7UFEygTr00OjfWf2yJ8Oc/
 Fb2NnIT5wsvf6A9JWERoImC5xo2O0FOiZcn+E3Z6ywv8hguGCPkkwd2lAhmWdSoqh5KF
 +MnguLQzT3kC1CIPYd5LvP92BbVdgmqomJDqQSqbltyMNCizLEtGDJYr8lrnvuWKgk9N
 iN9a/8Pym9+D951r0tFleQal62VO+VF0XkcZE9s65BYHJiSCwJ4XyNGxrBV/BNN9TApX
 /zVxzL04TBFb37k8Gbs2SoSTpY86fk22N61P6Z6ZfdS9NvmMhNhOsvJ1qvf9DWa5vadt
 k+0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN963y5KCFmHzYebAZpdEkWcEDw3yAzLUGKRPUmYph+LfFfg3L34j4xFktSC2QMR7ZOoci4EytrvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTXTLQPSRsh54PoSamwd2GLZxIHI1/1khE48tJi/QbcpASYFki
 wgtbUvOdHthaIdhBdVRrgHVRo9gfVOmwf/eF2kXPU+dmo4CRl6wE
X-Gm-Gg: ASbGncvMEQ4bAKCqYPI71Z+kQ6XAadwYrJQHbfrFEtz1w/cl6v5L8IfVxO2AYIkW7Mt
 0stOK3gPixdKqh3XSIRs2dK6SOAaBHc9m6OcasS9oMHCNRfc3Tjm244uq/ADww8Nxv8ZwjRmwx9
 fTDJCQKb48qa4Secmkix+Jh8ZtEM64FQSI3/Nb3ioWpy6nSC5qg1H7OU0fw2GscSUriv6ytUNYF
 8gyBeD4ANx5bfuhOjRiZgYOtea4G5n2z3W61G4RpKTMn7oB0jAeWYvA7d73RjpuLgcwC4DsH7W5
 /M8ONBXyUtcIH7FkOcm0zCeVOLdEY7dwp6DgLzX8kSrdUrobvf11xpo3WrZr0OYu19VQIuXwNQ8
 =
X-Google-Smtp-Source: AGHT+IFGrjgDJrSlPcepaZbcj3TRgBvaEfqqC0e6onE8P6bMgkRDhKKNubsynOimmjCrDvdqjeVQ6w==
X-Received: by 2002:a17:902:cccd:b0:21f:b483:2ad5 with SMTP id
 d9443c01a7336-22368fa8f6fmr116510795ad.20.1740839209574; 
 Sat, 01 Mar 2025 06:26:49 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:26:49 -0800 (PST)
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
Subject: [PATCH v2 09/18] Input: joystick - Replace open-coded parity
 calculation with parity32()
Date: Sat,  1 Mar 2025 22:24:00 +0800
Message-Id: <20250301142409.2513835-10-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/input/joystick/grip_mp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/input/joystick/grip_mp.c b/drivers/input/joystick/grip_mp.c
index 5eadb5a3ca37..897ce13753dc 100644
--- a/drivers/input/joystick/grip_mp.c
+++ b/drivers/input/joystick/grip_mp.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/proc_fs.h>
 #include <linux/jiffies.h>
+#include <linux/bitops.h>
 
 #define DRIVER_DESC	"Gravis Grip Multiport driver"
 
@@ -112,20 +113,6 @@ static const int axis_map[] = { 5, 9, 1, 5, 6, 10, 2, 6, 4, 8, 0, 4, 5, 9, 1, 5
 
 static int register_slot(int i, struct grip_mp *grip);
 
-/*
- * Returns whether an odd or even number of bits are on in pkt.
- */
-
-static int bit_parity(u32 pkt)
-{
-	int x = pkt ^ (pkt >> 16);
-	x ^= x >> 8;
-	x ^= x >> 4;
-	x ^= x >> 2;
-	x ^= x >> 1;
-	return x & 1;
-}
-
 /*
  * Poll gameport; return true if all bits set in 'onbits' are on and
  * all bits set in 'offbits' are off.
@@ -236,7 +223,7 @@ static int mp_io(struct gameport* gameport, int sendflags, int sendcode, u32 *pa
 		pkt = (pkt >> 2) | 0xf0000000;
 	}
 
-	if (bit_parity(pkt) == 1)
+	if (parity32(pkt) == 1)
 		return IO_RESET;
 
 	/* Acknowledge packet receipt */
-- 
2.34.1

