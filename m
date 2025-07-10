Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5242CB006BD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FEB10E905;
	Thu, 10 Jul 2025 15:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MB70nv5/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4B110E8FF;
 Thu, 10 Jul 2025 15:31:49 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3df2f20f4bbso4088705ab.0; 
 Thu, 10 Jul 2025 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752161508; x=1752766308; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WVFjfPNTbi6R66/7pUgl3ALTHRI4zFg3YUCk14hLoUg=;
 b=MB70nv5/AfaDOd9xBwHxRmp0e713mNZZCE6I2ldqT3xp4dhTFudPAATv3CfvNcjO82
 Ve4Q5AupeuXKcw0J2pjBbBt404l2krWobynPaMmrTyVG/nLufG1Qv9+BJsJubuqvHGJl
 ZWPerw602dSSRMGFVXTiFtYALP8haVnxXIg0URVBhp4vex5M1kFjLgAmUeD9CjMKEx4k
 Lxr9OWB6ypnNmgR1cTXiw2biDDPoGo1GL0ev9jK3S7yEz9LMmHPkozG9Js8LDGVCENVp
 QSQTTV/ZSewUjZILQ/dMAouaH/IkAl7ja6vYnM+7senmDReQbNPAlBz4Mf0JCB7qicFS
 UE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752161508; x=1752766308;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WVFjfPNTbi6R66/7pUgl3ALTHRI4zFg3YUCk14hLoUg=;
 b=U61twbieUFAx9sAqVb1Il61mJJESlxUYUSePz5NYV0jF9VWKMtTx4Sh3aX66snschc
 Mhluy7EYDHJ95EHrgsdPxMcPqdagT7nme76grKhALTWVz+UZ17+QRZJ7wLef/x4WOliR
 wqOyJzNA3K+rSmz2FIN4JG/DIDfLsnxBCLCNlVeqadonGYuns+a48qxmqICjQ+T6wzlK
 AqEvk8wbLX1Wz40RdJnc4GmZYY4kF/ZyJTla6yL82E0phzSHheHPlj23Ir5t70tKu94G
 W8sJ78a1K8yc88JbbfZSYHAzjZGLSxrLXQyhY4WPNMQu3Bb61d5xbouVgZ12kcTTFA+q
 5lCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQRJ4DpcS8Rg1tDVtb9fYkxOiExt4FY1Y65mq1qW9TqdJHeFBFyhcnKga3Iclj1eUCYXAxE7v3KLw=@lists.freedesktop.org,
 AJvYcCWVaCIgPr5YfmeEFXWVYqoORrwvcgAgZNL3HXwAUFxA4lobedu0oOeofOB4jjVRXWQyb6XgB+VBfQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywrhs6XLyWR8mFOtqLCvjvSXIlnL2/Z7aEPhhmWT+dN6DS0BClD
 7XJZxl0oLltb5fG0PMbp3cnsOZRFiDFqJCTHtOFfpSTQl1w6FKzc7MQH
X-Gm-Gg: ASbGnctTaBdZrVE1r8Vyltgkfc76CdLXXxWqOoIBiC+KVjDRuZdbai7CLWMSFApuelJ
 lQXz3O22egx9nKpd2t/mI5j6ppBPQP26ms+T/3A8i+eRXab65oyTxJ9NcAwWr7R8zc+FI36Wdiv
 l3+FiqrCUjHNJSuUfsg22bUo9EuesPWUleH0rCf2W2OI6pr07629ijct/u+6L1PFY4WCQz943lV
 m0FItagQHmf2jjE1ay+tPMFE8iol+6jSWtVeg42CGhyX8dbytvucrmP9fmkw1q+EbdL5C4aPLnQ
 jR4qhOZgwYbuNhKB8OloU12KLJwMsOGyVnc4hUNuKuwQWxyPDwbm/JPBpVm2HSdPNUSvvlubse+
 LI6+GSWUOElJt9UhW1WlyiU9pwc+O3Mau0gs/yTFK/CQUOzC1U6+eY9iJfg==
X-Google-Smtp-Source: AGHT+IFCym+xBGoaFaMTBAc6u039EKWRGAB/Yd6+c7XI6q8JLxZTaP4UxwS5DlA2tuk9iufaO/epKQ==
X-Received: by 2002:a05:6e02:b42:b0:3de:2102:f1d8 with SMTP id
 e9e14a558f8ab-3e244019ab8mr53662575ab.18.1752161508131; 
 Thu, 10 Jul 2025 08:31:48 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-704979dbc3asm9449496d6.38.2025.07.10.08.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:31:47 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 10 Jul 2025 11:31:10 -0400
Subject: [PATCH 07/17] rust: device: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-core-cstr-cstrings-v1-7-027420ea799e@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752161489; l=1137;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=lKArFG3jk79KbI1Ip2d9VIpBoj3sVr8YWgzpzTTR72M=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAzd5arAmJGDCeVxbMUwisyHuguGLVYd1t94JvFxCxzK/cekAHr5Rtjw+6FA4xzDvfKhCkirXSB
 JiQdbWuO4ygU=
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
 rust/kernel/device.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index b34173536230..ff300e1d014b 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -11,8 +11,6 @@
 };
 use core::{marker::PhantomData, ptr};
 
-#[cfg(CONFIG_PRINTK)]
-use crate::c_str;
 use crate::str::CStrExt as _;
 
 /// A reference-counted device.
@@ -198,7 +196,7 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
             bindings::_dev_printk(
                 klevel.as_ptr().cast::<crate::ffi::c_char>(),
                 self.as_raw(),
-                c_str!("%pA").as_char_ptr(),
+                c"%pA".as_char_ptr(),
                 core::ptr::from_ref(&msg).cast::<crate::ffi::c_void>(),
             )
         };

-- 
2.50.0

