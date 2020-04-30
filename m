Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5831C0E9F
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678096EA76;
	Fri,  1 May 2020 07:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CC36EBA3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 11:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=1248; q=dns/txt; s=axis-central1;
 t=1588247890; x=1619783890;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xeu2yLcmB+sh3I1LTx2R30u4baBDODT4QX6tCHIsbmo=;
 b=DTsL2pMXqjLcXybbVzphHpdpB807h1b1NEjbUi5XHXis3xUOALtVRde7
 pjbUpjwXnAQmo1Jv4+x/ArWIdXuso1Ta9MKOlJfhH1SjdWzWBJR48Fs0j
 xiKeXXn7skbInFHs1en+YqTa8ItUgGrIfc1jMxkd9sH0cVjOJg9r9auIu
 uiVhBTcv0ns1ADScKqgF4OEd4h2CzSyew8RTeURf88eIBMYVMH5jHxX9b
 koSfTfZDsfE+LOSsr/ohOhn0H4aneySibe4TXSb4qJExpcsplzq9QP0xN
 ccqQmr9eI0AcmfLmUZXo2S36HU/UsWmE+Tk/nY+v8PeOR7H6emwQyedFH g==;
IronPort-SDR: vBi6ivs5x8cPn8McbXbAGhDEwXyP6PZDhPwmsmgixZrR8UxlRgRK51iSlofJY1N/JAvhZTmKlq
 t7OYkjXt2cwJRztL44cFYL2B0ywd0CIPfzpFzYXhBt7NWdcj0+aIG24gUhLy9pBkUzccYRICUt
 gbt0MrIonKsggbWE5nuSyJHDjuWqaBpubxjH+CSk+d0oiERaI73gTvXoHB2KsnZdGr8VvQz3Gn
 9HbVNCDfjX16xc3jvrVEYXg8l7jdcWA+/hRKfo1i2dYuxVxoe+EaqLoIZ+Zmp4iLTM2L0Fa6wL
 Mbo=
X-IronPort-AV: E=Sophos;i="5.73,334,1583190000"; 
   d="scan'208";a="8259281"
Date: Thu, 30 Apr 2020 13:58:08 +0200
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Fix cec clock EPROBE_DEFER handling
Message-ID: <20200430115808.km6cijnxfc3xtert@axis.com>
References: <20200331141629.14047-1-vincent.whitchurch@axis.com>
 <20200406005817.GA11665@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200406005817.GA11665@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>, kernel <kernel@axis.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 06, 2020 at 02:58:17AM +0200, Laurent Pinchart wrote:
> On Tue, Mar 31, 2020 at 04:16:29PM +0200, Vincent Whitchurch wrote:
> >  int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
> >  {
> >  	unsigned int offset = adv7511->type == ADV7533 ?
> >  						ADV7533_REG_CEC_OFFSET : 0;
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
> >  	adv7511->cec_adap = cec_allocate_adapter(&adv7511_cec_adap_ops,
> >  		adv7511, dev_name(dev), CEC_CAP_DEFAULTS, ADV7511_MAX_ADDRS);
> > @@ -342,8 +331,11 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
> >  err_cec_alloc:
> >  	dev_info(dev, "Initializing CEC failed with error %d, disabling CEC\n",
> >  		 ret);
> > -err_cec_parse_dt:
> > +	clk_disable_unprepare(adv7511->cec_clk);
> > +	/* Ensure that adv7511_remove() doesn't attempt to disable it again. */
> 
> Would it make sense to call devm_clk_put() here to already release the
> clock ?

I've just sent out a v2 with this added.  Thank you for the review!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
