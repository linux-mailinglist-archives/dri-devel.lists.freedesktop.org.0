Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A14A4ABB3
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4280310E1ED;
	Sat,  1 Mar 2025 14:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KbZaVWBi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C30F10E1ED
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:25:37 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2233622fdffso60629245ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839136; x=1741443936; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0DnAEglK79Mk3omljF0fSTgcHsRTccmWpKjUoP5FAFM=;
 b=KbZaVWBi03VWwVg0iPhKzi292tNMKabqZKBc5mL7+1gMFU8l3tI+isLFL2REkorgg8
 loo7s68HmBDu6QPvMPiT58SKkJ1bEoOe3+uCsX9nj96W/1hfcgrYzmzWPC1Esn4+Rx15
 y8zIWnKBA6iv43xK4ZdJqCjy1XGNASAYmE8R6rAkvr0H7VAJxqJtp2Kccj7KI1eiT5jq
 dVSwAZbOwslZ3jtmoixCs3aOUZCXOiYJ6BPQ5pbNQtJ0qgXv0LerXhqbk9KcMIgZGzuV
 WHjmhp/1eX0lT5Bxaug8h4igFoX8A25u5+PrzFn4Fs+rvLyxN+kmsKue1MLyB1sSzAgB
 rwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839136; x=1741443936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0DnAEglK79Mk3omljF0fSTgcHsRTccmWpKjUoP5FAFM=;
 b=WYKwmom3rODgX5dgOUDID4qY1cyWYprPUZfSuy0ikA7jVaZzoUqJlZ7lVh+d1hm8MA
 mxuQZmKiDLiBxKCKbj4U9HsBDQtT+MGAUWuru+lzPSraGDR7P00JnxVJu/e33MXaem9j
 HdAcq2Wx9SlLtGxP8FQwufnmsbVt9U3A57l+WAh9w+B3TiRbFiRYR+8Wy+pWjn6nXvHc
 zisKGWpNQAQTuhFVL/nmdpvPiMNPSQRNDNXvsDMDFiAQsmwhe3Tb/h6+fHWX9+7HVLqI
 FM4L7VqdYCCVZOY43VP6PCkEjx5DcS6xbVM6N5ZaEIdsdeM+oRmI99qPU1cT0PAJ39MM
 UMaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr9O3T0cUZbiy9ATc4hocyLtNfHZ8WJmPBXMJdszxZW/StrBXRD/3pWof1bgnpAcIO5x5xqmA3lSg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJfscmnqlecFgXVK0S0qsQW6w0rDTTv9LCJC6CgCDOqf9tQVE3
 yee/q8+MeeV4fzlW9Me1l5RmL/tWYu7wDLvg3AZvETph7qviFEG/
X-Gm-Gg: ASbGncuMOIAHs4PPgu8QOuTi+zHrvflrOOo77nrkoPh0l+hzJYfH4EbVjEHNTbwaDVn
 LNWHyR/JfAdfX8i3beuMmNdb+1/KQFVeiDaZCKHNSLYyyg4fSGz6GgagK0BlTiTUUDqkIuaT1ff
 zUWtKKBsccUepvrrVO6znu4kvVHpn8Yw62BdMnd5BURP5eDFLSjLUn/ARuS6ZoK38Q1m2/GH8Ff
 PMrAIrThKCH3nFsQek1G5/IB5ymXMAk+nhmFHaRCBGqf5/kygU7vqIqZHb6Yj85RTjDomHxz/Nw
 QFcCEn1BD7LyNM4votJYnf+mydH4Onyrk86b2O/6XZU9G7O05iz0P1qet4HI6E8LNgTt3v5pOoU
 =
X-Google-Smtp-Source: AGHT+IFRKRz4BN5AxlaA28KHfZNYjOTMLj0QAU9lL8VlPLbOS4h8EVG2ykvV/etQT7fBRPoRmphS1A==
X-Received: by 2002:a17:902:d4c9:b0:223:5240:f831 with SMTP id
 d9443c01a7336-223690dff12mr91198085ad.25.1740839136548; 
 Sat, 01 Mar 2025 06:25:36 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:25:35 -0800 (PST)
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
Subject: [PATCH v2 02/18] bitops: Optimize parity8() using __builtin_parity()
Date: Sat,  1 Mar 2025 22:23:53 +0800
Message-Id: <20250301142409.2513835-3-visitorckw@gmail.com>
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

Refactor parity8() to use __builtin_parity() when no
architecture-specific implementation is available. If the input is a
compile-time constant, expand it using the _parity_const() macro to
enable constant folding, allowing the compiler to optimize it at
compile time.

Additionally, mark parity8() with __attribute_const__ to indicate its
pure nature, ensuring better optimization opportunities.

This change improves efficiency by leveraging compiler intrinsics while
maintaining a fallback mechanism for architectures without specific
implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..4c307d9c1545 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -229,6 +229,27 @@ static inline int get_count_order_long(unsigned long l)
 	return (int)fls_long(--l);
 }
 
+#define _parity_const(val)	\
+({				\
+	u64 __v = (val);	\
+	int __ret;		\
+	__v ^= __v >> 32;	\
+	__v ^= __v >> 16;	\
+	__v ^= __v >> 8;	\
+	__v ^= __v >> 4;	\
+	__v ^= __v >> 2;	\
+	__v ^= __v >> 1;	\
+	__ret = __v & 1;	\
+	__ret;			\
+})
+
+#ifndef _parity8
+static inline __attribute_const__ int _parity8(u8 val)
+{
+	return __builtin_parity(val);
+}
+#endif
+
 /**
  * parity8 - get the parity of an u8 value
  * @value: the value to be examined
@@ -250,14 +271,9 @@ static inline int get_count_order_long(unsigned long l)
  *	if (parity8(val) == 0)
  *		val ^= BIT(7);
  */
-static inline int parity8(u8 val)
+static inline __attribute_const__ int parity8(u8 val)
 {
-	/*
-	 * One explanation of this algorithm:
-	 * https://funloop.org/codex/problem/parity/README.html
-	 */
-	val ^= val >> 4;
-	return (0x6996 >> (val & 0xf)) & 1;
+	return __builtin_constant_p(val) ? _parity_const(val) : _parity8(val);
 }
 
 /**
-- 
2.34.1

