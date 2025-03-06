Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E59A550CA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9FB10E9EB;
	Thu,  6 Mar 2025 16:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mT8RDgRu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F60310E9F1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:28:07 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2fef5c978ccso1516108a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278487; x=1741883287; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dVzC5eNDjiMbvhvqlOK1r/73KNx64ddnKPcxwil96xE=;
 b=mT8RDgRuEiK7q/ocOJfyCLXc73EJlriBBh8qhQ8n69rh7kjOQi0tW2z+RU9qMShLgA
 tkCj0DRNLGAI2VyGT/EvEuS/ZYXOzvhbL7dgDZrS+gcLPSsCiMTR1xffTIdVaIDTMGKo
 RYKnlzT1uNcwgdHjVxfeKVkyEIEFTJ3NAchj9sF6QlvmDE3CPCDI5YQgLNCafB93dIBe
 6RnxKI/73Y+dmE4tU4SalGiPNIKV5pGxT6+48UDeAhEG2MhvxHdYaHCJbQ+kWUCUT6II
 rSw7pCjSZNbInAZAI59JkQbiOWARGM+E7CHwBR7sJFhPJXZcCQ4HWP8z1r4MwSA5vn0I
 PhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278487; x=1741883287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dVzC5eNDjiMbvhvqlOK1r/73KNx64ddnKPcxwil96xE=;
 b=A6CVKuNVogmOI0EW8Tqt1sx1inJ5SaB1pa797LV2fp7G3JChciogvNdIoiyrTZBEVG
 9MjDFgpWkAzfk7CW9WVW2qyh+jxS3Ihzmn25wMcCZX/cs/574Z7HRnyT6lG55O5/AQSu
 qaf2DvA4Q2jXO7njyRWA+0X+ddiGzj51d+EcgYekNczYOyAYYs/qwN0C226XKZqu2/K1
 Zay7BKpY6eDgPjpawHEUyZtwKkbIDGvU/Mhim3aXeu1obZRJaUZTjdVsbFVmaIQIy99F
 50ZiFmv5GIP8MQQf+BXvReXmyIff54sU8V15Ir2f7uhlqP92VpJ0eFKx26wzkpJrFKEm
 bHiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjt3H5S+y+7Uyht8bb4dA4CEX9+bprZ/5dwRjeNzMqNBL1pwTCRbfJqNpuPbRNEXTjnlLKa8dJvd8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2oqm2fgHdYR5SVn0x3lPViNPpLl8syPL5hPm4DzscsVZVGHtk
 NNJ8+t9xbrY59fcXQOgDvmm99I4pWxnFDSv+yD0eLtyFcx4GKsQq
X-Gm-Gg: ASbGncs2AuUsge/ZWnXSbzhkVsIHj9EUdUagQZnS36/1J53fyQauVKZbFaxJ0I9Ze0z
 3f0ckDmLvtpJDHYhKBE9o74a5WxsGe9ym7knBjAZz5RdulcsasLEi7zrz9sjXY1arz0S3zKSy3W
 1FNcjsrW3lzWItxygtBvi8MFW9gmWEy59+MY7jDVju+PZpYU+0ZenkbWcaR5ovlxEi2z+goutRD
 e3I27os+vhvRjrzM23mw72Qz2Dh3BZvgCUL8j4mqf7JRDAWG21lE7j9RYw+4AG+XYIUrSiSRTwz
 GpVw0g23dVQALdAe+I7Yu/9ruCSXCIv2Ew/JJHtafN5Wh2/Ie6uc6GVuCRuFvfb+BI3/4bUb/28
 =
X-Google-Smtp-Source: AGHT+IG1hUiIY04WmIWjSTraivZtBZJVGW/maYZ4w8gjs57Y/NbYWELqgVEzi3PK9/fk5EW05X3DDQ==
X-Received: by 2002:a17:90a:c108:b0:2ff:5357:1c7e with SMTP id
 98e67ed59e1d1-2ff53571ccbmr8979955a91.20.1741278486674; 
 Thu, 06 Mar 2025 08:28:06 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:28:06 -0800 (PST)
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
Subject: [PATCH v3 13/16] fsi: i2cr: Replace open-coded parity calculation
 with parity32()
Date: Fri,  7 Mar 2025 00:25:38 +0800
Message-Id: <20250306162541.2633025-14-visitorckw@gmail.com>
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
- Change parity ^= parity32(v) to parity != parity32(v).

 drivers/fsi/fsi-master-i2cr.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 40f1f4d231e5..46511236bbca 100644
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
+	return parity != parity32(v);
 }
 
 static bool i2cr_check_parity64(u64 v)
-- 
2.34.1

