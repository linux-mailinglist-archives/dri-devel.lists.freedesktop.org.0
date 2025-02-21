Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE9FA3FB85
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 17:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEDF10EAB7;
	Fri, 21 Feb 2025 16:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GmoqzwKO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D648610EAB7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 16:37:57 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-309311e7b39so21064091fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 08:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740155876; x=1740760676; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HiCM9rHR9ep2t2LpEOjyyuBT+CM+zVgh9rP3wMq2c10=;
 b=GmoqzwKOQFh+DS+S3NYgEXwTiOQUjTnvljaveRouMp9F8G24FTns3eo67vMzUXtACu
 zxZt04fYMMHw3l2HIhUZqdI3Jl8mrBKmFk7qF4X/+u0+WW8NMFLsCZpNd6G4vMoVzHlI
 lW3so+ZoaSLePCmWcNf5mpJLjcTYw0B8AF+dlBmWnLgS74tkYHbZLMirSXZeFzHWmJc9
 YQ/3JYT7sKTIOIHg9JFgCrJ0hRMp9iOHhLMpn+rmK5v0SROTUGawOQVjLlzdUwMFL90m
 mTtFSwidWXYh+PN0jS4XD1Lyc7MDd9jSMiMYtxFgyieI+qGqQG7euO36S240vVkUqqAF
 bF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740155876; x=1740760676;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HiCM9rHR9ep2t2LpEOjyyuBT+CM+zVgh9rP3wMq2c10=;
 b=mQ5fjKsVGzujCi2JZxS4mTE9OgGg2I//AWFU9+g2CpVMq++1zANSpYKFBpZUB4mKXq
 dtQVMZTTA+9v4Q+erxnuD2E9dQCS0+/zWPe113WCJOx8bOP6j1NqbVHHkrm7ED25p1v9
 RjXvlqFYMuik+fkDBLrgYtdVRaDNa+negciV/fThEgzmXsPZCdv3tlI2NT2LdmkHK9G9
 rYh4NRiwi23UeE7sAUgODV4rn8MKbLUadmPiQ9gn/9lUvRvvyjTCbGbDyWnAFXZ/mdWq
 Zu3sKtoQFTz+KfxzTSMoG3rxWq3YrLXgLpivjPHleb2tJEbZs/Oj+AK3r5ydkRn1rccB
 SQnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPczd3aJuyvWhPhdEzHRT7yALTGKHYNog6PNXC5oCJqoYNZYXL/h9TfRIlaZxBqWWbOnpYC3sQrng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6Ab+kVIpqWNGpZwmkHAH21q7hCvtzWhZSXVnyWMVJlvh1kpaT
 ycJBKoXDjJF4LbhMlgg2ncwNWhTQHvIADZyeT3NCNqFE90jpZO1dY127MuDlQZU=
X-Gm-Gg: ASbGnctzzMNGs5gqMN8patZ4kUxI22PsHYm3y70HUVJLGdLMlXpxFnJcsqOFt0+AZoV
 +9YXtM3mT1pTYSnYRtI+jD5vMVjfuOjsQrW+d26qhtRlzcFVjgoSLUVC5CSt3gKIlP48x3P/Svd
 vB0EcvN/AJVK3QXtupD6ZGx+P12nXJoz0Pl7qIdV1znMlpbotxQgWC49zV6BkEd9Mwd9mKKUzYM
 eYKquhkUl1TZMJaqJqEunMK5hLu6p1KFxp28Xh5Zl2K7mijB3hJTlZOdiPkbqbw2Bh4ex/Ynyay
 ho73zwjTV4LdY+2tZ1g6j9C1P9+kRXUpSL5L0nLKkDTzdEZFzOPcb778NGfms+rxnLwb+tSOw/3
 fCub0Sg==
X-Google-Smtp-Source: AGHT+IGoFXuun5GJ97Xvt7Zgkc3Ne28NUcJZxPJK51Drj8l8NBtis2PX6e4XOtShtMwtO68U8U2oOQ==
X-Received: by 2002:a05:6512:e99:b0:545:c51:4a0f with SMTP id
 2adb3069b0e04-54838edd8e6mr1785885e87.4.1740155876184; 
 Fri, 21 Feb 2025 08:37:56 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461dea980dsm1758346e87.63.2025.02.21.08.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 08:37:54 -0800 (PST)
Date: Fri, 21 Feb 2025 18:37:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 14/15] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <5sio6so2dcdadxps4russkuk4i4duui3oxcl3aeiafkbsw4ag2@g6l42epivgpz>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-14-c11402574367@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-14-c11402574367@linaro.org>
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

On Mon, Feb 17, 2025 at 10:16:03PM +0800, Jun Nie wrote:
> The content of every half of screen is sent out via one interface in
> dual-DSI case. The content for every interface is blended by a LM
> pair in quad-pipe case, thus a LM pair should not blend any content
> that cross the half of screen in this case. Clip plane into pipes per
> left and right half screen ROI if topology is quad pipe case.
> 
> The clipped rectangle on every half of screen is futher handled by two
> pipes if its width exceeds a limit for a single pipe.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 134 +++++++++++++++++++++---------
>  3 files changed, 107 insertions(+), 40 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
