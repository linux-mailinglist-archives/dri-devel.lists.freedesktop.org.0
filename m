Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2129BF23F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 16:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28AF10E70F;
	Wed,  6 Nov 2024 15:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xy+3mwjA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C788610E70F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 15:53:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9ADD6A43F97;
 Wed,  6 Nov 2024 15:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DDAC4CECD;
 Wed,  6 Nov 2024 15:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730908413;
 bh=Eg7TVMu0q5lzDUTXHhoiurM6aMX5DshN2Hm+8U2txNg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xy+3mwjAla+PCpUgJIAWjVJvAxy/sWMdntHcLHXg4t4MBCLlQUKPUTdEBJ9xKed5t
 Ks2GXpv5XKfiadr4Px/0LuF5VWyVKBfOsYc55xuB2UVnQ620qanS0fhmo/LFzJ/8L4
 ZUmueb01LhGr9wKA1zJu2JaXIa9WP97ov5IJ+kWHmFDQluN2YatgrwxJKSZ99SGlQJ
 BufjhA3pihT4TISQ93n9mihnSxXrXjGOWSakfKuTtraNBX2kDuNhnNz75plYmxWW5a
 ogtXlWD70w7ub8mCGvZLUkmq0i9nvHF7OKPnuAcugmbyV6wxbomkjh+mh/hSmS8ga0
 BovKWFWogz5Rg==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: catalin.marinas@arm.com, kernel-team@android.com,
 Will Deacon <will@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 0/3] Remove split on unmap behavior
Date: Wed,  6 Nov 2024 15:53:23 +0000
Message-Id: <173090505900.4167208.10850898110820689849.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
References: <0-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Tue, 05 Nov 2024 14:14:23 -0400, Jason Gunthorpe wrote:
> This is the result of the discussion on removing split. We agreed that
> split is not required, and no application should ask for anything that
> would not unmap a full large IOPTE.
> 
> Instead of split the two ARM drivers will now WARN_ON and return 0. This
> is in contrast to what several other drivers do of removing the whole
> IOPTE and returning 0.
> 
> [...]

Applied to iommu (arm/smmu), thanks!

[1/3] iommu/io-pgtable-arm: Remove split on unmap behavior
      https://git.kernel.org/iommu/c/33729a5fc0ca
[2/3] iommu/io-pgtable-arm-v7s: Remove split on unmap behavior
      https://git.kernel.org/iommu/c/fd50651636fb
[3/3] iommu: Add a kdoc to iommu_unmap()
      https://git.kernel.org/iommu/c/6ac7dffe7cca

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
