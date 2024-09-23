Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F191497E543
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 06:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9C710E0E8;
	Mon, 23 Sep 2024 04:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cltmgouq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045C410E0E8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 04:21:27 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53661ac5ba1so3963206e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 21:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727065285; x=1727670085; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9UX30i2zA4yW1Ql73C0KW0/A+BlKe7ZYSoQVaMBiTug=;
 b=cltmgouqXGS7GQ8DB8q0zl7LvtnXjaU/w2rafOKG9xUbwapa+w9bBdIE0JuwbocC4K
 OO2Y0Ii84EnlbN0vqDtGCP2ZmTpN69sMOPpyvGLTMsiI4+WAw74FyqsmG36O2GEeh4d4
 divLKnGIP7uUghl4P1ifgbZH8HH9rhx7AV02j5oKa0a04OLItLgU5d3/Qqw96UCaIThw
 AlLARwaVOrCqifP9VAEqhLcYoacbJsJXhpOxt1Xg5lv1UuEEd9KKAd+dJniEi8tuC3Tg
 AgChsyLkwi09IPnoMzDxNsS67LyU01nJ74onChdS67J/5frlPv/4+gIRJrm6tipV2qpZ
 fZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727065285; x=1727670085;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9UX30i2zA4yW1Ql73C0KW0/A+BlKe7ZYSoQVaMBiTug=;
 b=QMtGzInKDvjj4JWIGIr2QoMJpQW60U+2TSm8nHLCRO5oBouwAcBMid6i+x39x4MI29
 AU/9N5lwAK7naErUv27vzNnHhAg0Uj+N/pgASueADo0eu+6ITGYBtds74Wwe+Z2NJooL
 MrjEBl+rDHTMgvhpgUQzAOHCeCgfWJdrQQ8T9MrtjGkSe9bt7B/BBT0ftdeq2MBAvHl9
 0ahF6TwzsBYOLGhmBcUXiRahJOKgg0MfUi0Lok3twfqRwWKY2nPpsQsSA/401ffqPg86
 I/wi1pLcGcE56jyoI15CuJyaYzScZ8P6SezN3zvzhddMDnRlCYXQE/Ru4Ub98/6TSN3b
 D4YQ==
X-Gm-Message-State: AOJu0YzDj2HSHipOSBdqL2dN9CP3kWjhvMTyOJHkLJH6rQ9x3DW6weVG
 +9TPu9HmEuGGN2sfs95xQBvSWvtH098d5DlTZaemvJ9RrT+N1yUvhhQFwwNmVS8=
X-Google-Smtp-Source: AGHT+IFmiYTH3GZizsvWgDordIgmbGnH+InAibsj8y6AC510eeUrKn0wOi5xlapFZC+j7h0tvVCVfQ==
X-Received: by 2002:a05:6512:ac9:b0:536:53b2:1d0d with SMTP id
 2adb3069b0e04-536ac2d03b0mr5038212e87.9.1727065284533; 
 Sun, 22 Sep 2024 21:21:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870a4647sm3137008e87.194.2024.09.22.21.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 21:21:22 -0700 (PDT)
Date: Mon, 23 Sep 2024 07:21:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liao Chen <liaochen4@huawei.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 linus.walleij@linaro.org, 
 thierry.reding@gmail.com, mperttunen@nvidia.com, jonathanh@nvidia.com
Subject: Re: [PATCH -next 2/3] drm/tegra: Enable module autoloading
Message-ID: <3ttycjomydslmaqtwnhjehrj7pa7m2i2daqd46kwd2tsxynr2t@jo24br66tz7b>
References: <20240902113320.903147-1-liaochen4@huawei.com>
 <20240902113320.903147-3-liaochen4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902113320.903147-3-liaochen4@huawei.com>
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

On Mon, Sep 02, 2024 at 11:33:19AM GMT, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
> on the alias from of_device_id table.
> 
> Signed-off-by: Liao Chen <liaochen4@huawei.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 03d1c76aec2d..1a12f2eaad86 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1390,6 +1390,7 @@ static const struct of_device_id host1x_drm_subdevs[] = {
>  	{ .compatible = "nvidia,tegra234-nvdec", },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, host1x_drm_subdevs);

I don't think it is correct. See how subdevs are handled in
host1x_device_parse_dt(). I'll pick up two other patches though.

>  
>  static struct host1x_driver host1x_drm_driver = {
>  	.driver = {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
