Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E16571C51D4
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 11:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E290C6E598;
	Tue,  5 May 2020 09:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0959F6E598
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 09:24:49 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id j16so1219459oih.10
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 02:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fA6tjdmApvG0BpsjkTdWv9/ZTQZ9vjPp82obp9l863E=;
 b=RO/0AAxEbUcayLZiB6Hq+ZYArgbwZUhhlP2KYVrXQ6hqjLZwwukLhWBu1EfktbQg+w
 +FFFBSo6XxM/GLSXnZ4KWO8RTNQIPKJ9v1QhNfovuN4BARxT9DF2xYeYxXyrHx8kCwER
 ARZzNIUyY/79JY2jD4VRvxZYmFgg/T8M6Y0E/X4PXnzOMlw88P28nN/RTcXPiHHNjjJP
 MX8vr+qz80p2/BHaO+YDEwt/zo6dBllzsBlRqVY/plNTaLC1L0NtPA2vOnXiuujBAbs6
 KnFH6QHz2po9i4CnNYndRFgPCGJkZ30x1Q3hn9az5MmgNLsNm8qiQb34Z0nAhR8n0a+C
 Rwug==
X-Gm-Message-State: AGi0PuYxWeU7IGpOZyLr7KirI6SPLn/mXUd4gDM8Ks9VUbor+OZ9a3eI
 8NshKAEAfTVvMv8w4q2tjBDOuJ7WyXymc7Bvnvk=
X-Google-Smtp-Source: APiQypKOjAo7caYTLLrvaP2LfYH11Xj01QYaa+uBtqm/9mZJ41Mdkz0F6pXJ47B38HgwsYDHPLvoSnLN/Mh8S4elUzU=
X-Received: by 2002:aca:f541:: with SMTP id t62mr1674694oih.148.1588670688206; 
 Tue, 05 May 2020 02:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <CGME20200505084634eucas1p1e0ea160dd77afbf6d2f7e6154ded40d0@eucas1p1.samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <20200505084614.30424-18-m.szyprowski@samsung.com>
In-Reply-To: <20200505084614.30424-18-m.szyprowski@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 May 2020 11:24:37 +0200
Message-ID: <CAMuHMdVisnijasoxazj+6kUFM3UrTYkVo6kC1dxZv5zK0yD7TQ@mail.gmail.com>
Subject: Re: [PATCH v3 18/25] drm: rcar-du: fix common struct sg_table related
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Linux IOMMU <iommu@lists.linux-foundation.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Tue, May 5, 2020 at 10:48 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
> numer of the created entries in the DMA address space. However the
> subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
> called with the original number of the entries passed to dma_map_sg. The
> sg_table->nents in turn holds the result of the dma_map_sg call as stated
> in include/linux/scatterlist.h. A common mistake was to ignore a result
> of the dma_map_sg function and don't use the sg_table->orig_nents at all.
>
> To avoid such issues, lets use common dma-mapping wrappers operating
> directly on the struct sg_table objects and adjust references to the
> nents and orig_nents respectively.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> For more information, see '[PATCH v3 00/25] DRM: fix struct sg_table nents
> vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/5/187

For the modern lore-users:
https://lore.kernel.org/r/20200505083926.28503-1-m.szyprowski@samsung.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
