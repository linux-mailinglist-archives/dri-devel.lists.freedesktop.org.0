Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F19B58CCF79
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 11:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2C310E2FE;
	Thu, 23 May 2024 09:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mb7dfBK8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C406E10E2FE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 09:41:11 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52192578b95so8679502e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 02:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716457270; x=1717062070; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ymOIxLRXX6/t992boJGrCdN0THAC8qBuamXJNsylAfs=;
 b=mb7dfBK83WDDBsDO+oKJLeyEVFp2sPlQKrLbMN1dOzWiwINdmNg6qPdvsoWI39nxuG
 snvrzQG56Cd6Dm4XuKy1bc0fVpMQKv/tzXm7VdSDs2HQB5xIDFK/FqrqfitfJVGeENws
 q5SwVvF5TD8zCNDpxcw4UgtXMwI2iNrTIEHrcRbd6lfovwvPjZ7KHbFtlTo3+7MEHQHU
 UsabYcS3PMl27OXu6mpyRHo4QWOLRCRDElI8THni0+K4dCk2Z3DiFteDnwRwbv7u70Ll
 7p/C+/UKslXVtnWjqxaKIuO4Ba0CWIfpd/BXRIUUYa6jnMMaKEx/QgY6Z0olPWe8CDCn
 gCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716457270; x=1717062070;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ymOIxLRXX6/t992boJGrCdN0THAC8qBuamXJNsylAfs=;
 b=sEPuL9817BMgrdTRZfsGNjdxAlOfgrqqyRSvOpU50eryXRGirvAEOsHCduiQEam9XO
 7wMLlmvzuV8saNIOGaKUFnvmBkZQ9ickWZecQo5dP6nHUdSdQ8bGvrice8t9LWWV09oi
 0HXbMLEcfyaXKdxle92ZqhWuI8FYO+16Q1Z2xySHO5YHSLat+GKXdNDaaK9cKT7QN4aG
 Z3pkyul//C7ygqeaiygWUZVifc1nfxFfZKbewHLk+ynIQ5MHXl4vHXNqMb51YuugmOdz
 gni5Wu4RRll0Gu0UK9NSCncixUGCKi/dkSsiYigvugPrQDnHWg5lSPHnnVNkctNJwSJP
 E+Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8o5giVlUnnzAvLaTfdHvWml9+E1G7k94KBZTtIUwjtn4Epf65lNcENiF2K7exDl76u3fiKaQ13o48oCb4dTXK2b8yX7rdxoba6ETBA9Ug
X-Gm-Message-State: AOJu0YxhLnf4usn41PuUxVptOqEB/8JMQuZR1nnUbXJVnUG4UGzc5wHO
 Y00kb1sy4SuPQK/pLEf4+XuSxVFFXxaWiaC6WCth/kGabOanxjLO+P9S1N/gzQA=
X-Google-Smtp-Source: AGHT+IGDBnS6Yxc91Ez/LJRvHEhoF+0Je5SmLoZcaOOlSUX1bIaRGc7t5bjpMnVmIRgP+hN+dWcqmQ==
X-Received: by 2002:a05:6512:611:b0:51e:f1a6:ac39 with SMTP id
 2adb3069b0e04-526be6ea79amr2624505e87.12.1716457269807; 
 Thu, 23 May 2024 02:41:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52394a319f1sm2983965e87.64.2024.05.23.02.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 02:41:09 -0700 (PDT)
Date: Thu, 23 May 2024 12:41:07 +0300
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
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 12/28] drm/tests: Add TDMS character rate connector
 state tests
Message-ID: <ghotwzdstmtpnovbmt2fgvxxkcno67hfwydzjzbyfn6dkt247c@52ycrfinmimo>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-12-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-12-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:45PM +0200, Maxime Ripard wrote:
> The previous patch stores in the connector state the expected TMDS
> character rate matching the configuration of the HDMI connector. Let's
> add a few tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 166 ++++++++++++++++
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 216 +++++++++++++++++++++
>  2 files changed, 382 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
