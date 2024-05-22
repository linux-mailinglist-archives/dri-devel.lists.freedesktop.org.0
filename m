Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A2C8CC8E0
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 00:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAFC10F309;
	Wed, 22 May 2024 22:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KztnEL3E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758C710F309
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 22:12:36 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-51f57713684so8575127e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 15:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716415954; x=1717020754; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BQOeeyMaEqMnu39Y+NwRU81Ky5s55spLGysaOpoEjNs=;
 b=KztnEL3EQr/oH42b4xb2I59DLE1W/TiOuLBVfdAaRseMVwuKGvmPCFziIzdIIwQcbz
 doEzTaduaRgA8g68HQhtLC+LGMxoFV+E2lJksQ7rojnvdaunPL756cHyaXCAK9AKuBii
 oXQ/7ivKM7aADqyUmnIAU4RZ+7GErmigRo0IQkZ0WIpJe3Sey0T4bUPNMEfKzqgK3BP/
 CMccBDxxkoPLQwMIihjPlL/Av4vphXi1wRaNFJU2OLikDSd1DaUewltKVVtYHVaC7wfL
 pXtsqXtIFWzM/RZ8asV2EwR0XyUx1iJm6vSoi+X46WEiYEnD+M6kP8qZfagFkc+OipGp
 +85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716415954; x=1717020754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BQOeeyMaEqMnu39Y+NwRU81Ky5s55spLGysaOpoEjNs=;
 b=DPMyaVoMFBGe7AgbFAjvY7+wi947E9dj1+C5NvL7aGjBRaocffJVEdrkaRUSX0oXNI
 E40yVGz09tHPI3f7QmhY21phUhYrHGrnNz0MzV6ZsTAXZwju4IxKfRiZlcqoqJR2+Wei
 0grVNaQYai0sWWP2LN2pCWPALcXL5U30bdQVbpFB4IlPTAhADO5zG1u98fV2I9/9jgml
 OIO5bncTUJ5o10eOEzu0bi1VPRTNtkskrWA3x9ngGm8A+dMjZgoAdDKoOnOSt35LCaQN
 O+2gRzYgWrRUMVucTxnQ0wDygrCuaR5KxW1qAsEdGwe9dVBSdzWYuCowHLLygyJwWiu1
 y8kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt5DOKmrYBPKJ+hiCrZAmrjRGtzXN8dTYtXcWVwlyAVarVrcy7q0M9x66yuBRe14QI7Y8itvN3yc62XpvBOv8Bb6w3XrwNfX+E+mo4SKdc
X-Gm-Message-State: AOJu0Yyx6S3Uj2TXGdS8w1CBrj7Ulrn6wpENDfHDvK8l3f6wk4soESa5
 3CwLxYKnsqst/9glYOnjjn3hMTqbyacKUsXMQa/vTZdPy7gvhuOylwlIbCwao/c=
X-Google-Smtp-Source: AGHT+IFmy9iqYhx6F/MxVLTLyGH1Ov9kV4rl1NcWdUJFcx0idK0FYhwE3IrOr5DzJF6JcDSGkx+xHA==
X-Received: by 2002:a19:431a:0:b0:523:9493:4e63 with SMTP id
 2adb3069b0e04-526c0d49771mr1801806e87.60.1716415954442; 
 Wed, 22 May 2024 15:12:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ba50csm5062862e87.69.2024.05.22.15.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 15:12:33 -0700 (PDT)
Date: Thu, 23 May 2024 01:12:32 +0300
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH v14 01/28] drm/connector: Introduce an HDMI connector
 initialization function
Message-ID: <g4eqwhtbdtqyhjhigtvsplu3hxdyrggkowssgh4b6lj57t6kqh@mptafawe26m7>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-1-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-1-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:34PM +0200, Maxime Ripard wrote:
> A lot of the various HDMI drivers duplicate some logic that depends on
> the HDMI spec itself and not really a particular hardware
> implementation.
> 
> Output BPC or format selection, infoframe generation are good examples
> of such areas.
> 
> This creates a lot of boilerplate, with a lot of variations, which makes
> it hard for userspace to rely on, and makes it difficult to get it right
> for drivers.
> 
> In the next patches, we'll add a lot of infrastructure around the
> drm_connector and drm_connector_state structures, which will allow to
> abstract away the duplicated logic. This infrastructure comes with a few
> requirements though, and thus we need a new initialization function.
> 
> Hopefully, this will make drivers simpler to handle, and their behaviour
> more consistent.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_connector.c | 39 +++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h     |  5 +++++
>  2 files changed, 44 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
