Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61B8660631
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 19:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD35D10E8B5;
	Fri,  6 Jan 2023 18:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C613710E8AD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 18:08:56 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id b2so2427284pld.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 10:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aRfBMIOrWnkTgcTHC8fokRZyL82kMsM9senrx2vjrp4=;
 b=KGEHXfRmPiYzMG2kUn40dLIk5Z1zjbUEthvuPHMpU6fXdKK6/8qi6QmjzIFqCAjxHo
 jdVeSB8e9/bEAZb+jcbPfsS3Hvi9dlBXT03QtiyWDcGq+k9yn3JWMV2F6TuXSP3iN7bh
 1C2hcM1cmLER/jBXk3lKj5hiOdZ3tqDNm480o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aRfBMIOrWnkTgcTHC8fokRZyL82kMsM9senrx2vjrp4=;
 b=yvkJS3kHN7Qy42ywepjF5E3SRaD3daVcZK/aCz7VQkJVrNDxhiO+Kw+fz6Y76S5czB
 ub+a2P4sroIkAtlSKQX2WiTzl6qf7b9EjZT+9c+9yq5cU45YpR2RouTplOYOcajfehbc
 T2YcPGgHrLJAlC0PgUkQzc1BxXlj8B1ZL+l0ew0SYqvCV8VUd0UT/Agstbk7xfg4qfKo
 REXPWjOwE2Jo6AJaIG4G6XRoObrhD1gL8i7PkNyov8HxBNmFYkQs0l76yv4A7bXqQmDl
 SoFd88QxOdgGksCZv6IA8tEgwy+ti/+satwB66Cid9JM9Vzw7Ah4FSqnKHR7Ejo+cNLh
 S5XA==
X-Gm-Message-State: AFqh2koxG2g0W+IZ1JPBpQ2pWNmAfy6JLjX5eZGkfPZOntShog3orQ4C
 6IWzB5XpUiZj+yacY2uCZFHIJQ==
X-Google-Smtp-Source: AMrXdXu3+CpeCXjMMRDSk0RxLILeTWZA5Pe+CQFqkM1hhlNB+wt9gU/hx35Rd9JRj7BX4MHLZ0xiiA==
X-Received: by 2002:a17:902:eb8f:b0:192:8ec5:fd58 with SMTP id
 q15-20020a170902eb8f00b001928ec5fd58mr43083908plg.6.1673028536246; 
 Fri, 06 Jan 2023 10:08:56 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5567:fb20:aa4f:352])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a170902e80500b00189529ed580sm1282081plg.60.2023.01.06.10.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 10:08:55 -0800 (PST)
Date: Fri, 6 Jan 2023 10:08:53 -0800
From: Brian Norris <briannorris@chromium.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Sean Paul <seanpaul@chromium.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/atomic: Allow vblank-enabled + self-refresh
 "disable"
Message-ID: <Y7hjte/w8yP2TPlB@google.com>
References: <20230105174001.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
 <Y7hgLUXOrD7QwKs1@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7hgLUXOrD7QwKs1@phenom.ffwll.local>
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

Hi Daniel,

On Fri, Jan 06, 2023 at 06:53:49PM +0100, Daniel Vetter wrote:
> On Thu, Jan 05, 2023 at 05:40:17PM -0800, Brian Norris wrote:
> > The self-refresh helper framework overloads "disable" to sometimes mean
> > "go into self-refresh mode," and this mode activates automatically
> > (e.g., after some period of unchanging display output). In such cases,
> > the display pipe is still considered "on", and user-space is not aware
> > that we went into self-refresh mode. Thus, users may expect that
> > vblank-related features (such as DRM_IOCTL_WAIT_VBLANK) still work
> > properly.
> > 
> > However, we trigger the WARN_ONCE() here if a CRTC driver tries to leave
> > vblank enabled here.
> > 
> > Add a new exception, such that we allow CRTCs to be "disabled" (with
> > self-refresh active) with vblank interrupts still enabled.
> > 
> > Cc: <stable@vger.kernel.org> # dependency for subsequent patch
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > ---
> > 
> >  drivers/gpu/drm/drm_atomic_helper.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index d579fd8f7cb8..7b5eddadebd5 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1207,6 +1207,12 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
> >  
> >  		if (!drm_dev_has_vblank(dev))
> >  			continue;
> > +		/*
> > +		 * Self-refresh is not a true "disable"; let vblank remain
> > +		 * enabled.
> > +		 */
> > +		if (new_crtc_state->self_refresh_active)
> > +			continue;
> 
> This very fishy, because we check in crtc_needs_disable whether this
> output should stay on due to self-refresh. Which means you should never
> end up in here.

That's not what crtc_needs_disable() does w.r.t. self-refresh. In fact,
it's the opposite; see, for example, the
|new_state->self_refresh_active| clause. That clause means that if we're
entering self-refresh, we *intend* to disable (i.e., we return 'true').
That's because like I mention above, the self-refresh helpers overload
what "disable" means.

I'll also add my caveat again that I'm a bit new to DRM, so feel free to
continue to correct me if I'm wrong :) Or perhaps Sean Paul could
provide second opinions, as I believe he wrote this stuff.

> And yes vblank better work in self refresh :-) If it doesn't, then you
> need to fake it with a timer, that's at least what i915 has done for
> transparent self-refresh.

OK! Then that sounds like it at least ACKs my general idea for this
series. (Michel and I poked at a few ideas in the thread at [1] and
landed on approx. this solution, or else a fake/timer like you suggest.)

> We might need a few more helpers. Also, probably more igt, or is this
> something igt testing has uncovered? If so, please cite the igt testcase
> which hits this.

The current patch only fixes a warning that comes when I try to do the
second patch. The second patch is a direct product of an IGT test
failure (a few of kms_vblank's subtests), and I linked [1] the KernelCI
report there.

Brian

[1] Link: https://lore.kernel.org/dri-devel/Y5itf0+yNIQa6fU4@sirena.org.uk/
    Reported-by: "kernelci.org bot" <bot@kernelci.org>
