Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4528133561
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 23:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BD56E141;
	Tue,  7 Jan 2020 22:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637706E141
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 22:00:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D8E152F;
 Tue,  7 Jan 2020 23:00:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1578434431;
 bh=4rS/DzJoC9Up5wTZWqf2LP3WkrbP09g2YoVYgICXsqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ep9L46KuB1PfRgMEZWiYAkvy5r9Mwi64ugX+k46uy60Kqy9KJRCUABNrPiRReTLQf
 ZPRBe2LFiSmYXD2J745DCv8glAt8sI1irYVERQQRJ8rTJJ0hLcSDm9y8ElvyBnr5zi
 OLXStA3GVB8Qydp+aOzS0tuIj/PIAZ+BKOwtiWsc=
Date: Wed, 8 Jan 2020 00:00:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm: panel: fix excessive stack usage in
 td028ttec1_prepare
Message-ID: <20200107220019.GC7869@pendragon.ideasonboard.com>
References: <20200107212747.4182515-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107212747.4182515-1-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

Thank you for the patch.

On Tue, Jan 07, 2020 at 10:27:33PM +0100, Arnd Bergmann wrote:
> With gcc -O3, the compiler can inline very aggressively,
> leading to rather large stack usage:
> 
> drivers/gpu/drm/panel/panel-tpo-td028ttec1.c: In function 'td028ttec1_prepare':
> drivers/gpu/drm/panel/panel-tpo-td028ttec1.c:233:1: error: the frame size of 2768 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>  }
> 
> Marking jbt_reg_write_1() as noinline avoids the case where
> multiple instances of this function get inlined into the same
> stack frame and each one adds a copy of 'tx_buf'.
> 
> Fixes: mmtom ("init/Kconfig: enable -O3 for all arches")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Isn't this something that should be fixed at the compiler level ?

> ---
>  drivers/gpu/drm/panel/panel-tpo-td028ttec1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> index cf29405a2dbe..17ee5e87141f 100644
> --- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> +++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> @@ -105,7 +105,7 @@ static int jbt_ret_write_0(struct td028ttec1_panel *lcd, u8 reg, int *err)
>  	return ret;
>  }
>  
> -static int jbt_reg_write_1(struct td028ttec1_panel *lcd,
> +static int noinline_for_stack jbt_reg_write_1(struct td028ttec1_panel *lcd,
>  			   u8 reg, u8 data, int *err)
>  {
>  	struct spi_device *spi = lcd->spi;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
