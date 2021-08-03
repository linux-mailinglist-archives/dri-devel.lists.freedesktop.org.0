Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D92B3DE400
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 03:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567E66E21C;
	Tue,  3 Aug 2021 01:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39AC6E21C;
 Tue,  3 Aug 2021 01:31:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so1077454wmq.2; 
 Mon, 02 Aug 2021 18:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xoYKeNMcKT9d+jkGEnzy+zqeIUVXh9cRA8f49lcGYC8=;
 b=K4cUt6vdJtIGAoypcfbhOnCY7xrdQNo/3h5B6VyuGQC6ZNWK/BBe++Xkxp67ld0Rn0
 Zh1pJzHrvpzYLV1x4DFyxUiEyQ46SCW4/9Oh792YF+bcXDwFnTL1anQNGnPNR12vVrKh
 WS89KEbB9yo18n717VtF6iTXDAQi6CVZ24pgQjC7Q7vZZ0qvVDrCemM4HWR4/0t6pRvb
 0YgX1LDLC5ekVWNwayNpI0OPAKJP7zmlBTS0tXXOEjxbgVf3n0We5wttMwz2tAfm+Yoe
 EhkzubmCCp386nRqW3vNJdOhPwdOWwFQTkeZrUrwSgV/s+ewosTRt+Dpoy174Qz0n96d
 atfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xoYKeNMcKT9d+jkGEnzy+zqeIUVXh9cRA8f49lcGYC8=;
 b=V45GrpH8UVjCNke3C90KFEBvGTU1amDP5m72wtlb4VoQdpyWUgVYVqLNmluB633n88
 QzTfAzGgeaxqKX89yRAklsVGX8UB1AW5eUibupcQiKlWprcimRL4wNG4TkimSGz0tyaz
 ZCJ62YTY2hq8QBI1BhAhJdmR+WuAVCprPmKICfzXPTKXpNML4PD4xkfM2YM2/ZjfieMy
 iLypvFs824rPtf1xBhhiE9FIDt8VKar0dfZTaroyiAJxzeqiIFy1ZbJcBdCQSECmQe6h
 0AflDjfZSy31duIJeVujSesVzvxgzfdAFdF8XHMDCtAEb24LsfsRUykW1SmW4Hwz9HoF
 swZA==
X-Gm-Message-State: AOAM533OBKMkt3jY4G9+49EDZQJ0WhI9jQqYkdeNg+hIfek4z9y6dTYf
 ytuse1+/s/Be4UTUPlG8hruSW9oiyg7TRaJ5t04=
X-Google-Smtp-Source: ABdhPJxdMWZqPHrh+Mxx9qIF7HQSUcdRyEEsbC9X4CVXONVLsF849KG7gxpA1BIWW/BxUAjLxanM9tlNbBcIasoLz7Q=
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr1613548wma.49.1627954311450; 
 Mon, 02 Aug 2021 18:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210728140052.GB22887@mms-0441>
 <8b2742c8891abe4fec3664730717a089@codeaurora.org>
 <20210802105544.GA27657@willie-the-truck>
 <CAF6AEGvtpFu8st=ZFNoKjP9YsAenciLxL1zMFi_iqMCvdby73w@mail.gmail.com>
 <20210802151409.GE28735@willie-the-truck>
In-Reply-To: <20210802151409.GE28735@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 2 Aug 2021 18:36:04 -0700
Message-ID: <CAF6AEGtzvyEUm0Fc8QT5t9KNK7i0FbFyi7zDM2_PMCzZBp7qbw@mail.gmail.com>
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

On Mon, Aug 2, 2021 at 8:14 AM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Aug 02, 2021 at 08:08:07AM -0700, Rob Clark wrote:
> > On Mon, Aug 2, 2021 at 3:55 AM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Thu, Jul 29, 2021 at 10:08:22AM +0530, Sai Prakash Ranjan wrote:
> > > > On 2021-07-28 19:30, Georgi Djakov wrote:
> > > > > On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
> > > > > > commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> > > > > > removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> > > > > > the memory type setting required for the non-coherent masters to use
> > > > > > system cache. Now that system cache support for GPU is added, we will
> > > > > > need to set the right PTE attribute for GPU buffers to be sys cached.
> > > > > > Without this, the system cache lines are not allocated for GPU.
> > > > > >
> > > > > > So the patches in this series introduces a new prot flag IOMMU_LLC,
> > > > > > renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
> > > > > > and makes GPU the user of this protection flag.
> > > > >
> > > > > Thank you for the patchset! Are you planning to refresh it, as it does
> > > > > not apply anymore?
> > > > >
> > > >
> > > > I was waiting on Will's reply [1]. If there are no changes needed, then
> > > > I can repost the patch.
> > >
> > > I still think you need to handle the mismatched alias, no? You're adding
> > > a new memory type to the SMMU which doesn't exist on the CPU side. That
> > > can't be right.
> > >
> >
> > Just curious, and maybe this is a dumb question, but what is your
> > concern about mismatched aliases?  I mean the cache hierarchy on the
> > GPU device side (anything beyond the LLC) is pretty different and
> > doesn't really care about the smmu pgtable attributes..
>
> If the CPU accesses a shared buffer with different attributes to those which
> the device is using then you fall into the "mismatched memory attributes"
> part of the Arm architecture. It's reasonably unforgiving (you should go and
> read it) and in some cases can apply to speculative accesses as well, but
> the end result is typically loss of coherency.

Ok, I might have a few other sections to read first to decipher the
terminology..

But my understanding of LLC is that it looks just like system memory
to the CPU and GPU (I think that would make it "the point of
coherence" between the GPU and CPU?)  If that is true, shouldn't it be
invisible from the point of view of different CPU mapping options?

BR,
-R
