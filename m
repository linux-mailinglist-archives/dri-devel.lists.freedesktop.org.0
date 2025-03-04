Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1338FA4E91D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 18:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDD910E659;
	Tue,  4 Mar 2025 17:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PExqiomM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684F410E046;
 Tue,  4 Mar 2025 17:36:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B518BA45ACB;
 Tue,  4 Mar 2025 17:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31225C4CEE8;
 Tue,  4 Mar 2025 17:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741109764;
 bh=9NzHeomlf+Nv1BhOgJmO2czzW6I5BiHvH358DPrPLGY=;
 h=From:To:Cc:Subject:Date:From;
 b=PExqiomMamFh2EJ9lGxHd/1D2oolzwvnyCKcOkvuazmzN1Ct5aWwUPk3H080auBcn
 ofJLRPqUqs3NyXc+8e8JAy/lPKK/QFIJVrC3zlUG78zfarJJoMTvaK81ykPF7kORle
 QmXV5KFrWdHkn4s/S2xdoJiITIhpWrQ+cTS7+0Vs2Q4izGxXKudql4i3m3qe6wJllj
 wYdAEjHxVOKISGH1acerLWe4Xm03IfdsM2TJDgONc0zg2OCJbPldWybpG7Goh7uS7c
 Oza5S6pUZPVzWj4RPDCx0ukMUOpmIZTXLSpAe1T+OJrkw69Zu/fuI02RbGgKwEMDEp
 2G6SUJhXh0bGg==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com,
 zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com,
 acurrid@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 gregkh@linuxfoundation.org, mcgrof@kernel.org, russ.weight@linux.dev,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v5 0/5] Initial Nova Core series
Date: Tue,  4 Mar 2025 18:34:47 +0100
Message-ID: <20250304173555.2496-1-dakr@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is the initial series for the nova-core stub driver.

nova-core is intended to serve as a common base for nova-drm (the
corresponding DRM driver) and the vGPU manager VFIO driver, serving as a
hard- and firmware abstraction layer for GSP-based NVIDIA GPUs.

The Nova project, including nova-core and nova-drm, in the long term,
is intended to serve as the successor of Nouveau for all GSP-based GPUs.

The motivation for both, starting a successor project for Nouveau and
doing so using the Rust programming language, is documented in detail
through a previous post on the mailing list [1], an LWN article [2] and a
talk from LPC '24.

In order to avoid the chicken and egg problem to require a user to
upstream Rust abstractions, but at the same time require the Rust
abstractions to implement the driver, nova-core kicks off as a driver
stub and is subsequently developed upstream.

Besides the driver itself and the corresponding documentation, i.e. guidelines,
task list, etc., this series also carries a few more patches to more flexibly
compose firmware path strings for the .modinfo section.

Link: https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u [1]
Link: https://lwn.net/Articles/990736/ [2]
Link: https://youtu.be/3Igmx28B3BQ?si=sBdSEer4tAPKGpOs [3]

Changes in v5:
  - change `ModInfoBuilder::push()` to take a `&str` instead of `&[u8]`
  - drop patch "rust: str: provide const fn as_bytes() for BStr"
  - embedd `impl TryFrom<u32> for Chipset` in `define_chipset!` (Alexandre)
  - switch `Chipset::NAMES` from `[&BStr; N]` to `[&str; N]`
  - introduce `const_bytes_to_str()` helper
  - move `to_lowercase_bytes()` to util.rs

Changes in v4:
  - in `regs::Boot0` take a `&Bar0` and let deref coercion do its thing
    (Alexandre)
  - add missing firmware path string to the .modinfo section (Greg)
  - add some infrastructure to compose firmware path strings more flexibly

Changes in v3:
  - impl TryFrom<u32> for Chipset
  - add Chipset::arch()
  - initialize revision from Boot0
  - in Firmware, eliminate repeating code pattern using a closure (thanks to
    Alexandre)
  - use #[expect(dead_code)] for Firmware
  - Replace some Rust specific rules with links to existing R4L documentation.
  - Link in R4L submit checklist.
  - Update task entry "Page abstraction for foreign pages" with Lina's work.

Changes in v2:
  - Fix module name in Kconfig description. (John)
  - Expand Kconfig description a bit. (John)
  - Expand name for PCI BAR0 region.
  - Do not store / print boot0 raw register value. (John)
  - Rename CardType to Architecture, rename enum names to represent the
    architecture name and adjust enum values according to the register
    definition. (John)
  - Add an abstraction for register accesses.
  - Print chipset, architecture and revision.
  - Load bootloader firmware. (Timur)
  - Add task "Generic register abstraction".
  - Change complexity of "Debugfs abstractions".


Danilo Krummrich (5):
  rust: module: add type `LocalModule`
  rust: firmware: introduce `firmware::ModInfoBuilder`
  rust: firmware: add `module_firmware!` macro
  gpu: nova-core: add initial driver stub
  gpu: nova-core: add initial documentation

 Documentation/gpu/drivers.rst              |   1 +
 Documentation/gpu/nova/core/guidelines.rst |  24 ++
 Documentation/gpu/nova/core/todo.rst       | 446 +++++++++++++++++++++
 Documentation/gpu/nova/guidelines.rst      |  69 ++++
 Documentation/gpu/nova/index.rst           |  30 ++
 MAINTAINERS                                |  11 +
 drivers/gpu/Makefile                       |   1 +
 drivers/gpu/nova-core/Kconfig              |  14 +
 drivers/gpu/nova-core/Makefile             |   3 +
 drivers/gpu/nova-core/driver.rs            |  47 +++
 drivers/gpu/nova-core/firmware.rs          |  45 +++
 drivers/gpu/nova-core/gpu.rs               | 199 +++++++++
 drivers/gpu/nova-core/nova_core.rs         |  20 +
 drivers/gpu/nova-core/regs.rs              |  55 +++
 drivers/gpu/nova-core/util.rs              |  21 +
 drivers/video/Kconfig                      |   1 +
 rust/kernel/firmware.rs                    | 177 ++++++++
 rust/macros/module.rs                      |   2 +
 18 files changed, 1166 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/guidelines.rst
 create mode 100644 Documentation/gpu/nova/core/todo.rst
 create mode 100644 Documentation/gpu/nova/guidelines.rst
 create mode 100644 Documentation/gpu/nova/index.rst
 create mode 100644 drivers/gpu/nova-core/Kconfig
 create mode 100644 drivers/gpu/nova-core/Makefile
 create mode 100644 drivers/gpu/nova-core/driver.rs
 create mode 100644 drivers/gpu/nova-core/firmware.rs
 create mode 100644 drivers/gpu/nova-core/gpu.rs
 create mode 100644 drivers/gpu/nova-core/nova_core.rs
 create mode 100644 drivers/gpu/nova-core/regs.rs
 create mode 100644 drivers/gpu/nova-core/util.rs


base-commit: 99fa936e8e4f117d62f229003c9799686f74cebc
-- 
2.48.1

