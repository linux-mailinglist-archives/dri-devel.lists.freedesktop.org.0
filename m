Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12A0278686
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 14:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FED6ECAB;
	Fri, 25 Sep 2020 12:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48C16ECAB
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 12:01:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87A472D7;
 Fri, 25 Sep 2020 14:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1601035252;
 bh=/66WXA2v5Bh+rbipAKDQwvrcBrXCVAjVdapUnZeAXxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dNp6q90GX97UuIiim/MIPi4qs58GG3Wd/YY6HSOj95tQRagh1romJfs285jZntFg5
 ieajwB4amG11oucO3EjvRJFeVN9jH9OiX3ngks3H6KEsguRwNw1uvzKdXxgpj7Xv+l
 CqxO8GcumyXWyjm5y/JZkrZkKSrY50l5O6RXZKec=
Date: Fri, 25 Sep 2020 15:00:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: fix compile warning
Message-ID: <20200925120018.GC3933@pendragon.ideasonboard.com>
References: <20200923083057.113367-1-tomi.valkeinen@ti.com>
 <20200924114810.GB3968@pendragon.ideasonboard.com>
 <01359a54-964f-c748-442e-eeab30f08e56@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01359a54-964f-c748-442e-eeab30f08e56@ti.com>
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

On Fri, Sep 25, 2020 at 10:36:44AM +0300, Tomi Valkeinen wrote:
> On 24/09/2020 14:48, Laurent Pinchart wrote:
> > Hi Tomi,
> > 
> > Thank you for the patch.
> > 
> > On Wed, Sep 23, 2020 at 11:30:57AM +0300, Tomi Valkeinen wrote:
> >> On x64 we get:
> >>
> >> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:751:10: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551613' to '4294967293' [-Woverflow]
> >>
> >> The registers are 32 bit, so fix by casting to u32.
> > 
> > I wonder if we need a BIT32 macro... This is a common issue, it would be
> > nice to handle it in the macros that define register fields.
> 
> That's probably a good idea. I think
> 
> #define BIT32(nr) (1u << (nr))
> 
> should work correct on all archs. Although I'm not quite sure if nr should be cast to u32, but in my
> tests a u64 nr doesn't cause type promotion to u64.

I don't think we need to support nr values larger than 2^32-1 ;-)

> Anyway, I'd like to merge this fix as it is to get rid of the warning for the merge window.

Sounds good to me.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
