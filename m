Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEAFA046D3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 17:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B15110E73F;
	Tue,  7 Jan 2025 16:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mtt3ghXB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FAF10E74A;
 Tue,  7 Jan 2025 16:42:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 49BDA5C012F;
 Tue,  7 Jan 2025 16:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADAFC4CED6;
 Tue,  7 Jan 2025 16:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736268175;
 bh=baWwtF1w+geq+KjvSOWUWaiuN8aV6ywKcKbSE05GCq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mtt3ghXB5IecyfyJLJHtV7Unz6mbhvjGhTJ+W3O3LKhKsYiLqGvGfyuNUsKgGbN1w
 gK85tjzhugigyHQMiMzLBBU9UugJBkLHYEvgFZJMlwt2noxIdKjB3KmlickGp3vJKY
 2RP2WLTk0lJECxowFX5BOpEcHLse5IefNOj5ZP/3bQGGzsB8gIQd5OiMG66pBMWN5R
 MJBPvtcLAjlUokaXBgq1S4NmDfJLdSF15W1KlSdcTy9ODAQksfiI5OQr3/qnn4Xq0j
 XD6z+vdnel5O9AvExLarBUgv6ymUTFeyHc92uVGNcOVWfSgPKtUQG6AktbL1yu87cb
 bpAeqPOlFmc4A==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux.dev,
	Rob Clark <robdclark@gmail.com>
Cc: catalin.marinas@arm.com, kernel-team@android.com,
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Mostafa Saleh <smostafa@google.com>,
 Rob Clark <robdclark@chromium.org>, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Joao Martins <joao.m.martins@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v11 0/4] io-pgtable-arm + drm/msm: Extend iova fault
 debugging
Date: Tue,  7 Jan 2025 16:42:40 +0000
Message-Id: <173626454505.2884304.2651538990179658967.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241210165127.600817-1-robdclark@gmail.com>
References: <20241210165127.600817-1-robdclark@gmail.com>
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

On Tue, 10 Dec 2024 08:51:18 -0800, Rob Clark wrote:
> This series extends io-pgtable-arm with a method to retrieve the page
> table entries traversed in the process of address translation, and then
> beefs up drm/msm gpu devcore dump to include this (and additional info)
> in the devcore dump.
> 
> This is a respin of https://patchwork.freedesktop.org/series/94968/
> (minus a patch that was already merged)
> 
> [...]

Applied io-pgtable changes to iommu (arm/smmu/updates), thanks!

[1/4] iommu/io-pgtable-arm: Make pgtable walker more generic
      https://git.kernel.org/iommu/c/821500d5c597
[2/4] iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
      https://git.kernel.org/iommu/c/d9e589e6ad73
[3/4] iommu/io-pgtable-arm: Add way to debug pgtable walk
      https://git.kernel.org/iommu/c/aff028a8192d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
