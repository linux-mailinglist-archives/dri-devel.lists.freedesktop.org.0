Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA675BED60A
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 19:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD9E10E146;
	Sat, 18 Oct 2025 17:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zh++Uz9o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8712D10E128
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 17:45:54 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-87c1ceac7d7so43052246d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760809553; x=1761414353; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rhXSu5jvbOALYGh18N5SGleu51uu827FBi1PfdDv9uw=;
 b=Zh++Uz9orEOEj04sTJcg5JgI3XnkSoasuE9VkcM8J1NXhAS0G4klWW2f6GTjVDtLBy
 UwfHa0GoMWw5qT8+zsKow/hWJZ6a8Uiy9ZUnAI4rLcw6jgax4cT6V0zYXzdGF4GpLjvd
 WV1rYk4z114JGQijw3QLPRczXmjbgAvrycRjoI8f6/rFE2LR4lEfYRvgDtRTaiuFiNf7
 dncID0E5iaraMt0nNBKc1inLPXD9FXnkTq8faQSdzkiTckZsxDM4IpGCYF0OGkUez2LQ
 +kE9aKF8MGisvURBXRxggvWBUm7jB6opQ5UjfVgtoxFUZAm4Ht/xI9PzTwsMO6dEfxUT
 pACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760809553; x=1761414353;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rhXSu5jvbOALYGh18N5SGleu51uu827FBi1PfdDv9uw=;
 b=g/DXIR3QO7sbYPLZDJE+09pUk41p4x+n4fOj91usxTGBfB/dIav7K+AzfQ218h/hv4
 ROESXCjZuH8WwtCzq5T4kr/RMTtfu7DKiBMpsAXZ88PyJQYAyqivPal3OaQ04RGO1cjD
 dCdJbvFfcHeRGoN4ek48XjubmRVs/AL6pkVcw5rf8fPlvBt32puwV6XFoAopMVKoAlw2
 FZ4vn8K3OSn0cSpC1N6gKxw4OW6KbEgXrRGtgZyTD7E0cAQVBq/1MDnfhAP3tuIuvxLJ
 fOmkUS8yjtqonpL8s0WzaUTDnSMVM/mzZ3xwrQ+xDTg8YL61W3zLIQXa6kL4Oadm7w3/
 dysg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULRVWJqyCGu75h1pzqrPlUCW0Keg2xGa+fLP9padE4nI3crvtiWLF55Ja5CoiGnxG0WymkzOaUMaE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziRQe7wqXJMv2A3kPplk0XczcMCNWpz7LDLSrzlZq0HOjIfIE1
 T28KP2030fZJ42q1qfIZxyXGDBj1Cv2uNmo1ihBZnn3JJcjvoBHrCcB1
X-Gm-Gg: ASbGncvErAATd6/+hasACfB2oa+ryG8n9khcgfO21U6cUaprCza+NSbXA9ef7eZAqi1
 rqQDcYnNM05ZOhZEcYY2kXIiKVPvUVCzwGRbLyRIxuY2LjZ4TDHktywh7TccRbqiFTmAhhxOqAj
 I4ODHPtd46aDE2W0ICOgjvgV/7lzkXqsJrwXiJfCOLPvi9XnwxY6Hz7mF9xoO5V2RB/hicU0b/B
 K4Fp729ihbYQIA9xcnS4ZzESbk/rfCcenXg/MPAqiRnXYdzJ1w8QMpQgKmrfzNt1LVvi7L4M46q
 QAy+yFzq/92as05b7XtOqbheNCMAMqjRATKwj+jn6ocghK1LjjoU8C1+LX1kmcZ3telYlIBSovB
 qrnNzUj/auTA8Qrir429N+il+k2AAJjftN/izRlegHeAF2EewOY3QibF6XQeB+Yh7/esQLlRMbk
 UnvvJXTgjMaJjfENoB75AO8peBFmi6+bDhTWksxJCwK/XUMmrWpDNG3tYDXrhLgtRwxRHjqX5Jc
 IEHaLLlYZ1isS+fOsPkPsHAfcmCwV+sJqqT7W4WqISOrftBYJ+Y
X-Google-Smtp-Source: AGHT+IHwmbCilEbE3X/epDbrG5LC82vpTK8X6AnN2QSsDBY9zv0L0DqM69lN1FMFmljkUNXxkq4AOQ==
X-Received: by 2002:ac8:7dd4:0:b0:4e8:96ab:da8b with SMTP id
 d75a77b69052e-4e89d283014mr129620021cf.23.1760809553435; 
 Sat, 18 Oct 2025 10:45:53 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 10:45:52 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:17 -0400
Subject: [PATCH v18 06/16] rust: alloc: use `kernel::fmt`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-6-ef3d02760804@gmail.com>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809527; l=2039;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=VZx3xyzuE8sdJWwvMWeYLSbsWBC7U7VUNVHO5x1zs/Y=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPuKAuVf9GfET2NKL0q4bp4Tc3Ay6O1rJo/qozL6xioRoXG7kz7tkE7k1hDE/ytV5U50M81wQNc
 BkpwRYc3KSAs=
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

This backslid in commit 9def0d0a2a1c ("rust: alloc: add
Vec::push_within_capacity").

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/alloc/kvec/errors.rs | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/alloc/kvec/errors.rs b/rust/kernel/alloc/kvec/errors.rs
index 21a920a4b09b..e7de5049ee47 100644
--- a/rust/kernel/alloc/kvec/errors.rs
+++ b/rust/kernel/alloc/kvec/errors.rs
@@ -2,14 +2,14 @@
 
 //! Errors for the [`Vec`] type.
 
-use kernel::fmt::{self, Debug, Formatter};
+use kernel::fmt;
 use kernel::prelude::*;
 
 /// Error type for [`Vec::push_within_capacity`].
 pub struct PushError<T>(pub T);
 
-impl<T> Debug for PushError<T> {
-    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
+impl<T> fmt::Debug for PushError<T> {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(f, "Not enough capacity")
     }
 }
@@ -25,8 +25,8 @@ fn from(_: PushError<T>) -> Error {
 /// Error type for [`Vec::remove`].
 pub struct RemoveError;
 
-impl Debug for RemoveError {
-    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
+impl fmt::Debug for RemoveError {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(f, "Index out of bounds")
     }
 }
@@ -45,8 +45,8 @@ pub enum InsertError<T> {
     OutOfCapacity(T),
 }
 
-impl<T> Debug for InsertError<T> {
-    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
+impl<T> fmt::Debug for InsertError<T> {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         match self {
             InsertError::IndexOutOfBounds(_) => write!(f, "Index out of bounds"),
             InsertError::OutOfCapacity(_) => write!(f, "Not enough capacity"),

-- 
2.51.1

