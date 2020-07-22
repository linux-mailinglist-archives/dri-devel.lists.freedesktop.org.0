Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5327D229AFC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 17:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D18C6E137;
	Wed, 22 Jul 2020 15:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AAE6E137
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 15:08:05 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jyGLk-00067T-58; Wed, 22 Jul 2020 17:08:04 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jyGLj-0002YR-Pd; Wed, 22 Jul 2020 17:08:03 +0200
Message-ID: <e11f2cc1a3348260d08d13f1d43df4ef534f09f6.camel@pengutronix.de>
Subject: Re: [PATCH] drm/simple_kms_helper: add drmm_simple_encoder_init()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Date: Wed, 22 Jul 2020 17:08:03 +0200
In-Reply-To: <34224c32-7c17-4c7e-1ec9-03215ec7ed8a@suse.de>
References: <20200722132558.28289-1-p.zabel@pengutronix.de>
 <34224c32-7c17-4c7e-1ec9-03215ec7ed8a@suse.de>
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

thank you for your comment.

On Wed, 2020-07-22 at 16:43 +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 22.07.20 um 15:25 schrieb Philipp Zabel:
> > Add a drm_simple_encoder_init() variant that registers
> > drm_encoder_cleanup() with drmm_add_action().
> > 
> > Now drivers can store encoders in memory allocated with drmm_kmalloc()
> > after the call to drmm_mode_config_init(), without having to manually
> > make sure that drm_encoder_cleanup() is called before the memory is
> > freed.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  drivers/gpu/drm/drm_simple_kms_helper.c | 42 +++++++++++++++++++++++++
> >  include/drm/drm_simple_kms_helper.h     |  4 +++
> >  2 files changed, 46 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
> > index 74946690aba4..a243f00cf63d 100644
> > --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> > +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> > @@ -9,6 +9,7 @@
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_bridge.h>
> > +#include <drm/drm_managed.h>
> >  #include <drm/drm_plane_helper.h>
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/drm_simple_kms_helper.h>
> > @@ -71,6 +72,47 @@ int drm_simple_encoder_init(struct drm_device *dev,
> >  }
> >  EXPORT_SYMBOL(drm_simple_encoder_init);
> >  
> > +static void drmm_encoder_cleanup(struct drm_device *dev, void *ptr)
> > +{
> > +	struct drm_encoder *encoder = ptr;
> > +
> > +	drm_encoder_cleanup(encoder);
> > +}
> 
> This doesn't work. DRM cleans up the encoder by invoking the destroy
> callback from the encoder functions. This additional helper would
> cleanup the encoder a second time.

Indeed this would require the encoder destroy callback to be NULL.

> You can already embed the encoder in another structure and things should
> work as expected.

If the embedding structure is a component allocated with drmm_kmalloc()
after the call to drmm_mode_config_init(), the structure will already be
freed before the destroy callback is run from
drmm_mode_config_init_release().

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
