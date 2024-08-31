Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C4296701C
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 09:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8478710E0C9;
	Sat, 31 Aug 2024 07:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LPpKogrL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F7F10E0A4
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 07:32:52 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5353cd2fa28so3341409e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 00:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725089569; x=1725694369; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OS8ULx5Wy3Uin8uMU+jA2lsKZWXO0jfHJrS2BmvfGak=;
 b=LPpKogrLWFTwuP0OQXACDASoMiUN1f8QL7tRV/v1yg/C3JfSnATW4whqXrwdsTUllf
 HVVssIrlSO60yC30Ol67dPqgCZrdSb8eUh8tSV8NtxIZVifDWljyNTA8ut8aMsGFH8pz
 dluDUp4Zht5ij0FFsLkXJ27sWwH8vHnUajBwHVVbIFDcRvUmlvXOumaJSPWbrVcebcAd
 Gqs0uvUqUf/Lt+LbR9zQPPZ6TDGCFQFj/ISCLmMjZBnDcAGXfnWf4iheDr9vWdJiF0Di
 fmpmmq3uMUDQ+W42LDBovqvggaLf4qSDGrZTKmE64ivFTh92a+JVplCUUglhFIhU/S4q
 tocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725089569; x=1725694369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OS8ULx5Wy3Uin8uMU+jA2lsKZWXO0jfHJrS2BmvfGak=;
 b=NdkWz0+q/Pxxszg8wJg8eilD/nW8Mf1OnTsavb+zrBS7jqOKgZ8gCymOkkwh2IWaDa
 EdCtQVHbg4H2SRSpZUzVEKoBpT2fUIjNsbrBkQj3vogDIGES/NnlZ0Q187vDiC7YT7IF
 Oog8sD1F61+rhSoMBo33wUFZBKjs2POqFRv0IPbRl75TCX4f0JavEBxN/M4GotEirs3f
 X2K9GSu+qxSfu2HFdrSM0sAlkfGCEpng8iCXJH/XmRHpDkOmhpiWeXgFsL3q+Lic2HT2
 DzA2ffFAxdspdLd8yjbkfYDvKyDMVWIOCxCkQe84RHx2YJZf1tMalt+0d85quCnbvhSw
 hKQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjzawHNE7CSmAd0eqI8ia0rPh/N0ytOIzKHPzv9Zf8VVW6mYO+CxRt8eJlZOHxINjygiFCqQXHECY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUfeNZJMVHywaJuFLqckm3m+RfSFb/4Frnoos6+Y5rr9Auk1bk
 Kvouwa55vfk97RkZvbOxsuIsn4Kop+lZaGXjjPVzeBkvt3HJeTpUOPukTBIM4fk=
X-Google-Smtp-Source: AGHT+IHSwIZuGkOF6avHB4MdTpBlMLY/846/wnZaz9dipDFZweWYq6Dgrc9xbu2b5L3gvviZCMkIRQ==
X-Received: by 2002:a05:6512:b26:b0:530:ab68:25e6 with SMTP id
 2adb3069b0e04-53546ba080amr3149891e87.48.1725089568293; 
 Sat, 31 Aug 2024 00:32:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53540840badsm881573e87.185.2024.08.31.00.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2024 00:32:47 -0700 (PDT)
Date: Sat, 31 Aug 2024 10:32:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/msm: register a fault handler for display mmu
 faults
Message-ID: <4nryt4ujiefvf4xikundjlynt7bpv76qffobczm7j3s6u5qrwz@7p5gqnhy37kz>
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-2-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628214848.4075651-2-quic_abhinavk@quicinc.com>
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

On Fri, Jun 28, 2024 at 02:48:43PM GMT, Abhinav Kumar wrote:
> In preparation to register a iommu fault handler for display
> related modules, register a fault handler for the backing
> mmu object of msm_kms.
> 
> Currently, the fault handler only captures the display snapshot
> but we can expand this later if more information needs to be
> added to debug display mmu faults.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
