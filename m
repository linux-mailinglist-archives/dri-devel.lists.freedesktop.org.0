Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8951D2D406C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 11:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED976E9E2;
	Wed,  9 Dec 2020 10:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84B06E9E2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 10:58:47 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kmxBF-0000OM-V4; Wed, 09 Dec 2020 11:58:45 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kmxBE-0006Xn-IH; Wed, 09 Dec 2020 11:58:44 +0100
Message-ID: <86e710fc042b883292d8c433c65474afed0be940.camel@pengutronix.de>
Subject: Re: [PATCH v4 01/19] drm/encoder: make encoder control functions
 optional
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Sam Ravnborg <sam@ravnborg.org>
Date: Wed, 09 Dec 2020 11:58:44 +0100
In-Reply-To: <20201208184836.GA165851@ravnborg.org>
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
 <20201208155451.8421-2-p.zabel@pengutronix.de>
 <20201208184836.GA165851@ravnborg.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Tue, 2020-12-08 at 19:48 +0100, Sam Ravnborg wrote:
> Hi Philipp,
> On Tue, Dec 08, 2020 at 04:54:33PM +0100, Philipp Zabel wrote:
> > Simple managed encoders do not require the .destroy callback,
> > make the whole funcs structure optional.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > New in v4.
> > ---
> >  drivers/gpu/drm/drm_encoder.c     | 4 ++--
> >  drivers/gpu/drm/drm_mode_config.c | 5 +++--
> >  include/drm/drm_encoder.h         | 2 +-
> >  3 files changed, 6 insertions(+), 5 deletions(-)
> > 
[...]
> > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > index f1affc1bb679..87e144155456 100644
> > --- a/drivers/gpu/drm/drm_mode_config.c
> > +++ b/drivers/gpu/drm/drm_mode_config.c
[...]
> > @@ -487,7 +487,8 @@ void drm_mode_config_cleanup(struct drm_device *dev)
> >  
> >  	list_for_each_entry_safe(encoder, enct, &dev->mode_config.encoder_list,
> >  				 head) {
> > -		encoder->funcs->destroy(encoder);
> > +		if (encoder->funcs)
> > +			encoder->funcs->destroy(encoder);
> 
> So late_register and early_unregister are both optional.
> But if encoder->funcs is set then the destroy callback is mandatory.

For encoders that are kept on the mode_config.encoder_list until
drm_mode_config_cleanup() is called, the destroy callback is still
mandatory.

Encoders allocated with drmm_encoder_alloc() on the other hand should
have the destroy callback set to NULL, if encoder->funcs is set.
These encoders are removed from the mode_config.encoder_list by the drmm
cleanup code, before drm_mode_config_cleanup is called.

> I am just wondering if this is intended.
> Reding the documnetation of drm_encoder_funcs thist matches the
> documentation but anyway..
>
> With this comment considered,
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thank you for bringing this up, should we just leave
drm_mode_config_cleanup() as-is?

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
