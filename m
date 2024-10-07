Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97721992CEB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 15:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B3410E335;
	Mon,  7 Oct 2024 13:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IJFQB0AM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B627910E210
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 13:17:01 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53988c54ec8so4975683e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 06:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728307020; x=1728911820; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+pWYExryHfEOHSZj+Ne8AORcHVOO1VxvRGvUXHt9asg=;
 b=IJFQB0AMfoa40CYQjsoMs3rL0+NNN5BmCgwknf9QggY1LV3dfb0w5BFmxMcI4af/gz
 Uro/406ANjfzax0T4LFnX2MciUrnuZSbC+pWlBbLfzMNT6fIWoZqdg9/h8I0FmNewN1m
 DXfvKQWr7diILwwrO1fHmMCNbpOde0u4ouhpu6/8Cxm+T1NfcPUro1IxwQL9kRER49Gb
 rB6zZ/6DMUeDldmnd6LwHMYQaWKCqyTvG0zcvz7XoPG5CysV1UVPgjZ5m4398mJZd4Dt
 y3Ma8k84vfS74qBMflRzAyCr2dkTy9egNzdTdECzMt27SniRD89OGnkyloi/2BafdqmW
 dYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728307020; x=1728911820;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+pWYExryHfEOHSZj+Ne8AORcHVOO1VxvRGvUXHt9asg=;
 b=RPinspe21kQJazQ9DXQ3yLd049zmDphPgO/KQAh1eNy/ZW31qYUDomJ+LdRlwl0isB
 nvD+z8MojcaD6j+3gdutBamZQCJZUhxaRDaFW8alC8AfonzNnPKoH/9nuGyoMrQGOZ+1
 Sg+USBvbn2Jr6v/2iz6MNgRFchJSSj6Yq4sQ2j9HoPx7p30joy0E8yImyE4STgXazvyq
 5se0cIUKe3jeubR8fLlZA98kzpYgx26S+MiYgRGPJaWNlM5TIZ4+IjJ5X25S5JYkZVB8
 jGiEfNnOzRSZHXL48OftEXptRdHHHeREBQRvbkOMdrCPbe16iE1LhIYvIeaTI3PjMIUM
 rE5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxh+pBrzkudglsOqRRtykCnxp9FdLHpacJ2TWU7Hn5YRmVFEKYP8xvXuTKIeXY65NGeQjP75UPRG4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKZNZd4o311cxbt3M8IahEyCMqorVtYP2Ns5s4lFATU/4kcpgn
 7wr4m8QiGiTRcf+cpzU3QzWdNBL3MM/MZT0Ke9MO+4p64Q35Ugsrec6Uaknej7g=
X-Google-Smtp-Source: AGHT+IF5Z5M06yNJGCi1ez/Gx/T8VjldzZqMCqhBqFS3zMMX19PR8zfmRYYeTqG1usnU6bJUYarfKQ==
X-Received: by 2002:a05:6512:3c9b:b0:539:9155:e8d4 with SMTP id
 2adb3069b0e04-539ab862530mr4922913e87.8.1728307019585; 
 Mon, 07 Oct 2024 06:16:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539afec157asm851578e87.58.2024.10.07.06.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 06:16:58 -0700 (PDT)
Date: Mon, 7 Oct 2024 16:16:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: improve/fix dsc pclk calculation
Message-ID: <gd3bevkbevqqn54xq54dfc5imq3koc7ggudkila7jxgaxcluvz@5mkw2ra6pgoh>
References: <20241007050157.26855-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007050157.26855-1-jonathan@marek.ca>
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

On Mon, Oct 07, 2024 at 01:01:48AM GMT, Jonathan Marek wrote:
> drm_mode_vrefresh() can introduce a large rounding error, avoid it.
> 
> Fixes: 7c9e4a554d4a ("drm/msm/dsi: Reduce pclk rate for compression")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
