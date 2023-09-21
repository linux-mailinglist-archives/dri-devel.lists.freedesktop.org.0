Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F287A9418
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 14:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFA910E5E1;
	Thu, 21 Sep 2023 12:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C6210E5E1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 12:12:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2F7D10FE;
 Thu, 21 Sep 2023 14:11:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1695298276;
 bh=iO0UHzPBM95Q2gC6Mfq+/hI5nIK6J68Fe0rzREmv7NM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tmdFjAhuh7h5Bc4T4ykOgiI5rN/HF3hDjOgZBMb3SvMmlHDpiNUNtzd1ETXeasVyE
 uGPn/i3q44xCOIfwXRVpl0RdQZnxsR0dBQ0qadut6wzJ+VC2yuOm/TOIiPvDedA0La
 6OVXn2zaAPqz2u24lt/qZ4NgAw9hzyng/C1N6vJA=
Date: Thu, 21 Sep 2023 15:13:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/bridge: Add 200ms delay to wait FW HPD status stable
Message-ID: <20230921121305.GA19112@pendragon.ideasonboard.com>
References: <20230921091435.3524869-1-xji@analogixsemi.com>
 <87leczpw2h.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87leczpw2h.fsf@intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, bliang@analogixsemi.com,
 qwen@analogixsemi.com, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, hsinyi@chromium.org,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The subject line is missing the driver name.

On Thu, Sep 21, 2023 at 03:09:10PM +0300, Jani Nikula wrote:
> On Thu, 21 Sep 2023, Xin Ji <xji@analogixsemi.com> wrote:
> > For the none-interrupt design(sink device is panel, polling HPD

s/none-interrupt/no-interrupt/ ?

s/design/design /

> > status when chip power on), anx7625 FW has more than 200ms HPD
> > de-bounce time in FW, for the safety to get HPD status, driver
> > better to wait 200ms before HPD detection after OS resume back.
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 51abe42c639e..833d6d50a03d 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1464,6 +1464,9 @@ static int _anx7625_hpd_polling(struct anx7625_data *ctx,
> >  	if (ctx->pdata.intp_irq)
> >  		return 0;
> >  
> > +	/* Delay 200ms for FW HPD de-bounce */
> > +	usleep_range(200000, 201000);
> 
> If you need to sleep for 200 ms, maybe use msleep instead?

fsleep() could be a nice replacement.

> > +
> >  	ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
> >  				 ctx, val,
> >  				 ((val & HPD_STATUS) || (val < 0)),

-- 
Regards,

Laurent Pinchart
