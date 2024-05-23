Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F128CCECB
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 11:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F4410E148;
	Thu, 23 May 2024 09:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dZ47oO80";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8243910E175
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 09:10:14 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2e576057c2bso109036531fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716455412; x=1717060212; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yLbNbEeZZx+Y9UagHOzdXnc5AHkeTqV4LNqc32hMk7o=;
 b=dZ47oO80EMCJOBmYirdk3FK9Klo28/9vjthelRwy37DIIvEbLuGhOY65Q9KuSeYSJr
 YxE1DAhg4gTt8HOxmI4Z4m30Lq7LuKsL5iwnwaWIM//A6XynbrZysqnFYX/Hp+6pTV4d
 OY2/Z9qVEtH7X/U4xGfbXM17vuidbsyNZT9zk0JEfQ0dNkegxZB0ppdsJPACfhpnEuzg
 sZH9ynUmydroSHFEke3Z2rRnczKFcY6FbgcBCT9wDPLuVFrr90DAgNw+8yEi6mBu8PVe
 H8tPfoF1pfbE3UVStHkmSSn05dNY9s5pYJ2QnQnhy7RHoQNM8dP+7KqOq7sXYhIVk/u4
 uVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716455412; x=1717060212;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yLbNbEeZZx+Y9UagHOzdXnc5AHkeTqV4LNqc32hMk7o=;
 b=KsS0FAZjkmGcscfGv/CIO8oJYkvry5dZ8vF8R1/7TTVXEQF5xvl/XCqSqrFRIO06dk
 +ayHPrjjGzLJUYwOczjSftnWsILGH0s+bnnAy+S8WNQNnz60yea/U7FD426Yd1NBj1GJ
 1Dax+At9wGwVeYXsAvuVS7C02Y87uh5P9/OiPdHQUgfaYXlVlr68ffm2XUaQspFBwoGx
 F8Z92c//KzbtTnJJzr0qLZPLaBNy2fr7urYWMjLT1UAehVVLhOH9Yu+ktqCOz2yhEsHt
 99CFkSm+1bhpC8lg3Rld+yjFQc+V7uYNI/AKTjz16OcWZ1pGf4U91a0QmlINqWQIVKCy
 OcpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYRKJd9O4BQja+uxYD3pQLssIXB5b218Y6g3KxkPc4gWVCZccIcp4mUk04TTKW9RFUmUPH3CrVMipz8+TIuAaMo2uEa4518UlqFt0SisWG
X-Gm-Message-State: AOJu0YyvV+i8TTlWap1/0JaHbBR+F9PrN+m9w5lA0tWIouNRexbdnK3g
 axAIiXGE7LxLGsR/zYLvnz/ykZranWJuxHT9koMX26eftNfCJUEnXRa4KIkMh44=
X-Google-Smtp-Source: AGHT+IGdSgWnLFMgir035AHyOCVqS5scq5u8M8DlUryO/CIUdmVczkNrL4TJ+hWCvcPS/dK0wrOj/Q==
X-Received: by 2002:a05:6512:44b:b0:51e:646d:fe3b with SMTP id
 2adb3069b0e04-526c1213db4mr3455906e87.60.1716455412389; 
 Thu, 23 May 2024 02:10:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad640sm5253516e87.61.2024.05.23.02.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 02:10:11 -0700 (PDT)
Date: Thu, 23 May 2024 12:10:10 +0300
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
Subject: Re: [PATCH v14 06/28] drm/tests: Add output bpc tests
Message-ID: <p6mpuna2ubfpqyfogblvknxadga2uqnm3lsocwol4npwmgw66h@42yt4b5zhk5y>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-6-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-6-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:39PM +0200, Maxime Ripard wrote:
> Now that we're tracking the output bpc count in the connector state,
> let's add a few tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/Kconfig                            |   1 +
>  drivers/gpu/drm/tests/Makefile                     |   1 +
>  drivers/gpu/drm/tests/drm_connector_test.c         | 140 +++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 438 +++++++++++++++++++++
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 106 +++++
>  5 files changed, 686 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
