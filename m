Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB08993449A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 00:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D263110E469;
	Wed, 17 Jul 2024 22:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZlD2fiwg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045C310E469
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 22:11:30 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2eede876fccso2396311fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 15:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721254289; x=1721859089; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+YdknVgUnt+O5pCK+EMdo/Gub1e64a/mmcVnpk3pt8s=;
 b=ZlD2fiwgjCZaaUvQXXFCriaj8AfGc9DHPGO0t4FkbIlxz8FHgLo9mAOX4/rvigBUMR
 Ix08oqdt9a9Ll13/09ocHGQY8kF1Eap6aHjy2Noe4xex9jN4caX+YFeFH35MidvX94nI
 mMOg1eFy/cLpOA6qqd1oxz4/Tp+T266aK1dFVAW899tzmHTNzSgkZ2w9OOypnNdTjlJD
 Hl2T1FRyoZkRwoqmQnbX6OYX0CWxvvLzG7oWxJTn379UJdwGcKYL1Z5OhbHpEkm5eOSL
 Blk9M07lGCrh0Rx0rYQ3uHQDV32XvyEDb92CP+tACLaG+ZR7ryMrU1oa5DDUkczZMaxP
 pIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721254289; x=1721859089;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+YdknVgUnt+O5pCK+EMdo/Gub1e64a/mmcVnpk3pt8s=;
 b=PNca92pug+qfS1eSnRIHocZNEPvwzaM4h9vbd393PkkLg84hDQu7KG0GTMOCSXNbKt
 xi+Jo8BTvJng2Va/QGC/KYdEGQ+t1o7SNJ9CjCt3hETLuhikK8TXkLmZfvhIeIPF3iAj
 De1dYLaeQzcpQSZsbiu/4s/mdQ3TBu90UZXSWiwB/VrjfKYlckUnMLa+v/rde4hkicQZ
 1zYp54LZgRixeAB2F9eBIT+Hf/afbLRwX6VQA9G6aZhE9t2EYNnM5tkdtbudW6gBjBGl
 4sGoalKBSnng8GqxKFsxsmnIcygpgGOfZTyU9H7uH1ML8uoL0MyMpjyRIjvnVK433mnQ
 8QZQ==
X-Gm-Message-State: AOJu0Yyi128NddPaffJDyIxFgpfKtD7R7BBrgbaNtb/2LvK2Mub8jU2E
 I+Vtve6f2BI5Nt57TZJijwdY6dalsMU4OjJS5Ym8n40Df/q9eWXMdb2tkTUAm3I=
X-Google-Smtp-Source: AGHT+IFqxbDhjqt1SFKpp0mp6NjBvSH2RuOSJ/cJ9Xo8lyQSMxmjHBeRbrP7BDO0diRgPwW3eRF5UA==
X-Received: by 2002:a05:651c:235:b0:2ee:8c8d:d9dd with SMTP id
 38308e7fff4ca-2ef05d24f2dmr3860471fa.36.1721254288711; 
 Wed, 17 Jul 2024 15:11:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef05dbb5ccsm700231fa.121.2024.07.17.15.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 15:11:28 -0700 (PDT)
Date: Thu, 18 Jul 2024 01:11:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] drm/panel/simple-edp: Add Samsung ATNA45DC02
Message-ID: <d23yw632nypm3erlx2tdxgyyiysmg4wl6en6q5daupc3yeczxe@pqzibea7ya6w>
References: <20240717215847.5310-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717215847.5310-1-robdclark@gmail.com>
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

On Wed, Jul 17, 2024 at 02:58:46PM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Just a guess on the panel timings, but they appear to work.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> This adds the panel I have on my lenovo yoga slim 7x laptop.  I couldn't
> find any datasheet so timings is just a guess.  But AFAICT everything
> works fine.

Could you please add EDID to the commit message?

> 
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 38e5178f55ac..411b7218af55 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1966,6 +1966,8 @@ static const struct edp_panel_entry edp_panels[] = {
>  	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
>  	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
>  
> +	EDP_PANEL_ENTRY('S', 'D', 'C', 0x4189, &delay_100_500_e200, "ATNA45DC02-0"),
> +
>  	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),
>  
>  	{ /* sentinal */ }
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
