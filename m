Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7032174360
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 00:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF946F530;
	Fri, 28 Feb 2020 23:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9A96F530
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 23:40:22 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g83so2968212wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 15:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=HPQ0vMjcYBqlg394dEQ/4gsJnXVnnOWOWAqm+ggMU98=;
 b=QLC+z2XfmDUoHotHgxdo22k3WQ516q+eTmA2xrFluquOvHy0d4Sd6g73yUVfYZ5fFR
 NO7D5YH3pAAqVFLcKS1iF1sbJvfU5pLf2MiGieaWJnVDO/cti25b05belwneJSun35uk
 602/rga6hTxrKRBu1psZf9zGwPquy0oltIeV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=HPQ0vMjcYBqlg394dEQ/4gsJnXVnnOWOWAqm+ggMU98=;
 b=bSRHZgO7c6eVEeg/tME6y+jHgtIDagPO8kJOsQ98OOdswUIE12o86EmQDwty8Bs43r
 AchC3jWMtjMC2N2+uy+Etwg1fY/uuruKIe6eaU06Q03xtiOhXQZyJXx6KkPwMHQkwg2o
 fV59B+6GW8OJwKQaN05kxYBKlivUTu+rqtnE9BYhE9oNDVNiS6yuwVgnPaUeEJKEVfg8
 MHeNApkdoeeRRuJEWIzDpOoQQbJJUlM5NeRYtGsIu7oAG5giUQTiyaHJQ81FKUXYt9Q7
 kQIpeol5yQ35vrswVpxmvrKY6r5SVBwjmjrJapeST+BzE+o2AvIVzKofqgbkvMw+a4ko
 lcuQ==
X-Gm-Message-State: APjAAAW6tL/rNh8qZGDM9MyMK6Zbbw8M59aWL0W61lRfWocZLtFPAvXJ
 RbTn3SDyqTamIbfof2iOjf0Cq+/aGm4=
X-Google-Smtp-Source: APXvYqyO0iFrnGt7nWTY7vEtpiJdxw3S7UzoWgSGTzWNRpRcJrW749cnTPe1nXba5aAXJO42ot+jEQ==
X-Received: by 2002:a1c:7ec5:: with SMTP id z188mr6730603wmc.52.1582933220720; 
 Fri, 28 Feb 2020 15:40:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t124sm4699111wmg.13.2020.02.28.15.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 15:40:19 -0800 (PST)
Date: Sat, 29 Feb 2020 00:40:17 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm: prevent a harmless integer overflow in
 drm_legacy_sg_alloc()
Message-ID: <20200228234017.GB2363188@phenom.ffwll.local>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200228092321.axulddmkxrujkmas@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228092321.axulddmkxrujkmas@kili.mountain>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 28, 2020 at 12:23:21PM +0300, Dan Carpenter wrote:
> There is an integer overflow when we round up to PAGE_SIZE, but it's
> harmless because we never re-use "request->size" for anything meaningful.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This code predates git.

Also not compiled without CONFIG_DRM_LEGACY, which we tell everyone is to
enable the root holes in drm :-)

Thanks for your patch, queued in drm-misc-next.
-Daniel

> 
>  drivers/gpu/drm/drm_scatter.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/drm_scatter.c
> index d5c386154246..ca520028b2cb 100644
> --- a/drivers/gpu/drm/drm_scatter.c
> +++ b/drivers/gpu/drm/drm_scatter.c
> @@ -99,6 +99,9 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_SG))
>  		return -EOPNOTSUPP;
>  
> +	if (request->size > SIZE_MAX - PAGE_SIZE)
> +		return -EINVAL;
> +
>  	if (dev->sg)
>  		return -EINVAL;
>  
> -- 
> 2.11.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
