Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D212C8154
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 10:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6081A6E43B;
	Mon, 30 Nov 2020 09:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EF66E43B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 09:48:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3525F97E;
 Mon, 30 Nov 2020 10:48:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606729683;
 bh=1ZydP++VDdn78Rnm2NotPnoRuqUEwU9aCSgUU+dEHoM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MvSPQk6LFn7s6vfMAENpV9Sy8yMjU52HFG6YXMjD0A5BpUt63Bio3nZRcCfl3xGW2
 sQ9NGKiLEJ/WH9OjUwOR6zxKJYUKdc/BtYo11XLV+Z+4s31uUOL0MRfOfRwzHnvmHH
 tnTpXsP9B+8EMkttu0Pt+C/TCkUDXLS+uB14a6ak=
Date: Mon, 30 Nov 2020 11:47:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 1/6] drm: bridge: Propagate the bus flags from
 bridge->timings
Message-ID: <20201130094753.GF4141@pendragon.ideasonboard.com>
References: <20201119160134.9244-1-nikhil.nd@ti.com>
 <20201119160134.9244-2-nikhil.nd@ti.com>
 <20201130093600.GB4141@pendragon.ideasonboard.com>
 <39d7cf1d-d25b-abc6-a6c6-5d1d18a6b3ff@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39d7cf1d-d25b-abc6-a6c6-5d1d18a6b3ff@ti.com>
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
 Nikhil Devshatwar <nikhil.nd@ti.com>, dri-devel@lists.freedesktop.org,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Mon, Nov 30, 2020 at 11:46:31AM +0200, Tomi Valkeinen wrote:
> On 30/11/2020 11:36, Laurent Pinchart wrote:
> > On Thu, Nov 19, 2020 at 09:31:29PM +0530, Nikhil Devshatwar wrote:
> >> bus_flags can be specified by a bridge in the timings.
> >> If the bridge provides it, Override the bus_flags when propagating
> >> from next bridge.
> >>
> >> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> >> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> >> ---
> >>
> >> Notes:
> >>     changes from v2:
> >>     * update comment
> >>     changes from v1:
> >>     * Check for timings
> >>     * Prioritize timings flags over next bridge's flags
> >>
> >>  drivers/gpu/drm/drm_bridge.c | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> >> index 64f0effb52ac..13b67fc0dad3 100644
> >> --- a/drivers/gpu/drm/drm_bridge.c
> >> +++ b/drivers/gpu/drm/drm_bridge.c
> >> @@ -975,6 +975,14 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
> >>  	 * duplicate the "dummy propagation" logic.
> >>  	 */
> >>  	bridge_state->input_bus_cfg.flags = output_flags;
> >> +
> >> +	/*
> >> +	 * If legacy bus flags are provided in bridge->timings, use those as
> >> +	 * input flags instead of propagating the output flags.
> >> +	 */
> >> +	if (bridge->timings && bridge->timings->input_bus_flags)
> >> +		bridge_state->input_bus_cfg.flags =
> >> +			bridge->timings->input_bus_flags;
> > 
> > Hasn't Boris commented in his review of v1 that bus flags should be set
> > in atomic_check, even when they're static ? We're moving towards
> > removing timings->input_bus_flags, so this patch goes in the wrong
> > direction :-S
> 
> We have atomic_check only if the bridge has implemented atomic funcs. And even if there's
> atomic_check, not all bridges set the bus_flags there. So we need to either 1) fix the issue for now
> as in this patch, or 2) convert all bridges to use atomic funcs and fix all the bridges to set the
> bus_flags.

The second option is what we'd like to achieve. Wouldn't it be best to
already start going in that direction ? We don't need to convert all
bridge drivers in one go here, just the ones that are used by tidss.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
