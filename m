Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DD1B006C0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02D010E907;
	Thu, 10 Jul 2025 15:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kLReJzEt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4AC10E908;
 Thu, 10 Jul 2025 15:31:51 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6ecf99dd567so15167196d6.0; 
 Thu, 10 Jul 2025 08:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752161510; x=1752766310; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0/JDalhR7HGrdZn2Na85qCxGVUjNuqdnchv4YNWMoGI=;
 b=kLReJzEtzdL2dFmCFgTj3UUR/kdQHUJJCLXIs0jKW0iBVphsFQ4Znq81qfSwgAAUjk
 SoZgTPeAgDjdec59dsrry6bbncTUIWtO6GvJRu2UqREcVXunNNC2orxeX0zQusnGFi/r
 RSAy65Bjry3Fhs9AbkPAHd56j3xcUAFWbsAagSMQ/4R8K1U2GGW60I14tqHlCZwoHCA2
 pkP2qpC5RpNuaX9NcE3iIQLlh0/yeF3PD4/GzoAZ/8zv1pvIkYvgdkT8len8M1ORMsOz
 hgu4E/3qaIaVqvas+ETznvyXsLrAScU1ERiBPIFKRKgwi2VDdv67SatW94XJlYu5HlGx
 bNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752161510; x=1752766310;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0/JDalhR7HGrdZn2Na85qCxGVUjNuqdnchv4YNWMoGI=;
 b=kpjnucM5+e858Tv1a610uBPy96oC4gMhHoSDWDjglhyFHY/7yJHMEI/FdMnQQ1uHKZ
 NBE8T5WoBFTjPTfDREC5Mey6QY39xYij7E6Uxzq1fcw30t8Sx4dZbKHhr7Hg+9uYEPsl
 mO7us5MLXj7s7IvmFPl9OKDFHZmfHv+Q8VppcA2yaKOQD2gzIrxdUQ49B2ZFz2IFf3G6
 opLtx56F3lchzFQvOM6Utueg8YSQWJa3l256RL7ew/VywgUefpp5Sm4A6S37roNATCD8
 hI7bCRHLPlPAzlNd7i6rmKu4plXNPw3XWzmeTTIURgoSmSxlCMs0OIiEZnovkfHQeqSE
 ibAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4HsLlBeFjrVdY8RaqCA5HebnpJK6WOqOpjUYe4PX3BoQJtcthk2lKBi+niG2hVSilKyhUit0BeA==@lists.freedesktop.org,
 AJvYcCWdg/roGR9MRzSzneSbwKwHqV+E80s33wX38tPd5mo9700YAJZZG+pjIRdnvTFtXPq0fDppaNqWr4c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFshrRbdMRf4IkOxPf9eRryydbH6/6NNMGZ1ILVPSJEh+J3uAS
 6B73RfEFhBfjAUM6UdIes0jf+sxXyp+xQWLVDDKt5h9Ok4U9QaS1Mv6n
X-Gm-Gg: ASbGncuyJzY1HiK2EsRUVUUdeiDtxa4EZFEiHshLMwmf0t+5FDQaljH5KsziTx9yQ5N
 PrTuD7eUrebXgKrCLVY19r4WVDhLrmgMT4oZQPnfJsP8FWaXCAnjGn3Anl9CKFikNPOGR6zPF+Z
 lWTKx9OwMcaDgKw3EQbZw5A/6ijAc2r+kEuJjTxuGSmTYNxViPr6Ln711zuAGDpitHQVXKaXb4H
 ghcshqmO7tvmbR3NQWUT+3gRQPzsmwKkE/yBS5StOytPVIrAfd7nn+tpAcI4HzGy7ZEu4Lhy5cr
 UV5YRuIGXgb9DWauPQNCRYbemtwucqwDZ5ZDax7f7/fASgg7ijF3cVSPY+Usn4snKK0MiqPYtKv
 dbQgJ4tSPCyHxoOseR6z69rye3ErlGmtRfGsc04s3XuzjV4gQFqyrL0pVzQ==
X-Google-Smtp-Source: AGHT+IGlK4u+h32oGxozpab2tD/B7Yph0jCBKI+iYfgyIGiWbIZ+FxxQ7L/p4QWTrgRuBT/dl81aJQ==
X-Received: by 2002:a05:6214:21ae:b0:6fd:24:b0e0 with SMTP id
 6a1803df08f44-7049802b590mr33096746d6.6.1752161510215; 
 Thu, 10 Jul 2025 08:31:50 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-704979dbc3asm9449496d6.38.2025.07.10.08.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:31:49 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 10 Jul 2025 11:31:11 -0400
Subject: [PATCH 08/17] rust: firmware: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-core-cstr-cstrings-v1-8-027420ea799e@gmail.com>
References: <20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com>
In-Reply-To: <20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Jens Axboe <axboe@kernel.dk>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752161489; l=1536;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=XbZfSG96gLboq9hAwWHxQ0UcnmwXIVGU56caleXhB74=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHERu/vESXn7qmFFW348pi5DoDLh036HXrIdmw4RD3DKS+WftxpPEwxHBNYrRqltGIq+N1QTXos
 LZ9h+wNtoCwI=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
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

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/firmware.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 4adcf39b475e..d07849333991 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -51,13 +51,13 @@ fn request_nowarn() -> Self {
 /// # Examples
 ///
 /// ```no_run
-/// # use kernel::{c_str, device::Device, firmware::Firmware};
+/// # use kernel::{device::Device, firmware::Firmware};
 ///
 /// # fn no_run() -> Result<(), Error> {
 /// # // SAFETY: *NOT* safe, just for the example to get an `ARef<Device>` instance
 /// # let dev = unsafe { Device::get_device(core::ptr::null_mut()) };
 ///
-/// let fw = Firmware::request(c_str!("path/to/firmware.bin"), &dev)?;
+/// let fw = Firmware::request(c"path/to/firmware.bin", &dev)?;
 /// let blob = fw.data();
 ///
 /// # Ok(())
@@ -204,7 +204,7 @@ macro_rules! module_firmware {
     ($($builder:tt)*) => {
         const _: () = {
             const __MODULE_FIRMWARE_PREFIX: &'static $crate::str::CStr = if cfg!(MODULE) {
-                $crate::c_str!("")
+                c""
             } else {
                 <LocalModule as $crate::ModuleMetadata>::NAME
             };

-- 
2.50.0

