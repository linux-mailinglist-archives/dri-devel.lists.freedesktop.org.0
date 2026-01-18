Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886D9D394B1
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 13:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0FA10E119;
	Sun, 18 Jan 2026 12:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aG4uK31r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920B610E119;
 Sun, 18 Jan 2026 12:08:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 50EC843A5A;
 Sun, 18 Jan 2026 12:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92637C116D0;
 Sun, 18 Jan 2026 12:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768738139;
 bh=6bmUHSFT3Q7/+tXPCxCaiihzWsFX2kmrdZwwrHRlKhY=;
 h=From:To:Cc:Subject:Date:From;
 b=aG4uK31r0MqVjWD9XffPW7en2hhZsO688W532e1q8M7HRFYm320SE5m73+UGstOff
 0HrYZuKbh0toNswE4Xbm1P0QHSQKJblqIbIyQy0jq+i0SdliWxS4tc1gq5JCChkVGi
 Riax/uALSvMxc5oVBHWULvwd01DMvBqLuON9emQT4OVyyB5VdFxK+Ox4k/LswzZTkG
 Ah6VK2r5SR451CP05ufhWEs0FXamSBFN+a8yO057BxF8fnGNz5hAvSNoSnggXxVhx0
 5vL8oOMNUSVxROdcIeYu7DAAiE4l0/WXHLT4AilQNGqLbTAZ2WoezH1KLPDu6Lmimm
 EDaAW2lmOJo2A==
From: Leon Romanovsky <leon@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Alex Williamson <alex@shazbot.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: [PATCH v2 0/4] dma-buf: document revoke mechanism to invalidate
 shared buffers
Date: Sun, 18 Jan 2026 14:08:44 +0200
Message-ID: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251221-dmabuf-revoke-b90ef16e4236
X-Mailer: b4 0.15-dev-a6db3
Content-Transfer-Encoding: quoted-printable
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

Changelog:=0D
v2:=0D
 * Changed series to document the revoke semantics instead of=0D
   implementing it.=0D
v1: https://patch.msgid.link/20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidi=
a.com=0D
=0D
-------------------------------------------------------------------------=0D
This series documents a dma-buf =E2=80=9Crevoke=E2=80=9D mechanism: to allo=
w a dma-buf=0D
exporter to explicitly invalidate (=E2=80=9Ckill=E2=80=9D) a shared buffer =
after it has=0D
been distributed to importers, so that further CPU and device access is=0D
prevented and importers reliably observe failure.=0D
=0D
The change in this series is to properly document and use existing core=0D
=E2=80=9Crevoked=E2=80=9D state on the dma-buf object and a corresponding e=
xporter-triggered=0D
revoke operation. Once a dma-buf is revoked, new access paths are blocked s=
o=0D
that attempts to DMA-map, vmap, or mmap the buffer fail in a consistent way=
.=0D
=0D
Thanks=0D
=0D
Cc: linux-media@vger.kernel.org=0D
Cc: dri-devel@lists.freedesktop.org=0D
Cc: linaro-mm-sig@lists.linaro.org=0D
Cc: linux-kernel@vger.kernel.org=0D
Cc: amd-gfx@lists.freedesktop.org=0D
Cc: virtualization@lists.linux.dev=0D
Cc: intel-xe@lists.freedesktop.org=0D
Cc: linux-rdma@vger.kernel.org=0D
Cc: iommu@lists.linux.dev=0D
Cc: kvm@vger.kernel.org=0D
To: Sumit Semwal <sumit.semwal@linaro.org>=0D
To: Christian K=C3=B6nig <christian.koenig@amd.com>=0D
To: Alex Deucher <alexander.deucher@amd.com>=0D
To: David Airlie <airlied@gmail.com>=0D
To: Simona Vetter <simona@ffwll.ch>=0D
To: Gerd Hoffmann <kraxel@redhat.com>=0D
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>=0D
To: Gurchetan Singh <gurchetansingh@chromium.org>=0D
To: Chia-I Wu <olvaffe@gmail.com>=0D
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>=0D
To: Maxime Ripard <mripard@kernel.org>=0D
To: Thomas Zimmermann <tzimmermann@suse.de>=0D
To: Lucas De Marchi <lucas.demarchi@intel.com>=0D
To: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>=0D
To: Rodrigo Vivi <rodrigo.vivi@intel.com>=0D
To: Jason Gunthorpe <jgg@ziepe.ca>=0D
To: Leon Romanovsky <leon@kernel.org>=0D
To: Kevin Tian <kevin.tian@intel.com>=0D
To: Joerg Roedel <joro@8bytes.org>=0D
To: Will Deacon <will@kernel.org>=0D
To: Robin Murphy <robin.murphy@arm.com>=0D
To: Alex Williamson <alex@shazbot.org>=0D
=0D
---=0D
Leon Romanovsky (4):=0D
      dma-buf: Rename .move_notify() callback to a clearer identifier=0D
      dma-buf: Document revoke semantics=0D
      iommufd: Require DMABUF revoke semantics=0D
      vfio: Add pinned interface to perform revoke semantics=0D
=0D
 drivers/dma-buf/dma-buf.c                   |  6 +++---=0D
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  4 ++--=0D
 drivers/gpu/drm/virtio/virtgpu_prime.c      |  2 +-=0D
 drivers/gpu/drm/xe/tests/xe_dma_buf.c       |  6 +++---=0D
 drivers/gpu/drm/xe/xe_dma_buf.c             |  2 +-=0D
 drivers/infiniband/core/umem_dmabuf.c       |  4 ++--=0D
 drivers/infiniband/hw/mlx5/mr.c             |  2 +-=0D
 drivers/iommu/iommufd/pages.c               | 11 +++++++++--=0D
 drivers/vfio/pci/vfio_pci_dmabuf.c          | 16 ++++++++++++++++=0D
 include/linux/dma-buf.h                     | 25 ++++++++++++++++++++++---=
=0D
 10 files changed, 60 insertions(+), 18 deletions(-)=0D
---=0D
base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb=0D
change-id: 20251221-dmabuf-revoke-b90ef16e4236=0D
=0D
Best regards,=0D
--  =0D
Leon Romanovsky <leonro@nvidia.com>=0D
=0D
