Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC128CEAD2
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 22:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973BB10E062;
	Fri, 24 May 2024 20:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="N9Tj9Y1e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1777F10E062
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 20:24:57 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-529614b8c29so2003219e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 13:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716582295; x=1717187095; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LNe1VPOg2pnJsgOYog+ugBuIIMZ34HnriJcb78FTPH4=;
 b=N9Tj9Y1eMXHsSLKk1kZAxkx1C7E67ntlewTwmlBeE7ZFGZBVE5qv0M8REUomwA8OxU
 bxxLuofm8ZgXRn4A6a4Ln/+4DbgEuOjkFO4lbQtHzZfJXX8BEB/I4StDykMlwZjUoMww
 tdhT3L/whnaOL8AeSoyOgH2pxrq+kkIQtH4xd9IlCDrRCbsiRQM49DDUyo97aJ/QVOi2
 8d9JCHNfHL8sFGKv8tLYVssBV/E/ZFOqsRX0k3NOet4q/Me4XZkGz5i4NNxP7KHm1T6J
 ckEYgo47dMxN6nFLBB39SfNqBvniI39I1WxeBf2PlI1PyC51HJQB0ktYaMMZ2FbXsogT
 p7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716582295; x=1717187095;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LNe1VPOg2pnJsgOYog+ugBuIIMZ34HnriJcb78FTPH4=;
 b=JNMW7wkzZ8wtPTXLjnFBGk2k367tDlv2W7b/olc4PNXA6Hz3Xh+aFdVGnQinMIHWV5
 SreH3QA48tMRi0nWp+iYU/T3c7MVTHvd5f9ATNSUXQqZABCop8m2+lv2I7/V7ndaexa/
 O2u+3bTbz6lV+avlnm28Em2C7pmfQvDSDod/kHFw1B3KtX9yiDIkXo3fpqFTaoCI77ly
 UMYetzmnDQbyj0WCDM3hne3eH7i9CvwTYLOS5LKko3svFZwObmscvs6pcqbgEqvqt6Fv
 PjXL9E0U7iE/ibGOFlOAIuiao6vT3tDiXyWfGcurLp8WmCgiJj4B7d1WJVoLqdk4DI4g
 g80Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHX09thGKZ/GEGiSEGze+Y/r34MJi4fdIS7fBfWj7hqa+xjO3hgQkWsFZgQKHUrxFYEl5qTZl5Me1lbQ5QuM1RDOmprdMzYZWqyOo9j+1Y
X-Gm-Message-State: AOJu0YzyUGpriEOtSdKQwYSwMmPYgqVsL7FEEa8rCNJr+6VyjHaxaHzJ
 9RVfB4+yHlCl+t7JEppY8ud+AZdx6Y+em/kaWdXXYzbwb1vRQHCloU9hXaYr3AA=
X-Google-Smtp-Source: AGHT+IFK/UOYNobb+19kRiunV46R/7UuZjv6dAHZA5c3clRnKdAoy+V1nARP9j6yvSU+9aLn9b3byg==
X-Received: by 2002:ac2:5386:0:b0:51f:488d:274b with SMTP id
 2adb3069b0e04-5296529058dmr2700640e87.9.1716582295186; 
 Fri, 24 May 2024 13:24:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296e87ea0esm239354e87.1.2024.05.24.13.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 13:24:54 -0700 (PDT)
Date: Fri, 24 May 2024 23:24:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Junhao Xie <bigfoot@classfun.cn>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Ryan McCann <quic_rmccann@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: drop duplicate drm formats from wb2_formats
 arrays
Message-ID: <h7ezuquewatnuyuzkzcpw7wbx4jbpfmxzjvshvyjjy65kz6vsz@bmiqpykq46v5>
References: <20240524150128.1878297-2-bigfoot@classfun.cn>
 <5db69319-4d61-7637-8bde-5d786e5faea4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5db69319-4d61-7637-8bde-5d786e5faea4@quicinc.com>
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

On Fri, May 24, 2024 at 11:19:41AM -0700, Abhinav Kumar wrote:
> 
> 
> On 5/24/2024 8:01 AM, Junhao Xie wrote:
> > There are duplicate items in wb2_formats_rgb and wb2_formats_rgb_yuv,
> > which cause weston assertions failed.
> > 
> > weston: libweston/drm-formats.c:131: weston_drm_format_array_add_format:
> > Assertion `!weston_drm_format_array_find_format(formats, format)' failed.
> > 
> > Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 ------
> >   1 file changed, 6 deletions(-)
> > 
> 
> I think we need two fixes tag here, one for the RGB array and the other one
> for the RGB+YUV array.
> 
> Fixes: 8c16b988ba2d ("drm/msm/dpu: introduce separate wb2_format arrays for
> rgb and yuv")
> 
> Fixes: 53324b99bd7b ("drm/msm/dpu: add writeback blocks to the sm8250 DPU
> catalog")
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> (pls ignore the line breaks in the fixes line, I will fix it while applying)

With the Fixes tags in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
