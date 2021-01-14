Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D03E2F674A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C0B8808E;
	Thu, 14 Jan 2021 17:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1F58808E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 17:20:01 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v15so2932641wrx.4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DJbxjVn7var5tn3VpXRQHFW70e7JzlJvTaQ/6D9kM2w=;
 b=UgLBzu91mErnuDHKJs9FPr89uRRZTzo+V1QmaGFwSnw3UnK2K9B1jbVrp0WxpBi0Iz
 L3B+/m2bqkqhjb+Y6d9NpgSKoXddFhktBLfKhTwRj8KIq4kBEnMetF9QL0QHVr6JiXFn
 mDdr8j331VBXi0UitN1w37vXjDVtSdhZWlugs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DJbxjVn7var5tn3VpXRQHFW70e7JzlJvTaQ/6D9kM2w=;
 b=C+qfJaPlcgwNLGfKDl8y6qgEFzlLJJgF9ssNZVA4s7SwcRRGYNcvd1Yzlww65SPePb
 SRctQcQTx8THo5k8eZihv+Q02Lk6CxljGGC8mjtKoUkaKGrzV7BcsrxmUuV8E2ruc1LK
 hhvMm4plZ41lvOJMyvTd65Il6LRyv5BmxHhKnleMtWA7vsw4U0/Do1tBPKmHn+TwkMaI
 GYydr7qK4JVmeQJxgthXYxnXeD22IND+GFVp7LyFtPz08ELNlBbtFBqxNWZgk1sJh1/b
 SI7NfRSY4WvfMHoDiWYctgkdOvLeVTZqUt36PudOGifg4AZMpSAv/aU/mYtwPlyqQl6B
 KSdw==
X-Gm-Message-State: AOAM5301G/asAHpdX2LWOZGgxKiGWRD+2WfPFTXKVdDywFnF11laIZ6j
 gK0EoohVxKjOjWnDYLwGtUx8TA==
X-Google-Smtp-Source: ABdhPJxdULearBSGSGAvpATDOI4FDwr905+i5cFffKJphb+lGHN0mNDV5HrUNJuCrG9xygDc76r9Pw==
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr3297365wrd.118.1610644800457; 
 Thu, 14 Jan 2021 09:20:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w189sm9796925wmg.31.2021.01.14.09.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 09:19:59 -0800 (PST)
Date: Thu, 14 Jan 2021 18:19:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/cma-helper: Implement mmap as GEM CMA object
 functions
Message-ID: <YAB9PRxbDMfvd2dB@phenom.ffwll.local>
References: <20201123115646.11004-1-tzimmermann@suse.de>
 <20201123115646.11004-3-tzimmermann@suse.de>
 <e297b08d-a7ac-a3c8-abdf-bb89bc6810ce@ideasonboard.com>
 <d6b5376d-05c9-bb43-3071-820d675d921e@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6b5376d-05c9-bb43-3071-820d675d921e@suse.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 kieran.bingham+renesas@ideasonboard.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 14, 2021 at 02:26:41PM +0100, Thomas Zimmermann wrote:
> From d0583fe22cd0cd29749ff679e46e13b58de325cb Mon Sep 17 00:00:00 2001
> From: Thomas Zimmermann <tzimmermann@suse.de>
> Date: Thu, 14 Jan 2021 14:21:51 +0100
> Subject: [PATCH] drm/cma: Set vma ops in mmap function
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_cma_helper.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 7942cf05cd93..0bd192736169 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -489,6 +489,8 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  	struct drm_gem_cma_object *cma_obj;
>  	int ret;
>  
> +	vma->vm_ops = obj->funcs->vm_ops;

I think this should be done in core, otherwise we have tons of refcount
leaks. I think this was an oversight when we've done that refactoring.

Also drivers can easily overwrite this one if they really have to, but not
assigned this is a clear bug.
-Daniel

> +
>  	/*
>  	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
>  	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to map
> -- 
> 2.29.2
> 


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
