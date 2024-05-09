Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F528C101E
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 15:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDD010E8CA;
	Thu,  9 May 2024 13:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vP/6QmrK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AB110E8BC
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 13:07:47 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-6f05b8fc6c1so408251a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 06:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715260066; x=1715864866; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dq/7jv0B6IQSIW5ezeZnjPK1GMhKRF8SPgvddGu3eY8=;
 b=vP/6QmrKys4lpsCF3qQdRXTI9j3XXYRJG76wimZmK1Yg4tVwukaEPlOl0jeOCqc0if
 ld74GPJjLcuPnyjJZhgtC7kFYIlGEmtgnZkrg88IqgfpcnKR+YDNZoVNIw3uwSSgO8o9
 ZZLe6asIygRsQWbxbRu1ET+5Zdb9s70zmKwGIM/vnbZFVkHzHgL6+KlyJCzJYZNjGPNp
 fqVtIW3NfiC6fzyDmLc/zOAltiujGRbS0UcgqGvmNgLpHg4vrI+f5UCFQmggyM6rkvjC
 d+k8bAAHREDwn0DooU6dG813nGADOQFvKyDNYFCVKmi/KnCQJKuddwuB+cU7k8Zds9Ma
 STjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715260066; x=1715864866;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dq/7jv0B6IQSIW5ezeZnjPK1GMhKRF8SPgvddGu3eY8=;
 b=uca6PuYDtMs480oVpSVwqsekCjZvuu3EQ161JqaaFOuGBaTn9btKLAa8ErdCOYJ0Qy
 6APgdF869OWosrBoLNANLekVFhkEeakzr82bhw3iUbSCLzU9IZ2mh3ClQFqP7+iobWfV
 fThOSZwL7DDY1TXLd9Ah0rynT2qPUl64BRT3zUDG9BGNyg0wO0vzI9gPALB3jKu8vR4U
 LYdYbhOY8t2yfxKcfJUkS802XrcVfc2iUkNZcBTMR/RNPtT0h2Bz/iALa2nYrLFG0bt7
 iwjvKQE6mCdrvOrktVGHR38XeIBvkjA5pawvhcHnft8pMdtVc2zyLnnBi9Mk0LDix3hM
 neag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFh5CJbhjzgUBEy9Fx3L93MJFrXjjIfS04CNNVeqbRIuOoXeMz+vZf00984wkvFfwCbmkfMLCPMfLeFXATlLza1VHn1eUseVwAY4KYOseR
X-Gm-Message-State: AOJu0Yx2qm4YaumWtpX/dHVSVSaJpZSVkZwXFVqUWVl1aFBfYYrYu2wf
 Ae7MsagWeHCkPiPiDD9IlROy11vGUo/P8LqRduqC9vBziQfvHa/qWBRfwVTVb8SSJkOz3QCp/Pa
 QzcCft08WJn8ZvymSi1GuKHeIKHxGobeNjVTHLw==
X-Google-Smtp-Source: AGHT+IEzWUdmpapzSIoFpj2DfAmoac8yI22Bh1WIGABq6d2/lIZ+FrGwyUl/xliHUdZ6iq0y1VIvQMAuV+fw1Y5IS0Y=
X-Received: by 2002:a05:6830:4118:b0:6f0:7e5a:95ec with SMTP id
 46e09a7af769-6f0b80e3a15mr6185005a34.37.1715260066027; Thu, 09 May 2024
 06:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 9 May 2024 16:07:34 +0300
Message-ID: <CAA8EJppJQOjMOPJYcEfD56knZzDed2ijp6HaQ5wP+UdC4Nw8FQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 seanpaul@chromium.org, swboyd@chromium.org, quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 8 May 2024 at 02:05, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Since commit 5acf49119630 ("drm/msm: import gen_header.py script from Mesa"),
> compilation is broken on machines having python versions older than 3.9
> due to dependency on argparse.BooleanOptionalAction.
>
> Switch to use simple bool for the validate flag to remove the dependency.
>
> Fixes: 5acf49119630 ("drm/msm: import gen_header.py script from Mesa")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
