Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB0FD0E977
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 11:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306C910E1E6;
	Sun, 11 Jan 2026 10:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kBXsSPR0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAC410E1E6
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 10:37:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DD75B43933;
 Sun, 11 Jan 2026 10:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B037C4CEF7;
 Sun, 11 Jan 2026 10:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768127847;
 bh=dePt43SNBgAbHvocqy1bmZTj4P+RAF7SlV/MxoRNsvQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kBXsSPR0TxXcGmrSTr1m2AYwDDmE5EHlWBhoS8FOTEyEkDrfKeG1oePyXFIC+Wpll
 kIOV5FuNrm3n0q14QlyOewKPUeY21W3nCSQ1o157RduoUPTdENc0XMS/pWyHM+FRdf
 yt9EWt2EAR+WzRQplROgnyjUlBLIy9a6ojxgPnKV0EL1veMqA01ApSxMp0M90xowF6
 3XRMBeWyJoPps7imeBn1XfEL3Vw+sqqspNynLaalStLo0jpu2VPy1gFxeSN67f/sKn
 y0Zo4qqUpsUJiRdVJK4mE0nA8G8T0j20PNRE/3bRqIwcNEheuxFj9X49mAlEA2Ous1
 iZvftUZwfKNCw==
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Williamson <alex@shazbot.org>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org, iommu@lists.linux.dev
Subject: [PATCH 3/4] iommufd: Require DMABUF revoke semantics
Date: Sun, 11 Jan 2026 12:37:10 +0200
Message-ID: <20260111-dmabuf-revoke-v1-3-fb4bcc8c259b@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com>
References: <20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com>
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

From: Leon Romanovsky <leonro@nvidia.com>

IOMMUFD does not support page fault handling, and after a call to
.move_notify() all mappings become invalid. Ensure that the IOMMUFD
DMABUF importer is bound to a revoke‑aware DMABUF exporter (for example,
VFIO).

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/iommu/iommufd/pages.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index dbe51ecb9a20..a233def71be0 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1451,7 +1451,7 @@ static void iopt_revoke_notify(struct dma_buf_attachment *attach)
 
 static struct dma_buf_attach_ops iopt_dmabuf_attach_revoke_ops = {
 	.allow_peer2peer = true,
-	.move_notify = iopt_revoke_notify,
+	.revoke_notify = iopt_revoke_notify,
 };
 
 /*

-- 
2.52.0

