Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328C2B24E83
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 18:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB6D10E76D;
	Wed, 13 Aug 2025 16:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZpCNkX9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9D410E78F;
 Wed, 13 Aug 2025 16:00:05 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4b109bd3f9fso280041cf.2; 
 Wed, 13 Aug 2025 09:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755100804; x=1755705604; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=No81RyEmCPqSM5FObkHye8Zu6zoLkgwRwhVrnmuST/w=;
 b=ZpCNkX9piRW3NrbEgQrEbaYIaySFvLm/Zs0csxODJ/VKwwL58F2Q/n9u2KZqUpcWXY
 cKEBWhB70Rxan/k1lbJH6T83IfmCdYV6luZ8rSri2R1olmhIgSUBTQyu0jiq7hnAc+bN
 GQ/LuxAJmyejPtRuQ3AG7756VUYrcH8vusg8BLBi9tlzDoaoQ3EYxJstZwRBvRt350PY
 btxFjn8hBmWfLbU/qjVZDWjjoY10FLuWU+Ckxsl0pTJiOGcaTzfB0fyhCgHorsLeKzZH
 PMzvNIg5h0pYrIH9ouxC4If3Ut6La5HP4Qxg7ZhwwPvPdApyi29k6YmjPlfdOnr9eA0G
 dDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100804; x=1755705604;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=No81RyEmCPqSM5FObkHye8Zu6zoLkgwRwhVrnmuST/w=;
 b=iUjK9ZPpUjOdKPVOAsUZmHemmpJI1tdDicltnoknAXyeR24kOdE6BodAM6wWGTVwle
 4VeAgf8hojlC7bq9iwtpjIjFaSPgNBg1V2R71jGowsxhYm4e326nxS7uDkb3k/UMZmtg
 Kiuy6d7IJRkMNRPWH7TDexnBVlnEGJlYaBnp85DSj1SiPN0rN5gusleSFhtUmMYgQfPO
 3vn+Y/up9pf1bqJ2qnM6jMOPP+M1pPUQgbsBA7uq0yXiPZb7pzAnKDXa3K69GefKuuGY
 VWy5GLDUasaIwGc0hn95PKsgqNcK9rpW7wF6fSS5CnTiGBThcAij6KdSk5K/1ee6AqSD
 axQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmMiD265npWANlxi/L/viQV7pR/IsnbIsJ4ZBnDxfYpXb272jZauaUvBIrEDflFt/vKL+dfu8u+Ss=@lists.freedesktop.org,
 AJvYcCXGcaVsr3dOY+MUFZma7SOAZUyxE1HSSfHGlkNGWFQnXr4TdQL/RS+Wqtyd0Jgl0nm/rL6Ao1/qrw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPeKmzusy0SPGKHeNZvWZSxkfe0CRP6YdMq9zSqSG1QXLx9V0k
 B8CV0vulcig6ECTAwIWDmBawA2su/NOtgvLOwPZIdITwynRx2JI4br60
X-Gm-Gg: ASbGncvo7zvwS7Bess7f8mQfZU8KGiLkhggWp2Qij2ANY0a484iCzCyLfGrD9S7eupa
 h8yC/OO8dGTpb87BHm65eilR0/ktUl9XpX2S7cK9xZ68K1Q/5psPHYtVGsTrPQjlREj1bCWlymg
 RHztAIT0G8Ak2cut/8hsfu5cH1+zjCiG2DjwXYR4rGw+vpm37i5nVgENERGf1cbN6CCUqeyml22
 DbuTivtCZR3qvCN9E9xJcyRPBcXYQYqGruusgb/wxlWOxV8rsVBhxuX78i4JJiXJK/x0cSnJuC1
 twvau7PAjDZwF2yE4X6tjbUwA6v/Pll7+NhGOhc0+dk/PzhlNs9h9ZbnjJiiOQkkidar1vK/zwU
 X3C/CmRSxItCbyODQlYc4XXKQbj0D6ul1gqUtMEy9giW4yGPkfk6FKXj4H4fqar5Oi3zkoNw4rX
 gZKwu0EhxYu8HQqwVBPfcbCX2KyjiSOjBKDMTzw04=
X-Google-Smtp-Source: AGHT+IFgGPvPh4bfxQucqgJHqCsG0vM6pF/+xbTUs/ykAXBszfC0kqp0dx747oGo8p7Cqazh57fRZA==
X-Received: by 2002:a05:622a:2517:b0:4b0:7575:7de9 with SMTP id
 d75a77b69052e-4b0fc7cfb9emr46052741cf.29.1755100804167; 
 Wed, 13 Aug 2025 09:00:04 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b085ad7d08sm124482211cf.53.2025.08.13.09.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 09:00:03 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:59:23 -0400
Subject: [PATCH v2 13/19] rust: pci: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-cstrings-v2-13-00be80fc541b@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755100760; l=1469;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=pJzkdbx9fI80O3tC2LSw31fJ1joDqXqi5o9BSlHr9bU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJF8uf3JOHjRl/3R+S1L4dcXzTZi1ecUZ6oNmqIkZFTkprDomxNGqbftfYtsMPlX0Gi4pLxpz5R
 f+K48sFdc9w8=
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
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 samples/rust/rust_driver_pci.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 606946ff4d7f..e0e9d9fda484 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -4,7 +4,7 @@
 //!
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
-use kernel::{bindings, c_str, device::Core, devres::Devres, pci, prelude::*, types::ARef};
+use kernel::{bindings, device::Core, devres::Devres, pci, prelude::*, types::ARef};
 
 struct Regs;
 
@@ -79,7 +79,7 @@ fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> Result<Pin<KBox<Self>
         let drvdata = KBox::pin_init(
             try_pin_init!(Self {
                 pdev: pdev.into(),
-                bar <- pdev.iomap_region_sized::<{ Regs::END }>(0, c_str!("rust_driver_pci")),
+                bar <- pdev.iomap_region_sized::<{ Regs::END }>(0, c"rust_driver_pci"),
                 index: *info,
             }),
             GFP_KERNEL,

-- 
2.50.1

