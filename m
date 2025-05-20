Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349E9ABD17B
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 10:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9926610E40C;
	Tue, 20 May 2025 08:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IuyomNKA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A8410E40C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 08:06:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AC75E5C48B7;
 Tue, 20 May 2025 08:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82479C4CEE9;
 Tue, 20 May 2025 08:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747728404;
 bh=4M0Wi4/rDNAqAc2ojTcRtkCg6Ys4WEmngIzOvggZSro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IuyomNKA7cMDwiaQ2dkXWTkhV66p/cDqE8Noh7B1tcDLMfTllYYp4BijkpHM66g2c
 3RPStAgo9ktIu5krmFVcmGaeF6KfyvWjP1zzfQD0iJXgfQ+QrJ8/9ZglDwg0HLBGHs
 mz6GIO1BE21p/Tl1PNRBQjCYHaEyDUo0fB2hzGKTmANWi+wuuHHa33xVRGXKCOYoMg
 Gk5x7ofLGlehl5ssT8M9e7L16/hHIb2J5RLNfLDfd6s6ZWMWKPY8GLQKz7+JYue9Ls
 tvLainUR86mt5o9LUfZuKJMHag+je1TeK8mYvMqwDbjdQfZLVTy9bF+X+4GvFH+1D/
 ozaPQ7+QyOOWA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1uHHzk-000000001ZQ-2U7N;
 Tue, 20 May 2025 10:06:40 +0200
Date: Tue, 20 May 2025 10:06:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Message-ID: <aCw4EK_8C1KLb6MD@hovoldconsulting.com>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com>
 <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
 <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
 <CACr-zFA77ogDSNEOGd32Rdh3geqkL25T0BKtNdKzUdjrL0+9RA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACr-zFA77ogDSNEOGd32Rdh3geqkL25T0BKtNdKzUdjrL0+9RA@mail.gmail.com>
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

Hi Chris,

On Fri, Apr 04, 2025 at 02:24:32PM +0100, Christopher Obbard wrote:
> On Fri, 4 Apr 2025 at 09:54, Johan Hovold <johan@kernel.org> wrote:
> > On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
> > > On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:
> > > > > @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > > > >       }
> > > > >
> > > > >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > > +
> > > > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > > > +     if (ret < 0) {
> > > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > > > +                         aux->name, ret);
> > > > > +             return -ENODEV;
> > > > > +     }
> > > > > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > > +
> > > > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > > > +     if (ret < 0) {
> > > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > > > +                         aux->name, ret);
> > > > > +             return -ENODEV;
> > > > > +     }
> > > > > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > > +
> > > > > +     /*
> > > > > +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> > > > > +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > > > > +      * the sink must use the MIN value as the effective PWM bit count.
> > > > > +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
> > > > > +      * correct brightness scaling on compliant eDP panels.
> > > > > +      */
> > > > > +     pn = clamp(pn, pn_min, pn_max);
> > > >
> > > > You never make sure that pn_min <= pn_max so you could end up with
> > > > pn < pn_min on broken hardware here. Not sure if it's something you need
> > > > to worry about at this point.
> > >
> > > I am honestly not sure. I would hope that devices follow the spec and
> > > there is no need to be too paranoid, but then again we do live in the
> > > real world where things are... not so simple ;-).
> > > I will wait for further feedback from someone who has more experience
> > > with eDP panels than I have.
> >
> > There's always going to be buggy devices and input should always be
> > sanitised so I suggest adding that check before calling clamp() (which
> > expects min <= max) so that the result here is well-defined.
> 
> Makes sense, I will do so in the next revision.

It seems you never got around to respinning this one so sending a
reminder.

Johan
