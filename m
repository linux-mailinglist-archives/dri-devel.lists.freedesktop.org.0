Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCBB347E7C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 18:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9169E6ECA1;
	Wed, 24 Mar 2021 17:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589A86EA51
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 17:05:46 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k8so25190455wrc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ggqY3kzKXIudQSfbysUJcm6wQjUA68gKKpbGo6F6hcE=;
 b=GM5zXeSsMNpYcfmQqKlJ7I11h82mENj9TmYwWM2MzUnsvMmJSY+loC7uYd08GoNCA6
 /GHywybP4g1qfwfhYLlEp3oHiWgyHUPXZNz0klWFVoiZ61Ye1qFjRY0QMQERqwmlTMAr
 7VyN8fjL+5GlCyOSOUh0kDryPIoQ4BGnbzaxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ggqY3kzKXIudQSfbysUJcm6wQjUA68gKKpbGo6F6hcE=;
 b=VnpbOAd/b98Q6lSk3kB0zx6di6cFx3rUY/MxMv7uhZ/crfyYwgErWvQrqB19ldeGrj
 QUHYzddr3AlIzdQB5efPkEEEWnnxSnvqaOLtkTiUedm06qS+uBcgYyzvobSDyeasjCL1
 4zdW++tHnoU2Y8iY7+10mRyIQU24Uafon2YOqqMRsOjpqFFAudTDE8W25PJHa0ATGVFk
 fMsuhHGQRl+UgVmOWS//gJbw4DhoewTuc8sxiAA1cASSJ62K0bwkQWiwJmeLRxScAOFG
 WbkYMKe/iFvGyjkJ9r1HJbs3O/RXxS0AkfY5kMqmLscBJos/+uupeGIEKsNqV+rVOGsk
 x5Zg==
X-Gm-Message-State: AOAM533E58Ykje9H10tCUhULucuin+LOy7lgmR+6khN6KnDlkdy6JOD6
 f1wUlC7Etu9HdX76jCEOWhYoc/Foodm416DC
X-Google-Smtp-Source: ABdhPJzkMnp3MCfwVdXL4kFlc43xXqwKYR/bOvYdcY459wfvHBtDyf5IzRG8XBVKbDMhreMWP69DYw==
X-Received: by 2002:adf:d1c5:: with SMTP id b5mr4533414wrd.126.1616605544841; 
 Wed, 24 Mar 2021 10:05:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h25sm3242653wml.32.2021.03.24.10.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 10:05:44 -0700 (PDT)
Date: Wed, 24 Mar 2021 18:05:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v9 64/70] drm/i915: Add missing -EDEADLK path
 in execbuffer ggtt pinning.
Message-ID: <YFtxZs0cRCbD7QFb@phenom.ffwll.local>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
 <20210323155059.628690-65-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323155059.628690-65-maarten.lankhorst@linux.intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 04:50:53PM +0100, Maarten Lankhorst wrote:
> In reloc_iomap we swallow the -EDEADLK error, but this needs to
> be returned for -EDEADLK handling. Add the missing check to
> make bsw pass again.
> 
> Testcase: gem_exec_fence.basic-await
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

This partially reverts

https://lore.kernel.org/intel-gfx/CAM0jSHOHkZhivgi-X37W2rxYQHm1vbqB8uzAVYexEjuwE0LxSQ@mail.gmail.com/

which I'm going to throw out anyway. So not merged this one here.
-Daniel

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 37fecd295eb6..f85ca10bf7f3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1216,6 +1216,8 @@ static void *reloc_iomap(struct drm_i915_gem_object *obj,
>  							  PIN_MAPPABLE |
>  							  PIN_NONBLOCK /* NOWARN */ |
>  							  PIN_NOEVICT);
> +		if (vma == ERR_PTR(-EDEADLK))
> +			return vma;
>  		if (IS_ERR(vma)) {
>  			memset(&cache->node, 0, sizeof(cache->node));
>  			mutex_lock(&ggtt->vm.mutex);
> -- 
> 2.31.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
