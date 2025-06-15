Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07926ADA3B9
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 22:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2806310E24A;
	Sun, 15 Jun 2025 20:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GRK+/xyn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AC610E243;
 Sun, 15 Jun 2025 20:55:11 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6fad4e6d949so19514266d6.0; 
 Sun, 15 Jun 2025 13:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750020911; x=1750625711; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j16wuFNqkdjB5TUdH0zffnUQd8bgZAgYJK6kemWeowM=;
 b=GRK+/xynkaTCN2qtnR77xnxwRjz2l/JqdohqGECFNpWrPg9VTJcnX3VU6DDH+noptA
 0oqWAFnSSaztD6F6zxk0xKmeF+F6stPPCZbLxBYwt8qSyh6Z0BXpsMzxrFeGN1AxwEIW
 rAi29heUWPCN68kahgPXYlsOutyT/COL8VAlTaxm3YBs+clYrALmFcom64VOPKfeHfnP
 +OpzU1U2GtT2xsTxp7WrvihceImBbQ1L/RwWk1G+TRoj5qjDE0TE0UCdL7aO0GKkrfN9
 f4Xb8zBexjsI5pMvHcczyFGtF2zRy511JakZD0kPIxbIo1Wc6XZmLPzsumQRKx8Gjsm6
 tsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750020911; x=1750625711;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j16wuFNqkdjB5TUdH0zffnUQd8bgZAgYJK6kemWeowM=;
 b=oGm2QkiLYVl+2oypJlC7m253+z0WQKL22xxLcph6TQP/2d8+UqIiu/BXAhXtImUUGs
 e18Fo9UDRJIb15EHMckzFuP/RKKiDcRFt8H0oB24V4JGDwNxvqEBj4T+bUXY/NmcHcmR
 22BcsIj8GH6ozRz/ZIzYxjYT5SWm06KQMYA5MBm+FZQPwhcaCtQ5E+TQ3qWUYRR+zcdf
 cGZJd1wbiCUfKdpr5slnJDHmx/DO0q6VpEzCEQfRBKZDpFhLaizftX7vLe6dUvEJRuDh
 LheuLcUiIGlM+VOI21g0pJRR7CcKrAvq2tMThfZJiypACtzXoJmmwRZtu5qGME1Nypcd
 M5Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDUDdqq3P82a9AmE8/g2lnj3VBVtcBXmgSKL28Mu0ZcdUNXII5JQH7jyx8Pkyy2/cBqIMXoktGjQ==@lists.freedesktop.org,
 AJvYcCWsGrTqtD8Q1TKP+sbYOb0I/3idFH3vWK+4IUETZsEEQ0jSuUEnR76JdjvRpGOtj4badnWDwmblUzo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQs5wm6mt1QKSVjAyxyYHOFwZt5dmerxWwbJSTHZa0Azc5JbBh
 o9SaIPom82So2iur6hp04hVRFedkKGPYATeVyt4XxpZ40SbOwKHN9/xy
X-Gm-Gg: ASbGncvo3Rg4i2nbRtKO0kLLHZ/+awdEjIuat/HKlQjijrc4SFfC6CzREacy0t86Qzb
 p4QFFWt6JYNpj7zXtZ+QsG6X1XUbWOGamYgs+T+eldvOKhwxwisk6ZPemMbA/BuZo4r265MUsko
 J8WDOOy9icSGi6H/OV+m2HKcIEhmCS+vZMAXN8Nx4XtlS+XM5XjzCnn0S9MXqo0ZLjFyVktbZuP
 sK9EUj4qqjK9nfqKHnkhQ3h4vogyl+5HBcwGoWY7n8kePLsRlwv5inaSUoe7Jm1ZjYQwFjy8svg
 XYHz7eV2CcWTpVIEvNpSi/1c8iFfSrHvUvq8hzS8iU8+OCjOsRaAoZXOAnBzI9bx4CbBzorlY0B
 7U5nk
X-Google-Smtp-Source: AGHT+IGd7UFbSuHT8VxGXjaCZlDB3nAmPpggFjehtIlQAqgZaWIhMSzFnKX+9RpIkD9GXqlEWnKWJQ==
X-Received: by 2002:a05:6214:d47:b0:6fa:fb4f:b582 with SMTP id
 6a1803df08f44-6fb47627690mr98707346d6.6.1750020910309; 
 Sun, 15 Jun 2025 13:55:10 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:b0c6:92db:d807:21a6])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fb35c84148sm43468176d6.109.2025.06.15.13.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jun 2025 13:55:09 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v12 0/6] rust: reduce `as` casts, enable related lints
Date: Sun, 15 Jun 2025 16:55:04 -0400
Message-Id: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACkzT2gC/23S204DIRAG4Fdp9loMMwwnr3wP4wXHdhPbrbt1o
 2n67tJqIlCvCCTfzAD/eVjSPKZleNqchzmt4zJOh7IBfNgMYecO28TGWA4G5Ci54JodTzNzy21
 B8GCUzoEiDQUc55THz1u1l9ey343LaZq/bsVXuJ7+W2YFBkwajFxJoGDN83bvxrfHMO2Ha5kVa
 2obiowzlFFxFy2i1z0VFQVqqCg0ae8UcDKZXE+pprKhVKjHqDEAxYCqp7Km7V1lodLLjJAdCn7
 XVVUU24FVoWQjeJ0joeU91TVtB9aFGu08SQTS3vbU/FHqXtgUKrQwXIEUlHJPbUVBNdQWCiYFt
 L4kJYueAq+taTPBr32jEhG15drdPRRUgVIALYaCQ5KeIKhkQ/NBl5+kzun9o8T99BvXy+Ubr32
 BVgwDAAA=
X-Change-ID: 20250307-ptr-as-ptr-21b1867fc4d4
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Breno Leitao <leitao@debian.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-mm@kvack.org, 
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org, 
 Tamir Duberstein <tamird@gmail.com>, Benno Lossin <lossin@kernel.org>
X-Mailer: b4 0.15-dev
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

This started with a patch that enabled `clippy::ptr_as_ptr`. Benno
Lossin suggested I also look into `clippy::ptr_cast_constness` and I
discovered `clippy::as_ptr_cast_mut`. This series now enables all 3
lints. It also enables `clippy::as_underscore` which ensures other
pointer casts weren't missed.

As a later addition, `clippy::cast_lossless` and `clippy::ref_as_ptr`
are also enabled.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v12:
- Remove stale mention of a dependency. (Miguel Ojeda)
- Apply to config, cpufreq, and nova. (Miguel Ojeda)
- Link to v11: https://lore.kernel.org/r/20250611-ptr-as-ptr-v11-0-ce5b41c6e9c6@gmail.com

Changes in v11:
- Rebase on v6.16-rc1.
- Replace some `as <integer>` with `as bindings::T` and others with `as
  ffi::T`. (Miguel Ojeda)
- Revert explicit `ffi::c_void` import which is in the prelude. (Miguel Ojeda)
- Link to v10: https://lore.kernel.org/r/20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com

Changes in v10:
- Move fragment from "rust: enable `clippy::ptr_cast_constness` lint" to
  "rust: enable `clippy::ptr_as_ptr` lint". (Boqun Feng)
- Replace `(...).into()` with `T::from(...)` where the destination type
  isn't obvious in "rust: enable `clippy::cast_lossless` lint". (Boqun
  Feng)
- Link to v9: https://lore.kernel.org/r/20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com

Changes in v9:
- Replace ref-to-ptr coercion using `let` bindings with
  `core::ptr::from_{ref,mut}`. (Boqun Feng).
- Link to v8: https://lore.kernel.org/r/20250409-ptr-as-ptr-v8-0-3738061534ef@gmail.com

Changes in v8:
- Use coercion to go ref -> ptr.
- rustfmt.
- Rebase on v6.15-rc1.
- Extract first commit to its own series as it is shared with other
  series.
- Link to v7: https://lore.kernel.org/r/20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com

Changes in v7:
- Add patch to enable `clippy::ref_as_ptr`.
- Link to v6: https://lore.kernel.org/r/20250324-ptr-as-ptr-v6-0-49d1b7fd4290@gmail.com

Changes in v6:
- Drop strict provenance patch.
- Fix URLs in doc comments.
- Add patch to enable `clippy::cast_lossless`.
- Rebase on rust-next.
- Link to v5: https://lore.kernel.org/r/20250317-ptr-as-ptr-v5-0-5b5f21fa230a@gmail.com

Changes in v5:
- Use `pointer::addr` in OF. (Boqun Feng)
- Add documentation on stubs. (Benno Lossin)
- Mark stubs `#[inline]`.
- Pick up Alice's RB on a shared commit from
  https://lore.kernel.org/all/Z9f-3Aj3_FWBZRrm@google.com/.
- Link to v4: https://lore.kernel.org/r/20250315-ptr-as-ptr-v4-0-b2d72c14dc26@gmail.com

Changes in v4:
- Add missing SoB. (Benno Lossin)
- Use `without_provenance_mut` in alloc. (Boqun Feng)
- Limit strict provenance lints to the `kernel` crate to avoid complex
  logic in the build system. This can be revisited on MSRV >= 1.84.0.
- Rebase on rust-next.
- Link to v3: https://lore.kernel.org/r/20250314-ptr-as-ptr-v3-0-e7ba61048f4a@gmail.com

Changes in v3:
- Fixed clippy warning in rust/kernel/firmware.rs. (kernel test robot)
  Link: https://lore.kernel.org/all/202503120332.YTCpFEvv-lkp@intel.com/
- s/as u64/as bindings::phys_addr_t/g. (Benno Lossin)
- Use strict provenance APIs and enable lints. (Benno Lossin)
- Link to v2: https://lore.kernel.org/r/20250309-ptr-as-ptr-v2-0-25d60ad922b7@gmail.com

Changes in v2:
- Fixed typo in first commit message.
- Added additional patches, converted to series.
- Link to v1: https://lore.kernel.org/r/20250307-ptr-as-ptr-v1-1-582d06514c98@gmail.com

---
Tamir Duberstein (6):
      rust: enable `clippy::ptr_as_ptr` lint
      rust: enable `clippy::ptr_cast_constness` lint
      rust: enable `clippy::as_ptr_cast_mut` lint
      rust: enable `clippy::as_underscore` lint
      rust: enable `clippy::cast_lossless` lint
      rust: enable `clippy::ref_as_ptr` lint

 Makefile                               |  6 ++++
 drivers/gpu/drm/drm_panic_qr.rs        |  4 +--
 drivers/gpu/nova-core/driver.rs        |  2 +-
 drivers/gpu/nova-core/regs.rs          |  2 +-
 drivers/gpu/nova-core/regs/macros.rs   |  2 +-
 rust/bindings/lib.rs                   |  3 ++
 rust/kernel/alloc/allocator_test.rs    |  2 +-
 rust/kernel/alloc/kvec.rs              |  4 +--
 rust/kernel/block/mq/operations.rs     |  2 +-
 rust/kernel/block/mq/request.rs        | 11 +++++--
 rust/kernel/configfs.rs                | 22 +++++---------
 rust/kernel/cpufreq.rs                 |  2 +-
 rust/kernel/device.rs                  |  4 +--
 rust/kernel/device_id.rs               |  4 +--
 rust/kernel/devres.rs                  | 17 +++++------
 rust/kernel/dma.rs                     |  6 ++--
 rust/kernel/drm/device.rs              |  6 ++--
 rust/kernel/error.rs                   |  2 +-
 rust/kernel/firmware.rs                |  3 +-
 rust/kernel/fs/file.rs                 |  2 +-
 rust/kernel/io.rs                      | 18 ++++++------
 rust/kernel/kunit.rs                   | 11 ++++---
 rust/kernel/list/impl_list_item_mod.rs |  2 +-
 rust/kernel/miscdevice.rs              |  2 +-
 rust/kernel/mm/virt.rs                 | 52 +++++++++++++++++-----------------
 rust/kernel/net/phy.rs                 |  4 +--
 rust/kernel/of.rs                      |  6 ++--
 rust/kernel/pci.rs                     | 11 ++++---
 rust/kernel/platform.rs                |  4 ++-
 rust/kernel/print.rs                   |  6 ++--
 rust/kernel/seq_file.rs                |  2 +-
 rust/kernel/str.rs                     | 14 ++++-----
 rust/kernel/sync/poll.rs               |  2 +-
 rust/kernel/time/hrtimer/pin.rs        |  2 +-
 rust/kernel/time/hrtimer/pin_mut.rs    |  2 +-
 rust/kernel/uaccess.rs                 |  4 +--
 rust/kernel/workqueue.rs               |  8 +++---
 rust/uapi/lib.rs                       |  3 ++
 38 files changed, 139 insertions(+), 120 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250307-ptr-as-ptr-21b1867fc4d4

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

