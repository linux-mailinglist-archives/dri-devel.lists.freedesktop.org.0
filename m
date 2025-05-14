Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803ABAB694D
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 12:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E33210E3B2;
	Wed, 14 May 2025 10:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j4oGoc/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A4C10E3B2;
 Wed, 14 May 2025 10:58:34 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-3f6a92f234dso4360956b6e.3; 
 Wed, 14 May 2025 03:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747220313; x=1747825113; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LKfsulkMnbgwajcoUFefYum3KXkpP1AWjoY1QW06NXk=;
 b=j4oGoc/rInz6HGvRPVUR3UA+CyhLJRQil3YyByVC8+YpDKjfM6KXwRIj4tLskW8J3N
 OCkCOwa/ZLQGA7AgVJfW28ufXvTXoqmoHkYfK7Iv5w3Www1eGY2xoBKyvYds5ofXbQI+
 Dkr3d1I5cggCyWymk1h/kMzC4ium/yHV5vvX81murQoI5J6mpo8vtIV0J+UU7ds01MXd
 TcQDx0WZyUb4+HX9WlEH0h3Cd8mWFDtq5My7mQIHF03e5KlLhKxjyRJ4E6QOORsohBXF
 p4SR2/EJtAhWWQqXliUk+ibkkJUqgs+AAs7ly/hzVuxnDGQfg6qwUgFcFoJcLg1OBNfR
 vzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747220313; x=1747825113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LKfsulkMnbgwajcoUFefYum3KXkpP1AWjoY1QW06NXk=;
 b=UnZ7G0PltaJOnHg6hsdOZLtxdg6JwhvgDu4DOElqLSgog8Uc3nY9y9zQYcwTTkYQu3
 XpZdXXbyKOV7Xy0VbioTti0P/UuLyS4fgGV9Gvyy1SNWHBt32yxcrrxjsibYOCzuaynU
 ekbgGd/fz11gKCfNALv7DD34EhU9qWAHc7dDHPO7SFhSh8HL3fS9TMHQNnvxFW8tB4Wj
 ADeVBsQgTekgYUdiGhLmbasphi6bV+kvLDHu5KSuk0rTAT8shldJjW5i33t4jVysscpx
 yCD2Nc83xWMHh7Bz+e5p6MXrph9H+798Z7b3fc/sSjPTxTaqdT49VAz2yUs50c3gETZh
 FcEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz5ewK09A9EjXIzuGls5AKVjtHfe5rNShplVHVC9e83kJEq4V34/ZAXYqlz1M7lCJXjLDLgaDi@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys9tHmiIWqZuh0O55Ph6pRfvtlziWoThkiTS/qnkvHqEzkPcPC
 5IV80uHw1l4VOkuKhyu7rdOIRRezJUXldktCsk9D1y49hJ25J7EZ
X-Gm-Gg: ASbGnctbZmEnibavfCWl/d/t4pHhUzgimIy0pePbZkcghFVHcnyZaimHGvNI5NRt/49
 0BZRVMP1/qxgZwDau8Y/Zqrfoh8PwmYRGSqCmPveHcyY5LurNx3aIUGm373X2D66LXR4+BBFmSn
 nydOI8tXK5LsW51qIKZo6RMjuFvdJ5hwIrrVklSHy8hX+JfSvy/3VzqJ1oUDv+j3bG+Tklrnddo
 5UfFI4JzpYXnLZN5KK0vULVctYNufHF6mI8Qa8Sj2KmtPJuzBZSxTkWyuPHgszG7LjDuPWuqbu5
 fWYWea0L72iTejHFmOxI9ohvESnPP9z92BhONReLnaiVzI8P15jcfYnFEyydB6gEsQe3SHSPuVF
 fFD7ZUpJ6iK4kinc1eVi++AA=
X-Google-Smtp-Source: AGHT+IE+1hE1Q+/pQh+mW7/Ct4/eU4EaXfpxLHVjbsq6qa5H2UcdCaWDv6SmoJgr82fypqkELLhKzg==
X-Received: by 2002:a05:6870:4591:b0:296:e698:3227 with SMTP id
 586e51a60fabf-2e348846b40mr1366801fac.36.1747220313459; 
 Wed, 14 May 2025 03:58:33 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-2dba060be9esm2654535fac.10.2025.05.14.03.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 03:58:32 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, a.hindborg@kernel.org, airlied@gmail.com,
 akpm@linux-foundation.org, alex.gaynor@gmail.com, aliceryhl@google.com,
 andrewjballance@gmail.com, andriy.shevchenko@linux.intel.com,
 arnd@arndb.de, benno.lossin@proton.me, bhelgaas@google.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 daniel.almeida@collabora.com, fujita.tomonori@gmail.com, gary@garyguo.net,
 gregkh@linuxfoundation.org, kwilczynski@kernel.org, me@kloenk.dev,
 ojeda@kernel.org, raag.jadav@intel.com, rafael@kernel.org, simona@ffwll.ch,
 tmgross@umich.edu
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: [PATCH v2 1/6] rust: helpers: io: use macro to generate io accessor
 functions
Date: Wed, 14 May 2025 05:57:29 -0500
Message-ID: <20250514105734.3898411-2-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514105734.3898411-1-andrewjballance@gmail.com>
References: <20250514105734.3898411-1-andrewjballance@gmail.com>
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
 rust/helpers/io.c | 105 +++++++++++++---------------------------------
 1 file changed, 29 insertions(+), 76 deletions(-)

diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index 15ea187c5466..d419b5b3b7c7 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -12,90 +12,43 @@ void rust_helper_iounmap(void __iomem *addr)
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
+#define define_rust_io_read_helper(rust_name, name, type) \
+	type rust_name(void __iomem *addr)                \
+	{                                                 \
+		return name(addr);                        \
+	}
+
+#define define_rust_io_write_helper(rust_name, name, type) \
+	void rust_name(type value, void __iomem *addr)     \
+	{                                                  \
+		name(value, addr);                         \
+	}
+
+define_rust_io_read_helper(rust_helper_readb, readb, u8);
+define_rust_io_read_helper(rust_helper_readw, readw, u16);
+define_rust_io_read_helper(rust_helper_readl, readl, u32);
 #ifdef CONFIG_64BIT
-u64 rust_helper_readq(const void __iomem *addr)
-{
-	return readq(addr);
-}
+define_rust_io_read_helper(rust_helper_readq, readq, u64);
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
+define_rust_io_write_helper(rust_helper_writeb, writeb, u8);
+define_rust_io_write_helper(rust_helper_writew, writew, u16);
+define_rust_io_write_helper(rust_helper_writel, writel, u32);
 #ifdef CONFIG_64BIT
-void rust_helper_writeq(u64 value, void __iomem *addr)
-{
-	writeq(value, addr);
-}
+define_rust_io_write_helper(rust_helper_writeq, writeq, u64);
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
+define_rust_io_read_helper(rust_helper_readb_relaxed, readb_relaxed, u8);
+define_rust_io_read_helper(rust_helper_readw_relaxed, readw_relaxed, u16);
+define_rust_io_read_helper(rust_helper_readl_relaxed, readl_relaxed, u32);
 #ifdef CONFIG_64BIT
-u64 rust_helper_readq_relaxed(const void __iomem *addr)
-{
-	return readq_relaxed(addr);
-}
+define_rust_io_read_helper(rust_helper_readq_relaxed, readq_relaxed, u64);
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
+define_rust_io_write_helper(rust_helper_writeb_relaxed, writeb_relaxed, u8);
+define_rust_io_write_helper(rust_helper_writew_relaxed, writew_relaxed, u16);
+define_rust_io_write_helper(rust_helper_writel_relaxed, writel_relaxed, u32);
 #ifdef CONFIG_64BIT
-void rust_helper_writeq_relaxed(u64 value, void __iomem *addr)
-{
-	writeq_relaxed(value, addr);
-}
+define_rust_io_write_helper(rust_helper_writeq_relaxed, writeq_relaxed, u64);
 #endif
+
-- 
2.49.0

