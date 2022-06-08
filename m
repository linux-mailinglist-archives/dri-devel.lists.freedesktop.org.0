Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80532542789
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F1D10E1C9;
	Wed,  8 Jun 2022 07:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946BB10E124
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 07:08:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73E6480A;
 Wed,  8 Jun 2022 09:08:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1654672125;
 bh=iYqkLmv/t3PUIjg6ZpZgts1wvyz/0BVaHNALwRAdXBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TE+jXYIFdaNlUNcylQzO5o+r6cIoxuQGwiJHoPWVijA/+aGOplvXmAgmO6gFXiTEC
 XnGZ3P8ZZwn5AOGrkTtYALn65a65MFgksjsX0D2RILXLvA+n7VHSeAE9kkIXAFSc3/
 B0vrxPUfGD3m1MKQFVhsO75jTWjUTRxB5ur44G20=
Date: Wed, 8 Jun 2022 10:08:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH] drm: shmobile: Use backlight helper
Message-ID: <YqBK+GXrIx3XX+Km@pendragon.ideasonboard.com>
References: <20220607183132.1123648-1-steve@sk2.org>
 <20220607230537.70020736@heffalump.sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220607230537.70020736@heffalump.sk2.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On Tue, Jun 07, 2022 at 11:05:37PM +0200, Stephen Kitt wrote:
> On Tue,  7 Jun 2022 20:31:32 +0200, Stephen Kitt <steve@sk2.org> wrote:
> > backlight_properties.fb_blank is deprecated. The states it represents
> > are handled by other properties; but instead of accessing those
> > properties directly, drivers should use the helpers provided by
> > backlight.h.
> 
> Apologies for the misleading boilerplate, this patch came about as a result
> of cleaning up fb_blank usage but doesn't involve fb_blank itself.

No worries. Would you like to submit a v2 with a better commit message ?
The patch otherwise looks good to me.

> > Instead of retrieving the backlight brightness in struct
> > backlight_properties manually, and then checking whether the backlight
> > should be on at all, use backlight_get_brightness() which does all
> > this and insulates this from future changes.
> > 
> > Signed-off-by: Stephen Kitt <steve@sk2.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/shmobile/shmob_drm_backlight.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
> > b/drivers/gpu/drm/shmobile/shmob_drm_backlight.c index
> > f6628a5ee95f..794573badfe8 100644 ---
> > a/drivers/gpu/drm/shmobile/shmob_drm_backlight.c +++
> > b/drivers/gpu/drm/shmobile/shmob_drm_backlight.c @@ -18,11 +18,7 @@ static
> > int shmob_drm_backlight_update(struct backlight_device *bdev) struct
> > shmob_drm_connector *scon = bl_get_data(bdev); struct shmob_drm_device
> > *sdev = scon->connector.dev->dev_private; const struct
> > shmob_drm_backlight_data *bdata = &sdev->pdata->backlight;
> > -	int brightness = bdev->props.brightness;
> > -
> > -	if (bdev->props.power != FB_BLANK_UNBLANK ||
> > -	    bdev->props.state & BL_CORE_SUSPENDED)
> > -		brightness = 0;
> > +	int brightness = backlight_get_brightness(bdev);
> >  
> >  	return bdata->set_brightness(brightness);
> >  }
> > 
> > base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56

-- 
Regards,

Laurent Pinchart
