Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B91A261B2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 18:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766CC10E53B;
	Mon,  3 Feb 2025 17:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kte3kwwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722C010E53B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 17:49:09 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so5308572e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 09:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738604948; x=1739209748; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tl7hb2dffFiUZtnUCsysXD2fQiSxN433uDcJunLyDI8=;
 b=Kte3kwwpzoYEh4xG8953Ql/3BBCEoKl6GsjDZ7t0UNA1oJXv4+5C/QnRM7UFEeRcpQ
 l0VinOmsA8SleoqaGO/swHjcujT6ooMYavvguqVjsHVExO8OiSMH8Tguu/N9Gw1upvfd
 pp6XBQWZuFGijtFeVk+n1KG3N6zy5cYzzt6zMfw8GhKvGocAcXeRyghj0IMRO1j7cvtA
 UnF44ySsjp5OiNUg3wESEg/ufxYW2ucjsEEz2PV6cwwvITpx4pZQTbPrR2ftFfZJ5dno
 cvLxMtojDClWoxpcK8vSkwo+d1Vavz+IIeSKG6QoLIcPjFujTfFCTQq+CLFlPmloZgfj
 YnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738604948; x=1739209748;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tl7hb2dffFiUZtnUCsysXD2fQiSxN433uDcJunLyDI8=;
 b=XSCrUPZmYGcZBGzYwDOi3jVw6rtaT+pSkvD2RZfiZ1YNIt4FLqzVkCKEEzGFBnt8qN
 HWU9gAMdnDsxUEGEmLzn/GjZfq40nBoE1JaYzcRIBXuq4rf614CF9qW8llgtOL8MOf6i
 vWZRxtSbIhPzCY75g1+dFNi8UgdgnjN55eNYjWD9y3uhT8NBAO/zm/dnolI6gjFRcP3V
 puoXxGEuqDqUD5rDQNUQcvxjaxMpHJ+DXnyFBBhbO+MkWGTDq9HQdzfaE6E1FCQQB/fn
 S849xjQmsQr2Qp+xSXFJccrfY6iFM1CjVqeVk+qmSl711ls+fEoTrPEbjh8LZmD1lBKz
 x61w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNG4iENz550YTRKsFbsMai9bUnvzwb1YJQEud+g0RJN1qsbWUNoXO6LGxjC2zNmw0LqU3eJ65Ox1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3ZzI66UZGSuJ+14ixiMBzcakOk3yd5BOrScG0ndmLV3VW2LTm
 Wiop2mWf5dTUVLKWz02Iuw7PSK5CUL8Bz3fk7gE2FCgqBh2f3E/gupiXxlqEexB0wo9D/rUgblE
 JezQ=
X-Gm-Gg: ASbGncsiWG8pD6cvb5rFIsFZvLtsjMN+PWAvO4k1f3QneKXu9/oRNd8JT5LPpR1G6sx
 ckzE4+NGhL4+JIshlRc60Iq6A69thp76WsSJHfO3Kkw4XkqtWUUDwsDhf1mS9diPflvF+OX9erQ
 QJW6RteIGePa6DyHXmJBqUWpOi8H+k3O8XyGFuB9M+xkIphwD8b5RnJRJc1q7yIC2eK8u9CNyhD
 nMHXwAVY9c3n96Twfai4wZP8Kevek6+BXmJfr3DXLtSJzGFS2EJ/33SAPnYUf1aB+qoe8Q9cvEm
 MD1G6ep4FO7BPYJcydE96g4eYMwHXUR+3id3NG/e01xm6+OeoqLM1mfn8lblS8SQ66ljM5U=
X-Google-Smtp-Source: AGHT+IFvISZSPO1dGObZpHPIDkgvz6DFnGdqtd4FYJvvIrUHjTGv2EHKj64Yr07Pt6wQMHxeMScNlQ==
X-Received: by 2002:a05:6512:3f18:b0:543:e0c9:1d97 with SMTP id
 2adb3069b0e04-543e4be3439mr7560020e87.12.1738604947562; 
 Mon, 03 Feb 2025 09:49:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebdf0edcsm1359166e87.25.2025.02.03.09.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 09:49:07 -0800 (PST)
Date: Mon, 3 Feb 2025 19:49:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 29/29] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
Message-ID: <sdyucn42l63puzt43bqgzildszsziceaucyfyjven3h3zy6iyj@pwlk4uhs6w43>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-29-9a2fecd886a6@kernel.org>
 <cfn3xpwyoo6lbugaxjwxvcq4l7eqbznlgnunxxfg4jnbrwtnpo@wdoizsk6ckvg>
 <20250203-orthodox-watchful-poodle-4018f4@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-orthodox-watchful-poodle-4018f4@houat>
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

On Mon, Feb 03, 2025 at 11:01:28AM +0100, Maxime Ripard wrote:
> Hi Dmitry,
> 
> On Thu, Jan 16, 2025 at 03:08:00AM +0200, Dmitry Baryshkov wrote:
> > On Wed, Jan 15, 2025 at 10:05:36PM +0100, Maxime Ripard wrote:
> > > The TI sn65dsi86 driver follows the drm_encoder->crtc pointer that is
> > > deprecated and shouldn't be used by atomic drivers.
> > > 
> > > This was due to the fact that we did't have any other alternative to
> > > retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> > > in the bridge state, so we can move to atomic callbacks and drop that
> > > deprecated pointer usage.
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 41 ++++++++++++++++++++---------------
> > >  1 file changed, 24 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > index b3d617505dda7d22b38c000fb79de46376adf3f1..c17d9486cf5c36d61eb00af2bdf9ba1b6f890ffd 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > @@ -242,15 +242,16 @@ static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
> > >  	u8 buf[2] = { val & 0xff, val >> 8 };
> > >  
> > >  	regmap_bulk_write(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
> > >  }
> > >  
> > > -static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
> > > +static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata,
> > > +				     struct drm_bridge_state *bridge_state)
> > >  {
> > >  	u32 bit_rate_khz, clk_freq_khz;
> > >  	struct drm_display_mode *mode =
> > > -		&pdata->bridge.encoder->crtc->state->adjusted_mode;
> > > +		&bridge_state->crtc->state->adjusted_mode;
> > 
> > At least we should document why is it safe to follow the crtc->state.
> 
> What do you have in mind there? crtc->state is a pointer that is widely
> used, what is there to document?

If I understand correctly, crtc->state is safe to be used during atomic
callbacks only or if the mutex is being held. However this function is
also being called from ti_sn65dsi86_enable_comms(), which is in turn is
used in ti_sn65dsi86_resume(). Is it safe? Why?

-- 
With best wishes
Dmitry
