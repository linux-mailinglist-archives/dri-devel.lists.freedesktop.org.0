Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907D9A45554
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 07:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE2D10E84C;
	Wed, 26 Feb 2025 06:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QlnZK3n5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0AD10E84C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 06:12:37 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-30a28bf1baaso56556941fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 22:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740550353; x=1741155153; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IaruDcylLEm+Tejyz9t/dN5GAS7R88L1RYxNud2d5xM=;
 b=QlnZK3n5o/+gDZq7npom0leypytFHoVglL6LOZA5AVkStA/30hqA0cgEdNh1vAAayA
 OBcVHoabo4aeoEgkch3yGDx5kAEhL+QBZXCqiD4JSxPlM1EAyR+LHEYZePulsBu7XqtT
 sImTvJiXS5RBlUbU7N5wGP+T4nCyEIlNmNtXK+NU1l8KXiv/CKERFVaCZ10FP0eXbrXi
 mY6KXtu0IzqTD4tpkHhJGdpwS7gK3xPOBke/ZX2rIovNuZxuMJoczxHuP7YT4DYFVTHt
 U7oovzUAt413inz085w/w2UC5EcRzE4AFqfLNmvX7f5uTbKalkgpEMRmrmron3WDIEJy
 WkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740550353; x=1741155153;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IaruDcylLEm+Tejyz9t/dN5GAS7R88L1RYxNud2d5xM=;
 b=P5/LFMc83qEf84ch641Fk/QuK105hvPrlyzXkz85p/rC18lDTIDBwqhiw276wI0L9X
 8p2t4rzxCejf/5XIISOpMJCGPMJ170BxuRYLAB8xP4g2u+qD+mBM1LMmRt+P7ApG+c3M
 6wEA2QhdaYnanvGQDeG7NcOB7PSP3rALqxlQCiXeSB6gJWzrVLz/TuoLctpbALxWzjBV
 tUAwr+xWGa/t5EHDUzG2mpSFo1fBLo71R1fWCiYUg52oV2yJW+AyA5CaSTCX+3C7c/EV
 eIwTjTeopXxJqCoRMvz7eq1xcMk4D393Bjuumli3NJl/0kWh636v33pC9upyueqjccqO
 6zDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD7IEtIDaPnFLFx06eWRAbxZPP/FhKtgiCUOT/P8FNS2UqhYK+KfGfdWdC9BqHsycRCL9hdv6Uhz4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwUNyBpzBm/Fs7BQ5xyDcFHuINZBVtjROfHFXRRcgSZSyVFP3s
 emFmXWPuyIjdkYYnL7JmQlwqzcXupiAj7VlbCsuLkKCSKv9hkkV+0+KZVUiu/8U=
X-Gm-Gg: ASbGncvgcil1YajXfOk8NoBuV/KU++h3hs77asakSBKBDk1zzVpiDga3b4ZUfxV8uIh
 FUJ66yQqFDIaReJ+DAUr7jLxuuwX5RHht1K9ZK7jDAn+hf+iYBKxI2zpE4lppYvevTGudwWjt1J
 Os3zia5ePwUjnXIyD9sU1Etl7Q48SqSws7pDWR9XbiHVYi9aMQy/0wci1sdecuxq1vQrc0FacFt
 9+Tt2+vdoMrNfPca26kixwMTHLyZccn3pGXNRdN56edACFHnUaBCbfUOg/ur31VoOobIenxsJXw
 f+aOxJSceKuq+sGrnkRpKpHugDV0wBk45J0WJQPRtyt2pLmZsQDOHPZYBJB+LHyso4ZN0WBadNx
 5i7HrNQ==
X-Google-Smtp-Source: AGHT+IFz6ZRFFfoWvl+wT0LHyq+EB0DTesxFaL6W97Z42BiDtgdF9wEmDGfGKV2JzCVZFJiUcR0nIQ==
X-Received: by 2002:a05:651c:213:b0:308:f6cf:3602 with SMTP id
 38308e7fff4ca-30a5b2046d6mr91106011fa.25.1740550352580; 
 Tue, 25 Feb 2025 22:12:32 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a81ae8193sm4086641fa.105.2025.02.25.22.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 22:12:31 -0800 (PST)
Date: Wed, 26 Feb 2025 08:12:28 +0200
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
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/15] drm/bridge: cdns-csi: Switch to atomic helpers
Message-ID: <g4jq5pntacp6alieq6uejskblmu2hnvvdvf3k4e54yvnjl65m4@xqs5yrcptpmz>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250225-bridge-connector-v4-11-7ecb07b09cad@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-bridge-connector-v4-11-7ecb07b09cad@kernel.org>
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

On Tue, Feb 25, 2025 at 05:43:59PM +0100, Maxime Ripard wrote:
> The Cadence DSI driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
> 
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer. Fortunately, the CRTC pointer is now provided
> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.

Here and in the next several patches: commit message in no longer
accurate. You've dropped the drm_bridge_state.crtc change.

> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 31 ++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 9 deletions(-)
> 

[...]

> -	mode = &bridge->encoder->crtc->state->adjusted_mode;
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	mode = &crtc_state->adjusted_mode;
>  	nlanes = output->dev->lanes;
>  
>  	WARN_ON_ONCE(cdns_dsi_check_conf(dsi, mode, &dsi_cfg, false));
>  
>  	cdns_dsi_hs_init(dsi);

-- 
With best wishes
Dmitry
