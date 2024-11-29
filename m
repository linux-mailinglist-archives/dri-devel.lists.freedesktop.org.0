Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D323E9DE7E9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 14:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1DC10EE28;
	Fri, 29 Nov 2024 13:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aHSEeEjn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0566310E4C0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 13:45:35 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6ee7a400647so20935867b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 05:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732887935; x=1733492735; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jnuFPvHlqF2+V5h7gDxD9QoNqnoE7Ul8whcq/eg7E7s=;
 b=aHSEeEjnjFZOJo3cgM4dFTXnxnk+GXbua2GZkG02HcJBNdHGw1Mp36S8G/JUOAULht
 2CH6mxfSSzBiNOB0LEzHtNBuqY7ZcCgrnvGdfM9VcSybcLRYaj9w0N9E/qGHMXZVSLOE
 j+1u9bYyH4bVMcaODTBoAJH+ks2imgrad6VEmiiYVPMiravoHHVaBSj5m70fbxVBRka5
 HUGi/pOIUbG+7Xkh/mgnow3FFkn4+i3SEVxRINIZvFMjIwbV1WrAtTmxaLv8qOTjGldu
 JZkfG6SydVM5cx5gP2RiK6Jd/6ac/HNnWaQOePjtAONPx0LoupkyR7mhQiB4Nwwf6Ky8
 OqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732887935; x=1733492735;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jnuFPvHlqF2+V5h7gDxD9QoNqnoE7Ul8whcq/eg7E7s=;
 b=Chaf5A32yZz2LjVCZy1g+fj33HSwy5xGqYOwcHj7siczL4g8pHgk9S+wBeZuSW/rNt
 NciOYzHLgwMfmzbF0HqrQposL3Yr74/bIhkcg4Og3NAWpkSTadz9SAJedy0URxZaSVA+
 l4HrHUNcruIGJmZFZ9u0SUE8R42kQypqT4GmAVJ2CwyR7xSqCfH6AarbA93GRxK+4d/F
 dXC0ZLkmh23D43bjmVOzzOVqbi/oyA2iwJ690fLhIei3UEkaCzDgYX76BiHGZ3RHvEpv
 PTKlRehmJhN2xUZD1swemiqs3vUxSEeJOR7WHyCLctrfjDhJVIOfWzuytRdYnWbTBzGC
 oYSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM9DpmVAD5zb377Dm3pWKmXflJuLnsq59XZ+6FgdTdQV+TWlfxrUZupvIEyKuNFAMDXdyBB3kjgkE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwL6GOxE3iMgUT0ZIezPlWcmga0sd1XeIsfvUHM81FXHEisRfV+
 VKF5iVVTmewZ+TQCJmVHAS1exbxaelaFgCIHFtjlivp9PBUC8H6xvTnuz+oIoCmTH3PHYVZ44K9
 ftaLADyxYPC4DPnQ3VgtmcKm5hm6KHILjLeUlZg==
X-Gm-Gg: ASbGncs4ew3OrPwXnQ20ChNUU02mCgpHp6YytLhnHrCIvTSAt+GMI5tfMFYjig4/gpd
 WUkH99EUk4CrQar8Hj1xjmFJZI4JzNGI=
X-Google-Smtp-Source: AGHT+IFcdw16JjCHhf6pyyNofTqnqJtbeYn35N5Sw7fR5PMwJk8S0Dust9v7sJdcUjiPz0hKcc++q+mU90RLLwYFzZk=
X-Received: by 2002:a05:690c:9c08:b0:6ef:4ed2:7dfe with SMTP id
 00721157ae682-6ef4ed381ecmr63286207b3.31.1732887934964; Fri, 29 Nov 2024
 05:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-8-09a4338d93ef@quicinc.com>
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-8-09a4338d93ef@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Nov 2024 15:45:29 +0200
Message-ID: <CAA8EJpqMug4u1YPxBGfDUT8Cf8F5XckxnJdau-Gm6swyU5VT=w@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/msm/dp: Support external GPIO HPD with 3rd
 pinctrl chip
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>
> Add support for handling HPD (Hot Plug Detect) signals via external
> GPIOs connected through pinctrl chips (e.g., Semtech SX1509Q). This
> involves reinitializing the relevant GPIO and binding an interrupt
> handler to process hot plug events. Since external GPIOs only support
> edge interrupts (rising or falling) rather than state interrupts, the
> GPIO state must be read during the first DP bridge HPD enablement. This
> ensures the current connection state is determined and a hot plug event
> is reported accordingly.

NAK, use dp-connector instead.

>
> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 83 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)


-- 
With best wishes
Dmitry
