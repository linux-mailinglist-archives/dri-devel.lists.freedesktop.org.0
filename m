Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D1CB9FB21
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 15:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CFF10E93F;
	Thu, 25 Sep 2025 13:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bqmPBTfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B60810E940
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 13:55:18 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-854cfde0ca2so127855485a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 06:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758808517; x=1759413317; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NYha/ksIy3nvgxYlzdJIQEddJjIGfcGOB5STOc36XYg=;
 b=bqmPBTfR8EZ8rNhQgHDPSMLks8WujIya0p+f2X1ZKwD/u/JZX+pwf4BCxlJYeBvBTB
 cIgxwGlxSDcksyMO82W3kjDNuLyCYR0GcrzH1W1xKBJBVvj0PuFEfX7PeOoVwVovsWt6
 zOqmWZxdaUdWHxbbPc1x5/tfMxnyyKeGTUzy1nVTKkHFYLRO68DD6NQBrfQP27neCKWw
 DuF5dAn81ZSg8d3OChJaZY6g+Z7GrHKX7gi4b+30Aw24hbdjfRIkHJ58Idp6eyeqcQzz
 6iNxaApXS7dpdnelkYcvUS601FDZq3YNWlnPk59CzPas7CkJINi8orFWXLa0wMIFJgnB
 8uAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808517; x=1759413317;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NYha/ksIy3nvgxYlzdJIQEddJjIGfcGOB5STOc36XYg=;
 b=CWu3LO5JVG2gWRh6a0M5/321e2TJz4G5BMfT9xZS3kx+6BgcjcwX2ceoWmDCXDOAus
 7UZh+XQVTieomVm46LwfESvKGtnU2p+Y25vZVtY96Wuq+DHSfORTF2R6TtuH0aAtqUZJ
 58RDOrwAsnaKY7ssoktqJFx256j/tbbuVBwk5aBDtGTrmJlIOjZPBA7byqPGSkWBVNfS
 Sq5JKqewMg42FtcVF2JnF4XzUeAykd0KCtf2u0P/MjRwkuni14BrkH4a+tV2PCLBrKEg
 odrwJ3cBpRmptq7DAeahAp9dZYybaBfAWUqdk3VEFXjj6/QufAqU8M8lH5/EZ3avvlHF
 ZHhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxWmydw2KKd8c8Oqb8WdPGb5bgWgKOxRLerVSVH1Dym8mkedroWZmL0lfOrlLK4ubgON0U08T9fkA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqCPGKAvFiaUOMzKdgrrXI91HScE16tK7gjA12Klf6u3S9IZO6
 DsTj3Vjym4oFT/bYmrWDZKxVw5cSLSDfsKkVKP2J5m0Cpm9YEbqjrE+6
X-Gm-Gg: ASbGncsCiqUj1s/OlzjxgsbVbTQALnF84efyzw3gnXU/nPBDWaL74UJn7YR55E/NwGD
 DV7utZmdxeOysN/RU0y4V+kPhTkWMYIMHpIU3H0jAY82ovI+lBdPtgEVxZlBHGBxkorOZnpXdRn
 VD5nV2wSWneexTj5ROXIO9ZV4WDvVhmIIsSdkqFUWEFesTUsUu4HfkjykkvI8rRCT7dq+pKbLVR
 bbqLD4KnSQGj99OXBP277LuB/ZzpX4s8cYFNKZLYmEZDaGVRI35/7hhGPjGlsmON4NN5vSAbYP8
 jMbe6/qzfDQrvCBwcZcbLaRcJ9Gpy0eq3gzZ0Ag/mR+HBQLlKL6MFrjdRk4v7yTLmiaBu/o9Pc8
 Vp8O/Vkx2f6op+nlUxJbvnowx0mqmmJPAxObkfzqCRSAbqNHcOInso/M9pooeHCnIsTCBqjkEwl
 D0w1ddRzghLUnu5Hiam6Qhcnf9J+OhKUF4Y1xtqJBLZZBMmVxoEOstniDJ78PlLdlzHLA8
X-Google-Smtp-Source: AGHT+IEZqYEZb8mISdLJuHBwRf4k0Tn3piTiphxdju20VgZskXS1fQZSSYTbb7BgZgibnFeCDmQS/g==
X-Received: by 2002:a05:6214:27cd:b0:78a:e10c:1f6a with SMTP id
 6a1803df08f44-7fc2864221fmr42029446d6.1.1758808516914; 
 Thu, 25 Sep 2025 06:55:16 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 06:55:16 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:53:58 -0400
Subject: [PATCH v2 10/19] rust: macros: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-core-cstr-cstrings-v2-10-78e0aaace1cd@gmail.com>
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
In-Reply-To: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
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
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808437; l=1049;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=zng85sA8+SsVec6zNo4TiEoP/H6f+tIcV689AAppDzE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIVNC06tKtgyxIKxAK3EObC8MiCaZE3yn180AX/LsynQ5F4vys0WrFsiwfjmzPM+0UA7iPHoZU6
 G25wrGtAh8gk=
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
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/macros/module.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 5ee54a00c0b6..8cef6cc958b5 100644
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
2.51.0

