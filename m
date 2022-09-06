Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 337675AF456
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B0810E8BD;
	Tue,  6 Sep 2022 19:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6041010E8BD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 19:20:13 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b5so16920894wrr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 12:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=JBbOD4Th6LbVkQpdXwMwkeCYpgGwuYVhT5D76mqGpyk=;
 b=ab1LeK9V8gMOBbPgIBIHOKTEZEsdj/tzazAJWdI0eLZkyQ+RmS+bj/I3JY2II1NVKK
 bK2AAn6YIZone9eMQk+NVOtXwioYE5R9ldP0aI9wHeSIU5N4n0XbsyQFwq9xwN3Crtff
 6XfdfRKHsuEn0WfC61OZCmAylFZOxxwvbJQ2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=JBbOD4Th6LbVkQpdXwMwkeCYpgGwuYVhT5D76mqGpyk=;
 b=Oruz79hNsx9mXPszEfSZ0Gmju09jS6GnUF/+AprAw5Kec6Elj2nSnqcJvZKeLL1IyI
 RoRLuYjZxKXwJhYRrwHEZLREpRzPwHYCx7DeUvMkgg4p+Xnpo38sojTJ0XuEXcmkxsXB
 A2XhYvRUFwjPArNf+Ob5oA/3FyLa58lkbhlN4OwBFrc2YsdonnVgYQUt0j5g9NqUTH1Y
 7j6DiiZ2DMBuso+r+n4O3VMeRs2d9HBgh4yk8bfWA6vYcpq4drGsl7FUv2PDcT8BnMOY
 0fjZGshlK5hzB40fo5AcgvnmTv6EQb0GXK6QqAznVEBfNo3Sw6/q4IytTKIkJ8Q0st2B
 iYcQ==
X-Gm-Message-State: ACgBeo3fsgUKErPM1WU8eN7jDbUL2P3DBNoA1IXx6ZmL+mhbg+IaqrqB
 tRxGtIMEbR2IVRLr9IfehU4PBQ==
X-Google-Smtp-Source: AA6agR7s5AlYlrOxghESsZ4+3Qcrs8fb9ngZ+hpcsivOwL4x4Ijuz8sD24+anIui5VOv8p/Q8Y2+LA==
X-Received: by 2002:a5d:50c1:0:b0:228:d77e:4b33 with SMTP id
 f1-20020a5d50c1000000b00228d77e4b33mr3101160wrt.677.1662492011422; 
 Tue, 06 Sep 2022 12:20:11 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4c90000000b002254880c049sm13871298wrs.31.2022.09.06.12.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 12:20:10 -0700 (PDT)
Date: Tue, 6 Sep 2022 21:20:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Yunxiang Li <Yunxiang.Li@amd.com>
Subject: Re: [PATCH 2/2] drm: get lock before accessing vblank refcount
Message-ID: <YxedadEMAfWHON8P@phenom.ffwll.local>
References: <20220722215234.129793-1-Yunxiang.Li@amd.com>
 <20220722215234.129793-2-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722215234.129793-2-Yunxiang.Li@amd.com>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 05:52:34PM -0400, Yunxiang Li wrote:
> Acquire vbl_lock before accessing vblank refcount in drm_vblank_put,
> just like everywhere else that access the refcount.
> 
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>

The entire point of using atomic for the refcount is that we can check it
lockless, so I'm not sure what you're trying to fix here?

For the first patch I think it's clear that the bug needs to be fixed in
amdgpu dc code already.
-Daniel
> ---
>  drivers/gpu/drm/drm_vblank.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 159d13b5d97b..77b8c40fc7ba 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1203,15 +1203,22 @@ EXPORT_SYMBOL(drm_crtc_vblank_get);
>  void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	unsigned long irqflags;
> +	int ret;
>  
>  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>  		return;
>  
> -	if (drm_WARN_ON(dev, atomic_read(&vblank->refcount) == 0))
> +	spin_lock_irqsave(&dev->vbl_lock, irqflags);
> +	if (drm_WARN_ON(dev, atomic_read(&vblank->refcount) == 0)) {
> +		spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
>  		return;
> +	}
>  
>  	/* Last user schedules interrupt disable */
> -	if (atomic_dec_and_test(&vblank->refcount)) {
> +	ret = atomic_dec_and_test(&vblank->refcount);
> +	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
> +	if (ret) {
>  		if (drm_vblank_offdelay == 0)
>  			return;
>  		else if (drm_vblank_offdelay < 0)
> -- 
> 2.37.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
