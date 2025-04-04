Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A39AA7B95A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 10:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EEB10EB8E;
	Fri,  4 Apr 2025 08:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NLNvxFvD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F145D10EB8E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 08:54:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 12D21A46E49;
 Fri,  4 Apr 2025 08:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3BBC4CEDD;
 Fri,  4 Apr 2025 08:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743756862;
 bh=9NYzRZ1COzrlU7BYU5J5GjWaayrhQctCrdHr4Vdoiyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NLNvxFvD/kmV6TBTFpq/R0bePHNAkKVlEOJC4gcWjs7VdASkGVSXgYGS9iM/i7WkA
 7losMYFvh0kdVbvD+3uQ0FGTkPdFusaqF+Ad3baBU6mO4TBk9Ov/UpyREtBmCRRke4
 imjwC693PMBULfYAwPYF3dmUXO+itxyCXNQP3oqiuVVBFQeHzoKxrKfjxdPshzvbwa
 bFeYDsgWQHdoOYxtMyEX1Ze6UVHLihXw+h8YZkdommypBguHuDXgKmQTEo967ciKQh
 NSSLFte/Kimx9c6osf8wtCRYoi8CjDeftEx2Iw5OqZTzqJVDXyFdMBxdCkoACYyoEm
 dnWUuYtd09i1w==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1u0com-000000008Lg-0zNa;
 Fri, 04 Apr 2025 10:54:28 +0200
Date: Fri, 4 Apr 2025 10:54:28 +0200
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
Message-ID: <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com>
 <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
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

On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
> On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:

> > > @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > >       }
> > >
> > >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > +     if (ret < 0) {
> > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > +                         aux->name, ret);
> > > +             return -ENODEV;
> > > +     }
> > > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > +     if (ret < 0) {
> > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > +                         aux->name, ret);
> > > +             return -ENODEV;
> > > +     }
> > > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     /*
> > > +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> > > +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > > +      * the sink must use the MIN value as the effective PWM bit count.
> > > +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
> > > +      * correct brightness scaling on compliant eDP panels.
> > > +      */
> > > +     pn = clamp(pn, pn_min, pn_max);
> >
> > You never make sure that pn_min <= pn_max so you could end up with
> > pn < pn_min on broken hardware here. Not sure if it's something you need
> > to worry about at this point.
> 
> I am honestly not sure. I would hope that devices follow the spec and
> there is no need to be too paranoid, but then again we do live in the
> real world where things are... not so simple ;-).
> I will wait for further feedback from someone who has more experience
> with eDP panels than I have.

There's always going to be buggy devices and input should always be
sanitised so I suggest adding that check before calling clamp() (which
expects min <= max) so that the result here is well-defined.

Johan
