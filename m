Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E20513DDBD0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 17:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2449A6E150;
	Mon,  2 Aug 2021 15:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11896E081;
 Mon,  2 Aug 2021 15:03:56 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id c9so1586168wri.8;
 Mon, 02 Aug 2021 08:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7XHOcI1iqZxijVLGLW7nItKOPrRmjBgh32wAYk4SY0A=;
 b=XHfgl+M3acCK7c0V7HKcPwXjFcClgkgpF8EEGCvsL19dxnBBG8PXPRDF0zkNLhAD8C
 eoElgSmdGbPUlGq0V/ocmmR/FLq0tG2IvgAFaeO0dAPN+lrF5Z5l68N7kuJnebiW22km
 AjHuMo7XLOekNR127PjRnsWmXdYNG5QBW93oZYKySrszC/IQ1M+p2SCvLhVmy4jGlZgi
 NV2kQ2FPtPB5CHuO16ms8wcPhglWnWHekMJQChMndk42kaSo3w+aN2L6H1UKXpq2JD57
 J/e9MuBhv8XBN+aL4sxNFY29iIIpagoCscQ9lmuvskMtv/HlEwPCDZ10W664wygmid0Z
 l6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7XHOcI1iqZxijVLGLW7nItKOPrRmjBgh32wAYk4SY0A=;
 b=tVB4NhebsQ0NrTvutZa/vh3nQ1fwG8t91BxM7q3R6se7Y+fI7gz8uHRGYMxz0UwzZC
 EVL5pGexj6jrYz+xXEFhDc5qI6HyGnVoAoabWep3AB6lxvabFP997uF3Zsz9/G51iZq6
 3QCJRqBWpCsci5fgtmAYEFCHID6MrgYaL5cBrgpRRZjK9x7j3dYJd9D2bxdU/11/AkLe
 5CP5tCQM8jSjJlUXVXWLq0s1L0nmq/H/B8r3zGWKfX1La41uwDrXuH4c0WjlwRX1YlY5
 U9WNiAm/evznGn1r+XYTgSBf6m5PJFKGyjGeBB/TC6DJ2+SmkEDcdrmxp1/Tq4p1TaO3
 4hQw==
X-Gm-Message-State: AOAM533BXKxXHuw47s1hFtmnUXsYeeufhhzO392g26ThdeP1ry1O7w80
 beQDplAFceVCpCJ0FVEiFjqfyCxf5XTdG4MnVew=
X-Google-Smtp-Source: ABdhPJwGH/Eqr7CF+Kt6gNll6QNMzEySN4X0hbpZ4Q5OsyHEbBPyczRncKgDY8mkF35HvK0Ng4dxN6be2gs74L1YFnE=
X-Received: by 2002:a5d:4348:: with SMTP id u8mr19002665wrr.28.1627916635155; 
 Mon, 02 Aug 2021 08:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210728140052.GB22887@mms-0441>
 <8b2742c8891abe4fec3664730717a089@codeaurora.org>
 <20210802105544.GA27657@willie-the-truck>
In-Reply-To: <20210802105544.GA27657@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 2 Aug 2021 08:08:07 -0700
Message-ID: <CAF6AEGvtpFu8st=ZFNoKjP9YsAenciLxL1zMFi_iqMCvdby73w@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 0/3] iommu/drm/msm: Allow non-coherent masters
 to use system cache
To: Will Deacon <will@kernel.org>
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Georgi Djakov <djakov@kernel.org>, 
 "Isaac J. Manjarres" <isaacm@codeaurora.org>, David Airlie <airlied@linux.ie>, 
 Akhil P Oommen <akhilpo@codeaurora.org>, 
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>,
 Kristian H Kristensen <hoegsberg@google.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Aug 2, 2021 at 3:55 AM Will Deacon <will@kernel.org> wrote:
>
> On Thu, Jul 29, 2021 at 10:08:22AM +0530, Sai Prakash Ranjan wrote:
> > On 2021-07-28 19:30, Georgi Djakov wrote:
> > > On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
> > > > commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> > > > removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> > > > the memory type setting required for the non-coherent masters to use
> > > > system cache. Now that system cache support for GPU is added, we will
> > > > need to set the right PTE attribute for GPU buffers to be sys cached.
> > > > Without this, the system cache lines are not allocated for GPU.
> > > >
> > > > So the patches in this series introduces a new prot flag IOMMU_LLC,
> > > > renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
> > > > and makes GPU the user of this protection flag.
> > >
> > > Thank you for the patchset! Are you planning to refresh it, as it does
> > > not apply anymore?
> > >
> >
> > I was waiting on Will's reply [1]. If there are no changes needed, then
> > I can repost the patch.
>
> I still think you need to handle the mismatched alias, no? You're adding
> a new memory type to the SMMU which doesn't exist on the CPU side. That
> can't be right.
>

Just curious, and maybe this is a dumb question, but what is your
concern about mismatched aliases?  I mean the cache hierarchy on the
GPU device side (anything beyond the LLC) is pretty different and
doesn't really care about the smmu pgtable attributes..

BR,
-R
