Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEE9BE8C95
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CB210EBEA;
	Fri, 17 Oct 2025 13:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="eOI6bmux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D13610EBE9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:19:28 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-63c3c7d3d53so513077a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 06:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1760707167; x=1761311967; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CjGy9FZ+rKEjrnntHU4EtXwsShUyCILycOc13M5bggE=;
 b=eOI6bmuxEcb98b6SOgskPuDHYdXDGkHpBZJ4hbOSVe+PHl0eYS+ygFnaSUrxxWWue4
 p2uauXMzppHOpQM0S3F2/7NdcjVjdpgPbz8UVbtNhHZlTz1+g2dtVVbE2EzWRKRCB7CY
 ugi7NOZcJnNOfpRuNp66WN7ZLB2MlNLYwOCbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760707167; x=1761311967;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CjGy9FZ+rKEjrnntHU4EtXwsShUyCILycOc13M5bggE=;
 b=DA0P25jEG9ou7rLZ5LCfFy0QCRKr8DGkFCPvexlm8fUOyL0NwdnRk/Fcn7b7M5zGT9
 EQ90SaVvwUAjH5x0P3hW1qlvkqQUeAbwf1hhkvGSZwdBIjTYERIDsdHH+XMndgePtTOK
 tPbowhFtZg3gHWn8NkAbV128peqEJgFst80/SsHvtzf7FDzWo7QnSPoIFj+pT2VH2v+w
 BTCR5MdDUSTh+rxjzknxR/AqBfuomjDCtn80a+fcXaCJcB9F7Qb02Ig5zPb7UFOZ/Mn0
 JJwKPKai762dFrU64K7BkXBSMtAk+k4gnXRY3Oco08YWOUyLnMnTIe2TNKRQpWHvtmsn
 wiJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFSGYnLG6crn1YxrwwJG30CZjnbTtJmkbz0WwGVZfBnJIAnj/ZN0WUlHqBnBcr2NQSqVf4I1EAF18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxH+HVIKnE9w5DN0w3EkIC3ci10W5mjM/rXVjw6w9wNSwtlG3zk
 VBilGwxsn6aFP9GP6cHY31u4DzT7RuUxS8U/3G8SBmvs8Ro4wVH2B+6CNwG8e8TQw50=
X-Gm-Gg: ASbGncsUr/7peixuge9w7eRk6CCQevyqbGtVIP7vyEOfDclg7TyFdH8v6lmEX6CxJW1
 iB1H8ggCC4wC9QCt8RNO9wAz2PfJAcIbLd+4EuFQbc3b/XdtRZ4Sv4A3C8sgXiDDURjWOllIgm/
 dsNDJVYFRsmCh265dEtF3bDT6g2Wx3dYfPbSuAgk2Z6jtaEbU1d3Q0b+q24iIn1Kn+ouAkkKlzU
 WH7ieG5Ixjh90Af8iGJRKRhhJnc8GzCrWVx374OmVZWwIHr0KRDLHGlimGL1eZ8UvlmPVuEJQPM
 p4fZleWFOH4aJltLpabOdpr8UO6TzDysNAwzKXV5rWvsovZ9ZIDIzlVVU4W9te7HQAaG7H0uX2m
 KcpyK4WCi7YdBBTRE9AiwNqui0Yo75Y/x5lgV/4ECwH2DBF3nWotpR4HD6LlxsItcohaK3mhrwg
 s9ARL0M9HgGJAuVNJPS4nsRQ==
X-Google-Smtp-Source: AGHT+IF7xNCCKtq8yrDup53uFHw15lFv/JcHO9zr7mifpvlVmxJCIL5ZwW7/XX61lvzCkalWE2LFdg==
X-Received: by 2002:a17:907:74e:b0:b04:67f3:890f with SMTP id
 a640c23a62f3a-b6475e09c31mr453693466b.33.1760707166624; 
 Fri, 17 Oct 2025 06:19:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5cb9e7a23dsm818970666b.23.2025.10.17.06.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 06:19:25 -0700 (PDT)
Date: Fri, 17 Oct 2025 15:19:23 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/29] drm/encoder: Create get_current_crtc hook
Message-ID: <aPJCW7MfmuxwkL59@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-16-14ad5315da3f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-drm-state-readout-v1-16-14ad5315da3f@kernel.org>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Tue, Sep 02, 2025 at 10:32:44AM +0200, Maxime Ripard wrote:
> In order for drivers to implement drm_connectors atomic_state_readout
> hooks, they need to query the hardware and lookup the CRTC to set
> drm_connector_state.crtc.
> 
> It should be easy enough for drivers that are tightly integrated from
> the CRTC to the connectors, but if the driver uses bridges, there's no
> coupling between the CRTC and encoder, and the bridge driver.
> 
> The only thing the bridge has access to is the encoder, but the
> relationship between a CRTC and an encoder isn't a fixed mapping at the
> framework level, and thus the bridge can't deduce which CRTC is feeding
> its encoder.
> 
> Thus, let's create a new hook for encoders to implement to return the
> CRTC they are currently connected to.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_encoder.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index 977a9381c8ba943b4d3e021635ea14856df8a17d..7abb5e35ac950c941b56fc311a52789bbc427df6 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -86,10 +86,23 @@ struct drm_encoder_funcs {
>  	 * @debugfs_init:
>  	 *
>  	 * Allows encoders to create encoder-specific debugfs files.
>  	 */
>  	void (*debugfs_init)(struct drm_encoder *encoder, struct dentry *root);
> +
> +	/**
> +	 * @get_current_crtc:

Bit a bikeshed, but crossed my mind reading this: I think some kind of
prefix for all the state-readout/comparison related stuff and maybe even
putting all the new helpers into a new c/h files would be good. That way
we have a nice place for a DOC: section and people have a better chance of
understanding what they can ignore. Might still be good to put a standard
one-sentence explainer here that this is part of the state
readout/fastboot support and maybe link to the main helper function for
that.

For the prefix I'm lacking good ideas, but maybe asro for atomic state
readout? It's at least unique (to my knowledge), unlike all the other
shorthands I could come up with (like atomic fast boot and afb). Spelling
it out is way too long unfortunately.

Oh also, since this is part of the optional helpers it should be in
drm_encoder_helper_funcs, only uabi interfaces should be put into these
here. This also applies to all the other hooks.
-Sima


> +	 *
> +	 * This optional hook is used during initialization to read out
> +	 * the initial state by connectors that support atomic state
> +	 * hardware readout.
> +	 *
> +	 * Returns:
> +	 *
> +	 * The CRTC currently associated with the encoder if enabled, NULL otherwise.
> +	 */
> +	struct drm_crtc *(*get_current_crtc)(struct drm_encoder *encoder);
>  };
>  
>  /**
>   * struct drm_encoder - central DRM encoder structure
>   * @dev: parent DRM device
> 
> -- 
> 2.50.1
> 

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
