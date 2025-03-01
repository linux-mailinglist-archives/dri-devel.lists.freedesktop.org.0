Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDFBA4ABB1
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199B310E17A;
	Sat,  1 Mar 2025 14:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hCyfHsfA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A4910E17A
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:25:26 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-223480ea43aso77685045ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839126; x=1741443926; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JXn6GKhF5PCrQUxpPI6cKx6cLS6wqLkAI6AcaLhK77k=;
 b=hCyfHsfA73doXTvPqPrvN/pxsUqnh03EeWz0xh+YFqTowNdzFcMqEpGxWQyWtxcOjx
 6qp0tBKG/lT5nzlnYtCsFfHKT8snIeXcLDme4fxvQI1YIY2VB9u3pPErE2aF1fKnDNRI
 riwokhyt1YFpxTpoiS7qQR4cUI1Raq2iC1S8ZwSISDq6xpkx3/pVi8ogjeWUesJVvD1y
 gk9Ym3e8GC361BxhTAQEn3vs4Q2xJmc7fv1eTOk0oSxCyXt0TafEq/n54dvUATeFzHMi
 stmed4i5f4j978KzPUVsxZDMiolyoZRlQH+kwCh+dLLBfJ1xCkmE+pIAPRATtrK7itr+
 37jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839126; x=1741443926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JXn6GKhF5PCrQUxpPI6cKx6cLS6wqLkAI6AcaLhK77k=;
 b=sK2k/jVnSzBUwPDeECcRcZ+3En1ip79jIdqRKDOSljOxkzuP0c747IpwVnUJfof3mv
 gvjg9z0NXoWXNaOlq4ejOx/GBnfgTYr5isj021S81V2fXCUgYovFBLw6hrk1KepZ3DKj
 +EPigjDi6vc86h5YfDcCBzmrJ98cZZOSft1KU0utZFkStY4p5BB//ds6UpbC4V26XG4S
 X5K7Il6VbYv7+LOImDo9I4e5uW242xz/cQ9rFaZmsY5OG3MtQpqJssjb2Wmab7dlQyEY
 T9N/5CnRyQFnv4fAKyZkGAdzZGIhDCqjIeKGBn4foXfTgkws40mwN3Lz8e4KSzOAFtuB
 xSUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOkw2VYsPww6AkXIHjhJ8LdBeMzXLmn2hpaz6y3c4q2I8MXm9rUg2NGXGVMKNcHtPIKjSSZByVAyk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3sEbS5zEXs0ttFiApToDFJu0Yjbd1SVcx8VOfDPSaHtODVXOW
 wATpHjsaBL2WmBzUND7X/WZuBao3eEKoMPRTjLa1+7RpYXkL+Y3U
X-Gm-Gg: ASbGnctUCkztzzIh1wEiMdBZlzUdwaIf40q6Q5IuGXVHZC13/X3CVVSvE/26+OLpinE
 nATKpTVbEnMbk9hmHXPmGP5PFxiHCt/uAgi0vgR5hnpcVnH1KI4UHaPpZReShQtfVUpAFeK1FRK
 FlA+L84iAFEwHJmzklRHd2iMRWU2lSHkxMZRCt+R9BV3YEF0/1AipbjVNgax3CewGg6wRTxkXR7
 9YbJdGKIYy5NQ0NVa23yqkX+3PbUtPOOGrsyq7fdLuiOxrGpGrU+KeqT6MOeqawMysOHF2UFDGS
 XprjmKLoDyIIZE9xKhND0j1c72x3Q9pa63Qz3ZsFcH0x+eHfE66jzrg3kaM3Oqin7AZckEdCL0s
 =
X-Google-Smtp-Source: AGHT+IF5pURPLoHQQUwY6iobOMXaj/n4QtZUV4ZbycQ+e8lZRNMONMXX28RkgoVRrFQeanZPW34ebQ==
X-Received: by 2002:a17:903:2346:b0:223:635d:3e38 with SMTP id
 d9443c01a7336-22368fa24bemr111392555ad.15.1740839125810; 
 Sat, 01 Mar 2025 06:25:25 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:25:25 -0800 (PST)
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
Subject: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback
 implementations
Date: Sat,  1 Mar 2025 22:23:52 +0800
Message-Id: <20250301142409.2513835-2-visitorckw@gmail.com>
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

Add generic C implementations of __paritysi2(), __paritydi2(), and
__parityti2() as fallback functions in lib/parity.c. These functions
compute the parity of a given integer using a bitwise approach and are
marked with __weak, allowing architecture-specific implementations to
override them.

This patch serves as preparation for using __builtin_parity() by
ensuring a fallback mechanism is available when the compiler does not
inline the __builtin_parity().

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 lib/Makefile |  2 +-
 lib/parity.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 lib/parity.c

diff --git a/lib/Makefile b/lib/Makefile
index 7bab71e59019..45affad85ee4 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -51,7 +51,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
 	 bsearch.o find_bit.o llist.o lwq.o memweight.o kfifo.o \
 	 percpu-refcount.o rhashtable.o base64.o \
 	 once.o refcount.o rcuref.o usercopy.o errseq.o bucket_locks.o \
-	 generic-radix-tree.o bitmap-str.o
+	 generic-radix-tree.o bitmap-str.o parity.o
 obj-y += string_helpers.o
 obj-y += hexdump.o
 obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
diff --git a/lib/parity.c b/lib/parity.c
new file mode 100644
index 000000000000..a83ff8d96778
--- /dev/null
+++ b/lib/parity.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * lib/parity.c
+ *
+ * Copyright (C) 2025 Kuan-Wei Chiu <visitorckw@gmail.com>
+ * Copyright (C) 2025 Yu-Chun Lin <eleanor15x@gmail.com>
+ *
+ * __parity[sdt]i2 can be overridden by linking arch-specific versions.
+ */
+
+#include <linux/export.h>
+#include <linux/kernel.h>
+
+/*
+ * One explanation of this algorithm:
+ * https://funloop.org/codex/problem/parity/README.html
+ */
+int __weak __paritysi2(u32 val);
+int __weak __paritysi2(u32 val)
+{
+	val ^= val >> 16;
+	val ^= val >> 8;
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
+}
+EXPORT_SYMBOL(__paritysi2);
+
+int __weak __paritydi2(u64 val);
+int __weak __paritydi2(u64 val)
+{
+	val ^= val >> 32;
+	val ^= val >> 16;
+	val ^= val >> 8;
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
+}
+EXPORT_SYMBOL(__paritydi2);
+
+int __weak __parityti2(u64 val);
+int __weak __parityti2(u64 val)
+{
+	val ^= val >> 32;
+	val ^= val >> 16;
+	val ^= val >> 8;
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
+}
+EXPORT_SYMBOL(__parityti2);
-- 
2.34.1

