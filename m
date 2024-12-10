Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C61A9EAF82
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030DD10E88A;
	Tue, 10 Dec 2024 11:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oPiwb6ii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D2510E88A;
 Tue, 10 Dec 2024 11:14:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C8C4BA40BE8;
 Tue, 10 Dec 2024 11:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3CDC4CED6;
 Tue, 10 Dec 2024 11:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733829297;
 bh=lhICE9COOAdzLbeeCIG0N4z0GPEAUpsD9Gqft5qjfv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oPiwb6iiYNDZ/WGH9n+gRvMNUl6iGEU0HBgF/24GiCfBXOtlBxpMlXU2u10//8QC8
 WqMttv5upsoZ3Tccjav4vJtLriG2z2rEYDsmEwVN/VvwArcRysn0T6bYIm41crkJJi
 sl87IZYqvkQV6kkCxvZux0h/iSCXHxL+rzPJIg7IUXYsrf8XX7OdYAOgsTC9Mt6yrS
 i0cjfLiLJFBKdSeY8auwuEVGyBJjgmQdF1jsB9TmQsBJLu/1gUHvM1k0/M620uRqjc
 LqySKf6zHG+OnkBUJPKGWGfTB29xpI/OQhVkIq7IrAf3p6AyEoCARe02X2SdIi2UIZ
 uzdvgQ8KgEQ0Q==
Date: Tue, 10 Dec 2024 11:14:51 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>,
 Mostafa Saleh <smostafa@google.com>, Rob Clark <robdclark@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Joao Martins <joao.m.martins@oracle.com>, Joerg Roedel <jroedel@suse.de>,
 Konrad Dybcio <konradybcio@kernel.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:POWER MANAGEMENT CORE" <linux-pm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Sean Paul <sean@poorly.run>, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v10 0/4] io-pgtable-arm + drm/msm: Extend iova fault
 debugging
Message-ID: <20241210111450.GA14735@willie-the-truck>
References: <20241028213146.238941-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028213146.238941-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hi Rob,

On Mon, Oct 28, 2024 at 02:31:36PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This series extends io-pgtable-arm with a method to retrieve the page
> table entries traversed in the process of address translation, and then
> beefs up drm/msm gpu devcore dump to include this (and additional info)
> in the devcore dump.
> 
> This is a respin of https://patchwork.freedesktop.org/series/94968/
> (minus a patch that was already merged)
> 
> v2:  Fix an armv7/32b build error in the last patch
> v3:  Incorperate Will Deacon's suggestion to make the interface
>      callback based.
> v4:  Actually wire up the callback
> v5:  Drop the callback approach
> v6:  Make walk-data struct pgtable specific and rename
>      io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
> v7:  Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty()
> v8:  Pass pte pointer to callback so it can modify the actual pte
> v9:  Fix selftests_running case
> v10: Call visit cb for all nodes traversed, leave the decision about
>      whether to care about non-leaf nodes to the callback

Do you plan to respin this? I see Mostafa left a proposal on patch 3.

Thanks,

Will
