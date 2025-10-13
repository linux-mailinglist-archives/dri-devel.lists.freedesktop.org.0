Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D030BD4240
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 17:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE75210E3BF;
	Mon, 13 Oct 2025 15:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hU07OA84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CE410E494
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 15:26:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4811A48B41;
 Mon, 13 Oct 2025 15:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B086DC16AAE;
 Mon, 13 Oct 2025 15:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760369207;
 bh=OVKSxkqNx5xaHu4z7h221RNhnqfR95e6/sS/QJ/Ow+k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hU07OA840mPC8nIqDvgUkFrQK1ylpRq/rsqQrQaGDWaU03D7b8rgS3C97iQw/udUl
 3NSnEHDvngRAdFmBJfNS7DNAnurv0IHuFVBDZLtMSBtETwHHX8BXIUoAhPWaKPHSc0
 xM8SfkIqhTuNdMCdYE+VTrovdZdQcGFBwT/w5wBViNdvqRNCNA7CdasIYxwsWBiM7m
 UfQ+BnlGr0iCYXnIupzJo8tqWsZqvYSRQPl/qKkl6/9Wc5hIUYS2PypcMAqHoBzSGr
 QIgMeIeDDVN+ZjQL8jPW4Jne8q0FQEzaiy5qqboSnOQBau+WHNsuw1rLos6pADSeBY
 Zywx646Qcxvmw==
From: Leon Romanovsky <leon@kernel.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v5 6/9] vfio: Export vfio device get and put registration
 helpers
Date: Mon, 13 Oct 2025 18:26:08 +0300
Message-ID: <67fc8a91a1a047c83455721d28058a1cc86b003f.1760368250.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760368250.git.leon@kernel.org>
References: <cover.1760368250.git.leon@kernel.org>
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

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

These helpers are useful for managing additional references taken
on the device from other associated VFIO modules.

Original-patch-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/vfio/vfio_main.c | 2 ++
 include/linux/vfio.h     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 38c8e9350a60..9aa4a5d081e8 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -172,11 +172,13 @@ void vfio_device_put_registration(struct vfio_device *device)
 	if (refcount_dec_and_test(&device->refcount))
 		complete(&device->comp);
 }
+EXPORT_SYMBOL_GPL(vfio_device_put_registration);
 
 bool vfio_device_try_get_registration(struct vfio_device *device)
 {
 	return refcount_inc_not_zero(&device->refcount);
 }
+EXPORT_SYMBOL_GPL(vfio_device_try_get_registration);
 
 /*
  * VFIO driver API
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index eb563f538dee..217ba4ef1752 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -297,6 +297,8 @@ static inline void vfio_put_device(struct vfio_device *device)
 int vfio_register_group_dev(struct vfio_device *device);
 int vfio_register_emulated_iommu_dev(struct vfio_device *device);
 void vfio_unregister_group_dev(struct vfio_device *device);
+bool vfio_device_try_get_registration(struct vfio_device *device);
+void vfio_device_put_registration(struct vfio_device *device);
 
 int vfio_assign_device_set(struct vfio_device *device, void *set_id);
 unsigned int vfio_device_set_open_count(struct vfio_device_set *dev_set);
-- 
2.51.0

