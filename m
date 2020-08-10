Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E776E24062D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 14:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4CF89D4D;
	Mon, 10 Aug 2020 12:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D0889D4D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 12:51:06 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c15so8040631wrs.11
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 05:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=SCk9i3sWSgkWyg6YFOJHzr++ebfH7R3kDFAt5TmtoX8=;
 b=Ynhhm1/2yY4ztKsKdmw/j1iwW3q009I0jRUbMuq9LZANkuEOO1IXasxWYli1lB/EKU
 Ve6EuHB/7SmgCmkYt9b3XFPNsC5LGpXARCGJqCdxHaeG8lx5BbIldQuUK8U2diul/waV
 4IvzCdT+Jw3aV69Ut16wgePjx7pnBoXO3TTPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=SCk9i3sWSgkWyg6YFOJHzr++ebfH7R3kDFAt5TmtoX8=;
 b=L+pykr1sdVA4MGcM0pcXNqqDCKvXkj18MDyOM4Zufx6mIiOGRzepOdXkLSV9gK+EgV
 WSOGVeZsQwgJUG+ZRJCIbtMgPkCtc+QlLczZgvMlRJZZF76v9cLMkkAnjgV/vJGuYgj7
 +OZf8DJBtV0H4NJuMkWx9ZsaxSwmVYih1wnKLsSFeyKPchE1hXj6LFFjbakQ/CzMrA3C
 tvNRAulYAfyPxaJof2fcZA1nMzIrkNsK0ecwtQoYAVc4Dvsu5+D4kO5Vxq3zAdFyvePS
 jshRrFseNKJZC/96XWjvPR9XE/0d5huzyPf+qo3vPoAIIq88O9LDI/3hDo4LWm8O4/DZ
 GXgg==
X-Gm-Message-State: AOAM533PKPjMqhwk/hgAzfifBiCvT9F5L6ATxfNoncV5jPhuUNTdVrna
 pcCkw8iyfDo8kfz+VTuPt/ehBQ==
X-Google-Smtp-Source: ABdhPJyMU0d/6EbcBph/o2e0VviOrZzAdljVt2A/AspWDgYTr8anSDL/syByK7rh0S1Q+OIlPU8tyg==
X-Received: by 2002:adf:f8d2:: with SMTP id f18mr24134081wrq.261.1597063865196; 
 Mon, 10 Aug 2020 05:51:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g70sm22140560wmg.24.2020.08.10.05.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 05:51:04 -0700 (PDT)
Date: Mon, 10 Aug 2020 14:51:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH v3] drm/vkms: guarantee vblank when capturing crc
Message-ID: <20200810125102.GO2352366@phenom.ffwll.local>
Mail-Followup-To: Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Sidong Yang <realwakka@gmail.com>, twoerner@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-usp@googlegroups.com
References: <20200808120900.pudwwrfz44g3rqx7@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200808120900.pudwwrfz44g3rqx7@smtp.gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-usp@googlegroups.com, Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 08, 2020 at 09:09:00AM -0300, Melissa Wen wrote:
> VKMS needs vblank interrupts enabled to capture CRC. When vblank is
> disabled, tests like kms_cursor_crc and kms_pipe_crc_basic getting stuck
> waiting for a capture that will not occur until vkms wakes up. This patch
> adds a helper to set composer and ensure that vblank remains enabled as
> long as the CRC capture is needed.
> 
> It clears the execution of the following kms_cursor_crc subtests:
> 1. pipe-A-cursor-[size,alpha-opaque, NxN-(on-screen, off-screen, sliding,
> random, fast-moving])] - successful when running individually.
> 2. pipe-A-cursor-dpms passes again
> 3. pipe-A-cursor-suspend also passes
> 
> The issue was initially tracked in the sequential execution of IGT
> kms_cursor_crc subtests: when running the test sequence or one of its
> subtests twice, the odd execs complete and the pairs get stuck in an
> endless wait. In the IGT code, calling a wait_for_vblank on preparing for
> CRC capture prevented the busy-wait. But the problem persisted in the
> pipe-A-cursor-dpms and -suspend subtests.
> 
> Checking the history, the pipe-A-cursor-dpms subtest was successful when,
> in vkms_atomic_commit_tail, instead of using the flip_done op, it used
> wait_for_vblanks. Another way to prevent blocking was wait_one_vblank when
> enabling crtc. However, in both cases, pipe-A-cursor-suspend persisted
> blocking in the 2nd start of CRC capture, which may indicate that
> something got stuck in the step of CRC setup. Indeed, wait_one_vblank in
> the crc setup was able to sync things and free all kms_cursor_crc
> subtests. Besides, other alternatives to force enabling vblanks or prevent
> disabling them such as calling drm_crtc_put_vblank or modeset_enables
> before commit_planes + offdelay = 0, also unlock all subtests executions.
> 
> Finally, due to vkms's dependence on vblank interruptions to perform
> tasks, this patch uses refcount to ensure that vblanks happen when
> enabling composer and while crc capture is needed.
> 
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> 
> Co-debugged-by: Sidong Yang <realwakka@gmail.com>
> Signed-off-by: Sidong Yang <realwakka@gmail.com>
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> ---
> 
> v2:
> - extract a vkms_set_composer helper
> - fix vblank refcounting for the disabling case
> 
> v3:
> - make the vkms_set_composer helper static
> - review the credit tags

Thanks a lot for your work here, patch merged to drm-misc-next.

I've kept the changelog in the commit message, I often find that quite
useful. But that's a bit a drm peculiarity, most other subsystems prefer
it like you've done it.

Cheers, Daniel

> 
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index b8b060354667..4f3b07a32b60 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -233,6 +233,22 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
>  	return 0;
>  }
>  
> +static void vkms_set_composer(struct vkms_output *out, bool enabled)
> +{
> +	bool old_enabled;
> +
> +	if (enabled)
> +		drm_crtc_vblank_get(&out->crtc);
> +
> +	spin_lock_irq(&out->lock);
> +	old_enabled = out->composer_enabled;
> +	out->composer_enabled = enabled;
> +	spin_unlock_irq(&out->lock);
> +
> +	if (old_enabled)
> +		drm_crtc_vblank_put(&out->crtc);
> +}
> +
>  int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>  {
>  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> @@ -241,9 +257,7 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>  
>  	ret = vkms_crc_parse_source(src_name, &enabled);
>  
> -	spin_lock_irq(&out->lock);
> -	out->composer_enabled = enabled;
> -	spin_unlock_irq(&out->lock);
> +	vkms_set_composer(out, enabled);
>  
>  	return ret;
>  }
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
