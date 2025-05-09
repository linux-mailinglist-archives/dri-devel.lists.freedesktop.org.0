Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFB8AB08A0
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 05:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A5C10E24A;
	Fri,  9 May 2025 03:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eAuN1RqL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE5810E24A;
 Fri,  9 May 2025 03:16:15 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-6066c02cd92so853959eaf.2; 
 Thu, 08 May 2025 20:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746760574; x=1747365374; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VzpSbe8Z8lqqNkTECrMU1EmRY6ZmbRg52BdLgYzOLME=;
 b=eAuN1RqLx0beF+PCA2HU2Jsg2s/LjiEwwQVUfEV3WKFozsucOmD2B8z48Px0Mll3zH
 Cok/lDEdub1Sj0yOegoskq14zlscUVKbLPQph/2lqZ5DV8d/7o9YHqGv86aVQaD9ktX9
 SMQWyxj3iSr1Wi/EFnAaSsXUl2+J8Tf/LZg5z+tAE0Qm+jQ6WT8HUdm5y1GzriKq/af3
 M2A6VZjbBH0kflLJrdV77JFc/I3i0abVazwDyUhPhNjSB7v25GowjaKonfViPJ2tlVON
 kfSDeFmKnKXT0o2nHHUCDLZmQKLfVzIAOg1aOvC/AeXS56QGIDkCJ/zYwbIPyxkMQjr3
 mf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746760574; x=1747365374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VzpSbe8Z8lqqNkTECrMU1EmRY6ZmbRg52BdLgYzOLME=;
 b=aSnlcIGphY8A93qxbqUqDbbwBfGmESC0y4bsp4ZkjtqqWw4AwieMVZgIILrTsoKjod
 OfM02/Ue05SAtV2D4x2K3npy5rVH6UPV2/RUJUsBEdUKu3PqRbn6wfUv6hHMS5Or9YuI
 J5nAf6/UeYyc5Cav/fBa0Lqe3CbwjeReVwh/J88rqgNe4vlBr0geCGVIcyoG740QkZb9
 molyPRCj7EY9TeMXpSb8mt1Js/qPrMU3KCzDTrlMHn1ccrxWLwU8CuRsStLp5tuNMBOk
 3BxFZgMyYwTyM8KgwxCWyQdSaKin9WEdUUOX2832dQqvOZ8URUNch9Tqd4V76G00As2+
 bBkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnt4Ck/v/xOCa2FOdTXP8X+jIVCWMDU14EkuKaqVsbmcP0pqWO6X5SKPieecTXi+yfMFi1uwPK1MQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBWDVT5drzfvUZ5ZfyCYH36GoimdNBr2g2XbmwM/8vuzq7Oolr
 f94K3SyHKzoXa0igIijYf/NIclyuXdmHlDr6Q8sC9RZVKHRCs0fd
X-Gm-Gg: ASbGncv27QfW4Z7rgEMCoTH6kaL0jSyoX4S2Zn1j92sQXCBqtn6k5ScH/OH0Jo4kex3
 04zjyQHm7PHVs7v7Cg2H5jo+duRIgMpt84tZCmXrBkaDpVznco8qu13W9AD7/K70nKm+7Os25tF
 u9MU0rs9y0jd0rOZuNKoLfa2uIB2IWQmNdT33rSTuqUgbAm199wk8ES13NsIZbR3ERmqJgqsxWH
 Ufw6o7BTbzaqIifZ7YKlrdzvGyzNdWMnGic/OAKHSK7qo//fPFbWqByspiWkwVPuaZxzTpBwcNO
 hyrCMcJ4NOyfVNwKKDmBQnYLA9KeUeP2WA7Lj7UwO2+h3+XLPDlC0Ley8F8aDeNBZOwjn16adaG
 HrAQFGVTV6xJwjUnPlWEB0iY=
X-Google-Smtp-Source: AGHT+IFFH6+u2tuJktT4qWtVFvDEDDC7Ik0VgX5ZNR6l9ZlVvHjzs798fSJY2oERA3mEi/uVrYMj5w==
X-Received: by 2002:a05:6820:3082:b0:607:e57d:fe70 with SMTP id
 006d021491bc7-6084b846db4mr1121427eaf.6.1746760574485; 
 Thu, 08 May 2025 20:16:14 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-60842b096desm303745eaf.30.2025.05.08.20.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 20:16:14 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, gregkh@linuxfoundation.org, rafael@kernel.org,
 bhelgaas@google.com, kwilczynski@kernel.org, raag.jadav@intel.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, me@kloenk.dev,
 andrewjballance@gmail.com, fujita.tomonori@gmail.com,
 daniel.almeida@collabora.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: [PATCH 01/11] rust: helpers: io: use macro to generate io accessor
 functions
Date: Thu,  8 May 2025 22:15:14 -0500
Message-ID: <20250509031524.2604087-2-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509031524.2604087-1-andrewjballance@gmail.com>
References: <20250509031524.2604087-1-andrewjballance@gmail.com>
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

From: Fiona Behrens <me@kloenk.dev>

Generate the `rust_helper_read{b,w,l,q}`, `rust_helper_write{b,w,l,q}`
and the relaxed version using a C macro.

This removes a lot of redundant code and is in preparation for pio
functions which uses a similar C macro.

Signed-off-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/helpers/io.c | 104 +++++++++++++---------------------------------
 1 file changed, 28 insertions(+), 76 deletions(-)

diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index 15ea187c5466..525af02f209e 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -12,90 +12,42 @@ void rust_helper_iounmap(void __iomem *addr)
 	iounmap(addr);
 }
 
-u8 rust_helper_readb(const void __iomem *addr)
-{
-	return readb(addr);
-}
-
-u16 rust_helper_readw(const void __iomem *addr)
-{
-	return readw(addr);
-}
-
-u32 rust_helper_readl(const void __iomem *addr)
-{
-	return readl(addr);
-}
-
+#define define_rust_mmio_read_helper(name, type)    \
+	type rust_helper_##name(void __iomem *addr) \
+	{                                           \
+		return name(addr);                  \
+	}
+
+#define define_rust_mmio_write_helper(name, type)               \
+	void rust_helper_##name(type value, void __iomem *addr) \
+	{                                                       \
+		name(value, addr);                              \
+	}
+
+define_rust_mmio_read_helper(readb, u8);
+define_rust_mmio_read_helper(readw, u16);
+define_rust_mmio_read_helper(readl, u32);
 #ifdef CONFIG_64BIT
-u64 rust_helper_readq(const void __iomem *addr)
-{
-	return readq(addr);
-}
+define_rust_mmio_read_helper(readq, u64);
 #endif
 
-void rust_helper_writeb(u8 value, void __iomem *addr)
-{
-	writeb(value, addr);
-}
-
-void rust_helper_writew(u16 value, void __iomem *addr)
-{
-	writew(value, addr);
-}
-
-void rust_helper_writel(u32 value, void __iomem *addr)
-{
-	writel(value, addr);
-}
-
+define_rust_mmio_write_helper(writeb, u8);
+define_rust_mmio_write_helper(writew, u16);
+define_rust_mmio_write_helper(writel, u32);
 #ifdef CONFIG_64BIT
-void rust_helper_writeq(u64 value, void __iomem *addr)
-{
-	writeq(value, addr);
-}
+define_rust_mmio_write_helper(writeq, u64);
 #endif
 
-u8 rust_helper_readb_relaxed(const void __iomem *addr)
-{
-	return readb_relaxed(addr);
-}
-
-u16 rust_helper_readw_relaxed(const void __iomem *addr)
-{
-	return readw_relaxed(addr);
-}
-
-u32 rust_helper_readl_relaxed(const void __iomem *addr)
-{
-	return readl_relaxed(addr);
-}
-
+define_rust_mmio_read_helper(readb_relaxed, u8);
+define_rust_mmio_read_helper(readw_relaxed, u16);
+define_rust_mmio_read_helper(readl_relaxed, u32);
 #ifdef CONFIG_64BIT
-u64 rust_helper_readq_relaxed(const void __iomem *addr)
-{
-	return readq_relaxed(addr);
-}
+define_rust_mmio_read_helper(readq_relaxed, u64);
 #endif
 
-void rust_helper_writeb_relaxed(u8 value, void __iomem *addr)
-{
-	writeb_relaxed(value, addr);
-}
-
-void rust_helper_writew_relaxed(u16 value, void __iomem *addr)
-{
-	writew_relaxed(value, addr);
-}
-
-void rust_helper_writel_relaxed(u32 value, void __iomem *addr)
-{
-	writel_relaxed(value, addr);
-}
-
+define_rust_mmio_write_helper(writeb_relaxed, u8);
+define_rust_mmio_write_helper(writew_relaxed, u16);
+define_rust_mmio_write_helper(writel_relaxed, u32);
 #ifdef CONFIG_64BIT
-void rust_helper_writeq_relaxed(u64 value, void __iomem *addr)
-{
-	writeq_relaxed(value, addr);
-}
+define_rust_mmio_write_helper(writeq_relaxed, u64);
 #endif
-- 
2.49.0

