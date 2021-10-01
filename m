Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E188E41EF8F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894566ED02;
	Fri,  1 Oct 2021 14:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07166ECFF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:34:35 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D77351F457A9;
 Fri,  1 Oct 2021 15:34:33 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v2 0/5] drm/panfrost: Add extra GPU-usage flags
Date: Fri,  1 Oct 2021 16:34:22 +0200
Message-Id: <20211001143427.1564786-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
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

Hello,

This is a follow-up of [1], which was adding the read/write
restrictions on GPU buffers. Robin and Steven suggested that I add a
flag to restrict the shareability domain on GPU-private buffers, so
here it is.

As you can see, the first patch is flagges RFC, since I'm not sure
adding a new IOMMU_ flag is the right solution, but IOMMU_CACHE
doesn't feel like a good fit either. Please let me know if you have
better ideas.

Regards,

Boris

[1]https://patchwork.kernel.org/project/dri-devel/patch/20210930184723.1482426-1-boris.brezillon@collabora.com/

Boris Brezillon (5):
  [RFC]iommu: Add a IOMMU_DEVONLY protection flag
  [RFC]iommu/io-pgtable-arm: Take the DEVONLY flag into account on
    ARM_MALI_LPAE
  drm/panfrost: Add PANFROST_BO_NO{READ,WRITE} flags
  drm/panfrost: Add a PANFROST_BO_GPUONLY flag
  drm/panfrost: Bump the driver version to 1.3

 drivers/gpu/drm/panfrost/panfrost_drv.c | 15 +++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_gem.c |  3 +++
 drivers/gpu/drm/panfrost/panfrost_gem.h |  3 +++
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 11 ++++++++++-
 drivers/iommu/io-pgtable-arm.c          | 25 +++++++++++++++++--------
 include/linux/iommu.h                   |  7 +++++++
 include/uapi/drm/panfrost_drm.h         |  3 +++
 7 files changed, 56 insertions(+), 11 deletions(-)

-- 
2.31.1

