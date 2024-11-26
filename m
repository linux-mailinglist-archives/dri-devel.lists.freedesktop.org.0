Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223B09D9645
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 12:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F364410E845;
	Tue, 26 Nov 2024 11:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="IYjLxIra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DFF10E827
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 11:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID; bh=i8aAJG0E0LQ869T/BkdOg6biqlcLfLrnW6kcsgQo+rg=; b=IYjLxI
 racD1Hfp9/3fmYI4DPBBK6GoSfOG/NV0Du+imWjwCZo/uWJeVZsT7IcGW7b3jGFb/tbXS0HNlVFm9
 qU7rBvtHbAlmsY/IT/F9UD96NN2oBlZGGhYT1LV50/nodVxCC1dj3NMVSktE/aNLrCd36HQMOdut3
 uuspr8X6v5lhdg4GmudtZ/S98ai3ZP+VFGPkGLXHl3+wsyGcK+hY9SAnb/Quv+6pdrJlFJUlB4bw6
 kn2+wX78fU12sVnobvWwFeNbonB5rT7zWueM2LU9QYI87AF8Aay5Am97RMoUYipNZFJ5gFgMk6rOK
 fWEWYQteYuK5+v1v3I+fQ3YXDbiA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1tFtps-00082H-Nc; Tue, 26 Nov 2024 12:34:28 +0100
Received: from [185.17.218.86] (helo=Seans-MacBook-Pro.local)
 by sslproxy07.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sean@geanix.com>) id 1tFtpr-0000HD-2M;
 Tue, 26 Nov 2024 12:34:27 +0100
Date: Tue, 26 Nov 2024 12:34:26 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
Message-ID: <zmrcuqiyz5gojhusysy7cytluedslqmfgzuslutqeg65iv7ju6@bggk7qbm6eas>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
 <20241126-refreshing-slick-pig-baebab@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241126-refreshing-slick-pig-baebab@houat>
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27469/Tue Nov 26 10:58:20 2024)
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

Hi,

On Tue, Nov 26, 2024 at 09:38:55AM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Nov 26, 2024 at 08:36:00AM +0100, Sean Nyekjaer wrote:
> > On Mon, Nov 25, 2024 at 05:00:56PM +0100, Maxime Ripard wrote:
> > > On Mon, Nov 25, 2024 at 02:49:26PM +0100, Sean Nyekjaer wrote:
> > > > Check if the required pixel clock is in within .5% range of the
> > > > desired pixel clock.
> > > > This will match the requirement for HDMI where a .5% tolerance is allowed.
> > > > 
> > > > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_modes.c | 34 ++++++++++++++++++++++++++++++++++
> > > >  include/drm/drm_modes.h     |  2 ++
> > > >  2 files changed, 36 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> > > > index 6ba167a3346134072d100af0adbbe9b49e970769..4068b904759bf80502efde6e4d977b297f5d5359 100644
> > > > --- a/drivers/gpu/drm/drm_modes.c
> > > > +++ b/drivers/gpu/drm/drm_modes.c
> > > > @@ -1623,6 +1623,40 @@ bool drm_mode_equal_no_clocks_no_stereo(const struct drm_display_mode *mode1,
> > > >  }
> > > >  EXPORT_SYMBOL(drm_mode_equal_no_clocks_no_stereo);
> > > >  
> > > > +/**
> > > > + * drm_mode_validate_mode
> > > > + * @mode: mode to check
> > > > + * @rounded_rate: output pixel clock
> > > > + *
> > > > + * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
> > > > + * CVT spec reuses that tolerance in its examples, so it looks to be a
> > > > + * good default tolerance for the EDID-based modes. Define it to 5 per
> > > > + * mille to avoid floating point operations.
> > > > + *
> > > > + * Returns:
> > > > + * The mode status
> > > > + */
> > > > +enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
> > > > +					    unsigned long long rounded_rate)
> > > > +{
> > > > +	enum drm_mode_status status;
> > > > +	unsigned long long rate = mode->clock * 1000;
> > > > +	unsigned long long lowest, highest;
> > > > +
> > > > +	lowest = rate * (1000 - 5);
> > > > +	do_div(lowest, 1000);
> > > > +	if (rounded_rate < lowest)
> > > > +		return MODE_CLOCK_LOW;
> > > > +
> > > > +	highest = rate * (1000 + 5);
> > > > +	do_div(highest, 1000);
> > > > +	if (rounded_rate > highest)
> > > > +		return MODE_CLOCK_HIGH;
> > > > +
> > > > +	return MODE_OK;
> > > > +}
> > > > +EXPORT_SYMBOL(drm_mode_validate_mode);
> > > 
> > > Thanks a lot for doing that!
> > > 
> > > I wonder about the naming though (and prototype). I doesn't really
> > > validates a mode, but rather makes sure that a given rate is a good
> > > approximation of a pixel clock. So maybe something like
> > > drm_mode_check_pixel_clock?
> > 
> > Naming is hard :) I will use drm_mode_check_pixel_clock() for V2.
> > 
> > Would it make sense to have the pixel clock requirement as a input
> > parameter? For HDMI it is 0.5%
> 
> This code was only used for panels so far. It reuses the same tolerance
> than HDMI because we couldn't come up with anything better, but it
> should totally apply to other things.
> 
> > and in my case the LVDS panel 10%.
> 
> 10% is a lot, and I'm not sure we'll want that. The framerate being
> anywhere between 54 and 66 fps will trip a lot of applications too.
> 
> Why do you need such a big tolerance?

I don't need it, it was just from the datasheet for the LVDS panel :)

> 
> Maxime

/Sean
