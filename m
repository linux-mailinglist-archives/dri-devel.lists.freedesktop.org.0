Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 752E298F291
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 17:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC0010E88A;
	Thu,  3 Oct 2024 15:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kuMVv3oV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFBF10E887;
 Thu,  3 Oct 2024 15:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727969359; x=1759505359;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=YvquIwwg5/j4zuorAq7NmB4oxpw4k5D2MxcNq7+7jVA=;
 b=kuMVv3oV8G7edPznipQyHxg75FCx3GOh4uL/DIomV8EC1LroedBsnAxe
 RP3fUHZIo8HskIcqa3ta1Xpg0Atly9UGs1Sr8igfWCyrxRNqXCTJkZQ7n
 peglNbDgp/edKzSttcbyJ4mT6sBFNyiionHVLQDVbrQqMpXieLSohwNAj
 64G4lqR0tArBBad10HGKHKs8UQjnwDdGNdGabycRlq/4ofE+pLi1KOeLu
 3kp8pwupgpcWuLE0jxhL6qn3El7GozCWyUadc1H+YbU6FSlghT0wsPmnO
 3YlQLnp6ydfMybYst1E96AvZgHYAgNElRk0nEvRsBS4568Dh0TleNeAmz A==;
X-CSE-ConnectionGUID: 3jwtKSkMSB2OqO4gf11OLg==
X-CSE-MsgGUID: 8lvlOA6OTbK4O5yEuhERqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="26680408"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="26680408"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 08:29:18 -0700
X-CSE-ConnectionGUID: R4ZdAm2cSWCWdcBvo+HW5w==
X-CSE-MsgGUID: Rg93cpzSR3e/8YcpWOq3jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74496623"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 08:29:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 18:29:10 +0300
Date: Thu, 3 Oct 2024 18:29:10 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>, Russell King <linux@armlinux.org.uk>,
 Inki Dae <inki.dae@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Sandy Huang <hjc@rock-chips.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Zack Rusin <zack.rusin@broadcom.com>, amd-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drm: Move crtc->{x, y, mode, enabled} to legacy
 sub-structure
Message-ID: <Zv64RktMPv2rpCZf@intel.com>
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
 <20241002182200.15363-3-ville.syrjala@linux.intel.com>
 <Zv6QF2EmIcogtlLA@louis-chauvet-laptop>
 <Zv6gSGMXZZARf3oV@intel.com>
 <Zv6zN7Go_XG44P2-@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zv6zN7Go_XG44P2-@louis-chauvet-laptop>
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

On Thu, Oct 03, 2024 at 05:07:35PM +0200, Louis Chauvet wrote:
> 
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > index a40295c18b48..780681ea77e4 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > @@ -64,7 +64,7 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
> > > >  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> > > >  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> > > >  
> > > > -	drm_calc_timestamping_constants(crtc, &crtc->mode);
> > > > +	drm_calc_timestamping_constants(crtc, &crtc->legacy.mode);
> > > 
> > > 	drm_calc_timestamping_constants(crtc, &crtc->state->mode);
> > 
> > This one doesn't look safe. You want to call that during your atomic
> > commit already.
> > 
> 
> This was already not safe with the previous implementation? Or it is only 
> unsafe because now I use state->mode instead of legacy.mode?

Yeah, if you want to look at obj->state then you need the corresponding
lock.

obj->state is also not necessarily the correct state you want because
a parallel commit could have already swapped in a new state but the
hardware is still on the old state.

Basically 99.9% of code should never even look at obj->state, and
instead should always use the for_each_new_<obj>_in_state()
and drm_atomic_get_new_<obj>_state() stuff. Currently that is a
pipe dream though because a lot of drivers haven't been fixed to
do things properly. If we ever manage to fix everything then we
could remove the stall hacks from drm_atomic_helper_swap_state()
and allow a commit pipeline of arbitrary length.

> 
> After inspecting the code, I think I don't need to call it as:
> 
> In `vkms_atomic_commit_tail` (used in 
> `@vkms_mode_config_helpers.atomic_commit_tail`), we call 
> `drm_atomic_helper_commit_modeset_disables`, which call 
> `drm_atomic_helper_calc_timestamping_constants` which call 
> `drm_calc_timestamping_constants` for every CRTC.

Slightly odd place for it, but I think that's just because it was
originally part of drm_atomic_helper_update_legacy_modeset_state()
and I didn't bother looking for a better home for it when I split
it out. But seems like it should work fine as is.

> 
> I tested kms_vblank, all of them are SUCCESS/SKIP, do you know other tests 
> that can trigger bugs?

You would explicitly have to race commits against vblank_enable.
Could of course sprinkle sleep()s around to widen the race window
if you're really keen to hit it.

-- 
Ville Syrjälä
Intel
