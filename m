Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404AFAB08AF
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 05:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB4A10E27F;
	Fri,  9 May 2025 03:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MjKXjT6H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A5910E275;
 Fri,  9 May 2025 03:17:06 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3f9a7cbc8f1so805889b6e.0; 
 Thu, 08 May 2025 20:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746760626; x=1747365426; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XgqV+bJH9bwGqYSCW6zT8FRineTcAn4X+KFdTGVLZEw=;
 b=MjKXjT6HcdE6I5/z/kuQ/xBHS9F5VztpthONcL5b4G6fjAoGMG1wZpK8/brObZ7/Te
 gHPeqTGgR6T4vluM+IFFTVhgrmmWm56DjCT2ix34fuNLabd+WtPWcFwi5Ywqsn6GB5qI
 a3RED2YmYDxHCRsO8NnBkh3XWoFjiUXZJZAYUVtWHKCSVrhjdiUNxtBV8zrfSYMqJUV7
 IU2nNYXiZ/R6kuAXYV1YAd5atf8uCiGR7UBrSaOXlTdNKPdVz/Z6Cegsh6Sa/dtxUKJM
 Zfn0zt5shH9vkMZrmbESWuzfRKsfGGIK5IVQG7v2U/Hj3pMM5tLsLEthddwD8e/W66YE
 Q3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746760626; x=1747365426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XgqV+bJH9bwGqYSCW6zT8FRineTcAn4X+KFdTGVLZEw=;
 b=TROXe3OrWdiynb6uCbGLevwXanCi/sRzpGfw2TKlxY4LIbyp0gWIYi1FYlFtFKmS0o
 9oA2TqJ71iEkUgLgWrxDriexNLvgHABcn4yFI4jNJ+0XJV2rERjgSA4+PF22CRZRVl0M
 SvGfSpK3r7qJ3/icJRgyUQu+0YqrDn9jNs9OScjqQGQLKN00jK+AeVy5RDTkZEsLseuV
 NhLHxS82aS48lTBJ2g+N7am5JmvUs16ARmI0ehWgP5RvIL2aY58sYqHrzH0RkSok8qlU
 7r9sR4QGJwV2mEwiDbaBBhg7v+1w4MjWVzKIcnshd6nVTyeZX35LiU5JszggiTF0kIz8
 O2lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfA4CxNib9B1b5wT5HbhjRc62Wc+lzjc2ZLt4bvp8K8uhSZ65XYwv25orFuJCn3dseLZw/au1/P0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/A/454bBY+ys5IhVYhEBpOu+iMTh3BbseOhUim7oomqWxWk2P
 3C/ya6aBtqltX3uu5eYGxEEsvUeisf7lDkaGM9BfNnZWNfniLT3t
X-Gm-Gg: ASbGnctzK+m5am/5O/UCiu+gq1PetXltJ79O0I8tNUKmZ/nfk9RUePW6cVIN+GwzYaq
 hw/9hyGCVu7GzR74EXtF9KeNYpHURdrEsec1yaXB9R4aFanEyfqZ7s4ks7euVo1nXMK3tJqKkqy
 oESMPvijy7edLaOQxzJc6XT4wkwr3glWweL4/nfFlCbuxfhHTVH+/g6Y0g2NGxMD0+0fxEJNhxN
 ArkgJcg16EOl53jlYvcp8EKIgsxs3PyyhMVhq8s4T0osGHp+Kbxr1gO736m1lwpLv25aj6oo3Qn
 mle4q6ySBfEkCaID15i6UgWTHXWc1hBGT9GgiDaw7IkrYYeSfrODh+v3iMYl2KUrv/vsGa/o9Kg
 TwoFce8zdGTfD
X-Google-Smtp-Source: AGHT+IFW81DiF+olMWJMKxd0X0Haiy6R6/35pkLPuRc9ZALbjLeamffaAjN2DDY5D6gMNu99B3Hc9A==
X-Received: by 2002:a05:6820:3082:b0:607:e267:7297 with SMTP id
 006d021491bc7-6084c10184amr1043846eaf.5.1746760625781; 
 Thu, 08 May 2025 20:17:05 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-60842b096desm303745eaf.30.2025.05.08.20.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 20:17:05 -0700 (PDT)
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
Subject: [PATCH 10/11] gpu: nova-core: update to use the new bar and io api
Date: Thu,  8 May 2025 22:15:23 -0500
Message-ID: <20250509031524.2604087-11-andrewjballance@gmail.com>
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

updates nova-core to use the new Io and Bar api.

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 drivers/gpu/nova-core/driver.rs | 4 ++--
 drivers/gpu/nova-core/regs.rs   | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index a08fb6599267..42596ee2e07f 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -11,7 +11,7 @@ pub(crate) struct NovaCore {
 }
 
 const BAR0_SIZE: usize = 8;
-pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
+pub(crate) type Bar0 = pci::MMIoBar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
     PCI_TABLE,
@@ -33,7 +33,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         pdev.enable_device_mem()?;
         pdev.set_master();
 
-        let bar = pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0"))?;
+        let bar = pdev.iomap_region_sized_hint::<BAR0_SIZE, _>(0, c_str!("nova-core/bar0"))?;
 
         let this = KBox::pin_init(
             try_pin_init!(Self {
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b1a25b86ef17..079c3d275a47 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use crate::driver::Bar0;
+use kernel::io::IoAccess;
 
 // TODO
 //
-- 
2.49.0

