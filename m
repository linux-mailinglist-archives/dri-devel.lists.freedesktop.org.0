Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1634DA4ABB5
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 15:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C8410E20F;
	Sat,  1 Mar 2025 14:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ga2+7bIB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0F910E20F
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 14:25:47 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2239f8646f6so61315ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 06:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740839147; x=1741443947; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kWaUwtVpZP3UXTpS/tFZiOQ6e7YZSypzh2SSq6Q5dUY=;
 b=Ga2+7bIBM3j6yZu332tqIz/C12/YPYplxs1+LAIceDCNFzeFjcd2kBdAej+djFwMVw
 Dwue9J1v7ijIaLcRAOv+6Q8LdHTgFYw3drQOv9rxpkgUlWE5t2WOnIom2EZhUANy/f0X
 kZ9vRrHO230/lJCiYCSaQNG30Em4M6/tEmWTzlKVp+ShAME8w6z59E8rlPYsgQ7JhE60
 eD+sqB7ZEuDsVXEz3EyDkTOwxTfTqNDuaWz7dIFjl3KAkG8wJ278De5dUTzO3atoKekw
 2d7Q4HfadAiUfqJRaRLyY+6rgHOS0ZAiErN5BSSW6FWRAJKgglQ2xhqngHCvPnuxL1j6
 x2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740839147; x=1741443947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kWaUwtVpZP3UXTpS/tFZiOQ6e7YZSypzh2SSq6Q5dUY=;
 b=nZu77hv1bkRtWmvUTkgebiTvPJZ3QOUcQ7Rlm4vpw+OK6oOJajlP2cZmMAqNYhsjVL
 utXAVZmUoGOfFPFG65PhrO7wjceEfNKLtqnx+w+Gyr1iP478+qbtsS5gqSlBXQnGPekd
 IVolORLvUxLgG2uWRfgchokaXVGyMniKNpC2cSaIb0a0krq7Rq+5IQtyB1/USc2nkTiO
 KzOVWMAODhQoKJ2ssLu05azvw/xh4CyMLcbmw5b4sAoqkat3/E/b/N25E/OeVo1D5BEn
 +hDJhhx97L46Wmoh8KZ0xYTRFUg3ZE6CXY4/y6b5y9gj7GWvakEAQ1Hdfzhd1CCKmrx7
 ISMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnq1sHpHErwxX3dJ6eTUMy5pKcHTF6jClcw3d1kojeE+BNYmsdus5J9UjRc6gY533kSu19bMs1dF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPyqQt8bTPk1aEDNSdQ2DLFT+GWiLlG0MyCOCOwylTyDcbn3iQ
 Qiw0lSqPgWVurD2JhfquPSqOroUeZ0sHiHvMtjyz6zBzInPa9xWy
X-Gm-Gg: ASbGncsV1Ww6VhiQiorOhLV7EQhvEM39SuTnSMD98mHNzqfl4s91RJE1AtuQ/pAwInc
 lt3opk2br0DFAKILGhNWwYtg/rJmgRJFunigwg/HvH+ESKRla1NBcxOBGu0TRnnDMStXOxLm64T
 c+JbMtejNDALPIM+VZ7qeab6+qg88x/juR8g5B6hWfmf06hGlU3k6VvGwvfQs/2lMMknCSYJxCI
 AQReLY7qu1sDGtkRrUDRj+m/dRrLYHNaB5AAtxmGvCeeVIw4b5EhtfxRnqo8YVPUlGF9LQkbChC
 ufj8wXSssBd1LByoUDvvrZz5a+/FvZweRbTFKzXOqPS3XDxe6eAQB0/lm601ci9wHKxw7uJol5M
 =
X-Google-Smtp-Source: AGHT+IG6ecfCPGcNZUMHBfcPl8yc5atQiQ27orXscqjAcai4Vvxl2x3xemsSJ5TeQh/ex0SazOZMFA==
X-Received: by 2002:a17:902:d48f:b0:21f:507b:9ad7 with SMTP id
 d9443c01a7336-22368fa8f1bmr107105175ad.25.1740839147356; 
 Sat, 01 Mar 2025 06:25:47 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 06:25:46 -0800 (PST)
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
Subject: [PATCH v2 03/18] bitops: Add parity16(), parity32(),
 and parity64() helpers
Date: Sat,  1 Mar 2025 22:23:54 +0800
Message-Id: <20250301142409.2513835-4-visitorckw@gmail.com>
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

Introduce parity16(), parity32(), and parity64() functions for
computing parity on 16-bit, 32-bit, and 64-bit integers, respectively.
These functions use __builtin_parity() or __builtin_parityll() when
available, ensuring efficient computation. If the input is a
compile-time constant, they expand using the _parity_const() macro to
allow constant folding.

These additions provide parity computation helpers for larger integer
types, ensuring consistency and performance across different
bit-widths.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 63 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 4c307d9c1545..41e9e7fb894b 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -276,6 +276,69 @@ static inline __attribute_const__ int parity8(u8 val)
 	return __builtin_constant_p(val) ? _parity_const(val) : _parity8(val);
 }
 
+#ifndef _parity16
+static inline __attribute_const__ int _parity16(u16 val)
+{
+	return __builtin_parity(val);
+}
+#endif
+
+/**
+ * parity16 - get the parity of an u16 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u16 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ */
+static inline __attribute_const__ int parity16(u16 val)
+{
+	return __builtin_constant_p(val) ? _parity_const(val) : _parity16(val);
+}
+
+#ifndef _parity32
+static inline __attribute_const__ int _parity32(u32 val)
+{
+	return __builtin_parity(val);
+}
+#endif
+
+/**
+ * parity32 - get the parity of an u32 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u32 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ */
+static inline __attribute_const__ int parity32(u32 val)
+{
+	return __builtin_constant_p(val) ? _parity_const(val) : _parity32(val);
+}
+
+#ifndef _parity64
+static inline __attribute_const__ int _parity64(u64 val)
+{
+	return __builtin_parityll(val);
+}
+#endif
+
+/**
+ * parity64 - get the parity of an u64 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u64 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ */
+static inline __attribute_const__ int parity64(u64 val)
+{
+	return __builtin_constant_p(val) ? _parity_const(val) : _parity64(val);
+}
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word
-- 
2.34.1

