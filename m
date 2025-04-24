Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446FEA9B359
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 18:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A8A10E44D;
	Thu, 24 Apr 2025 16:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ChxVGb5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A51010E44D;
 Thu, 24 Apr 2025 16:05:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C3BBA6845E;
 Thu, 24 Apr 2025 16:04:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D69C4CEEC;
 Thu, 24 Apr 2025 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745510701;
 bh=4frO21QcxsLI0trc+FOr8X9D+IvqGW3BO/OVZ5Uoot0=;
 h=From:To:Cc:Subject:Date:From;
 b=ChxVGb5HqsdlHr1HbgNFZIcgsvMFGiNz3hr9aJPkbet73apBb7iKmlLpxFVuKZ7ZJ
 RQXWGFUuUNlwFYSDvK9yl5yPQdO05a8RM34yi/csJu351gLLePsa1os+yRDnr2mvAR
 7er1T3HkVIh9vi+/iAyZgisY3bPq15/byNCcYPxWzJk+ITeykNIcGtmUcerbCYKSYj
 Ubs/FK8qHGGV+1PdugTmrEYyJLXHTBkoylAtzT6tl0WAkUygB+ZkJP2FR1OxyEWidz
 8ktOyWWY272TEbaY2cVCXbpf5++1GcR3e9P+GBkf3XVEMf9zVZ6L/S0MoEtSVqwS+5
 9oIxMkrsHTsew==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ajanulgu@redhat.com,
 lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 joelagnelf@nvidia.com, ttabi@nvidia.com, acourbot@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 0/2] Nova DRM skeleton driver
Date: Thu, 24 Apr 2025 18:02:48 +0200
Message-ID: <20250424160452.8070-1-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
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

This patch series adds the nova-drm skeleton driver.

nova-drm is connected to nova-core through the auxiliary bus and implements the
DRM parts of the nova driver stack.

For now, it implements the fundamental DRM abstractions, i.e. creates a DRM
device and registers it, exposing a three sample IOCTLs.

  DRM_IOCTL_NOVA_GETPARAM
    - provides the PCI bar size from the bar that maps the GPUs VRAM from
      nova-core

  DRM_IOCTL_NOVA_GEM_CREATE
    - creates a new dummy DRM GEM object and returns a handle

  DRM_IOCTL_NOVA_GEM_INFO
    - provides metadata for the DRM GEM object behinda given handle

I implemented a small userspace test suite [1] that utilizes this
interface.

The patches from this series are also available in [2].

[1] https://gitlab.freedesktop.org/dakr/drm-test
[2] https://gitlab.freedesktop.org/drm/nova/-/tree/staging/nova-drm

Changes in v2:
  - Implement abstractions for the corresponding ::kernel::uapi:: types.

Danilo Krummrich (2):
  gpu: nova-core: register auxiliary device for nova-drm
  drm: nova-drm: add initial driver skeleton

 MAINTAINERS                        |  12 ++++
 drivers/gpu/drm/Kconfig            |   2 +
 drivers/gpu/drm/Makefile           |   1 +
 drivers/gpu/drm/nova/Kconfig       |  14 ++++
 drivers/gpu/drm/nova/Makefile      |   3 +
 drivers/gpu/drm/nova/driver.rs     |  69 ++++++++++++++++++++
 drivers/gpu/drm/nova/file.rs       |  74 +++++++++++++++++++++
 drivers/gpu/drm/nova/gem.rs        |  49 ++++++++++++++
 drivers/gpu/drm/nova/nova.rs       |  18 +++++
 drivers/gpu/drm/nova/uapi.rs       |  61 +++++++++++++++++
 drivers/gpu/nova-core/Kconfig      |   1 +
 drivers/gpu/nova-core/driver.rs    |   9 ++-
 drivers/gpu/nova-core/nova_core.rs |   2 +
 include/uapi/drm/nova_drm.h        | 101 +++++++++++++++++++++++++++++
 rust/uapi/uapi_helper.h            |   1 +
 15 files changed, 416 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nova/Kconfig
 create mode 100644 drivers/gpu/drm/nova/Makefile
 create mode 100644 drivers/gpu/drm/nova/driver.rs
 create mode 100644 drivers/gpu/drm/nova/file.rs
 create mode 100644 drivers/gpu/drm/nova/gem.rs
 create mode 100644 drivers/gpu/drm/nova/nova.rs
 create mode 100644 drivers/gpu/drm/nova/uapi.rs
 create mode 100644 include/uapi/drm/nova_drm.h


base-commit: b5cb47f81a2857d270cabbbb3a9feec0e483caed
-- 
2.49.0

