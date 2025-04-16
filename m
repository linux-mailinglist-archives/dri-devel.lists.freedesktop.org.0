Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F60A90A09
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 19:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2172910E101;
	Wed, 16 Apr 2025 17:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X5gQroLI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C88E10E101
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 17:36:23 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4769f3e19a9so44546631cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 10:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744824982; x=1745429782; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zq0j01UzuoIZjvjIYeTFfavzOYMv54omrnlCDWGJJC8=;
 b=X5gQroLIF8ZChFuQ8PtfLjFriEKAjQHh/c0jf1fxPgSX2Cm2bJ1Nwv+Wjn8w98UX5B
 0jsuIUEzrqNxBewqu8E7fp1AxGaRyyN7ED9j2toJB9TqppzVo3VpPzh950lfrkpdvYu2
 wfao6h0hKmz1wOmd6WwoIMUwzT2EFBMZIRPt7C0+Gh6lwn8Jj0yg5XPc/TvLRtdFaUPM
 KhryJH87JXt3Ettt/cygzSi3RXzRwnmYPbePAn1Fsy8V0kGp2N7D/fu5asVTavKbF3yB
 2E7m6b3FZk49f/SQ2Ms20kXzExlgO78D9E4cNl8O4NIS59YCrtqP+EqSY+GpKMlDezOt
 NjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744824982; x=1745429782;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zq0j01UzuoIZjvjIYeTFfavzOYMv54omrnlCDWGJJC8=;
 b=UJWPGX7N9mtB0xDstzxs5N/37USa+d8PIliFmU5k53IV65As4mbxDEwii5/Kb+hPP6
 VhYgxutU7R0rtOp+dpkKKqy/+W98ZD50MbEmuMBtG53gMKJpCh2jCMyhPsMcKF+HFNAK
 SQIlAzeZkgkW9ecomL6wui8enstGqDWOJvxobCYeQIvbE+YicerPmFC0PR+vCZzesMUd
 JC4ICScnb9NmO0GY5JXy1SXxLhU59ZCWZs1DUgZzcI2Gv7vDTUUBL1uZiT4h707DN9kc
 RQHCvvm51179TFwQ4gFW6YOPsZbfZeA1BykEEk8QspwkBFEm4JZJy5QzjD/mKwFsR6aT
 p36g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAETzyp8FlDuEfxbngtar1q3+NkCaECShTKxDFUFsrT0fQNYv1OWdoDB2xrQkAw5SKgK9Cx/6/jD8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/hRSJXKxG29TiiBI//PfTuCNiX0Ol9RvmnCTFmLChHi/S95Lx
 5WohFdSSWnHIUnnFlLFMtEsxlOVqk4K80D0m/ZZXeSx3fca/kQ47
X-Gm-Gg: ASbGnctOp9CLV2VP75KyX+gZLq9uGYmTVyANzpoUOWtF30jLG09BCIOZNThvqwS6DHe
 kHlhXbnGAThY/Hf7Sgp/4Qe0oettrRAN7YS+00NdO5t12xDBAmLNCciL+oyZMCWtbc3muY2fgS/
 FHUm6c+ZA5poJNBnnesLTHLoHqIlm6QqUo1xm4JRbKHSU6cD9wDkuRMkghWqtI+Bqggo1HSYH8F
 JOq6YOGWGHwygnm4ikYDjxq3VbWktjs0G4Kqo+Bdc4jlsRLpO7En/SFIQCzUJYXiHWnElfl3YtM
 wtn+VGdCRdFjiWD3QBq6OwYa/OOPLeFE7i63iN0dwPat8R67SkTQcGvB/Ypa5uUMuKDeuFWJMh7
 lHjyQZNb/cNr/YgWNPuSpmd96QKdewDv1JgWtZpI3FVb9
X-Google-Smtp-Source: AGHT+IGhI/osbo9sS2h15D+R1UFFUx18jwf20QnH/freiMK9Gsyc+DLKTSMa3Jd5HnAi9ZL7/q9xVA==
X-Received: by 2002:ad4:5f8e:0:b0:6e4:2d8e:5cce with SMTP id
 6a1803df08f44-6f2b301b8bamr41325666d6.36.1744824981526; 
 Wed, 16 Apr 2025 10:36:21 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:a61d]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f0dea07c50sm118289886d6.77.2025.04.16.10.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 10:36:21 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v9 0/6] rust: reduce `as` casts, enable related lints
Date: Wed, 16 Apr 2025 13:36:04 -0400
Message-Id: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAITq/2cC/23SzW7DIAwA4FeJOI8JjPlJTnuPqQd+O6Ql6UIab
 ar67qOttCXZTsigzxjsCylxyrGQrrmQKS655HGoQfvUEP9mh2OkOdSYAAPJBNP0NE/UlvsC3HG
 jdPIYkFRwmmLKn/dkr4cav+Uyj9PXPffCb7v/plk45VQaCExJjr41L8fe5vdnP/bklmaBNW03F
 CijIINiNrQATu+pWFGOGyoqjdpZxRmahHZPcU3lhmKlDoIGzzF4UHsq13T7VlmpdDIBTxYE+3O
 rWlHYFqwqxTZwp1NAaNme6jXdFqwrNdo6lMBRu3ZPzS/F3Q+bSoUWhikuBca0ptdH06f4ca6DM
 z86T5wtkdbzPs9dw2yCpFzkDsFwYaRT3HhnVG0YqhhiYKa13pD1wHXNTyl+HGabhzjRMdH+PA+
 xFOpqKaG+RhgTujpZh+v1G0fx+l3JAgAA
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

