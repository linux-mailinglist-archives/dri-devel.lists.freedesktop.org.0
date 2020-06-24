Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0173F207460
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 15:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3146EB39;
	Wed, 24 Jun 2020 13:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B28D6EB39
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 13:24:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9F6A2A8;
 Wed, 24 Jun 2020 15:24:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1593005050;
 bh=9FvYZAeIEFhM+JzFaVDBCgpx8ST/p2ndCMOZJSUhqVc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t0QNK4Y0HvQGnv/OPruCmqjPCrEapbS9oYQvfpmeNJKLmUnRSr7nbq+HKuDFtb4rc
 vGnPLdD994z4HiGZAlXcmpMPpRdy1p8MlrhPL3H8tptS8AbK2v/6nR8otECzwezL50
 4kp1MaPvbgyIso516Pa7RAssnvKI6w1y5+Mjs9z0=
Date: Wed, 24 Jun 2020 16:23:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RESEND PATCH v5 1/5] driver core: add probe_err log helper
Message-ID: <20200624132344.GA5980@pendragon.ideasonboard.com>
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114135eucas1p26e2e4683d60cebdce7acd55177013992@eucas1p2.samsung.com>
 <20200624114127.3016-2-a.hajda@samsung.com>
 <20200624123140.GB1773782@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624123140.GB1773782@kroah.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 andy.shevchenko@gmail.com, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 02:31:40PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jun 24, 2020 at 01:41:23PM +0200, Andrzej Hajda wrote:
> > During probe every time driver gets resource it should usually check for error
> > printk some message if it is not -EPROBE_DEFER and return the error. This
> > pattern is simple but requires adding few lines after any resource acquisition
> > code, as a result it is often omited or implemented only partially.
> > probe_err helps to replace such code sequences with simple call, so code:
> > 	if (err != -EPROBE_DEFER)
> > 		dev_err(dev, ...);
> > 	return err;
> > becomes:
> > 	return probe_err(dev, err, ...);
> > 
> > Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > Reviewed-by: Mark Brown <broonie@kernel.org>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > ---
> >  drivers/base/core.c    | 39 +++++++++++++++++++++++++++++++++++++++
> >  include/linux/device.h |  3 +++
> >  2 files changed, 42 insertions(+)
> > 
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 67d39a90b45c..ee9da66bff1b 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -3953,6 +3953,45 @@ define_dev_printk_level(_dev_info, KERN_INFO);
> >  
> >  #endif
> >  
> > +/**
> > + * probe_err - probe error check and log helper
> > + * @dev: the pointer to the struct device
> > + * @err: error value to test
> > + * @fmt: printf-style format string
> > + * @...: arguments as specified in the format string
> > + *
> > + * This helper implements common pattern present in probe functions for error
> > + * checking: print message if the error is not -EPROBE_DEFER and propagate it.
> > + * It replaces code sequence:
> > + * 	if (err != -EPROBE_DEFER)
> > + * 		dev_err(dev, ...);
> > + * 	return err;
> > + * with
> > + * 	return probe_err(dev, err, ...);
> > + *
> > + * Returns @err.
> > + *
> > + */
> > +int probe_err(const struct device *dev, int err, const char *fmt, ...)
> > +{
> > +	struct va_format vaf;
> > +	va_list args;
> > +
> > +	if (err == -EPROBE_DEFER)
> > +		return err;
> > +
> > +	va_start(args, fmt);
> > +	vaf.fmt = fmt;
> > +	vaf.va = &args;
> > +
> > +	dev_err(dev, "error %d: %pV", err, &vaf);
> > +
> > +	va_end(args);
> > +
> > +	return err;
> > +}
> > +EXPORT_SYMBOL_GPL(probe_err);
> 
> Please be specific in global symbols, how about "driver_probe_error()"?

Or dev_err_probe() to match the existing dev_* functions ?

> And merge the other patch into this one, as Raphael said, otherwise this
> just looks odd to add something and then fix it up later.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
