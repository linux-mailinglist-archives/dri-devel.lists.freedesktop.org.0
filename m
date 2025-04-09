Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E71A82AF9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1222F10E311;
	Wed,  9 Apr 2025 15:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PJ4mE9QK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBFA10E2E5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:46:55 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-af9925bbeb7so5316650a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 08:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744213615; x=1744818415; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qmHMxU2w78+CVBOj7SKK51/xntQtWaTeeSMBQ6WnTFU=;
 b=PJ4mE9QKgc5TeKqdJycVizlaLobyRQtHg1syYu9zescxtjCj27z83d8IaynzZDzTz9
 lgoE6bXDj2YLRityz7OsRcQosqnocDV2i0RYKELB4YEHCXb67WihzBC1hWDuYmOJKJQl
 o6DOZLNsAMeX3LjDt3GIH6/G8xjmo5ygq+BfobhIlLvbROWFQx81VqxxwSj/5vOlYw0e
 cftym0S3PVZpLmtLX114KyCA4+kpY3d9cs3ycMEBynBaNTsIGcADhAlA9piqQCXLXeDd
 gSxB7sP1NSmgqUp9lDPViigBvYNPiN0ZSwhLRag1XeF9FKNW8n2koFY3ltX5codmdQcs
 s9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213615; x=1744818415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmHMxU2w78+CVBOj7SKK51/xntQtWaTeeSMBQ6WnTFU=;
 b=OU++TYT461OIRN+OxcT+e1iXU4DQeoKkIJ0pU6sZ5cF1LI9T8CpcswPHrnXNqTEquZ
 4B1/bNyP6utOcifp8nr9wHyP70aSwgcEj8vNWO8/NdjMoo5o6p2K8W5+U4OMvFOkm6Ap
 R+3pPo0o+5FH8QKjer6wiVOd59A57BbHauddIz2cOr/NgFfoMV1L/6G+tc3dLL7KyDHG
 OVaQGbQyv0MWVJZQmGTcQZnjVLZ9HZFB+umb6AjVZ5JQZKcrFI1wMlfNSMF0cGyCCUOC
 J9BQsVerGSIRhHCNq3gH8B3PD/PJ8Mdfff55gYFhvkptsFXa8txrUyOKdzkMJ00No3wE
 PUlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkEejOg65lJoyFrSvVnBGTPDioxhunav4AAUQNfpgNuUSSHDLn4bnKA6EK7giJdD+B5i2DAvgurkI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzX54znAMP2oQetrXXrFzaEsJmtKLUGXYS7AVWUNHumBHWOTUWD
 pXfi1Zb3WQix4OZvn1m/3d1moKD+qxwPXEItJpd/sxnWxttFnqaE
X-Gm-Gg: ASbGncuMS3j6jQ4hI022+n6kNqUs4JFCuaejd1H9/SJZ/U6pU/hvabx9XjM4pxXmQ66
 PvfmmH64lGUHFa/2mMSRDx8cs1Y0qIhPmxHXrXJOIFomZtnq0hMQLSB1ZzZZGdhBRWkWu03yHSx
 nhuJICRfrgTWoZp+PvT28XVsvfk2ff0NkIaQ4CC4mZFzR9+LnQY/+4BkjGDdACKdAdDRc9xQjd/
 EBFTUWdqVmDWzO08GbaQsBlrB0laR6KfjD9xhNyf4nP4IZE3okpadj9PQyHltOVMwFeOFTrcaiM
 7HpLKYe5douNB5AsJlJOUZ41iD3pGEhX8qlHGzHXsK0+QlYpdXAfKB0WU2VU9u4yEnFoIlg=
X-Google-Smtp-Source: AGHT+IFODj+q3bMay4dU940pWbrerSwhoQdYamKxEyheU1FRVVU9x2vDvw1G0LxNRVOTtBzOvt8phw==
X-Received: by 2002:a17:90b:2e4b:b0:2eb:140d:f6df with SMTP id
 98e67ed59e1d1-306dd3247b3mr3476749a91.1.1744213615281; 
 Wed, 09 Apr 2025 08:46:55 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 08:46:54 -0700 (PDT)
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
Subject: [PATCH v4 12/13] fsi: i2cr: Replace open-coded parity calculation
 with parity_odd()
Date: Wed,  9 Apr 2025 23:43:55 +0800
Message-Id: <20250409154356.423512-13-visitorckw@gmail.com>
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
 drivers/fsi/fsi-master-i2cr.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 40f1f4d231e5..692d73e892e3 100644
--- a/drivers/fsi/fsi-master-i2cr.c
+++ b/drivers/fsi/fsi-master-i2cr.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) IBM Corporation 2023 */
 
+#include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/i2c.h>
@@ -38,27 +39,12 @@ static const u8 i2cr_cfam[] = {
 
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
+	return parity != parity_odd(v);
 }
 
 static bool i2cr_check_parity64(u64 v)
 {
-	u32 i;
-	bool parity = I2CR_INITIAL_PARITY;
-
-	for (i = 0; i < 64; ++i) {
-		if (v & (1llu << i))
-			parity = !parity;
-	}
-
-	return parity;
+	return parity_odd(v) != I2CR_INITIAL_PARITY;
 }
 
 static u32 i2cr_get_command(u32 address, bool parity)
-- 
2.34.1

