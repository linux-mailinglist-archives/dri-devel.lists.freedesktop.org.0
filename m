Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD075A939BD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 17:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0815310EBB0;
	Fri, 18 Apr 2025 15:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fKYNgTr8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C2E10EBB4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:37:27 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6e8fb83e137so16779356d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744990643; x=1745595443; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MNn1NZDtkPGBUMeP0IbnBbfp3uTHDqgJP4OSlJr6Lew=;
 b=fKYNgTr8e6oEag4uEypouH4zSHYTEGzA+5vg348JHMplIOH+2yLcYIFZ7GmJXP7aoQ
 /snN27csrF4r0LxKnuvkCK7z+KwpQEanbwkkDY3+hgjb7jKXlUmU4QKzTSeqxJX4cksv
 sXMa9Ga5NY31UmiDSJQ6L9ErBMdvV4J3dE2axqEC1yEA+HWP7MVKe8LaE2b34L1x0ReH
 bpgUKDlX73zNlexIXbltcUUFfZISKVeNOC3/lTf0zCsev2aPRH1Y4atuAyMz6l9uhPml
 2P+mPwD0YknEi1FsOmYonyWTFX3whXwdw52jgd/MjwJbgoQ9XCYE0gakRfYhl3KtagvC
 arEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744990643; x=1745595443;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MNn1NZDtkPGBUMeP0IbnBbfp3uTHDqgJP4OSlJr6Lew=;
 b=C6zOYjgUMKH0Bu+ACEAcPp0xxpOKRK82+qj1ME88BjgVN/2srdlhC1mAMrhMl1DF6E
 OVHKtGGHdkuAXtH3W9M3Ab6iDPRlKRmztgshe+LfX+OAjZG63FEQRZCx0JWJS7nuuiuH
 lM/iNRDWlhKlqRU6I8JxA1OVXXwVkwxIvIPMNO+J8l+1r0ubWdWKwlsaCtXyughBuH8u
 PIzxq2aO64qZ93flRtx5OPxoJ7F7juduoinbWxwgdUmJiiXtiHwoAYM17UkA0pO5Br8d
 uxY2L9P7A9NuOTTO3ErDKb7E0CC7aTF+/Yw3YalW1HHJHyK4iW4iHRE3+BcJG3sr1GAi
 kxbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWf13OSaEUF7lXAjcIbWip9LqLmRrhTvr1yJETRIhIvUIXqwSKfkoBeQMI9p6dDmYWUpw67WDBVvw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkJSpXONUL+mdPVdqkbomPkKamZ63Cya6KinvakN25rErBlZSU
 Dz6CcMOAIeNCx6QJQj01mXLbYXFZt0Svc64uLGgNAHgGNAAuaFVj
X-Gm-Gg: ASbGnctfdbwHtbIxakxChJRQy7OPNQ/4neL+ESISJztgT1n7C6Hu4D+nyIAvrSQ3jdk
 kua4DaWE/7wBBcEg79tB2nu7B0/t5ykWTNy/Lav0vX26ga33FfM5S4ST32qzXBTGfCPdNvIaFa+
 jziIq1MVW3O5yruV4MdL2WEEd2suPxC4FSdrJzYnSVdcQ30upyqq29X8ZZ3ZCl/yGshF+iFmCg4
 kzRoJo+LGsR1CtouRMx41n4XgoVw0DD4h0A/RW+4sQSnDukS6vt6JXR7Dn7UkkRwuKOdld7axV8
 XCRmeCeRrqgOabIuiBXyL7EzUZyfHgAAskWfE2Se8tjKBHbZMZL2mMBN4r/maUHxUvKrCw==
X-Google-Smtp-Source: AGHT+IGsINGOaw8h71E+Kqo50KbuJmjq29G601cB/VyotMeJQ0Xm48udFufoI1x16eOoERbdsiMBYw==
X-Received: by 2002:a05:6214:2349:b0:6e8:9866:7398 with SMTP id
 6a1803df08f44-6f2c456c668mr45571206d6.22.1744990643440; 
 Fri, 18 Apr 2025 08:37:23 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:7988:e5e5:1f4c:be78])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2c21d9bsm11623096d6.96.2025.04.18.08.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 08:37:22 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v10 0/6] rust: reduce `as` casts, enable related lints
Date: Fri, 18 Apr 2025 11:37:16 -0400
Message-Id: <20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKxxAmgC/23SS24cIRAG4KuMWIeIKl7FrHKPyAueNlKm2+5uj
 2xZc/eUx1JCd7JCgL6Cgv9DrHXpdRXn04dY6rWvfZ54AurbSeSnOD1W2QsvCFRolVZePm+LjOt
 9QEhAzrdsihEMnpfa+tu92s8Hnj/1dZuX93vxK3yu/rfMFSRIS1iUs2ByoB+Pl9h/fc/zRXyWu
 eJIw46iVBJtcSqWgJj8keqBgtlRzbT6FB0oQ83EIzUjtTtqmCYsHjOYktEdqR3pvlfL1CbbEFp
 Erf451Q0U9xd2TE0okHwrBoM6Uj/S/YU9U/IxGYtgfApHSn+pObwwMdVek3JgtantSMNAwe1oY
 ApUM4bESWl6pLevvCz15ZVDt32FRqS4Vsn7l76dTyo2bC5VSAYJNNnkgHIix39tXC21KAoxkxi
 zej796SLP0xb7VBc5N3l53aa6rjJxF4UfQhOVM4fy4Xb7DXSuQXYFAwAA
X-Change-ID: 20250307-ptr-as-ptr-21b1867fc4d4
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
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
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
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

This series depends on "rust: retain pointer mut-ness in
`container_of!`"[1].

Link: https://lore.kernel.org/all/20250409-container-of-mutness-v1-1-64f472b94534@gmail.com/ [1]

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
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

 Makefile                               |  6 ++++++
 drivers/gpu/drm/drm_panic_qr.rs        |  2 +-
 rust/bindings/lib.rs                   |  3 +++
 rust/kernel/alloc/allocator_test.rs    |  2 +-
 rust/kernel/alloc/kvec.rs              |  4 ++--
 rust/kernel/block/mq/operations.rs     |  2 +-
 rust/kernel/block/mq/request.rs        |  6 +++---
 rust/kernel/device.rs                  |  4 ++--
 rust/kernel/device_id.rs               |  4 ++--
 rust/kernel/devres.rs                  | 19 ++++++++++---------
 rust/kernel/dma.rs                     |  6 +++---
 rust/kernel/error.rs                   |  2 +-
 rust/kernel/firmware.rs                |  3 ++-
 rust/kernel/fs/file.rs                 |  2 +-
 rust/kernel/io.rs                      | 18 +++++++++---------
 rust/kernel/kunit.rs                   | 11 +++++++----
 rust/kernel/list/impl_list_item_mod.rs |  2 +-
 rust/kernel/miscdevice.rs              |  2 +-
 rust/kernel/net/phy.rs                 |  4 ++--
 rust/kernel/of.rs                      |  6 +++---
 rust/kernel/pci.rs                     | 11 +++++++----
 rust/kernel/platform.rs                |  4 +++-
 rust/kernel/print.rs                   |  6 +++---
 rust/kernel/seq_file.rs                |  2 +-
 rust/kernel/str.rs                     | 14 +++++++-------
 rust/kernel/sync/poll.rs               |  2 +-
 rust/kernel/time/hrtimer/pin.rs        |  2 +-
 rust/kernel/time/hrtimer/pin_mut.rs    |  2 +-
 rust/kernel/uaccess.rs                 |  4 ++--
 rust/kernel/workqueue.rs               | 12 ++++++------
 rust/uapi/lib.rs                       |  3 +++
 31 files changed, 96 insertions(+), 74 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250307-ptr-as-ptr-21b1867fc4d4
prerequisite-change-id: 20250409-container-of-mutness-b153dab4388d:v1
prerequisite-patch-id: 53d5889db599267f87642bb0ae3063c29bc24863

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

