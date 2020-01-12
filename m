Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 705D713882E
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 21:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC9989FD3;
	Sun, 12 Jan 2020 20:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB6289FC8
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2020 20:19:34 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7666F80516;
 Sun, 12 Jan 2020 21:19:28 +0100 (CET)
Date: Sun, 12 Jan 2020 21:19:27 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] [v2] drm: panel: fix excessive stack usage in
 td028ttec1_prepare
Message-ID: <20200112201927.GA24849@ravnborg.org>
References: <20200108135116.3687988-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108135116.3687988-1-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=Akj0eHOMqQ7sJVUrYHYA:9 a=CjuIK1q_8ugA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=jd6J4Gguk5HxikPWLKER:22
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
Cc: Oleksandr Natalenko <oleksandr@redhat.com>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd.

On Wed, Jan 08, 2020 at 02:51:05PM +0100, Arnd Bergmann wrote:
> With gcc -O3 in combination with the structleak plug, the compiler can
> inline very aggressively, leading to rather large stack usage:
> 
> drivers/gpu/drm/panel/panel-tpo-td028ttec1.c: In function 'td028ttec1_prepare':
> drivers/gpu/drm/panel/panel-tpo-td028ttec1.c:233:1: error: the frame size of 2768 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>  }
> 
> Marking jbt_reg_write_*() as noinline avoids the case where
> multiple instances of this function get inlined into the same
> stack frame and each one adds a copy of 'tx_buf'.
> 
> The compiler is clearly making some bad decisions here, but I
> did not open a new bug report as this only happens in combination
> with the structleak plugin.
> 
> Link: https://lore.kernel.org/lkml/CAK8P3a3jAnFZA3GFRtdYdg1-i-oih3pOQzkkrK-X3BGsFrMiZQ@mail.gmail.com/
> Fixes: mmtom ("init/Kconfig: enable -O3 for all arches")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2:
> - mark all three functions as noinlien
> - add code comment
> - add link to more detailed analysis

Thanks for the updated patch.
Applied to drm-misc-next.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-tpo-td028ttec1.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> index cf29405a2dbe..5034db8b55de 100644
> --- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> +++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> @@ -86,7 +86,12 @@ struct td028ttec1_panel {
>  
>  #define to_td028ttec1_device(p) container_of(p, struct td028ttec1_panel, panel)
>  
> -static int jbt_ret_write_0(struct td028ttec1_panel *lcd, u8 reg, int *err)
> +/*
> + * noinline_for_stack so we don't get multiple copies of tx_buf
> + * on the stack in case of gcc-plugin-structleak
> + */
> +static int noinline_for_stack
> +jbt_ret_write_0(struct td028ttec1_panel *lcd, u8 reg, int *err)
>  {
>  	struct spi_device *spi = lcd->spi;
>  	u16 tx_buf = JBT_COMMAND | reg;
> @@ -105,7 +110,8 @@ static int jbt_ret_write_0(struct td028ttec1_panel *lcd, u8 reg, int *err)
>  	return ret;
>  }
>  
> -static int jbt_reg_write_1(struct td028ttec1_panel *lcd,
> +static int noinline_for_stack
> +jbt_reg_write_1(struct td028ttec1_panel *lcd,
>  			   u8 reg, u8 data, int *err)
>  {
>  	struct spi_device *spi = lcd->spi;
> @@ -128,7 +134,8 @@ static int jbt_reg_write_1(struct td028ttec1_panel *lcd,
>  	return ret;
>  }
>  
> -static int jbt_reg_write_2(struct td028ttec1_panel *lcd,
> +static int noinline_for_stack
> +jbt_reg_write_2(struct td028ttec1_panel *lcd,
>  			   u8 reg, u16 data, int *err)
>  {
>  	struct spi_device *spi = lcd->spi;
> -- 
> 2.20.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
