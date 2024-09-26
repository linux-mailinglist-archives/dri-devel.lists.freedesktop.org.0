Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0F3986EA6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53E410E89F;
	Thu, 26 Sep 2024 08:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OmvWfOsX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C4810E89F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:20:43 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-537a399e06dso970775e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 01:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727338841; x=1727943641; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lhXb2BMlBPjRPmOBalS7Rdb6ZOjPGN2SYGGnIxSjxAM=;
 b=OmvWfOsXRmZKTP0I6tVl5EwqozDSRfV8QLC9ONNItLm7um7JBkA+LJkuXrkYM7v411
 ImrKHcOUKpXq72Yu1uDr+dr4sW9x8o1klBKO2yr6T0uNSZjrhEIFIe4s3PPlRlqPDhk5
 RV4TOTU6Zmwzj9YJ1cipv5oejaiyjqEITUvSVSMxgvIcDxIUNemty+pFwqptwdUFJ32N
 vzri6N46YHiyRLQlmSb0vUbrhskdSO/ukLb1GvvIYNf6c5eHhR5VbRpnY0n5QkSdNupX
 bWHCah6sJFFqUthbXzMUf3JipjswLePFVdXLJzMBrqFPUW+dJatwLHNP9Mr/glV8pJjn
 I9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727338841; x=1727943641;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lhXb2BMlBPjRPmOBalS7Rdb6ZOjPGN2SYGGnIxSjxAM=;
 b=BAjiDzuQQ6Q6pFFDv63HJjAwfkfiqVNK7YNy6Ds91RBSGO2woOFAjWcJOo6ssI1qDC
 /3+mqn5TwCeNnguq2Nbc4A8xAW3DOSqvzThqHTa3x1/b/Y+kBQY4HkvT9h/Ptj8zrleO
 F6NC9hHX0bENHxQ4w5olEdeHo/EFdymSXCo/XA5wA5PxoGYpIjcHKAtnoU1Kat3EXv4G
 Jn3bPjItbIEM4Z51wyti8v+D8aYYvU2AHpitRGG8NWhC9P+q6b8hrvdYVnWhgaRpTNp9
 FL4EBGdFTgy1/Lr/+K6X3valw6pnmPF9sXBDi7CVYtJYlt/i132MafSlF945SnqbKV0D
 tojg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa1ZIISd2XKzK2wu6MKXaK+Ul7lpiSDG19bWGl0Cnwg6n39iQbwl6xXhVW2gXq4jDmHCbJnHlrMUM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1PU0xYRrxum2pG0SVnlS8EfOQH0nRIOhdnA9F+s3W7UnUDwln
 Srs1SWwn6fTqVOgeVnADg3/v5Urj1IbCZ5864GvFMd/emMZ6dDQyBqTnVDToATg=
X-Google-Smtp-Source: AGHT+IFK+jXryVzVLW2y3ifKDKgBpOQbwR5ujjugsr97Kro3qvTFnMQn30mFK9B2YZMffWN5e3s75Q==
X-Received: by 2002:a05:6512:234b:b0:52e:be84:225c with SMTP id
 2adb3069b0e04-53877532254mr3550333e87.33.1727338841203; 
 Thu, 26 Sep 2024 01:20:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a85e0f89sm739271e87.62.2024.09.26.01.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 01:20:40 -0700 (PDT)
Date: Thu, 26 Sep 2024 11:20:39 +0300
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
Subject: Re: [PATCH v4 10/11] drm/bridge: it6505: fix HDCP CTS ksv wait timer
Message-ID: <7pazkukfrskc6o2zd23h6o4wyt7ougjjgnmogy2effr2lof7di@7opphoswhebf>
References: <20240926075134.22394-1-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926075134.22394-1-Hermes.Wu@ite.com.tw>
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

On Thu, Sep 26, 2024 at 03:51:33PM GMT, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> When running the HDCP CTS test on UNIGRAF DPR-100.
> HDCP must disabled after waiting KSV for 5s.
> Consider system ksv work schedules. The original timer has a chance to expire.

I can't understand two last sentences, excuse me.

Nit: KSV, not ksv

> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index e75bc1575aa8..22d9bec3faea 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -2093,7 +2093,8 @@ static void it6505_hdcp_wait_ksv_list(struct work_struct *work)
>  	struct it6505 *it6505 = container_of(work, struct it6505,
>  					     hdcp_wait_ksv_list);
>  	struct device *dev = it6505->dev;
> -	unsigned int timeout = 5000;
> +	/* 1B-04 fail, wait to long to Stop encription(5s->3s). */

encryption, most likely it's also "too long".

> +	unsigned int timeout = 3000;

What is the timeout per the standard?

>  	u8 bstatus = 0;
>  	bool ksv_list_check;
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
