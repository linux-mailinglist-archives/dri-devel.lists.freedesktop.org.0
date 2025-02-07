Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A28A2B764
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 01:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3684D10E012;
	Fri,  7 Feb 2025 00:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ff7B/Qkr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A1D10E012
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 00:57:59 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-54021daa6cbso1669567e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 16:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738889877; x=1739494677; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ug1cHKYkHOI5SE4G5i310J6mOL4B8HpmJ/dr1AHs9PU=;
 b=Ff7B/QkrFG9pNVWQ4RUOIR/qjvnt9dZ+duTHMZZJYe9ddXnkIY/MoXmEwPG9cxnq9H
 6Rc2MNPlD/7OTRGkqnwI9lNCHDCTXv98t5GhqBhvHvhyNK6Fms7qjBDt3BroGMf2XTc1
 5C+oK0IYmWcGFn5+s1mmLzDSKgBIeecenH+bibCuoOO2Qf72DHKxx08EpkHzfOVK5uEx
 XDNifbl3j8NsomE+jA28/cZs8mvYeuzU3A7RrIkDF5omoBWcQP2JipYqug+vg95GdXk0
 F0+w2XoXHmyFZiEh0eq93zfuOPKwi/E4WmnRF3ZajYw+HykxOlL1n7Njg0gOy17p8Q/G
 grWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738889877; x=1739494677;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ug1cHKYkHOI5SE4G5i310J6mOL4B8HpmJ/dr1AHs9PU=;
 b=X4UjaR6IJ+Y+mX9h2C3ywz6n0DGGHfvSS9wwBLkQYgHMd9deMYMC5Ma8ZxasJakQj2
 Xgzn9sMRSMgZgap4Bz2RKUBqOTsxZvPkJUNjh4vzgegHImmdr2IKd+OzxVZrodPsuInL
 iZd2jkwt+P8RAlIRAwQthjawKTBXxCKqszyeN8trwNw4r2SOB8fzou8j6x5qFja+kCzW
 AtgRQApLOjYqnnNEKsP3wor81VHaP49tl1hqkC368WqHWCAHxKxYhz3ON2SPCr4ucoT5
 MdE88WOyz1VP436jOEGEpjVQt5rDb136qcCUIYGRnSyDUAB0VOmYWo5rxcWXdW+tvfn+
 Ue4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGu4LEOZBJmY7zFfqm3D2d9TfXbCrc9iSkUwBO10eeAVvKg2PHrJoGXjVgc6Q1sUCEXKso3bFNgYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtokCf27Wtau88BGKt20Y9p+YawtIhWYh+sJ7tNmK5jdVYxJPM
 e9DtQihh3cw4OmcPjHVbXrylvT/8O35rf/xxm2auYzQKi/KOs70f4Q8/0W8CAS8=
X-Gm-Gg: ASbGncvDuRvQ827xdyQJ0Sva/i+Xnq/L46JZkmO6keYlRQi0KO4qVTbNivdyeykkWuN
 qNpPz9NAN7xK3FqdHMWYVOyBM36NBxtVqGMc9KCOWzJTtn6fKM/cqkXO28FsVCDnW1FogUMQddr
 BbIVJeItaPRUpy3ofvY6oGekfTJu5C3dt1qR29u4Ppm8rqqads/hGLfvASE4mM6kl+oFh77I79T
 EG/zp5MJMA9zhyPk9SrYG9GUD7m2R790iQk53tKkOUGUvLxvTuGWZJJ61PanKr+ErtKYl+PQnP2
 +UYs/KylidcMmJn40Rxkx6vK3NG8NHpiXWhzS/Hzqsc72nPyiaotoXggf+QbiyzLDAWeKl0=
X-Google-Smtp-Source: AGHT+IGx2wRNt1b93pnywaXmYh85b7plMQz/H56Gv8K9JriphvzOJ7iTLmi1YOxkbvURlnH6S1mo4g==
X-Received: by 2002:a05:6512:b8a:b0:540:1e7e:ca80 with SMTP id
 2adb3069b0e04-54414aa87f8mr253956e87.30.1738889877278; 
 Thu, 06 Feb 2025 16:57:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54410555751sm279982e87.85.2025.02.06.16.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 16:57:56 -0800 (PST)
Date: Fri, 7 Feb 2025 02:57:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Stephen Boyd <swboyd@chromium.org>, Paloma Arellano <quic_parellan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: account for widebus and yuv420 during
 mode validation
Message-ID: <yjpb5byscw7tfy2zz676j42uwavnn6rjszn7sag6mqietq3i3a@fdynfqqolvwe>
References: <20250206-dp-widebus-fix-v2-1-cb89a0313286@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-dp-widebus-fix-v2-1-cb89a0313286@quicinc.com>
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

On Thu, Feb 06, 2025 at 11:46:36AM -0800, Abhinav Kumar wrote:
> Widebus allows the DP controller to operate in 2 pixel per clock mode.
> The mode validation logic validates the mode->clock against the max
> DP pixel clock. However the max DP pixel clock limit assumes widebus
> is already enabled. Adjust the mode validation logic to only compare
> the adjusted pixel clock which accounts for widebus against the max DP
> pixel clock. Also fix the mode validation logic for YUV420 modes as in
> that case as well, only half the pixel clock is needed.
> 
> Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
> Fixes: 6db6e5606576 ("drm/msm/dp: change clock related programming for YUV420 over DP")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Changes in v2:
> - move msm_dp_wide_bus_available() to the next line
> - Link to v1: https://lore.kernel.org/r/20250128-dp-widebus-fix-v1-1-b66d2265596b@quicinc.com
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  5 ++++-
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
