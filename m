Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B93B1D5E0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 12:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0FE10E0B4;
	Thu,  7 Aug 2025 10:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rjg2wBuH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB2A10E0B4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 10:34:54 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3b8de193b60so383538f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754562893; x=1755167693; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+jqpfHFtr9RJd+Rj5jDYwLXh+hHq7pFdE9Sw57Atqmk=;
 b=Rjg2wBuHy8W51PmHJ9BfaRFH6qvyRaRTd5HvK9+wi1v+Bgvpg1Mhk2cYqD+vorsIz4
 a4Ef7J5tLsX9KsA1cQ+TX9D5lxY2mQHGWtv12vgS9UldFT5ia5pNLY4Alpz4t4TNqhVJ
 G779pSbiw5JV/X6JPUE1LuR1CgS4T9F737SsHwZXylWqiOC4h7UTb7BESxurn2lKhN0/
 GprTSy4SYZAVX3u/Z/X5rp5x1kvcp7ysk/awQptNHRx7VVY2j9iAGE7L7m2V7WX20dYp
 G1NGstdiev1lOcOTb76PqvFDMR2j/A1/2X/C9AbbSqBp8+gzMSjrzXHrxBaV1OC9MyaR
 FNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754562893; x=1755167693;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+jqpfHFtr9RJd+Rj5jDYwLXh+hHq7pFdE9Sw57Atqmk=;
 b=uazDNrV+7KtyGpwtdfbBuqwZyObwIhOknF+/yBd1I9+KfNZI2JVY+VoB5vxTolWx+Z
 YUvt5Y7EQB7JB/6BIWxlbWPik6PP8VxL1Gr1cuJMHQpLcMAtjGf3dUuTHvPRlMdOBOyk
 2YQclS+vam79MWNXTtb1MliRhlRSS4D4dUK7mCOhdwThL9X06ygkYpVnOlbaoX/VZbwg
 U3ho3TeT9Qs067FtOtjh6JexEm6/umT1NxYQpTeh3d7UwRNsD2/7lrFJDLoLNktj+N8z
 OV+VO8e/XRKT8eFUetJEMN8Mfv2lqLEvy7MZSKSPiKfExShFyolj1QIg7kQy4mXeUfiL
 VLig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhvHtGSW18y13/lG3yGPjTPdUX7afM14arCc0b7I1DKa4VjurH7NwF6K3tVWRBZyc4vCxqAN8bzKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywh49NW14dumdKEOgkutUGgRfjhjl+ey2J+bbGVbC/O5odiaEPJ
 HUb10kforPobca41BQhH1q9x9jbaPjhey3zqqQQ6nXoz8ZRBAc5c/IwfTbfqle+/stk=
X-Gm-Gg: ASbGncvl3HkOTZXzUF+5NGALEuP4u0KfreDZrjE1Znw0rK5CPqOzE7kFtJfHWQk9svd
 vbL4yoivRigWAQj/xPtAEYjqBWrL33h+8mFB8XeZT5vJJqT9Gn5Dkr+Yd7cT2uu4zpxrSpwPl//
 PwM2ROFCkn+O5Ehk4D4ZJHZjnXRPwaFbbriWKZAm8vMOqyit/qkP45heqYDtwxpIgYdYF44vjJM
 muFjROotHRoGVVEDfdNOitLxKZxd5LDdQLnRe0VHfcB7yodwjhRYjZ1frgP/BkZ7E/a/pkqy2PC
 jfCMcrv/WD9zQE7jdlfOXK5P/OjLM3cjJhqY/ruvjn63Fi80KnMybM3gJnGTEE/Emjk4VESq6zK
 FRgAUE3c10pkooqV7dbfyH+RCEWk=
X-Google-Smtp-Source: AGHT+IEJZFFSnC6OyV3Ckz3ldGk5h0RG3Okc+NeFrocarUAZUjxcjd1haqhnntbT67+wRuAV6TUqug==
X-Received: by 2002:a05:6000:2f86:b0:3a0:b84d:60cc with SMTP id
 ffacd0b85a97d-3b8f41a837fmr5055520f8f.2.1754562892893; 
 Thu, 07 Aug 2025 03:34:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b8ff860acbsm70000f8f.51.2025.08.07.03.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 03:34:52 -0700 (PDT)
Date: Thu, 7 Aug 2025 13:34:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, wens@csie.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jernej.skrabec@gmail.com,
 samuel@sholland.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: backend: Fix error pointers in
 sun4i_backend_atomic_check
Message-ID: <aJSBSLvIeSpvaYpK@stanley.mountain>
References: <20250314012029.668306-1-chenyuan0y@gmail.com>
 <20250314-prophetic-attentive-platypus-3ab214@houat>
 <CALGdzurT1_fY_o8Hv92j4+XFQHu1iHRzqVtZAM8upHYBPfA1BA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALGdzurT1_fY_o8Hv92j4+XFQHu1iHRzqVtZAM8upHYBPfA1BA@mail.gmail.com>
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

On Fri, Mar 14, 2025 at 11:00:26AM -0500, Chenyuan Yang wrote:
> HI Maxime.
> 
> Thanks so much for pointing that out!
> 
> How about such a patch?
> 

This patch is corrupted so we can't review it.

> diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c
> b/drivers/gpu/drm/sun4i/sun4i_backend.c
> index 2dded3b828df..5ad0e90d3e6b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> @@ -490,9 +490,14 @@ static int sun4i_backend_atomic_check(struct
> sunxi_engine *engine,
>   drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
>   struct drm_plane_state *plane_state =
>   drm_atomic_get_plane_state(state, plane);
> - struct sun4i_layer_state *layer_state =
> - state_to_sun4i_layer_state(plane_state);
> - struct drm_framebuffer *fb = plane_state->fb;
> + struct sun4i_layer_state *layer_state = NULL;
> + struct drm_framebuffer *fb = NULL;

No need to initialize things like this.  NULL isn't a valid pointer.
This just disables static checker tools from finding uninitialized
variable warnings so all the expense of writing the checker tools is
now wasted.

regards,
dan carpenter

> +
> + if (IS_ERR(plane_state))
> + return PTR_ERR(plane_state);
> +
> + layer_state = state_to_sun4i_layer_state(plane_state);
> + fb = plane_state->fb;
> 
>   if (!sun4i_backend_plane_is_supported(plane_state,
>         &layer_state->uses_frontend))
> -- 
> 
> -Chenyuan
> 
> On Fri, Mar 14, 2025 at 2:17 AM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > On Thu, Mar 13, 2025 at 08:20:29PM -0500, Chenyuan Yang wrote:
> > > The function sun4i_backend_atomic_check was dereferencing pointers
> > > returned by drm_atomic_get_plane_state without checking for errors. This
> > > could lead to undefined behavior if the function returns an error pointer.
> > >
> > > This commit adds checks using IS_ERR to ensure that plane_state is
> > > valid before dereferencing them.
> > >
> > > Similar to commit da29abe71e16
> > > ("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed").
> > >
> > > Fixes: 96180dde23b7 ("drm/sun4i: backend: Add a custom atomic_check for the frontend")
> > > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > > ---
> > >  drivers/gpu/drm/sun4i/sun4i_backend.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
> > > index 2dded3b828df..a8e0e2123764 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> > > @@ -490,6 +490,10 @@ static int sun4i_backend_atomic_check(struct sunxi_engine *engine,
> > >       drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
> > >               struct drm_plane_state *plane_state =
> > >                       drm_atomic_get_plane_state(state, plane);
> > > +
> > > +             if (IS_ERR(plane_state))
> > > +                     return PTR_ERR(plane_state);
> > > +
> >
> > This introduces a build warning. You shouldn't mix declarations and code.
> >
> > Maxime
