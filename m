Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983FEB0B245
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677EB10E0FC;
	Sat, 19 Jul 2025 22:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OXX6XrgP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5D210E0FC;
 Sat, 19 Jul 2025 22:42:11 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7e34399cdb2so344319885a.3; 
 Sat, 19 Jul 2025 15:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964930; x=1753569730; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=k8zwWmF5N009AGIXlDD+XsD4K4+mEgy8HqbF8g/gLNE=;
 b=OXX6XrgPIgIBHUXqrNnzoZIFK5E73n04TVlou/FB6OUNsPVCawnUoFfNs/Fvi6UpLQ
 5WDrH13eU04HHr+2QIwJD3x4h8/9et/KAOMwbvDhG3n3CcyQ+BsYf247BuJhCQrjII4N
 64ZCt7pAEWC/rfswqCPiJQyiuhUF38zW6I3q0pwrqKcfbheG0Bp+HumybPhrBQ2HqG3z
 ZA+N4nsx7J1hw5Eb5ERRw306PtL8OVfQAZr/ceMZ7l1q+VI0A4Wj4eDrLNRYr838j2ot
 gxh/a5cX/5Lnd0BAhIQZmlEDcJankp9bASc9+q7ONGAq60BPvJlEjBtXPDqlUKtqnBb4
 lwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964930; x=1753569730;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8zwWmF5N009AGIXlDD+XsD4K4+mEgy8HqbF8g/gLNE=;
 b=QDXRIgTAMqCihI14BltIgKRrxxEMQ24AKdNwtKhi9cfYNsvvUxemAGHl0SxWDsrWEA
 XBR/ksogzW9GjPga7eGQBLQVZNXA2cQgNKOFahOpBDOhHcYsIhM4i2diilcRTAJUS/tg
 fEnUKGdmTAjgahPCdq6tY0/BUhRIr1hx+fuhG8IJVfwY8zyo6L3mqhACquUZcnVx4L4w
 CzbLorppj/csIJrgz6o2gii6QBrUHeUSw7lnF2N2GeTvLwze+dTtGPq+K3adWEaZbYPO
 n9x3tE+yoU1s365b+PfYoc5/24oLAPneshv3QQQa6qYwPvy7AqkYD04BnBCy3t8e/SCP
 Nn8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjqeEU4+ufvkh+N+RMjpavbIAylqkf2X2rqmnDc7ndWIRJ2r4AxOLavAki6tc/+Kqsna/5OG2WMJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yydnz7x53am7DmI58m8eAeasqAvAh0T52Kk8m0snd8RPIYbAXm4
 rVXCkI2X1GcS8xn8Nj7Ty2iAJmpjXmyHKynA1a0YPOFbSesVcwovSZJZ
X-Gm-Gg: ASbGncsnuOe9QHGEICdIFwe5Sy6mxBZLqKZ4tbk4/f8mh1GZFtTuGU8sB0qvduaDIhz
 UlIc5bNsvWsnvhmXB3xw9lYHQLEvorKza8q8Y/C7tkHYimfEVpnCEZyivHZX7BVNJwGXlkaWj+0
 U0e7AtzrXLZ1fcb2bQBGO2NcZs5kRL69NjHpF7fEn0nGqiYiBqrT5rGe9JeToN/XkwtgNGsXIAa
 JlMB8pu3PipAbrKZqBxwWP43Q43SIquZmTpNLxxTmDt2j2SOqZAjyC2usQbvdRMpMHOIc1xsrM1
 88Xv/DuBN9Mv5Iqm8fA/oFB2Gjxkr2cw0pZrQ8FCoE7lUzJCVfG9vHViAT+jKC4UaOW8Ffce014
 PY4R2ZOAWnvF7JjIC7QHygbSufsF00/ihYkhGn590YN1zt9edSrrGAA75hYbYcK0YyHhn7AQZjE
 /kDT+/8TX0ZQnVwrGCVzH+eZszZAHq
X-Google-Smtp-Source: AGHT+IFcM5vlTfHbMZcHG4vqLu6GDVA0CvWxAR99Lsxdw7SvuJC/8vqOcsbiSG0Ai/sIgQPyOGsC9g==
X-Received: by 2002:a05:620a:4113:b0:7e3:46da:9e2f with SMTP id
 af79cd13be357-7e346daa47bmr1530803485a.34.1752964930511; 
 Sat, 19 Jul 2025 15:42:10 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e356c75cf5sm251550785a.84.2025.07.19.15.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:09 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:41:51 -0400
Subject: [PATCH v2 2/8] rust: alloc: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-2-1ab5ba189c6e@gmail.com>
References: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
In-Reply-To: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
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
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964924; l=2090;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=PSL4iigvbqQ2ksUQBIiw94ADQQA5vnHuf37BheuwWG4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAwYmtmzbTS+G2HAZWq+qi6aK1Plu95PH7CqyAf94mKBaAcFJcRxRwncs1NkLrq9OJGSXys5/Ti
 sWn8TxIy+UgQ=
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
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/alloc/kbox.rs        | 2 +-
 rust/kernel/alloc/kvec.rs        | 2 +-
 rust/kernel/alloc/kvec/errors.rs | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index 856d05aa60f1..563187d09a8e 100644
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
@@ -17,6 +16,7 @@
 use core::result::Result;
 
 use crate::ffi::c_void;
+use crate::fmt;
 use crate::init::InPlaceInit;
 use crate::types::ForeignOwnable;
 use pin_init::{InPlaceWrite, Init, PinInit, ZeroableOption};
diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 3c72e0bdddb8..4a1b2c26209a 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -7,9 +7,9 @@
     layout::ArrayLayout,
     AllocError, Allocator, Box, Flags,
 };
+use crate::fmt;
 use core::{
     borrow::{Borrow, BorrowMut},
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
2.50.1

