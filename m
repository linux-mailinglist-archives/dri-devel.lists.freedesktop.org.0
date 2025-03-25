Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA33A70D97
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 00:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3B610E32C;
	Tue, 25 Mar 2025 23:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qjhZ5SnY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA1B10E61E;
 Tue, 25 Mar 2025 23:22:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9D35744138;
 Tue, 25 Mar 2025 23:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66FAC4CEE4;
 Tue, 25 Mar 2025 23:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742944971;
 bh=VK9ZJNnvMvLR69pPVF7hCnOJMsL6WneMp/VWN/uzFYE=;
 h=From:To:Cc:Subject:Date:From;
 b=qjhZ5SnYXCiQ/RxLcz15xLHTqtwvMRQ0ZiTHuie4Ypeaf8I2Li1bg1U99cjUFWNP1
 PAKSde1ro1EfYGGlrjizMEuqhCT6awTgxw91HQTE01wdDy0zBodaBRrxu12dBoVsMx
 5cu4zMOd2RLCeDY1dv8UPU76AF4Qj9xiBQ8RRq7GLSU0nkNB1Ycc3UysvYEumK6n89
 geWyP4mQlYD6lNdUH52FDgYfjvNHROCmcV91EtR8esnG6+8QJ0KCiKF3voTF3mI5vS
 DjWTKQHOQCDuwOcrwFr2FJMW0WhlnZF+DHMQcaprK8H18YbLf7NzMW8vFqfonm0FcQ
 Z/Tffi49dvndQ==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ajanulgu@redhat.com,
 lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/2] Nova DRM skeleton driver
Date: Wed, 26 Mar 2025 00:21:47 +0100
Message-ID: <20250325232222.5326-1-dakr@kernel.org>
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

This patch series depends on the auxiliary bus abstractions [2] and the DRM
abstractions [3]; the patches from this series are also in [4].

[1] https://gitlab.freedesktop.org/dakr/drm-test
[2] https://web.git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=rust/auxiliary
[3] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
[4] https://gitlab.freedesktop.org/drm/nova/-/tree/staging/nova-drm

Danilo Krummrich (2):
  gpu: nova-core: register auxiliary device for nova-drm
  drm: nova-drm: add initial driver skeleton

 MAINTAINERS                        |  12 ++++
 drivers/gpu/drm/Kconfig            |   2 +
 drivers/gpu/drm/Makefile           |   1 +
 drivers/gpu/drm/nova/Kconfig       |  14 ++++
 drivers/gpu/drm/nova/Makefile      |   3 +
 drivers/gpu/drm/nova/driver.rs     |  70 ++++++++++++++++++++
 drivers/gpu/drm/nova/file.rs       |  68 +++++++++++++++++++
 drivers/gpu/drm/nova/gem.rs        |  49 ++++++++++++++
 drivers/gpu/drm/nova/nova.rs       |  17 +++++
 drivers/gpu/nova-core/Kconfig      |   1 +
 drivers/gpu/nova-core/driver.rs    |   9 ++-
 drivers/gpu/nova-core/nova_core.rs |   2 +
 include/uapi/drm/nova_drm.h        | 101 +++++++++++++++++++++++++++++
 rust/uapi/uapi_helper.h            |   1 +
 14 files changed, 349 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nova/Kconfig
 create mode 100644 drivers/gpu/drm/nova/Makefile
 create mode 100644 drivers/gpu/drm/nova/driver.rs
 create mode 100644 drivers/gpu/drm/nova/file.rs
 create mode 100644 drivers/gpu/drm/nova/gem.rs
 create mode 100644 drivers/gpu/drm/nova/nova.rs
 create mode 100644 include/uapi/drm/nova_drm.h

-- 
2.49.0

