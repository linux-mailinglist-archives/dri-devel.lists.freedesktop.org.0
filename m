Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A80C21D31CC
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 15:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC5C6EB50;
	Thu, 14 May 2020 13:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E436EB50
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 13:51:41 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC1CD20760
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 13:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589464300;
 bh=U4WS7dpPUSnHoDDXd9I/RGkZKydgvH6uscT6wgd5yaA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=10yB1NOW59ZFLk88tVol6JSCXSW16g5KS52gy+76Le+Tx7PliiJwrDveF5QUp3aAc
 f61hKPaNOqkKM/2+UmfCiYuO4Jfs+HSy+dc4Gmiq0HieYQPdWNpKME8aLXz7MuovlT
 /hy6GRU1SUPCaSfNSwajP+sQsgP/LEet6da+KIJY=
Received: by mail-ot1-f49.google.com with SMTP id 63so2369766oto.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 06:51:40 -0700 (PDT)
X-Gm-Message-State: AOAM532dseqplfDLRNJQOgKKQiO9mDWizmtJwajtr3MKeC1YLSWxjl6P
 NHpcAY7TVzfCtgsagbQ/c2pDzlxZUPGibAdoCw==
X-Google-Smtp-Source: ABdhPJzQUESjwS7Ih36p4leA1o497JSOSd1+5C+3ygMzeFo3qlL7lPTUyx4LBbQ+Ukd+XPHe6ro8V61dxXyaOPE9BZM=
X-Received: by 2002:a9d:1441:: with SMTP id h59mr3620806oth.192.1589464299942; 
 Thu, 14 May 2020 06:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <CGME20200513133310eucas1p176c920345e7f05f670e26e330b358d7f@eucas1p1.samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <20200513133245.6408-19-m.szyprowski@samsung.com>
In-Reply-To: <20200513133245.6408-19-m.szyprowski@samsung.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 14 May 2020 08:51:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLwEB_YMzDDQ=nt0_Tq-BGGFEW64BagPN-FbDeOnLpYCA@mail.gmail.com>
Message-ID: <CAL_JsqLwEB_YMzDDQ=nt0_Tq-BGGFEW64BagPN-FbDeOnLpYCA@mail.gmail.com>
Subject: Re: [PATCH v5 19/38] drm: panfrost: fix common struct sg_table
 related issues
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 8:33 AM Marek Szyprowski
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
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
> For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
> vs. orig_nents misuse' thread:
> https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 4 ++--
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 7 +++----
>  2 files changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
