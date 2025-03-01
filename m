Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F5BA4ABD8
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C690810E25E;
	Sat,  1 Mar 2025 14:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G2iPWBg1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF7F10E25E
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:27:41 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2239aa5da08so1672945ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839261; x=1741444061; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gCIStMwChzl4Z+E/b6UIovNeeE8MF3lkiK/lI/bZwfc=;
 b=G2iPWBg15fIytt23EgAUi+A6W+KTaqSQoaCRRdUzkJRz2iN9smbAO6cJPCB/5/epNY
 yu3zRzu9FmwQvL0I1/cS/gCKk6uKQoW77mqzDYxf7UEws/L43/aLeIoFYbW5/l7NfF62
 kg4QH7qhE5WcxTlFDkZMiVyuwQrQMm68qgat4TvoQdMsGOpAsAm1TceuL7DxTt42i118
 rZ48ISo5I1zyzXo3tUYuczydw8kCfX/bG0exEEcbs8hC5Yd0rRkzlzULN2q9KLFEjJIA
 5opzi1mbG5cHagh1YAl0KZ6ebyr5s4x0oK6Vt9HQ3YA5KNOPMrT/EQuMUjOzgjYZDg9T
 Qvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839261; x=1741444061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gCIStMwChzl4Z+E/b6UIovNeeE8MF3lkiK/lI/bZwfc=;
 b=b2kWcmd51xyXV4c5jK90OH+uc7fi22zwzYTzKX+K50U26vBpZENiQ0bxLeV/gt09TS
 AeTWEV9pKSMva1VYhWiIQZZ5GDbRorDtXvQJyWfQDRRMPlgO7WIeuQNg4UHTTRFkhhIx
 pFkFyxfbtFpUQBJ3iuFpwWGBbt5aIlTaPz5FKaOmAWPwL4UwV4kaNAgxRwP6O/632YmK
 lQSIIZnT+Qoom0PyskpSM9ZWQIMAhpeS0pG8tWmDbC+EvlDwZGJhlGjTP6uzX1c0B0Sz
 paYBTFT/Ngn0lii42BxUdKN2qmRQR4+mN3eRJN0XzuZr4dBNVXkHoQvwHMdnd25iU5uY
 GJPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2zziyLNssNVPcxGaNJm7tT4UvJV8/wp84BFmRCry9aH5prcFqSAsY5Nu+ZHVXCQpAnyktZuKvImg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGaOxrDHjQZayUNM9KUfkO5Ht1xQGGlzluT7U4fMi/ZNsVUesP
 zH/WsiiJG3ANr4EbvCRceTpB7GQvTuUTpVuOut9O5oAuI7Syj8nz
X-Gm-Gg: ASbGncupwb+LukhEjCv8+CPl97Dn/ByTOJRFQbICxoNBoPYFo5VnQirPB9lC+r1Zy91
 6zfzx+IU1VPkO+2hfC2gVFqxATgz8sd8Js4ptkpAKn6RYPPkwSYsGkUq4BmHGwgB+tcTymWCOzr
 ATk/SQLDdSnUHZS/YRbibvh9JHgm5F+IAl3Hz+PxiLBlfNrWqIaT4COr5tgBuzgKB5R2oE2vc9B
 NobybMt2AC6fdKSkHu5WB+ulXgC38Mm68pcAjnKjFKuInpEgYuodR1DRyU7vTxV+2lmre1jMI+o
 p0mbF3pDQCELJ9Wdx6yqtf1qqyTx/c1Jv+sqQhzC4npqoEj8b12JlRvuAUQJh+0ZobMHbytRfmc
 =
X-Google-Smtp-Source: AGHT+IFiFnyov77ut9ZE0KvFExTJSaeHLpVxCuPiHzGuQy81Az6d7l02LfGDhYVm8qdT93KSy9qqzw==
X-Received: by 2002:a17:902:ce91:b0:223:64bb:f657 with SMTP id
 d9443c01a7336-2236922352bmr101615155ad.46.1740839261506; 
 Sat, 01 Mar 2025 06:27:41 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:27:40 -0800 (PST)
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
Subject: [PATCH v2 14/18] fsi: i2cr: Replace open-coded parity calculation
 with parity32()
Date: Sat,  1 Mar 2025 22:24:05 +0800
Message-Id: <20250301142409.2513835-15-visitorckw@gmail.com>
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
 drivers/fsi/fsi-master-i2cr.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 40f1f4d231e5..8212b99ab2f9 100644
--- a/drivers/fsi/fsi-master-i2cr.c
+++ b/drivers/fsi/fsi-master-i2cr.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) IBM Corporation 2023 */
 
+#include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/i2c.h>
@@ -38,14 +39,7 @@ static const u8 i2cr_cfam[] = {
 
 static bool i2cr_check_parity32(u32 v, bool parity)
 {
-	u32 i;
-
-	for (i = 0; i < 32; ++i) {
-		if (v & (1u << i))
-			parity = !parity;
-	}
-
-	return parity;
+	return parity ^ parity32(v);
 }
 
 static bool i2cr_check_parity64(u64 v)
-- 
2.34.1

