Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A6FA82AF7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C0F10E2FE;
	Wed,  9 Apr 2025 15:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QEKg4W3y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3724510E2E0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:46:44 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-879d2e419b9so5673833a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744213604; x=1744818404; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+BuIdzO9eB2TbumWIHS4Jh+TQPJAfCKqhpNNx8Z0il0=;
 b=QEKg4W3yS+UGe03yFKQIs3pz6MySzbEoxwCrrbgKfB33n0zSE0yKmvlM+xuvrucEnp
 I1XlBcURA5BcGl8zSFwybdybZMiNwx9t3dAhIBooL11BlyfZRf3HVD2Jo9Acs0CZovSf
 rOpIelPquawCsP9RMM/7O4zxz2UBI/2e8VAa6mD+WiaZT9nNxPG9ttGuGtTvZ7ivuO5Y
 GH7q/HDvOL8hOHZBTrw/IvhudFUG95UJS/tKc2W3mWoMFIXaoHZUZcSgLM0Tg4clJ1Hb
 Rr6iE+p6dffEThPQ5QY28DT5jVshbWTKq3H8dmXGlu1UY62WLL8DmReMF/YjrGKlY9s8
 +olw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213604; x=1744818404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+BuIdzO9eB2TbumWIHS4Jh+TQPJAfCKqhpNNx8Z0il0=;
 b=gFQ0yfyTrGAcRN1ejFUoyLGZ4W/m4OZGw3JY4wcbDLADwd4H3GQfgDshZritDBcUV4
 U1eEtHS2i32B1gsfOuJTpAgqIs8a8uYxnkP4lR11ZQSugikiyVWLtFK24dTJrFrY2NFX
 7ZZEIr2Y4/qsk8F7bU2M0MmlkZei0f8n3soMHAIRy62knMK0kFwnRqkG2KfRMps0eH4J
 zHCuZWE9mE0vm5iYkgeJbZjfpgRN7vecbVJv1Z64OZhw8ZWDtVWXcCGgESvRE39ejHMJ
 KobO4aiQkS7ikPfWg+1S8Rt6LsBlROaIkzEL3y2PryxzML1BvmJ3NFwNMaxUJ/C4fsoF
 HFXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUruOGf00YDvRfOStgAe7dRVfdYE3d8hSEqlq5CGQxWmRu0Y2L422jjMSwVCnLXuqoaGU64dXH02SI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1HHaRBSwL6qjZK1mGOoOLul7Gh+p402sThJeKHqQSRg2iQK+c
 HwWKvIEsqGYJUAq8tV4V7cxFVHzineqzjjvWwsgrWsa6CYYIBUCI
X-Gm-Gg: ASbGncuX5mOk75hFDmOLL6nl7aP/oOv4Iw07xucRsaCWwfqfYS7yoMaE0j4cnaiGjNT
 hKCGAYLhLHWWwiGXQZju1NLF+chnlvT6Cmw5CJcgWyQYcGjBI2t2E7tiqX0TrWvNX1r7D/PNt5v
 eFFS/r8j35SymvBnIHk0phPqYfywthbtdsdcStxUTFZDqp5GXK8rfbQJzOC+4zymm2EBcUvIq9B
 cKUHJAz9btfXt0ryRLi+XBISDI7cyLJHpnl71X3ikRvxUQpcf/C/NEeQohWzuytxHsVy3LPShBu
 JD7rt0rEZFvZi5m9xfmciGhxzICPDJK+AXzDZ+KdAW+uLaPN60aaC0bBxrAqYRSHziDsE3w=
X-Google-Smtp-Source: AGHT+IHJFVNSWnOegw3VgIiiuGFrSpWrUrgalLTX98dIPQMejjp36YTfz+PTZSsEbZDfgQmuBjYI5A==
X-Received: by 2002:a17:90b:2b8e:b0:2ee:90a1:5d42 with SMTP id
 98e67ed59e1d1-306dba636c9mr5272799a91.0.1744213603675; 
 Wed, 09 Apr 2025 08:46:43 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 08:46:43 -0700 (PDT)
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
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org,
 jdelvare@suse.com, linux@roeck-us.net, alexandre.belloni@bootlin.com,
 pgaj@cadence.com
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Frank.Li@nxp.com, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, david.laight.linux@gmail.com,
 andrew.cooper3@citrix.com, Kuan-Wei Chiu <visitorckw@gmail.com>,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v4 11/13] mtd: ssfdc: Replace open-coded parity calculation
 with parity_odd()
Date: Wed,  9 Apr 2025 23:43:54 +0800
Message-Id: <20250409154356.423512-12-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity_odd() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/mtd/ssfdc.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 46c01fa2ec46..0db4776424d0 100644
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
+			if (parity_odd(block_address & 0x3ff) == parity) {
 				pr_debug("SSFDC_RO: logical address field%d"
 					"parity error(0x%04X)\n", j+1,
 					block_address);
-- 
2.34.1

