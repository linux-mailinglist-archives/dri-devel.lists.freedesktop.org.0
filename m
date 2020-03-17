Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D962188B7A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 18:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB5C6E247;
	Tue, 17 Mar 2020 17:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE766E247
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 17:02:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id m3so88964wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fba/U9otc2Taw+dP1ayFE6PdkE156208ze8hBWbP5a0=;
 b=Cnt9unexUh7DiO8/+NFCYWS6n4xihEaetGa9wprZioX0B5ztpZhNHZa1z+2KRnvfWc
 WowDv3qSzyU+n5zlmaxOryg9osqcQL8P6I1u7bpW2c1aOrs+kq5fUBlulwSd/TX2Cf7Y
 GE1nPLfhIjXMkIp+5+Wgpw/iv+wn0WIGofvNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Fba/U9otc2Taw+dP1ayFE6PdkE156208ze8hBWbP5a0=;
 b=qPhBdW12K6nT41itsAV2grlrYftmP3Pcn/iSQ94eEkk3txT9th+fgMaQixwGUvdZu7
 s+rbLjbadOPOkzDg+W69Hz7mNW47wr/aZfipRRvJwjVxo5qw6rxLtsj4dl9ENTKSAasj
 PUlOA43pCa4ZHMeaeHSYkhGQRbaqE8XhkeN04VMObXF846bGhyP6MZ2eGm2nH+QLgwKZ
 8BCO70unYcCxI376UIYDDV4veeLxkJ/wmFRNez2k7QMD+6XiaXfwsqoclW01Z0tKSzBW
 jj38jzauFSATjmvKrSoUUbGTgt+mLXakFb+zAYUBWYDqH3wAo7tgX7z3bRSqO1n/MReb
 A/2Q==
X-Gm-Message-State: ANhLgQ1C3Sc9K7SFR2Z5tXOlrAF6ihvnEv7MKiHXgmgMXVXlrWMyCe0h
 naHe0lTxCub2tWcAeJV4lvRSvHkT1syX4MMS
X-Google-Smtp-Source: ADFU+vtWZkm5YFA2wKbGqBsADcieSlIQinWEBnhNpwFvx09DRAxMcKI1mmVSAsGI36f/KlGOMFUewQ==
X-Received: by 2002:a7b:c3ca:: with SMTP id t10mr231733wmj.69.1584464566676;
 Tue, 17 Mar 2020 10:02:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n14sm63632wmi.19.2020.03.17.10.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 10:02:45 -0700 (PDT)
Date: Tue, 17 Mar 2020 18:02:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Qiujun Huang <hqjagain@gmail.com>
Subject: Re: [PATCH RESEND] drm/lease: fix potential race in fill_object_idr
Message-ID: <20200317170243.GR2363188@phenom.ffwll.local>
Mail-Followup-To: Qiujun Huang <hqjagain@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1584343103-13896-1-git-send-email-hqjagain@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584343103-13896-1-git-send-email-hqjagain@gmail.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 03:18:23PM +0800, Qiujun Huang wrote:
> We should hold idr_mutex for idr_alloc.
> 
> Signed-off-by: Qiujun Huang <hqjagain@gmail.com>

I've not seen the first version of this anywhere in my inbox, not sure
where that got lost.

Anyway, this seems like a false positive - I'm assuming this was caught
with KCSAN. The commit message really should mention that.

fill_object_idr creates the idr, which yes is only access later on under
the idr_mutex. But here it's not yet visible to any other thread, and
hence lockless access is safe and correct.

No idea what the KCSAN complains about safe access like this best practice
is.
-Daniel

> ---
>  drivers/gpu/drm/drm_lease.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> index b481caf..427ee21 100644
> --- a/drivers/gpu/drm/drm_lease.c
> +++ b/drivers/gpu/drm/drm_lease.c
> @@ -418,6 +418,7 @@ static int fill_object_idr(struct drm_device *dev,
>  		goto out_free_objects;
>  	}
>  
> +	mutex_lock(&dev->mode_config.idr_mutex);
>  	/* add their IDs to the lease request - taking into account
>  	   universal planes */
>  	for (o = 0; o < object_count; o++) {
> @@ -437,7 +438,7 @@ static int fill_object_idr(struct drm_device *dev,
>  		if (ret < 0) {
>  			DRM_DEBUG_LEASE("Object %d cannot be inserted into leases (%d)\n",
>  					object_id, ret);
> -			goto out_free_objects;
> +			goto out_unlock;
>  		}
>  		if (obj->type == DRM_MODE_OBJECT_CRTC && !universal_planes) {
>  			struct drm_crtc *crtc = obj_to_crtc(obj);
> @@ -445,20 +446,22 @@ static int fill_object_idr(struct drm_device *dev,
>  			if (ret < 0) {
>  				DRM_DEBUG_LEASE("Object primary plane %d cannot be inserted into leases (%d)\n",
>  						object_id, ret);
> -				goto out_free_objects;
> +				goto out_unlock;
>  			}
>  			if (crtc->cursor) {
>  				ret = idr_alloc(leases, &drm_lease_idr_object, crtc->cursor->base.id, crtc->cursor->base.id + 1, GFP_KERNEL);
>  				if (ret < 0) {
>  					DRM_DEBUG_LEASE("Object cursor plane %d cannot be inserted into leases (%d)\n",
>  							object_id, ret);
> -					goto out_free_objects;
> +					goto out_unlock;
>  				}
>  			}
>  		}
>  	}
>  
>  	ret = 0;
> +out_unlock:
> +	mutex_unlock(&dev->mode_config.idr_mutex);
>  out_free_objects:
>  	for (o = 0; o < object_count; o++) {
>  		if (objects[o])
> -- 
> 1.8.3.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
