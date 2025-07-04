Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD68AF9B89
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 22:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB0010E0B6;
	Fri,  4 Jul 2025 20:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HZ3buQvF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22EC10E0B6;
 Fri,  4 Jul 2025 20:16:03 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4a58d95ea53so15284591cf.0; 
 Fri, 04 Jul 2025 13:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751660162; x=1752264962; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JvF1PhT6A+YsimfPIbVV0DwQMx5ntblUzy1Cm9DCNFs=;
 b=HZ3buQvFeb1YzUstz+2CcUGhVuKWtaL+KbM0ndbgxG6hKruWXVROdhZb+e0xbL7bwZ
 t5MU48Z6bdN7LAlg5GWnGD4c7e6lIjgld/5L2LqI64MtOD2uKBzk+qBcuiUWslXEsNeI
 IYJ7mHma6iQ2rhzD5toNupML+gbKd5ab2Lg8RV/GbCFnULnYHqfx6tlXrfZon9gw+SJt
 ytTzaTSb2LWGQcqwVJv4epb+Qxh3lCrbnFMyrauMU6Cxoqzwe1fa9W4mrjq/dkcL0wgM
 dmeAygayWvNl7X6uO4zCeIn21gb7mILXKm6vhYM/vT0caThnz9ZwZhos/g2pmu1hSHoP
 DUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751660162; x=1752264962;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JvF1PhT6A+YsimfPIbVV0DwQMx5ntblUzy1Cm9DCNFs=;
 b=Eh38+UhGnXwoo1r/9op3rOnNaGOQxWsWVYPu3/b0i5uLzKeiFPDb/IsplrxtzDE1ft
 LCKsit7vlBzFIfe15WjPTc+c2iS88LC3roM5/hJwoSRKVPdHw922Ci9fQTUlEii/5opu
 w0ZJnIH3dn//GUG731j3ZqtyQbsbxZFPGjGin1papd2XAeTHmbnuZmzcqgZz3NUIPlce
 QZUB2kuQ7NBhc2crqE9VPjEoTt7gmcvYS87u4QVc9ezRyW4zCym2nCkUX+dHgTi6H9qj
 /8B2SBPl++17sI5coEIWGuF4ayfzD3IDCbV+HkAUlX1zyOluBlg+0/FWNbgmff/InJFi
 s+Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcsWoqyW7lxIAj3A1nNQwaGCA+pcdvqg24HwCAEh1mgwcV335vf1jq/PWxmzMBbzEwZNYkmZ8wYXs=@lists.freedesktop.org,
 AJvYcCVULFZbtsynH5zPWeqr5Dy5NJks5D+lO9NHO99nVG4eSCZoBq2zAz9P/goqaPAO9VZBLkYSNihcOQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrB+9w+t0fsyn/NkzXQ2HxX78osONvWtQDFNDX+t1Z7zKuNA7v
 bKE5WMHvtPANBsSzVKj7YnZ9aOC1o1tqsR3AZ9ltFVEOOCAncx2O8dad
X-Gm-Gg: ASbGncsOoMqHVcPJFSl+yic2TSQY/j53LbgegZKuyo0LK8hrrfWlW8ZvFTlMXx5LwID
 Y2S8DYEamC1c72YaXNl36Tl326RwFxJIsxguhsEq3gYOOZmeOKZRjEhXrigdIwaYTCn4VwI3aza
 Z+ZyqIuvxTBlTEUCUgycv8qY77cbchAmMusLlrbFiL7zhyoVlgpImL8/lS/lUuqc/4qN48V6lda
 T5BcVFCkV/NC1y1xBbo02BThsUbsVimWDFylSj/CGi6rVGH9TBiOshNOnSm4dB5rmMWqt91LnHp
 gydyBg2IkQKWl4AjHES4M/c/i7VahZkNRL+c/hmYc20JNI2BNc5UOQen7lavw6+JyEVROAsgOpt
 FdkKJzC0=
X-Google-Smtp-Source: AGHT+IGNtDccghiwMyeSOhBtUWcR8MfX183nsH4JyaXEa12ociciUBdXmH+eYmkAki5LcBiOJOoL5w==
X-Received: by 2002:a05:622a:4c16:b0:4a7:8439:796e with SMTP id
 d75a77b69052e-4a994f46b02mr72174231cf.13.1751660162501; 
 Fri, 04 Jul 2025 13:16:02 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa
 ([2600:4041:5c29:e400:94f3:d2bb:5ace:77a1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949e5221sm19772941cf.2.2025.07.04.13.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 13:16:02 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH 0/6] Replace `kernel::str::CStr` with `core::ffi::CStr`
 (cycle 1)
Date: Fri, 04 Jul 2025 16:14:51 -0400
Message-Id: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADs2aGgC/x3MSwqAMAxF0a2UjC1UsRbdijjoJ2omKqmIULp3g
 8Nz4b0CGZkww6QKMD6U6TwEbaMg7v7YUFMSQ2c6a5zpdTwZdcw364vx8oIxjDh4F5J1CLKTvtL
 7f85LrR8k4c5TYwAAAA==
X-Change-ID: 20250704-core-cstr-prepare-9b9e6a7bd57e
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1751660160; l=1945;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=QbKwusMAkM9a/9/xceMyEYhSLLCaD1ZRtRJUSrrJv5Q=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCCsSGmWQGuchXx15wPXzQ8bwXKfo878bqFcp4CZeit5Laltm+GPuYb7EicsWu7PjvXZK+2GLfQ
 9DAOrwfdjJwc=
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

This series makes preparations for the replacement of our custom `CStr`
type with the analogous type available in `core`.

As this is a large migration that touches many subsystems, it will take
place in several cycles, each of which may see multiple series:
1. introduces facades in the kernel crate that downstream
   code can reference. [this series]
2. migrate downstream code to kernel crate facades. (N series, divided
   by subsystem).
3. replace kernel crate facades to allow `Display`ing foreign types
   (such as `core::ffi::CStr`). Replace `CStr` with `core::ffi::CStr`.
4. migrate uses of `c_str!` to C-String literals. Replace references to
   `kernel::str::CStr` with `kernel::ffi::CStr`. (N series, divided by
   subsystem).
5. rename `c_str!` to discourage use. Remove `CStr` reexport from
   `kernel/str.rs`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Tamir Duberstein (6):
      rust: kernel: remove `fmt!`, fix clippy::uninlined-format-args
      rust: kernel: add `fmt` module
      rust: use `kernel::{fmt,prelude::fmt!}`
      rust: str: remove unnecessary qualification
      rust: add `CStr` methods matching `core::ffi::CStr`
      rust: use `core::ffi::CStr` method names

 drivers/cpufreq/rcpufreq_dt.rs    |  3 +-
 drivers/gpu/nova-core/firmware.rs |  5 +-
 rust/kernel/error.rs              |  8 ++--
 rust/kernel/fmt.rs                |  7 +++
 rust/kernel/lib.rs                |  1 +
 rust/kernel/opp.rs                |  2 +-
 rust/kernel/prelude.rs            |  2 +-
 rust/kernel/print.rs              |  6 +--
 rust/kernel/str.rs                | 97 ++++++++++++++++++++++++---------------
 samples/rust/rust_print_main.rs   |  2 +-
 10 files changed, 83 insertions(+), 50 deletions(-)
---
base-commit: 769e324b66b0d92d04f315d0c45a0f72737c7494
change-id: 20250704-core-cstr-prepare-9b9e6a7bd57e

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

