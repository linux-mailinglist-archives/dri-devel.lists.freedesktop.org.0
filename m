Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 768E53FE7F0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 05:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C92E6E41A;
	Thu,  2 Sep 2021 03:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38566E41A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 03:22:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA6E745E;
 Thu,  2 Sep 2021 05:22:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1630552957;
 bh=xzDeYUiodNhGwMnAHeVnklX04indURX8IxKXY2cwky4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oj3fLhRtr14D2drudtMcLxoAQFJdxGLIoRA38z4R6BFs8qTMrZlI/c2KEY09Jkp7p
 Cx6KZulYkZpYYs79XAyH71wyyAlK9OFs4cp8wrP88uvPzs9QCZ86ldaNYMqnwBbrAK
 tP1OgbI2g+AkVDZEO8agj65WiVGuwj7qd+EL4F6E=
Date: Thu, 2 Sep 2021 06:22:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm: Add drm_fixed_16_16 helper
Message-ID: <YTBDbLzmf8aYInSM@pendragon.ideasonboard.com>
References: <20210901175431.14060-1-alyssa@rosenzweig.io>
 <YS/CsCSqKeFYF9x7@pendragon.ideasonboard.com>
 <YTAqbAhoYPe6Stjn@sunset>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YTAqbAhoYPe6Stjn@sunset>
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

On Wed, Sep 01, 2021 at 09:35:40PM -0400, Alyssa Rosenzweig wrote:
> > Missing documentation :-)
> 
> Ack.
> 
> > > +static inline int drm_fixed_16_16(s32 mult, s32 div)
> > 
> > You should return a s32.
> 
> Ack.
> 
> > The function name isn't very explicit, and departs from the naming
> > scheme of other functions in the same file. As fixed-point numbers are
> > stored in a s64 for the drm_fixp_* helpers, we shouldn't rese the
> > drm_fixp_ prefix, maybe drm_fixp_s16_16_ would be a good prefix. The
> > function should probably be named drm_fixp_s16_16 from_fraction() then,
> > but then the same logic should possibly be replicated to ensure optimal
> > precision. I wonder if it wouldn't be best to simply use
> > drm_fixp_from_fraction() and shift the result right by 16 bits.
> 
> Sure, I'm not attached to the naming ... will wait to hear what colours
> everyone else wants the bikehed painted.
> 
> As for the implementation, I just went with what was used across
> multiple drivers already (no chance of regressions that way) but could
> reuse other helpers if it's better..? If the behaviour changes this goes
> from a trivial cleanup to a much more invasive changeset. I don't own
> half of the hardware here.

But except for msm which may need testing, all other drivers use the
existing FRAC_16_16() macro with constant arguments, so it shouldn't be
difficult to ensure that the new function gives the same results.

-- 
Regards,

Laurent Pinchart
