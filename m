Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EAD83CAA0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 19:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA9810E2ED;
	Thu, 25 Jan 2024 18:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16CC10E09B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 18:13:15 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-55369c59708so1639768a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 10:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706206334; x=1706811134; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OlD8SETOlT5gWIix6TSr1eeKdPf+HP3S2KOXnsvdfn8=;
 b=bz5yTETt4OMZJyCRsWoo+q7BvjK72+Nm15uAqolGs7W4tmKsOKRgB9gwjKi2v+6x43
 u1vSxVMjlXTcleu6hP60hMEBIVsnd+FXAhnBBZxkUSnfddvaXpGQ9biN/dTW3e7XKsrJ
 IKRCcDKNJmJoJpiZ456HeyfWurpU1MKb3Zs5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706206334; x=1706811134;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OlD8SETOlT5gWIix6TSr1eeKdPf+HP3S2KOXnsvdfn8=;
 b=dnLd9gdAI4jGg8Xjr+lKZ0drT6GyLd81JgEhjc6p7HBzeMlAgMZEfjRsaEXfKTX6mk
 Fagw6Q+0eCw2nwm6DSP9I+U7k83rOBDhPy38+rzNI2QOxt9bm7KQ4nY3Y0xX8/O3d4QI
 rr3graMnaLSg826CfBflddKQ3b83Wh6kpifVMrSrlXdhGTcUcEJEdK+JM3fzyu+7QVso
 ofL8L+2r2n1k5E5RumNMSzhFNzHub5M54UxecQFeS1gAPeiHu1UYcrwTxSsb8SHrNXZi
 CtPWKPrbLFVoAM5Jyc63Og5UhuNZax/w4YUTgz2skKYBddXUt5/UgX/FPwXooNXgwmpV
 5j8A==
X-Gm-Message-State: AOJu0Yx4aHjS71TjosikZNRrFN/k1+8MTMHIpAz3TfMVwhnsb+SO/pee
 FBtryfvc5zi8uRM9kT7vnFh6xtz1wlUHdOnwtnNiTQ9/Qrv/eh3z49kHQO8RiF8=
X-Google-Smtp-Source: AGHT+IGzJ4cEpNsViZVMsDb3jrkZz/Ye4WLNt8brs47pwLXT+IJcPtVaf9hIc/bMbOYstojKhHI8MA==
X-Received: by 2002:a17:907:1705:b0:a30:ff25:5dfc with SMTP id
 le5-20020a170907170500b00a30ff255dfcmr1804730ejc.6.1706206334170; 
 Thu, 25 Jan 2024 10:12:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 hk18-20020a170906c9d200b00a349b82c548sm37192ejb.46.2024.01.25.10.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 10:12:13 -0800 (PST)
Date: Thu, 25 Jan 2024 19:12:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Erik Kurzinger <ekurzinger@nvidia.com>
Subject: Re: [PATCH v2 1/3] drm/syncobj: call drm_syncobj_fence_add_wait when
 WAIT_AVAILABLE flag is set
Message-ID: <ZbKkfKHwYriYtSDY@phenom.ffwll.local>
References: <20240119163208.3723457-1-ekurzinger@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119163208.3723457-1-ekurzinger@nvidia.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: david1.zhou@amd.com, jajones@nvidia.com, dri-devel@lists.freedesktop.org,
 kbrenneman@nvidia.com, ashafer@nvidia.com, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 19, 2024 at 08:32:06AM -0800, Erik Kurzinger wrote:
> When waiting for a syncobj timeline point whose fence has not yet been
> submitted with the WAIT_FOR_SUBMIT flag, a callback is registered using
> drm_syncobj_fence_add_wait and the thread is put to sleep until the
> timeout expires. If the fence is submitted before then,
> drm_syncobj_add_point will wake up the sleeping thread immediately which
> will proceed to wait for the fence to be signaled.
> 
> However, if the WAIT_AVAILABLE flag is used instead,
> drm_syncobj_fence_add_wait won't get called, meaning the waiting thread
> will always sleep for the full timeout duration, even if the fence gets
> submitted earlier. If it turns out that the fence *has* been submitted
> by the time it eventually wakes up, it will still indicate to userspace
> that the wait completed successfully (it won't return -ETIME), but it
> will have taken much longer than it should have.
> 
> To fix this, we must call drm_syncobj_fence_add_wait if *either* the
> WAIT_FOR_SUBMIT flag or the WAIT_AVAILABLE flag is set. The only
> difference being that with WAIT_FOR_SUBMIT we will also wait for the
> fence to be signaled after it has been submitted while with
> WAIT_AVAILABLE we will return immediately.
> 
> IGT test patch: https://lists.freedesktop.org/archives/igt-dev/2024-January/067537.html
> 
> v1 -> v2: adjust lockdep_assert_none_held_once condition
> 
> Fixes: 01d6c3578379 ("drm/syncobj: add support for timeline point wait v8")
> Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>

Yeah I think this series catches now all the corner cases I spotted in v1.
On the series:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 94ebc71e5be5..97be8b140599 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1058,7 +1058,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>  	uint64_t *points;
>  	uint32_t signaled_count, i;
>  
> -	if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT)
> +	if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
> +		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE))
>  		lockdep_assert_none_held_once();
>  
>  	points = kmalloc_array(count, sizeof(*points), GFP_KERNEL);
> @@ -1127,7 +1128,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>  	 * fallthough and try a 0 timeout wait!
>  	 */
>  
> -	if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT) {
> +	if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
> +		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
>  		for (i = 0; i < count; ++i)
>  			drm_syncobj_fence_add_wait(syncobjs[i], &entries[i]);
>  	}
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
