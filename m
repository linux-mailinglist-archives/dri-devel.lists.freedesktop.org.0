Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D472985F908
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 13:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF0510E923;
	Thu, 22 Feb 2024 12:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNkdYw4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3257510E923
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 12:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708606734; x=1740142734;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JLuc1Jnxsxw+U4ER0Rl4lWt2pmSMVhIz7T8Bf6moZAM=;
 b=NNkdYw4hAGExOaifmjkpWk4gibzwht7sf0a6XNtRIBppiMwDv0gBeOks
 olQqS/0TQWVPS2Y+ayu6KGHPdXVoQJ516FJEP+iyXP7beRiWtZ0tMXj14
 Fwx6OGlnVrAnlMpArrAbY2eLQckocdoAOzRc69gBkTvXqC79UT5baEJ2Z
 RVRVx+sYDQstf8iPNah3k5A/6150UWx8H7Cy/xUkxp9nWd6RNO9Uwbc7R
 5WcJzz7QOwBlYCv19AxjcvvWsRf/35dfZiE+chiivHMh0VPlFmFHsCHxx
 SKBO/2II9+U0e2GAjTnk7MgRLQrx3CroENIVJxHwXRTeWQNrfWYZKuBPf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13449817"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="13449817"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 04:58:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="827546623"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="827546623"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Feb 2024 04:58:46 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 22 Feb 2024 14:58:45 +0200
Date: Thu, 22 Feb 2024 14:58:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <ZddFBe4A-galsO91@intel.com>
References: <Zb0aYAapkxQ2kopt@intel.com>
 <zml6j27skvjmbrfyz7agy5waxajv4p4asbemeexelm3wuv4o7j@xkd2wvnxhbuc>
 <20240209203435.GB996172@toolbox>
 <ahfl6f72lpgpsbnrbgvbsh4db4npr2hh36kua2c6krh544hv5r@dndw4hz2mu2g>
 <Zco-DQaXqae7B1jt@intel.com>
 <yx2t7xltxxgsngdsxamsfq6y7dze3wzegxcqwmsb5yrxen73x6@u3vilqhpci4w>
 <20240212170618.GA1372043@toolbox>
 <2mih3humepuedtli7ge52ncom4uffkqravdpalncgfyucmwdzc@bp5o7i3ky77a>
 <20240219140144.GB1956149@toolbox>
 <euaujtp4jyyoud3ccg5qhyvixyq2p6vir4ojlzoky6kep754rj@wruidyfxssry>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <euaujtp4jyyoud3ccg5qhyvixyq2p6vir4ojlzoky6kep754rj@wruidyfxssry>
X-Patchwork-Hint: comment
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

On Thu, Feb 22, 2024 at 11:54:04AM +0100, Maxime Ripard wrote:
> On Mon, Feb 19, 2024 at 03:01:44PM +0100, Sebastian Wick wrote:
> > On Thu, Feb 15, 2024 at 12:00:01PM +0100, Maxime Ripard wrote:
> > > On Mon, Feb 12, 2024 at 06:06:18PM +0100, Sebastian Wick wrote:
> > > > On Mon, Feb 12, 2024 at 05:53:48PM +0100, Maxime Ripard wrote:
> > > > > On Mon, Feb 12, 2024 at 05:49:33PM +0200, Ville Syrjälä wrote:
> > > > > > On Mon, Feb 12, 2024 at 11:01:07AM +0100, Maxime Ripard wrote:
> > > > > > > On Fri, Feb 09, 2024 at 09:34:35PM +0100, Sebastian Wick wrote:
> > > > > > > > On Mon, Feb 05, 2024 at 10:39:38AM +0100, Maxime Ripard wrote:
> > > > > > > > > On Fri, Feb 02, 2024 at 06:37:52PM +0200, Ville Syrjälä wrote:
> > > > > > > > > > On Fri, Feb 02, 2024 at 04:59:30PM +0100, Maxime Ripard wrote:
> > > > > > > > > > > On Fri, Feb 02, 2024 at 05:40:47PM +0200, Ville Syrjälä wrote:
> > > > > > > > > > > > On Fri, Feb 02, 2024 at 02:01:39PM +0100, Maxime Ripard wrote:
> > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > 
> > > > > > > > > > > > > On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian Wick wrote:
> > > > > > > > > > > > > > > >  /**
> > > > > > > > > > > > > > > >   * DOC: HDMI connector properties
> > > > > > > > > > > > > > > >   *
> > > > > > > > > > > > > > > > + * Broadcast RGB
> > > > > > > > > > > > > > > > + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> > > > > > > > > > > > > > > > + *      Infoframes will be generated according to that value.
> > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > + *      The value of this property can be one of the following:
> > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > + *      Automatic:
> > > > > > > > > > > > > > > > + *              RGB Range is selected automatically based on the mode
> > > > > > > > > > > > > > > > + *              according to the HDMI specifications.
> > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > + *      Full:
> > > > > > > > > > > > > > > > + *              Full RGB Range is forced.
> > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > + *      Limited 16:235:
> > > > > > > > > > > > > > > > + *              Limited RGB Range is forced. Unlike the name suggests,
> > > > > > > > > > > > > > > > + *              this works for any number of bits-per-component.
> > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > > + *      Drivers can set up this property by calling
> > > > > > > > > > > > > > > > + *      drm_connector_attach_broadcast_rgb_property().
> > > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > This is a good time to document this in more detail. There might be two
> > > > > > > > > > > > > > > different things being affected:
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > 1. The signalling (InfoFrame/SDP/...)
> > > > > > > > > > > > > > > 2. The color pipeline processing
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > All values of Broadcast RGB always affect the color pipeline processing
> > > > > > > > > > > > > > > such that a full-range input to the CRTC is converted to either full- or
> > > > > > > > > > > > > > > limited-range, depending on what the monitor is supposed to accept.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > When automatic is selected, does that mean that there is no signalling,
> > > > > > > > > > > > > > > or that the signalling matches what the monitor is supposed to accept
> > > > > > > > > > > > > > > according to the spec? Also, is this really HDMI specific?
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > When full or limited is selected and the monitor doesn't support the
> > > > > > > > > > > > > > > signalling, what happens?
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Forgot to mention: user-space still has no control over RGB vs YCbCr on
> > > > > > > > > > > > > > the cable, so is this only affecting RGB? If not, how does it affect
> > > > > > > > > > > > > > YCbCr?
> > > > > > > > > > > > > 
> > > > > > > > > > > > > So I dug a bit into both the i915 and vc4 drivers, and it looks like if
> > > > > > > > > > > > > we're using a YCbCr format, i915 will always use a limited range while
> > > > > > > > > > > > > vc4 will follow the value of the property.
> > > > > > > > > > > > 
> > > > > > > > > > > > The property is literally called "Broadcast *RGB*".
> > > > > > > > > > > > That should explain why it's only affecting RGB.
> > > > > > > > > > > 
> > > > > > > > > > > Right. And the limited range option is called "Limited 16:235" despite
> > > > > > > > > > > being usable on bpc > 8 bits. Naming errors occurs, and history happens
> > > > > > > > > > > to make names inconsistent too, that's fine and not an argument in
> > > > > > > > > > > itself.
> > > > > > > > > > > 
> > > > > > > > > > > > Full range YCbCr is a much rarer beast so we've never bothered
> > > > > > > > > > > > to enable it.
> > > > > > > > > > > 
> > > > > > > > > > > vc4 supports it.
> > > > > > > > > > 
> > > > > > > > > > Someone implemented it incorrectly then.
> > > > > > > > > 
> > > > > > > > > Incorrectly according to what documentation / specification? I'm sorry,
> > > > > > > > > but I find it super ironic that i915 gets to do its own thing, not
> > > > > > > > > document any of it, and when people try to clean things up they get told
> > > > > > > > > that we got it all wrong.
> > > > > > > > 
> > > > > > > > FWIW, this was an i915 property and if another driver uses the same
> > > > > > > > property name it must have the same behavior. Yes, it isn't standardized
> > > > > > > > and yes, it's not documented (hence this effort here) but it's still on
> > > > > > > > vc4 to make the property compatible.
> > > > > > > 
> > > > > > > How is it not compatible? It's a superset of what i915 provides, but
> > > > > > > it's strictly compatible with it.
> > > > > > 
> > > > > > No it is not.
> > > > > 
> > > > > The property is compatible with i915 interpretation of it, whether you
> > > > > like it or not. And that's what Sebastian was referring to.
> > > > > 
> > > > > > Eg. what happens if you set the thing to full range for RGB (which you
> > > > > > must on many broken monitors), and then the kernel automagically
> > > > > > switches to YCbCr (for whatever reason) but the monitor doesn't
> > > > > > support full range YCbCr? Answer: you get crap output.
> > > > > 
> > > > > And that part is just moving goalposts.
> > > > 
> > > > But it's really not.
> > > 
> > > It really is. This whole discussion started by "well it would be nice if
> > > we made that property handled by the core", and we're now at the "we
> > > need to deal with broken YCbCr displays and i915 opinion about them"
> > > stage. After creating documentation, unit tests, etc. It's the textbook
> > > definition of moving goalposts. And while i915 won't be affected by all
> > > that work.
> > 
> > Sorry, but what you're saying is just not true.
> > 
> > The Broadcast RGB property is an Intel specific property.
> 
> No, it's not. vc4 has been using it for a year now.
> 
> > It lacked documentation but the user space contract exists and it
> > based on how i915 implemented it. By changing the semantics you're
> > breaking user space. The documentation has to document the current
> > contract between i915 and user space, not whatever you want the
> > property to be like.
> > 
> > I get that you're frustrated that you have to do work while i915 doesn't
> > but none of that is relevant for what the property is and how user space
> > expects it to work.
> 
> That's not it, really. I don't mind doing the work. I do mind losing
> functionalities on something that was working fine. And getting the
> blame for something that is, at best, just as much of an documentation
> issue on i915 devs.

We've had a couple of these cases recently where people have taken
some old property implemented by i915 and implemented it differently
in some other driver. Dunno if the reason was that people didn't try
to understand what i915 is doing and why, or they misundestood it,
or they understood it but decided to ignore it anyway.

Unfortunately having undocumented corners in the uapi is simply
a fact of life when dealing with a >15 year old legacy codebase.
Also there were basically no rules regarding properties in the
past, so everyone just added random properties whenever they 
felt like it.

I think going forward we should probably lay down some extra
ground rules; if an old undocumented uapi is being extended
to cover more than one driver we must first figure out what
the de facto semantics are, and document things properly
before anything else gets done.

-- 
Ville Syrjälä
Intel
