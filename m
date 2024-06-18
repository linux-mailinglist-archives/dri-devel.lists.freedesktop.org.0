Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E127290DFE7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 01:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD44910E0F8;
	Tue, 18 Jun 2024 23:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BNCNh0AR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21EB10E0F8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 23:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718753613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z3Fqi+/51BFxiyJqNYjzcwItBXkMYypkwQiZX7xgnOk=;
 b=BNCNh0ARcGdIkhksk6hKKpRP0uDyPSAsQHGGXjkPIyjvc4n6KtdJ06CFq8J5Y5hS2hwmvQ
 Bn/nvryeXZVGxHLh63BZBF3VbtH3vOd3b6erKx+CDIUleRJLoaixXmwa68q57MSrANZMlk
 N7mbYTH9aoBBhpzl9UEHqn980KWGvG8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-L_vtqKlhPXG5oURta2I3Kg-1; Tue, 18 Jun 2024 19:33:32 -0400
X-MC-Unique: L_vtqKlhPXG5oURta2I3Kg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-421759c3556so1305735e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718753611; x=1719358411;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z3Fqi+/51BFxiyJqNYjzcwItBXkMYypkwQiZX7xgnOk=;
 b=k0aGmdv8N23eq+ub7kzzjDZCVdw1NvtZ8IxJ2Zozv6G5EiKot6qmHaCTK1K3y2uxl3
 caVe27k1uXqLBamKlg5Xv4NvO9edLexiEjln8SvY03n2ACM5zBPbh0H5qxgyVtOIEEdo
 MdEbUPs8UwiN7VWZbEGlRMnLhrzf/fb3BG/DqyrlMYQ+npWrFwflrNBnKWhMAY/6/zKD
 Rq3OZzSZAmJHT90pYkd1yrO7CXxdElC8DhZjTx//5mzKpFQH/fO2Z3cmmg4x7P8IJV64
 QKygV4815UqXt+3+4lBzanTPEG+M26xFGgpDacviNDRmo4qD5Xzhq+bDvrtVH9WJqzFC
 Dr1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW71jT59YjUxg+FUZN2bK63im7991L7oB50woaRVM+hGrSwj+OlE6Yjfn2VAdVb1aM2RRIc3hK2MAwqO4Tl9wibiuJPF99rE7PlqVOSGpBU
X-Gm-Message-State: AOJu0Ywu1JwD+A0z8/mu0brd82JD26/sh/mFob7Q0z/YYfen1Mm8PJiM
 qjIU7SOTRzI9/M3jwEsrzAQMTW/F4WoyOs0aLX2xwr0ZXWJChP4FSeWbIaAjfg8DA0CECxi+MB3
 BxyBLxT4CoCTcgQAWI8pTwAmJIIMU5Xg+NVSCDO+rYOWygzb0x/zq2tVtuYaQIO7ovQ==
X-Received: by 2002:a05:600c:4a25:b0:421:7ab8:59c with SMTP id
 5b1f17b1804b1-42474d1ea69mr11067765e9.10.1718753610847; 
 Tue, 18 Jun 2024 16:33:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkDTEXBpqJptvcXNzTpmzKVYUnQPN3GfP3sjrNY2yNnULq62acJnzYZiRMKe8J42NVExH3mQ==
X-Received: by 2002:a05:600c:4a25:b0:421:7ab8:59c with SMTP id
 5b1f17b1804b1-42474d1ea69mr11067625e9.10.1718753610465; 
 Tue, 18 Jun 2024 16:33:30 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874de646sm246271855e9.35.2024.06.18.16.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 16:33:29 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, robh@kernel.org, daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2 0/8] DRM Rust abstractions and Nova
Date: Wed, 19 Jun 2024 01:31:36 +0200
Message-ID: <20240618233324.14217-1-dakr@redhat.com>
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

Changes in v2:
==============
- split up the DRM device / driver abstractions in three separate commits
- separate `struct drm_device` abstraction in a separte source file more
  cleanly
- switch `struct drm_driver` and `struct file_operations` to 'static const'
  allocations
- implement `Registration::new_foreign_owned` (using `Devres`), such that we
  don't need to keep the `Registration` alive on the Rust side, but
  automatically revoke it on device unbind
- add missing DRM driver features (Rob)
- use `module_pci_driver!` macro in Nova
- use a const sized `pci::Bar` in Nova
- increase the total amount of Documentation, rephrase some safety comments and
  commit messages for less ambiguity
- fix compilation issues with some documentation example

[1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
[2] Reply to this mail titled "Device / Driver and PCI Rust abstractions".
[3] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
[4] https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Asahi Lina (4):
  rust: drm: ioctl: Add DRM ioctl abstraction
  rust: Add a Sealed trait
  rust: drm: file: Add File abstraction
  rust: drm: gem: Add GEM object abstraction

Danilo Krummrich (4):
  rust: drm: add driver abstractions
  rust: drm: add device abstraction
  rust: drm: add DRM driver registration
  nova: add initial driver stub

 MAINTAINERS                     |  10 +
 drivers/gpu/drm/Kconfig         |   2 +
 drivers/gpu/drm/Makefile        |   1 +
 drivers/gpu/drm/nova/Kconfig    |  12 +
 drivers/gpu/drm/nova/Makefile   |   3 +
 drivers/gpu/drm/nova/driver.rs  |  85 +++++++
 drivers/gpu/drm/nova/file.rs    |  70 ++++++
 drivers/gpu/drm/nova/gem.rs     |  50 ++++
 drivers/gpu/drm/nova/gpu.rs     | 173 ++++++++++++++
 drivers/gpu/drm/nova/nova.rs    |  18 ++
 include/uapi/drm/nova_drm.h     | 101 ++++++++
 rust/bindings/bindings_helper.h |   5 +
 rust/helpers.c                  |  23 ++
 rust/kernel/drm/device.rs       | 182 ++++++++++++++
 rust/kernel/drm/drv.rs          | 199 ++++++++++++++++
 rust/kernel/drm/file.rs         | 116 +++++++++
 rust/kernel/drm/gem/mod.rs      | 409 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/ioctl.rs        | 153 ++++++++++++
 rust/kernel/drm/mod.rs          |   9 +
 rust/kernel/lib.rs              |   7 +
 rust/uapi/uapi_helper.h         |   2 +
 21 files changed, 1630 insertions(+)
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


base-commit: 6646240d29b11de3177f71ff777d0ae683c32623
-- 
2.45.1

