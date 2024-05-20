Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503448CA12F
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 19:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2CD10E440;
	Mon, 20 May 2024 17:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Bpvs6RuV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BEA10E440
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 17:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716225672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cfW1XgmcrKJYEA6UaMsvxWFMCmPNu6LpNNS8FXQNwd8=;
 b=Bpvs6RuVm6ZSTzQ4jx3IdcYmC6EQXabG9RC8Pnt++ObfjDt4eX6T/C76PyOQooZ9vtydAT
 u9gZe/34xc3v8utolefz2YeGZjjk6qBOCspb3y0K8T6dzrE1jiGVwurg83tKAKni3ayC82
 aiUMxnKpD+lbZ972m4yLnLGcguIFcK8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-iktDUJKuN5KeDkWYRXGqaA-1; Mon, 20 May 2024 13:21:09 -0400
X-MC-Unique: iktDUJKuN5KeDkWYRXGqaA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4200ef4fb81so44793055e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 10:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716225668; x=1716830468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cfW1XgmcrKJYEA6UaMsvxWFMCmPNu6LpNNS8FXQNwd8=;
 b=s09ehWzDiVdJlYQPFzftRWs06QukU4E2Izfe5UaDy8pQ4Fans8DtyZ7hYQ4YQ9nF8P
 GL29SpKiLfHvQTYdJ95wpHFV1PW9EB80CcoPMH9ABa6/A/pL+RKUo//bjTSwYPlBvduS
 iWLSlSPDpOMvS+GGfaE/XmhnEeDXzC1t8kCjc7iGOdH4WaShXOQAIJlOEYsdz9VGJg+o
 NCmqkcZIcDgwgpFdJzyx9VURmj6i0wTRRPYDK54D1tm1q02UvOFYn9AujM32KS5gc94u
 NafakSzId0QoQ3/Juo6I7tnqfKd5JwkDSIRLtOvTzJJvo82V7LlqhFSZGtZPO5n4YVwd
 Lvkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+Lbd7jIhiFttgA6jsxzlKaqoDaKGkqEPDgvjgDf4wzJRUU4OWNis0lN+NJz8DLf3jEsggR030CfNobXxT5/eKoxoPfImdiIIak76nE8rr
X-Gm-Message-State: AOJu0YyKDLez5MeDMWKOMc085lR3flmNwKnePSyaa2/IvJV6ubaYTnal
 DY5GYHkn9io/05wPC3G89yvvnCxWeGzlVjqr7alLXhb2JWDMJ3FuJzKQMbWcY5d5IzIyWSLclCo
 nMMQCZKnM3oYItyZROThlZhmfboIAp6c9tkwtTVRX7JTskmyBDmfkr7f+/KAowRHm0w==
X-Received: by 2002:a05:600c:4f49:b0:420:12df:1f7e with SMTP id
 5b1f17b1804b1-420e19e46d4mr57894675e9.9.1716225668271; 
 Mon, 20 May 2024 10:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhCFvLZoaDI3iSTKmLdqM1qyoeVh6xl/L8p8pe/aTnEVlkPoxeJ/ek4U0dG5zhg8lX2LhW0A==
X-Received: by 2002:a05:600c:4f49:b0:420:12df:1f7e with SMTP id
 5b1f17b1804b1-420e19e46d4mr57894335e9.9.1716225667729; 
 Mon, 20 May 2024 10:21:07 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fe36f373fsm407299905e9.20.2024.05.20.10.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 10:21:07 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, fujita.tomonori@gmail.com,
 lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com,
 lyude@redhat.com, gregkh@linuxfoundation.org
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH 0/8] [RFC] DRM Rust abstractions and Nova
Date: Mon, 20 May 2024 19:20:47 +0200
Message-ID: <20240520172059.181256-1-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

This patch series implements some basic DRM Rust abstractions and a stub
implementation of the Nova GPU driver.

Nova is intended to be developed upstream, starting out with just a stub driver
to lift some initial required infrastructure upstream. A more detailed
explanation can be found in [1].

This patch series is based on the "Device / Driver and PCI Rust abstractions"
series [2].

The DRM bits can also be found in [3] and the Nova bits in [4].

[1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
[2] Reply to this mail titled "Device / Driver and PCI Rust abstractions".
[3] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
[4] https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Asahi Lina (5):
  rust: drm: ioctl: Add DRM ioctl abstraction
  rust: Add a Sealed trait
  rust: drm: Add Device and Driver abstractions
  rust: drm: file: Add File abstraction
  rust: drm: gem: Add GEM object abstraction

Danilo Krummrich (3):
  rust: drm: implement `AsRef` for DRM device
  rust: add firmware abstractions
  nova: add initial driver stub

 MAINTAINERS                     |  10 +
 drivers/gpu/drm/Kconfig         |   2 +
 drivers/gpu/drm/Makefile        |   1 +
 drivers/gpu/drm/nova/Kconfig    |  11 +
 drivers/gpu/drm/nova/Makefile   |   3 +
 drivers/gpu/drm/nova/driver.rs  | 110 +++++++++
 drivers/gpu/drm/nova/file.rs    |  71 ++++++
 drivers/gpu/drm/nova/gem.rs     |  50 ++++
 drivers/gpu/drm/nova/gpu.rs     | 172 ++++++++++++++
 drivers/gpu/drm/nova/nova.rs    |  20 ++
 include/uapi/drm/nova_drm.h     | 101 ++++++++
 rust/bindings/bindings_helper.h |   6 +
 rust/helpers.c                  |  23 ++
 rust/kernel/drm/device.rs       |  95 ++++++++
 rust/kernel/drm/drv.rs          | 321 +++++++++++++++++++++++++
 rust/kernel/drm/file.rs         | 113 +++++++++
 rust/kernel/drm/gem/mod.rs      | 406 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/ioctl.rs        | 153 ++++++++++++
 rust/kernel/drm/mod.rs          |   9 +
 rust/kernel/firmware.rs         |  74 ++++++
 rust/kernel/lib.rs              |   8 +
 rust/uapi/uapi_helper.h         |   2 +
 22 files changed, 1761 insertions(+)
 create mode 100644 drivers/gpu/drm/nova/Kconfig
 create mode 100644 drivers/gpu/drm/nova/Makefile
 create mode 100644 drivers/gpu/drm/nova/driver.rs
 create mode 100644 drivers/gpu/drm/nova/file.rs
 create mode 100644 drivers/gpu/drm/nova/gem.rs
 create mode 100644 drivers/gpu/drm/nova/gpu.rs
 create mode 100644 drivers/gpu/drm/nova/nova.rs
 create mode 100644 include/uapi/drm/nova_drm.h
 create mode 100644 rust/kernel/drm/device.rs
 create mode 100644 rust/kernel/drm/drv.rs
 create mode 100644 rust/kernel/drm/file.rs
 create mode 100644 rust/kernel/drm/gem/mod.rs
 create mode 100644 rust/kernel/drm/ioctl.rs
 create mode 100644 rust/kernel/drm/mod.rs
 create mode 100644 rust/kernel/firmware.rs


base-commit: 4a67fc8e2330cbd57b49d8ea703ffbf7292ef828
-- 
2.45.1

