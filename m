Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD9D3D222F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 12:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42EF6E526;
	Thu, 22 Jul 2021 10:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115776E526
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 10:39:53 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id k27so6175445edk.9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 03:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=jnlm21J6SlYJjPe81X61eHbfm5OMgcOz8zyqmSLYvPQ=;
 b=NpBBKqrdi56YhzkxFSewaW9GKDUpQ+fUhYE5+RkUh/mBRnGlUYIeNVp7gFkyHII+Wc
 QRxqAzGrpMvRUg6TI08B6k9huJMutm+Hx1aPAR8bebLUxzxn13SB0Kk39EHnBS3c4YZR
 fWGT8oKhgDjLRfSJ9uW+AomaH4j1haN9aSZ0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=jnlm21J6SlYJjPe81X61eHbfm5OMgcOz8zyqmSLYvPQ=;
 b=lxeA/cS4/EaM4EwNyNhgODYICYy3EQFHkRotlTMGbWZFiQKbPeqfogroz1wWZu1SBL
 czMk3dsG2SLbbhxopMuPYrKnPEfak1zhCoMipjHZcVSAGvBzmCt7iEMgpIHGdPMu4tPB
 uNjjqc0DNOO41YczQtwbGjIthaDFPIP/+6HM+fIkYyxnC7zBFyKvadlPvobWxwXB7UrC
 pWdeDmeXRnMebSICjtVB9fRAqCEedxl8U7pXUngScojW022UHMGrzjQMSNUjyQRwAwSg
 Ox/2R2Vr27ZGm/1jrbr9bVk8VMQpYIi6PStAWvckMYxINp1LswKnIxJTxzXoMxd4g+a7
 86ZA==
X-Gm-Message-State: AOAM533lfjeauNnNTJwZtUFFlPJ1ytr+dB4b/Qy7th8vPspY3+JQYdup
 gR3Q3HA4NxPCfK73XuJ/RWB3DPBxj5/tMA==
X-Google-Smtp-Source: ABdhPJzr7EsXEh64NgUGE8NlxZu8PVM5/iUdV7lOJ1gOxWRo5nSODbf792yJ2bwdGRFWp7KaBmVx0g==
X-Received: by 2002:a05:6402:d2:: with SMTP id
 i18mr53783290edu.17.1626950391725; 
 Thu, 22 Jul 2021 03:39:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id cq22sm12251755edb.77.2021.07.22.03.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 03:39:51 -0700 (PDT)
Date: Thu, 22 Jul 2021 12:39:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH 3/3] drm/vmwgfx: fix potential UAF in vmwgfx_surface.c
Message-ID: <YPlK9b+7CN533jpl@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
 <20210722092929.244629-4-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722092929.244629-4-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: tzimmermann@suse.de, airlied@linux.ie, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 05:29:29PM +0800, Desmond Cheong Zhi Xi wrote:
> drm_file.master should be protected by either drm_device.master_mutex
> or drm_file.master_lookup_lock when being dereferenced. However,
> drm_master_get is called on unprotected file_priv->master pointers in
> vmw_surface_define_ioctl and vmw_gb_surface_define_internal.
> 
> This is fixed by replacing drm_master_get with drm_file_get_master.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'll let Zack take a look at this and expect him to push this patch to
drm-misc.git.
-Daniel

> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> index 0eba47762bed..5d53a5f9d123 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -865,7 +865,7 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
>  	user_srf->prime.base.shareable = false;
>  	user_srf->prime.base.tfile = NULL;
>  	if (drm_is_primary_client(file_priv))
> -		user_srf->master = drm_master_get(file_priv->master);
> +		user_srf->master = drm_file_get_master(file_priv);
>  
>  	/**
>  	 * From this point, the generic resource management functions
> @@ -1534,7 +1534,7 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
>  
>  	user_srf = container_of(srf, struct vmw_user_surface, srf);
>  	if (drm_is_primary_client(file_priv))
> -		user_srf->master = drm_master_get(file_priv->master);
> +		user_srf->master = drm_file_get_master(file_priv);
>  
>  	res = &user_srf->srf.res;
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
