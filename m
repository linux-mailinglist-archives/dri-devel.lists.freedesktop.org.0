Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D38D91E8BE
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 21:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5321E10E039;
	Mon,  1 Jul 2024 19:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZNOdl/4f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EC310E038
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 19:40:24 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52ce01403f6so3829590e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 12:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719862822; x=1720467622; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LG42d478wMjDA/x3ScXwVKZLN55jyKHfFUM24Exsr/8=;
 b=ZNOdl/4fVZpDBJJROoLqjiNHKFcO6eOqTyqH0yu1iESil/W3CjpYKOMsvXEA0aU+lC
 lr0gqJRrOkhevhbMS1jtvZ3AzX4AqE8FuQT3w9hsahdJo2TJU5DCa8884avZOgapqc2f
 7H/fTrgjhZOWJtU2QejJwybE8OiJZoL3WV/VW+tVXrQcSM4YQwa/7Zur+/OlAqCEWOcu
 ZVFynzovNZsA0PdI/ONVqpX3NWah7Up3RJ9cehRseOeiCHWsP+v9M1QnLH2ssYmc3/Zo
 qEoEs3QR6OUzokABwlR2oFZOtwxSIIBrMjjEORJB/9Y/ePXClnX89aRQfux9qSbVaYor
 8iOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719862822; x=1720467622;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LG42d478wMjDA/x3ScXwVKZLN55jyKHfFUM24Exsr/8=;
 b=IK60c93YiMLNc4X5tsBc7dO7BmYBjO4+0Ne4id09BaTsIM62/5vCvPHgcf2kwouZdY
 zcAx7hCa99kHcIHXvNMjWmBZ613Xu0Fn2DtZqdJFiRo0FF+2NN4Kdyc6Y9mydZXqa9q+
 MaTSJEuAR+KouBd8YtrBsARlQLcPIC5TokRtHqYvCSL6DWSpy6KgoerWDjSpjry9vWgv
 2FYguF6+sCH3gJL1fvzOE7Cuiw/UlPe+Bh8MdFHRBXLYxJoA9PKiQgVnzyH0GcSf9Tpj
 62QNOWhInq1HazY5hblbX1aaBjC3C4RRsV9/edcSuRDKJUa8q48Ri+J/+DH4tqeCgGbb
 mu9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUniJReBnP+xMlzQcAmiao/kGEQBZOgS4RVRfr8XDHIcQHnP3SbHAPYsTjNTxHk+lFwxDKFvOy+wF/+baFH9KbKCfY8fmRAAJ9tf8/OXeO/
X-Gm-Message-State: AOJu0YzJjsUkaJxTqQ9JXSk487eI4fp2+nXvgQSWgld8NEyv3oG56kt/
 4vfwMY5Kvo8gNMyF8me+U1q2nydLeXgl1KgolyM1gtaMnUSBoS54Hl1+L5DsUng=
X-Google-Smtp-Source: AGHT+IEUHekLhllAQSxrNNuLwi0wFVE+qLzcciJw1F/dT2fAM012zPiK3GflQziz+PULacDlH/FSkw==
X-Received: by 2002:a05:6512:6c3:b0:52c:def3:44b with SMTP id
 2adb3069b0e04-52e8268b40amr4248232e87.31.1719862822356; 
 Mon, 01 Jul 2024 12:40:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e8b78c7dasm442940e87.41.2024.07.01.12.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 12:40:21 -0700 (PDT)
Date: Mon, 1 Jul 2024 22:40:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org
Subject: Re: [PATCH 0/5] drm/msm: add a display mmu fault handler
Message-ID: <iitrv5ktojj6gtep4y66lsgbyrumnnn7ljcpt37bnecilheymi@hiyemrsnhune>
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
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

On Fri, Jun 28, 2024 at 02:48:42PM GMT, Abhinav Kumar wrote:
> To debug display mmu faults, this series introduces a display fault
> handler similar to the gpu one.
> 
> This series has been tested on sc7280 chromebook by using triggering
> a smmu fault by forcing an incorrect stride on the planes.
> 
> changes since RFC:

RFC was v1, so technically this is v2.

> 	- move msm_mmu_set_fault_handler() to msm_kms_init_aspace
> 	- make msm_kms_fault_handler return -ENOSYS
> 	- use msm_disp_snapshot_state() instead of msm_disp_snapshot_state_sync()
> 	  because smmu fault handler should not sleep
> 	- add a rate limiter for the snapshot to avoid spam
> 
> Abhinav Kumar (5):
>   drm/msm: register a fault handler for display mmu faults
>   drm/msm/iommu: rename msm_fault_handler to msm_gpu_fault_handler
>   drm/msm/iommu: introduce msm_iommu_disp_new() for msm_kms
>   drm/msm: switch msm_kms to use msm_iommu_disp_new()
>   drm/msm/dpu: rate limit snapshot capture for mmu faults
> 
>  drivers/gpu/drm/msm/msm_iommu.c | 32 +++++++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/msm_kms.c   | 19 ++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_kms.h   |  3 +++
>  drivers/gpu/drm/msm/msm_mmu.h   |  1 +
>  4 files changed, 51 insertions(+), 4 deletions(-)
> 
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry
