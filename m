Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BA49F8C3F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 07:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D51310EECD;
	Fri, 20 Dec 2024 06:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uAP4YjT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2742D10E06F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 06:00:32 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so1511309e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 22:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734674430; x=1735279230; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lztogWLUolK8A0gjuG8auzrWDWfVBR792pZiblADSI0=;
 b=uAP4YjT94G8JRuvf8F0ETy0dm9UXrwmnebyLJjHENOuTS9uoklDyRMEQ7mxHbkw5zW
 v5tejYkP3IVwm+X03sclUFipaN3iT99aKxLl4YRyj+/nXJrrSYG+AdhPOhKLZULX1jTE
 QLQm6hBEwow1vxjXJ2zgiNcsGpielZSWkddMuxMXrJkwH/3zhWaxoHPpYYEKG+ikAs3j
 fxtqReu/AnlyE4HOZyswN8gMUr3HWA2oq/U9pSgQRBaeHt45+1oq+Wf59f4pGyLr6qDH
 UnNA1NxIvKpbczfGLHWq3cpG0eG58LTyWO5sWGQUBzBtFrDv2Is7GiwNoKYsNd6VIm/y
 SBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734674430; x=1735279230;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lztogWLUolK8A0gjuG8auzrWDWfVBR792pZiblADSI0=;
 b=fFVXHXcZ8oFL47zVBspagCgRWIcx7MGZH2CUPP9FeiNkD4VtihODsCo2n0CUhNoWzc
 shzwYEDGEIhGt4aU2N1siEm2TmPjc8LfmD6/s0CatPpDjMOIT9UuDlhiDQv2Lp/JYdM5
 3l2tc0ltkrCZsNx0x1OK4EED+yz05/NIvpX9ftP91aX4qZ9Ta7VlSccKLRw0a3UZe3FV
 4TJ5KCBCVxawmkqaF8aSjq20go4A/Y8appedGtB7pmM7ed6bbw6bavqM2AI/YDUMI7ih
 g10hYHP6dGmYZ4XvmBh1v+XCgWrIbHb1soGJ300d7NshRzfHABAci9HOmeGpKEwbhrgt
 lwIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNoWzy+LV2GF6C/3ibAPJJ8JnHl7sGtsnLHpJ5WHlsl4X696tnYHVr5rUWO4VbqWhdtHtnAlbwT6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4bLtS2rtpyxoQzw7x3dyTnu3iIwmKg8+zr96tFM8t2oL051hK
 pICkj7KoQGIoWHo4+Lp3TyUWfIAIArIIY0fvQkzq0RKk9XWU3RaDcT2/vu0sZxc=
X-Gm-Gg: ASbGncseRPZRDMUUD1lZQL1Tj0+Q4VKI2+KhuqK+xEiUtZ6qjz04shmKJd4xU5yQudU
 5Oi4WcJ80TxMid/UfvIykpR6NA16fvaek5lUF1YLTjAa97gS2nGCtRGnte2dnkIBCJQRfmmg9Zl
 +vSUuEsdHVXBhzH1XOWuqeQaw5KI6ae6CIQpaBxEPDHFII2Pgg2eUKR2CH3kDGAeZGlPrrT4yoX
 NqzMiAvEuRnYbjeLlTAMl0Dy7TUWiMTGloFT5lMQNZ2g3DgRvHv0B1QexqM/GZCM4igrOaNnVlZ
 h6yNOOSv6WYqI97FbKlTP9OZiJrzc6V5Qr7d
X-Google-Smtp-Source: AGHT+IFiEdq38m3N3tZdESWDddegsXGp5KSA4zDLDiDMTHVXrl2c04WWztsil1xL9Q1eYop5O6E+PA==
X-Received: by 2002:a05:6512:3405:b0:542:2a8b:d56f with SMTP id
 2adb3069b0e04-5422a8bd614mr136330e87.4.1734674430475; 
 Thu, 19 Dec 2024 22:00:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223835779sm379307e87.282.2024.12.19.22.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 22:00:29 -0800 (PST)
Date: Fri, 20 Dec 2024 08:00:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 24/25] drm/msm/dpu: Reorder encoder kickoff for CWB
Message-ID: <dszctcu5mm4hudc53gqpjklcugah5lisvvfkbmejeywgceqyl5@dqzopvt2lb7s>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-24-fe220297a7f0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-24-fe220297a7f0@quicinc.com>
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

On Mon, Dec 16, 2024 at 04:43:35PM -0800, Jessica Zhang wrote:
> Add a helper that will handle the correct order of the encoder kickoffs
> for concurrent writeback.
> 
> For concurrent writeback, the realtime encoder must always kickoff last
> as it will call the trigger flush and start.
> 
> This avoids the following scenario where the writeback encoder
> increments the pending kickoff count after the WB_DONE interrupt is
> fired:
> 
> If the realtime encoder is kicked off first, the encoder kickoff will
> flush/start the encoder and increment the pending kickoff count. The
> WB_DONE interrupt then fires (before the writeback encoder is kicked
> off). When the writeback encoder enters its kickoff, it will skip the
> flush/start (due to CWB being enabled) and hit a frame done timeout
> as the frame was kicked off (and the WB_DONE interrupt fired) without
> the pending kickoff count being incremented.
> 
> In addition, the writeback timer should only start after the realtime
> encoder is kicked off to ensure that we don't get timeouts when the
> system has a heavy load (ex. when debug logs are enabled)
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 74 ++++++++++++++++++++++++++------
>  1 file changed, 60 insertions(+), 14 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
