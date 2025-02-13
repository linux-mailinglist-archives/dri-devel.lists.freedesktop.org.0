Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96322A34A42
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FF710EB32;
	Thu, 13 Feb 2025 16:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XRaiRc1R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0CF10EB32
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:41:23 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5450d56199cso2488837e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464882; x=1740069682; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tcccG4tkgvLDNi79n5bTiw8cyzoNORWz81wxKbGGu5g=;
 b=XRaiRc1RwoJyjxAmdeXxWBU4lNKYMeDw1zpDv5hSr1LdvlXAUJPTd+mei+SUePECWH
 rSIDWT8boJjokuqLlIB1LPW55mpwdyAJGXI1PG6cu8sRjz0STyxm0U01PQAA28Z5shNQ
 g4yFuY5Tfv8sXYayVPSZ8ampbgPXJodWjo0MV3pKVrx9lbOSxD4arxv4UGDpygiopp4F
 z/RmwORH5R5dTxiWYJAgm3yJSbKF4fupVEXSvDwHvMTZKB5wjjno6+Hwxlo5vbU1f8pR
 CHpFAeVFekNsF3cviULXneVZNnVflmolOmFlbItRc2c81oXBTGbgx8yIqsBZFnYasgvW
 P6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464882; x=1740069682;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tcccG4tkgvLDNi79n5bTiw8cyzoNORWz81wxKbGGu5g=;
 b=c6ofN1qSk6dQ9JF1MV/uAo/nS4j7D0mEpB9tl3ItUA9pPjJR1nDDsxkfF3GfEMjUE9
 2oMAHdik1Tw61egy9Ev1l6mFt51fu0s+ZQZk1idpJuIdNLKaZa6w7Eyd6WwKXEnaa+Cp
 4TwRLaSe2Q9qijW7m9/Y2M5GeBqAriPQPwyHg5oZ8/XZPFZ8KdWUVUvtuAUHQ8n9fZee
 PRb6zX2ps6o+9xyDrEJXO98YMGiyJ+jYVnnKhFBoEEgRRJWNEqUV5gqiE+b21X5zoJAB
 La1cTE0M//oQgqQycC/ZQU7m30iL7j2piE/u+CLGoXwVAYZUzA82v0FffVbJOj2DsPFX
 ZAEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWow+efw88tIu7LlPrDwIIGL7Qx07Nv7+IQMO7Ao3qnwGzxfJt598y0dqPJ/tw6TUmSSekMwt1Mvw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza6/Uvr4RbwSFmbuN4VebL9zPu0FLVIbCKpeiFQ2m1/mior2bG
 1doSQdcHFHRmlekGArOJ+w+wRgQUD1POb4CKlWwL1Ulj/0hTZA1zIKiVznaRLGU=
X-Gm-Gg: ASbGncvzYb/HwTUTlDmtMquTcZDKnNYjeV4VxtuutAtE/3fnaRwSsRMsP3ryv5p+vth
 +Zj03PvHGdWKHORqY7ot6p+LLZMeT+LB85etbtr/6nJaG0vSTSa8KMafV1JdYDa8G3oQamGbmrC
 Chu2hkzYtf++WbSpNFH6k2tl8owiZDYb9DIyrvXJ5Kt0cY3QsLbaR9A8PLb+36F9QH31hwKB4+G
 jGZJJGdHbaEYb9Ea9Xkjm/mhY6w8pYZIqwM9bbhGWaTvqonWH7Jnol6ivKonG/kgaNDIzBUee8o
 iAobJMlDuPrm3G8JkAZkQ89jM/Lt0izpUi7/QV79Pwzpg/XWL3H0yZ1+/7h3TNZrWFugszA=
X-Google-Smtp-Source: AGHT+IFeJUWEa60UQpI6q9YZql9YHNj9VRLqAC+Y3g1xdOcLPb+4FEU17zsKE+0JX60NmALo7RBecA==
X-Received: by 2002:ac2:4c48:0:b0:545:d70:93f1 with SMTP id
 2adb3069b0e04-5451dfdc2ebmr1248900e87.11.1739464881766; 
 Thu, 13 Feb 2025 08:41:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f11ee21sm215018e87.256.2025.02.13.08.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:41:20 -0800 (PST)
Date: Thu, 13 Feb 2025 18:41:18 +0200
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
Subject: Re: [PATCH v3 26/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_wait_for_flip_done()
Message-ID: <36rwa43xngtbmpelvnvvrzuk375ssguxkicbs5gy2phwhxk7yb@clooqmxvt5uv>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-26-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-26-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:45PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_wait_for_flip_done() will wait for pages flips on all
> CRTCs affected by a given commit. It takes the drm_atomic_state being
> committed as a parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
