Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A255B1EC5B3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 01:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F09E6E1B4;
	Tue,  2 Jun 2020 23:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD79E6E1B4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 23:28:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9A4F2A4;
 Wed,  3 Jun 2020 01:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591140535;
 bh=lXkvj1T0Wpo9a3y6ncv9G8LcEGUh4n2+D7BDgxV7xmQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O+jYNNIuc7Edhz9qSOLPWtjOOspHJR6sOJ1VTxt8mWv7PTUD4KHv7Bi52BjyGkW/r
 SPcKr1108TkGVpYbGcMD7VIXIU62iM61DoNwRVoD/AdEqW+0hQ9RoWYbslQsQwt1yr
 +GtD4Yiq4fY+j0DmdUIkbriof9U9ZSvbUBZh1Hwg=
Date: Wed, 3 Jun 2020 02:28:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 1/7] drm/rockchip: prepare common code for cdns and rk
 dpi/dp driver
Message-ID: <20200602232840.GP6547@pendragon.ideasonboard.com>
References: <cover.1590982881.git.Sandor.yu@nxp.com>
 <d3d707cf37e7928a839071242c752779061cc094.1590982881.git.Sandor.yu@nxp.com>
 <CACvgo52NeUSQV5p8+4DkCjpkv12cs8fCkQqy4MFn8pVaorVaHg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo52NeUSQV5p8+4DkCjpkv12cs8fCkQqy4MFn8pVaorVaHg@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 sandor.yu@nxp.com, Neil Armstrong <narmstrong@baylibre.com>,
 Sandy Huang <hjc@rock-chips.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-rockchip <linux-rockchip@lists.infradead.org>, dkos@cadence.com,
 LAKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 02, 2020 at 02:55:52PM +0100, Emil Velikov wrote:
> On Mon, 1 Jun 2020 at 07:29, <sandor.yu@nxp.com> wrote:
> >
> > From: Sandor Yu <Sandor.yu@nxp.com>
> >
> > - Extracted common fields from cdn_dp_device to a new cdns_mhdp_device
> >   structure which will be used by two separate drivers later on.
> > - Moved some datatypes (audio_format, audio_info, vic_pxl_encoding_format,
> >   video_info) from cdn-dp-core.c to cdn-dp-reg.h.
> > - Changed prefixes from cdn_dp to cdns_mhdp
> >     cdn -> cdns to match the other Cadence's drivers
> >     dp -> mhdp to distinguish it from a "just a DP" as the IP underneath
> >       this registers map can be a HDMI (which is internally different,
> >       but the interface for commands, events is pretty much the same).
> > - Modified cdn-dp-core.c to use the new driver structure and new function
> >   names.
> > - writel and readl are replaced by cdns_mhdp_bus_write and
> >   cdns_mhdp_bus_read.
> >
> The high-level idea is great - split, refactor and reuse the existing drivers.
> 
> Although looking at the patches themselves - they seems to be doing
> multiple things at once.
> As indicated by the extensive list in the commit log.
> 
> I would suggest splitting those up a bit, roughly in line of the
> itemisation as per the commit message.
> 
> Here is one hand wavy way to chunk this patch:
>  1) use put_unalligned*
>  2) 'use local variable dev' style of changes (as seem in cdn_dp_clk_enable)
>  3) add writel/readl wrappers
>  4) hookup struct cdns_mhdp_device, keep dp->mhdp detail internal.
> The cdn-dp-reg.h function names/signatures will stay the same.
>  5) finalize the helpers - use mhdp directly, rename

I second this, otherwise review is very hard.

> Examples:
> 4)
>  static int cdn_dp_mailbox_read(struct cdn_dp_device *dp)
>  {
> +"  struct cdns_mhdp_device *mhdp = dp->mhdp;
>    int val, ret;
> 
> -  ret = readx_poll_timeout(readl, dp->regs + MAILBOX_EMPTY_ADDR,
> +  ret = readx_poll_timeout(readl, mhdp->regs_base + MAILBOX_EMPTY_ADDR,
> ...
>    return fancy_readl(dp, MAILBOX0_RD_DATA) & 0xff;
>  }
> 
> 5)
> -static int cdn_dp_mailbox_read(struct cdn_dp_device *dp)
> +static int mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
>  {
> -  struct cdns_mhdp_device *mhdp = dp->mhdp;
>    int val, ret;
> ...
> -  return fancy_readl(dp, MAILBOX0_RD_DATA) & 0xff;
> +  return cdns_mhdp_bus_read(mhdp, MAILBOX0_RD_DATA) & 0xff;
>  }

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
