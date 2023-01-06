Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 452A0660649
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 19:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF8A10E8A2;
	Fri,  6 Jan 2023 18:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5EA10E8A2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 18:20:45 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id bs20so2041885wrb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 10:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aemmpY4lie0lDuI7ZJtcygqgFQlTvEL2aaHOwmDLGio=;
 b=BOSJE7k9oAgjMKUPmDPqU5v3aotgQDyoBIuL+1/3CyEnq/QGAKfiOSwoatlql7i8sb
 X9MHzMrnFyc0xhjunyG27PnLXeW1c+AJ+c1pE9XeqThLDFOsFSEvc/MBSYyMaSCfCYBf
 KpQMEMdNYa2d9pub8CX6UAyoih+vUQoZ8TXSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aemmpY4lie0lDuI7ZJtcygqgFQlTvEL2aaHOwmDLGio=;
 b=GyV4tXmUVZrofkEzQTPY+Qc/y1utyHbncumc82hXfoz0xQqZ08RZDCAJBketZdvR22
 qz58zq0kRj9jhzBIX69q6u4WrT+xUsVbTyZ0eBdmxwXELzLuiXeY1+BXuOke31JGQy5C
 sokLUK7j8vQ8woYdgBL+Nn5cV2K7aoCMJkqRUMZzvUzbdANpkaCl3kHM7B26nZNBX6SL
 BqjPE9D99fA5lUhrIXpeOE9BucpjbbOB5/70PqSo8zEhmkfE/2CN4tsV2W4BiiYlNYLP
 NP6EJEN4ijegBLCK08x92eYFQ+vXBShJQLcJbMNouWfY9g2rVd+e1oq+hlInhV7sQZpZ
 KxCw==
X-Gm-Message-State: AFqh2kqebTmmmGgj7K078Lx29jOBFC55UpMgPLCZbIIQAyBrG4cHv/Y+
 FayfPW+PE/fatKRNCSfUbABkGg==
X-Google-Smtp-Source: AMrXdXuslGmA1psv/BImwtT+vCgcM1mmsJIsu6DTNKX2UGWUkyyOlwD0Yl43/lZw2WQyQlHD+vDb0Q==
X-Received: by 2002:a05:6000:691:b0:296:8c1f:3786 with SMTP id
 bo17-20020a056000069100b002968c1f3786mr15177819wrb.9.1673029243548; 
 Fri, 06 Jan 2023 10:20:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j17-20020adff011000000b002a64e575b4esm1862163wro.47.2023.01.06.10.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 10:20:42 -0800 (PST)
Date: Fri, 6 Jan 2023 19:20:40 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH 1/2] drm/atomic: Allow vblank-enabled + self-refresh
 "disable"
Message-ID: <Y7hmeBBRqgnwQ2O6@phenom.ffwll.local>
Mail-Followup-To: Brian Norris <briannorris@chromium.org>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Sean Paul <seanpaul@chromium.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org
References: <20230105174001.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
 <Y7hgLUXOrD7QwKs1@phenom.ffwll.local> <Y7hjte/w8yP2TPlB@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7hjte/w8yP2TPlB@google.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Sean Paul <seanpaul@chromium.org>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 10:08:53AM -0800, Brian Norris wrote:
> Hi Daniel,
> 
> On Fri, Jan 06, 2023 at 06:53:49PM +0100, Daniel Vetter wrote:
> > On Thu, Jan 05, 2023 at 05:40:17PM -0800, Brian Norris wrote:
> > > The self-refresh helper framework overloads "disable" to sometimes mean
> > > "go into self-refresh mode," and this mode activates automatically
> > > (e.g., after some period of unchanging display output). In such cases,
> > > the display pipe is still considered "on", and user-space is not aware
> > > that we went into self-refresh mode. Thus, users may expect that
> > > vblank-related features (such as DRM_IOCTL_WAIT_VBLANK) still work
> > > properly.
> > > 
> > > However, we trigger the WARN_ONCE() here if a CRTC driver tries to leave
> > > vblank enabled here.
> > > 
> > > Add a new exception, such that we allow CRTCs to be "disabled" (with
> > > self-refresh active) with vblank interrupts still enabled.
> > > 
> > > Cc: <stable@vger.kernel.org> # dependency for subsequent patch
> > > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > > ---
> > > 
> > >  drivers/gpu/drm/drm_atomic_helper.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > index d579fd8f7cb8..7b5eddadebd5 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -1207,6 +1207,12 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
> > >  
> > >  		if (!drm_dev_has_vblank(dev))
> > >  			continue;
> > > +		/*
> > > +		 * Self-refresh is not a true "disable"; let vblank remain
> > > +		 * enabled.
> > > +		 */
> > > +		if (new_crtc_state->self_refresh_active)
> > > +			continue;
> > 
> > This very fishy, because we check in crtc_needs_disable whether this
> > output should stay on due to self-refresh. Which means you should never
> > end up in here.
> 
> That's not what crtc_needs_disable() does w.r.t. self-refresh. In fact,
> it's the opposite; see, for example, the
> |new_state->self_refresh_active| clause. That clause means that if we're
> entering self-refresh, we *intend* to disable (i.e., we return 'true').
> That's because like I mention above, the self-refresh helpers overload
> what "disable" means.
> 
> I'll also add my caveat again that I'm a bit new to DRM, so feel free to
> continue to correct me if I'm wrong :) Or perhaps Sean Paul could
> provide second opinions, as I believe he wrote this stuff.

I already replied in another thread with hopefully less nonsense from my
side :-)

> > And yes vblank better work in self refresh :-) If it doesn't, then you
> > need to fake it with a timer, that's at least what i915 has done for
> > transparent self-refresh.
> 
> OK! Then that sounds like it at least ACKs my general idea for this
> series. (Michel and I poked at a few ideas in the thread at [1] and
> landed on approx. this solution, or else a fake/timer like you suggest.)

Yeah once I stopped looking at this the wrong way round it does make sense
what you're doing. See my other reply, I think with just this series here
the vblanks still stall out? Or does your hw actually keep generating
vblank irq with the display off?

> > We might need a few more helpers. Also, probably more igt, or is this
> > something igt testing has uncovered? If so, please cite the igt testcase
> > which hits this.
> 
> The current patch only fixes a warning that comes when I try to do the
> second patch. The second patch is a direct product of an IGT test
> failure (a few of kms_vblank's subtests), and I linked [1] the KernelCI
> report there.

Ah yeah that makes sense. Would be good to cite that in this patch too,
because I guess the same kms_vblank tests can also hit this warning here?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
