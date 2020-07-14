Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506D62205B8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9F76E466;
	Wed, 15 Jul 2020 07:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Tue, 14 Jul 2020 08:34:00 UTC
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AA06E167
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 08:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=2818; q=dns/txt; s=axis-central1;
 t=1594715640; x=1626251640;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p2tf3KkU+rYGe9yZT/8jvlWrsiOUbrH6EQvu1jCKbMA=;
 b=eJ0qZjOfhM6gz5Rja6vXZi+ozopVEil/oZkFaQ1rJgCbxIo6bjIvUnJg
 d3zd/kF3GwWObtZz4HvXYf5bF8Il9rvgSVztR7TZuzaXb08kuobCKkvrD
 ePcFbuoDmVQEswCvfSOkCli/f5L1oEo7+NcuuncQ0KjZ8adE0o241C4ad
 1KOuA3dbYrnzls8itjRnyZoSQhsyFGW4a6bvXELCckAFmbcNQtZ+5VcJT
 bf65ayTkx4He8Ci/5bLJUEryVDGYAl5lWYsw16CgVPyaVuZdnVoSm+Rbm
 0ULLTHQ/lSz1YhTF4BBYal4nWLsVbDJsMpxDYvlIzPHdMJ8LyRIfMSH5+ g==;
IronPort-SDR: coJ8ay+vIwwL4zbfHKEHSVdN5p/AdLtDdScA6Gwz1yI0lQeg7kYSpjKHzB6+upmAaSJShs3flZ
 c8prTq9Wz1BvZESQjT31vXdiaU7FLKijikNoMQhLBJ3do6Ls8bQveF/3lMHwMid758sXR4m6is
 RL5Jnizcy7sUJIoHlIhibbiEXSW/C7v7adHALDbiinocRLqZENVb+PbNQZ5oBASAd8b9xxPU1t
 tG8voooSY8kV/21IbDTDSliXaCjZ1/W+45mXj6c3zxqNtuiSQmgcIGXAYyJ8aDMzy+9D4COgm3
 MDQ=
X-IronPort-AV: E=Sophos;i="5.75,350,1589234400"; d="scan'208";a="10472076"
Date: Tue, 14 Jul 2020 10:24:37 +0200
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v3] drm/bridge: adv7511: Fix cec clock EPROBE_DEFER
 handling
Message-ID: <20200714082437.fvxkruwxgthnjn55@axis.com>
References: <CGME20200515065426eucas1p259c666b8e182a12c87e4e0b575b397d0@eucas1p2.samsung.com>
 <20200514113051.3567-1-vincent.whitchurch@axis.com>
 <3d908cbc-f892-9c3f-06a7-93f03c7c177b@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d908cbc-f892-9c3f-06a7-93f03c7c177b@samsung.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Wed, 15 Jul 2020 06:59:56 +0000
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, kernel <kernel@axis.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 02, 2020 at 04:22:34PM +0200, Andrzej Hajda wrote:
> On 14.05.2020 13:30, Vincent Whitchurch wrote:
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> > index a20a45c0b353..ee0ed4fb67c1 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> > @@ -286,28 +286,17 @@ static const struct cec_adap_ops adv7511_cec_adap_ops = {
> >   	.adap_transmit = adv7511_cec_adap_transmit,
> >   };
> >   
> > -static int adv7511_cec_parse_dt(struct device *dev, struct adv7511 *adv7511)
> > -{
> > -	adv7511->cec_clk = devm_clk_get(dev, "cec");
> > -	if (IS_ERR(adv7511->cec_clk)) {
> > -		int ret = PTR_ERR(adv7511->cec_clk);
> > -
> > -		adv7511->cec_clk = NULL;
> > -		return ret;
> > -	}
> > -	clk_prepare_enable(adv7511->cec_clk);
> > -	adv7511->cec_clk_freq = clk_get_rate(adv7511->cec_clk);
> > -	return 0;
> > -}
> > -
> > -int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
> > +void adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
> >   {
> >   	unsigned int offset = adv7511->type == ADV7533 ?
> >   						ADV7533_REG_CEC_OFFSET : 0;
> > -	int ret = adv7511_cec_parse_dt(dev, adv7511);
> > +	int ret;
> >   
> > -	if (ret)
> > -		goto err_cec_parse_dt;
> > +	if (!adv7511->cec_clk)
> > +		goto err_cec_no_clock;
> > +
> > +	clk_prepare_enable(adv7511->cec_clk);
> > +	adv7511->cec_clk_freq = clk_get_rate(adv7511->cec_clk);
> >   
> >   	adv7511->cec_adap = cec_allocate_adapter(&adv7511_cec_adap_ops,
> >   		adv7511, dev_name(dev), CEC_CAP_DEFAULTS, ADV7511_MAX_ADDRS);
> > @@ -334,7 +323,7 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
> >   	ret = cec_register_adapter(adv7511->cec_adap, dev);
> >   	if (ret)
> >   		goto err_cec_register;
> > -	return 0;
> > +	return;
> >   
> >   err_cec_register:
> >   	cec_delete_adapter(adv7511->cec_adap);
> > @@ -342,8 +331,11 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
> >   err_cec_alloc:
> >   	dev_info(dev, "Initializing CEC failed with error %d, disabling CEC\n",
> >   		 ret);
> > -err_cec_parse_dt:
> > +	clk_disable_unprepare(adv7511->cec_clk);
> > +	devm_clk_put(dev, adv7511->cec_clk);
> > +	/* Ensure that adv7511_remove() doesn't attempt to disable it again. */
> > +	adv7511->cec_clk = NULL;
> 
> Are you sure these three lines above are necessary? devm mechanism 
> should free the clock and with failed probe remove should not be called.

This driver ignores all failures in CEC registration/initialisation and
does not fail the probe for them.  I find that odd, but it seems to be
done like this on purpose (see commit 1b6fba458c0a2e8513 "drm/bridge:
adv7511/33: Fix adv7511_cec_init() failure handling") and my patch
preserves that behaviour.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
