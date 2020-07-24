Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D741722C03B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 09:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59F06E934;
	Fri, 24 Jul 2020 07:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382F16E934
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 07:55:59 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jysYf-0002QE-8P; Fri, 24 Jul 2020 09:55:57 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jysYe-0000Ij-Te; Fri, 24 Jul 2020 09:55:56 +0200
Message-ID: <f7eaf407ea2ad7299eb33e42f450d785f083c412.camel@pengutronix.de>
Subject: Re: [PATCH] drm/simple_kms_helper: add drmm_simple_encoder_init()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Date: Fri, 24 Jul 2020 09:55:56 +0200
In-Reply-To: <c34458e7-5d97-99f4-c00d-b0bd873a0ece@suse.de>
References: <20200722132558.28289-1-p.zabel@pengutronix.de>
 <d17c7f37-e63e-b4a9-adde-c691f09a0075@suse.de>
 <40ff9fdfb62d93f30a803f8397ae0c0f61e8e51a.camel@pengutronix.de>
 <c34458e7-5d97-99f4-c00d-b0bd873a0ece@suse.de>
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
Cc: kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, 2020-07-24 at 09:17 +0200, Thomas Zimmermann wrote:
[...]
> > > > @@ -71,6 +72,47 @@ int drm_simple_encoder_init(struct drm_device *dev,
> > > >  }
> > > >  EXPORT_SYMBOL(drm_simple_encoder_init);
> > > >  
> > > > +static void drmm_encoder_cleanup(struct drm_device *dev, void *ptr)
> > > 
> > > It's the reset helper, so drmm_simple_encoder_reset() would be appropriate.
> > > 
> > > > +{
> > > > +	struct drm_encoder *encoder = ptr;
> > > > +
> > > > +	drm_encoder_cleanup(encoder);
> > > 
> > > This should first check for (encoder->dev) being true. If drivers
> > > somehow manage to clean-up the mode config first, we should detect it. I
> > > know it's a bug, but I wouldn't trust drivers with that.
> > 
> > I don't think this can happen, a previously called drm_encoder_cleanup()
> > would have removed the encoder from the drm_mode_config::encoder list.
> 
> It cannot legally happen, but AFAICS a careless driver could run
> drm_mode_config_cleanup() and release the encoder. This release callback
> would still run afterwards and it should warn about the error.

Alright, I'll add a

	if (WARN_ON(!encoder->dev))
		return;

then.

[...]
> > > The idiomatic way of cleaning up an encoder is via mode-config cleanup.
> > > This interface is an exception for a corner case. So there needs to be a
> > > paragraph that clearly explains the corner case. Please also discourage
> > > from using drmm_simple_encoder_init() if drm_simple_encoder_init() would
> > > work.
> > 
> > I was hoping that we would eventually switch to drmres cleanup as the
> > preferred method, thus getting rid of the need for per-driver cleanup in
> > the error paths and destroy callbacks in most cases.
> 
> True. I do support that. But we should also consider how to do this
> efficiently. Using drmm_mode_config_init() sets up a release function
> that handles all initialized encoders. For the majority of drivers, this
> is sufficient. Using drmm_encoder_init() in those drivers just adds
> overhead without additional benefits. That's also why I consider imx'
> requirements a corner case.

They certainly are. How about "drivers that can embed encoders in a
preallocated structure should use drm_simple_encoder_init() instead"?
The difference between the two will be clearer when the actual
allocation is folded into drmm_simple_encoder_init() as well.

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
