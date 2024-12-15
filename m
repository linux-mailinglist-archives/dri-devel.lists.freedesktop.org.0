Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C129F23DD
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 13:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEED10E37B;
	Sun, 15 Dec 2024 12:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YclMuUxa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7128810E37D
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 12:42:46 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3003943288bso30149791fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 04:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734266565; x=1734871365; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hYI3tK4z04wmka3DeGZjKOkOw0GlWVobEE9u3MV0cX0=;
 b=YclMuUxaof0BaV5t+uB/yV13EMqMPYfcMhqktWtlLKGp0UTnCObDbW5vvz/QxU77vE
 aWs8K9pHmwFxS5MuAaugt+wo9BmKyiuDMg3BpdIq7geZFZA8mxaXBQZZaudGCu16yTMB
 HW93FkKsapjaFEMstZ/XkTiE4QiCugufQ0r0RlxWUADeCNUDA09tgM9P8UsljU3sLqG+
 4kK57xxnJMGXLsbksqcYo9a7uLScBoIj2aY0eMlXqABz7UJvZkuHq9ZrM6PRxdIOMEur
 7nXcPu2bhsdPKg4i7X9YkLHdpMaJXGi7cM8s/3PSAzYWmI+FPmKJ4BXZLD4CIlcKCNiT
 LWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734266565; x=1734871365;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hYI3tK4z04wmka3DeGZjKOkOw0GlWVobEE9u3MV0cX0=;
 b=MAiqoEQmbhSSucXmJVYxJksvcQlpTFirWI/Cog+bMrMfWePzg74M1VFKHT3xejqFUB
 pz1ZcKyZ3+29O3fKkNaEb9sNlultGN5xlLFALHqY6r+OowolA7vjSSmJ3YfZxwgpw7Hf
 U4Q3F2k5Is6ghJ5kNncX2ARKwLbxKOSSa410qojjnlWn50ySX25o65C5VMtJEJs3yShv
 4lV83yezqaAYT3ldO9virGEE4tL9D4feOzWWCh8UGPSByFvv6Ww0AJE6NYIoFbdgMole
 wyf988C/V6jQkkuzZbaIAlRKG/JFv8qIHyCd1Tccpc4EF27e4hmNiSQyNHyQMaxzuGwU
 YMzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOkQ3rWPu8G0qzA81qPlfJL3smRO9jeDHXbhKRa3VTHQKkk/iYbxnktobJkA5VA+FlbYplNbdEJDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwexxtugIDPckh5zC4U2L8rYycU+I0aFj2rVausnr+LH6i8WGl
 HX/YfccetLWo/umWxoCCMUA7XcCXtIxmL2fUOeIY5RScOYuqe/tc59wOtYYosis=
X-Gm-Gg: ASbGnctCFZKIQqr4Ot2nAj1oud243sURCA0K/vste1Asa4n3Gcb1rRwGCT7wgmTUgVq
 yER2iiauask4KPtb7acuPT6QuyqINp3Tiupmb1N6gRHXCwEzYc3zkx/yxuVLropWU0edV0Sc52+
 Qyg1WK93NBzsLxn8qh8TIWpO4GojkZkGWU+0uLNaHpaR+/AVpMav0OCHmrPldXCSYveg0P0Rr3+
 VBx4JevXPwX3ZKfDQpNLHTiUBRi0rgg6AxEKhK/Ox4dYhqJzUR4NNNYCS3wY6osN3gQM92gWTBm
 9wjOg1wB5eOrancry3TadSuCg59huQ+0G3LW
X-Google-Smtp-Source: AGHT+IHsbdhkAZECyyNTJWfHo8P5cXdKXaUUsnfTwGl+ugfHZQYfSxPEs6t1dmb15lJWqB6WTYjwMw==
X-Received: by 2002:a05:651c:54f:b0:300:de99:fcd9 with SMTP id
 38308e7fff4ca-3025459d0d8mr36236791fa.29.1734266564741; 
 Sun, 15 Dec 2024 04:42:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344061d5dsm5850411fa.52.2024.12.15.04.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 04:42:44 -0800 (PST)
Date: Sun, 15 Dec 2024 14:42:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/3] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
Message-ID: <tynudqtodz46ti2j6paivfmvczijokhqiqxh3c2hy5ujdyuuzv@t627uosi3fhp>
References: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
 <20241215-dpu-virtual-wide-v8-2-65221f213ce1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241215-dpu-virtual-wide-v8-2-65221f213ce1@linaro.org>
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

On Sun, Dec 15, 2024 at 02:40:17PM +0200, Dmitry Baryshkov wrote:
> Virtual wide planes give high amount of flexibility, but it is not
> always enough:
> 
> In parallel multirect case only the half of the usual width is supported
> for tiled formats. Thus the whole width of two tiled multirect
> rectangles can not be greater than max_linewidth, which is not enough
> for some platforms/compositors.
> 
> Another example is as simple as wide YUV plane. YUV planes can not use
> multirect, so currently they are limited to max_linewidth too.
> 
> Now that the planes are fully virtualized, add support for allocating
> two SSPP blocks to drive a single DRM plane. This fixes both mentioned
> cases and allows all planes to go up to 2*max_linewidth (at the cost of
> making some of the planes unavailable to the user).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 144 ++++++++++++++++++++----------
>  1 file changed, 98 insertions(+), 46 deletions(-)

And I forgot to pick up the tag from the previous iteration:

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


-- 
With best wishes
Dmitry
