Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B399945185
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 19:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C511C10E064;
	Thu,  1 Aug 2024 17:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DuO94Ghj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B658610E064
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 17:30:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 408D1667;
 Thu,  1 Aug 2024 19:29:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1722533399;
 bh=55DhPcRDuHS5ZpJARG/nkE7q25pYrGpOdf2s6UK6Pxs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DuO94GhjJoHXRM+sCAEccIi2c9T2/6OGnRjs0Aav44GhSzzHJMHLANynwEmfd1cE4
 IlJ8v0+PMvu6GdVJKBj8AENST4iqD0iZ3NsgZk8OwCa0wWyNgfQyEuAvDCn17ugNfA
 PXeHqO+Cp3uzVQj5sZkj/KZg5tS5ZmmdicJp+/JI=
Date: Thu, 1 Aug 2024 20:30:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricard Wanderlof <ricardw@axis.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH] drm: bridge: adv7511: Accept audio sample widths of 32
 bits via I2S
Message-ID: <20240801173026.GC18732@pendragon.ideasonboard.com>
References: <91472c14-3aeb-766a-1716-8219af6e8782@axis.com>
 <dad42efe-7895-50f5-6bba-9b8abb97f34a@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dad42efe-7895-50f5-6bba-9b8abb97f34a@axis.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 29, 2024 at 10:15:55AM +0200, Ricard Wanderlof wrote:
> 
> Hi,
> 
> I submitted the patch below a while ago (two months) but as far as I can 
> make out it has not been included. There was an initial concern from 
> Dmitry Baryshkov which was subsequently addressed but no other objections. 
> 
> On Tue, 28 May 2024, Ricard Wanderlof wrote:
> 
> > 
> > Even though data is truncated to 24 bits, the I2S interface does
> > accept 32 bit data (the slot widths according to the data sheet
> > can be 16 or 32 bits) so let the hw_params callback reflect this,
> > even if the lowest 8 bits are not used when 32 bits are specified.
> > 
> > This is normally how 24 bit audio data is handled (i.e. as 32 bit
> > data, with the LSB:s unused) and this is also reflected in other
> > bridge drivers which handle audio, for instance sii902x.c and
> > synopsis/dw-hdmi-i2s-audio.c .
> > 
> > Signed-off-by: Ricard Wanderlof <ricard.wanderlof@axis.com>
> > ---
> >  drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> > index 61f4a38e7d2b..4563f5d8136f 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> > @@ -101,11 +101,14 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
> >  	case 20:
> >  		len = ADV7511_I2S_SAMPLE_LEN_20;
> >  		break;
> > -	case 32:
> > -		if (fmt->bit_fmt != SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE)
> > -			return -EINVAL;
> > -		fallthrough;
> >  	case 24:
> > +	case 32:
> > +		/*
> > +		 * 32 bits are handled like 24 bits, except that the lowest
> > +		 * 8 bits are discarded. In fact, the accepted I2S slot widths
> > +		 * are 16 and 32 bits, so the chip is fully compatible with
> > +		 * 32 bit data.
> > +		 */
> >  		len = ADV7511_I2S_SAMPLE_LEN_24;
> >  		break;
> >  	default:
> 
> I recently discovered that the maintainer for the ADV7511 driver (in the 
> I2C) framework is not included by the get_maintainers script, so perhaps 
> this is the reason?
> 
> Otherwise, please enlighten me on what I need to do to get this patch 
> accepted!

I have no experience with HDMI audio, so I didn't comment on your patch.

Hans, is this within your area of expertise ?

-- 
Regards,

Laurent Pinchart
