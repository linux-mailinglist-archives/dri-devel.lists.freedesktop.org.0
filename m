Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC406AFF23B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 22:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE63910E82C;
	Wed,  9 Jul 2025 20:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NcE0v36m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8007510E82C;
 Wed,  9 Jul 2025 20:00:07 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4a58d95ea53so4621131cf.0; 
 Wed, 09 Jul 2025 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091206; x=1752696006; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bBPH7FnIuiVsSiPlIYMq7bGgWWPkIuqhlOH0NbxWPbw=;
 b=NcE0v36m14NDLgVEplqaqf0uQWOTYhruRKL3iQq00XUolYylzDt6V2QgPREyvHMTCf
 0re9AiyN5QTQVD3Kbf40ESCX7c+abqxJFyr3HKDS7KJyGrXC2n6u9W1N++/K3UnVUCUx
 maXbD/2SD4V9d1tJu5kg8imJsNvr/e00y2MdNDDC/IGupuYNAg7qly6f2pF8Osr0KXQh
 oA8BijjtEUIyQc3Ss5GCJKfzbc4s4Znqh5AJCFhd7Nzs0rDWCYD5dFl+AB1BJmE4+8Eq
 6nx4mBOqOqJVBE8s8G2z1WBC18q6lscNprCdjw3kk3ZwfqfZMDlpbgbqLUWnxVyJ6dbv
 jRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091206; x=1752696006;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bBPH7FnIuiVsSiPlIYMq7bGgWWPkIuqhlOH0NbxWPbw=;
 b=PKOlDst11gIeu6bHnt2625e/lGtJkSCGqMa9+RGGSybo5NTr4Lu7tYsfgcZVxB/JR2
 8FK9FdFiERWAXtBBOyjXhDNeGQMQwh88AhwbdvrkYQb1gtnzr+7hUh39qXOOrCBREhVi
 SpCv6yhSn4zir3LjKSSmNu/57WR7oWdLYFLlXZ40EQrp7e6JR/+uWJ2NpngFP1mMNdO2
 rDqkl8voREMN32m8rSBG9CasdbgBQuMvteRuwKnMME/B3jOiiys4gPN5sQ8gsu+nG6rz
 2DUD2vFdn2qyLsPUq6rg20ic3PUOYU2OOVbSK5VpPTt5DK96l16T7hbh2P3oFgFuueS5
 0KWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPMzvpEubJcRwIFJvkc3iu37/Us6iJhrd+4tuEEHnvbVoCUewIfR/IxE7oKLAcTABbo9xafOHvvgM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVF1FqG7WaWPF8barzyHp/YlGQjZ/eduv6NCu+tDpQNAUeYfw9
 Yw4/dLROr8qsbhlym1XEAIVM5o2s2ndTRNsoG48SB00gTXJ23mYZbLAQ
X-Gm-Gg: ASbGncve1Xk0vIEZgIgOvHiHkstWY2mzOrT9fPVJemhJ+mKDBZpHB/bFgsHELcPiY14
 OdTgZAkZGh6OvWZDKJCkQE0vqa49GJoaWcQyffIdoUJk6pYPgIIAg8JzDqZkCuBosm3F4jdpMul
 IasL+u6+nyes7yvf35m6egB1Na4zRin7YL8quXmAuYNJcH7IU0PpeJBmG0Ox//rT67qKTroEYsm
 G/Mqtd/kW0PUa85UYuOs8YIVgyXvO4oOGItDP9KSp6qwosahk8kKn5CJQ+3865Fv/vonuxIsg+j
 A1D2CwFcOFkFpInVUAAKMSyLrAufZBzL5OG7GaVwymAN0gyZUS+KMfvmbvbS7KcWLnNG0+5qLGI
 pGnqDRJBu92hEBgPv8c06G0jrMHPd6VKeIPj9Vjx2egKNV6QsoMBFF3sm/Q==
X-Google-Smtp-Source: AGHT+IEjvhAx4Fexn1s+7YjFkkN49k26NgQzpiKzVdxw5gpNGSXQ/darWIe+uClarfZ+hMNJzu4LEQ==
X-Received: by 2002:a05:622a:53c4:b0:4a7:6408:b449 with SMTP id
 d75a77b69052e-4a9e9bf79afmr13743511cf.2.1752091206317; 
 Wed, 09 Jul 2025 13:00:06 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949e4aaasm100432891cf.3.2025.07.09.13.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 13:00:05 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH 0/9] rust: use `kernel::{fmt,prelude::fmt!}`
Date: Wed, 09 Jul 2025 15:59:59 -0400
Message-Id: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD/KbmgC/02OzQ7CIBAGX6XZsySwpaz0VYwHfhblYKvQGpOm7
 y5RDx5nk51vNqhcMlcYuw0KP3PN89RAHToIVzddWOTYGFDiIElaEebCItSliOSmeV2EEgmlUer
 YIxJCe7wXTvn1kZ7OXy78WJt7+R7Bu9ok8+2Wl7EjY7lH7Y3xMlqMUqdeDVEGPTiZCKmnQNpq+
 G8au1+R/itqQ3fXwHrLxpGPA/H4VHDe9zfyzQPq6QAAAA==
X-Change-ID: 20250709-core-cstr-fanout-1-f20611832272
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091203; l=2543;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=3uVzBwpZOZRwh4aQxcecwTnih0t2Su/HW/bH4b6okHs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOFx1gBF76r4ZDYB2EZOTwsUwSVSVp3sKW88+0lIx1FnbguWzfge/GtyFqlJhS0kWl0FJEONZDI
 dw5ZmS5n/ygg=
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

This is series 2a/5 of the migration to `core::ffi::CStr`[0].
20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com.

This series depends on the prior series[0] and is intended to go through
the rust tree to reduce the number of release cycles required to
complete the work.

Subsystem maintainers: I would appreciate your `Acked-by`s so that this
can be taken through Miguel's tree (where the other series must go).

[0] https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com/

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Tamir Duberstein (9):
      gpu: nova-core: use `kernel::{fmt,prelude::fmt!}`
      rust: alloc: use `kernel::{fmt,prelude::fmt!}`
      rust: block: use `kernel::{fmt,prelude::fmt!}`
      rust: device: use `kernel::{fmt,prelude::fmt!}`
      rust: file: use `kernel::{fmt,prelude::fmt!}`
      rust: kunit: use `kernel::{fmt,prelude::fmt!}`
      rust: pin-init: use `kernel::{fmt,prelude::fmt!}`
      rust: seq_file: use `kernel::{fmt,prelude::fmt!}`
      rust: sync: use `kernel::{fmt,prelude::fmt!}`

 drivers/block/rnull.rs               | 2 +-
 drivers/gpu/nova-core/gpu.rs         | 3 +--
 drivers/gpu/nova-core/regs/macros.rs | 6 +++---
 rust/kernel/alloc/kbox.rs            | 2 +-
 rust/kernel/alloc/kvec.rs            | 2 +-
 rust/kernel/alloc/kvec/errors.rs     | 2 +-
 rust/kernel/block/mq.rs              | 2 +-
 rust/kernel/block/mq/gen_disk.rs     | 2 +-
 rust/kernel/block/mq/raw_writer.rs   | 3 +--
 rust/kernel/device.rs                | 6 +++---
 rust/kernel/fs/file.rs               | 5 +++--
 rust/kernel/init.rs                  | 4 ++--
 rust/kernel/kunit.rs                 | 8 ++++----
 rust/kernel/seq_file.rs              | 6 +++---
 rust/kernel/sync/arc.rs              | 3 +--
 scripts/rustdoc_test_gen.rs          | 2 +-
 16 files changed, 28 insertions(+), 30 deletions(-)
---
base-commit: 769e324b66b0d92d04f315d0c45a0f72737c7494
change-id: 20250709-core-cstr-fanout-1-f20611832272
prerequisite-change-id: 20250704-core-cstr-prepare-9b9e6a7bd57e:v1
prerequisite-patch-id: 83b1239d1805f206711a5a936bbb61c83227d573
prerequisite-patch-id: a0355dd0efcc945b0565dc4e5a0f42b5a3d29c7e
prerequisite-patch-id: 8585bf441cfab705181f5606c63483c2e88d25aa
prerequisite-patch-id: 04ec344c0bc23f90dbeac10afe26df1a86ce53ec
prerequisite-patch-id: a2fc6cd05fce6d6da8d401e9f8a905bb5c0b2f27
prerequisite-patch-id: f14c099c87562069f25fb7aea6d9aae4086c49a8

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

