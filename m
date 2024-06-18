Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A311D90C4EF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 10:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7EE10E5D6;
	Tue, 18 Jun 2024 08:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SEzi8WP8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499CB10E5D6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 08:28:43 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ebe40673d8so54597221fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 01:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718699321; x=1719304121; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bYZjAGpgEt4oOgf7LT/jfEKyned/wQxFG9qSD5B+G2c=;
 b=SEzi8WP8UMKuUtA8MgrqrPzJxTGIc8hTsRnlUHpS1GpPZQy3m3SnLGERVbeEMvp67k
 EhhkL0GJ+V4cUSUMJ0SoLxkNryzY49Ohmfmt4NnotPzxuEUOQjIC2Zrha2vwiKuaDV8l
 V27Py7E/hF1/p10oevjFa3iRW6F2EEuk+Ee35WcLHzyLuGLFo6AuUIdbjiJMRLZQ+cql
 vTRZvhF3YnUCN2Vn1arDwLNrPpvJUuuf3/JtqSrjg4vbxPRE01qqSY1yJUKpqtpXL8Lt
 A70vGHO9umMyQfOSV8uK369Ck0v23TLykoabVZk0c8v3UCI2sijPhENz2Qf/am/57YGc
 X53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718699321; x=1719304121;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bYZjAGpgEt4oOgf7LT/jfEKyned/wQxFG9qSD5B+G2c=;
 b=H4j1WTWJi/ZG+oUb/aaEpShkVNA5DYlrVFnWr/QDmVhrRNHrU6mqebCwM+hjWLLx4c
 LqU4/AIanZt5LidtVamNPBc8dGMF52EbY0kKLewcvF7JZaginvj9W+rrHQI7bwiLh+vr
 og79+CN67r8hfjP4D0SQ+oUkl7Zi6m/QFgyIGlUgbvxuovurOBpE9U4b6tvvHsDhyg8B
 p1yNMJcHuPhdLx0j7BNThGS/qM8Q1G6T1Je1BAoNyOSSqr8shfazEo3TZZvvk9JqtVxU
 0YLjtRxCkRrZqW44Zd/KHChtbaimZUzmOld5X+sKa/J0GPQkFCHIm8a0+/HXI2PVrGTX
 ocKA==
X-Gm-Message-State: AOJu0YxULQSkkI1TSIU+ewRX1AZrA/allgme30GpQSO/R/gs9hhj2Lvy
 dPJ9Pkodz6hjpgz3JS7FtJ7O1uWo8OKraiTWDIvlK4NiBQUQgpF5q6yXuVWNqV0=
X-Google-Smtp-Source: AGHT+IEwq8nhRRqn9q5YxuzIXR5AcAtlRS1/gJNxZ9ufr0fPbu7ispovCsrRMZxqawaZ5SghogxRog==
X-Received: by 2002:a05:651c:b14:b0:2ec:f68:51d2 with SMTP id
 38308e7fff4ca-2ec0f685646mr85838011fa.11.1718699321178; 
 Tue, 18 Jun 2024 01:28:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c7813dsm16388561fa.76.2024.06.18.01.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 01:28:40 -0700 (PDT)
Date: Tue, 18 Jun 2024 11:28:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/5] drm/msm/adreno: Move CP_PROTECT settings to hw
 catalog
Message-ID: <eob2zex45yckr2ufuq5deerpuiwhcyfpzxrqj56zoc3t7w4uye@kwvr23fxhvex>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617225127.23476-6-robdclark@gmail.com>
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

On Mon, Jun 17, 2024 at 03:51:15PM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Move the CP_PROTECT settings into the hw catalog.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 247 +++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 257 +---------------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   2 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  13 ++
>  4 files changed, 268 insertions(+), 251 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
