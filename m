Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6CD9B8494
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 21:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9FB10E0F9;
	Thu, 31 Oct 2024 20:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s6a8fIcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0261210E927
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 20:47:24 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-539f4d8ef66so1810487e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 13:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730407643; x=1731012443; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sgPmCiNggr8Eodac2WJsUSL23THVr2DjeTdd/A/XD6A=;
 b=s6a8fIcJrd4UP8arEFwzRQs9wePsfxHF0f6g5oAUOEQI21aMfzBQ5dEwdvvYuZBsF7
 v9WS4KsImLMsZXl7oROB70WT432beYpAJDl/kZrR8a4RLYgUF1iWyA0oUTrqa1Xe9dEh
 0q2a7fld/gYNjE8cIcoL2nTxLfTWxJ+p1aCLf6ysOBK7T4xpmzt7xA4gPtb3o/oN5YaT
 SKtblK0z5gA88v8fj8sHv7uUXti664amA6X8YNB9+n20flHyFqOmV0RqVkdsVHok6Jl3
 9uwGOZ/AEzcCjwIu2+inZR++MK8uUnLFBePdnd6g9u21X34hA1p+TvvEGs32LK0P7yP9
 la8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730407643; x=1731012443;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sgPmCiNggr8Eodac2WJsUSL23THVr2DjeTdd/A/XD6A=;
 b=uCQs1QigNyGeh36DRtcYMOUujvM7aZ2+masQj/KRO1Um25e1WAwfW9XWt72nNHrszt
 L6jpbpmlsuUg6RoTneB22a8YMuCAdx+E3cy8sOR/fucNwpPkL5dEJ8khA9Xd1bZezPvo
 OnL9Gh96+HuH/MdHHSYkhobfQaEUZwUpWD2RSOKteLSgg+0w56UsPD9Wt9WDGYYJeFC7
 WwvQQ7jvQjayu5dRVioUyBHmkPBcRCDVNHe8GSzWCrhmO2+PKV2szuUdyjIjFPjvaQbK
 mGntItG33F/hIdGFKjcGiCBlqjpxFmkmWXES/hj7mBKUGBaELFoahMSTPSoN23/Ue92S
 zsDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Th1yjv5QhDHOkvtVfu7UJNthEHa9MlK7cAXFTYT7mLFK3/d11ki/lW1HmNsaCsTy2kIIJtdtNfc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu1JUngZ+KaWi13HZkA+yoYDDLNwucSjsbbN6S19kgabG7jGqs
 r5YGofG7Fua9MYoWvx0YSb9z4KhxsB8bqp52IdtWZNUMGHYctZB2hSAdCAdoq7lrKCTHpGG6djI
 a
X-Google-Smtp-Source: AGHT+IFAR1erl04uTQLkmDRo3rHixZEn9QHV9hdNp48+CB7xxjvrtCViOjmu2yETWU9yo4NgP1yaoQ==
X-Received: by 2002:a05:6512:3b08:b0:539:e97c:cb10 with SMTP id
 2adb3069b0e04-53b34c5f73fmr12025275e87.40.1730407642941; 
 Thu, 31 Oct 2024 13:47:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bde0ab4sm321225e87.258.2024.10.31.13.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 13:47:21 -0700 (PDT)
Date: Thu, 31 Oct 2024 22:47:19 +0200
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
Subject: Re: [PATCH v3 05/23] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <4rxvkk2ky2rwgr6bpeezbr5oy4c55ntioequu5uwpcgwddjbrf@ogp5b5bs4dsr>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
 <20241016-concurrent-wb-v3-5-a33cf9b93835@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-concurrent-wb-v3-5-a33cf9b93835@quicinc.com>
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

On Wed, Oct 16, 2024 at 06:21:11PM -0700, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> All resource allocation is centered around the LMs. Then other blocks
> (except DSCs) are allocated basing on the LMs that was selected, and LM
> powers up the CRTC rather than the encoder.
> 
> Moreover if at some point the driver supports encoder cloning,
> allocating resources from the encoder will be incorrect, as all clones
> will have different encoder IDs, while LMs are to be shared by these
> encoders.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
>  3 files changed, 183 insertions(+), 123 deletions(-)
> 

I tried applying the seamingly ready part of the series (patches 3-12),
but this one fails with too many rejects because of the 3ae133b0192b
("drm/msm/dpu: move CRTC resource assignment to
dpu_encoder_virt_atomic_check"), which we picked through msm-fixes.
Unfortunately I can not pick those without a preliminary rebase and
cross-check of this patch and the next one.

-- 
With best wishes
Dmitry
