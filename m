Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A493A196421
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 08:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82266EAB3;
	Sat, 28 Mar 2020 07:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FE06EAB3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 07:18:32 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 127DB20716;
 Sat, 28 Mar 2020 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585379910;
 bh=fopRQnzfuZZmkeKyFYK+9X+U66QuYhhnOGDinwvF0D0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zbkUekwSZrpAyJ+cqSsFaNK7G+QRKY3ESZtvptrtyX0IUtb2UiG5fWiXHB9bjOgEA
 R0ApSP9Rui4R8co+SrOXQMxxdiBtrwx8V8EJ2viXLCJE6zu2B7KrbHj2LJ3BB8o/06
 vvPzTbPm7pHKn0UhY8wZ20FdRhpCxarV8+nipG5M=
Date: Sat, 28 Mar 2020 08:18:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2] drm/prime: fix extracting of the DMA addresses from a
 scatterlist
Message-ID: <20200328071827.GA3648919@kroah.com>
References: <CGME20200327162330eucas1p1b0413e0e9887aa76d3048f86d2166dcd@eucas1p1.samsung.com>
 <20200327162126.29705-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200327162126.29705-1-m.szyprowski@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Shane Francis <bigbeeshane@gmail.com>,
 "Michael J . Ruhl" <michael.j.ruhl@intel.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 27, 2020 at 05:21:26PM +0100, Marek Szyprowski wrote:
> Scatterlist elements contains both pages and DMA addresses, but one
> should not assume 1:1 relation between them. The sg->length is the size
> of the physical memory chunk described by the sg->page, while
> sg_dma_len(sg) is the size of the DMA (IO virtual) chunk described by
> the sg_dma_address(sg).
> 
> The proper way of extracting both: pages and DMA addresses of the whole
> buffer described by a scatterlist it to iterate independently over the
> sg->pages/sg->length and sg_dma_address(sg)/sg_dma_len(sg) entries.
> 
> Fixes: 42e67b479eab ("drm/prime: use dma length macro when mapping sg")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/drm_prime.c | 37 +++++++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 12 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
