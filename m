Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D1DB0B241
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DBF10E052;
	Sat, 19 Jul 2025 22:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H7c8zvnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0116C10E052;
 Sat, 19 Jul 2025 22:42:07 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7e278d8345aso318089485a.0; 
 Sat, 19 Jul 2025 15:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964927; x=1753569727; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IYtqZBE28LZ0UGLaX8MEv+0dHfoGt4V/IBm1NTd57go=;
 b=H7c8zvnEr7MQ6ooJdT0108lRbp0JIMnLXM1itSVZEYLcE5KjTGQILeMcVNDzfSiclw
 i4UKngvXAsbdhdctewI1DdNQuVRLyLDbNwDoTKouOFeWb3AodRe4XARXHCfm6TDYhYNx
 SwDfiGftMEKbuyfhgbXJmYddVLpZW7OGq8C9+BfbamOpf/cx//gk/FrX4O0WEhQ4Fig/
 ELrHDTCd3B5aGdxyJQvOtyskZ+zq5ME47jPBOZ/MhipQT2iwHe2/1wiK4bQOS4gpwLCd
 cPm1z2wrQTG6T1BbERmc3UodLl3WhHml0Ns/utVSwswfismBFu79cF7Ezb7D7pLtWZ0P
 XopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964927; x=1753569727;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IYtqZBE28LZ0UGLaX8MEv+0dHfoGt4V/IBm1NTd57go=;
 b=p96HEQ0ycJtI5eaipS7Ty0dOC4f9EuM83vqjpTVZY4YpEl6baYn03xtJDIkVm0RUeC
 SoFA0mCcfW3Li1Z35weUQ37o1Iz00uZg6lI+WDiZHyuzOkj+j5O1wfEig6zbLN/yfgB7
 LFpMy2gGT9+5MXCzx8OzwZurKi8sg9pRwrQrrsPshJNKUMQFRw8fdxLQt5PQUe9nUCPi
 lHdUbcEUUCvTp6PMSjycYWqlQe5ejNk8OaERYvXbHlohoFR+AItwnAB1lRzYuOSagDZx
 52yrznZWgE/e74IqAftYHn098i8tHdra1z11PUMK5yu5ajhPCaBpArCb9nTTpEg4yK16
 jv2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRpQNCbQR4CqF7Lf3DuCxSDLOALzY65PBXLQ7ryAlpembyDKWPGP/G3LwSUTYA4I8pPSPEK+dWta8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXF8/f50Zl7TYZHH1gwfLOTzFaTIJZzafzIFU6uFiuDWJbaV+C
 n4shuUd+a1SHEn19mQTtni3TK68FKL0jO/ASiJJBIX6yNzRrpOYqFgFY
X-Gm-Gg: ASbGncs3SBgNAnNNbjXKvpKozy4/YwUce4jMpFaI9cQh/3TiljkXoqwyGqNuJzPt6G7
 tHQeb7lgRzKBqDjNjjUgVGUsIaM8i/DwX+akVjtCNpCB/1oAIdzMEFf37Qq1/qxAnM+bNOmBw4o
 MOEFql2G8k92ykaBFhlFZBe8l509dtj80HvuNO2oZg4F2vJXigoEx1//oHlxRpaxLa7fBclPQYm
 0z0smhrJF5lJptbtfaEUYcbRo4AvqSy8RbcOxgysMMagtTsMuqKTpAX3dTAvUd5+J5gDf+y+MXc
 DJftZs2ua73n7t0px5snXuFhgw0/sNmnZEjPSNdgQxbBCDbquOYzGe96r7+A/ga3pB+qlMBkUsx
 ihaShpeNevJTxif1KCm2B1Oio1cUh9WeVa9csERblPmR90J3g+s37hcOgN4dFNTuCvj0axPdQsh
 C8v9Np1Fy/oWby6EBg78IMo6IUipLE
X-Google-Smtp-Source: AGHT+IEiARXQyHTIyMuT3fUQxXz/kzFJUN0F5TuE4Y+GyJF6HI6/8bptvftq/fAC42E6NKFRIuKCzQ==
X-Received: by 2002:a05:620a:40d4:b0:7e3:3417:a5e3 with SMTP id
 af79cd13be357-7e3435709c5mr2426367585a.19.1752964926749; 
 Sat, 19 Jul 2025 15:42:06 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e356c75cf5sm251550785a.84.2025.07.19.15.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:06 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v2 0/8] rust: use `kernel::{fmt,prelude::fmt!}`
Date: Sat, 19 Jul 2025 18:41:49 -0400
Message-Id: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC4ffGgC/32Py27DIBBFf8WadakAm4e96n9UWQAeEqTapECsV
 pH/vZN4k1WX90pz5tw7VCwJK0zdHQpuqaa8UpBvHYSLW8/I0kwZJJeKGz6ykAuyUFth0a351ph
 gUXIthO2lNBLo8Fowpp8n9PN05ILfN2K3owTvKkHysqQ2dSHYAWPvrY0DN2j9rJyKxuuR61mgH
 q0SwSoNr06keBgNL0b06OoojH5E7QyBDE6bgIfEJdWWy+9zKFUPi/82bYJxpoeeWzSS9zF8nBe
 Xvt5JGk77vv8BSAOG5TkBAAA=
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
 Uladzislau Rezki <urezki@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964923; l=2632;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=vbgrYCnB5GbWpCXhaPw8I4u9NCR+1Fim6HSx76fv2mQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCu0Eab3XaeXjLZDUQ3ddLY//J9C+sC+ywoIlzS121Jh4xTPdsG4c76spmKHrnjg4eQIbIkKIcu
 2gdLHhR8aSA0=
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
Changes in v2:
- Rebase on rust-next.
- Drop pin-init patch, which is no longer needed.
- Link to v1: https://lore.kernel.org/r/20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com

---
Tamir Duberstein (8):
      gpu: nova-core: use `kernel::{fmt,prelude::fmt!}`
      rust: alloc: use `kernel::{fmt,prelude::fmt!}`
      rust: block: use `kernel::{fmt,prelude::fmt!}`
      rust: device: use `kernel::{fmt,prelude::fmt!}`
      rust: file: use `kernel::{fmt,prelude::fmt!}`
      rust: kunit: use `kernel::{fmt,prelude::fmt!}`
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
 rust/kernel/kunit.rs                 | 8 ++++----
 rust/kernel/seq_file.rs              | 6 +++---
 rust/kernel/sync/arc.rs              | 2 +-
 scripts/rustdoc_test_gen.rs          | 2 +-
 15 files changed, 26 insertions(+), 27 deletions(-)
---
base-commit: cc84ef3b88f407e8bd5a5f7b6906d1e69851c856
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

