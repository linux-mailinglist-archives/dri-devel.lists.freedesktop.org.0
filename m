Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319D3AFF23C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 22:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8675910E834;
	Wed,  9 Jul 2025 20:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IJZan1xn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00FF10E834;
 Wed,  9 Jul 2025 20:00:10 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4a43d2d5569so4324041cf.0; 
 Wed, 09 Jul 2025 13:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091210; x=1752696010; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cVzLXa8kSNeGO3MSdRL/brp+J/B65R+0jBRIcOEDB2s=;
 b=IJZan1xnoK8ev3L5p94woVCNTbfQHGP1yijqI8/XrihyFnNWnudzWgkgsp6sHUNxxr
 ewiogQzmA3tHPEmMhBgz6/ztK/YFNtoQq0MNlNvzO63ThjdODgf0nP9UWT+vsdCMOhRT
 G9hm7BA3KU0G0Jk77g9oCW3puZ+qOEX18QLdDCTtFMdAOj0IdCAecqpJ+5X1VYPJNMWT
 VzSO9U8ABawPmTMhBa22CTIXx7+UO1AnjTOwnL7rD1eYN4Z5ZMgtTK1s9gt7F5I3OEGR
 RjeJw7EMOfAdKmkoo6eCH9P0U1MUMjDHbX9avTGTkKfQlr7LG++ZGeCrruEh+koSPkkO
 iDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091210; x=1752696010;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cVzLXa8kSNeGO3MSdRL/brp+J/B65R+0jBRIcOEDB2s=;
 b=gaF0e/xHOR/WAM84dL0UOMqNjnshpg7Wj1mg6tKJ9Eo4FMOIwTym2lp8RHvPQskodn
 PYdldohH4Z4Z6vgcrmzPN2d0m4wOTrV18b+K/Nbe5j4SFkRFe0XuXeaIvknS3K51lN5F
 pSbjUf9XGbMhCOvoQrIvHCPzJ5sHemK7AVRZGVHNHCEhWDLaB6Q7KCwscUtVXQT1hskH
 PE5Fok7Y/dtPcsjl8IELLBciZnZ4xRU/zdlQ/xPFW9kBj+k5ncR2i8Qy75muaO9dPEcZ
 5jIjLtqeBwahRK1j5TsUS6im0k809cxxnWAtMdO1Abg0YSs8Z/yDzKN0EMKCUCHMIkYy
 s0Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWzJCA0bz95EWpESpdSFJk7RzxwxZGCvm6OuKteZI+nzg8lu5XN606cqikwOyxbuH+MbDpairzUOM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9ffl5+Ccy950TO7jhS5vRyhMXTtMvXALeh+GtKQu9ZglEUzUa
 +V+LMeTxT8815rNMT4ZEajy/pmRAukmfcSkf5RkdqcC7Ov+YuhhuWLnN
X-Gm-Gg: ASbGncs1aW7Brj0ovuoxDK1yINnPGe0hdR8D7bN3fGBQwFlJm40a60ePUppmOVU8sEr
 psy95reEhDQtA4uUHy1fE7fdyf1mK3OgMD28u1oQyi5+y/WHmZ/i/gDsMpV7D6/iI68nt1cxHjL
 4eDB0lV9czHq3EKO0AHuKClNM4SA3nZrEwiUbNIF/qRchMjHOE81qNyT0HhBBSiaIitUSXJvruV
 5ZcGsgxgoehk4gm6z3A/iJOctdrTmrSu6mvikH09GKNjYDny1qvHakmobehIcG3ZpOkV74knXdR
 0VctWb8TYvzyVoYAFB3LfA+UCFvztvAMN1b6K+qVjIN6TXx7q3Ks0ooUlDdc0ftTHKscD5qP0jG
 sJi3ndHsG5O/KHvvnl4WcA0KFS3GfCpMt9k8aWEo82edtLhwky8sYDO+Mxw==
X-Google-Smtp-Source: AGHT+IGXtHAw7tU6Iy2swGDNMQZPoa2ogZIinUn8nn1RGEZpotaHpL4uCE654v9GUCOGSaI9YTFbag==
X-Received: by 2002:ac8:59cf:0:b0:4a9:91fa:7ff4 with SMTP id
 d75a77b69052e-4a9e9401dfdmr14926921cf.33.1752091209513; 
 Wed, 09 Jul 2025 13:00:09 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949e4aaasm100432891cf.3.2025.07.09.13.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 13:00:09 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 16:00:01 -0400
Subject: [PATCH 2/9] rust: alloc: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-2-64308e7203fc@gmail.com>
References: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
In-Reply-To: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Jens Axboe <axboe@kernel.dk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091203; l=1962;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=3q8XWZjySCzinOtTT6aFMskjuBTX2M/x4Doe4ersSAs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPHgX8yope2oPhej/PN7N7SAIUDyJ62uVe7A1FlJtghi0M7GvDbe+kOqnz6MGtbjArlwKEf4KPX
 SUaEPP4askAo=
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

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/alloc/kbox.rs        | 2 +-
 rust/kernel/alloc/kvec.rs        | 2 +-
 rust/kernel/alloc/kvec/errors.rs | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index ccf1df7da96c..96db3cf8d782 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -7,7 +7,6 @@
 use super::{AllocError, Allocator, Flags};
 use core::alloc::Layout;
 use core::borrow::{Borrow, BorrowMut};
-use core::fmt;
 use core::marker::PhantomData;
 use core::mem::ManuallyDrop;
 use core::mem::MaybeUninit;
@@ -16,6 +15,7 @@
 use core::ptr::NonNull;
 use core::result::Result;
 
+use crate::fmt;
 use crate::init::InPlaceInit;
 use crate::types::ForeignOwnable;
 use pin_init::{InPlaceWrite, Init, PinInit, ZeroableOption};
diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 0477041cbc03..a642bdc9cea2 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -7,8 +7,8 @@
     layout::ArrayLayout,
     AllocError, Allocator, Box, Flags,
 };
+use crate::fmt;
 use core::{
-    fmt,
     marker::PhantomData,
     mem::{ManuallyDrop, MaybeUninit},
     ops::Deref,
diff --git a/rust/kernel/alloc/kvec/errors.rs b/rust/kernel/alloc/kvec/errors.rs
index 348b8d27e102..21a920a4b09b 100644
--- a/rust/kernel/alloc/kvec/errors.rs
+++ b/rust/kernel/alloc/kvec/errors.rs
@@ -2,7 +2,7 @@
 
 //! Errors for the [`Vec`] type.
 
-use core::fmt::{self, Debug, Formatter};
+use kernel::fmt::{self, Debug, Formatter};
 use kernel::prelude::*;
 
 /// Error type for [`Vec::push_within_capacity`].

-- 
2.50.0

