Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F466A550B9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F31A10E03D;
	Thu,  6 Mar 2025 16:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GvlZwSZk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23A310E03D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:27:18 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-22337bc9ac3so19028835ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741278438; x=1741883238; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XN5ImNH6dAdBfCykY87Jt3WvSMwHnviLIgPuEMqr3Q4=;
 b=GvlZwSZkHN5aKvXLGs9x7MSOXEWEYAJglaftledDpAbID73c/h55Jy8z3sPkJDjtzx
 EJXHmS7yEWcx7DeCnx2HYeCOCvkE6e+cxxBuIFQcy5dQjI7Fs9PxRhwUeZw5XDWLudyQ
 NZ3EdchmiQCigUPa/6+6hL8b50ygKUS48XHtWK5GC8GQTywjOfxHHU1bfH2qPA4lS64U
 e1WDqb9lz0aiIpOjl6KDK8dhjkNdVEhHbRj6SH+kY2E1GXtEM+DjMvyqJVQiCQsBwI7q
 gMnodjKO4/cQEDR0cS4QH6Yf7h+5Z1Wy6UlhUPzspHf6mBMRzY+vNVmMlgX6QyJzcd7F
 4qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278438; x=1741883238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XN5ImNH6dAdBfCykY87Jt3WvSMwHnviLIgPuEMqr3Q4=;
 b=nQzmN5RPZIgPGFAQdqcuWe/R9nDefN8fH2A4qp9Fbu7Jr/t6pVHRPk7y/zM/bS3B5Q
 vQlW+A31tHsw8pi9AqlsWZ0P+giNBVvcSR3p7M6nwfB0TeoSye0PY30eTxAqMHpQ4Jwu
 9upipCHBTpTZfKSZPlfTcLaXt8Blad2+jF1CXcmIYR7P9GR364EkgOb0SnfVAeN81KHT
 BBwenCzHGsjh9v+/cdlpbUqXojxENVj9v4u83gtfAiEfcziIjNckSIyk0uy6Y9aGFNFh
 BGFSgUNZqNZ8MKLJs4EpNAKrPeLWtgkqnKE3dLoUQ4OvHJiQJ8wIQHi5lQRL1eckHK92
 CC4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/gZwCa7uNbhE4oR5mdZaOINcY0HmmkeFqyPQrfwIH2jn2goSF6Rl+AclHjdC4MvVkKRUgJugk+y8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznrKt6xhxrFSsmx+OQX9lXrQDk3HcyisJfSs/vZUR8JmGiUu0Q
 U6x2c34ySuQrs/A00e6roXSpCOKUiWef9EoXPzF8MwW2it659h2n
X-Gm-Gg: ASbGncsttZyRuIj4/TCohF/TV7ki0OpM9q8NCK0Lrd7dlL0+pQytCeZ7i+oV057B288
 LQV1e8ED8/hiW2BgrfG9PDjlkr6ifyCGjvehqHk0cqyCdT++woEkN7qImMJ/fwYAjhUGqZvs6T7
 ke/GAH6l3CuR1XNbbfcyxnfg7d6Uv5TO5VGRTpGw6SZBssO8HdC5GZIPP63N1hHonPaBmhOc4j6
 BDqJUuUYSre7Uj+c7/UhORJ0NJkpWsVDkFqxycZh3QeJpK0wKbKN2pYZ8aTMoILzhlNshrLclwq
 6eF3IsuK/11BESV4j45tWvJ5wokPqksdAPsQN2sF2EgSbcLUX8sI/CKuk+/f9kaOrl9f//hD5e0
 =
X-Google-Smtp-Source: AGHT+IF18uiSk+IKiG1ozkM3lMeST4qvi8jhpDhJUoUXK6z5h5Y70JgwenicEaPtYCl0NNS2nVYnUA==
X-Received: by 2002:a17:902:e5cf:b0:224:1eaa:5de1 with SMTP id
 d9443c01a7336-2241eaa5f50mr17212195ad.18.1741278438234; 
 Thu, 06 Mar 2025 08:27:18 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:27:17 -0800 (PST)
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
Subject: [PATCH v3 08/16] Input: joystick - Replace open-coded parity
 calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:33 +0800
Message-Id: <20250306162541.2633025-9-visitorckw@gmail.com>
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
- Change condition if(parity32(pkt) == 1) to if(parity32(pkt)).

 drivers/input/joystick/grip_mp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/input/joystick/grip_mp.c b/drivers/input/joystick/grip_mp.c
index 5eadb5a3ca37..26a7ae785942 100644
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
+	if (parity32(pkt))
 		return IO_RESET;
 
 	/* Acknowledge packet receipt */
-- 
2.34.1

