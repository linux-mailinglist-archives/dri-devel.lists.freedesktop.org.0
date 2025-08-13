Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D720DB24DA6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C9710E751;
	Wed, 13 Aug 2025 15:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EoXKxK3H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD36810E74E;
 Wed, 13 Aug 2025 15:40:00 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7e182e4171bso810189285a.3; 
 Wed, 13 Aug 2025 08:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099600; x=1755704400; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EoILmxC+s8qjLUlPIig2YwOCGBuLO0IARaqVpLKdXqs=;
 b=EoXKxK3HUfNx2w92VKpttPc3f/UvVxnual8IxBduI6gz6DsllCM9OQkxk79YsHbXYE
 b47MQK9tEgN6sRmwCorxLHgVXB40alcQQTOhT6cZzYN1qOVUnsV+dFtjaIbnOS63xybs
 nNQV2BQmgInQobIwY+g2CYutp1tr2qU3EuSSO9V9+Z9Jno3at2RcpZUoufL34K5j2SOh
 v4X4dhbHWvseNhY/4TVsl7jd2UGB2o49PFN8QrOJNWJ14zaiYhIV1SIrKl3twNxg7WeY
 gG1SgT3Pbs/QBRsN+KgsnyOzeSA7ZTT9e2cw5WyxFf9VKMEu9Ft3ag6nhppzOvYVneUP
 glng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099600; x=1755704400;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EoILmxC+s8qjLUlPIig2YwOCGBuLO0IARaqVpLKdXqs=;
 b=J9WKNx5eJTKjU7kWjQqOcyUcvddUHVMtCzdiFAmAbHW5kCSYMY/B6sXzc21AFWrS8j
 x37tWeC5Ff1tG1+vPBy3VJOOxUhU9lLn9Fw9gxSg9GqFd2trgP19juvw4XxPbRWDTqpm
 gnBRpHN77DQnvvlgEIINMr01s9YUNYy5rysw4s3uvVUkJ+4YXdlMKHphqUiAj6zdS0ca
 QVlv6bUEoVuqCmCl7iJcIwMfaq/IrgY0062TuRONpeGsAu9RYFUugR6fgzaB3L/41UB1
 XWLGyUkJr2GswIfbZwd2tkeKiSDvlXdym3WkvOY2ElHzYzGEbl/LMtQf1GW7ncIYSJgW
 q3NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEnnlFJWwl0+wVsm4JyRoa6KgDUR3WPelOClCnrbcBGM7L5+DLov3QAPkUs4UrzUN6UAsA//PcsMs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFOXo5ObHIbvu2fp0ZzY5ee6o7nm5RUrelrBWD5tAKX5wUbgFI
 w+Ng3eosTJe3kZStBL55xNoDtij6BudOjMdFJP506ouWImX4eb7amWQS
X-Gm-Gg: ASbGnctr3ag0LTbd6B9jqGADqknfezXRc0wgEZqEEdj66vZPTpBceacnn1lo72nx0S7
 6DQHoHyjt61Kwqv3BqQMbHN3suMHePhjRXKX+/xgcJMdhFWq17jydGrM2ndB2lp95V22IBH/kOa
 e/bvsiR7R25JOWcfxRtqrjdknLy0KNSbkvt8Uo0tr++K7GnsYyb2HelMQAfbbyAiFtg/bp+5Jan
 1EOYOehIcYLO6pfXP8uEQD76iSOqESfBbBEx5q+bfsgish+5cnTdoEmfm/EhitdoE8/zpsfNPKB
 LP9LoMdC0tCvnhx6YD3QCbs+M2kCcyxrCPkxusFCEFA/HkygMbPOQDryPzJ2Hqmqfd2WdtQBfte
 ePOZtNApJVl/ZldAOb3leIpVAKUjHp24Xx8LUcckIrKOpf94X8RMF1aniQd1cEQ/3996Gi5BfY8
 0nO4iqCgNlpUBDjTysOxPcEZWvj5byTd6H1x8OZnYClrjy
X-Google-Smtp-Source: AGHT+IHJTBTQsKJ9J0icDqWPfLqwUQt/F8t0mjlt1AUtpFI3OZp9iuL1Mfx3vEnp4RBicKJJchksRw==
X-Received: by 2002:a05:620a:9174:b0:7e7:fe10:60ac with SMTP id
 af79cd13be357-7e8652dfb35mr381227685a.33.1755099599634; 
 Wed, 13 Aug 2025 08:39:59 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e67f728a6asm1976119385a.64.2025.08.13.08.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:39:58 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:39:48 -0400
Subject: [PATCH v3 3/9] rust: block: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-3-a15eca059c51@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099590; l=2915;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=af6FE21/bV11TzZblZrnYjzjw1z2PLK6stOqUBZ4ohw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QND6ryUce6zUmM6RgxlBBczQVu5n2eIQGV08rFnIBp3j+aPyM2w4SbFr7X/VFxWqv4YqG7uQRhM
 UPVnePCfgnwU=
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

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Custom.20formatting/with/516476467
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
Acked-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 drivers/block/rnull.rs             | 2 +-
 rust/kernel/block/mq.rs            | 2 +-
 rust/kernel/block/mq/gen_disk.rs   | 2 +-
 rust/kernel/block/mq/raw_writer.rs | 3 +--
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/block/rnull.rs b/drivers/block/rnull.rs
index d07e76ae2c13..6366da12c5a5 100644
--- a/drivers/block/rnull.rs
+++ b/drivers/block/rnull.rs
@@ -51,7 +51,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
                 .logical_block_size(4096)?
                 .physical_block_size(4096)?
                 .rotational(false)
-                .build(format_args!("rnullb{}", 0), tagset)
+                .build(fmt!("rnullb{}", 0), tagset)
         })();
 
         try_pin_init!(Self {
diff --git a/rust/kernel/block/mq.rs b/rust/kernel/block/mq.rs
index 831445d37181..61ea35bba7d5 100644
--- a/rust/kernel/block/mq.rs
+++ b/rust/kernel/block/mq.rs
@@ -82,7 +82,7 @@
 //!     Arc::pin_init(TagSet::new(1, 256, 1), flags::GFP_KERNEL)?;
 //! let mut disk = gen_disk::GenDiskBuilder::new()
 //!     .capacity_sectors(4096)
-//!     .build(format_args!("myblk"), tagset)?;
+//!     .build(fmt!("myblk"), tagset)?;
 //!
 //! # Ok::<(), kernel::error::Error>(())
 //! ```
diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index cd54cd64ea88..494c95623b97 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -6,9 +6,9 @@
 //! C header: [`include/linux/blk_mq.h`](srctree/include/linux/blk_mq.h)
 
 use crate::block::mq::{raw_writer::RawWriter, Operations, TagSet};
+use crate::fmt::{self, Write};
 use crate::{bindings, error::from_err_ptr, error::Result, sync::Arc};
 use crate::{error, static_lock_class};
-use core::fmt::{self, Write};
 
 /// A builder for [`GenDisk`].
 ///
diff --git a/rust/kernel/block/mq/raw_writer.rs b/rust/kernel/block/mq/raw_writer.rs
index 7e2159e4f6a6..d311e24e2595 100644
--- a/rust/kernel/block/mq/raw_writer.rs
+++ b/rust/kernel/block/mq/raw_writer.rs
@@ -1,8 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use core::fmt::{self, Write};
-
 use crate::error::Result;
+use crate::fmt::{self, Write};
 use crate::prelude::EINVAL;
 
 /// A mutable reference to a byte buffer where a string can be written into.

-- 
2.50.1

