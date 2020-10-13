Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6B828D1E2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 18:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE06A6E8F0;
	Tue, 13 Oct 2020 16:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFAE6E8F0;
 Tue, 13 Oct 2020 16:11:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id i1so18623825wro.1;
 Tue, 13 Oct 2020 09:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UHsDQCy295Hvw56mXeSaZ5ilmXgdKd81n9fHINsRJmg=;
 b=nZ3kr1ZvmphGw+hCXwxd1FBiNBdH15+XmV7uCx/N1aEPWdhltNbxfRJsOrYzCW5DYi
 p28N16Qv3CesL618NYcwzKJl8ExdPBSsAxEVpNuBjc2t7Y3vSDiCUCXqUsTPP3ri+xa3
 pYSiUdCkoFloRscJR5nF2nOA0n77jg0+DyulydlIg2O5dvN37b/KSTRSu0SrWqgYipLY
 Bv2SinElVWGIxKdfjR2keb0VyF7cTpeW4ZZMmz56ud2NUc4LXZYnfMSWKg7cjru34Jnt
 +3aGTZF5ErCoVoAaJUURuRybNuDUZmE1TuG1eiCC2mcWhrl0X3gWCU5HjivWDiRih7lu
 Lf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UHsDQCy295Hvw56mXeSaZ5ilmXgdKd81n9fHINsRJmg=;
 b=ov3yqYFQLm6yI1Wb9bHKVsHIu3bmb0TMswD9ur3ocSZ8sXhYLY1BQP/s1EJtYbx8oK
 n4q4y9QjHFSCvC4tMl5HDTwMs0fAVaiwx4J5LOAM/h9lbrknx/JV2AX0Qgl8yICKWaKN
 oiPLnvzQ2r5ybuS55bRYzcKUwX+hGVJcLXsSLG0+/mKxW3B5/DbVsCnftG3v0b58tHPR
 K1jovbDGlFfcK1mJHcekReZr/VhyU/HPsnAuDDlJsX4tTpot1H/Hw5PDOyUZe5Aeqva+
 hF6sJAly5znR7//7YpRIW1o9bHt5J2xfmvLYKT623rLn2NbAyThyfQ99L9cygr583wiI
 rgtg==
X-Gm-Message-State: AOAM532/jMsCD7CBwcyR0IjVDOeIgw4PoM6XCIi8FKzceAQZOw2rTid7
 DZMHa5Hr0TVgMeQto8BikTe5SnUIKL6vcKzIb68=
X-Google-Smtp-Source: ABdhPJxoD/2hTBypyfQGrCSNRV+Y6GtVMvHZ5uXUCdqyEiDvm0aXKSn04M6vBj6fqcnsx8/6ebXXeOA3cJnZw688USo=
X-Received: by 2002:a5d:4987:: with SMTP id r7mr377398wrq.327.1602605497546;
 Tue, 13 Oct 2020 09:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org>
 <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
 <20201007062519.GA23519@infradead.org>
 <c3baadae-8e20-86a6-44f5-4571a8d3035e@arm.com>
In-Reply-To: <c3baadae-8e20-86a6-44f5-4571a8d3035e@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 13 Oct 2020 09:11:26 -0700
Message-ID: <CAF6AEGtyczviULunw0tQK0Q9M22vkib19j=R_jTT2EtP5aqRCw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>, Joerg Roedel <joro@8bytes.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 6:42 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-10-07 07:25, Christoph Hellwig wrote:
> > On Tue, Oct 06, 2020 at 09:19:32AM -0400, Jonathan Marek wrote:
> >> One example why drm/msm can't use DMA API is multiple page table support
> >> (that is landing in 5.10), which is something that definitely couldn't work
> >> with DMA API.
> >>
> >> Another one is being able to choose the address for mappings, which AFAIK
> >> DMA API can't do (somewhat related to this: qcom hardware often has ranges
> >> of allowed addresses, which the dma_mask mechanism fails to represent, what
> >> I see is drivers using dma_mask as a "maximum address", and since addresses
> >> are allocated from the top it generally works)
> >
> > That sounds like a good enough rason to use the IOMMU API.  I just
> > wanted to make sure this really makes sense.
>
> I still think this situation would be best handled with a variant of
> dma_ops_bypass that also guarantees to bypass SWIOTLB, and can be set
> automatically when attaching to an unmanaged IOMMU domain. That way the
> device driver can make DMA API calls in the appropriate places that do
> the right thing either way, and only needs logic to decide whether to
> use the returned DMA addresses directly or ignore them if it knows
> they're overridden by its own IOMMU mapping.
>

That would be pretty ideal from my PoV

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
