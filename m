Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F7E23E9D1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 11:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6356E98C;
	Fri,  7 Aug 2020 09:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571A86E98C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 09:10:48 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f7so1002430wrw.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=yIduASxOSE1is+l6ba3Ib+q/uSjP1gWsCSN6YMU1MGM=;
 b=JQwvG7SK70jkxfMfT30/3cNZrD0PDGXLYYzyABgNj0q59whRkvEyofQ6QxfiRLcKn6
 nO/Klfw7scX4KxlZij3JbF8aLOT94AYvbbF9BQq/2dIQsWwnJLd4is1d2M0gDhQOEYdy
 CXn5QDUOLpAVJvt/ZTysbRcCVI8yutvfQQ/00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=yIduASxOSE1is+l6ba3Ib+q/uSjP1gWsCSN6YMU1MGM=;
 b=k9Oog+omD2rusjfTEf4S5sXxPDX1wKMB0WbXpqHgeVtZG6pHJsBygLfwqD7MgKBAwd
 8jlKxiQt2SDifkCNzQaj3HvILCTNaIa04K6zMPvwEjVKGE2bJaK2xZdFUFkEj5OhtxhK
 g1aJP41QgGEY/ULGSXe6JQTtRi9AUfs/0cm97voj6aJh1LPC1AqHv63OboeklBZOqU4+
 j8E5ysvu2DbIcFInsiXPp/BDqk5stwaLac/VOKHmt6R8JwoMsganxC5PhYst44vZfjrn
 b+UFYCLjXvXpoSlw9x5YnwgZ+uZkyk6w7Kh3GDA7YGcNrLV4Xs4FE/ZwHtl14gb6oHpY
 i3Fw==
X-Gm-Message-State: AOAM533pura3yet1scyb40qcFJz41vFM7c6F9HqPvKMbY85tGBEskz+Y
 sGgYOen2AYKfgg5LEUMU5noNyg==
X-Google-Smtp-Source: ABdhPJw8ep9/pbXF2Su/zlcXhSRw0Tiq7c3D4P/Ith2AwJI316p7Uapmu81omHOlAmZusLXqij3mSg==
X-Received: by 2002:a5d:6a41:: with SMTP id t1mr10202625wrw.388.1596791446966; 
 Fri, 07 Aug 2020 02:10:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c15sm9291026wme.23.2020.08.07.02.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 02:10:46 -0700 (PDT)
Date: Fri, 7 Aug 2020 11:10:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH v2] drm/vkms: guarantee vblank when capturing crc
Message-ID: <20200807091044.GB2352366@phenom.ffwll.local>
Mail-Followup-To: Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Sidong Yang <realwakka@gmail.com>, twoerner@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-usp@googlegroups.com
References: <20200806111705.xebopzucxr3367z4@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806111705.xebopzucxr3367z4@smtp.gmail.com>
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

On Thu, Aug 06, 2020 at 08:17:05AM -0300, Melissa Wen wrote:
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
> kms_cursor_crc subtest: when running the test sequence or one of its
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

For next time around, please include a patch changelog here so people know
what was changed, and why. E.g.

v2:
- extract a vkms_set_composer helper
- fix vblank refcounting for the disabling case

> 
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Co-developed-by: Sidong Yang <realwakka@gmail.com>
> Signed-off-by: Sidong Yang <realwakka@gmail.com>
> Co-developed-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Daniel Vetter <daniel@ffwll.ch>

Nah that's a bit too much credit for me, I'll get the r-b tag. You &
Sidong figured this story out, so I'd use Co-debugged-by: Sidong here for
credits.

> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 20 +++++++++++++++++---
>  drivers/gpu/drm/vkms/vkms_drv.h      |  1 +
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index b8b060354667..e2ac2b9759bf 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -233,6 +233,22 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
>  	return 0;
>  }
>  
> +void vkms_set_composer(struct vkms_output *out, bool enabled)

Since this isn't yet used outside of this file I'd just make this static.
Writeback connector support can then add the prototype in the header. With
that

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Please include that tag for revision 3.

Cheers, Daniel

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
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index f4036bb0b9a8..2cc86d08bd4e 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -142,6 +142,7 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
>  			   size_t *values_cnt);
>  
>  /* Composer Support */
> +void vkms_set_composer(struct vkms_output *output, bool enabled);
>  void vkms_composer_worker(struct work_struct *work);
>  
>  #endif /* _VKMS_DRV_H_ */
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
