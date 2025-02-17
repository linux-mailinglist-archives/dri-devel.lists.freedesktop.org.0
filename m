Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1B7A38CBE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 20:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E9710E5CC;
	Mon, 17 Feb 2025 19:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wIyf3fGW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF9610E5C4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 19:51:16 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30a2d4b61e4so11767751fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739821875; x=1740426675; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YPHMiuUpbPXEyFU02G5OaxZJl5M9o+dz3xvjVDfgoLI=;
 b=wIyf3fGWi8kmDKKtAiR5XQNSE2lh8fmzov1VOoqR4XCCAWiX3FOJzRF8WyIc0h0Row
 0wmCa3kkG4lcdpil+SM5y4P0BcWZpI3qcjdegoRXopBwhTmK6LQiztSWHxo4V1dbTk1I
 Ybv0Xchvhx6q/2ItC16MiIxwhSk9NuVFZMkRKt8aHXqXV4R1yM1TekdR1kbLmBcC5sNI
 qyiZmAy4u37apbueJUPGfmDKKtI/Ab1DTybUoK3SnA1zVaL4z2J4hojXkh2ZTm9hmDcH
 +C2JcPaGVFvSEeG3UD37gpZsHkcGDa9JT0sxeDCol3OOhBkdUmR4UWIDjp0ot+drCn4D
 WAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739821875; x=1740426675;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPHMiuUpbPXEyFU02G5OaxZJl5M9o+dz3xvjVDfgoLI=;
 b=FSH64BXgNVtnO+rkOHOkY4i5tGgYyS4BGd1n6/JAzu0mZlo2dDfSWPT5XYIzNhQpNt
 0wJ7h3vgv17kTuO3fKutf+xRpZDpypH+c8WJKYRxmRTfWliZLtcRlcHka9efybNbYDvK
 EjWnSQOJLLAkLGw1wrNoNCYhmXduYEIcW1lUoBi5S9C8Uw3WBKEEKIvYF6I9wb5wJkpi
 gd20Wj5ol9UxARZL5ubCjxqIRHRNRhvfl/EHPaG0Ln57a9y3e6Y3aYmO5l3oElF+JvvL
 9dfHaGpyQWWozKP0zGS8RKiT1CPjqmX0LV85JXyYqphYXZauAOLpsiBhEOQwVfMZ7yiE
 mI+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMW2BXInLGdbOjZ4KZ6+My3nuw9QyKHvfwGc9zMKZTGrAQSfwevz0Yi7tnAPMdtrBM9OX8hAgoRBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXlJhEKPTlz1SxDgMqPWsIUh/C0fFVYiui/sfKx9WndColNUmb
 my9IxiZifjUqmt3SjsB9bm9ay9dHtK5SS5thCTjzQgcs3/AsQ2fWZ92N7W+dPWs=
X-Gm-Gg: ASbGncsnLtOO3EGqDaE+7Gwxc2RdctmsDVU0mpqGai6VHlaCI75FuRny1FTg/MVijKI
 bCfVGvIPM3xfAs0IhQFO9KNmuPjv7dBu2gk5qF/usH1/Mfa1KyUTavM31S/TJoHKgfJHXAS1A1a
 9J7OwYYjLO9xW45ZD1gRN1Os7EEnzSCsrVXkrtDYwRGM/5ajKeaDvmDjIdjVYiYICHrm8SH01oj
 xulWaSd4qUJ+PCkH0PmzVwZPLycyUvKtanamrmax34aCzSFgIALpuRhsDfQLhb/TMk3e6pS0FYV
 M0p3pZdTQDppOZhXR1uQUZ5WP0QW1qhckaSaqMh16AO4vm9BzGmIOyi/S2EJdPkSMvUfLG4=
X-Google-Smtp-Source: AGHT+IEQoBP7xS27h3W8daUCOs5a+K/MVyTg+zctUJ3ISgMlaM5H7WG6g1V94qDglsRK691P9WX9Tw==
X-Received: by 2002:a2e:8ed5:0:b0:308:ec6f:7022 with SMTP id
 38308e7fff4ca-30927a630aemr30983201fa.17.1739821875240; 
 Mon, 17 Feb 2025 11:51:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309cec7e45asm8598171fa.105.2025.02.17.11.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:51:14 -0800 (PST)
Date: Mon, 17 Feb 2025 21:51:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/15] drm/msm/dpu: polish log for resource allocation
Message-ID: <elx2yudvkpnrxu4q7uqm7wrhfryhd7mcmnuh3ktmtkor6sjmke@4ptbzra2k3a7>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-4-c11402574367@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-4-c11402574367@linaro.org>
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

On Mon, Feb 17, 2025 at 10:15:53PM +0800, Jun Nie wrote:
> It is more likely that resource allocation may fail in complex usage
> case, such as quad-pipe case, than existing usage cases.
> A resource type ID is printed on failure in the current implementation,
> but the raw ID number is not explicit enough to help easily understand
> which resource caused the failure, so add a table to match the type ID
> to an human readable resource name and use it in the error print.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
