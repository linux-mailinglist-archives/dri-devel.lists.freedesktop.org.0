Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985D4B24DB5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EB910E75B;
	Wed, 13 Aug 2025 15:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NYXeZ5Kh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC65010E759
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 15:42:04 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7e817450f7eso679177885a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099724; x=1755704524; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Hp+fCas9Zrtl4wezHGHT/3mKuibllRBTEu6ZN90ulnU=;
 b=NYXeZ5KhzaNLoKoo+Xqi8P7KtixtkJUArPYV46UbyZJ96tgTQiQPdyrTzDIBXO7lm/
 MwVLPhZ+lg+Fu7/pHvbHd4iMSt2aNzAtK5DY/4lcb9R8ENBDVpupbZSz8FElg61L58Bn
 mAU0LKY3lkiTT7y8U47Rf86Xt9ro4ild04TOY+OeqaSX3r9mV+seImb6PZy/1dspWvR3
 ok9rva+iJASYGVXUtENkTetltORoss1B2VtPUA1xiZqiLAgEc0qdDrY3TlG3UT7CH0jZ
 EVYuP9CQh3eQ94L87NpOcIEcshjxOJvh7PnCGj6rN1QFkO8bfCqrMJ484TYq35q33kU7
 A5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099724; x=1755704524;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hp+fCas9Zrtl4wezHGHT/3mKuibllRBTEu6ZN90ulnU=;
 b=kxoOZC4/flc4/Fixdt5juZDrPb2rxN9FMh0bp3utl2h4dpeybkjQhby5aDiymnnA8E
 hmm2aNwja1Yn7eXH7Xi8Sd4Ve7op6FjjM6LK6W8mRy3Op1S1WvkbhbLZz5h5VNddVCLM
 zdTMF9rZ19FmeiS7Ni9/8pEfodaYKPb/ZqhgyOSV7MoOj3Bg5E+WMdan4b5pOLVSPuC7
 DdCcitcgk28ENo8TO0fVTr5+YAFgSntlvVy4I4PK68UNuufLtN9E6U/CWeovOm6UzMHL
 CBag4mEWUV81YbhN0xJYJgsQ5wt9G7GTrXAAD1ZZ7HDJlqspw0TwJl3zhXKNtNP7oy4W
 DbPQ==
X-Gm-Message-State: AOJu0YxIFgl4QemCKRNCbYnA+mLMnvqCvm1Th/nTiFZMc6JP0eby9ozX
 RYsZguLWtTIlvyc33kXYLPf/JX1+R3msh+z+2jH15kn97jQ91zuybXou
X-Gm-Gg: ASbGncvvOAuHq931K4klbEUzrcvFLDqejSeTTw1xSFVf9P25UYGY+YUrj8hLMr99HwM
 y4PlidXPEgAX6eQ5sPWZpR92M+5gdAHie6EVz+eCKw83GUcOMgQD2sp6e5yagpJKo7cof6q0imm
 +ISxHL1U6GSH+6e/mPH6fPplOeBrlNkAQQVVYt3D95pGJlmVnofKSNOAAs/rqEEUqYBgBoGDvTs
 6kEUIvO7zSVmqb4yxfWeawrw/hFyVy6Gxdqja9q2O2OQP3gkcDGiQwWzdo+s7l71xQQL6vKCKwh
 KLwbvPRQpLCoTNivxhtYL0RCUY0arjatIk9+30mzN/iDub8XIJjBh7PKNxNX8pRME7Fd2SzPkp0
 hK08u6qzYeyT28TV87N6snuQ+hFrXaEw3DVKdaubfB8+6OKz16wZQnK8Ut7lN/F8r3Y7/pJKC5O
 ZcbBwoFps3H3qDsYrIsiCIwOESmKTRzKGsBA==
X-Google-Smtp-Source: AGHT+IH3Gyl1PAf9LZipxoIqItiIsX5gN76gMdGUlBsOjA++2YXjpKyARkzqrf4A5usSLWq1CNBAvw==
X-Received: by 2002:a05:620a:484e:b0:7e6:9c12:f0ce with SMTP id
 af79cd13be357-7e86537b611mr412290785a.66.1755099723511; 
 Wed, 13 Aug 2025 08:42:03 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e81bc7a1e3sm1180019685a.74.2025.08.13.08.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:42:02 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:41:53 -0400
Subject: [PATCH v3 02/11] rust: auxiliary: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-2-545c14bc44ff@gmail.com>
References: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
In-Reply-To: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Arnd Bergmann <arnd@arndb.de>, Len Brown <lenb@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-acpi@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099715; l=1235;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=fm0qgPhMLwhXVUuwviW+AbdgNwUfh/gp/dzymaCtTqo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNI3dWTWVNva1ClYJUkm/ax4LvCecBNot1IU85Wq7cotQ2nzszw6MVgFO7DYjRRwPjXruczaFwK
 yVy6EkaASMgM=
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

Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
avoid methods that only exist on the latter.

Link: https://github.com/Rust-for-Linux/linux/issues/1075
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/auxiliary.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 4749fb6bffef..58be09871397 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -105,8 +105,8 @@ macro_rules! module_auxiliary_driver {
 impl DeviceId {
     /// Create a new [`DeviceId`] from name.
     pub const fn new(modname: &'static CStr, name: &'static CStr) -> Self {
-        let name = name.as_bytes_with_nul();
-        let modname = modname.as_bytes_with_nul();
+        let name = name.to_bytes_with_nul();
+        let modname = modname.to_bytes_with_nul();
 
         // TODO: Replace with `bindings::auxiliary_device_id::default()` once stabilized for
         // `const`.

-- 
2.50.1

