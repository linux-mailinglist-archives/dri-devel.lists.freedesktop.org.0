Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A914CB24DA2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF4610E74C;
	Wed, 13 Aug 2025 15:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HZB+RH3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCE410E749;
 Wed, 13 Aug 2025 15:39:54 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7e812394506so624989285a.1; 
 Wed, 13 Aug 2025 08:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099593; x=1755704393; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y1PBgm6FTY47v6gTvWfZBpQMyISqIs23+q0cdOn41Ao=;
 b=HZB+RH3xyee7sqvJaXreXLhbT6UMJs277P2iYGL0Re8Q+eczvtoJLOZ8mkQuKreCOs
 ZIe+cM2a/lNxSqIENdIr61CukC6qPW17gvEfg0yY3qBVl8Fe3qW6KmLTIkwGjR6e2u01
 bOs8jXLMm/ZgCQ97tbXa1+oDUMWqGNYSb1efEnnNrlraV4OFUQpbKYLfoaKHZ6IKfnht
 BegUTPVGbi4cWV2nTs1s58+2PqZlbooAK8glJdhX7fxw01nqYAMcsvj9z/aOOz5GBgnp
 ba+UESh0pMmNqsrlKw2Rlgu/VzuMW905o8yqAvgzX3U2DdieqBK1LVwyOAEPSJNplDYp
 +tcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099593; x=1755704393;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y1PBgm6FTY47v6gTvWfZBpQMyISqIs23+q0cdOn41Ao=;
 b=Wh6G8FctYiv9VGKwbIN8BNWr9zB5nDuwufCpi6rCV5/YC2rMKAYLFnvB7tGmdKmg3v
 7BQHqyiW+YC8pzqY3Gq8OY0bQlxsNLHv65P83qcK4Qq2z1oSQgqIJT3aAy1V8MWqZfRV
 f7CRAmlWANJIlbxdy3AxyijDM1t4PZEWzvqjpbwG/i9ztTK9QJ4qazt2K+JtltILQgAl
 RNjgiL5TAul8jSB/5LzDAI0GatoiKC77GrzjoGzIjQcz4+yfMIWvcEumUJbIu4aeklo8
 0+BiVTCqAIGZ52Qe0DP8PLPqpaHJKGAdLgQ6lo0eI8jmQ1+KZ8SRvYk6SZxuaBM90bFT
 DJ8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpy88giLKNEc6AYRrytAk/yaazyquuIioQhE/aHys9eub25Z/ubmQlcYgs2U4oS49V4SLZYKrjmlw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUZGY2llM3XQdgD0kBpbl5CpjXBM00JktesjkJhwHaTfWA8utK
 ghKmO+Z6oapMZF4PK23ywe3407FfHpccwRsGm7LcV4MB6sbe8PoubhxL
X-Gm-Gg: ASbGnctha8hBt7vjj4LHE9bl6ptl+VtXIYjnfyqB/bv4YHeXtrY84LqB3b6aGM2jRrO
 iVuL7BiwetFSLiY0p4ibPUcCQa2S1/CfQldgaZW+qkfhdwrYh3+0XV1ssMmWW8m+8Z+FrQGbp+M
 +5CFR3WK0h1C8VyyuRap76+CZZbZeSLtWqnWshT0lf9amvPDTmN+xWp3/GnUi1Dfk4b/+DR1Qvu
 oBYppiEztugMxkaWE0fN5142Lwx3dH8UB8/Zh1i2+OeV05jX65Kb6ZqM3WT7euHvKNF+jdyCUGV
 HPLy4z6aUQW1j94F5RuQnhycsGOnQrOsDa6RjZknGUWr17E7vDuutSMzw6BG97JsJ2cx60d44En
 LNk1ecE+iAhFvAQdlIShx0nn59EsSSQvSIcBLvVnPAGEuHbphBoSA7WKwPTeX4JjYPJV2gxwGxm
 VM3wdCD0OT/PjiyL8JbUEs36vovFmR2mQlah/Okg0DNOHu
X-Google-Smtp-Source: AGHT+IHyUKVG/mS9LrmhskFBc8fLiX7b3H0/ofCR3EPTyDC9r+OJDyKAXjDzHP16/W+xsxEJ7HTUpg==
X-Received: by 2002:a05:620a:a111:b0:7e8:bf8:abf7 with SMTP id
 af79cd13be357-7e865280ff2mr499775385a.20.1755099593482; 
 Wed, 13 Aug 2025 08:39:53 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e67f728a6asm1976119385a.64.2025.08.13.08.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:39:52 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v3 0/9] rust: use `kernel::{fmt,prelude::fmt!}`
Date: Wed, 13 Aug 2025 11:39:45 -0400
Message-Id: <20250813-core-cstr-fanout-1-v3-0-a15eca059c51@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMGxnGgC/33NTQ7CIBQE4Ks0rMXAw/658h7GBcVHS2KLAiWap
 neX1oVdGJczyXwzEY/OoCfHbCIOo/HGDimIXUZUJ4cWqbmmTIBBzkpWU2UdUuWDo1oOdgyUUw2
 s4LwSACWQNLw71Oa5oufLJzt8jMkO37IzPlj3Wo8jX9q/H5FTRouDYBWWwIRWp7aX5rZXticLF
 2FD8N8EJILLJm8kr2pV4JaY5/kNFP2VtwwBAAA=
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099590; l=2531;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=pbhmDtO71qVMDCBwFBh7wsmwO5+SFwM7vnisSM+P7vk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QD15Csr5AV6bt6Plsqpo3gx8mcieA66z2j4+xAajfnt6k92rEjYMF8suWRw/hGcxp1PDPKHJ4m3
 WytRFj5zs2A0=
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
Changes in v3:
- Add a patch to address new code in device.rs.
- Drop incorrectly applied Acked-by tags from Danilo.
- Link to v2: https://lore.kernel.org/r/20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com

Changes in v2:
- Rebase on rust-next.
- Drop pin-init patch, which is no longer needed.
- Link to v1: https://lore.kernel.org/r/20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com

---
Tamir Duberstein (9):
      gpu: nova-core: use `kernel::{fmt,prelude::fmt!}`
      rust: alloc: use `kernel::{fmt,prelude::fmt!}`
      rust: block: use `kernel::{fmt,prelude::fmt!}`
      rust: device: use `kernel::{fmt,prelude::fmt!}`
      rust: file: use `kernel::{fmt,prelude::fmt!}`
      rust: kunit: use `kernel::{fmt,prelude::fmt!}`
      rust: seq_file: use `kernel::{fmt,prelude::fmt!}`
      rust: sync: use `kernel::{fmt,prelude::fmt!}`
      rust: device: use `kernel::{fmt,prelude::fmt!}`

 drivers/block/rnull.rs               |  2 +-
 drivers/gpu/nova-core/gpu.rs         |  3 +--
 drivers/gpu/nova-core/regs/macros.rs |  6 +++---
 rust/kernel/alloc/kbox.rs            |  2 +-
 rust/kernel/alloc/kvec.rs            |  2 +-
 rust/kernel/alloc/kvec/errors.rs     |  2 +-
 rust/kernel/block/mq.rs              |  2 +-
 rust/kernel/block/mq/gen_disk.rs     |  2 +-
 rust/kernel/block/mq/raw_writer.rs   |  3 +--
 rust/kernel/device.rs                |  6 +++---
 rust/kernel/device/property.rs       | 23 ++++++++++++-----------
 rust/kernel/fs/file.rs               |  5 +++--
 rust/kernel/kunit.rs                 |  8 ++++----
 rust/kernel/seq_file.rs              |  6 +++---
 rust/kernel/sync/arc.rs              |  2 +-
 scripts/rustdoc_test_gen.rs          |  2 +-
 16 files changed, 38 insertions(+), 38 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250709-core-cstr-fanout-1-f20611832272

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

