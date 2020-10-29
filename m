Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 808B629E6A1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DAD16E894;
	Thu, 29 Oct 2020 08:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7A96E894
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 08:51:08 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k18so1625679wmj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 01:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cDd95LZV0TwPx9wdyCCMZmzh5fYR+hqDBeGlboAji9U=;
 b=kqfds7Bp4W6z9KuFzDVR9T6Tl5PsxJrR2qLNmSLLkDSDx2OgCHeINisTB3uGekRXcH
 ypFsRLcJCs2y9YfPBOA99oCYcwZwKLznndQiMldjMbpQ3QW14jCqMF35J3uqY5AUP7FH
 TDWJ5LckfasONVE1r8EFkrgF2J/7z2TR2T658=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cDd95LZV0TwPx9wdyCCMZmzh5fYR+hqDBeGlboAji9U=;
 b=trHGfBIwP1AK6kpByEvpw4ZYfIcEFqsNrvwwRSwfwQ9B1g0i8n2VFAjJKtxEgZ8MlE
 +f7irXs6eSeCmgyeTcfOwea/tfx707T+8T79kanvdaFiPPRfst9TYIdMXm7hMOZ+F8E2
 72IAvOM0F+gS82xM0SikC7JgtAHnWrPQhfbljL4aEaoi4Q/Kj8/0HFFAxH1M/S7hT0GJ
 kSJiCyxFIyqFjUHCgVoruaJZJfrgTZxf2W54NjiVW4slGZS0fSAuriBY0v+ZhsiVpqno
 OQRn38zTmFrkzQesJImbtMW8T+G4QS58WBtfR7YxCUmaCTkqXvmKm7Wt2oHu0pHZB69t
 cjIA==
X-Gm-Message-State: AOAM533v8ygXXNQkCV3twoEfN+TVV4gKgoK3m6i5vlL/has4Ig9Xa0X6
 d5N8+W1Q7TTCOwhQUDtZRVe/4w==
X-Google-Smtp-Source: ABdhPJx8StI6TRBf10Vf2PWnL/5voNMrzNUFCeJkXzaHkB7puxbbn91kh3E9XUeAD8WZA4ySma0R1Q==
X-Received: by 2002:a1c:9a93:: with SMTP id c141mr3345421wme.168.1603961467630; 
 Thu, 29 Oct 2020 01:51:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f7sm3892055wrx.64.2020.10.29.01.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 01:51:06 -0700 (PDT)
Date: Thu, 29 Oct 2020 09:51:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 4/7] drm/vc4: kms: Document the muxing corner cases
Message-ID: <20201029085104.GA401619@phenom.ffwll.local>
References: <cover.3eb3532def69f3610b18104e45b7274bbdc1b0a0.1603888799.git-series.maxime@cerno.tech>
 <aa88b754887b0a53b33e6a2447a09ff50281fd54.1603888799.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa88b754887b0a53b33e6a2447a09ff50281fd54.1603888799.git-series.maxime@cerno.tech>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 28, 2020 at 01:41:01PM +0100, Maxime Ripard wrote:
> We've had a number of muxing corner-cases with specific ways to reproduce
> them, so let's document them to make sure they aren't lost and introduce
> regressions later on.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_kms.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 4aa0577bd055..b0043abec16d 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -612,6 +612,28 @@ static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
>  };
>  
>  
> +/*
> + * The BCM2711 HVS has up to 7 output connected to the pixelvalves and
> + * the TXP (and therefore all the CRTCs found on that platform).
> + *
> + * The naive (and our initial) implementation would just iterate over
> + * all the active CRTCs, try to find a suitable FIFO, and then remove it
> + * from the available FIFOs pool. However, there's a few corner cases
> + * that need to be considered:
> + *
> + * - When running in a dual-display setup (so with two CRTCs involved),
> + *   we can update the state of a single CRTC (for example by changing
> + *   its mode using xrandr under X11) without affecting the other. In
> + *   this case, the other CRTC wouldn't be in the state at all, so we
> + *   need to consider all the running CRTCs in the DRM device to assign
> + *   a FIFO, not just the one in the state.
> + *
> + * - Since we need the pixelvalve to be disabled and enabled back when
> + *   the FIFO is changed, we should keep the FIFO assigned for as long
> + *   as the CRTC is enabled, only considering it free again once that
> + *   CRTC has been disabled. This can be tested by booting X11 on a
> + *   single display, and changing the resolution down and then back up.

This is a bit much. With planes we have the same problem, and we're
solving this with the drm_plane_state->commit tracker. If you have one of
these per fifo then you can easily sync against the disabling crtc if the
fifo becomes free.

Note to avoid locking headaches this would mean you'd need a per-fifo
private state object. You can avoid this if you just track the
->disabling_commit per fifo, and sync against that when enabling it on a
different fifo.

Note that it's somewhat tricky to do this correctly, since you need to
copy that commit on each state duplication around, until it's either used
in a new crtc (and hence tracked under that) or the commit has completed
(but this is only an optimization, you could just keep them around forever
for unused fifo that have been used in the past, it's a tiny struct with
nothing hanging of it).
-Daniel

> + */
>  static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
>  				      struct drm_atomic_state *state)
>  {
> -- 
> git-series 0.9.1
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
