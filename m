Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6FB29D05C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 15:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37E889F43;
	Wed, 28 Oct 2020 14:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D497689F43
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 14:35:00 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09SEYtTP128248;
 Wed, 28 Oct 2020 09:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1603895695;
 bh=udF+8WNR8oZDVx8ihUGOQ0l8OsTyx9I/bJKKl1XEYtE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=yEW9LemaflDLjsmzeCXWnOHnksItVZRmc+Uiji7sf9stz/ZSqNbXMk2Mh51KEJw1c
 a7McR0RATB+7DXtBIiohwBtmh0uBVywVb5HaHkHLqbJfEhRTrRHU1JAbuC19PNNjIX
 C/Z9TT8oCsA+4CpwKUvicX5xDphvxpZ7ckRQRwTM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09SEYtv2096309
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 28 Oct 2020 09:34:55 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 28
 Oct 2020 09:34:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 28 Oct 2020 09:34:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09SEYr1n069255;
 Wed, 28 Oct 2020 09:34:54 -0500
Date: Wed, 28 Oct 2020 20:04:53 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 3/5] drm: bridge: Propagate the bus flags from
 bridge->timings
Message-ID: <20201028143453.njt3lak542wwx6jb@NiksLab>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <20201016103917.26838-4-nikhil.nd@ti.com>
 <fd65aa92-bc89-2420-bbc1-e131db1f6c25@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd65aa92-bc89-2420-bbc1-e131db1f6c25@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14:31-20201021, Tomi Valkeinen wrote:
> On 16/10/2020 13:39, Nikhil Devshatwar wrote:
> > When the next bridge does not specify any bus flags, use the
> > bridge->timings->input_bus_flags as fallback when propagating
> > bus flags from next bridge to current bridge.
> > 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 64f0effb52ac..8353723323ab 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -975,6 +975,13 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
> >  	 * duplicate the "dummy propagation" logic.
> >  	 */
> >  	bridge_state->input_bus_cfg.flags = output_flags;
> > +
> > +	/*
> > +	 * Use the bridge->timings->input_bus_flags as fallback if the next bridge
> > +	 * does not specify the flags
> > +	 */
> > +	if (!bridge_state->input_bus_cfg.flags)
> > +		bridge_state->input_bus_cfg.flags = bridge->timings->input_bus_flags;
> 
> According to docs, timings can be NULL.
> 
> And, hmm... It's too easy to get confused with these, but... If the bridge defines timings, and
> timings->input_bus_flags != 0, should we always pick that, even if we got something via
> output_flags? Logic being, if this bridge defines timings->input_bus_flags, it probably wants that
> to be used regardless whether we got something from the next bridge.

Got it, the flags from timings if present should be prioritized rather
than treating them as fallback.

Nikhil D

> 
>  Tomi
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
