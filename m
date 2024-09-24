Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7B1984ED6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A866A10E90B;
	Tue, 24 Sep 2024 23:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q1lvTnKd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0033210E90A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 23:20:11 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-535694d67eeso405200e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 16:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727220010; x=1727824810; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q+9Q0LCSmj1StAdxRtnVSzUh3z21xwQ3KgCZoUWxL08=;
 b=q1lvTnKdjfJRbD4ofXMh0gdo/aWuQIv/9mtIZBELM5U7dDIq7iBTzpm+wWASOUbqFM
 C3JQ2jakjjg++ksJWgfyYpjmP3Q23sForZodVRRg4nfMu/4v8AQr1rxd1l19eMLJe4Wj
 D70JxdezFE8St7DmOjr/qFWDT8rn/9l5XQXq/p2vk4TYGAMbQhI0zwASPaGIhfGYLcDc
 OuC7EoQsEQ5tH/dcT8+rANiRo+ebvO2F3V/carAcNIORsALxD2caI16AhWZsHfNSWwj6
 4dQgRc4whleqRP6l4pi1YmtvTidEqAhn7Q51qOFRCJo5gpa+REOElzAzK4VeqOjwE/oi
 w6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727220010; x=1727824810;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q+9Q0LCSmj1StAdxRtnVSzUh3z21xwQ3KgCZoUWxL08=;
 b=VHrOrrtIhvhtTLLkbhLmozP/tvz/UfdZicjx9XfOAa80hKvIY1PfG74B5ePCtsn56V
 P84+mpb5YyNO6QDMNqsQfHWiVNHGCwr+2i7QTNmQY6bnwTfcVgF0MXZtujlRTIHEklSI
 m9ARFLeyAdBDPBVXb16fVRNQa3aK5jU/sscSX9Ag0wf4mO1LgD07Cv+GLl8KnH1u0tKV
 XMbceO+RTh+Bk9/Dx5xroKaeIjmD8SJ04EXG5gV9sVB7cfRHQZ5Q3D20R2viOFFeqOK4
 /DmjyfuFFTaaoyUsIp9OA6aFab9x2tAWCw1hz5Pjri1bHUbfptIWcw7OJOzYJa2cMqzy
 kI0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3d0Hzf03n3rY3Ts8Ixw08FwNsoaUxqD9YyaQCN2Quwm7CcIp9XL6xEO9U+7YSKj8XC6RQF097SrE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwL8VMDs3r5al1hxPyxRNYet0M8AJiBMIqWRDhbgolLFWt6IAUs
 Y5nQMUlPbhnaeNDOH5rbmF6Em4FoPGQKKkk9KOMQKTFRwxrxrM1U3lSWxzouVBo=
X-Google-Smtp-Source: AGHT+IHNEesArxRsedPKolCUJ0834tDf/cKwPSCRQFnIoTfWUbuiW4cAQGCbnGv9EclRDd5JIX7ADg==
X-Received: by 2002:a05:6512:1313:b0:533:4517:5363 with SMTP id
 2adb3069b0e04-537a6912cc8mr1914198e87.21.1727220010044; 
 Tue, 24 Sep 2024 16:20:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a85e0612sm354765e87.20.2024.09.24.16.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 16:20:08 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:20:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 11/22] drm/msm/dpu: add CWB support to dpu_hw_wb
Message-ID: <yfpakq6o3zw6e3kf2d2x465d3et2cueaidnfxidb2uwutjromk@q6h6kdz7ooev>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-11-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-11-7849f900e863@quicinc.com>
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

On Tue, Sep 24, 2024 at 03:59:27PM GMT, Jessica Zhang wrote:
> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> 
> Adjust the WB_MUX configuration to account for using dedicated CWB
> pingpong blocks.
> 
> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
