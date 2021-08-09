Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0697F3E4A56
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 18:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EEC899E6;
	Mon,  9 Aug 2021 16:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45287899E6;
 Mon,  9 Aug 2021 16:52:54 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m12so22310102wru.12;
 Mon, 09 Aug 2021 09:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2L7Xy+kSkSB8kPBmIgw8tzfzAzeFGsrynvKM4ncobGg=;
 b=X9+0wF2GaQ7raosWSwV5iH/q+LeWIwvCWz2IaaE74LjXgHsBzH0N2oMvKWCCUPUI2v
 QvnXtiMI/URrt6JkXvSomugHApm3fFv5CTUEO8CByeqntudTGtq6flenWU/iFH7bmslv
 xazckccAGsQcUoD0I/hdLb0sydlhEhqBG0tVtq0UKp3as90BLY0LI4274JK2oqQ+RZns
 oeGC3VT6ZHBMVhiifzgcIolMfka6YwlkJrKdfHyx2DtJKochxNh3Ft1l1BVcEJBufZN1
 xGoMQYGN3wMXLJnSxYARL18Mpu4s3q+Y8ul4/fMG59sx+AlsKnc/Er1fmMwEQwGm6Qwn
 lPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2L7Xy+kSkSB8kPBmIgw8tzfzAzeFGsrynvKM4ncobGg=;
 b=Ioqd7BV6tnGk7aNktTBIiWO2M7S+gDV2LazyPn673VFTe2DiseCMwptZXHGBC5OFkP
 50KgeYWnAyZoP8TsuHaRTqmAe7vYI+5JtxDHbTeSqo7O4eNl3n7EQ3eDh5wIfgC9b4LX
 2ky5UpjwyrGaJyfQNetl+SjXwUjlEhw62A69KrpW0GO4mc35EfqidlpS9GY2uIBgfwCt
 cTFuOgGa8jPNT4ERTH8ioBMpNCQ0VYsTwe9D9NmJFtS9t2JxO9KtWgPrcafvdgILaLiC
 67O3ubC/IKgnx3CQ1mIcwLMhrL2UgcGAoBV64GutVQ+ncjclhPdjNsdCo+ec+KHZ27qH
 KwTA==
X-Gm-Message-State: AOAM532S31+1PiwVqzENjLYn1660LT0RDcs5UuHX2SiZQvMXDmoAWvVr
 khE2kqeSlgSkfwcnBYAbJ8fQ0lDJIvZ34JN9U+w=
X-Google-Smtp-Source: ABdhPJy6ue4KJGDE546ehJ8INdeemYfG8Io5+/EyyprVgfEQ9kTzuxHWC5wcNwTW8rcvqKRArNanUuaOU/l04vSEgs0=
X-Received: by 2002:a5d:504d:: with SMTP id h13mr25875481wrt.132.1628527972734; 
 Mon, 09 Aug 2021 09:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210728140052.GB22887@mms-0441>
 <8b2742c8891abe4fec3664730717a089@codeaurora.org>
 <20210802105544.GA27657@willie-the-truck>
 <CAF6AEGvtpFu8st=ZFNoKjP9YsAenciLxL1zMFi_iqMCvdby73w@mail.gmail.com>
 <20210802151409.GE28735@willie-the-truck>
 <CAF6AEGtzvyEUm0Fc8QT5t9KNK7i0FbFyi7zDM2_PMCzZBp7qbw@mail.gmail.com>
 <20210809145651.GC1458@willie-the-truck>
In-Reply-To: <20210809145651.GC1458@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Aug 2021 09:57:08 -0700
Message-ID: <CAF6AEGsSUojA=V0n2iRWTCn++buqN=Eoxo0r3=+=PBu1O=H-AQ@mail.gmail.com>
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

On Mon, Aug 9, 2021 at 7:56 AM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Aug 02, 2021 at 06:36:04PM -0700, Rob Clark wrote:
> > On Mon, Aug 2, 2021 at 8:14 AM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Mon, Aug 02, 2021 at 08:08:07AM -0700, Rob Clark wrote:
> > > > On Mon, Aug 2, 2021 at 3:55 AM Will Deacon <will@kernel.org> wrote:
> > > > >
> > > > > On Thu, Jul 29, 2021 at 10:08:22AM +0530, Sai Prakash Ranjan wrote:
> > > > > > On 2021-07-28 19:30, Georgi Djakov wrote:
> > > > > > > On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
> > > > > > > > commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> > > > > > > > removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> > > > > > > > the memory type setting required for the non-coherent masters to use
> > > > > > > > system cache. Now that system cache support for GPU is added, we will
> > > > > > > > need to set the right PTE attribute for GPU buffers to be sys cached.
> > > > > > > > Without this, the system cache lines are not allocated for GPU.
> > > > > > > >
> > > > > > > > So the patches in this series introduces a new prot flag IOMMU_LLC,
> > > > > > > > renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
> > > > > > > > and makes GPU the user of this protection flag.
> > > > > > >
> > > > > > > Thank you for the patchset! Are you planning to refresh it, as it does
> > > > > > > not apply anymore?
> > > > > > >
> > > > > >
> > > > > > I was waiting on Will's reply [1]. If there are no changes needed, then
> > > > > > I can repost the patch.
> > > > >
> > > > > I still think you need to handle the mismatched alias, no? You're adding
> > > > > a new memory type to the SMMU which doesn't exist on the CPU side. That
> > > > > can't be right.
> > > > >
> > > >
> > > > Just curious, and maybe this is a dumb question, but what is your
> > > > concern about mismatched aliases?  I mean the cache hierarchy on the
> > > > GPU device side (anything beyond the LLC) is pretty different and
> > > > doesn't really care about the smmu pgtable attributes..
> > >
> > > If the CPU accesses a shared buffer with different attributes to those which
> > > the device is using then you fall into the "mismatched memory attributes"
> > > part of the Arm architecture. It's reasonably unforgiving (you should go and
> > > read it) and in some cases can apply to speculative accesses as well, but
> > > the end result is typically loss of coherency.
> >
> > Ok, I might have a few other sections to read first to decipher the
> > terminology..
> >
> > But my understanding of LLC is that it looks just like system memory
> > to the CPU and GPU (I think that would make it "the point of
> > coherence" between the GPU and CPU?)  If that is true, shouldn't it be
> > invisible from the point of view of different CPU mapping options?
>
> You could certainly build a system where mismatched attributes don't cause
> loss of coherence, but as it's not guaranteed by the architecture and the
> changes proposed here affect APIs which are exposed across SoCs, then I
> don't think it helps much.
>

Hmm, the description of the new mapping flag is that it applies only
to transparent outer level cache:

+/*
+ * Non-coherent masters can use this page protection flag to set cacheable
+ * memory attributes for only a transparent outer level of cache, also known as
+ * the last-level or system cache.
+ */
+#define IOMMU_LLC      (1 << 6)

But I suppose we could call it instead IOMMU_QCOM_LLC or something
like that to make it more clear that it is not necessarily something
that would work with a different outer level cache implementation?

BR,
-R
