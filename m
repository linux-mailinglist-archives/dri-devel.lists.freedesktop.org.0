Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488B0B0B250
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A214910E36E;
	Sat, 19 Jul 2025 22:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TEuU4oKa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A0E10E36E
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 22:42:39 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4ab3fb340e7so58281151cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 15:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964958; x=1753569758; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IygnV2q5DszF2Xyq5UT04w5qsH2QajCQoqita4sP000=;
 b=TEuU4oKaGlSUPV1tVr7moPK+NN8+h1Bvr0YLehr+B7hlSuTbGMB10uK8Yr8GtD40lU
 kSXypnN40LobLtPJ1YvTVsV+sK4X3JN5TGFwo1FenliWMtVjFYK4+Ojthqog6NDbQr9j
 csXI9cffL0cGAY4+l8DWn9/aAVYyulhnm2X5DGivmU47pOS4P2An0yohOeim8jf3TYMI
 RU+vOh20oC6kVHz8i6Yw5G8ylFkSFll5ZJbAY8q2JUPe+EK0jFaxWZcttR45Ab+hmywM
 2oxm36Y6x60ESpG8gh2JeRQ0PidF7s3pUxJSlXsWKEw1KshIftWQ1KTKCGlXGQ/fNmNM
 QYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964958; x=1753569758;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IygnV2q5DszF2Xyq5UT04w5qsH2QajCQoqita4sP000=;
 b=Clsdv4BiS1Aa6mgOQK6CDYx6ZgrwUDDJ4xtM1GZL/xZNk5ueKgSMKn5aC4KGvf6WGd
 ZTX4fkYsr1DnLYuitn7gR4qOu3EAlqj0sI9LfWIQflLRSqmdot1zex8GILvFwEiA1uGV
 oICY2qVu+L+YaKKR9rcf9MHBMcpcNF45NfRokD9JL6iYDSjL5DfIWoDn+P7XELonmThV
 /3ZfDtqXy23/qu/9J59gVH6P+NVDtiYB/YrKjF1iHAjH2OqzeXnT+Q1dMpt8pnO9tncX
 6bxZ4KP0zjvLrnlgw6oDdDmLlMJnnTNVjqhSNGkosQ5poO1dhxucUU4cYRJTywpjCLxZ
 CcFA==
X-Gm-Message-State: AOJu0YxncYZNmH0+1TKX7hAWEt4dGiPo1aEfxvVY0hSnnk8M97Jrb1Hp
 p7dDuspJFQ433ihRFR5hw4zUsxbxwrzO9M2rqQB0vcqwQzaffC6pifkP
X-Gm-Gg: ASbGnctm1a9EBO//aqHpx5bxRQBTqFYhaFRW9ySNof1DqX1hrGvbfL9uBV196ZP2l9P
 iTlfSsUJCuzlLJBC7rMRWwtuPLroGmeoE1lQC4mwK25lqLIgaWLI1ZlhBQ2m299MGPNEWE4UKiK
 +lPaFWuxY9Zfs/oGuvt+cqxCKrTnlGQ6f0KOL4TsFrJCqX+RIquByS+mNv4U4hG1++VWsVqNgW3
 54/fi7W3ujUV0SEZSTp3pIiW8jbl8eTovRTLin2lbG1x+d/Zm5deWGvjbleX5atyeGwwqbRFOBN
 eaS2zu30uGalpcIza5nH/3os7xUbigXouuj3qrBrkmLUTVqJUBUdvKsAAgcdEPk9RM0hVR/CpMO
 GmajJNQOAxPTxh0mmd2P7ocjWCZI9EsMXmVk+AjwazznbahvNMvk/CYi6Iau5lcLM3KEM9MRcnw
 H5UcSMFcsvasdw9ABXBj98+jO1StXCVTomXuWkG1g=
X-Google-Smtp-Source: AGHT+IFW/w1ghG5tPKQzY7n6lA6oyEOu0+wpP6WCPQakbrr+3Qii42sUY9O1Gruj8qYZFnZCGwc3Rw==
X-Received: by 2002:ac8:7f8c:0:b0:4ab:69e3:420f with SMTP id
 d75a77b69052e-4abb2d8f272mr123094111cf.37.1752964958013; 
 Sat, 19 Jul 2025 15:42:38 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b1f1d5sm23671841cf.50.2025.07.19.15.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:37 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v2 00/10] rust: use `core::ffi::CStr` method names
Date: Sat, 19 Jul 2025 18:42:29 -0400
Message-Id: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYffGgC/32Py27DIBBFf8WadakAm5dX/Y8qC8BDglSbFByrV
 eR/7yTeZNXlvdKcOfcODWvGBmN3h4pbbrksFORbB/HilzOyPFEGyaXihjsWS0UW21pZ8ku5rUy
 wJLkWwvZSGgl0eK2Y8s8T+nk6csXvG7HXo4TgG0HKPOd17GK0A6Y+WJsGbtCGSXmVTNCO60mgd
 laJaJWGVydSPIyGFyN6dPUUXHCovSGQwXET8JC45LaW+vscStXD4r9Nm2Ccpcm4PvSorJcf59n
 nr3eShtO+738bGrRvOQEAAA==
X-Change-ID: 20250709-core-cstr-fanout-1-f20611832272
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964954; l=2481;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=JsWFRgT0k22IBVP7OkrmL1n1jeWkTlxoEPT59bbopIQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCXwvkRmyDloo2AVRWVuX/kRNHqryj9vIaDVNDpecgQdHoF9ZohDz+5EM+qMOhOcsOiEMbmKr2+
 SjXrN2mWTtQM=
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

This is series 2b/5 of the migration to `core::ffi::CStr`[0].
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
- Update patch title (was nova-core, now drm/panic).
- Link to v1: https://lore.kernel.org/r/20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com

---
Tamir Duberstein (10):
      drm/panic: use `core::ffi::CStr` method names
      rust: auxiliary: use `core::ffi::CStr` method names
      rust: configfs: use `core::ffi::CStr` method names
      rust: cpufreq: use `core::ffi::CStr` method names
      rust: drm: use `core::ffi::CStr` method names
      rust: firmware: use `core::ffi::CStr` method names
      rust: kunit: use `core::ffi::CStr` method names
      rust: miscdevice: use `core::ffi::CStr` method names
      rust: net: use `core::ffi::CStr` method names
      rust: of: use `core::ffi::CStr` method names

 drivers/gpu/drm/drm_panic_qr.rs | 2 +-
 rust/kernel/auxiliary.rs        | 4 ++--
 rust/kernel/configfs.rs         | 4 ++--
 rust/kernel/cpufreq.rs          | 2 +-
 rust/kernel/drm/device.rs       | 4 ++--
 rust/kernel/firmware.rs         | 2 +-
 rust/kernel/kunit.rs            | 6 +++---
 rust/kernel/miscdevice.rs       | 2 +-
 rust/kernel/net/phy.rs          | 2 +-
 rust/kernel/of.rs               | 2 +-
 samples/rust/rust_configfs.rs   | 2 +-
 11 files changed, 16 insertions(+), 16 deletions(-)
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

