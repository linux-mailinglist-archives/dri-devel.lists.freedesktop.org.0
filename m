Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AE1A70B04
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 21:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265FB10E058;
	Tue, 25 Mar 2025 20:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ehnOyCAh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6BD10E058
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 20:07:49 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6e8ffa00555so49046686d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 13:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742933268; x=1743538068; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=De1j2kxM+B3PrrF0JXUY7dB3WGtLTgac0gJhkCjYocc=;
 b=ehnOyCAhs2bflhShiwc03jXfqNQlkSTOKhV7j77WQvyqWsH1jO2gm7qapVqKx5GZEC
 bzkmXYAnLxa9QT9vmQ89LinaIfzPUVNfOGBJvjc1IDwayhzpy4lKjTahYeRmEkKa6sdV
 raDtyPAsuu+Jkei2uYmjceEx2FoqnyDHJID8oJ/2Z7jSx8TsNSvBAzMNbZbDMr8lgokZ
 IVo0TINyEB4WECOvtF1VzL/U7NSS6h2OSlCWnG5ZEM5x4gyVt/pUU+EuFTAaxLMnxrRq
 9pGmHIzvWyusKSYN/IDHP4DFmPpuixFCEO6R5OMmgnheCols2xR1Oal+Wsau2QT4xaw5
 fqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742933268; x=1743538068;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=De1j2kxM+B3PrrF0JXUY7dB3WGtLTgac0gJhkCjYocc=;
 b=wBc17U+fjIgYwTZ9z+LpGrRlLvn0MYPvZapTCzxAKAqweGJwe6aLVtKUqhouofwMbg
 77QXd+ung4lKmw8oBdZ+RXFhCpkcB9t47SHmLiZXa9pw9AlHIAXTEu4C3a2p/eaTZoLL
 XBC2M2POeSkwA34qpiMsNINp1e1hOwRLjbkItpQ2W15ZA4E5AKaVHW9Njb4OtlXC6LW8
 sYUXdFbXB3wa3GSP92/oqhA14hqu/61+IJUxA2jbY6O5y9UmgA4NYpRxY0OVymBxnbKe
 MbFSTFt6YqjatB8zvvjhzsbIpbyHLO0nhnmtdS2NRN48Xopy3EwPKvATzHHiKJgK8+ZD
 yOnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQmQCL1ZSsavHLgjziKhrtqSMZ1pYlI2hKwjG7lZnxpnceDp9QWMJX4xhxBxlO4Uvhlu+4vMbR4xY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxbd1BZpwuk5PtGcwR+2uDH2nWaoXO38xVvlf94nodw0q3gJg3e
 tWaKkF6Sk1frUTHK/No8V4ROlcU0kILtfZkAI5/pRE1r0+6bD9vLJcXs5q9CxeE=
X-Gm-Gg: ASbGncuHrLMeowEuAXfM5E4ojda7kC7hh+GPsjgkRd1eF3gXc2hGN+n0dISG0xlTu8e
 aedUv/FSLfYXx/a2o/k2wyq2yoBNtAZQCNtB0KU3QIuiQ712hpaxhLaYZKPOfeAkyLpzs6A5xcr
 8XEn1V79Tv9MuEAt9Q4wepY66l4m19zuMqNz2rRbQuUITzsDgB6QfHONwkExnQOlkQqcNBXl8FF
 6u9PwOOrnxQVPjZOd8LPbuwUeohjH2557c9ZFfZVYD2/F/ZZojzYUvP1CuPXmhenHYE+cAKaZX1
 HM7zVQllugBFGg8T3wrlYSq2ukNQIyEWiUHhLJh7HE3eaRxzDUGuWvgCM1zI58rgqh0A3QYwMNj
 ZQxztjfW4USD7rffo4Jg2FYzsXWXnDa6Pcl9HdQeiQBwdfnKVkWi2TIj2UFMhv/Ro
X-Google-Smtp-Source: AGHT+IGLBNBsuCm5QT13IWM9Uun0NwuqyHHphAVZs3TNbnowX2o/8kuPM4uDvAmDt8ri644wQ+EGig==
X-Received: by 2002:ad4:5c42:0:b0:6e8:f91a:c5a with SMTP id
 6a1803df08f44-6eb3f2d5384mr324494996d6.22.1742933268279; 
 Tue, 25 Mar 2025 13:07:48 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:38f6]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eb3ef31810sm59790316d6.64.2025.03.25.13.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 13:07:47 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v7 0/7] rust: reduce `as` casts, enable related lints
Date: Tue, 25 Mar 2025 16:07:40 -0400
Message-Id: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAwN42cC/23PTW7DIBAF4KtErEvFjAewu+o9qiz4TZCaOILIa
 hT57iVegdsVekjfm5knKyGnUNjH4clyWFJJ87UG/XZg7myup8CTr5mhQCkGofntnrkp24NgYVQ
 6OvLEKrjlENPPVvZ1rPmcyn3Oj617gdfvvzULcOByRC+UBHLT+Hm6mPT97uYLe9Us2NKpo8gFR
 +mVMH5CtHpPh4YCdXSoNGhrFAgaI5k9pZbKjlKlFr1GB+Qdqj2VLe1vlZVKKyNCNDiIP1NVQ7F
 fWFVKkweroyecREvXdf0FAc7SdcsBAAA=
X-Change-ID: 20250307-ptr-as-ptr-21b1867fc4d4
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
 FUJITA Tomonori <fujita.tomonori@gmail.com>
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
pointer casts weren't missed. The first commit reduces the need for
pointer casts and is shared with another series[1].

As a later addition, `clippy::cast_lossless` and `clippy::ref_as_ptr`
are also enabled.

Link: https://lore.kernel.org/all/20250307-no-offset-v1-0-0c728f63b69c@gmail.com/ [1]

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
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
Tamir Duberstein (7):
      rust: retain pointer mut-ness in `container_of!`
      rust: enable `clippy::ptr_as_ptr` lint
      rust: enable `clippy::ptr_cast_constness` lint
      rust: enable `clippy::as_ptr_cast_mut` lint
      rust: enable `clippy::as_underscore` lint
      rust: enable `clippy::cast_lossless` lint
      rust: enable `clippy::ref_as_ptr` lint

 Makefile                               |  6 ++++++
 drivers/gpu/drm/drm_panic_qr.rs        | 10 +++++-----
 rust/bindings/lib.rs                   |  3 +++
 rust/kernel/alloc/allocator_test.rs    |  2 +-
 rust/kernel/alloc/kvec.rs              |  4 ++--
 rust/kernel/block/mq/operations.rs     |  2 +-
 rust/kernel/block/mq/request.rs        |  7 ++++---
 rust/kernel/device.rs                  |  5 +++--
 rust/kernel/device_id.rs               |  5 +++--
 rust/kernel/devres.rs                  | 19 ++++++++++---------
 rust/kernel/dma.rs                     |  6 +++---
 rust/kernel/error.rs                   |  2 +-
 rust/kernel/firmware.rs                |  3 ++-
 rust/kernel/fs/file.rs                 |  3 ++-
 rust/kernel/io.rs                      | 18 +++++++++---------
 rust/kernel/kunit.rs                   | 15 +++++++--------
 rust/kernel/lib.rs                     |  5 ++---
 rust/kernel/list/impl_list_item_mod.rs |  2 +-
 rust/kernel/miscdevice.rs              |  2 +-
 rust/kernel/net/phy.rs                 |  4 ++--
 rust/kernel/of.rs                      |  6 +++---
 rust/kernel/pci.rs                     | 13 ++++++++-----
 rust/kernel/platform.rs                |  6 ++++--
 rust/kernel/print.rs                   | 11 +++++------
 rust/kernel/rbtree.rs                  | 23 ++++++++++-------------
 rust/kernel/seq_file.rs                |  3 ++-
 rust/kernel/str.rs                     | 14 +++++++-------
 rust/kernel/sync/poll.rs               |  2 +-
 rust/kernel/uaccess.rs                 |  5 +++--
 rust/kernel/workqueue.rs               | 12 ++++++------
 rust/uapi/lib.rs                       |  3 +++
 31 files changed, 120 insertions(+), 101 deletions(-)
---
base-commit: 28bb48c4cb34f65a9aa602142e76e1426da31293
change-id: 20250307-ptr-as-ptr-21b1867fc4d4

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

