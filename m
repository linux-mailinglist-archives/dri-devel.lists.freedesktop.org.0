Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0A2AFB96E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 19:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C46910E18F;
	Mon,  7 Jul 2025 17:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fNawTVU9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5643C10E18F;
 Mon,  7 Jul 2025 17:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751907895;
 bh=jgKZgyW8ErO8QzJyJCAQZUk0KZ20NLh49rPbV9DsWz8=;
 h=From:To:Cc:Subject:Date:From;
 b=fNawTVU9aFP0I1iAvn5Qf0e0rri1K0BP2b1vqr0j4IJ93VqfvahDvOlegx7/R5Z+E
 NrRW7k/jYHWdfnix2GB5sNeOLxRCdga+aBsBPxZSOsqNAkdiofIf2S8V1nDkH+TfmB
 6NNW6zD+LYiCXzVS+3iI0Ox8N7YkH9dPz6vtdZ0WLPSBdgylwhBRl9GriHI4ILP+z1
 8Esae5v0L34CL8+UTI//+GkxSbFsue9vy5IR82y9HRQ4wcrfTkq8E5Hyz6KDzOLYoc
 opM+hfPQg8xCkArH+B2W3Jyqi710hbW6z0mfLrGubipokGs0G5wNWLqayDj/F4/YrC
 xaUkaB3gSoubA==
Received: from debian-rockchip-rock5b-rk3588.. (unknown [90.168.160.154])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nanokatze)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8711E17E046D;
 Mon,  7 Jul 2025 19:04:54 +0200 (CEST)
From: Caterina Shablia <caterina.shablia@collabora.com>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Frank Binns" <frank.binns@imgtec.com>,
 "Matt Coster" <matt.coster@imgtec.com>,
 "Karol Herbst" <kherbst@redhat.com>, "Lyude Paul" <lyude@redhat.com>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Boris Brezillon" <boris.brezillon@collabora.com>,
 "Steven Price" <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>,
 "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>,
 Caterina Shablia <caterina.shablia@collabora.com>
Subject: [PATCH v4 0/7] drm/panthor: support repeated mappings
Date: Mon,  7 Jul 2025 17:04:26 +0000
Message-ID: <20250707170442.1437009-1-caterina.shablia@collabora.com>
X-Mailer: git-send-email 2.47.2
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

This patch series adds OP_MAP_REPEAT flag, which lets the user map a BO
region over an address range repeatedly with just one map operation.

Sparse resources in the Vulkan API let the user leave regions of a
resource unmapped (from the API perspective.) Accesses to such regions
must not result in program termination, but loads produce undefined
values.

To implement this feature on Mali hardware, Vulkan sparse unmap is
implemented by mapping the specified region to a "dummy bo" so that the
accesses do not fault. A newly created sparse resource starts off
unmapped, and therefore also has to be mapped to the "dummy bo".  This
"dummy bo" is small (a page size) in comparison to the sizes of va
ranges that we might want to map to it, and a large number of vm_bind
ops can be necessary. For example, if the user were to create a
100e6-byte sparse resident resource, we'd have to poke VM_BIND with
ceil(100e6/0x1000)=24415 map operations.

OP_MAP_REPEAT addresses this particular inefficiency by letting us
implement a single Vulkan sparse unmap operation and sparse resident
resource initialization with just one map operation.

The panvk changes making use of this uapi can be found at
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35287

Changes in v4:
- Fixed the warnings reported by the kernel test robot.
  https://lore.kernel.org/oe-kbuild-all/202507041635.WyDu3TQ1-lkp@intel.com/
- Fixed the warnings reported by the CI.
  https://patchwork.freedesktop.org/series/151264/

No changes in v3.

Changes in v2:
- Make panthor use this stuff.
- Make it possible to express a repeated mappina of any suitably sized
  and aligned range of a BO, rather than strictly the page size -sized
  prefix, generalizing the API. Rename DRM_GPUVA_SINGLE_PAGE to
  DRM_GPUVA_REPEAT.
- Clean up parts of drm/gpuvm affected by these changes.

Link to v1: https://lore.kernel.org/lkml/20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net/

Asahi Lina (2):
  drm/gpuvm: Add a flags field to drm_gpuvm_map_req/drm_gpuva_op_map
  drm/gpuvm: Add DRM_GPUVA_REPEAT flag and logic

Boris Brezillon (5):
  drm/panthor: Add support for atomic page table updates
  drm/gpuvm: Kill drm_gpuva_init()
  drm/gpuvm: Pass map arguments through a struct
  drm/gpuvm: Add a helper to check if two VA can be merged
  drm/panthor: Add support for repeated mappings

 drivers/gpu/drm/drm_gpuvm.c            | 182 ++++++++++++++++++-------
 drivers/gpu/drm/imagination/pvr_vm.c   |  15 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  11 +-
 drivers/gpu/drm/panthor/panthor_drv.c  |   3 +-
 drivers/gpu/drm/panthor/panthor_mmu.c  | 154 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c             |  13 +-
 include/drm/drm_gpuvm.h                | 101 +++++++++++---
 include/uapi/drm/panthor_drm.h         |  23 ++++
 8 files changed, 408 insertions(+), 94 deletions(-)


base-commit: 482c7e296edc0f594e8869a789a40be53c49bd6a
--
2.47.2

