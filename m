Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49485B24DB2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5736710E752;
	Wed, 13 Aug 2025 15:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QeAuR5kj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FA410E752
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 15:41:59 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7e849d7a28dso356040085a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099719; x=1755704519; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2SMXT1ZZsjFjhUqg4asNRzg71ZxqYZ/K2SRakyEvQ4o=;
 b=QeAuR5kjT03fHgbaf5MWAe5vIPqeNR1YDc8bQQLeSxlKtBpxVf8PsesARazruGASE3
 I9FC+SQfigKBUGqsVcvpXxxECGGpHVjI+BaY6y/qyLJzc62yXKredqn5u3CKgmAeLdDs
 PNBo6Ed2obLjATjuJZTGGBilIQcdCmNlRfr+aXaXuRxBIwXmn/mGdpQ0akR/KCJkJrSn
 YhFjkuvYnbeuRGQRP9TM8nOsoLm1fJ/xPNEVXxaWVBriKFH91SYyxI1r4q4NJStgSVR3
 HLl2iTeQ+8ZqPPczy23ieAtDBqrx7xDYAytsF9WHCJTYTtW76PbfqZEUIP2mG5D5BGjq
 +3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099719; x=1755704519;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2SMXT1ZZsjFjhUqg4asNRzg71ZxqYZ/K2SRakyEvQ4o=;
 b=oSvLfnCem+MqkDnDitsvc8+VrIaXz0gWefDccGfnem/TLKs1tFFVhwGPfUy/8e6w1F
 yT6xnr/xvq8Ts/JSfSGwZpBcwAyJozoVlK57aytUSAE0mBl4Oz4sbHf1ieo9nZlpAdTS
 Y80Wi9lac7OqK9ysCY1vSmGi8POsHGDAZFCaPSRM4pO9gJvv1tYWWEWgppnzXQBbUZH8
 lv4MzDXH2NPxqDec3RRtCtQLNbOPskopqgC+NumWiRt5LvaNZjpnLVxiM8zm6aCiZfXI
 1xPr+I1AmGXVSQRNt4F/NHQ7JFWXqdo+9F0yC2RCibBrT05HZwtGG9mQrw+N7BGCYiHE
 qzpg==
X-Gm-Message-State: AOJu0YzRio/SH2t3OZMsdPeBSczJpBgbXIKgIhBxY7Veqb4toz35Cznl
 pECIc5RWbUMAc4jBTXxY3o/qRfohBnnYncsnl0jQnIe+4Cy94xwCHs5m
X-Gm-Gg: ASbGncuZOcSieiQv6jzeN92HVMXtm8p1H9qiY0ucAXUfaj1hIFZegVm/8u1/gLYqBe8
 2GDeP9kWeiCegE9gBXEbmYpMRAbwcWNSX4568a4+5twZGczsWWAP7kc09PS+WE7YyWwpdidJEjs
 sfnXCtfgjsqz5tb6AJe4I+1ziQ1IEhoHwSMGcqpEU/lPcVyoDOLLr1z57iKATff24ltNT1HDR+X
 bmCnrQPOWRgz3r7nMysgHNYsosuQuaox5bwf7BJr7g2bhmUFYMVkQeJx4aBQMpKC8LWrN7ce2Dd
 WJ0bqwjqPCUkBHMRfonX1UUAWK3wghjVLCblLukMkPBse35O5vQwBmAEx+avJ3KjUxidUKio9BQ
 XT05MHlqh1NRxVQ/vSr5ZikzhJDohrJpfVxCBlpzTGtx9AA4w+i3fD7hVSrVWPFXlyaq8TXPxbQ
 DZrMgRai9TAHNPJOYp9IZ9HYIVWAnwYfyyo2D1UXXsy80p
X-Google-Smtp-Source: AGHT+IGHAcR23+bK3nfyte/GjkSYW2MpoD31MxNG+Ug+xwLcnQWaEswle+lh0IBDEjz7l/+uYL0/CQ==
X-Received: by 2002:a05:620a:3707:b0:7e7:fafc:c6f with SMTP id
 af79cd13be357-7e86526c55bmr458130585a.22.1755099718660; 
 Wed, 13 Aug 2025 08:41:58 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e81bc7a1e3sm1180019685a.74.2025.08.13.08.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:41:58 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v3 00/11] rust: use `core::ffi::CStr` method names
Date: Wed, 13 Aug 2025 11:41:51 -0400
Message-Id: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD+ynGgC/33NTQ7CIBQE4Ks0rMXAI/1z5T2MC0ofLYktCpRom
 t5dWhd2YVzOJPPNTDw6g56cspk4jMYbO6YgDhlRvRw7pKZNmQCDnJWspso6pMoHR7Uc7RQopxp
 YwXklAEogaXh3qM1zQy/XT3b4mJIdvmVvfLDutR1HvrZ/PyKnjOq2rEUjMK8knLtBmttR2YGsX
 IQdwX8TkAjkqsmFLloQYk8sy/IG1frjZwwBAAA=
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
 Saravana Kannan <saravanak@google.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Arnd Bergmann <arnd@arndb.de>, Len Brown <lenb@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-acpi@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099715; l=2339;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=Q+oal3i5+vNsZ6N/xmBJGOrX0PYeEyfdH+fjBKC6nuc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHJf4FgT9dJFvdylW99JSkaeQhFuCXgB3JPdPc1IIelP6G6cMpAvfM0tsW3sb8wHuWy+j3deJtE
 DH26rgkrx7QM=
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
Changes in v3:
- Add a patch to deal with new code in acpi.
- Drop incorrectly applied Acked-by tags from Danilo.
- Link to v2: https://lore.kernel.org/r/20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com

Changes in v2:
- Update patch title (was nova-core, now drm/panic).
- Link to v1: https://lore.kernel.org/r/20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com

---
Tamir Duberstein (11):
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
      rust: acpi: use `core::ffi::CStr` method names

 drivers/gpu/drm/drm_panic_qr.rs | 2 +-
 rust/kernel/acpi.rs             | 7 ++-----
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
 12 files changed, 18 insertions(+), 21 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250709-core-cstr-fanout-1-f20611832272

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

