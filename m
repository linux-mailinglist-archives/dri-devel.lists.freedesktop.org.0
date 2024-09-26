Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8A2986E59
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 09:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF2E10EACE;
	Thu, 26 Sep 2024 07:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vfeGNu3e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0720910EABF
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 07:57:55 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5356bb55224so901033e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 00:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727337474; x=1727942274; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JltK8FDylXTKo1/6yJmtSP0cOpyqmoQs5eQDuy/bKh0=;
 b=vfeGNu3ewwbR5TpjsLw+BpHRYIqvCMFFje/qjNoTPZ6g86tX5o07bjXOXKbN4DeJ/0
 4ypLW8yC5rg9lK+/KeHMb6nbtHE7RukVlWkFK7/HCnv3ov1bVFXtmV5rR5Nehfmvuj22
 yuPQ4HuyOZx1hzHi/+/DZcfj2ZAvwn6PeAB6/Y1fP2ezl2uewCwWUPCvYuns+xmxb7u6
 VPxxT3A8LdD+fJoay0YH0tUGTO0MS14RntBXDvmI71mLTx7TgYvhJJVNPFxEYI4zFyGO
 9fV7HHN8Ig1y2KAdJPWNbqidGAwMqBfa8DEV73yiOTDT4dTCQIKhoqiQEkGs30I6YxlV
 O8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727337474; x=1727942274;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JltK8FDylXTKo1/6yJmtSP0cOpyqmoQs5eQDuy/bKh0=;
 b=LB53I7gP/eluF/tPwcr4OBqqEfogEWwwFrmZlRQ5YulR3/u6i+7PHmmzYoI8Pq7kfK
 NI1GdHov4ZlknEYbsw+Lpq2MDfTV8JECVogvbXfgFVvNz9mgc6T51hC52dktoNGsnUER
 keMeIPQmYvw5IF1fbG1UyyiyQzF8JmERufGoECAfmv7j3gHKZwY825dV/HqobVhvP3MR
 lYA6EnF213BEaQXIrPUwsTxyClE75MxC9XSl0Y2W5puskysemkIjMTIs2l92y16KDLUL
 0G8KUuAyH3mlWEGa0HSAvEDIrsbvRMgSoJ8WVbDaNCpgwUZbrWRlFVohqxokEFbJU+kY
 5Y9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpya/PvqvdNcH5+fW5zRpGPYuz1zfDs4lph9nbnkW+BcGBh26Qrve/SozyeIgiVkVyLfk9Sa+Y1uc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx421dNxjUF8g+bgqNj3e7rWBobyhV9hwlgeK7+MqRiAS51+Ha0
 UxN8RHNjLyti4m1/6MGuG4d/d08mpEAd3swSi3OZGgBeB+vzY87Pcj2dJAA3lkc=
X-Google-Smtp-Source: AGHT+IHjv8z5giLvPlSpFaYEP6Q7nupj2epvJQNRhjI1PxL5nLm16At7qCJFmXaPGU4Ng2B6PHJm/Q==
X-Received: by 2002:a05:6512:3c97:b0:533:45a1:88fc with SMTP id
 2adb3069b0e04-53877530d28mr3367434e87.30.1727337474011; 
 Thu, 26 Sep 2024 00:57:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a864e636sm732879e87.302.2024.09.26.00.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 00:57:53 -0700 (PDT)
Date: Thu, 26 Sep 2024 10:57:51 +0300
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
 Simona Vetter <simona@ffwll.ch>, Allen Chen <allen.chen@ite.com.tw>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 03/11] drm/bridge: it6505: add aux operation for HDCP
 ksv list read
Message-ID: <acpumgqlyjyt5ql2imnhrv32apdjzluahnx77xpqu2lzltko4q@j6fhqrb7sxai>
References: <20240926074755.22176-1-Hermes.Wu@ite.com.tw>
 <20240926074755.22176-4-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926074755.22176-4-Hermes.Wu@ite.com.tw>
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

On Thu, Sep 26, 2024 at 03:47:53PM GMT, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> Add aux operaction command which supports read DPCD KSV FIFO
> with aux fifo.

Nit: AUX, FIFO. Please be consistent in your commit messages.

> 
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")

Why is this considered to be a fix? From the commit message it sounds
like a new feature.

LGTM otherwise

> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index b451d3c2ac1d..0583abdca75f 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -324,6 +324,9 @@ enum aux_cmd_type {
>  	CMD_AUX_NATIVE_READ = 0x0,
>  	CMD_AUX_NATIVE_WRITE = 0x5,
>  	CMD_AUX_I2C_EDID_READ = 0xB,
> +
> +	/* KSV list read using AUX native read with FIFO */
> +	CMD_AUX_GET_KSV_LIST = 0x10,
>  };
>  
>  enum aux_cmd_reply {
> @@ -965,7 +968,8 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
>  	it6505_set_bits(it6505, REG_AUX_CTRL, AUX_USER_MODE, AUX_USER_MODE);
>  
>  aux_op_start:
> -	if (cmd == CMD_AUX_I2C_EDID_READ) {
> +	/* HW AUX FIFO supports only EDID and DCPD KSV FIFO aread */
> +	if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
>  		/* AUX EDID FIFO has max length of AUX_FIFO_MAX_SIZE bytes. */
>  		size = min_t(size_t, size, AUX_FIFO_MAX_SIZE);
>  		/* Enable AUX FIFO read back and clear FIFO */
> @@ -1030,7 +1034,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
>  		goto aux_op_start;
>  	}
>  
> -	if (cmd == CMD_AUX_I2C_EDID_READ) {
> +	if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
>  		for (i = 0; i < size; i++) {
>  			ret = it6505_read(it6505, REG_AUX_DATA_FIFO);
>  			if (ret < 0)
> @@ -1055,7 +1059,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
>  	ret = i;
>  
>  aux_op_err:
> -	if (cmd == CMD_AUX_I2C_EDID_READ) {
> +	if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
>  		/* clear AUX FIFO */
>  		it6505_set_bits(it6505, REG_AUX_CTRL,
>  				AUX_EN_FIFO_READ | CLR_EDID_FIFO,
> @@ -1079,7 +1083,7 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
>  
>  	mutex_lock(&it6505->aux_lock);
>  	for (i = 0; i < size; ) {
> -		if (cmd == CMD_AUX_I2C_EDID_READ)
> +		if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST)
>  			request_size = min_t(int, (int)size - i, AUX_FIFO_MAX_SIZE);
>  		else
>  			request_size = min_t(int, (int)size - i, 4);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
