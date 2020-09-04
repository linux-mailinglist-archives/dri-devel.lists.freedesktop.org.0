Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFDD25E021
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 18:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5CC6EC8E;
	Fri,  4 Sep 2020 16:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C876B6EC9A;
 Fri,  4 Sep 2020 16:46:59 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id c6so71203qvj.1;
 Fri, 04 Sep 2020 09:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TBpouKohZ4xnNFvQAORhEKmSrdyDNk10oVx1FtC9Bws=;
 b=EgsDNr8jq4DF077DE8FFLRkR59IU61+j8V/Ka9V7oYrWIFPZmMCFtBwfask+T/m7M7
 ABkQRjkqmQNhqKh2VT7i4UJ/Wt90Z38MeTrYGvULyHJ82SQ6PsuQNCiKdiLa9nveFUpl
 R04cMMdDGxXDTRPRVqK11KOxC3g2sVS1/0YvzjlCoZCwTT0+M1Yo/uJWYoNvcaH8IrzS
 D4wFxN5u+Z5lTv8jIxdDc9Kz7W6pwsymzzpENZP0uaCYmJuezDkqwdXmmIDXl+AlvX5a
 XlvvIg2z5oM4vk2ffrT0qm6Rw0F7DcmoUiFJgFt2a2LOiExIWcNVg47MKAjj5MqzSRpP
 R2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TBpouKohZ4xnNFvQAORhEKmSrdyDNk10oVx1FtC9Bws=;
 b=Re5qC+/JipOnbtn+Zs9sor2Mt4x3xFl3omujvhQmx4YivYNyITcPH4wbfmDSaT3WWr
 WFGUIEd1qfzmlIrNB1yNDKGjK1C7rpb/ZQCr3VS5phF0Kukv/YKZk6otPS5Sa+xqtFAO
 ZRDsgHkbqWQG9Rcprlgwo8BKBaCAOaLCSzCA7tgP3V6Tk2aJFXUWpPFNhFjegrTJtzh8
 ibAZkNSOd3Ho6a/8lntSOxzzpbtMn4zQhdkDxlnILcyKcfrhCCk4Ropmg9cOcOkFa71m
 hZEAsXEicWWQSpKyg9sb4F+8g0HFe2gZVjtc+IerJiPDzaQYJ0or1dRcoSiwzbYZvPLa
 lTeA==
X-Gm-Message-State: AOAM533/K1AhyApf9yLaoY0DKVtFf2G7Lt/H3aaYI7I+3kQOW/KPtnPF
 kfBzv6Q2tIzI4ZymH6QMq4ReGYCKgAh2COowexU=
X-Google-Smtp-Source: ABdhPJwyy/xhHl+JQi8gUbkrBFV9qdIEd42p3ahcLsVYoc0LxBY3nBUW4K/0j87szLhObsiHhZk2WUEKzePSgoAinVs=
X-Received: by 2002:ad4:4ae9:: with SMTP id cp9mr8657659qvb.96.1599238018778; 
 Fri, 04 Sep 2020 09:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220238.603465-1-robdclark@gmail.com>
 <20200904091117.GH6714@8bytes.org>
In-Reply-To: <20200904091117.GH6714@8bytes.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 4 Sep 2020 09:47:45 -0700
Message-ID: <CAF6AEGtFoUQZv3HOpjXckExvXGVsqgPVe-rjq+wLXWM9+pjWkA@mail.gmail.com>
Subject: Re: [PATCH 00/20] iommu/arm-smmu + drm/msm: per-process GPU pgtables
To: Joerg Roedel <joro@8bytes.org>
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
Cc: Wambui Karuga <wambui.karugax@gmail.com>, Hanna Hawa <hannah@marvell.com>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Will Deacon <will@kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Sam Ravnborg <sam@ravnborg.org>,
 Jon Hunter <jonathanh@nvidia.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Sibi Sankar <sibis@codeaurora.org>, Thierry Reding <treding@nvidia.com>,
 Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Pritesh Raithatha <praithatha@nvidia.com>, Stephen Boyd <swboyd@chromium.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krishna Reddy <vdumpa@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 4, 2020 at 2:11 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> On Mon, Aug 17, 2020 at 03:01:25PM -0700, Rob Clark wrote:
> > Jordan Crouse (12):
> >   iommu/arm-smmu: Pass io-pgtable config to implementation specific
> >     function
> >   iommu/arm-smmu: Add support for split pagetables
> >   iommu/arm-smmu: Prepare for the adreno-smmu implementation
> >   iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
> >   dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
> >   drm/msm: Add a context pointer to the submitqueue
> >   drm/msm: Drop context arg to gpu->submit()
> >   drm/msm: Set the global virtual address range from the IOMMU domain
> >   drm/msm: Add support to create a local pagetable
> >   drm/msm: Add support for private address space instances
> >   drm/msm/a6xx: Add support for per-instance pagetables
> >   arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU
> >
> > Rob Clark (8):
> >   drm/msm: remove dangling submitqueue references
> >   iommu: add private interface for adreno-smmu
> >   drm/msm/gpu: add dev_to_gpu() helper
> >   drm/msm: set adreno_smmu as gpu's drvdata
> >   iommu/arm-smmu: constify some helpers
> >   arm: dts: qcom: sc7180: Set the compatible string for the GPU SMMU
> >   iommu/arm-smmu: add a way for implementations to influence SCTLR
> >   drm/msm: show process names in gem_describe
>
> Can the DRM parts be merged independently from the IOMMU parts or does
> this need to be queued together? If it needs to be together I defer the
> decission to Will through which tree this should go.
>

Hi,

v16 of this series re-ordered the patches and has some notes at the
top of the cover letter[1] about a potential way to land it.. tl;dr:
the drm parts can and adreno-smmu-priv.h can go independently of
iommu.  And the first four iommu patches can go in independently of
drm.  But the last two iommu patches have a dependency on the drm
patches.

Note that I'll send one more revision of the series shortly (I have a
small fixup for one of the drm patches for an issue found in testing,
and Bjorn had some suggestions about "iommu/arm-smmu: Prepare for the
adreno-smmu implementation" that I need to look at.

BR,
-R

[1] https://lkml.org/lkml/2020/9/1/1469
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
