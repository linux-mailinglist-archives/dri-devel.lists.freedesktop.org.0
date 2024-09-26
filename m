Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61A5986E3F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 09:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515C910EAEF;
	Thu, 26 Sep 2024 07:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KokEa41p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A417110EAEF
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 07:53:06 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f74e468baeso7797561fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 00:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727337185; x=1727941985; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4fBsPek7VpeTc/nJeOEHwHry6rvfWUqED/90OQk7PRY=;
 b=KokEa41p3B43HFPMGvqU8NV9utI86AiqkovVs+Z5JadDbaZiNHesAwoHHty8Lttxpa
 2HehCysuW4MX3iyO2+OiZ3GVGOrPDVCXz8j4IcxWOmO7sQp59+oKN4+1qbmd7Hdkr79+
 mtahIBbGdMroC6mHZjXP9lFuvrIfUKN5rVf6nkqPHNKoTdopa5LqnEGNSg6/alANXWqZ
 ZhOylACr8/qPuNgt4G//e6WMCS76vek4q6N+V0XFh+U9GI9QHSoXEyicnwH0YiNihlP1
 Ac6rnt4DxVRbIJJdHP5rAtwxRxYjhpgoQcgSjVnCFFkNodjwpDv5f4//nln0jpGqY+IX
 XGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727337185; x=1727941985;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4fBsPek7VpeTc/nJeOEHwHry6rvfWUqED/90OQk7PRY=;
 b=SSlj8ri3CAtPi/MWKrH6o1IHy7tklIiU6ZTlMctKNtuBYMpis4b8CnwiBnO1xB8oF+
 dQ7cGdXzzwChpTemzRbJIYWm5NrUFnsWQYdFlIRc28WU3FS3tvugvx44yP/hf8lsrok+
 aTKzvWKKDLsQwf7+QR4TDUDghjDVvGsuVgcHYjBrOrwWchiq0S0GXulbwY/Nlo20nIJ8
 jByoJRhYwa2PrjPA6rO82/xQKDnTruspiqHfNGlwIsPacpwVVljnd+7YG1bi4iD3UnjU
 yaqvvHiQ80ojwSlQfjQSW0qChDLfoOoZFZcEXvfBz7BLpiK+NmFYNSB7y/1QjgFtr4pt
 wiMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcfp3818V2aUN5FFTyDl3Z3XV/0X6GTCBLRIpPL87gC1vMMOxdCRm1G6n3Ht2XYmYnTxIRdo48Gpw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLmqO37XEZQx7J//h8wrCLca7i9dJOsmhBvvr7vqjVkAJzo5le
 d/xAZbA1wj1u1i/MWjSIUuLbvuE+irlG5oKSRV7fSPIh9dj9T8/X4/bM6hK29oo=
X-Google-Smtp-Source: AGHT+IE90oRm7Z3WEYstxEPLQwp1iD/xSK5xtMm1LC1hvJbkgsWGy6uGFmf7VRb6dGqjmbezndOOtQ==
X-Received: by 2002:a2e:510a:0:b0:2f7:5f6e:d894 with SMTP id
 38308e7fff4ca-2f91600c868mr25456061fa.25.1727337184641; 
 Thu, 26 Sep 2024 00:53:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d289f159sm7435071fa.128.2024.09.26.00.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 00:53:03 -0700 (PDT)
Date: Thu, 26 Sep 2024 10:53:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Kenneth Hung <Kenneth.hung@ite.com.tw>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen Chen <allen.chen@ite.com.tw>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 02/11] drm/bridge: it6505: fix aux operation for edid
 read
Message-ID: <ngr25a4x3s6hd3ztmj7h5y6zp3fxw3ojm4ax5wpk45iqdfkvwe@piznnnlyudmv>
References: <20240926074755.22176-1-Hermes.Wu@ite.com.tw>
 <20240926074755.22176-3-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926074755.22176-3-Hermes.Wu@ite.com.tw>
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

On Thu, Sep 26, 2024 at 03:47:52PM GMT, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> The EDID read operation can reach the maximum size of the AUX FIFO buffer.

And? Commit message should describe why the change is necessary and what
is being done. Just providing a statement is not enough.

> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 28a8043229d3..b451d3c2ac1d 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1078,8 +1078,11 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
>  	int i, ret_size, ret = 0, request_size;
>  
>  	mutex_lock(&it6505->aux_lock);
> -	for (i = 0; i < size; i += 4) {
> -		request_size = min((int)size - i, 4);
> +	for (i = 0; i < size; ) {
> +		if (cmd == CMD_AUX_I2C_EDID_READ)
> +			request_size = min_t(int, (int)size - i, AUX_FIFO_MAX_SIZE);
> +		else
> +			request_size = min_t(int, (int)size - i, 4);
>  		ret_size = it6505_aux_operation(it6505, cmd, address + i,
>  						buffer + i, request_size,
>  						reply);
> @@ -1088,6 +1091,7 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
>  			goto aux_op_err;
>  		}
>  
> +		i += request_size;
>  		ret += ret_size;
>  	}
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
