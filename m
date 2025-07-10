Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC23B006B6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF61D10E8FD;
	Thu, 10 Jul 2025 15:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Efw1+hT3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F05910E8F6;
 Thu, 10 Jul 2025 15:31:34 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6fac7147cb8so16006466d6.1; 
 Thu, 10 Jul 2025 08:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752161493; x=1752766293; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PJ81a17HeamyghbNr/oH4jUhMsYMdKxNULZ/jmmnBoI=;
 b=Efw1+hT3y973bTJO862IOKJTyg9Bw5rezdiQNjsgfFpXo3SQ6SS4FWfpiLq9ABeCl4
 JNvNGVgl+Cvrwc8i7yPxevyAA5E73vrxxyyxqsq319q4ZPz1KIOSPxYrtN6IR9Rc4W9T
 zPsGFVgkaPZBkmm1lSXP89XZCh9QRuuEW2ATq8BF4iF/4ni8GPATjRVhQa3N3jIM1ZQ7
 PlpPmP/q8RmV0SkkhjycfJ/5i/3I0yOSsyZlG1KHEIhOlNqSERaUD8ClXUVzlV0Py5FJ
 mAJTxAtU/DUocD7K8g6GjsHSZetEYkcpCCEGWV8OV1eDjkpfMawSY9oATTESWEsH1slt
 lnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752161493; x=1752766293;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PJ81a17HeamyghbNr/oH4jUhMsYMdKxNULZ/jmmnBoI=;
 b=Xvw54rHJj7m+e6UWt9cZKvbuavsZitctQ5tYgnkuLbz3TIxTZkXi+I5vKbSzA0ppLy
 1iyCP5WN8JRyVL1j4A0axVat9B94MlHBq3v27vOmTDwGvCsw0UUal3NfBKdOvmu0D5hC
 AXQd3cHjCXZmtWNylsonNqnS5LpTYMwPjSo/+SpPveBWeq8qKj77CuUGHP6qGJFXhgHV
 IMY15ATF00IxILEIcF1hmKF2idNbLzQSdwbGriOJsTeLtDe2kgqw9enPLy3E/wsSJKiS
 AzFjdUDNvXxWbDiMXBm4reQGTtxoaJAC9H6LU8nV7LhHoLX5jT0TRaIivF9uCRjcXAO7
 p/Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7xgfKudnRXyYcEL53rkfgT9TZO5DDLSI5ZDCBniA20bp2uRRBJgJjz0TZ8FmYtcjqImj72cfAXw==@lists.freedesktop.org,
 AJvYcCXV+t/AXImGC5eoLYqhuBSIjyl4jVESGkINo8mVHjqeH/dmmd2H7sZO/Pv3Xpsv2ap/MNYbqRWp/mM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlvipRYqy5XIXNJxA1lKkUXALHACrwm9B9ov2QrIq61eVF70M5
 t+LzHFoh+N+xKcSCtNdM3d3SJ/J3lSPYhzY0YDuuCf7H7qDUijWE2uOI
X-Gm-Gg: ASbGnctgDJ8oSTekws/LmDKq1bQdfPm9NHYAt64SMPbst8QBiE8oQZWS+VWzM0H4J3t
 lNZMthAllvUmp5AZoVno8+/3bPsrWk9zj8R0Y+lwhahW89f2J4mmVytVa0UwOG/xAjMsXgVgAQo
 EWQJU1oOB+Q3KQV12qDtIwBdbt3d1pmE0FyZXb3FkOLUx/DkZStURLYyAsYlQ0UKOhTbtooj4QN
 wrncvszEuiX+JzVcFYqQLveOPABHYqaBZK/Xt0SLGRH801mKoF4ARNM8aJHRQTSLUEIw8aJ/UU3
 BYqGh2t5JnJugifACZoCLtj46hjcL8hcoazIkdJfoGGc7atvpHNDStSIUs1F0+H0Fo4spRMTgLk
 rk6LtKYKHsgwBQFkn9X/yuajVOKdGDyhZjtLzUsNM/gIOOY6Ii6rJx/uscw==
X-Google-Smtp-Source: AGHT+IHyhWblIBlv3QU/fCCn2aGmY0JX2AC5lyib4/uFkdOS58IL7A+a9caFr6DSlEQJ2HFZdmHhrA==
X-Received: by 2002:a05:6214:19e9:b0:6ff:1542:6593 with SMTP id
 6a1803df08f44-70494e96f38mr76558186d6.17.1752161493050; 
 Thu, 10 Jul 2025 08:31:33 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-704979dbc3asm9449496d6.38.2025.07.10.08.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:31:32 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH 00/17] rust: replace `kernel::c_str!` with C-Strings
Date: Thu, 10 Jul 2025 11:31:03 -0400
Message-Id: <20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALncb2gC/5WQy27DIBBFf8ViXarhYTBe9T+qLAYYUqTYTowdR
 Yry78VJF0mlLrpBukjncC9XVmjOVFjfXNlM51zyNNYg3hoWvnDcE8+xZiZBtmAF8DDNxENZ5vu
 Rx33hIiGiUTJBiqyCx5lSvtyln7tHnum0VvfyuGQeS5VMw5CXvrHGkZLaG+MhOhlBJyXaCEG3C
 MlKq2yw2mn23KlvHo1APzWqDx2xBucdGbQ+tpb6s9jAgUrBV9I9kQnHaV244GfBgRutoCMrQaX
 wsR8wH95r2X9rUrROeUVth/JV83uGBPHzp5sqau+8cUJCSLX+38M3Io/hsEbiuF647bR1xlkjs
 dt27263bwmFx3/hAQAA
X-Change-ID: 20250710-core-cstr-cstrings-1faaa632f0fd
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Jens Axboe <axboe@kernel.dk>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752161488; l=7591;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=oyZ3TjBihPmmlJWbh0JEEf0NjNrm6tMD+c+onpK8gzY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QC/jkPLw8NNa0QjnV0hKL8LX4u30qhhAlzKBY9/gcAzZCxTR55S/KwdVIQtVHZtEvaJP5IcQafq
 IZbuF8rmx2AQ=
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

This series depends on step 3[0] which depends on steps 2a[1] and 2b[2]
which both depend on step 1[3].

This series also has a minor merge conflict with a small change[4] that
was taken through driver-core-testing. This series is marked as
depending on that change; as such it contains the post-conflict patch.

Subsystem maintainers: I would appreciate your `Acked-by`s so that this
can be taken through Miguel's tree (where the previous series must go).

Link  https://lore.kernel.org/all/20250710-cstr-core-v14-0-ca7e0ca82c82@gmail.com/ [0]
Link: https://lore.kernel.org/all/20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com/ [1]
Link: https://lore.kernel.org/all/20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com/ [2]
Link: https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com/ [3]
Link: https://lore.kernel.org/all/20250704-cstr-include-aux-v1-1-e1a404ae92ac@gmail.com/ [4]

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Tamir Duberstein (17):
      drivers: net: replace `kernel::c_str!` with C-Strings
      gpu: nova-core: replace `kernel::c_str!` with C-Strings
      rust: auxiliary: replace `kernel::c_str!` with C-Strings
      rust: clk: replace `kernel::c_str!` with C-Strings
      rust: configfs: replace `kernel::c_str!` with C-Strings
      rust: cpufreq: replace `kernel::c_str!` with C-Strings
      rust: device: replace `kernel::c_str!` with C-Strings
      rust: firmware: replace `kernel::c_str!` with C-Strings
      rust: kunit: replace `kernel::c_str!` with C-Strings
      rust: macros: replace `kernel::c_str!` with C-Strings
      rust: miscdevice: replace `kernel::c_str!` with C-Strings
      rust: net: replace `kernel::c_str!` with C-Strings
      rust: pci: replace `kernel::c_str!` with C-Strings
      rust: platform: replace `kernel::c_str!` with C-Strings
      rust: seq_file: replace `kernel::c_str!` with C-Strings
      rust: str: replace `kernel::c_str!` with C-Strings
      rust: sync: replace `kernel::c_str!` with C-Strings

 drivers/block/rnull.rs                |  2 +-
 drivers/cpufreq/rcpufreq_dt.rs        |  5 ++---
 drivers/gpu/drm/nova/driver.rs        | 10 +++++-----
 drivers/gpu/nova-core/driver.rs       |  6 +++---
 drivers/net/phy/ax88796b_rust.rs      |  7 +++----
 drivers/net/phy/qt2025.rs             |  5 ++---
 rust/kernel/clk.rs                    |  6 ++----
 rust/kernel/configfs.rs               |  5 ++---
 rust/kernel/cpufreq.rs                |  3 +--
 rust/kernel/device.rs                 |  4 +---
 rust/kernel/firmware.rs               |  6 +++---
 rust/kernel/kunit.rs                  | 11 ++++-------
 rust/kernel/net/phy.rs                |  6 ++----
 rust/kernel/platform.rs               |  4 ++--
 rust/kernel/seq_file.rs               |  4 ++--
 rust/kernel/str.rs                    |  5 ++---
 rust/kernel/sync.rs                   |  5 ++---
 rust/kernel/sync/completion.rs        |  2 +-
 rust/kernel/workqueue.rs              |  8 ++++----
 rust/macros/kunit.rs                  | 10 +++++-----
 rust/macros/module.rs                 |  2 +-
 samples/rust/rust_configfs.rs         |  5 ++---
 samples/rust/rust_driver_auxiliary.rs |  4 ++--
 samples/rust/rust_driver_faux.rs      |  4 ++--
 samples/rust/rust_driver_pci.rs       |  4 ++--
 samples/rust/rust_driver_platform.rs  |  4 ++--
 samples/rust/rust_misc_device.rs      |  3 +--
 scripts/rustdoc_test_gen.rs           |  4 ++--
 28 files changed, 63 insertions(+), 81 deletions(-)
---
base-commit: 769e324b66b0d92d04f315d0c45a0f72737c7494
change-id: 20250710-core-cstr-cstrings-1faaa632f0fd
prerequisite-change-id: 20250704-core-cstr-prepare-9b9e6a7bd57e:v1
prerequisite-patch-id: 83b1239d1805f206711a5a936bbb61c83227d573
prerequisite-patch-id: a0355dd0efcc945b0565dc4e5a0f42b5a3d29c7e
prerequisite-patch-id: 8585bf441cfab705181f5606c63483c2e88d25aa
prerequisite-patch-id: 04ec344c0bc23f90dbeac10afe26df1a86ce53ec
prerequisite-patch-id: a2fc6cd05fce6d6da8d401e9f8a905bb5c0b2f27
prerequisite-patch-id: f14c099c87562069f25fb7aea6d9aae4086c49a8
prerequisite-message-id: 20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com
prerequisite-patch-id: fa79c5d8fd2762b5e488ba017e13a5774d933f81
prerequisite-patch-id: c338aa49e1319e9e802de2ad8bb0fa688bce9d9c
prerequisite-patch-id: 589a352ba7f7c9aefefd84dfd3b6b20e290b0d14
prerequisite-patch-id: 29fc25261295349f6747d1bb409cf18130e9aa69
prerequisite-patch-id: 3d89601bba1fb01d190b0ba415b28ad9cbf1e209
prerequisite-patch-id: 10923aebf24011b727f60496c0f9e0ad57e0a967
prerequisite-patch-id: 56583fd829951fb4fac843c6b1874c643b726de0
prerequisite-patch-id: 9a7e8ba460358985147efd347658be31fbc78ba2
prerequisite-patch-id: 5821a23334e317cd0351b8e4404b9e3b36b72d67
prerequisite-message-id: 20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com
prerequisite-patch-id: 0ccc3545ff9bf22a67b79a944705cef2fb9c2bbf
prerequisite-patch-id: b1866166714606d5c11a4d7506abe4c2f86dac8d
prerequisite-patch-id: 163b8ff1edaf8e48976fd5de3f64e68fc38c7277
prerequisite-patch-id: 8fee5e2daf0749362331dad4fc63d907a01b14e9
prerequisite-patch-id: 366ef1f93fb40b1d039768f2041ff79995e7e228
prerequisite-patch-id: 1d350291f9292f910081856d8f7d5e4d9545cfd1
prerequisite-patch-id: 9a6a60bd2b209126de64c16a77a3a1d229dd898c
prerequisite-patch-id: 08ae5855768ec3b4c68272b86d2a0e0667c9aa47
prerequisite-patch-id: f15b54927660a03b52ffb34fb7943ac3228b7803
prerequisite-patch-id: f0dbf0a55a27fe8e199e242d1f79ea800d1ddb66
prerequisite-change-id: 20250201-cstr-core-d4b9b69120cf:v14
prerequisite-patch-id: 83b1239d1805f206711a5a936bbb61c83227d573
prerequisite-patch-id: a0355dd0efcc945b0565dc4e5a0f42b5a3d29c7e
prerequisite-patch-id: 8585bf441cfab705181f5606c63483c2e88d25aa
prerequisite-patch-id: 04ec344c0bc23f90dbeac10afe26df1a86ce53ec
prerequisite-patch-id: a2fc6cd05fce6d6da8d401e9f8a905bb5c0b2f27
prerequisite-patch-id: f14c099c87562069f25fb7aea6d9aae4086c49a8
prerequisite-patch-id: 0ccc3545ff9bf22a67b79a944705cef2fb9c2bbf
prerequisite-patch-id: b1866166714606d5c11a4d7506abe4c2f86dac8d
prerequisite-patch-id: 163b8ff1edaf8e48976fd5de3f64e68fc38c7277
prerequisite-patch-id: 8fee5e2daf0749362331dad4fc63d907a01b14e9
prerequisite-patch-id: 366ef1f93fb40b1d039768f2041ff79995e7e228
prerequisite-patch-id: 1d350291f9292f910081856d8f7d5e4d9545cfd1
prerequisite-patch-id: 9a6a60bd2b209126de64c16a77a3a1d229dd898c
prerequisite-patch-id: 08ae5855768ec3b4c68272b86d2a0e0667c9aa47
prerequisite-patch-id: f15b54927660a03b52ffb34fb7943ac3228b7803
prerequisite-patch-id: f0dbf0a55a27fe8e199e242d1f79ea800d1ddb66
prerequisite-patch-id: fa79c5d8fd2762b5e488ba017e13a5774d933f81
prerequisite-patch-id: c338aa49e1319e9e802de2ad8bb0fa688bce9d9c
prerequisite-patch-id: 589a352ba7f7c9aefefd84dfd3b6b20e290b0d14
prerequisite-patch-id: 29fc25261295349f6747d1bb409cf18130e9aa69
prerequisite-patch-id: 3d89601bba1fb01d190b0ba415b28ad9cbf1e209
prerequisite-patch-id: 10923aebf24011b727f60496c0f9e0ad57e0a967
prerequisite-patch-id: 56583fd829951fb4fac843c6b1874c643b726de0
prerequisite-patch-id: 9a7e8ba460358985147efd347658be31fbc78ba2
prerequisite-patch-id: 5821a23334e317cd0351b8e4404b9e3b36b72d67
prerequisite-patch-id: 9c0a6624ed7b7e1d0373985c5c084a844e7c49ce
prerequisite-patch-id: 6d8dbdf864f79fc0c2820e702a7cb87753649ca0
prerequisite-patch-id: 2bc4afce0104c13c0dd4d50923b0db2f5cd11129
prerequisite-change-id: 20250704-cstr-include-aux-7847969762a8:v1
prerequisite-patch-id: 1f79f64dd9b8a092ff039e6c7fad1430afb8ea25

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

