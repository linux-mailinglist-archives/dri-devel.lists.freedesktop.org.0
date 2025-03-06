Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D535EA550C5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B6C10E9F2;
	Thu,  6 Mar 2025 16:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GOJubE6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2F810E9F2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:27:57 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2ff187f027fso1640038a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278477; x=1741883277; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VAZ6yehSc4MEYrK/rteyLhLjWQGTSbLYrKbJr1roEME=;
 b=GOJubE6xjVC7T+kN3+SWK4Dff2JJn3ZNqisujfLDOa0o0ds6537pTGbqwdVJ88lgAP
 9fXuBzW0LBEPpnWH4oDoPBPLPhZWw9OFYWL9uJ/8bguBbYSOam/S3QwdPnpdEd+8kaeE
 peOSSZz4+MAzwVr0Jql/I7zuVzr6QgzgBcjtFWlREOuUwVFH2CJU0jxyfGsgJTi6w7rH
 ETEcnB5zYKjSjyCp/hi+GASKOp1myR3Stx6myJwNpB+ShAsgjNDTDsp3yyOlvjUPgeWI
 EDb51j8+b4xhU+FQXklK6kqOYY7voGfAaz6R/hwE2KaRbXwD0yRDdJpbrMAKy2wI+vaL
 ERZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278477; x=1741883277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VAZ6yehSc4MEYrK/rteyLhLjWQGTSbLYrKbJr1roEME=;
 b=Rw412zT6xU9VGYuIobbVFhZRCW+Z7+I82lOs1EExJjUHFQw+JLI6vT1tgfwjyHqCfU
 farFj7Jk44yrUY3xSGteBC78D9j0B8F4ozvwrElcWYaBL4B3mC0Sp8/GlLTTGV2Lc8os
 AvxaknfXh+Dd7aubnIhA/qNOxbILvVOJd/wYrCmrzEikKAQ0D3dNQuyBtua5Secs6xFR
 wPlORzSXL1eOHGUeqEbvS0smdcSOGauVTDgZ/j0t8JYg9xUb7ltVWrOlHzVItQJpKlY3
 26oPhATtaLwNI0NpJ2fIPkPVQBAWGbEST1iE5+i2fZgeVshbTXEUvT6D5GxivoKkgemB
 xfSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6PUI+OyFY0OmtO7SqG5mpgj6OpTeeluDEeMeMkAaApZt/V8E9B70mzd9o+HW9rvFEZLXtU1qs7Og=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp/KduUlEGmmois2lg2TB/pCq/yGf5+UUM/sH8skYgA/XXG9OP
 eFgeuUwrIjxwOFB/PJcC9Rvge/h7R4VZWH9OYOs/0n7XOS8z+O8N
X-Gm-Gg: ASbGnctcjTHJwYp35Kn5VjTFHl5y75dCOUGCDDPjAy1kFlG0HzXIJMP///v081h9Usn
 Y1WN+lnW1BvBDVL1+xs191va+4HeC2qFtaa6Xs9yGFRlwlaDE190rBE0pmztmHn/0ll6zYP+nG9
 sHkeP/6LkUcm2lUDutuUnprO2OKa6Gy5nx/gSPalDSQAZZWrX2jBNjt7t5OX+hdArRMu5QVclxv
 IuI1NRv//DmoYnLEA/ltSzJlgUPUrziHm/JXhuBoAamQHs9j7SNHCJoo7LEttPkABSOdMWObD4c
 7Xb96ggbexNXgedHGshuLH7zJgO3TdsLXYQsWojUkpzg9MR1bai7oZjF8IpTZrNHQ0xkwdeF4TQ
 =
X-Google-Smtp-Source: AGHT+IGSTp6IoXEU2YpG6BXR34TKK6tsBmlfHVAOxv0eBhCn0t3RdyPBa0hZZRnTXXw4e83qNulrtA==
X-Received: by 2002:a17:90a:e707:b0:2fa:1d9f:c80 with SMTP id
 98e67ed59e1d1-2ff618003c5mr6206329a91.17.1741278477310; 
 Thu, 06 Mar 2025 08:27:57 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:27:56 -0800 (PST)
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
Subject: [PATCH v3 12/16] mtd: ssfdc: Replace open-coded parity calculation
 with parity32()
Date: Fri,  7 Mar 2025 00:25:37 +0800
Message-Id: <20250306162541.2633025-13-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Change variable 'parity' type from int to bool.

 drivers/mtd/ssfdc.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 46c01fa2ec46..53a72576a646 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -7,6 +7,7 @@
  * Based on NTFL and MTDBLOCK_RO drivers
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -178,24 +179,11 @@ static int read_raw_oob(struct mtd_info *mtd, loff_t offs, uint8_t *buf)
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
-	int block_address, parity;
+	int block_address;
+	bool parity;
 	int offset[2] = {6, 11}; /* offset of the 2 address fields within OOB */
 	int j;
 	int ok = 0;
@@ -215,7 +203,7 @@ static int get_logical_address(uint8_t *oob_buf)
 			block_address &= 0x7FF;
 			block_address >>= 1;
 
-			if (get_parity(block_address, 10) != parity) {
+			if (parity32(block_address & 0x3ff) == parity) {
 				pr_debug("SSFDC_RO: logical address field%d"
 					"parity error(0x%04X)\n", j+1,
 					block_address);
-- 
2.34.1

