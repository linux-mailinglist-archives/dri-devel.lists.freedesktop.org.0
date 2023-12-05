Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 042358056AB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 15:01:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6941E10E532;
	Tue,  5 Dec 2023 14:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817A810E532
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 14:00:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40bd5eaa66cso45601415e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 06:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701784856; x=1702389656; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LGKU/B3Bx2Yzi5OmM9o3RWqdkFzerbywN5kCuPw1/JI=;
 b=kDJxgAOri1gg5WTWeKU2Z3y/x0zcICn6Zzf6w6ZmHc7ZmG2d58LgGZcj7OOEmN8HIO
 wT8jK5rgI+7YwCvUb5jvxkADpI7WPLC38ICB/QCnn3UcD5N47owgCjwdHZk8g3D5RUde
 YZhfN6TziyCAd67kRaZfIYIeZDyyCJGrMSV0+5TVDFC0t8+sOpfQ1uHYFSdCVee8hvhK
 08jZVgEbWm62Ds8jMD6FoyzEcxc48ep9B6wCyj7hOWyaG8DcndBp1GxTD1ptczKY79Bo
 WMzoDxk4Z+5OpT7yNQzFI3ONijNwnY930L4/HTpoqfRajZiW90tiWFXqH5S7XqB0oiFz
 YZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701784856; x=1702389656;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LGKU/B3Bx2Yzi5OmM9o3RWqdkFzerbywN5kCuPw1/JI=;
 b=eoSMF7V91oNH7n2j6C4hOf5P/YcE9kkWR1W/I8RgKNxtwYMvw7Q0xyssF1OIQmJ+Pq
 6rmrE1mfoya+e0Vn8PzH4pOc2tEMpNTKUS9YKSme0000sxRsSD1UGK1c5iqxKHlcF/lp
 ykCPf5AsP0mkdM+v8D1cfM8UnpTt9Rqkv8sle2zj0oE0X7xacKX0JVZ9iQ0TvGoC89oG
 pXUVpsjrblDgYjWXtOu5zcYMWaRl3hK6pmD1K1ZBCD+GFNoN6/HdgZ4uzG+FdY1JnJyh
 Pfe0mJZdE6v00V9zBDKG6XwVh1rYC2YL0E9ERJKIBBZbhyMR69f9H/MjCydp5FKdW46V
 XWAw==
X-Gm-Message-State: AOJu0YxB8xJf8BHu3izqKF9dvO/CJAYjmjzncR902s4tfHcEKTi27A53
 5Vb2gHFkXYHWh6tNY6uDen4sVg==
X-Google-Smtp-Source: AGHT+IFbFAD5sWyepu3ePHaYgueIW6BW7i9W1ch4x7D0b2M5vX7xa2yi4WW7aC30oOMdj38jGgYIeg==
X-Received: by 2002:a05:600c:474a:b0:40b:3d6e:16b7 with SMTP id
 w10-20020a05600c474a00b0040b3d6e16b7mr536677wmo.33.1701784856266; 
 Tue, 05 Dec 2023 06:00:56 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c451100b0040b379e8526sm22325954wmo.25.2023.12.05.06.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 06:00:55 -0800 (PST)
Date: Tue, 5 Dec 2023 17:00:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Robert Foss <rfoss@kernel.org>
Subject: Re: [PATCH] drm/bridge: nxp-ptn3460: fix i2c_master_send() error
 checking
Message-ID: <a10a75c7-0626-454f-a3c4-d6031713f26f@suswa.mountain>
References: <0cdc2dce-ca89-451a-9774-1482ab2f4762@moroto.mountain>
 <170178410677.683894.16036596185582079991.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170178410677.683894.16036596185582079991.b4-ty@kernel.org>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 05, 2023 at 02:48:26PM +0100, Robert Foss wrote:
> On Mon, 4 Dec 2023 15:29:00 +0300, Dan Carpenter wrote:
> > The i2c_master_send/recv() functions return negative error codes or the
> > number of bytes that were able to be sent/received.  This code has
> > two problems.  1)  Instead of checking if all the bytes were sent or
> > received, it checks that at least one byte was sent or received.
> > 2) If there was a partial send/receive then we should return a negative
> > error code but this code returns success.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
>       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=914437992876
> 

Wait.  That was unexpected.  Neil's review comments were correct.  I was
planning to send a v2 patch which was just a cleanup.

regards,
dan carpenter

