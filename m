Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1872786BC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 14:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3B76ECAE;
	Fri, 25 Sep 2020 12:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F286ECAE
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 12:12:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 050D72D7;
 Fri, 25 Sep 2020 14:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1601035927;
 bh=mo11rEg2eQFnoWXSP+QBfFAd9AXFpZDesn5yHp9T5cs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DDiFPXHvlIUo+cNG9s+hIX0Qt0fpKfY7f/+l9pZaRYwb5HnvLkMuki6tYDbj+LO95
 eL9Z2XO/XQnlGPosoYy+Jz141vghDdcPKhyUxr6JoJ3t9Conzm4lJG0bMXfMH4IVPC
 FTIxZayntDHtYZ8UZ2gm/vgy0mwZoRx4/D8RaDoU=
Date: Fri, 25 Sep 2020 15:11:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: fix compile warning
Message-ID: <20200925121133.GD3933@pendragon.ideasonboard.com>
References: <20200923083057.113367-1-tomi.valkeinen@ti.com>
 <20200924114810.GB3968@pendragon.ideasonboard.com>
 <01359a54-964f-c748-442e-eeab30f08e56@ti.com>
 <20200925120018.GC3933@pendragon.ideasonboard.com>
 <0abebdad-45fb-9862-b031-e1c9107ba820@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0abebdad-45fb-9862-b031-e1c9107ba820@ti.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Yuti Amonkar <yamonkar@cadence.com>, dri-devel@lists.freedesktop.org,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 25, 2020 at 03:05:52PM +0300, Tomi Valkeinen wrote:
> On 25/09/2020 15:00, Laurent Pinchart wrote:
> > On Fri, Sep 25, 2020 at 10:36:44AM +0300, Tomi Valkeinen wrote:
> >> On 24/09/2020 14:48, Laurent Pinchart wrote:
> >>> Hi Tomi,
> >>>
> >>> Thank you for the patch.
> >>>
> >>> On Wed, Sep 23, 2020 at 11:30:57AM +0300, Tomi Valkeinen wrote:
> >>>> On x64 we get:
> >>>>
> >>>> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:751:10: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551613' to '4294967293' [-Woverflow]
> >>>>
> >>>> The registers are 32 bit, so fix by casting to u32.
> >>>
> >>> I wonder if we need a BIT32 macro... This is a common issue, it would be
> >>> nice to handle it in the macros that define register fields.
> >>
> >> That's probably a good idea. I think
> >>
> >> #define BIT32(nr) (1u << (nr))
> >>
> >> should work correct on all archs. Although I'm not quite sure if nr should be cast to u32, but in my
> >> tests a u64 nr doesn't cause type promotion to u64.
> > 
> > I don't think we need to support nr values larger than 2^32-1 ;-)
> 
> That's true, but we might have:
> 
> u64 nr = 1;
> BIT32(nr)
> 
> Afaics, we don't need to cast nr to u32, but maybe that's still the safe thing to do.
> 
> >> Anyway, I'd like to merge this fix as it is to get rid of the warning for the merge window.
> > 
> > Sounds good to me.
> 
> Was that a reviewed-by? =)

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
