Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F608FF101
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 17:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F36310E9CF;
	Thu,  6 Jun 2024 15:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PMS9CG04";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3902310E9C7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 15:44:42 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52b912198f1so1635499e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 08:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717688680; x=1718293480; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CcvLWtoAhuxv7+XmnyzWyh5/jHFSbk/UPbtacznbqAQ=;
 b=PMS9CG04/wX37MyoZN1nkjMlDMHhe9qMju4lU24E+aQHFdaszuc9HDJDAFDXRN2GKW
 DSN18FsMhkSmrd28bry4zbOBv3gZMdim64/n4jT+CvQxdikUmuHMR7Cjy10mUHp0HHs1
 i4ig8pf0yLuWoSd2Udt0bSc7onQ2Uww0HfFf2ta3Q7VlKZp4fsoYW9eIydtxBl0vumK9
 0Xg+0jfZ0C1ZDhYzZs0bsjWHCaNQ83Fzo0H0PeIsrG7GKM+RACLyiL8cGtYe29cw5MlI
 YmH3VKSye7xkg1S/LtdAvMz50CO8jTUxELZvJ/1txbCaAlDq8afZ4ZDNr6qx8I2D7Htf
 F4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717688680; x=1718293480;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CcvLWtoAhuxv7+XmnyzWyh5/jHFSbk/UPbtacznbqAQ=;
 b=Nmzgx1vVAxZJK++pvOqFd5Xu5g99GlL7qd7oYuoGc6jmzErC7Ajj+IZ8Jz6oAQRHEc
 RK0BYAwr9G2GTYInY026drMed7Mx8AV07HVUs9zXC8WyIlx8qy34XzOECjpB3SYyjpol
 GyUnS58NmTwSPFhwVzntprYfgxlBNqRQkU7sihsj7Phyd+fV/j9vTL2PKggKJTHuVigZ
 EPtnyqp5zzoR2nA0jwiuZGIUtG4DzoHVaqkKc0AGomTOkF4nknvetswqAUYNs6fNGzjC
 9qWm3vu0lWmmTajtToQhVmOFdRtzkk4BMzsbj6ZlNZou9gTpW64X6uISH4a13dJ15w4/
 o2mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/tNdORoqD+E5W7qkRy3KwcycK0PcZ8iTlGY9WLATPEstmtKChEVvnAqponrp1gnRTizqa3WkbwIU3WIQAgU5CKKVLr+aZD7h3gh0BZouo
X-Gm-Message-State: AOJu0Yy44nhM+X0bxjMfOYahgQtKjjkVesmOTmPm35YO/53qGlgSDgsu
 hApQM5pstRfoqXbKB7D79LmwRwaSjdivfHSk3Vz2kzMqM0JsAZE6oHlyiJ7IaxI=
X-Google-Smtp-Source: AGHT+IGfkquA6C70zvNtH1bpeU35r9otrSSRpObdg1UiWOp9nLQV2leYilFdaGLb2X7iS4KqqbZ4DA==
X-Received: by 2002:a05:6512:3b8:b0:52b:7a3c:36ca with SMTP id
 2adb3069b0e04-52bb9f7cbb5mr3964e87.27.1717688679984; 
 Thu, 06 Jun 2024 08:44:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bb41ee6acsm227187e87.80.2024.06.06.08.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 08:44:39 -0700 (PDT)
Date: Thu, 6 Jun 2024 18:44:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Connor Abbott <cwabbott0@gmail.com>, 
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, 
 nathan@kernel.org, Rob Clark <robdclark@chromium.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/msm/a6xx: use __unused__ to fix compiler warnings
 for gen7_* includes
Message-ID: <5b2o5hhq76pa322bum2td4cqqa5333d7rdxxsxulhalt3j24pi@ea7wzku5waf6>
References: <20240605183415.259276-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605183415.259276-1-quic_abhinavk@quicinc.com>
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

On Wed, Jun 05, 2024 at 11:34:15AM -0700, Abhinav Kumar wrote:
> GCC diagnostic pragma method throws below warnings in some of the versions
> 
> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:16:9: warning: unknown
> option after '#pragma GCC diagnostic' kind [-Wpragmas]
>   #pragma GCC diagnostic ignored "-Wunused-const-variable"
>           ^
> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:18:0:
> drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h:924:19: warning:
> 'gen7_0_0_external_core_regs' defined but not used [-Wunused-variable]
>   static const u32 *gen7_0_0_external_core_regs[] = {
>                     ^
> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:19:0:
> drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h:748:19: warning:
> 'gen7_2_0_external_core_regs' defined but not used [-Wunused-variable]
>   static const u32 *gen7_2_0_external_core_regs[] = {
>                     ^
> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:20:0:
> drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1188:43: warning:
> 'gen7_9_0_sptp_clusters' defined but not used [-Wunused-variable]
>   static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
>                                             ^
> drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1438:19: warning:
> 'gen7_9_0_external_core_regs' defined but not used [-Wunused-variable]
>   static const u32 *gen7_9_0_external_core_regs[] = {
> 
> Remove GCC version dependency by using __unused__ for the unused gen7_* includes.
> 
> Changes in v2:
> 	- Fix the warnings in the commit text
> 	- Use __attribute((__unused__)) instead of local assignment
> 
> changes in v3:
> 	- drop the Link from the auto add
> 
> changes in v4:
> 	- replace __attribute((__unused__)) with __always_unused
> 
> Fixes: 64d6255650d4 ("drm/msm: More fully implement devcoredump for a7xx")
> Suggested-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
