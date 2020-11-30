Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E01AD2C8D88
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 19:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C303E89BF1;
	Mon, 30 Nov 2020 18:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4803189BF1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 18:59:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F0F345D;
 Mon, 30 Nov 2020 19:59:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606762787;
 bh=EzfSClH5SgPv4zlei6VSCHhfVk//M6lq9WBgxFsM2vY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oj3uVSc4aZFFSE1hGKm/5FGS+y5uA8XVFH7jGEqseaE4+bpG7z0um9izgBFrqBum7
 aJh21GgVN1TVIkl6ZncN0OrAiR3gzka6Wa6NwFIdWmzffZ0aAP22tI2zuan+VQOsRX
 2x1m+obfV5+XUd8R+7BqBRrgem0CxNfLT5KjHcLc=
Date: Mon, 30 Nov 2020 20:59:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 1/6] drm: bridge: Propagate the bus flags from
 bridge->timings
Message-ID: <20201130185939.GD4141@pendragon.ideasonboard.com>
References: <20201119160134.9244-1-nikhil.nd@ti.com>
 <20201119160134.9244-2-nikhil.nd@ti.com>
 <20201130093600.GB4141@pendragon.ideasonboard.com>
 <39d7cf1d-d25b-abc6-a6c6-5d1d18a6b3ff@ti.com>
 <20201130094753.GF4141@pendragon.ideasonboard.com>
 <86a8d1a6-3464-245b-a08a-ad212ab0ae53@ti.com>
 <e8ca17ee-5a62-3944-825e-7066646c1db1@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8ca17ee-5a62-3944-825e-7066646c1db1@ti.com>
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
Cc: Yuti Amonkar <yamonkar@cadence.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Mon, Nov 30, 2020 at 12:04:27PM +0200, Tomi Valkeinen wrote:
> On 30/11/2020 12:02, Tomi Valkeinen wrote:
> > On 30/11/2020 11:47, Laurent Pinchart wrote:
> > 
> >>>> Hasn't Boris commented in his review of v1 that bus flags should be set
> >>>> in atomic_check, even when they're static ? We're moving towards
> >>>> removing timings->input_bus_flags, so this patch goes in the wrong
> >>>> direction :-S
> >>>
> >>> We have atomic_check only if the bridge has implemented atomic funcs. And even if there's
> >>> atomic_check, not all bridges set the bus_flags there. So we need to either 1) fix the issue for now
> >>> as in this patch, or 2) convert all bridges to use atomic funcs and fix all the bridges to set the
> >>> bus_flags.
> >>
> >> The second option is what we'd like to achieve. Wouldn't it be best to
> >> already start going in that direction ? We don't need to convert all
> >> bridge drivers in one go here, just the ones that are used by tidss.
> > 
> > I think that sounds fine, except that this is blocking the DisplayPort support for J7. We have
> > everything in for DP except dts changes (can be added only when the drivers work), and the connector
> > stuff.
> > 
> > The connector stuff includes this series (so that tidss supports the new connector model), and
> > "[PATCH RESEND v3 0/2] drm: add DisplayPort connector", which adds the connector driver.
> > 
> > The bridges currently used (that I know of) with tidss are cdns-mhdp, tfp410 and sii9022. I don't
> > expect converting those would be a huge job, but I'd still really like to get the DP working in
> > upstream without starting to expand the scope of the patches we need to enable it.
> > 
> > That said, we missed 5.11 so perhaps we have the time.

If there's not enough time to address the bridges, I'm fine with this
series assuming the bridge changes will go on top. If we have enough
time, let's go for it :-)

> Looks like Boris was missing from Cc in this series. Adding him.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
