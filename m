Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176A491EEF6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 08:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9428210E51B;
	Tue,  2 Jul 2024 06:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bOGuWYX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC3310E51B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 06:26:56 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52e7145c63cso4203249e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 23:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719901615; x=1720506415; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2Ff4Ris1lJRxR6e0xGu/YQpNzFw2f0z8KnYBgggSnQY=;
 b=bOGuWYX9fQnTTrYJ/xUeO9Ofos0w2U7v739b3KkdJ+s78duwT6Cc6h8vv43BSpvefp
 TmUVcCzrwxhJ4R8cV9OXhlpfVBLFLPP9HZiGwnXuM5UuJaKyeHUOg9vlAHz45y1MUPbY
 ifK9ZAWewZU8yd292zBjDBJcff4Y7H7gTyTrAG0hS05mOpyKqSRYunWlTzMRffmOKbXy
 W4/QynCW+SbG2uu4mtrMzEG3SzmZkGfdTM/aYNCcpHXy+Y/AnmOSUeqAk6h5vEag+zhK
 1VoG4X6ykzaXQBGkwYTRHRbpLtRDxONAE6CfmFTJjCIkPic1e9OOMci2RPlqMZSKwN6B
 MhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719901615; x=1720506415;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Ff4Ris1lJRxR6e0xGu/YQpNzFw2f0z8KnYBgggSnQY=;
 b=UF9ni1zF89RHotSQ0JHlLJug05Dql+725Br3iILl2jQKjwrPNwfIk+jx7ZF51jT9FF
 hVPbfkEC2OJpBbrZ1a3wmkfObDKdM0y+ZTTmaNl3flVe2E8aK/rnnb7yRJT/fVqKh1A0
 KiJryWgX1S6xkyXrRj0BraFTNJYirA41+X+FZ80xE79ux06MDuWBrK23dLnEu75ctBfd
 OwZzSCkmgEDY9+3l/PeXGFaywdc42ndamEm8XT/bqlcRgbOse5Z7BJ/fiprin16BtDbV
 9Uqq9Ux+PVO6GTF8ZI+keG6G6tFBKQnt2q+2b2CkTVQpn6o2SHyOZsrRV+irguLkchcl
 V6XQ==
X-Gm-Message-State: AOJu0YzAtBT63HLRuVLY9eBnYJC9p6F3E6md9NxvB7rR4LKbzgTxjDgN
 hqmC5Y7bWU4WVnqOEvsRP9H663BO4Lag14ixPwbEnbo9yWztTOnSiW+HJeiZJGU=
X-Google-Smtp-Source: AGHT+IGTfSdpdThJDoiFSVsTbt1wJIsaM88cMQegT3fVR+tIB61p9i1DpXSZ416qGf5KdbnNaDBD+w==
X-Received: by 2002:ac2:5f6e:0:b0:52c:7fc8:8658 with SMTP id
 2adb3069b0e04-52e7b92f94dmr2534884e87.34.1719901615025; 
 Mon, 01 Jul 2024 23:26:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab0bc5fsm1642862e87.49.2024.07.01.23.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 23:26:54 -0700 (PDT)
Date: Tue, 2 Jul 2024 09:26:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
 kernel test robot <lkp@intel.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: Add missing __always_unused
Message-ID: <i46daa63dnz5an5y4463airqi57homwitfetepg6voxard3wgd@xds6h6grlpou>
References: <20240701212330.426399-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701212330.426399-1-robdclark@gmail.com>
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

On Mon, Jul 01, 2024 at 02:23:29PM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The __build_asserts() function only exists to have a place to put
> build-time asserts.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407010401.rfunrBSx-lkp@intel.com/
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
