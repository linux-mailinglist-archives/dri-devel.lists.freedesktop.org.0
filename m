Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C28B14357E4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 02:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D586E3FC;
	Thu, 21 Oct 2021 00:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E696E3FC
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 00:40:17 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id r17so4698345qtx.10
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 17:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VZPJC135e4gI9IE4SikWPG4kEQVKeYEug43Q5Pno9ck=;
 b=AfzHfuETj1Nfd6Wzw8No2kFiEtNxiTgBLp87S7AlOjU/Wol8WR57JUcKlo6ocGKOQO
 MjnOma3wiQJc117zzRj7Cw9p+lCoBIQS3b5edJRrDvaqwUhvgWMcIMeEvs/xRNtF6BDp
 IKCAX0MET4ijVYWY5OxcAmYc7i7vggkajW0ZHLD2efo9l7i7s4Q7OyJrILg4JOfYruDI
 d5jLFxhRzJ/NMa3gOVmfRiVR4APMXcRcuv7g4s5g+mX9b96l5aM53UXrqZmosS7B0Ou1
 8OHxslQNZbikUAyhDRpo8Hk4mfft8ylPMzlHiMZar2fcv4+fGhA8UmAzdqxncgPiFV8M
 2fqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VZPJC135e4gI9IE4SikWPG4kEQVKeYEug43Q5Pno9ck=;
 b=VO+UwapMMyrz6MdXlNmo1sdts2qoVVFCzdoDfVKR0xpjgP6BJnGrkhdYO5ccBsRnfc
 jYmvlBJTFZ4IZGlSSBQquKa03zslOSvxnSf1DUK91RjVyAoods0VwSFvJYOO1utNo6xm
 iHE5+pN4eFwg3wOB0caDTnJfAzrHKjHbmP9qcRuZvuF+J8XS2gyGb2YehQ9Qdg2tPEUl
 WsNSJRfxwvLYZqk2pR9OAKhnKg2Xf5PbdxpuaZTeKWKTHN52vlQgDKzzNMPs/NHWS3Ww
 j/deys3/zMRrIJ3QCXsU1SprR1jqcLjddwgFZBclHaaITtQHo6ZUdG3Wv0NPn3hEqT0I
 JNOA==
X-Gm-Message-State: AOAM530Y6GvNWGZ+GxzZm+PLBRBkzvLG5kDytKad7wuifXdHGOTQmXMU
 8030HB4MaZEJROzEsHB0iDz4HA==
X-Google-Smtp-Source: ABdhPJy7GDVoAFKf9GLnenHotfcaiYNRCR48UP6AkEWiVP2ChDdjguebP5TRHsimUXRxtaTDCdpwjQ==
X-Received: by 2002:ac8:7f03:: with SMTP id f3mr2823240qtk.320.1634776816940; 
 Wed, 20 Oct 2021 17:40:16 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id w185sm1818625qkd.30.2021.10.20.17.40.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 20 Oct 2021 17:40:16 -0700 (PDT)
Date: Wed, 20 Oct 2021 20:40:15 -0400
From: Sean Paul <sean@poorly.run>
To: Brian Norris <briannorris@chromium.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 stable@vger.kernel.org, Zain Wang <wzz@rock-chips.com>,
 Tomasz Figa <tfiga@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Make PSR-disable non-blocking
Message-ID: <20211021004015.GD2515@art_vandelay>
References: <20211020161724.1.I67612ea073c3306c71b46a87be894f79707082df@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020161724.1.I67612ea073c3306c71b46a87be894f79707082df@changeid>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Wed, Oct 20, 2021 at 04:17:28PM -0700, Brian Norris wrote:
> Prior to commit 6c836d965bad ("drm/rockchip: Use the helpers for PSR"),
> "PSR disable" used non-blocking analogix_dp_send_psr_spd(). The refactor
> accidentally (?) set blocking=true.

IIRC this wasn't accidental.

The reason it became synchronous was:
 - To avoid racing a subsequent PSR entry (if exit takes a long time)
 - To avoid racing disable/modeset
 - We're not displaying new content while exiting PSR anyways, so there is
   minimal utility in allowing frames to be submitted
 - We're lying to userspace telling them frames are on the screen when we're
   just dropping them on the floor

The actual latency gains from doing this synchronously are minimal since the
panel will display new content as soon as it can regardless of whether the
kernel is blocking. There is likely a perceptual difference, but that's only
because kernel is lying to userspace and skipping frames without consent.

Going back to the first line, it's entirely possible my memory is failing
and this was accidental!

Sean

> 
> This can cause upwards of 60-100ms of unneeded latency when exiting
> self-refresh, which can cause very noticeable lag when, say, moving a
> cursor.
> 
> Presumbaly it's OK to let the display finish exiting refresh in parallel
> with clocking out the next video frames, so we shouldn't hold up the
> atomic_enable() step. This also brings behavior in line with the
> downstream ("mainline-derived") variant of the driver currently deployed
> to Chrome OS Rockchip systems.
> 
> Tested on a Samsung Chromebook Plus (i.e., Rockchip RK3399 Gru Kevin).
> 
> Fixes: 6c836d965bad ("drm/rockchip: Use the helpers for PSR")
> Cc: <stable@vger.kernel.org>
> Cc: Zain Wang <wzz@rock-chips.com>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> CC list is partially constructed from the commit message of the Fixed
> commit
> 
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index b7d2e4449cfa..fbe6eb9df310 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1055,7 +1055,7 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>  	psr_vsc.db[0] = 0;
>  	psr_vsc.db[1] = 0;
>  
> -	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
> +	return analogix_dp_send_psr_spd(dp, &psr_vsc, false);
>  }
>  
>  /*
> -- 
> 2.33.0.1079.g6e70778dc9-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
