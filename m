Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E357B006CA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B8210E90A;
	Thu, 10 Jul 2025 15:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S+LvyC1B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F283D10E90E;
 Thu, 10 Jul 2025 15:32:05 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6f8aa9e6ffdso9228966d6.3; 
 Thu, 10 Jul 2025 08:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752161525; x=1752766325; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eAjg0ZV0+LQF8h7dWz/4RhRbIfQ28PSCjaiFK3RId/4=;
 b=S+LvyC1B5SccHrUilwh/lHVWCL/2mXw2Hn+/fxwX3rZhkORW1phEYVBZvHs1fcVWPf
 R65DUHM/+NMEkRaId7X6AorBqwL8Y1k7GuRWR4o5Q4NZy4NeK8kmldHkb4FTnoZHSRAE
 jiY5D9h0mUZy8tD8S+Q7+/5UThZfk0gp4Jm9A8gDO+caR6BQACObZEE9PnNwdcN/KCZh
 2Cg7QKpCmzk9+9qNFPWSn8EWOjSNnBdQmTPKmqyD8+lqYH3dvkkcxV4jRyd49p8KuiXa
 311c23tGmAnMa+O4JXMr6uEeNR4BeaRSGNNwy47ZUX5SwUJwAc82Ah6SCkJ4IqOqd9jd
 jMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752161525; x=1752766325;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eAjg0ZV0+LQF8h7dWz/4RhRbIfQ28PSCjaiFK3RId/4=;
 b=b7Y7ewy2A7fkEcgTCLpbsrtVuPJAeBUazHs0RUx59/0PPLL66NHFNJFhx7A+L/2fp2
 FNwFKbjMiKdu6ukjQ5MSBI9Dwp1vG6ncXebl3xjOalavII13x8w6FQ8N0uEJdGoDSRxS
 bpWIzIY4SexkIjLJo5e9SazMYIEgsDNtqt44tVeXnTKvnT5stZNRytp1NwTkkv3AZKo9
 K1O4MtqxuI/qfp7nqvitrq8/qTLA04dVyfgTUr5Q8rD9Wt6pShrTNv+Ja00ttsDeV8FQ
 pv2aEY4Zu6xuc8wVbKCfLG7rKGhyWH2RfPhYi3jIjSc1iZj+tfAL4NVJnYXuLfln50EE
 o1iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5hYvazRy+YJpMyf66eUyMhpC6HRjSL+8B6V8I6/bvH5u3bkBckHWSAjx+M2XLZbXKiFJVotal5g==@lists.freedesktop.org,
 AJvYcCWbvLudk/rBJQnfynxFCFMGUWu5p3rGdNIF8Z42kx70VHidEePaezTmsOJcGRq/Fo2OD8ZdmRsiIHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzxt6Rt58lNFXvXDUbqKg/s4YrM2WMQhbeRntKADN1CPTsTYfhW
 s3QLuXkGi1DxyiXys6n9AiK5y4cpEb7MWZNktG8ZeCMtecM9AefhDfqG
X-Gm-Gg: ASbGncsJIMOejSHKMhrnQvjaeN2Ou1xUm/GgLIDy5Mg7eyhLtzxvKabN8PC9I/PkORn
 8RRe3jgmVBS4ol4NIfCb+u50d11Qabov7jKj8Agcq1qBtNbpAqaeghuPV3n5Ui5+4fB3gp2vZIB
 25tYzdo+HGP7iT3cdNmJO0QvNL1BLJhSLWwkTI5L+X2bp8/SBZ2IQxw+d6RN2f5+IvdqrxynZVr
 bjpbbPrB35WhrxE5Vn/5A+wPROr9K1Fgn2SK+NTv02iH9RF1AKw2b7W5vw6m7O0XJYKOttQE806
 E53faZwCpJGUp0yN/4H+kTZF7Lz93ysEpmugmjUBnEHLvm7JgBCG8f/931aSdK2DTy3nXssdQYs
 ONftMMv6RTjKSDWB6W2E2JvNKVv7JxF2yclv6g6HUStzIaKVrywuEY5y5kQ==
X-Google-Smtp-Source: AGHT+IHa6QfTTxtysiSDzhEZvT6ceVeIez49OGRLLuuePcNYfbMj3bkmBsvuO2geaZw6Uk2BToW7lA==
X-Received: by 2002:ad4:5608:0:b0:704:9275:a7c7 with SMTP id
 6a1803df08f44-7049275a7d7mr44810926d6.2.1752161524949; 
 Thu, 10 Jul 2025 08:32:04 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-704979dbc3asm9449496d6.38.2025.07.10.08.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:32:04 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 10 Jul 2025 11:31:18 -0400
Subject: [PATCH 15/17] rust: seq_file: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-core-cstr-cstrings-v1-15-027420ea799e@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752161490; l=1281;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=oWfPD9SZ2WRxhFsnid53HSH+eaDtp4ct8AP6223uNWU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFNv2Kh23FtytsmiZFEP5IAXsVFrrWde3HmnmKMIPax0OI3s+QHLlwEHNMx8/NtqTIKC1Y9eoLt
 QxveS62SAaQY=
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
 rust/kernel/seq_file.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
index 855e533813a6..518265558d66 100644
--- a/rust/kernel/seq_file.rs
+++ b/rust/kernel/seq_file.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/linux/seq_file.h`](srctree/include/linux/seq_file.h)
 
-use crate::{bindings, c_str, fmt, str::CStrExt as _, types::NotThreadSafe, types::Opaque};
+use crate::{bindings, fmt, str::CStrExt as _, types::NotThreadSafe, types::Opaque};
 
 /// A utility for generating the contents of a seq file.
 #[repr(transparent)]
@@ -36,7 +36,7 @@ pub fn call_printf(&self, args: fmt::Arguments<'_>) {
         unsafe {
             bindings::seq_printf(
                 self.inner.get(),
-                c_str!("%pA").as_char_ptr(),
+                c"%pA".as_char_ptr(),
                 core::ptr::from_ref(&args).cast::<crate::ffi::c_void>(),
             );
         }

-- 
2.50.0

