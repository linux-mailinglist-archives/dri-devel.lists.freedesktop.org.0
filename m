Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C091AAFF23F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 22:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2716210E840;
	Wed,  9 Jul 2025 20:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eXYTcdf0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5218C10E834;
 Wed,  9 Jul 2025 20:00:09 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-4a44e94f0b0so3817911cf.1; 
 Wed, 09 Jul 2025 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091208; x=1752696008; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=I8SYbkq24HYI/QL2FTeNupi8GxAZULeQ0HmG/pWS2Zk=;
 b=eXYTcdf0flmxZ8akL9BDMxSqftgegh29pSXV62wuD88TwbpbjQ31PQq8hHkjCYaeeh
 l8EkCrrd7RztzY2lER19PLSVMEUjqXwyKEz1eC3c+vekdA+V8h7wQFJl5jiLACOeVr9h
 S1DGspUtFQLySmMo6hmSCqbsETsDQKgr5ZkKlzT/8diPu+Gglk/m2/3iFDdzn7PVP5z1
 hw/dOlmQcTVrHhGw/mWgKPS5ls+k1YXYccRu0fm3W8+s94qWjJ2U1g710cqu2hos7ccr
 fPReGoDqZ9O9vlWcI0MPm+5+Yox4oYPpMv5cUU3bXbl1BgRRvepsCIRPHMxbevd0T4TM
 S9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091208; x=1752696008;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I8SYbkq24HYI/QL2FTeNupi8GxAZULeQ0HmG/pWS2Zk=;
 b=g4Vft87Y6tj2/xAjoT4QZ5J//1YcNBu7Q8L9SIfcJEYFYDX9BzkviAiYfWZEx9z/F9
 9ZGqLI8YRhi9l3to2lOefQUFpbyDXauwjPgzaNwjxsOxH7OmhmRcD6Fzqf2qGz5OLlh1
 v1xgBh7uDwAfa93voh44Cb+2IRRFfajFd9OGKHg46N7GjdEAGqO19BRQEBY6KtZsiXxq
 VmdKMLdXcMzpEvm5v24AGykGh9yJeB8kJ4FCB6+NlDcOaqB7rXxdjZXSyQnBKuOVXfjw
 STzGe+DLQtBOheTWoPlY82DcBoQe7ymxOgD9qbgTZcj5Lfnd4FxtNG7ns7MNn1eLuKBK
 ZSdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNT3sTgaUEahCCdt5Gklms5QuMj+6saHs9OAElSX/UIxabGyN6IUXCmFkO45vdDRAlOpxKx2M24yA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUe+Brk7Nh7LAaw++rvN3aC4hRI/FZRT/cB69XoA+3P4GmfcxI
 glHgIy2rIZauZuvqXh2dmKnpeQNWwLsXgIcGV58djwObXhhZ4OHIW3EX
X-Gm-Gg: ASbGncty/hhqFc2Uy0b5Q1iWbzMK+xQUkue/Yot1uxoZsNGfCDKyMFSlcAWqQdPkaW1
 glfxI+QXBLHL+P5f2ss16f6hJHLmU//OVr3CeX+UBjrK59m+LduO2ySFZZu+X2Ol37gKLFuzSUO
 4A7tTCSEYj0k8yl5KYZFugGMhUnyWFwL1syet9FvnzPNJEcPSjBNZeCGMQGmEb+c/9enV+EtOCB
 LQMWdMTetMrmIuDDoLa+aRovXQKpuv+7UARJlfYVIAOEYoQCbzNko0I7vECpU53+VTfkolcjRcG
 irQudn4X9e/3kBkNLLZMkgzNo0Xxf7bd3atbXLOBkZT4JYxeBFD9hkKRexrQMily+EXXiaBGgvn
 +RnPwieKs+rpLIJApUxIc0DdUKJ1jizcIdE2ueYmubGSAwh7nx8NlB6qBNQ==
X-Google-Smtp-Source: AGHT+IGI+gwm5eTKWmm2g8ouSxtbF/xVdr+iB9m75yl89bzxojUSPP7D5dFXau22sPklx8oqNt6QXQ==
X-Received: by 2002:ac8:578c:0:b0:4a9:c2e1:8844 with SMTP id
 d75a77b69052e-4a9dec1f0bfmr46868371cf.10.1752091208084; 
 Wed, 09 Jul 2025 13:00:08 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949e4aaasm100432891cf.3.2025.07.09.13.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 13:00:07 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 16:00:00 -0400
Subject: [PATCH 1/9] gpu: nova-core: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-1-64308e7203fc@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091203; l=2067;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=pCigoXsp4LXT/GFOU7Jz2F9f5TrzOun3SN3jz9HmrL4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QK0DbMWw/E+Jo/SQJTsgBaDiYcF6u/cfsfhszo37V9mpjmfvwJr1oAexhnOQHh9LyACg7euGN+w
 Ilt9fZxU3zgs=
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
 drivers/gpu/nova-core/gpu.rs         | 3 +--
 drivers/gpu/nova-core/regs/macros.rs | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 60b86f370284..f1d72da7fddd 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,12 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
+use kernel::{device, devres::Devres, error::code::*, fmt, pci, prelude::*};
 
 use crate::driver::Bar0;
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::regs;
 use crate::util;
-use core::fmt;
 
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 6851af8b5885..759773a19480 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -106,10 +106,10 @@ macro_rules! register {
 
         // TODO: display the raw hex value, then the value of all the fields. This requires
         // matching the fields, which will complexify the syntax considerably...
-        impl ::core::fmt::Debug for $name {
-            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+        impl ::kernel::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
                 f.debug_tuple(stringify!($name))
-                    .field(&format_args!("0x{0:x}", &self.0))
+                    .field(&::kernel::prelude::fmt!("0x{0:x}", &self.0))
                     .finish()
             }
         }

-- 
2.50.0

