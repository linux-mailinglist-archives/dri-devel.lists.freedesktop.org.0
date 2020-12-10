Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 508952D59DF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 12:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5650989E9B;
	Thu, 10 Dec 2020 11:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCF689E9B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 11:59:43 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1knKbm-0007dS-ED; Thu, 10 Dec 2020 12:59:42 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1knKbl-0002kE-Fq; Thu, 10 Dec 2020 12:59:41 +0100
Message-ID: <162b2aedea8790df6b7a06adcfaa3898bed03212.camel@pengutronix.de>
Subject: Re: [PATCH v4 02/19] drm: add drmm_encoder_alloc()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 10 Dec 2020 12:59:41 +0100
In-Reply-To: <20201209160508.GU401619@phenom.ffwll.local>
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
 <20201208155451.8421-3-p.zabel@pengutronix.de>
 <20201209160508.GU401619@phenom.ffwll.local>
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
Cc: kernel@pengutronix.de, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

thank you for the review. I'll work in all your other comments, there's
just one I'm not sure what to do about:

On Wed, 2020-12-09 at 17:05 +0100, Daniel Vetter wrote:
[...]
> > +void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
> > +			   const struct drm_encoder_funcs *funcs,
> > +			   int encoder_type, const char *name, ...)
> > +{
> > +	void *container;
> > +	struct drm_encoder *encoder;
> > +	va_list ap;
> > +	int ret;
> > +
> > +	if (WARN_ON(funcs && funcs->destroy))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	container = drmm_kzalloc(dev, size, GFP_KERNEL);
> > +	if (!container)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	encoder = container + offset;
> > +
> > +	va_start(ap, name);
> > +	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
> > +	va_end(ap);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +
> > +	ret = drmm_add_action_or_reset(dev, drmm_encoder_alloc_release, encoder);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +
> > +	return container;
> > +}
> > +EXPORT_SYMBOL(__drmm_encoder_alloc);
> > +
[...]
> > + * @encoder_type: user visible type of the encoder
> > + * @name: printf style format string for the encoder name, or NULL for default name
> > + *
> > + * Allocates and initializes an encoder. Encoder should be subclassed as part of
> > + * driver encoder objects. Cleanup is automatically handled through registering
> > + * drm_encoder_cleanup() with drmm_add_action().
> > + *
> > + * The @drm_encoder_funcs.destroy hook must be NULL.
> > + *
> > + * Returns:
> > + * Pointer to new encoder, or ERR_PTR on failure.
> > + */
> > +#define drmm_encoder_alloc(dev, type, member, funcs, encoder_type, name, ...) \
> > +	((type *)__drmm_encoder_alloc(dev, sizeof(type), \
> 
> Need to upcast with container_of or this breaks if the base class is in
> the wrong spot.

This is modeled after devm_drm_dev_alloc(). Like __devm_drm_dev_alloc(),
__drmm_encoder_alloc() returns a pointer to the allocated container
structure, not a pointer to the embedded struct drm_encoder. I think
this direct cast is correct, unless you suggest that
__drmm_encoder_alloc should return encoder instead of container?

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
