Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DC3122CA1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 14:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2E06E9D9;
	Tue, 17 Dec 2019 13:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D8C6E9D9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 13:13:42 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q10so11227630wrm.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 05:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UiukVznUb6RbaIEpjFFv8iLF7eFYnMmkDknHSlpOQhc=;
 b=PlsYyESZ7nq7NH2yQgpIg73rAVA/3twGoT+E2NgINMQNBJj9SII/0t0E3mNu+DlLjK
 xPgazXwMdXB5f6rBGo9Dpykj917jG9QlTUR7XCydqHYMBKHEZFcd+IuZE9kR2W45V78z
 5EP/LWRnFSNYjCs43rvicFPIjboFM3Elx0SyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=UiukVznUb6RbaIEpjFFv8iLF7eFYnMmkDknHSlpOQhc=;
 b=g4IczcLiF9dQX20Vk3OZQWsneGl7Iw6CX9+a8Za0vm52A1P91gtCAv6TZ3feWARfCG
 HxhjCB3cWvDEi4V20Ct8QEf5AmzcvauwDGSIDz2VOk2ILI6hWkWk51zgUXa1eNydhhwL
 1KakWqRD/u9L8J1+qicBQNHXMMwI0XfHNNT+fqRjTjpJkS3hSKQfw3wYvs9XIImfwFay
 eOdYojvFhs3dC2ehlqP+SW25a08j53GVx4KNOSs+WLBb9XmCUxuxs5+VpaQcTs9fvnhF
 +2emmDk0zQVb55LVZxaneioLzkzqhhs6I2RxfrRyulOoZ77+m9aZE+mnnE6WVTD9ancA
 L15A==
X-Gm-Message-State: APjAAAWcnSiXoEFt77CMTRLU0KKunVM8T+FySjxpEWbyLs6Ju/m6zlUQ
 ti6/9IwFE7Q7FfBbvamuwcc7vA==
X-Google-Smtp-Source: APXvYqxPRzCnT2gvRTsWttk3WXMlk8T7TgZ6vhGyRieUqp/P2hbZfco1H9nFMdnqRHYZ6d+Dbu/kbg==
X-Received: by 2002:a5d:640d:: with SMTP id z13mr37251617wru.181.1576588421585; 
 Tue, 17 Dec 2019 05:13:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id x26sm2925754wmc.30.2019.12.17.05.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 05:13:40 -0800 (PST)
Date: Tue, 17 Dec 2019 14:13:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Aditya Pakki <pakki001@umn.edu>
Subject: Re: [PATCH] drm: remove duplicate check on parent and avoid BUG_ON
Message-ID: <20191217131338.GY624164@phenom.ffwll.local>
Mail-Followup-To: Aditya Pakki <pakki001@umn.edu>, kjlu@umn.edu,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20191215194345.4679-1-pakki001@umn.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191215194345.4679-1-pakki001@umn.edu>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 15, 2019 at 01:43:44PM -0600, Aditya Pakki wrote:
> In drm_dev_init, parent is checked for NULL via assert after
> checked in devm_drm_dev_init(). The patch removes the duplicate
> check and replaces the assertion with WARN_ON. Further, it returns
> -EINVAL consistent with the usage in devm_drm_dev_init.
> 
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>

Makes sense, patch applied to drm-misc-next.

Thanks, Daniel

> ---
>  drivers/gpu/drm/drm_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 1b9b40a1c7c9..7c18a980cd4b 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -622,7 +622,8 @@ int drm_dev_init(struct drm_device *dev,
>  		return -ENODEV;
>  	}
>  
> -	BUG_ON(!parent);
> +	if (WARN_ON(!parent))
> +		return -EINVAL;
>  
>  	kref_init(&dev->ref);
>  	dev->dev = get_device(parent);
> @@ -725,7 +726,7 @@ int devm_drm_dev_init(struct device *parent,
>  {
>  	int ret;
>  
> -	if (WARN_ON(!parent || !driver->release))
> +	if (WARN_ON(!driver->release))
>  		return -EINVAL;
>  
>  	ret = drm_dev_init(dev, driver, parent);
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
