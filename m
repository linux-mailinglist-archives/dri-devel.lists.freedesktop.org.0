Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AECB24E80
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74AD10E770;
	Wed, 13 Aug 2025 15:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GlHw8qSw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A85710E774;
 Wed, 13 Aug 2025 15:59:56 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4b109bd8b09so273331cf.2; 
 Wed, 13 Aug 2025 08:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755100795; x=1755705595; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=g4l8i2sEeNyD3uPILdjK+jaPwYgeKMm+ZntjpvS529I=;
 b=GlHw8qSw+uv0SwTjKALu54F9leQUOIVghTUSc/YOUm+pYdfxZ/0Q41aakf7D7+SvaH
 utG0y6Dxik8OHUFI0aWLbcMEXXoyVl/cahRXGXPFcT64pgFdcf0CSTTrRGSBV+OIAqhI
 vcApYN3tUz3JeXhhSkkVS/glW760rDBsEr1sxLt5uUfuu6uLrxdmseRG38jls8ZFTO8n
 uAN/Of1tqzCJES5cD64dW3dW0FEp+HXgQA+jvcGu6zF74lhzzGpbo9LPd4BMtpOx9fSs
 j2z4YzwGALjp7qh3+KSsWDZPaoGF8UVl8dAnD5F9I/vesKZh6MS7eMMo3OrLzkyZE75a
 SxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100795; x=1755705595;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g4l8i2sEeNyD3uPILdjK+jaPwYgeKMm+ZntjpvS529I=;
 b=Z5jqGLJWReUzrCdAEtFxOrgejQ5NbEpBKJh20MCGVztTZ2kPyGO3wZzwSDDj4CX02n
 B0xieKsQSM0TjZT61yJK42XN6v66y8jUJU5DYVVDRaBRg4A422uPXHO+WIJvZe5Eq3JH
 M3o5xtPXibLFOC8IPT3mFkjQtDVK2ye1wM/VhyMWdAT8Ynba+pTppZDBYdPiGF3BZ1/z
 MWiFuqS2zqR4qCPMRCaCy5lKateyzNeSIcE50GzKocSJTtyKP2LCiZKuK+g03zgBKK5u
 7qlBuWy85VRbLENItC31bsdl21+MnrcnjLIJN7dxO2azfm6RnawXMThIhNniZmDxfso1
 aZrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTP50VBaghdGJCnjEm8W517ACNTkqik9ImlvgA8OEhnFUn01wxNM/nZahZoel+itcbFIbI/6dtwCw=@lists.freedesktop.org,
 AJvYcCV25YnSz6URavIrOHVE33m9x9KMRMhPWDHzredMHX1EkzbP+iigRp6zmrBq2ZN3qV7EEDtQZvgLfQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHHWBQtiaE27RbQYD8D0FF09w8X2o7D1rAXQskLZ2dOTq+O3gf
 5ba1oW88n4ImjE7S4XHFhIepUo7IXGiijWokGcxc8rZw+qwzXGJawR1B
X-Gm-Gg: ASbGncuY7tQPmTN7pSfPwxZC7Ih2qPA3fHSOMttjVRg4W0tfYj+dKv1k/kfM3oBOhkV
 JZH4jgShxCBAybwvBNcTz7Cct/CKo/su/Y0pXLrrzoRVXGTTsmvpq703rF1lgd97QqDD3u+L/aF
 SiAxPEVtNRw03IlxhTGfTSjVgtJsDRHhnZV06PmvyU9NDGs4RMVbAGnfQMISpbwu56WtpkxpgtF
 m6ORqHP1yE4FR7tvWCKxy5LUmt8ii7EU4lePjHRwjbxGBK868O1nbiVwAXKcOeUloCsErJGuSX7
 IVYuOZPSHJeBWM2i3xutataAupaa70RY4+XjGE+J+bQtE8wICgaRg6b78jVsf3StnB34m3R3bdB
 pFbbPZQaNAmIjM2oniP9NgrwiM4tq9Ea62SeB4DQg4EuBAdILPxW7fUftldgwaN3Bz8xI91Jw/G
 FvVcBRR/BBskxcS/HHA3AQyOew9dCmb8aGTek45gk=
X-Google-Smtp-Source: AGHT+IE9yYjN8Lj7sjrBb5G5y7e+9Lkv3po6+5dMllJMdJnuYbEDB7N8jixA+pC4n6efn+2e5Jn5CQ==
X-Received: by 2002:a05:622a:5986:b0:4b0:89c2:68fe with SMTP id
 d75a77b69052e-4b0fc8b7decmr54119151cf.52.1755100794976; 
 Wed, 13 Aug 2025 08:59:54 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b085ad7d08sm124482211cf.53.2025.08.13.08.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:59:54 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:59:20 -0400
Subject: [PATCH v2 10/19] rust: macros: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-cstrings-v2-10-00be80fc541b@gmail.com>
References: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
In-Reply-To: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755100760; l=1049;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=aFmL2NR8fBnSS0Eo3JlIIR2kUEbvCMcpyoIscPmgPvI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIIKVbMeN5Cnbru1lYfayjvN18lKhXLa6k9p0y4VX9OuLzFcCKlTUNU/VwLz/Ibsog4LzZdADpB
 02WR8TJkCYgI=
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
2.50.1

