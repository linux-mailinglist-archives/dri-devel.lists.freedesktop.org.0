Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F79044683E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 19:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2535A6EC7E;
	Fri,  5 Nov 2021 18:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6AB6EC7E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 18:02:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id w29so3409295wra.12
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 11:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wxGKxEHljASS5rB7voToZN/AMD1KStDY75a5p4ffPiw=;
 b=en+3TI/Udn7dHS5mVo4zeHiPR4Z3SDUkMmKjZ8ZZdnvfwNqY+Pi6XKHHsxFJEuAGNY
 9vcecMNkSBJIyNBubF2ynEejPNlwjEAnQsmdmRseFesA47YZDrFZkFZ6bRgq3adRhDXi
 Ltm0Lk7y/jOtF1C9YJjWkS3hnUvZuVSuE+VJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wxGKxEHljASS5rB7voToZN/AMD1KStDY75a5p4ffPiw=;
 b=h3i0OFRnjpx0OAb1a+K+/ygkJQq4V0iqqIV32CdYjU2lC6qA31mC1/DWVimZoRW6w8
 AWNb7xd4Kzf4yGFq8iLQecRhS/4KjmTRUhCCMcqjul8F3iq0qavHTmHJKOMcLV0tsVfA
 ST0nZGnhsO0Z0UVfDHIxcP543YiPUgCS7KRCyWFcb0zVQ2prs82ANHLt9JATj4fKLsNp
 beL8edPZAhMgwClnF7l5gEGxjyHwHgo6sywPJ9FqKA7uVdBawKKqssPqgQwY3N5//JAX
 4RkJ0E8bPDPshp3eyPW7lDH2Eu84nzbBHypztBdqRSDuz1rYFkBfJMd83NZHupnwAzjJ
 HQOQ==
X-Gm-Message-State: AOAM5326seWRKY5W/ZbdIR5AFGN04BwiuHips8162wQn6zDrT6pPJ3ai
 HXluvII4w6bx/xTHDFzAaMp8jA==
X-Google-Smtp-Source: ABdhPJz7oIITjgoNuO3Z02F9mYAjRiZ4aSy7oJTIbdlboc/KTkkVDnS5eI8MygYZXCQKElN/uBe9XA==
X-Received: by 2002:adf:d20e:: with SMTP id j14mr66687298wrh.220.1636135352936; 
 Fri, 05 Nov 2021 11:02:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s13sm12001028wmc.47.2021.11.05.11.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 11:02:32 -0700 (PDT)
Date: Fri, 5 Nov 2021 19:02:30 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 02/13] drm/connector: Add helper to check if a mode
 requires scrambling
Message-ID: <YYVxtp9PZiR3ZOjp@phenom.ffwll.local>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-3-maxime@cerno.tech>
 <YYP+MX9gxZVafhKk@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYP+MX9gxZVafhKk@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Emma Anholt <emma@anholt.net>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 04, 2021 at 05:37:21PM +0200, Ville Syrjälä wrote:
> On Tue, Nov 02, 2021 at 03:59:33PM +0100, Maxime Ripard wrote:
> > --- a/include/drm/drm_modes.h
> > +++ b/include/drm/drm_modes.h
> > @@ -424,6 +424,21 @@ static inline bool drm_mode_is_stereo(const struct drm_display_mode *mode)
> >  	return mode->flags & DRM_MODE_FLAG_3D_MASK;
> >  }
> >  
> > +/**
> > + * drm_mode_hdmi_requires_scrambling - Checks if a mode requires HDMI Scrambling
> > + * @mode: DRM display mode
> > + *
> > + * Checks if a given display mode requires the scrambling to be enabled.
> > + *
> > + * Returns:
> > + * A boolean stating whether it's required or not.
> > + */
> > +static inline bool
> > +drm_mode_hdmi_requires_scrambling(const struct drm_display_mode *mode)
> > +{
> > +	return mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ;
> > +}
> 
> That's only correct for 8bpc. The actual limit is on the TMDS clock (or
> rather TMDS character rate as HDMI 2.0 calls it due to the 1/1 vs. 1/4
> magic for the actually transmitted TMDS clock).

Yeah we might need to add the bus format for the cable here too, to make
this complete.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
