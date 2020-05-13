Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 350EB1D2179
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 23:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4807B6EA9C;
	Wed, 13 May 2020 21:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A435F6EA9C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 21:51:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id g4so1293991ljl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c4GzEKN4UHscMkRfgK/KmlmDtv9fIM50sPFyVikryKQ=;
 b=O8JCadTsQl0Tyvlb72GDnj5fWwBBQal84Q4eYowAUSAU0My9xiciKbQ5opOHnfwl9N
 Qb5nQGHUjnL79yJetrBRfHA673D+DtgS7C/OXM/Jj+mCy4cl51SspGMJvwVFVu8mQw/d
 E0lrDdlhkaMITXDJ0+azix8pePd4EjeDt5g7yhokYKopEAlRvUP/8w/RAInfA6caXo+K
 ruac9LVx6zmyBPRvtCJoQCkeekvevefrJdyMNUMDpe0/sCo9HnlDe3w74ikeYyTigQIj
 aG+tjvBV7Sqetjfnq4VJ/fo8MRHFgz35H6NVpzXrbNEzRfRmIydljGEGOXoJVfCSbwOl
 4D5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c4GzEKN4UHscMkRfgK/KmlmDtv9fIM50sPFyVikryKQ=;
 b=HLE60xuFIm1AtMGNqulHcZ0HNY2Zh95/IaackMOUuDf4t9o4Txe/eO9YxCXsoL2yG6
 uYObTtjJM4Kn5bRTCUzzGfrnbbwdlOlzkbqs/p2B2gEiEDi+HptcP0Y3WrBUvojv2kab
 tZgW4/66BI5v7VGTsAAywRveZtNIUd7R6PaRxptR71onkWofJp6qR67IMht/AR4iqyiP
 /sok02dKz0qbgK21zrbeKau4KfIm4wucABk1FMCA0/VUVOPslDcWfWjX/jySEU/YVxHL
 UUDOHw2oeUUNWCnulyWDaOHUP360eS1weajWacA08H+zEuLl0BXwjXqDzl3YFsHvu0Tg
 OD2w==
X-Gm-Message-State: AOAM532eooxNR06TG7I+q1o60zZpJoZdNHddJXwwmErKoUg5gs3UeGBx
 bix2n0t5pZH18z6B21/bSxWBwAILm20V9pYaANed5A==
X-Google-Smtp-Source: ABdhPJxvVYUU3pLt0Fm0zZnTD0agcvWiYXLQjHfcp4jZKWPnJaLBh2OjEP0dKl4uakuItjfjxNR6jFpY0iO1wNvpqZc=
X-Received: by 2002:a2e:8047:: with SMTP id p7mr641481ljg.206.1589406671985;
 Wed, 13 May 2020 14:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <CGME20200513133314eucas1p1a607b556e32887e7f5ca60eb09a476c6@eucas1p1.samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <20200513133245.6408-24-m.szyprowski@samsung.com>
In-Reply-To: <20200513133245.6408-24-m.szyprowski@samsung.com>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 13 May 2020 14:51:00 -0700
Message-ID: <CADaigPV7sO1pKrspDya+3OLeX0b0mzkZdjb4ox+gQddsmfw0-w@mail.gmail.com>
Subject: Re: [PATCH v5 24/38] drm: v3d: fix common struct sg_table related
 issues
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 6:33 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
> returns the number of the created entries in the DMA address space.
> However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
> dma_unmap_sg must be called with the original number of the entries
> passed to the dma_map_sg().
>
> struct sg_table is a common structure used for describing a non-contiguous
> memory buffer, used commonly in the DRM and graphics subsystems. It
> consists of a scatterlist with memory pages and DMA addresses (sgl entry),
> as well as the number of scatterlist entries: CPU pages (orig_nents entry)
> and DMA mapped pages (nents entry).
>
> It turned out that it was a common mistake to misuse nents and orig_nents
> entries, calling DMA-mapping functions with a wrong number of entries or
> ignoring the number of mapped entries returned by the dma_map_sg()
> function.
>
> To avoid such issues, lets use a common dma-mapping wrappers operating
> directly on the struct sg_table objects and use scatterlist page
> iterators where possible. This, almost always, hides references to the
> nents and orig_nents entries, making the code robust, easier to follow
> and copy/paste safe.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Eric Anholt <eric@anholt.net>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
