Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F55724E6F5
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 12:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161FA6E073;
	Sat, 22 Aug 2020 10:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041BB6E073
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 10:49:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C84E329E;
 Sat, 22 Aug 2020 12:49:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1598093351;
 bh=6ZFChGwd762tCp/370F4TKuD3RwxOvJ1DZ6OuHN5zuE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=itHGOg+ZIvnoNWi+pGYY56X7MbWkLwzzVhseWqf3t6LdEpx0eM0qu9Jwnx1mYU0LA
 inxtDv8xCDX5FDPhV299gaj36blqWuqmApICGtJHTi6PcK+Pcqg05ap06jxodZY3WJ
 RWte8cGrZs4xZQcPxiSDaIOA9a2tzD2ic4DSQcLI=
Date: Sat, 22 Aug 2020 13:48:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/omap: Fix runtime PM imbalance in dsi_runtime_get
Message-ID: <20200822104852.GA5966@pendragon.ideasonboard.com>
References: <20200821074506.32359-1-dinghao.liu@zju.edu.cn>
 <5123d7ae-f491-d2d2-788d-b5250ae9e31d@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5123d7ae-f491-d2d2-788d-b5250ae9e31d@ti.com>
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
Cc: Dinghao Liu <dinghao.liu@zju.edu.cn>, David Airlie <airlied@linux.ie>,
 kjlu@umn.edu, Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Fri, Aug 21, 2020 at 03:06:59PM +0300, Tomi Valkeinen wrote:
> On 21/08/2020 10:45, Dinghao Liu wrote:
> > pm_runtime_get_sync() increments the runtime PM usage counter
> > even when it returns an error code. However, users of
> > dsi_runtime_get(), a direct wrapper of pm_runtime_get_sync(),
> > assume that PM usage counter will not change on error. Thus a
> > pairing decrement is needed on the error handling path to keep
> > the counter balanced.
> > 
> > Fixes: 4fbafaf371be7 ("OMAP: DSS2: Use PM runtime & HWMOD support")
> > Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> > ---
> >  drivers/gpu/drm/omapdrm/dss/dsi.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> > index eeccf40bae41..973bfa14a104 100644
> > --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> > +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> > @@ -1112,8 +1112,11 @@ static int dsi_runtime_get(struct dsi_data *dsi)
> >  	DSSDBG("dsi_runtime_get\n");
> >  
> >  	r = pm_runtime_get_sync(dsi->dev);
> > -	WARN_ON(r < 0);
> > -	return r < 0 ? r : 0;
> > +	if (WARN_ON(r < 0)) {
> > +		pm_runtime_put_noidle(dsi->dev);
> > +		return r;
> > +	}
> > +	return 0;
> >  }
> 
> Thanks! Good catch. I think this is broken in all the other modules in omapdrm too (e.g. dispc.c,
> venc.c, etc).
> 
> Would you like to update the patch to cover the whole omapdrm?

Just for yoru information, there has been quite a few similar patches
submitted all across the kernel. I believe this is an issue of the
pm_runtime_get_sync() API, which really shouldn't require a put() when
it fails. For drivers that really don't expect pm_runtime_get_sync() to
fail (no I2C access to a regulator for instance, only SoC-internal
operations) I've instead decided to ignore the error completely. I don't
think poluting the whole kernel code base with this kind of "fixes" is a
good idea.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
