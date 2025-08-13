Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A71B24E7A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB1210E76A;
	Wed, 13 Aug 2025 15:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WFoAzLLp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18FF10E783;
 Wed, 13 Aug 2025 15:59:43 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4b109bd63d0so275521cf.2; 
 Wed, 13 Aug 2025 08:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755100783; x=1755705583; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Z3htc3xdxBwju1wGSUcBXvP8f+eCEVOm7Du1GidEXHQ=;
 b=WFoAzLLpruE74SDljYrTSPrfllDcntGlhdsxgaRwa3A3kfIYqZ47FtAgkP8K9DZr7w
 YuQOit7jgZTFPZoi0uglNhm1mchBB0C+3/+w6spFyLkW9jF0vXe1rlRQv7yd/G1dvDQc
 +idZ9vSNLaGmBy3E2+OALjMiWR2Q2wIM3y48eQhhdtTYJVlapOUYYlu8x0SUirbRxS/p
 NULEI09kcginvYfIgVq0EksiNvVOSoVS1O/1soVmh/nkDsFncfHAewoGimeeJ9HSLCT5
 A4K9sktEld6zVXJvUpS7kIDijJnx5M77pmEI7Sm2hHr4B1G5+59HZFYTL2cyWCgPh6La
 3v0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100783; x=1755705583;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z3htc3xdxBwju1wGSUcBXvP8f+eCEVOm7Du1GidEXHQ=;
 b=HX7QBs2q6ZWdD1lDnr8FAA1gfBQNlrUNwH9kIv4lWW1pCcbvSU4r0fhhNrbBEhTM0y
 sh5zQUdIh2yiRByeUTR54RM166OsMFAcEiELxJU0v4B8HxvzLtJdH8bC0VpZIydlJxhu
 eSsaNPwFqtu/wdRsdBE4RwoBSt0s7aEbs5tsQNgOadcgapTckrEeGy6/XYiwgOh86t1w
 HQzyEA73YVedmjN2ceUEVpTYEG6/DF5SJJQkOrWphO+C29DuiWadAbjBjaUjTNTSL25+
 JxTZ9MlGbrPVVD+qPDNW8IfXzNhAhHVgP6YLGWG8+MT8d/0n0UFuMQmkVXrNut9fLTno
 /Dbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV25Xq3nFm6h/bhlcRm5cPaUjbKD8h4iGHHtjCB3VDkte0Uh9Icz0OgM2PUoyjDHTmFQrUf7GUTsQM=@lists.freedesktop.org,
 AJvYcCXCsD0Fp9DYJoRP1PeoJj+uPNoVTuehnWogEdiYC7bASYrXMvu1hZanOHCJwvUChQN23Sb/Mlf+Fw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyptECbHGHBeFRKvhLYFyKAuP+6tSeL8CHI1oD/1t9/WJTtl3o
 KNySF2WAh69u5eLZX8QRdO1+SC8RreZ9S1gDvq0fb6lYEC9ATlFt/cND
X-Gm-Gg: ASbGncuDFZx9Ra/1jpJkZJEVPt9NHk0VQRazgTVCP+Ecx6EWpXZicdzqW42qk2YOhvA
 Biny023xO0hxKwsYcQBze9Vcx6yk+zmn3KGalkB0rriI7AGLoUSkh1//U4OXHfLKyIpSHx1lUP8
 DxSC0/t8gXkmNhdLTsCkcY7WabbrLT8jz9bIWoTB0ngM6BfZFy3C0UzqxY9b2nwPJxEX69yzGs1
 uPMs8Z/Ex26B73A4Su9hf3i2DGd8vH8uK92tX250a92l+pGdTwgQYjtsaec6alfnFf2kxu8LPcN
 ZZyox59oDX0HHJPpfTSzUvw4oVv3JTVrIfVgamrLJLbVbp7mMTpL5HguSErKFN6VSWjUfiJMW2j
 eqWqoiC3VFovJjR/uIvSjPW9GZp3/5Wvjro9gnIvcyR/bOlwBV2GVwBLVgTSZexjOFPCliBislx
 KSS1KSTXlwnfIbs4/pj0dpvLv/QqctbXvx1e8/LXo=
X-Google-Smtp-Source: AGHT+IGmsxX0kELWnIl4AOAgAiKMupAmKqdo33fAGQtEH9G6dj1HBj58ZUP7RvHy9vaNQjbbVuIMtw==
X-Received: by 2002:ac8:7d55:0:b0:4b0:f1f3:dd71 with SMTP id
 d75a77b69052e-4b0fc8b9d5emr46748261cf.52.1755100782714; 
 Wed, 13 Aug 2025 08:59:42 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b085ad7d08sm124482211cf.53.2025.08.13.08.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:59:42 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:59:16 -0400
Subject: [PATCH v2 06/19] rust: cpufreq: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-cstrings-v2-6-00be80fc541b@gmail.com>
References: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
In-Reply-To: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
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
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1755100759; l=2329;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=PmSJIKP9ITH0el/dadPamYsnQlMWQ/txa9zC2kGqUps=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMb7Tw5E0tWRPzZFQNf3SQWWA+44VvrTatP7kJQXzTcRJm+H4iMDqWaOwYFfKj0pe0olEYL99jK
 yP22+o0xYZgQ=
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

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/cpufreq/rcpufreq_dt.rs | 5 ++---
 rust/kernel/cpufreq.rs         | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
index 7e1fbf9a091f..1120a8f5edd7 100644
--- a/drivers/cpufreq/rcpufreq_dt.rs
+++ b/drivers/cpufreq/rcpufreq_dt.rs
@@ -3,7 +3,6 @@
 //! Rust based implementation of the cpufreq-dt driver.
 
 use kernel::{
-    c_str,
     clk::Clk,
     cpu, cpufreq,
     cpumask::CpumaskVar,
@@ -56,7 +55,7 @@ impl opp::ConfigOps for CPUFreqDTDriver {}
 
 #[vtable]
 impl cpufreq::Driver for CPUFreqDTDriver {
-    const NAME: &'static CStr = c_str!("cpufreq-dt");
+    const NAME: &'static CStr = c"cpufreq-dt";
     const FLAGS: u16 = cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufreq::flags::IS_COOLING_DEV;
     const BOOST_ENABLED: bool = true;
 
@@ -201,7 +200,7 @@ fn register_em(policy: &mut cpufreq::Policy) {
     OF_TABLE,
     MODULE_OF_TABLE,
     <CPUFreqDTDriver as platform::Driver>::IdInfo,
-    [(of::DeviceId::new(c_str!("operating-points-v2")), ())]
+    [(of::DeviceId::new(c"operating-points-v2"), ())]
 );
 
 impl platform::Driver for CPUFreqDTDriver {
diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 2bdf9ae00ffe..c59b84820684 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -841,7 +841,6 @@ fn register_em(_policy: &mut Policy) {
 /// ```
 /// use kernel::{
 ///     cpufreq,
-///     c_str,
 ///     device::{Core, Device},
 ///     macros::vtable,
 ///     of, platform,
@@ -854,7 +853,7 @@ fn register_em(_policy: &mut Policy) {
 ///
 /// #[vtable]
 /// impl cpufreq::Driver for SampleDriver {
-///     const NAME: &'static CStr = c_str!("cpufreq-sample");
+///     const NAME: &'static CStr = c"cpufreq-sample";
 ///     const FLAGS: u16 = cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufreq::flags::IS_COOLING_DEV;
 ///     const BOOST_ENABLED: bool = true;
 ///

-- 
2.50.1

