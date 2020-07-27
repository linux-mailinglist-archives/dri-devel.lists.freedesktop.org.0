Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB2522F7CD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 20:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A97B89F73;
	Mon, 27 Jul 2020 18:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B18A89F73
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 18:36:07 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 37DDA804D9;
 Mon, 27 Jul 2020 20:36:05 +0200 (CEST)
Date: Mon, 27 Jul 2020 20:36:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/dbi: Fix SPI Type 1 (9-bit) transfer
Message-ID: <20200727183603.GA990653@ravnborg.org>
References: <20200703141341.1266263-1-paul@crapouillou.net>
 <20200703142357.GA25632@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703142357.GA25632@ravnborg.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=ER_8r6IbAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=oXz7tZ0fv4TT8z_ucKcA:9 a=CjuIK1q_8ugA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=9LHmKk7ezEChjTCyhBa9:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul.

On Fri, Jul 03, 2020 at 04:23:57PM +0200, Sam Ravnborg wrote:
> On Fri, Jul 03, 2020 at 04:13:41PM +0200, Paul Cercueil wrote:
> > The function mipi_dbi_spi1_transfer() will transfer its payload as 9-bit
> > data, the 9th (MSB) bit being the data/command bit. In order to do that,
> > it unpacks the 8-bit values into 16-bit values, then sets the 9th bit if
> > the byte corresponds to data, clears it otherwise. The 7 MSB are
> > padding. The array of now 16-bit values is then passed to the SPI core
> > for transfer.
> > 
> > This function was broken since its introduction, as the length of the
> > SPI transfer was set to the payload size before its conversion, but the
> > payload doubled in size due to the 8-bit -> 16-bit conversion.
> > 
> > Fixes: 02dd95fe3169 ("drm/tinydrm: Add MIPI DBI support")
> > Cc: <stable@vger.kernel.org> # 4.10
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> As discussed on irc this looks correct to me too.
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> 
> I will apply later, but let's wait and see if Noralf or others
> have any feedback first.
I finally went back to this patch, I missed it yesterday.
Applied to drm-misc-fixes with a stable 5.4+ tag.

	Sam

> > ---
> >  drivers/gpu/drm/drm_mipi_dbi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> > index bb27c82757f1..bf7888ad9ad4 100644
> > --- a/drivers/gpu/drm/drm_mipi_dbi.c
> > +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> > @@ -923,7 +923,7 @@ static int mipi_dbi_spi1_transfer(struct mipi_dbi *dbi, int dc,
> >  			}
> >  		}
> >  
> > -		tr.len = chunk;
> > +		tr.len = chunk * 2;
> >  		len -= chunk;
> >  
> >  		ret = spi_sync(spi, &m);
> > -- 
> > 2.27.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
