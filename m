Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EFEB24DA3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA8210E749;
	Wed, 13 Aug 2025 15:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nYgUcyE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F1910E749;
 Wed, 13 Aug 2025 15:39:56 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7e1d89fcc31so662348285a.1; 
 Wed, 13 Aug 2025 08:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099595; x=1755704395; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PGoVOhy4jERd3neINn4TPM8U5EEaP5ugIKSB6mln43c=;
 b=nYgUcyE8k3AIb0zk9vcFrgrMPfA7Gh2r2NMsTK5QrCNbCqI8Gs5Sw5jiirbNHDt3LS
 w8z+MTcBiIJRwVxf3Km9mNYNXPhmGn69w85HJh9aIu7VMnGzB1zhDrDlMzDxkl1+Z+El
 3lYOIWiZHyK6VnzWTtaoWRzocw2ZEE/Fi4GTNZ419bjY7XKDyoRUuSSvkGunLMY64w0r
 A5BxcbQD7mlF6t9CPW3ub+lAzncLby0TkQ1aMnV8ifqFGRvuWsjCZvO6Jra00HDULSpv
 23lfYnaQz5pYJafTPH+hFmw/YgweUmn6qrCFsC3cdsBTGdLgPo9DWx2uvMlrG+wn1KFr
 jqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099595; x=1755704395;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PGoVOhy4jERd3neINn4TPM8U5EEaP5ugIKSB6mln43c=;
 b=lUNmqCzKFSNJq+U7YghFLqrqAejtV3RE0BJRGR1zwd1J8G3LAYX1xf80su3HkU7tf9
 coKyfSRbupMlVKEtFAdyNtKuJWWss4OHk96y8CoRpNwlDzBY7ahrb0Xg6rwdLCOSAoNV
 nYlxJ2YRPSWKwKdvDM9JBVRAGGGtkPkjqi6AkoppREgkR/76Uw0Hc9f64SqmnvUKFaWT
 Gyetn036huJmUx2y08kQacFDfvf+g7OzcxWCtyWnvtcN4Uwj+wGgznL2X0WBHe52NYeR
 +8D9hHUUvpQwB6pLKWef1GFs4VduFVBAGM1TCwKmB6zGVQV+IS4pKmyM+FLmmGhf2xzc
 Vixg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd0UBQYoI8wy3aChZNsdAEIbJYoOHFR00Lc27AjZ8fljRpW6OboXX3dE/XbD+YS5v08JQCWdWQQ80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4QLXdQf3C1P9MUnKyHY8zlRmJEDFSYp9iGx0dBZvLZZwG3gO/
 ojfpOG6OwQYo3RJzscDA/YjEfj1CrhTyYwaog4lvWGgfdu3AxtJQFR+2
X-Gm-Gg: ASbGnctDupknjYdZukrlDJOoD/lG43cHwl9ir0t/6o+21nxrZawwJX8dZWiYmKep9/1
 O2VKje649IJ/YFhwO8cisngEJB2sjI3jhvupd1b8YX6m68NCXfPWCwfrBM1KUYOIBbfq3/QVUBz
 Sf6tUzqr6At1sCC7fFJ5OXC2V91yxi/kFVCrgY/npAJsLFiYOavp99l1xm637YjwsXL0y0O/WqQ
 5E31jpP815sgn4E0wIZkEwHEHHGHXqdonvi2Mg+R83zpjFVshAnYpOhx5Si8nsVZ1hlI04cLCKT
 mizAReG/kKFCtAnPPTqYZpW0EjjzcBOsR5Ebzqvzw2mAeVzO1amT0sdoQPnBZQkOL1Z53Os4b49
 OGBRlaiIAuBuMLGePdGYwmd+q3xm+O2OiMtoSKJllETtjesrDqhzR/PbhgCBVW473pTTEgpeP8+
 /Hg1VKYenha9we4ZXAVilQFdc4TE//S0cBtw==
X-Google-Smtp-Source: AGHT+IHs0ZT7on5I9bZ1u8GrngyqrpuYHkDBkbdZIYm0MXwjYrSAWt/b+r463sWhhOCkHmkmHHChcg==
X-Received: by 2002:a05:620a:2814:b0:7e8:3324:7aff with SMTP id
 af79cd13be357-7e86520cfbbmr401368585a.9.1755099595332; 
 Wed, 13 Aug 2025 08:39:55 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e67f728a6asm1976119385a.64.2025.08.13.08.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:39:54 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:39:46 -0400
Subject: [PATCH v3 1/9] gpu: nova-core: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-1-a15eca059c51@gmail.com>
References: <20250813-core-cstr-fanout-1-v3-0-a15eca059c51@gmail.com>
In-Reply-To: <20250813-core-cstr-fanout-1-v3-0-a15eca059c51@gmail.com>
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
 Uladzislau Rezki <urezki@gmail.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099590; l=2221;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=389zTUeuB5JbibSGFWLgE7LO3s/a6burYE85gcD6ZMA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QH/OsVlm0jUqXUwZWz2BvLX/LLKHbQHM91qDOJUmbF5e65uFWklBkvH4AGdcLYQ44WEXJF4RoEQ
 Dbvzeo+QbbAo=
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
 drivers/gpu/nova-core/gpu.rs         | 3 +--
 drivers/gpu/nova-core/regs/macros.rs | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index b5c9786619a9..600cc90b5fab 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{device, devres::Devres, error::code::*, pci, prelude::*, sync::Arc};
+use kernel::{device, devres::Devres, error::code::*, fmt, pci, prelude::*, sync::Arc};
 
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
@@ -12,7 +12,6 @@
 use crate::regs;
 use crate::util;
 use crate::vbios::Vbios;
-use core::fmt;
 
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index a3e6de1779d4..6b9df4205f46 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -149,10 +149,10 @@ impl $name {
 
         // TODO[REGA]: display the raw hex value, then the value of all the fields. This requires
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
2.50.1

