Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9508DAB08B0
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 05:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0367F10E275;
	Fri,  9 May 2025 03:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hBnm+Jqy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB2B10E269;
 Fri,  9 May 2025 03:17:12 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-72fffa03ac6so1321454a34.3; 
 Thu, 08 May 2025 20:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746760631; x=1747365431; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=opoK+AzPTNKgO/SAmsMVBjeqSr697aHxwJmC1KlGbRc=;
 b=hBnm+JqyUs5pb2SSseYUoISPu8+SPX1uY4TEQ+b+rdKMJkPbsWr3CZ7msu+DZuEEXu
 YbKcVi3AJHxCJdBawhzRYDlYmxC/R3SA0lVlQNUQW0qW5QOaCCZNL28yw0I+Ob3tKKn2
 rKowowNWEbo4V+N3Q1GH1PyM1Te9p8lPaUUfQYybxZ0z1+NZGvIsOOOMA2D/DaOnc/0B
 RlF1knl4cJR7d/aG6og5LTjC4DBi9l7bkfqD3D39ZOJFyKf+9e+JB2VaiLEjJo2TMzwJ
 tDHVGTdRV2rGfT7WN5OaxT0jIosD4khuaM4V/M06ScNuf89XK5eokvhXn+addRD6bVRb
 AlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746760631; x=1747365431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=opoK+AzPTNKgO/SAmsMVBjeqSr697aHxwJmC1KlGbRc=;
 b=FGOQulaPPs0i+5Rt0/QXLS9XMd8R7jX+pIZnKi6O/FIdwLFLd49N0sPI3z6LAZ5L8K
 ajq2Lmw+68lZFgJccBcQ/5zRrOeLw0vdkZTJPdASDjuVxIwtsfBQ5ubyHhPHz9REzSA+
 CuZiPcV/ivS+SxYBANMx2c84JWKQ6wVDiamcqKiWVSbG/zEt0bQYPRz2O9MZ44qasxPn
 LSQb3W+G8/w6jSiKTsf+jsSQGsuwh2zuUqSF1SRBTIgKAgGcFjT5+IlBnGpGcrjxwwkx
 hwMte+gBpmwyZaJwalyh5Dx/8cHa0+scO3sbANFKfRQSZVuBQg33vTPHVn4YsM4ZYohV
 Fm3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYaoH0RhT4Q2YfXjj+taX2CG2AuIXO4XWSkFOSm30uI3Hm1fDr64OVzZnWovcWpVTxSF+1cRqFtIQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLCIDgehxeMeAbn6yIiaD9zS+NWQ9CEe5dDpESB0ky0nVyv+T+
 BK8WSy+qe6E4lu5EuYsy17Wv02TUyqkEWxl4wDZIqsBTFEf5AE2c
X-Gm-Gg: ASbGnctqrxUHTDvElUQm4+qvmBVBKJYQBLuMrL00tvb3uYBxKsAsDpIEHOi8op85o8+
 /5rOMSMR6BFbBaageVBDJQHYWwvQUfMG3Q2IuHcy+R1Tqobu7WLaH7KQUw7wET4y6fABHaa4+KM
 mxVtFsVsM+Riy4m0+/st014hZp9Kf0g3mGu7xN1cotSOE4bg1X7DztbSNORXkiSZmaHmetDbO4/
 4UqkgMQUsXxvy88DI6bOY6Cc3IAJwJt69hnSm9iVrrJzhRPra0xUKkF5fVrf2RB/Q5O6tOaNfUg
 Y2yVjACjHI2HYBiSS4C8KghYrehLbIGOCcsiy9VLKwcM+NSUx53cuLpEn8PJhJcJTeMfTRIXs+h
 9zeFQJHU22/HqKmf3m6+jJXY=
X-Google-Smtp-Source: AGHT+IFr5wDxcxjZ9Q/iUAiLI2ifQ/cRB+9pzvQIRp+QV4tN7rCEAY/Ke6odF2Cy5+AfeYLWPdfhrw==
X-Received: by 2002:a05:6808:1885:b0:401:e7c0:62bd with SMTP id
 5614622812f47-4037fe1e47amr1167787b6e.3.1746760631582; 
 Thu, 08 May 2025 20:17:11 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-60842b096desm303745eaf.30.2025.05.08.20.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 20:17:11 -0700 (PDT)
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
Subject: [PATCH 11/11] rust: devres: fix doctest
Date: Thu,  8 May 2025 22:15:24 -0500
Message-ID: <20250509031524.2604087-12-andrewjballance@gmail.com>
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

fix a doc test to use the new Io api.

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/kernel/devres.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index ddb1ce4a78d9..88d145821ca8 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -45,7 +45,7 @@ struct DevresInner<T> {
 /// # Example
 ///
 /// ```no_run
-/// # use kernel::{bindings, c_str, device::Device, devres::Devres, io::{Io, IoRaw}};
+/// # use kernel::{bindings, c_str, device::Device, devres::Devres, io::{Io, IoRaw, IoAccess}};
 /// # use core::ops::Deref;
 ///
 /// // See also [`pci::Bar`] for a real example.
@@ -80,7 +80,7 @@ struct DevresInner<T> {
 ///
 ///    fn deref(&self) -> &Self::Target {
 ///         // SAFETY: The memory range stored in `self` has been properly mapped in `Self::new`.
-///         unsafe { Io::from_raw(&self.0) }
+///         unsafe { Io::from_raw_ref(&self.0) }
 ///    }
 /// }
 /// # fn no_run() -> Result<(), Error> {
-- 
2.49.0

