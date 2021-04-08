Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0230E35806C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 12:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0E66EA66;
	Thu,  8 Apr 2021 10:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1532D6EA65;
 Thu,  8 Apr 2021 10:17:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B02961168;
 Thu,  8 Apr 2021 10:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617877031;
 bh=ivICCofV+HelFF0TfxwG+thYyuD+sKqQrEHToDgsMAA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UNNx+EGN0stAmujBkpKG7B+a3LZ9QOfURYpggW8gdYq7xt5P1gLMLgwM1dC5MpZ1P
 X7O4uDbSKKlPnIU+8/Y6gRxg4fPUuzhIsu8w6Fwb8B4xVKXHz8CvWH4QrtvBFITSEV
 Sxnv93leCr2IDHcwq6kptb/L86gB1Q+cqPtKBLHQ//heoRdly7V3dD/x0CXRA503pn
 1M5OyO5KbAozxLmR9Dpq5Oefs1XuUJn5xBFlPTXTgFi1TPnK0/r/Y/ZRa7Exep2Gdn
 1zCmFnWIMn66t09SBdrHP7u2VGOwHIiutu2GPaNpPda2430uojqFF+YO6UXZrmbRAJ
 /5bajopeTFScQ==
Date: Thu, 8 Apr 2021 13:16:59 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/2] drivers: don't select DMA_CMA or CMA
Message-ID: <YG7YGxN83VxtKAeo@kernel.org>
References: <20210408100523.63356-1-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210408100523.63356-1-david@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Simek <michal.simek@xilinx.com>, linux-mm@kvack.org,
 Joel Stanley <joel@jms.id.au>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 12:05:21PM +0200, David Hildenbrand wrote:
> Trying to set CONFIG_CMA=y with CONFIG_DMA_CMA=n revealed that we have
> three drivers that select these options. Random drivers should not
> override user settings of such core knobs. Let's use "imply DMA_CMA"
> instead, such that user configuration and dependencies are respected.
> 
> v1 -> v2:
> - Fix DRM_CMA -> DMA_CMA
> 
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Peter Collingbourne <pcc@google.com>
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: etnaviv@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> 
> David Hildenbrand (2):
>   drivers/video/fbdev: don't select DMA_CMA
>   drivers/gpu/drm: don't select DMA_CMA or CMA from aspeed or etnaviv
> 
>  drivers/gpu/drm/aspeed/Kconfig  | 3 +--
>  drivers/gpu/drm/etnaviv/Kconfig | 3 +--
>  drivers/video/fbdev/Kconfig     | 2 +-
>  3 files changed, 3 insertions(+), 5 deletions(-)

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> -- 
> 2.30.2
> 

-- 
Sincerely yours,
Mike.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
