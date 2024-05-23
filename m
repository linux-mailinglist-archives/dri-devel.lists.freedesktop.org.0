Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0053F8CD174
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 13:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157A010E293;
	Thu, 23 May 2024 11:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iNYfwjLT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F8710E293
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 11:47:24 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52327368e59so8459188e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 04:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716464843; x=1717069643; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5JoDrVHVM7LfBzm/j8yQ//z7NC7zUr0L//iZ9DPpuos=;
 b=iNYfwjLToBQ5vwd3SBGjzXHFww84jNqkl5j+1K9qYMg6+5IPPph4RD9xksitQqPERx
 9GUUgykuaRH3yB2E8dLDJWqTfk9pX+V0j1mLz3cyGfJsw97MaorPypeDDFn+O+Dl34rR
 aaOGGPMNQ1LYnbS6vSNv8JxxiESR+q4cnKN38xHEkoYIaiE8T9+ZY6DwFAjYJx09e4HU
 zxE2WI+49P5ff3dykbTFtqGIWLpic5OB0pM0khsbTLvbw9e5p0/ggidQqzGm/aQTx8rI
 c8NguoV2RpdDOIxYWheWys3KIf1pxL/IZjbRPGhQQQ7QJp/wndh2HWSebzouqEycCked
 //7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716464843; x=1717069643;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5JoDrVHVM7LfBzm/j8yQ//z7NC7zUr0L//iZ9DPpuos=;
 b=XfJQTUzkLCXUGysZQGDxxsOWpPWFcTMdPQNBLs4tXJQftoBcssou5eddLzQumsqe9p
 YZx6HzHC96mdWK84S86U/74r/l1bYBuxu8+scfCq0O3FYM74T+S7U6ht9yGdf9dKmXwa
 pR7rQSWF/yIF/094uB2+2vCb7Pekf/8VPr860L415w+PXopU6MNzjCgh9nQhYJ/uKQt0
 6tpJr8Q5QDg45h2JSrvqzQOWds2d1f9A6OfcryAGhxwEqcgjfMr3v5SALRrKxC3AieDF
 PYUhJJTBw8jXXjqOJh+hBZgKCJHI1tRjsVIoqj2TrMzxV2pSJnZIMV6RnYcL3y5nug9g
 q3JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/LXteM5la27BovYijMlSudttBZ7iudD2IU3lEsdahmbFDNiS2FrcuMYNh8TNmwHr8hjLeDKd4ii63fYtyGbBabDdSNcF6Do/EzFylXzya
X-Gm-Message-State: AOJu0Yww0GzYKqaq/U3/fv+pKVRnwhQSE9n11+B0C9Jd66Nj4JIcyhHS
 /W8AA7pDOr9FhD16cCFOYd6xjgV7/5sRYIXDTJhCqIAeaZuKyDofnQHpEy4JWsw=
X-Google-Smtp-Source: AGHT+IEN/K1SwxIaCA4NY4v+I8nntKcBr37nrUarJyi3sJM40IZJFMrjSZD7I/KQY++RSCd91be4qw==
X-Received: by 2002:a05:6512:4807:b0:522:32c0:bb6e with SMTP id
 2adb3069b0e04-526bf35cc19mr3052433e87.23.1716464843059; 
 Thu, 23 May 2024 04:47:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f318a326sm5291741e87.0.2024.05.23.04.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 04:47:22 -0700 (PDT)
Date: Thu, 23 May 2024 14:47:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v14 22/28] drm/tests: Add infoframes test
Message-ID: <blzznexaou6bbiaonw3zeii43rcj5izgqt5zomv5wx5gxbeu2o@3j4o3hs3lfx3>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-22-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-22-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:55PM +0200, Maxime Ripard wrote:
> The previous patch added the generation of the infoframes matching an
> HDMI connector state. Let's add a few tests to make sure it works as
> expected.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c | 219 +++++++++++++++++++++++++++++
>  1 file changed, 219 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
