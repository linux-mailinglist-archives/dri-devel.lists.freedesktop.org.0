Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F5E3CFBAD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 16:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070766E197;
	Tue, 20 Jul 2021 14:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4CE6E197
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 14:11:57 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so1573460wmf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 07:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+99Bkzo1T6V6yipq2wGp2+VIlI+NtcGrsveGXBzQdfI=;
 b=k1BEYGeLHiKE943zq0AJ/A9pedtwmJ17JxmYuV4jtmxEfRKSE8dQjl6W+tJTa/wK2a
 Bv7QVR5ogsBTw6eCqZjS7dH+2Kf3SGjaDe/E4TOq+i0pHIOg5Tkz0jCkGqEaP8Sq8PY3
 2mVfh+W5FSvTgdru8i54oX5nOv9x9otz0tJNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+99Bkzo1T6V6yipq2wGp2+VIlI+NtcGrsveGXBzQdfI=;
 b=sXSwx1VoyjMZH4U9Y8D/0kfJqqdV/qi5WpE+qlJaFSQk3TDDrtzMXXyjTVwJRqaEyD
 F+ExqR7beIktO8zDSw0kZ57brErI/f2M14ww8fnGpiHG6PBgaXXvVzGXMXCSreP0apFD
 nIOft+lVOn9N+OcOjO7sJ6BEMvfXZLakJIq07ecP0uQPs4I4GlmNg4tv4yEA03VBTawS
 Fab1MO8iQ/ResDbl7sx8ox2ChfN/7QCRiaymMstBWDhZqaHkOBiunOlAxC2liS8DVFaS
 hgsBPwyXK8hCGCyyu9ArfSnJBMkjoCNioOPusqcv+Yv1acoAB/3yoOZh4QzRA2U+A3wb
 iXAA==
X-Gm-Message-State: AOAM5312FznBh2lKe5V/bXXMDCghEaIo1iUDJx5AeaajJbQGEEIvQz83
 MgUItONuPVTLGGM6E/qcyCvqSA==
X-Google-Smtp-Source: ABdhPJw86dJRZqU8oOV8kCozRCnLqmfko4g/rt0FDg2+hmIjB+7H8yYryPt91ZKw0zbFxtv5KKT8sA==
X-Received: by 2002:a7b:c150:: with SMTP id z16mr37655298wmi.104.1626790315685; 
 Tue, 20 Jul 2021 07:11:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o7sm16273281wrs.52.2021.07.20.07.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 07:11:55 -0700 (PDT)
Date: Tue, 20 Jul 2021 16:11:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 2/6] drm/i915: Call i915_globals_exit() if
 pci_register_device() fails
Message-ID: <YPbZqZx/mwenKcDV@phenom.ffwll.local>
References: <20210719183047.2624569-1-jason@jlekstrand.net>
 <20210719183047.2624569-3-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719183047.2624569-3-jason@jlekstrand.net>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 19, 2021 at 01:30:43PM -0500, Jason Ekstrand wrote:
> In the unlikely event that pci_register_device() fails, we were tearing
> down our PMU setup but not globals.  This leaves a bunch of memory slabs
> lying around.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Fixes: 32eb6bcfdda9 ("drm/i915: Make request allocation caches global")
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> ---
>  drivers/gpu/drm/i915/i915_globals.c | 4 ++--
>  drivers/gpu/drm/i915/i915_pci.c     | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
> index 77f1911c463b8..87267e1d2ad92 100644
> --- a/drivers/gpu/drm/i915/i915_globals.c
> +++ b/drivers/gpu/drm/i915/i915_globals.c
> @@ -138,7 +138,7 @@ void i915_globals_unpark(void)
>  	atomic_inc(&active);
>  }
>  
> -static void __exit __i915_globals_flush(void)
> +static void __i915_globals_flush(void)
>  {
>  	atomic_inc(&active); /* skip shrinking */
>  
> @@ -148,7 +148,7 @@ static void __exit __i915_globals_flush(void)
>  	atomic_dec(&active);
>  }
>  
> -void __exit i915_globals_exit(void)
> +void i915_globals_exit(void)
>  {
>  	GEM_BUG_ON(atomic_read(&active));
>  
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 50ed93b03e582..4e627b57d31a2 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1230,6 +1230,7 @@ static int __init i915_init(void)
>  	err = pci_register_driver(&i915_pci_driver);
>  	if (err) {
>  		i915_pmu_exit();
> +		i915_globals_exit();
>  		return err;
>  	}
>  
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
