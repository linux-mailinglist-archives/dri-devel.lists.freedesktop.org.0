Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A27A0B006C1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0474F10E908;
	Thu, 10 Jul 2025 15:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IsGA1VQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D7510E908;
 Thu, 10 Jul 2025 15:31:55 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6fafb6899c2so11251996d6.0; 
 Thu, 10 Jul 2025 08:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752161515; x=1752766315; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WhrV3vZWuhikKaFejaIZB2VhRDh4d1+RSI3qAol7Dtw=;
 b=IsGA1VQ1tVKIOSAzY2gBYEkxDeaLhufJOU5uB/qYwcEMk3l71Q9ZoTJd1mA+ZJvDBa
 I14XKYTCnkA0WOz1cxEekc40X4VEKPLoBfs9QbACZx5Mzsb+1D5LIJtBGNqpXKWib9lp
 Ge31VvTTc3Qu2jVzyXLK6GDV5gwCeUbyR8ualEDIg9sIwOxaRkllHDtJgP71gJTi2kcf
 ggkzcElUT0QZ8rtx7pjZ4sAAo5JMsBg4tJSIi5+jIlWc5SoIxSP6mUloAlMnFFweGgxi
 uEYlQcmzI5fij9Ng0fOpwuTnnhNQsuEgPbKI8eJJLNscLdOqRVJQqJDcdL71eSorOeXL
 MScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752161515; x=1752766315;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WhrV3vZWuhikKaFejaIZB2VhRDh4d1+RSI3qAol7Dtw=;
 b=Flgs1+RUHwO0o7R2vYmjDpREgZrPq/vH8Jxhw6X4oxRLhMEegWe/o8Kmm+uwQO/Vqg
 kEBCzJpjG9d84EtoOZePGVyIhZ/LcdgBGMf5J7IXyDQlf3A3xqwci8eBeVGhftQOv0Sm
 5IRl/EPIi1alTU0sQ19P4mGF+E/Cgcc05g5LVWormWEHDJNsVhP1A0vlAUuEQr0azgva
 /44drl8wISXLYn2A+yBXK15oGTnNnUuFmc1RoHY4b7Z84Hj4jtG9PEc8qgCe3Jueouhu
 gAQq/ces5f1GxBgMYprHnbB0fJGxkuxFKMb8DJtUnz4kEbmSY7PB8MvDjNNVD2tH5rrG
 IcyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMML/dtzAhsJFZLHXTLCHsoia6HF3EWTE602fVImYJoyAj7mI50MWsf0+0ovhA5lS/X+LQnL9TVg==@lists.freedesktop.org,
 AJvYcCXgcWATtfzghD/8gE5/EDT1hkv+BFY+3vrpA0/opp0sEDWJpTdDk0OxfrurCWB32m0w6DHsf+lnHXc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKCbS9v8StQtKeTfp+lTgCnW/Z9aywjJf+myEhomt3ELxCw1Po
 gtZ3SPBaQjvYE5ihKSE8gM7vZOVk1LGn88SQRUaSRjQ8DuAz6RZEIeYJ
X-Gm-Gg: ASbGncvXxFARRyitOmm+P13VGf5VGi7quzhM3axVQ71iPsm5N9kA/6HpetGBUAalUiW
 Pgma1Mnlmxiz4+v/ozBZ96943sC2ZUO4ZdQ2roA99tRBeUv7Gp4Q/H7b+nUG+t9KU2tNzOk35mX
 PflfRHPlnphjsWT1vZD1FqJT6dexj1t/F9EQJWEV4BSVQLLeT3RtAA5At5F5kC8SskTZauOBqJK
 bjQcsr5lyFnlp5M9GacOInq5Yw4JRnOZ0j712fRJzWbyLJClfY4rzycugj4iBmYGVSDr4veTHHf
 v26F15qnLMG3XdCYpebOCJ177VtJYVK3fPB/nUNVLWvOgvPa4kQCwh5aoq0NxoOdM5eLrXR3F5+
 ih0QAKg13W4LgP4jSHRqdANh4VHBxBh3qoNoU/8/vcaiWukp/FCo0uuZXhA==
X-Google-Smtp-Source: AGHT+IEw13HodLomzFs84mjDGVe/DxIwgY+6Bt92at/u/VVMJbnCgIFImh0JWt602UotdmNBzfqpDg==
X-Received: by 2002:a05:6214:2a8b:b0:702:cf15:686a with SMTP id
 6a1803df08f44-70495a2b055mr54603066d6.3.1752161514460; 
 Thu, 10 Jul 2025 08:31:54 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-704979dbc3asm9449496d6.38.2025.07.10.08.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:31:53 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 10 Jul 2025 11:31:13 -0400
Subject: [PATCH 10/17] rust: macros: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-core-cstr-cstrings-v1-10-027420ea799e@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752161490; l=1002;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=B0KEkllv4KLqzgncCGypsjEUbt1Q46eDNieIWc4/B+E=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCK05p8xNa3LGaXJc6O6PPvN7xhvmquzms/X5YPBQsJOGR8HkhPuMGHlIcvfVVrrU8WqBLJgnYV
 mMhn0UT3LHAw=
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
 rust/macros/module.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 5dd276a2e5cb..532342a38b6f 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -228,7 +228,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             type LocalModule = {type_};
 
             impl ::kernel::ModuleMetadata for {type_} {{
-                const NAME: &'static ::kernel::str::CStr = ::kernel::c_str!(\"{name}\");
+                const NAME: &'static ::kernel::str::CStr = c\"{name}\";
             }}
 
             // Double nested modules, since then nobody can access the public items inside.

-- 
2.50.0

