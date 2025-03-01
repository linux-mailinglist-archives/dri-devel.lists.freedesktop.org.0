Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C18A4ABD5
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C5510E263;
	Sat,  1 Mar 2025 14:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OLm5MTcj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1E010E263
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:27:30 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-223594b3c6dso51924855ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839250; x=1741444050; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M0fPaIWjdscIdDk4T1YIhhdJwaKRFyAzbGum2CZXkTo=;
 b=OLm5MTcjjzsidgKv/8MzcyORcwpPvUbW/X02VM0pUb3gBTWZw/SoDktki+bnjNRn11
 JPI7fwJzBA7pzBdTH5HzGVBZpqTqK6tcjqw6uN6RvE0ff73qfqNXI2TTK6m7icrrGwZs
 821Fx0NcemJPAtj2fFnJnDi2qlq2l0JZMv+N4+iW6R7dQQ5jmq8FvHMB49HzV/aMbW9X
 N9lKXgJz7BFwBDhS3MjI2e/v2ZRFT1acp9d1cBpNg6xcD/6eeDzmUD/EL5Z/X4zryjbW
 yqzMhd/0s+BVdguXUdnxe6vpGOEYkU0YjyNFEdgKrl7aBUUEsiUebe3LxOM+MJkzihZL
 dipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839250; x=1741444050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M0fPaIWjdscIdDk4T1YIhhdJwaKRFyAzbGum2CZXkTo=;
 b=lGVaZmd5BBrg91gAN//OuxZRsNTCulwFkKSHhHS6IMc6Eg9RKgwsUH1Aobmyelqa7a
 8s7yMXwse4v52yfo1rMAk02/JVmkEOFZflSODeBfupsLwoih9o2u47WhZzqve1pFySa2
 ClINhJvR3Rp0GR88qdAMZzK11zDEaRQWR1oheZZJqusa7rRBgCIGDNYCAHDxefLt74Xk
 iApDg2vaI4hSPn+ddLMpHGU/EnsOw5tOK6TJugqOLOz+8IFDTYvuSCmSvAFuCVafuXyz
 3/J+2XQ1krN7KTHiQHPMT8YExPEhqm1v+OF5UPa9O2xXvOIdxhmKJjrKIn2uu0cXl7y2
 Ntfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy0YTYyu6qaBh0Ysq/TIN3lAbSZLXGw5oq1GCHWXzw23nnVvNfBZlNcmCnbYPS7VK+POhX18/N/84=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxJxLu+bWvTZMy1414MNKUHQNdR2i+YUIv8nXEaHFjDJraU5WM
 MpB8BnS8d5ISgCvamjUdaXjo43EehgMCXyYZlF/kdBjMaGNxJ9mq
X-Gm-Gg: ASbGncvgO2FuAjEDTptRimoueMFtPZGpoS2Pau2+9QjDsGYspsOHblsTfAEtOBMGM+n
 a7bBQtEPAyEAx1IOGnqc7XLNuGyMc3kFIIor5yCl0bUxvYssBzf4UgPL5eojNQkoPs9bDmkGa1A
 CLTd7/Rsl+XvuqKf24Pwol+IjuFnXLWNsWhCjzib3g8GWC4GA8N6wCzO6Q1EI2eFmXe1x9GKRal
 GCjQAX00YcRcRmc6YQzQCxByoue2zEkMKNsAQRjMghNubVAv/Y7e5JkCc4wIZHoU7SXwmrwjh3z
 EZvZMsrzlODY3XAFyykiSGd/gOLV0r42Q/ojVSTNpn9CnLaS5EaisZwqR504gSReBoAlfHb1Q2A
 =
X-Google-Smtp-Source: AGHT+IFMEc8dvlQQuKrdEq7g4EcMsmoDBk21A7+d2Y0BFwhyjxtIIjawJKqlgdflPWZNOKVAtnpI1w==
X-Received: by 2002:a17:903:2ca:b0:21f:55e:ed71 with SMTP id
 d9443c01a7336-22368f6d002mr138003395ad.5.1740839249904; 
 Sat, 01 Mar 2025 06:27:29 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:27:29 -0800 (PST)
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
Subject: [PATCH v2 13/18] mtd: ssfdc: Replace open-coded parity calculation
 with parity32()
Date: Sat,  1 Mar 2025 22:24:04 +0800
Message-Id: <20250301142409.2513835-14-visitorckw@gmail.com>
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
 drivers/mtd/ssfdc.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 46c01fa2ec46..e7f9e73da644 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -7,6 +7,7 @@
  * Based on NTFL and MTDBLOCK_RO drivers
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -178,20 +179,6 @@ static int read_raw_oob(struct mtd_info *mtd, loff_t offs, uint8_t *buf)
 	return 0;
 }
 
-/* Parity calculator on a word of n bit size */
-static int get_parity(int number, int size)
-{
- 	int k;
-	int parity;
-
-	parity = 1;
-	for (k = 0; k < size; k++) {
-		parity += (number >> k);
-		parity &= 1;
-	}
-	return parity;
-}
-
 /* Read and validate the logical block address field stored in the OOB */
 static int get_logical_address(uint8_t *oob_buf)
 {
@@ -215,7 +202,7 @@ static int get_logical_address(uint8_t *oob_buf)
 			block_address &= 0x7FF;
 			block_address >>= 1;
 
-			if (get_parity(block_address, 10) != parity) {
+			if (parity32(block_address & 0x3ff) == parity) {
 				pr_debug("SSFDC_RO: logical address field%d"
 					"parity error(0x%04X)\n", j+1,
 					block_address);
-- 
2.34.1

