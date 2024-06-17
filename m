Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E7890BF83
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 01:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD2E10E1C0;
	Mon, 17 Jun 2024 23:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MGKLkEHM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3755410E51A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 23:08:48 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52bc035a7ccso5148570e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 16:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718665726; x=1719270526; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aItYv47n04oe+ak8w/3qYRjP0+9VimLnrV46ub/7RBA=;
 b=MGKLkEHMEXJuzJyS/R4qhwjWJKjPM1Qaxwgb3vwH5QOhFzDHaJjONQKcJWFa09bQFs
 bYBBgZIbxzcoQi6CxbtSx42pb4gNJzebZkdCDl4nRX6VcmSE36h3f+8JnZEymYGI+vlu
 ZGznQ+GxJtCuY31TOiqLQb+hBnTXT6qy/VNTXqqqyczT5sLoFaxTKMmKducvuBhsEz2P
 oX8zatu9B2afSmHUyktJOOs3S8fLPWGw3bqS+NqXJ0G5EfHH6/gb64aGoGHg4ahKUPSg
 L35t+smmqi3LBZ8iob2Sxw46EPXwcHXgon6zLC5/4Pjv3hsQISIH8OK9WlB5YB4Edidz
 Fm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718665726; x=1719270526;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aItYv47n04oe+ak8w/3qYRjP0+9VimLnrV46ub/7RBA=;
 b=gS8JbXO63tda8TaYY63gE8IHrrpyjkQAA95Dw94j8mpe1M7xWREXOkE4KXDag6t+AE
 qSyVWPZtulIynWnv26NliEitFnj3uoPxRvC2dMDUHVaMOJ13JWUcFZiVznt+dZCAS9h3
 PH5F5NLgyMoTWBpicRHZR58lpUtbf/3GK+uczFjreAqWmp6zZe8iyq9LbS9odH9Tn9J+
 mWh9SXLsP71NKyc1PSd3cmVGHuBqkxHxnPWi8RdM1yieUSe+AYSL8YEPdiVZdvCjaa1Y
 io028cwQdq2J63/z4TWcu+UBeTMjyb9iPz4DLjcW9TA3oIyfH5XzbPK9XRZtwKOjshpf
 v9ZA==
X-Gm-Message-State: AOJu0YzWJHbvg1NadnZCsHM7v3FPF8LFCP4S2PTuakNy+ZqDT/V/qN7i
 ElIIYq/eRLa51fHXuOTcio9oOhHm+glt36DLXnq7vM3H6rgfmbV6VnAwuDCSluo=
X-Google-Smtp-Source: AGHT+IFqRbG4SXGP7E0yHY9eOqloQKarrRolhd8SgBkpIWf9H6iu6gUa8HngxjYwH/kPq1z5Av3dng==
X-Received: by 2002:ac2:4daf:0:b0:52b:c33a:3959 with SMTP id
 2adb3069b0e04-52ca6e65845mr7172003e87.28.1718665726064; 
 Mon, 17 Jun 2024 16:08:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca282ed7dsm1379069e87.92.2024.06.17.16.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 16:08:45 -0700 (PDT)
Date: Tue, 18 Jun 2024 02:08:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] drm/msm/adreno: Split up giant device table
Message-ID: <k4gtnlli7ocmyizfsr25nuef5hqjq5a4pi4hjqej7nj2xtak2i@jjhfryck2fyl>
References: <20240617222916.5980-1-robdclark@gmail.com>
 <20240617222916.5980-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617222916.5980-2-robdclark@gmail.com>
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

On Mon, Jun 17, 2024 at 03:28:59PM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Split into a separate table per generation, in preparation to move each
> gen's device table to it's own file.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 67 +++++++++++++++++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 ++++
>  2 files changed, 63 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
