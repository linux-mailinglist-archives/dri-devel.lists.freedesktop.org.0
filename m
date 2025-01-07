Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A5AA04016
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 13:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFDA10E235;
	Tue,  7 Jan 2025 12:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m8ySdhAY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F7B10E235;
 Tue,  7 Jan 2025 12:58:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5F05AA412D4;
 Tue,  7 Jan 2025 12:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F014C4CEE2;
 Tue,  7 Jan 2025 12:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736254727;
 bh=0d8chFQwCQH17RxZgem2YuxeZFD8iqNF18spSTjEvc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m8ySdhAYCP+O/e4xmQy+M+8iHJf+MVc/zbwzBVDHy31+rGtRSf95w9/67SxvFbz/4
 nuEdInTnNN6apCgnGTLsBxOg95cwpbAa5q5bq5RkqGfkPRi1MfygXVkmLpvL7jSiVz
 mQCYobyHdRyRqzP9dTUKrrwmZUDHhpFognYGe+EcjMPhcCEPavD2oh60E6KVFg/2EI
 LcEylZoywSRRQzT4iTNN8D+jj8HzLw+cUu089n6lRlOM/vyETC/VWtoVrhZDaiASgp
 jT+dxh5ubmQnxiIrVrOzc+aoj9Yet8Ls4vJIVa3cbQvLe5AUW1PVy987hCJoXfO21p
 1mxzDVsIgFTEA==
Date: Tue, 7 Jan 2025 12:58:41 +0000
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Joao Martins <joao.m.martins@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v11 0/4] io-pgtable-arm + drm/msm: Extend iova fault
 debugging
Message-ID: <20250107125840.GB6991@willie-the-truck>
References: <20241210165127.600817-1-robdclark@gmail.com>
 <Z30kWxVxwJXO_z2_@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z30kWxVxwJXO_z2_@google.com>
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

On Tue, Jan 07, 2025 at 12:55:55PM +0000, Mostafa Saleh wrote:
> On Tue, Dec 10, 2024 at 08:51:18AM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > This series extends io-pgtable-arm with a method to retrieve the page
> > table entries traversed in the process of address translation, and then
> > beefs up drm/msm gpu devcore dump to include this (and additional info)
> > in the devcore dump.
> > 
> > This is a respin of https://patchwork.freedesktop.org/series/94968/
> > (minus a patch that was already merged)
> > 
> > v2:  Fix an armv7/32b build error in the last patch
> > v3:  Incorperate Will Deacon's suggestion to make the interface
> >      callback based.
> > v4:  Actually wire up the callback
> > v5:  Drop the callback approach
> > v6:  Make walk-data struct pgtable specific and rename
> >      io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
> > v7:  Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty()
> > v8:  Pass pte pointer to callback so it can modify the actual pte
> > v9:  Fix selftests_running case
> > v10: Call visit cb for all nodes traversed, leave the decision about
> >      whether to care about non-leaf nodes to the callback
> > v11: Adjust logic in 3/4 [smostafa@]
> 
> I see the level initialization was not removed as it was in the diff[1], so it
> seems to me that’s redundant as the level is set anyway in the callback, and
> actually looking at that I see it’s not used or printed from the driver,
> so may it can be removed all together, anyway that’s nit that may be Will can
> fix it up while merging.
> 
> Otherwise, For the whole series
> Reviewed-by: Mostafa Saleh <smostafa@google.com>

I'm happy to drop the 'level' field if it's not used. We can add it back
if/when it's needed. Rob?

Will
