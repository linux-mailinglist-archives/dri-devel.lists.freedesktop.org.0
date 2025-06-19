Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8919AAE09A4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 17:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F4F10E096;
	Thu, 19 Jun 2025 15:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WuJyLejW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D8310E096;
 Thu, 19 Jun 2025 15:06:31 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4a5851764e1so16269271cf.2; 
 Thu, 19 Jun 2025 08:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750345590; x=1750950390; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nXuTpoOb8+LqU5quDMVJCzI6iZgIaVm2IMUXk0GHfM4=;
 b=WuJyLejWOeTYCcU6FYxnqqlEXIHN2HZmhByBxNsMNvAkhqFyc2IifkrnamdAmKF6wX
 mxJycSZ2Jo9mtF6+H7+bsK8iEPiXmmpW1FGKhXajD/+J3XuKhynmcmM0TxsX/SwuC8Yj
 mFOEqmpHjXrfdvlYSOPXjh87aQ7ALSH00ce+yzx75aD3FXNkbnKxGJ5TkqXT6zPUuUub
 YMykge1DFwlnJefiwky52zyag7JzqipVzkkF6n13MskyPTpBccGbEzzk4STNzsljy2/U
 zpFVdVGfQBxrgICU8QvSPlkQSoRAJsETMGSy5i0vLtwWU0FgaX2KyzH8qkKB3NdHSKyF
 VLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750345590; x=1750950390;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nXuTpoOb8+LqU5quDMVJCzI6iZgIaVm2IMUXk0GHfM4=;
 b=u7h8UGovGrya7oZ14REdmiemJ9tyewPSE70IMnCukvFcvYeNZTOCdUgwxHZiMjIBXC
 6cHS183HBjIK/e9MjtbYRiuHtqDiC90OYPs2grb5iyuSORTE6tkBgDBhVLqNDjWDg3WR
 J1qeg2skRhy1To023X4NFmup9hMTLQVkO2be99TupWBJw2CNEjaYW+XMnmPgBG8scUnq
 zLAsvE2T2A1SjlYvafs8uZ3OTA3gahcJPvIlZ6yAeeReLqtI3XZOpj0jRybDX2SebaFR
 ctMjA8PaoQUpO9eGDrNfeJPam/3tB1ZK9jTVVu8xePCRT2xn5VDAVuWIKZTxBjJjOp9x
 Isqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6IMq1C9uCMo3PBtL3hCLs7MV3woFVyyWOhWg9WpdacmV7RGk3WHQBPclL8k22XCxGeL6b07YRTQ==@lists.freedesktop.org,
 AJvYcCWS0YTbHLhp35xYUnQ9lXHu7fikje+pigWp30X1k0ef3QTfNY5ZHvHh1byKfHlgU1lf1j6UiLwqivI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSeR9CsngX+jIDjbyfhQZsLDtdnxJ6EfYnt4sDt9SN26p18yih
 BbwsoSliNhmEE90VXZw1C6jxZhrGMhP6/0leKo34YyJ4R+ndQ/ohRaSe
X-Gm-Gg: ASbGncsvCrDJUv2BXChHCfbma6hivnp0NkP2oKWfaRj/nWf+EOlMzDTYFZADiSwe7c3
 YEzCq019WLfz5QuEBzToA7ACPmxdBP3y4gnQcZIV/MdcdXM7Vf7Wz3An4OHj1Wl5h8rgp5ZneAZ
 SgJz4mRqycGiBb2Lwn3nx9qTQL28ifk0dy7eHa2mOWR/oDscPmNOOFQh/uQTyeQbzAi09lWnNDH
 upIjSjn++urVTMnM8c5VDQfhNq/SssOYmMnLz6JsCNrQMedyD0ZHtbpJ8o3pyvQCZSkTCKd6/eK
 ioJFvzz7tTLRz6f1/81U260x605zCob0PBYiMSfCR9xNGaVo5ciwIxfXvYcNOe19C0fy2+CXEFw
 =
X-Google-Smtp-Source: AGHT+IFX/JE8xs0dtWJTtpxoAw108+yxpwrRoiMuu696MghqABs29FkJDRGkGOS7haSa53S3zqGnCw==
X-Received: by 2002:a05:622a:11c1:b0:476:7199:4da1 with SMTP id
 d75a77b69052e-4a73c5ed5bemr350669851cf.46.1750345590333; 
 Thu, 19 Jun 2025 08:06:30 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:5c8a:fc6a:b57c:e57f])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a7785aaacdsm250531cf.39.2025.06.19.08.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 08:06:29 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v12 0/5] rust: replace kernel::str::CStr w/ core::ffi::CStr
Date: Thu, 19 Jun 2025 11:06:24 -0400
Message-Id: <20250619-cstr-core-v12-0-80c9c7b45900@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHAnVGgC/3XOwW6DMAwG4FepOC+VbRKT9NT3mHaAJJRog1QBo
 VUV775QqSvttKPjfL//azH6FPxYHHbXIvk5jCEOeUB62xW2q4eTF8Hlh4KAFBCgsOOUhI3JCyc
 b07BBAtsW+f85+TZ838LeP/LcptiLqUu+vidI0GhQlax4T1pDJUjMtYspzuPn5XhOcYpDX4evv
 Y39GtmFcYrpcqs38xp8L0KbIjMLEFqysY4dmdYdT78ha5G5+ldWWboadV4RyFK/Sr2V5VbqLG1
 TtsS+0qz5VZqHLLHaSpOlQsfWKqKW6VUiPKgiuaUI2bJEqo10xlXqj8WNLeHJ4trYGQu2sY2Bp
 7vLsvwAOlZtqwwCAAA=
X-Change-ID: 20250201-cstr-core-d4b9b69120cf
To: Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Jens Axboe <axboe@kernel.dk>, Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
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

This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
have omitted Co-authored tags, as the end result is quite different.

Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vadorovsky@protonmail.com/t/#u [0]
Closes: https://github.com/Rust-for-Linux/linux/issues/1075

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v12:
- Introduce `kernel::fmt::Display` to allow implementations on foreign
  types.
- Tidy up doc comment on `str_to_cstr`. (Alice Ryhl).
- Link to v11: https://lore.kernel.org/r/20250530-cstr-core-v11-0-cd9c0cbcb902@gmail.com

Changes in v11:
- Use `quote_spanned!` to avoid `use<'a, T>` and generally reduce manual
  token construction.
- Add a commit to simplify `quote_spanned!`.
- Drop first commit in favor of
  https://lore.kernel.org/rust-for-linux/20240906164448.2268368-1-paddymills@proton.me/.
  (Miguel Ojeda)
- Correctly handle expressions such as `pr_info!("{a}", a = a = a)`.
  (Benno Lossin)
- Avoid dealing with `}}` escapes, which is not needed. (Benno Lossin)
- Revert some unnecessary changes. (Benno Lossin)
- Rename `c_str_avoid_literals!` to `str_to_cstr!`. (Benno Lossin &
  Alice Ryhl).
- Link to v10: https://lore.kernel.org/r/20250524-cstr-core-v10-0-6412a94d9d75@gmail.com

Changes in v10:
- Rebase on cbeaa41dfe26b72639141e87183cb23e00d4b0dd.
- Implement Alice's suggestion to use a proc macro to work around orphan
  rules otherwise preventing `core::ffi::CStr` to be directly printed
  with `{}`.
- Link to v9: https://lore.kernel.org/r/20250317-cstr-core-v9-0-51d6cc522f62@gmail.com

Changes in v9:
- Rebase on rust-next.
- Restore `impl Display for BStr` which exists upstream[1].
- Link: https://doc.rust-lang.org/nightly/std/bstr/struct.ByteStr.html#impl-Display-for-ByteStr [1]
- Link to v8: https://lore.kernel.org/r/20250203-cstr-core-v8-0-cb3f26e78686@gmail.com

Changes in v8:
- Move `{from,as}_char_ptr` back to `CStrExt`. This reduces the diff
  some.
- Restore `from_bytes_with_nul_unchecked_mut`, `to_cstring`.
- Link to v7: https://lore.kernel.org/r/20250202-cstr-core-v7-0-da1802520438@gmail.com

Changes in v7:
- Rebased on mainline.
- Restore functionality added in commit a321f3ad0a5d ("rust: str: add
  {make,to}_{upper,lower}case() to CString").
- Used `diff.algorithm patience` to improve diff readability.
- Link to v6: https://lore.kernel.org/r/20250202-cstr-core-v6-0-8469cd6d29fd@gmail.com

Changes in v6:
- Split the work into several commits for ease of review.
- Restore `{from,as}_char_ptr` to allow building on ARM (see commit
  message).
- Add `CStrExt` to `kernel::prelude`. (Alice Ryhl)
- Remove `CStrExt::from_bytes_with_nul_unchecked_mut` and restore
  `DerefMut for CString`. (Alice Ryhl)
- Rename and hide `kernel::c_str!` to encourage use of C-String
  literals.
- Drop implementation and invocation changes in kunit.rs. (Trevor Gross)
- Drop docs on `Display` impl. (Trevor Gross)
- Rewrite docs in the style of the standard library.
- Restore the `test_cstr_debug` unit tests to demonstrate that the
  implementation has changed.

Changes in v5:
- Keep the `test_cstr_display*` unit tests.

Changes in v4:
- Provide the `CStrExt` trait with `display()` method, which returns a
   `CStrDisplay` wrapper with `Display` implementation. This addresses
   the lack of `Display` implementation for `core::ffi::CStr`.
- Provide `from_bytes_with_nul_unchecked_mut()` method in `CStrExt`,
   which might be useful and is going to prevent manual, unsafe casts.
- Fix a typo (s/preffered/prefered/).

Changes in v3:
- Fix the commit message.
- Remove redundant braces in `use`, when only one item is imported.

Changes in v2:
- Do not remove `c_str` macro. While it's preferred to use C-string
   literals, there are two cases where `c_str` is helpful:
   - When working with macros, which already return a Rust string literal
     (e.g. `stringify!`).
   - When building macros, where we want to take a Rust string literal as an
     argument (for caller's convenience), but still use it as a C-string
     internally.
- Use Rust literals as arguments in macros (`new_mutex`, `new_condvar`,
   `new_mutex`). Use the `c_str` macro to convert these literals to C-string
   literals.
- Use `c_str` in kunit.rs for converting the output of `stringify!` to a
   `CStr`.
- Remove `DerefMut` implementation for `CString`.

---
Tamir Duberstein (5):
      rust: macros: reduce collections in `quote!` macro
      rust: support formatting of foreign types
      rust: replace `CStr` with `core::ffi::CStr`
      rust: replace `kernel::c_str!` with C-Strings
      rust: remove core::ffi::CStr reexport

 drivers/block/rnull.rs                |   4 +-
 drivers/cpufreq/rcpufreq_dt.rs        |   5 +-
 drivers/gpu/drm/drm_panic_qr.rs       |   5 +-
 drivers/gpu/drm/nova/driver.rs        |  10 +-
 drivers/gpu/nova-core/driver.rs       |   6 +-
 drivers/gpu/nova-core/firmware.rs     |   2 +-
 drivers/gpu/nova-core/gpu.rs          |   4 +-
 drivers/gpu/nova-core/nova_core.rs    |   2 +-
 drivers/net/phy/ax88796b_rust.rs      |   8 +-
 drivers/net/phy/qt2025.rs             |   6 +-
 rust/kernel/auxiliary.rs              |   6 +-
 rust/kernel/block/mq.rs               |   2 +-
 rust/kernel/clk.rs                    |   9 +-
 rust/kernel/configfs.rs               |  14 +-
 rust/kernel/cpufreq.rs                |   6 +-
 rust/kernel/device.rs                 |   9 +-
 rust/kernel/devres.rs                 |   2 +-
 rust/kernel/driver.rs                 |   4 +-
 rust/kernel/drm/device.rs             |   4 +-
 rust/kernel/drm/driver.rs             |   3 +-
 rust/kernel/drm/ioctl.rs              |   2 +-
 rust/kernel/error.rs                  |  10 +-
 rust/kernel/faux.rs                   |   5 +-
 rust/kernel/firmware.rs               |  16 +-
 rust/kernel/fmt.rs                    |  89 +++++++
 rust/kernel/kunit.rs                  |  21 +-
 rust/kernel/lib.rs                    |   3 +-
 rust/kernel/miscdevice.rs             |   5 +-
 rust/kernel/net/phy.rs                |  12 +-
 rust/kernel/of.rs                     |   5 +-
 rust/kernel/pci.rs                    |   2 +-
 rust/kernel/platform.rs               |   6 +-
 rust/kernel/prelude.rs                |   5 +-
 rust/kernel/print.rs                  |   4 +-
 rust/kernel/seq_file.rs               |   6 +-
 rust/kernel/str.rs                    | 444 ++++++++++------------------------
 rust/kernel/sync.rs                   |   7 +-
 rust/kernel/sync/condvar.rs           |   4 +-
 rust/kernel/sync/lock.rs              |   4 +-
 rust/kernel/sync/lock/global.rs       |   6 +-
 rust/kernel/sync/poll.rs              |   1 +
 rust/kernel/workqueue.rs              |   9 +-
 rust/macros/fmt.rs                    |  99 ++++++++
 rust/macros/kunit.rs                  |  10 +-
 rust/macros/lib.rs                    |  19 ++
 rust/macros/module.rs                 |   2 +-
 rust/macros/quote.rs                  | 111 ++++-----
 samples/rust/rust_configfs.rs         |   9 +-
 samples/rust/rust_driver_auxiliary.rs |   7 +-
 samples/rust/rust_driver_faux.rs      |   4 +-
 samples/rust/rust_driver_pci.rs       |   4 +-
 samples/rust/rust_driver_platform.rs  |   4 +-
 samples/rust/rust_misc_device.rs      |   3 +-
 scripts/rustdoc_test_gen.rs           |   6 +-
 54 files changed, 540 insertions(+), 515 deletions(-)
---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250201-cstr-core-d4b9b69120cf

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

