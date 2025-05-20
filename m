Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8A0ABD234
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 10:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C054510E420;
	Tue, 20 May 2025 08:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J+lFtlLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952C610E420;
 Tue, 20 May 2025 08:42:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C8CBEA4E135;
 Tue, 20 May 2025 08:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12EDAC4CEE9;
 Tue, 20 May 2025 08:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747730563;
 bh=L7UvoMIcAqAL9KwvDgu28lLIe9XhyYkSV008NPY5tKI=;
 h=Date:From:To:Cc:Subject:From;
 b=J+lFtlLUOZ6D54IiYG8SE07FGhIStJ2NNef6ABfbATN+uewjv6Cf2JBvHHwBJzzhK
 b3iFu/ydkX59y5BFuKQK+/UIIe/RFNLvaA69QyXoqlKjN3zl3QDTV2mcFa3JOQs8wF
 qLKl4M4XmjzhW97+GRAw7wo14WTFC219gzHXAzDzFEleyodWwyWd58PjDNS9J6GjXx
 dNTW2/6xGGDf7QX99hzBjFE0XUYJkq1H8prmUqxXTotC6aagmbWRTW/m665At8xG8E
 lynBdEb337L9mrD4ZqXvbjiHwbb491xG+rtxdo9K2cDEXtBVC+UYcRZwhbsP87rkXj
 WleatUVB73YAA==
Date: Tue, 20 May 2025 10:42:39 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [GIT PULL] Nova changes for v6.16
Message-ID: <aCxAf3RqQAXLDhAj@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Dave and Sima,

Please pull the following nova changes and other dependencies.

There are two minor and trivial conflicts with Linus' tree [1] and the CONFIGFS
tree [2].

There is also a minor, but slightly less trivial conflict with the Rust Xarray
tree with a resolution in [3].

[1] https://lore.kernel.org/all/20250428123825.4acf2499@canb.auug.org.au/
[2] https://lore.kernel.org/all/20250513135521.44a26953@canb.auug.org.au/
[3] https://lore.kernel.org/all/877c344gmp.fsf@kernel.org/

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/nova.git tags/nova-next-v6.16-2025-05-20

for you to fetch changes up to 276c53c66e032c8e7cc0da63555f2742eb1afd69:

  gpu: drm: nova: select AUXILIARY_BUS instead of depending on it (2025-05-15 20:59:32 +0200)

----------------------------------------------------------------
Nova changes for v6.16

auxiliary:
  - bus abstractions
  - implementation for driver registration
  - add sample driver

drm:
  - implement __drm_dev_alloc()
  - DRM core infrastructure Rust abstractions
    - device, driver and registration
    - DRM IOCTL
    - DRM File
    - GEM object
  - IntoGEMObject rework
    - generically implement AlwaysRefCounted through IntoGEMObject
    - refactor unsound from_gem_obj() into as_ref()
    - refactor into_gem_obj() into as_raw()

driver-core:
  - merge topic/device-context-2025-04-17 from driver-core tree
  - implement Devres::access()
    - fix: doctest build under `!CONFIG_PCI`
  - accessor for Device::parent()
    - fix: conditionally expect `dead_code` for `parent()`
  - impl TryFrom<&Device> bus devices (PCI, platform)

nova-core:
  - remove completed Vec extentions from task list
  - register auxiliary device for nova-drm
  - derive useful traits for Chipset
  - add missing GA100 chipset
  - take &Device<Bound> in Gpu::new()
  - infrastructure to generate register definitions
  - fix register layout of NV_PMC_BOOT_0
  - move Firmware into own (Rust) module
  - fix: select AUXILIARY_BUS

nova-drm:
  - initial driver skeleton (depends on drm and auxiliary bus
    abstractions)
  - fix: select AUXILIARY_BUS

Rust (dependencies):
  - implement Opaque::zeroed()
  - implement Revocable::try_access_with()
  - implement Revocable::access()

----------------------------------------------------------------
Alexandre Courbot (11):
      rust/revocable: add try_access_with() convenience method
      samples: rust: convert PCI rust sample driver to use try_access_with()
      gpu: nova-core: derive useful traits for Chipset
      gpu: nova-core: add missing GA100 definition
      gpu: nova-core: take bound device in Gpu::new
      gpu: nova-core: define registers layout using helper macro
      gpu: nova-core: fix layout of NV_PMC_BOOT_0
      gpu: nova-core: move Firmware to firmware module
      samples: rust: select AUXILIARY_BUS instead of depending on it
      gpu: nova-core: select AUXILIARY_BUS instead of depending on it
      gpu: drm: nova: select AUXILIARY_BUS instead of depending on it

Andrew Ballance (1):
      gpu: nova-core: remove completed Vec extentions from task list

Asahi Lina (6):
      rust: drm: ioctl: Add DRM ioctl abstraction
      rust: drm: add driver abstractions
      rust: drm: add device abstraction
      rust: drm: add DRM driver registration
      rust: drm: file: Add File abstraction
      rust: drm: gem: Add GEM object abstraction

Danilo Krummrich (24):
      rust: device: implement impl_device_context_deref!
      rust: device: implement impl_device_context_into_aref!
      rust: device: implement device context for Device
      rust: platform: preserve device context in AsRef
      rust: pci: preserve device context in AsRef
      rust: device: implement Bound device context
      rust: pci: move iomap_region() to impl Device<Bound>
      rust: devres: require a bound device
      rust: dma: require a bound device
      Merge tag 'topic/device-context-2025-04-17' into nova-next
      rust: pci: impl TryFrom<&Device> for &pci::Device
      rust: platform: impl TryFrom<&Device> for &platform::Device
      rust: types: add `Opaque::zeroed`
      rust: device: implement Device::parent()
      rust: auxiliary: add auxiliary device / driver abstractions
      rust: auxiliary: add auxiliary registration
      samples: rust: add Rust auxiliary driver sample
      drm: drv: implement __drm_dev_alloc()
      MAINTAINERS: add DRM Rust source files to DRM DRIVERS
      rust: revocable: implement Revocable::access()
      rust: devres: implement Devres::access()
      samples: rust: pci: take advantage of Devres::access()
      gpu: nova-core: register auxiliary device for nova-drm
      drm: nova-drm: add initial driver skeleton

Lyude Paul (4):
      rust: drm: gem: Use NonNull for Object::dev
      rust: drm: gem: Refactor IntoGEMObject::from_gem_obj() to as_ref()
      rust: drm: gem: s/into_gem_obj()/as_raw()/
      rust: drm: gem: Implement AlwaysRefCounted for all gem objects automatically

Miguel Ojeda (2):
      rust: device: conditionally expect `dead_code` for `parent()`
      rust: devres: fix doctest build under `!CONFIG_PCI`

 Documentation/gpu/nova/core/todo.rst  |  16 ++---
 MAINTAINERS                           |  17 ++++++
 drivers/gpu/drm/Kconfig               |   2 +
 drivers/gpu/drm/Makefile              |   1 +
 drivers/gpu/drm/drm_drv.c             |  58 +++++++++++++-----
 drivers/gpu/drm/nova/Kconfig          |  14 +++++
 drivers/gpu/drm/nova/Makefile         |   3 +
 drivers/gpu/drm/nova/driver.rs        |  69 +++++++++++++++++++++
 drivers/gpu/drm/nova/file.rs          |  74 +++++++++++++++++++++++
 drivers/gpu/drm/nova/gem.rs           |  49 +++++++++++++++
 drivers/gpu/drm/nova/nova.rs          |  18 ++++++
 drivers/gpu/drm/nova/uapi.rs          |  61 +++++++++++++++++++
 drivers/gpu/nova-core/Kconfig         |   1 +
 drivers/gpu/nova-core/driver.rs       |   9 ++-
 drivers/gpu/nova-core/firmware.rs     |  44 ++++++++++++--
 drivers/gpu/nova-core/gpu.rs          |  86 ++++++++++++--------------
 drivers/gpu/nova-core/nova_core.rs    |   2 +
 drivers/gpu/nova-core/regs.rs         |  82 ++++++++++---------------
 drivers/gpu/nova-core/regs/macros.rs  | 380 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_drv.h                 |   5 ++
 include/uapi/drm/nova_drm.h           | 101 +++++++++++++++++++++++++++++++
 rust/bindings/bindings_helper.h       |   7 +++
 rust/helpers/auxiliary.c              |  23 +++++++
 rust/helpers/drm.c                    |  23 +++++++
 rust/helpers/helpers.c                |   2 +
 rust/helpers/pci.c                    |   5 ++
 rust/helpers/platform.c               |   5 ++
 rust/kernel/auxiliary.rs              | 360 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/device.rs                 | 109 ++++++++++++++++++++++++++++++++-
 rust/kernel/devres.rs                 |  56 ++++++++++++++---
 rust/kernel/dma.rs                    |  14 ++---
 rust/kernel/drm/device.rs             | 200 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/driver.rs             | 166 ++++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/file.rs               |  99 ++++++++++++++++++++++++++++++
 rust/kernel/drm/gem/mod.rs            | 328 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/ioctl.rs              | 162 +++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs                |  19 ++++++
 rust/kernel/lib.rs                    |   4 ++
 rust/kernel/pci.rs                    |  55 ++++++++++-------
 rust/kernel/platform.rs               |  54 +++++++++--------
 rust/kernel/revocable.rs              |  28 +++++++++
 rust/kernel/types.rs                  |   8 +++
 rust/uapi/uapi_helper.h               |   2 +
 samples/rust/Kconfig                  |  12 ++++
 samples/rust/Makefile                 |   1 +
 samples/rust/rust_driver_auxiliary.rs | 120 ++++++++++++++++++++++++++++++++++++
 samples/rust/rust_driver_pci.rs       |   5 +-
 47 files changed, 2762 insertions(+), 197 deletions(-)
 create mode 100644 drivers/gpu/drm/nova/Kconfig
 create mode 100644 drivers/gpu/drm/nova/Makefile
 create mode 100644 drivers/gpu/drm/nova/driver.rs
 create mode 100644 drivers/gpu/drm/nova/file.rs
 create mode 100644 drivers/gpu/drm/nova/gem.rs
 create mode 100644 drivers/gpu/drm/nova/nova.rs
 create mode 100644 drivers/gpu/drm/nova/uapi.rs
 create mode 100644 drivers/gpu/nova-core/regs/macros.rs
 create mode 100644 include/uapi/drm/nova_drm.h
 create mode 100644 rust/helpers/auxiliary.c
 create mode 100644 rust/helpers/drm.c
 create mode 100644 rust/kernel/auxiliary.rs
 create mode 100644 rust/kernel/drm/device.rs
 create mode 100644 rust/kernel/drm/driver.rs
 create mode 100644 rust/kernel/drm/file.rs
 create mode 100644 rust/kernel/drm/gem/mod.rs
 create mode 100644 rust/kernel/drm/ioctl.rs
 create mode 100644 rust/kernel/drm/mod.rs
 create mode 100644 samples/rust/rust_driver_auxiliary.rs
