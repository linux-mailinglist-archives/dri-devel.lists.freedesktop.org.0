Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A55B24E77
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD5C10E77F;
	Wed, 13 Aug 2025 15:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RwlW1T/X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23E710E774;
 Wed, 13 Aug 2025 15:59:34 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-4b109c5ac7bso222421cf.3; 
 Wed, 13 Aug 2025 08:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755100774; x=1755705574; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PQkqhCR+X2AcT/u+sPVE1u8ILZHP3FwYk8GsseoCqig=;
 b=RwlW1T/XjROoniD+z5MyXqLYillJ5FK9j6Tbi1Xbgl9H8MofybWNVdueM7ZhUE45u5
 cgXH+Wn1wUaK3eTTYxULp9vJHhMzJVggZ9mPS8t/y1J9YDb5M+m1We7XVGXBn51e23FY
 qiqdMQqxKMrN1yHG8TyRsJ08KP/eJPO+UIpScdDIfdPb/flArKRzgGDAZpTXGZ/M3HRz
 r2RriUwimDsLOKWgZHPIy81AZFkK5k68IWjFGD8ezn7Z/7b20SqpMiV7CChRa9EqCKk+
 5KdZhWK3nWB4ZOIDiUAp7emkJQq43WRgPkZvs5jqLsc9ViV1ZFKA+cX4f9fUl+3m63jJ
 dpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100774; x=1755705574;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PQkqhCR+X2AcT/u+sPVE1u8ILZHP3FwYk8GsseoCqig=;
 b=K2cMecVXHFna3HyziYrPHn7n02DuF1+XDBnQZzSO6EwN+q7ZUnpWkXKVihoUxDaTHb
 NJU3CsgBg9IWMolk8SoRbGpIE76aE3b/FCrTEkF1QQ/g2Uwnfa5GkdjVnEpMYtFaZgz1
 2W56yZLaG4SBmt2TggGqpLkE7htRO4X1Owjr4DFqM4/32L+ZQFEP9GHJroRnvoqk9/aQ
 0YgV/Mo5VReueJfiOMYdTCnCqprcCRK/apLrW6PB75xs9ylqC4VFzwTv+tNixUabCdJg
 RGxxqUf5f9ENrSQuExCRieKYw738O0/BtQDt12taIkx7Ck05vfeS8NwLF05+pYMyHgf4
 W7ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbN0htTzOSHNF7b3s86l7uTdOAmSgmfBc0sZTsHaFeYvaVzCBBCUGmYAqNt8GNcqintMSvUmm9vA==@lists.freedesktop.org,
 AJvYcCX4KgGGpoACgG93bEoi7w1EwtWOWIy6OIjswd671Z3tRzvVBXZ8tOgIkbRTaIMfZ8cUEQ10fqCQkjY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLuDwn4E9WsJWoVtknCG0HYWHpAHcaxgo/HV+tkOJX2qZTNkJn
 I8yq9YV61xYGtqrKzB8obc92+VXlu5UpsMaTkHfeJxGcuAeRMXrZdltMawUopKMkc8c=
X-Gm-Gg: ASbGncsGlnVoNgAKiku85UcjeRZp6TK1ZpFxveiBn1nIlbu9JPByKALHcg6frem28gm
 ib949LmnNmzrn2IO9fvne8Dcuxl0WGLhEiRx5VwVqapaq5d3tOnPITV2ddFA2L+Dmxn3x5d11vU
 72OwPngQ3haBcorShg82XsTsFRO0lXUL3/xSN/YOJbQqhy/SgINXMaYepJmA/YhyHdpFHKivk6h
 R7JSYXzybc8FIwffrQBNfR9QyENbZV+mK1PSIF1XWu/RP26ymHqIDznZAjW2G2DKoBuGNiK79FT
 sNvhQbtO7Ceh3obiG2kc3LrNzNhXJnUpW2PyRJ9AXQl2/TulSSpuI1109SgqWfVVcQ0wmNvC8Tv
 WmAk8wmxK+BMTJ4vl6giJEwxH5x2zN24Nmeqfr3bR87sg1zaVtBwrsHZ5Og4l8hhz9t22iKDisF
 o7j+FdEzFfTIXULBj+B66UjPHaFnAv
X-Google-Smtp-Source: AGHT+IHZq3i1a9XTbFXQTxJJeihLgQb42x6jyJXFxK6dZtNdBD0dLMgXlffMglfu4O/TMFdzQ1T2Rw==
X-Received: by 2002:a05:622a:549:b0:4b0:83b4:5965 with SMTP id
 d75a77b69052e-4b0fc6ba555mr47290341cf.14.1755100773657; 
 Wed, 13 Aug 2025 08:59:33 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b085ad7d08sm124482211cf.53.2025.08.13.08.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:59:33 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:59:13 -0400
Subject: [PATCH v2 03/19] rust: auxiliary: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-cstrings-v2-3-00be80fc541b@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755100759; l=1276;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=F2nw+1+uvnPsEnvQVrrTk2VbbpWrYF1uYr4G8N1u7x4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGMx/5kaMnlNTrXaGDrsiX78ZIRKLC+Iqyye94EgnMxhSsrGEv9tVHC8fuvWEciKzlDqn7iENLx
 rBu+o34IoWwg=
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
 samples/rust/rust_driver_auxiliary.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index f2a820683fc3..7c916eb11b64 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -5,13 +5,13 @@
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
 use kernel::{
-    auxiliary, bindings, c_str, device::Core, driver, error::Error, pci, prelude::*, InPlaceModule,
+    auxiliary, bindings, device::Core, driver, error::Error, pci, prelude::*, InPlaceModule,
 };
 
 use pin_init::PinInit;
 
 const MODULE_NAME: &CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
-const AUXILIARY_NAME: &CStr = c_str!("auxiliary");
+const AUXILIARY_NAME: &CStr = c"auxiliary";
 
 struct AuxiliaryDriver;
 

-- 
2.50.1

