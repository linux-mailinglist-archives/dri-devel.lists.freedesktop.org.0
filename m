Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JkxFMfNcGkOaAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 13:59:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AE9573B3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 13:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0245A10E781;
	Wed, 21 Jan 2026 12:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="emyyQJnk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A20F10E77A;
 Wed, 21 Jan 2026 12:59:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CE848600AA;
 Wed, 21 Jan 2026 12:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC24EC19424;
 Wed, 21 Jan 2026 12:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769000386;
 bh=d1hns7ecqedYSGdp3dVh7hrh3lxHsTLnWUd2PLo1qM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=emyyQJnkfNQ4Iwa2yve4soUs5i8e75BYDU+9czokUdgQocd78LcCkmzGh0hC1VmaY
 EjhJCxVuMqImcMWBGOqygLLvujoID0mcgHon4IjWViWIurQuAUSdcXN+EhJJsRPu9R
 gJuM0VBxy64kjYP6RxYKPdixXTw+T1/fXb+hF5PtZ4J7VoM1gUvWG4Fz3EuU3cv1Bj
 WwksBPm0LCCU+eL+/kbwf4ugTZvRGWw3Pa5GUYRl32HJUrTRyly53nlB5DwY1ykPuM
 Scenmm+ftdQCDOUjZsCj0HZUYX181oA+Uu/u6+EnVv7ncDYYlDy3oyxsoGkE0M+laI
 bn703toKud0Zw==
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
Subject: [PATCH v4 3/8] dma-buf: Always build with DMABUF_MOVE_NOTIFY
Date: Wed, 21 Jan 2026 14:59:11 +0200
Message-ID: <20260121-dmabuf-revoke-v4-3-d311cbc8633d@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
References: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a6db3
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email,nvidia.com:mid];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: F3AE9573B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Leon Romanovsky <leonro@nvidia.com>

DMABUF_MOVE_NOTIFY was introduced in 2018 and has been marked as
experimental and disabled by default ever since. Six years later,
all new importers implement this callback.

It is therefore reasonable to drop CONFIG_DMABUF_MOVE_NOTIFY and
always build DMABUF with support for it enabled.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/dma-buf/Kconfig                     | 12 ------------
 drivers/dma-buf/dma-buf.c                   |  3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 10 +++-------
 drivers/gpu/drm/amd/amdkfd/Kconfig          |  2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c       |  3 +--
 drivers/gpu/drm/xe/xe_dma_buf.c             | 12 ++++--------
 6 files changed, 10 insertions(+), 32 deletions(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index b46eb8a552d7..84d5e9b24e20 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -40,18 +40,6 @@ config UDMABUF
 	  A driver to let userspace turn memfd regions into dma-bufs.
 	  Qemu can use this to create host dmabufs for guest framebuffers.
 
-config DMABUF_MOVE_NOTIFY
-	bool "Move notify between drivers (EXPERIMENTAL)"
-	default n
-	depends on DMA_SHARED_BUFFER
-	help
-	  Don't pin buffers if the dynamic DMA-buf interface is available on
-	  both the exporter as well as the importer. This fixes a security
-	  problem where userspace is able to pin unrestricted amounts of memory
-	  through DMA-buf.
-	  This is marked experimental because we don't yet have a consistent
-	  execution context and memory management between drivers.
-
 config DMABUF_DEBUG
 	bool "DMA-BUF debug checks"
 	depends on DMA_SHARED_BUFFER
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index e12db540c413..cd68c1c0bfd7 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -847,8 +847,7 @@ static bool
 dma_buf_pin_on_map(struct dma_buf_attachment *attach)
 {
 	return attach->dmabuf->ops->pin &&
-		(!dma_buf_attachment_is_dynamic(attach) ||
-		 !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY));
+	       !dma_buf_attachment_is_dynamic(attach);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 863454148b28..349215549e8f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -145,13 +145,9 @@ static int amdgpu_dma_buf_pin(struct dma_buf_attachment *attach)
 	 * notifiers are disabled, only allow pinning in VRAM when move
 	 * notiers are enabled.
 	 */
-	if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
-		domains &= ~AMDGPU_GEM_DOMAIN_VRAM;
-	} else {
-		list_for_each_entry(attach, &dmabuf->attachments, node)
-			if (!attach->peer2peer)
-				domains &= ~AMDGPU_GEM_DOMAIN_VRAM;
-	}
+	list_for_each_entry(attach, &dmabuf->attachments, node)
+		if (!attach->peer2peer)
+			domains &= ~AMDGPU_GEM_DOMAIN_VRAM;
 
 	if (domains & AMDGPU_GEM_DOMAIN_VRAM)
 		bo->flags |= AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index 16e12c9913f9..a5d7467c2f34 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -27,7 +27,7 @@ config HSA_AMD_SVM
 
 config HSA_AMD_P2P
 	bool "HSA kernel driver support for peer-to-peer for AMD GPU devices"
-	depends on HSA_AMD && PCI_P2PDMA && DMABUF_MOVE_NOTIFY
+	depends on HSA_AMD && PCI_P2PDMA
 	help
 	  Enable peer-to-peer (P2P) communication between AMD GPUs over
 	  the PCIe bus. This can improve performance of multi-GPU compute
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 1f2cca5c2f81..c107687ef3c0 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -22,8 +22,7 @@ static bool p2p_enabled(struct dma_buf_test_params *params)
 
 static bool is_dynamic(struct dma_buf_test_params *params)
 {
-	return IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY) && params->attach_ops &&
-		params->attach_ops->invalidate_mappings;
+	return params->attach_ops && params->attach_ops->invalidate_mappings;
 }
 
 static void check_residency(struct kunit *test, struct xe_bo *exported,
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 1b9cd043e517..ea370cd373e9 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -56,14 +56,10 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 	bool allow_vram = true;
 	int ret;
 
-	if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
-		allow_vram = false;
-	} else {
-		list_for_each_entry(attach, &dmabuf->attachments, node) {
-			if (!attach->peer2peer) {
-				allow_vram = false;
-				break;
-			}
+	list_for_each_entry(attach, &dmabuf->attachments, node) {
+		if (!attach->peer2peer) {
+			allow_vram = false;
+			break;
 		}
 	}
 

-- 
2.52.0

