Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC10BAA8CB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 22:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62C910E48D;
	Mon, 29 Sep 2025 20:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gGJrNrzT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE8410E253;
 Mon, 29 Sep 2025 20:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759176273;
 bh=dkRa3F/RjStNkVbhPhsN2OogBfmvPdqSm8pHIAsLQp0=;
 h=From:To:Cc:Subject:Date:From;
 b=gGJrNrzTY+T1Wttfb8CmxmIiieYIux/itfykNvflKdkUTIcVB10rmRZgGY2Qw05nq
 NGDOSc72CmM0spkV7cd6m+N92f78X2O6YhZbwF6hM3yUv4hTFCoRBlRaz0dDw1kDzn
 K92fiaZ1tpMRXItTKoz3OymbRP5sY279W7qXvm8qjaH0ECUkzB4st9jI7q8y/gMDCB
 ichJsFNPG9o/79jtFHngcZZgomJgt4a7WIIPnUCa4niC1Yha1HDXNIEyXdsTVyvtQy
 /TJKMrNZ+y8j7cARsRpldzxsPmC3rcc3n0God8I8i0s/ey4V7ZQcZcNHVe1YIGkHo6
 7y3VmIOZOkr1w==
Received: from debian-rockchip-rock5b-rk3588.. (unknown
 [IPv6:2a01:e0a:5e3:6100:826d:bc07:e98c:84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 32FF017E00EC;
 Mon, 29 Sep 2025 22:04:33 +0200 (CEST)
From: =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 =?UTF-8?q?Miko=C5=82aj=20Wasiak?= <mikolaj.wasiak@intel.com>,
 Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org, kernel@collabora.com
Subject: [PATCH 0/8] drm: Optimize page tables overhead with THP
Date: Mon, 29 Sep 2025 22:03:08 +0200
Message-ID: <20250929200316.18417-1-loic.molinari@collabora.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series aims to reduce the page tables overhead of DRM drivers for
builds with CONFIG_TRANSPARENT_HUGEPAGE enabled and either the sysfs
config '/sys/kernel/mm/transparent_hugepage/shmem_enabled'
appropriately set or drivers using a dedicated huge tmpfs mount point.

It starts by adding a huge page fault handler for GEM objects to
insert PMD or PUD mappings whenever the shmem backing store manages to
create huge folios. It then introduces a dedicated get_unmapped_area
file operation on the DRM file descriptor for GEM objects to get the
best virtual address alignment for the underlying shmem buffers.

The remaining commits propose shmem helpers to create and release huge
tmpfs mount points and adapt the i915 and V3D drivers. The helpers are
then used to optionally enable Transparent Hugepage for Panfrost and
Panthor.

Loïc Molinari (8):
  drm/shmem-helper: Add huge page fault handler
  drm/gem: Introduce drm_gem_get_unmapped_area() fop
  drm/shmem-helper: Add huge tmpfs mount point helpers
  drm/i915: Use huge tmpfs mount point helpers
  drm/v3d: Use huge tmpfs mount point helpers
  drm/panthor: Introduce huge tmpfs mount point option
  drm/panthor: Improve IOMMU map/unmap debugging logs
  drm/panfrost: Introduce huge tmpfs mount point option

 drivers/gpu/drm/drm_gem.c                  | 110 ++++++++++++++++----
 drivers/gpu/drm/drm_gem_shmem_helper.c     | 112 ++++++++++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gemfs.c      |  33 +-----
 drivers/gpu/drm/panfrost/panfrost_device.c |   4 +
 drivers/gpu/drm/panfrost/panfrost_device.h |   2 +
 drivers/gpu/drm/panfrost/panfrost_drv.c    |   6 ++
 drivers/gpu/drm/panfrost/panfrost_drv.h    |  11 ++
 drivers/gpu/drm/panfrost/panfrost_gem.c    |  29 +++++-
 drivers/gpu/drm/panfrost/panfrost_gem.h    |   3 +
 drivers/gpu/drm/panthor/panthor_device.c   |   4 +
 drivers/gpu/drm/panthor/panthor_device.h   |   3 +
 drivers/gpu/drm/panthor/panthor_drv.c      |   7 ++
 drivers/gpu/drm/panthor/panthor_drv.h      |  11 ++
 drivers/gpu/drm/panthor/panthor_gem.c      |  30 +++++-
 drivers/gpu/drm/panthor/panthor_gem.h      |   3 +
 drivers/gpu/drm/panthor/panthor_mmu.c      |  19 +++-
 drivers/gpu/drm/v3d/v3d_gemfs.c            |  31 +-----
 include/drm/drm_gem.h                      |   4 +
 include/drm/drm_gem_shmem_helper.h         |  14 +++
 mm/shmem.c                                 |   1 +
 20 files changed, 346 insertions(+), 91 deletions(-)
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_drv.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_drv.h

-- 
2.47.3

