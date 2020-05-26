Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4321E20E0
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 13:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD0D6E153;
	Tue, 26 May 2020 11:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69F76E153
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 11:31:59 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id c3so15917947otr.12
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 04:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=edTucrrhXN6V4llb+iJ6E89JH542mkCUYUO4cFFBSq8=;
 b=aGN8/fYlBZtC/O0HPJioAJDFXEl1EKIqh48gVGEseZge1RSD+6ZJ+Vd1Ygk7WsUiBQ
 2koLpbOnSxVT+v4ugow+jFX2DiKRsHvM/7p+yEm/ZUa0ijbY2x4j1GqJXf51BsbzMDnD
 BQSFbmNzjABlRFcmrqZN1EwG4aypCM6kLqRH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=edTucrrhXN6V4llb+iJ6E89JH542mkCUYUO4cFFBSq8=;
 b=a/Sr2FwEK6m7cqdD1wDwvex+6h+q2INA+hgQ+xWk41WQK+5y+tvjXzv6+3rUFDFYEl
 wE/Rqh0AnJfwa7OjDkJ/1rpoAYJK634MO0zz1s759kgebux61xw5kKyHmrXXWyAPnbjt
 lAnHUDlJVBSLdoDcE+URz1A947Q3U2283dPYU8zECA0e7ZkiGGT+FWifnqg34HqssKSS
 CqyZv76MX7xHfuXIeFZ/XgQXpejvDHZLuziMYJzmhdcEp/A15eI9CUhhuExeWQ/KrjVQ
 ITZrFqPx3lxMqvHelLwpVvZhEgVcYGFHo/QdmXW71awxFqFTlfBUJmwU/ZZt0Xy8vcrZ
 hV1A==
X-Gm-Message-State: AOAM533HXzgEw3fUfYeXVPUgURW3EDOx8zosMgQF/KJWlY2QFrR64Tus
 hiLAVAnK3SIFjOM/88STcpPw0Tfl+VR8qySMuRwCNQ==
X-Google-Smtp-Source: ABdhPJzCrvWpIr7oiZie/ZO14zr8xx2eKHZLh/b7YFaD0J7MeUVnKhbsTaugx/2157KZB7xg+CLgr312FbFucLK+W50=
X-Received: by 2002:a9d:600e:: with SMTP id h14mr497056otj.281.1590492719014; 
 Tue, 26 May 2020 04:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200513132127eucas1p23f6be10bbd627e69e36d2451068b3204@eucas1p2.samsung.com>
 <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513134741.GA12712@lst.de>
 <83d04017-c6f2-d714-963c-ffa9c7248790@samsung.com>
In-Reply-To: <83d04017-c6f2-d714-963c-ffa9c7248790@samsung.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 26 May 2020 13:31:47 +0200
Message-ID: <CAKMK7uFkvhytb9vKng+2_LuaLFvnEB_5e2s5EAWnVgA9VjRwZA@mail.gmail.com>
Subject: Re: [PATCH v5 00/38] DRM: fix struct sg_table nents vs. orig_nents
 misuse
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 26, 2020 at 9:01 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi
>
> On 13.05.2020 15:47, Christoph Hellwig wrote:
> > I've pushed out a branch with the first three patches here:
> >
> >     git://git.infradead.org/users/hch/dma-mapping.git dma-sg_table-helper
> >
> > Gitweb:
> >
> >     http://git.infradead.org/users/hch/dma-mapping.git/shortlog/refs/heads/dma-sg_table-helper
> >
> > and merged it into the dma-mapping for-next tree.  Unless someone shouts
> > the branch should be considered immutable in 24 hours.
>
> David & Daniel: could you merge all the DRM related changes on top of
> the provided branch? Merging those changes separately would take a lots
> of time because of the dependencies on the sgtable helpers and changes
> in the DRM core.

We generally freeze drm for big rework past -rc6 (small drivers tend
to be a bit later). I think simpler if we just land this in the merge
window and then smash the drm patches on top for 5.9 merge window.

Or all in in the same topic branch, but feels a bit late for that and
making sure nothing breaks.
-Daniel

>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
