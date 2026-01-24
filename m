Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eI3ULyAadWl8AwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 20:14:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC737E985
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 20:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4620610E04A;
	Sat, 24 Jan 2026 19:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X+xeQLyr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4C410E04A;
 Sat, 24 Jan 2026 19:14:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 955BC42A2C;
 Sat, 24 Jan 2026 19:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCCF3C116D0;
 Sat, 24 Jan 2026 19:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769282074;
 bh=NATdES5Oox4rtKNrsa+ZhkierotfR0B1Snwy5+c+Bbs=;
 h=From:To:Cc:Subject:Date:From;
 b=X+xeQLyrmiha8BnMyD/M7eCAnElWAXyx4WoXt4tfQS4vL+Lj18HptF4vdWkGC4rsF
 l8VbI+pUbykRLgy+6HA7aEBf907qD9ZZ68jrJPOWicwTO+ZPQM7fh1ZBoWto4NeTPO
 o4hShgOgl/vcRYumX0eSg2+G78kV/SGlmCWKgkqVnHTOl9emqQWFdABDA/b2N39qv0
 Xiv1ayiZVo9ubVfOKCJjfRXnVDqvVzFz/s589xDn35UnaZbuVmhRZT8jXS+iF8zWsu
 5djtR6/w1SSZRATrIsFH01/wqz8sQFLKMWlV+ljHqiEl9WbAG4nfs7qWXfJLeFekkc
 w2VlG2FGlCcNA==
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
 Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Williamson <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: [PATCH v5 0/8] dma-buf: Use revoke mechanism to invalidate shared
 buffers
Date: Sat, 24 Jan 2026 21:14:12 +0200
Message-ID: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251221-dmabuf-revoke-b90ef16e4236
X-Mailer: b4 0.15-dev-47773
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6DC737E985
X-Rspamd-Action: no action

Changelog:
v5:
 * Documented the DMA-BUF expectations around DMA unmap.
 * Added wait support in VFIO for DMA unmap.
 * Reordered patches.
 * Improved commit messages to document even more.
v4: https://lore.kernel.org/all/20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com
 * Changed DMA_RESV_USAGE_KERNEL to DMA_RESV_USAGE_BOOKKEEP.
 * Made .invalidate_mapping() truly optional.
 * Added patch which renames dma_buf_move_notify() to be
   dma_buf_invalidate_mappings().
 * Restored dma_buf_attachment_is_dynamic() function.
v3: https://lore.kernel.org/all/20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com/
 * Used Jason's wordings for commits and cover letter.
 * Removed IOMMUFD patch.
 * Renamed dma_buf_attachment_is_revoke() to be dma_buf_attach_revocable().
 * Added patch to remove CONFIG_DMABUF_MOVE_NOTIFY.
 * Added Reviewed-by tags.
 * Called to dma_resv_wait_timeout() after dma_buf_move_notify() in VFIO.
 * Added dma_buf_attach_revocable() check to VFIO DMABUF attach function.
 * Slightly changed commit messages.
v2: https://patch.msgid.link/20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com
 * Changed series to document the revoke semantics instead of
   implementing it.
v1: https://patch.msgid.link/20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com

-------------------------------------------------------------------------
This series is based on latest VFIO fix, which will be sent to Linus
very soon.

https://lore.kernel.org/all/20260121-vfio-add-pin-v1-1-4e04916b17f1@nvidia.com/

Thanks
-------------------------------------------------------------------------
This series documents a dma-buf “revoke” mechanism: to allow a dma-buf
exporter to explicitly invalidate (“kill”) a shared buffer after it has
been distributed to importers, so that further CPU and device access is
prevented and importers reliably observe failure.

The change in this series is to properly document and use existing core
“revoked” state on the dma-buf object and a corresponding exporter-triggered
revoke operation.

dma-buf has quietly allowed calling move_notify on pinned dma-bufs, even
though legacy importers using dma_buf_attach() would simply ignore
these calls.

The intention was that move_notify() would tell the importer to expedite
it's unmapping process and once the importer is fully finished with DMA it
would unmap the dma-buf which finally signals that the importer is no
longer ever going to touch the memory again. Importers that touch past
their unmap() call can trigger IOMMU errors, AER and beyond, however
read-and-discard access between move_notify() and unmap is allowed.

Thus, we can define the exporter's revoke sequence for pinned dma-buf as:

	dma_resv_lock(dmabuf->resv, NULL);
	// Prevent new mappings from being established
	priv->revoked = true;

	// Tell all importers to eventually unmap
	dma_buf_invalidate_mappings(dmabuf);

	// Wait for any inprogress fences on the old mapping
	dma_resv_wait_timeout(dmabuf->resv,
			      DMA_RESV_USAGE_BOOKKEEP, false,
			      MAX_SCHEDULE_TIMEOUT);
	dma_resv_unlock(dmabuf->resv, NULL);

	// Wait for all importers to complete unmap
	wait_for_completion(&priv->unmapp_comp);

However, dma-buf also supports importers that don't do anything on
move_notify(), and will not unmap the buffer in bounded time.

Since such importers would cause the above sequence to hang, a new
mechanism is needed to detect incompatible importers.

Introduce dma_buf_attach_revocable() which if true indicates the above
sequence is safe to use and will complete in kernel-only bounded time for
this attachment.

Unfortunately dma_buf_attach_revocable() is going to fail for the popular
RDMA pinned importer, which means we cannot introduce it to existing
places using pinned move_notify() without potentially breaking existing
userspace flows.

Existing exporters that only trigger this flow for RAS errors should not
call dma_buf_attach_revocable() and will suffer an unbounded block on the
final completion, hoping that the userspace will notice the RAS and clean
things up. Without revoke support on the RDMA pinned importers it doesn't
seem like any other non-breaking option is currently possible.

For new exporters, like VFIO and RDMA, that have userspace triggered
revoke events, the unbouned sleep would not be acceptable. They can call
dma_buf_attach_revocable() and will not work with the RDMA pinned importer
from day 0, preventing regressions.

In the process add documentation explaining the above details.

Thanks

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
Leon Romanovsky (8):
      dma-buf: Rename .move_notify() callback to a clearer identifier
      dma-buf: Rename dma_buf_move_notify() to dma_buf_invalidate_mappings()
      dma-buf: Always build with DMABUF_MOVE_NOTIFY
      vfio: Wait for dma-buf invalidation to complete
      dma-buf: Make .invalidate_mapping() truly optional
      dma-buf: Add dma_buf_attach_revocable()
      vfio: Permit VFIO to work with pinned importers
      iommufd: Add dma_buf_pin()

 drivers/dma-buf/Kconfig                     | 12 ----
 drivers/dma-buf/dma-buf.c                   | 69 +++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 14 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
 drivers/gpu/drm/amd/amdkfd/Kconfig          |  2 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c      |  2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c       |  7 +--
 drivers/gpu/drm/xe/xe_bo.c                  |  2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c             | 14 ++---
 drivers/infiniband/core/umem_dmabuf.c       | 13 -----
 drivers/infiniband/hw/mlx5/mr.c             |  2 +-
 drivers/iommu/iommufd/pages.c               | 11 +++-
 drivers/iommu/iommufd/selftest.c            |  2 +-
 drivers/vfio/pci/vfio_pci_dmabuf.c          | 90 +++++++++++++++++++++++------
 include/linux/dma-buf.h                     | 17 +++---
 15 files changed, 164 insertions(+), 95 deletions(-)
---
base-commit: 61ceaf236115f20f4fdd7cf60f883ada1063349a
change-id: 20251221-dmabuf-revoke-b90ef16e4236

Best regards,
--  
Leon Romanovsky <leonro@nvidia.com>

