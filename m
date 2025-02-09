Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0334FA2DB41
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 07:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CC510E036;
	Sun,  9 Feb 2025 06:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dwLr1054";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1821C10E036
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 06:12:56 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-30795988ebeso32502551fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 22:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739081575; x=1739686375; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4Fe0VF3HeXgNvgWt109zmaR5H6W57xLfEvBY6YhhqTM=;
 b=dwLr1054EIcdmv5Yq6OR1Zun1c5bEelQBP958dh9d1OveHH07fCOvgXHL33Eevex51
 PQZXTyA13BydXxZUzs5+qFZiEKCrkWoEGP6JCQRWxb50uEAQ6Mirrvp4dpyBETWOG8Zr
 dtgnH/ebUMr21w+F3MyXAlmmIkMzE2ifKSOzofAjal5dIPe4vkW0h5bw4STJkglsCFvV
 YvZw6wxyNyPa4qymfufT/zVIIFkoG7teWrox/TUcOsMw1JAKwE8zshe7DSO419KfG/WW
 LmCp5pD8HZlyCypNZbHEV+4TMVlzMa/IwG8EyvT/Mp9e++LZLZXQyZRHPYxZRazOc/Ya
 kG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739081575; x=1739686375;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Fe0VF3HeXgNvgWt109zmaR5H6W57xLfEvBY6YhhqTM=;
 b=hwedunQUBlRpqOfFSZUvpJXIKY0wEDLjIiSSnWZ4xiPFnvDqHaacbbeGjoahTyL9ND
 dQKtKgxMf7DFZlAEUbzJvm39p2DQ4DRnccYZyBzoYrJG+kKVUvI3JDK2NviKi/aCMTWp
 4N5WEEPQfWalGR4ONVDrlV3QzgK32iegV3Hazvz2ywVCjd6ZIVDPFWKRbvP0eVZbhwok
 MX6FcaGbOIimwZOg/T934XqeAlA+3wVGEeHsh2E85NFLmsFGBxvGaHvvYi6iMGMafydn
 BgR1WkTuKzVn5BFdf9Hwi8uNU34jSgwe5pHYQxvYuLJNb9xz7zAQUJTzwGZfV+WtNSvl
 Dj9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJfuSnMYRiiKlDc8wK+Qw/zkQdX84Y3MCmm1fDgzQZkHPHXsC4pq1wGd59zldkZ2h+usQa9zvC4tQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFdxXAwo5852PfTdeWkCnDTi+9qrSXdJiBPpe/1C7JTVzobr4M
 SE9yxcmJA9APiN6BUgxb2rRZPFxFEe0ktaRhkORvoEQgrbVw3Ypob2TtMPqmTuw=
X-Gm-Gg: ASbGncvOEBd70g4Ho7x7IcuDnQFmTxfWKdE/NJvnkQxHQACFNic9+/VxiU/I55aCTME
 cdfGYyZUlAiNtA5uMmSQXuZtvlrjs8iqJRRqHBnX/EBbo80sD4Z6LoxBRxHTacLu9C+RM/nik+W
 0Lyni76Imx2foOyCHSlcRpzEVjFVl4M0DBUpMPQHtWK3fQ4nyB8rBOH9NsrcyIHj0hTC5FgIfcG
 nkn7n8FCLRt8JTpyIrIkER8/MGt1E73a5nHOXWwCa9MIIp6DNK+xgSKV/IaBY+gVxX9McZ9Dd+R
 JK4FEiAFLIS7iLTvF3hrasbSb6zqHIkLZ0Gv0D560Ndixz9UYyfzJmGvEFzXPkJbXGk2glE=
X-Google-Smtp-Source: AGHT+IG0zA2FKGk15ye6q/mCoGATdsQEyiqMtLOacPVHzVEYQoHiMNvdIJk/YGglXVnIXqv4CG72qA==
X-Received: by 2002:a2e:9a84:0:b0:308:e54d:618a with SMTP id
 38308e7fff4ca-308e54d637cmr6866631fa.29.1739081574778; 
 Sat, 08 Feb 2025 22:12:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308e80067fdsm1789901fa.25.2025.02.08.22.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 22:12:53 -0800 (PST)
Date: Sun, 9 Feb 2025 08:12:51 +0200
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
Subject: Re: [PATCH v2 28/35] drm/bridge: Provide a helper to retrieve
 current bridge state
Message-ID: <ogbqg2nchpyctndxvsox7zfnvmarlztxvjtxf74xftvaswz73y@54smvncbpkbe>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-28-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-28-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:56PM +0100, Maxime Ripard wrote:
> The current bridge state is accessible from the drm_bridge structure,
> but since it's fairly indirect it's not easy to figure out.
> 
> Provide a helper to retrieve it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_bridge.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index cf7ab89e652a982510ae9df1f5972b9c6eb13cf2..7a3664770c3ab8634a69e953b37a30ac467139b3 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -955,10 +955,31 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  {
>  	return NULL;
>  }
>  #endif
>  
> +/**
> + * @drm_bridge_get_current_state() - Get the current bridge state
> + * @bridge: bridge object
> + *
> + * This function must be called with the modeset lock held.
> + *
> + * RETURNS:
> + *
> + * The current bridge state, or NULL if there is none.
> + */
> +static inline struct drm_bridge_state *
> +drm_bridge_get_current_state(struct drm_bridge *bridge)
> +{
> +	lockdep_assert_held(&bridge->base.lock.mutex.base);

Please use drm_modeset_lock_assert_held() instead.

> +
> +	if (!bridge)
> +		return NULL;
> +
> +	return drm_priv_to_bridge_state(bridge->base.state);
> +}
> +
>  /**
>   * drm_bridge_get_next_bridge() - Get the next bridge in the chain
>   * @bridge: bridge object
>   *
>   * RETURNS:
> 
> -- 
> 2.48.0
> 

-- 
With best wishes
Dmitry
