Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6781868B2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 11:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA556E3B8;
	Mon, 16 Mar 2020 10:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829656E3B8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 10:07:41 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y2so4894215wrn.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 03:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Geh4dUiO8J2teBeL6xSDSQaiwG+9Q5nhNPs2mK60WQo=;
 b=HW1wm6N1of8d7NFgd/ob+AGPy24ZUSoubjw4LcAF0JhBPwShFA7/60TW5qsWRIKAth
 kRwZ+FA+Znz40RywTSkRD5ojbEKKoTqG6YM75aCEQDTBCiSvM/DuGVp6KUMHpR+8NDv5
 hByNwjP8q2JxWrBltJe2zJtSVzPTZbjTUNpMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Geh4dUiO8J2teBeL6xSDSQaiwG+9Q5nhNPs2mK60WQo=;
 b=L70vNsfxcHp1G9AIIorUYkXh5PHCUH8L64JBtnRbHUTffJsgYXNVuORvL//8ezEhuL
 xnAiFcN2xNn0d5sj1OwjuK0vFxrjhX/BOl/IcETw11m7Pre6Ig5kXlP5h0s8Tl5CaqUo
 cnlbjkKaYFLYVCJAy0kTSn+NZAj1G+B0EqKEixR1sSpddq5DwstcnIMaN5uKrHigNUVY
 DD+agw2NgudkfvfZ1jW8Qd+XjJ84yfKCYFnKs/N799RC8Emf/udeQVt0ziWx0OtK2kO9
 h6z1/5rNY4UMwGwfUJKfvxB4hOKbhsXmhncKn6R5ts5n9BbxEi1k2A0nQ4WOJeOUzVaD
 vBqg==
X-Gm-Message-State: ANhLgQ1GMEhNyXcwotne9xJqm+LTpRT+Y3l47SYSBSbX2WcjlDKfnCwj
 88obhXq33n8Y3GBbNdoxva952Q==
X-Google-Smtp-Source: ADFU+vssjc1YcL/75elRZyWIzdTy5HNVVGfQFcoU+TN0ZlcIrfR4BBYqO1ut/Vn5B0gBv37aQVU+IQ==
X-Received: by 2002:adf:ed47:: with SMTP id u7mr16730378wro.190.1584353260129; 
 Mon, 16 Mar 2020 03:07:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l18sm23323605wrr.17.2020.03.16.03.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:07:39 -0700 (PDT)
Date: Mon, 16 Mar 2020 11:07:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH] drm/mm: Allow drm_mm_initialized() to be
 used outside of the locks
Message-ID: <20200316100737.GM2363188@phenom.ffwll.local>
References: <20200309121529.16497-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200309121529.16497-1-chris@chris-wilson.co.uk>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 09, 2020 at 12:15:29PM +0000, Chris Wilson wrote:
> Mark up the potential racy read in drm_mm_initialized(), as we want a
> cheap and cheerful check:
> 
> [  121.098731] BUG: KCSAN: data-race in _i915_gem_object_create_stolen [i915] / rm_hole
> [  121.098766]
> [  121.098789] write (marked) to 0xffff8881f01ed330 of 8 bytes by task 3568 on cpu 3:
> [  121.098831]  rm_hole+0x64/0x140
> [  121.098860]  drm_mm_insert_node_in_range+0x3d3/0x6c0
> [  121.099254]  i915_gem_stolen_insert_node_in_range+0x91/0xe0 [i915]
> [  121.099646]  _i915_gem_object_create_stolen+0x9d/0x100 [i915]
> [  121.100047]  i915_gem_object_create_region+0x7a/0xa0 [i915]
> [  121.100451]  i915_gem_object_create_stolen+0x33/0x50 [i915]
> [  121.100849]  intel_engine_create_ring+0x1af/0x280 [i915]
> [  121.101242]  __execlists_context_alloc+0xce/0x3d0 [i915]
> [  121.101635]  execlists_context_alloc+0x25/0x40 [i915]
> [  121.102030]  intel_context_alloc_state+0xb6/0xf0 [i915]
> [  121.102420]  __intel_context_do_pin+0x1ff/0x220 [i915]
> [  121.102815]  i915_gem_do_execbuffer+0x46b4/0x4c20 [i915]
> [  121.103211]  i915_gem_execbuffer2_ioctl+0x2c3/0x580 [i915]
> [  121.103244]  drm_ioctl_kernel+0xe4/0x120
> [  121.103269]  drm_ioctl+0x297/0x4c7
> [  121.103296]  ksys_ioctl+0x89/0xb0
> [  121.103321]  __x64_sys_ioctl+0x42/0x60
> [  121.103349]  do_syscall_64+0x6e/0x2c0
> [  121.103377]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [  121.103403]
> [  121.103426] read to 0xffff8881f01ed330 of 8 bytes by task 3109 on cpu 1:
> [  121.103819]  _i915_gem_object_create_stolen+0x30/0x100 [i915]
> [  121.104228]  i915_gem_object_create_region+0x7a/0xa0 [i915]
> [  121.104631]  i915_gem_object_create_stolen+0x33/0x50 [i915]
> [  121.105025]  intel_engine_create_ring+0x1af/0x280 [i915]
> [  121.105420]  __execlists_context_alloc+0xce/0x3d0 [i915]
> [  121.105818]  execlists_context_alloc+0x25/0x40 [i915]
> [  121.106202]  intel_context_alloc_state+0xb6/0xf0 [i915]
> [  121.106595]  __intel_context_do_pin+0x1ff/0x220 [i915]
> [  121.106985]  i915_gem_do_execbuffer+0x46b4/0x4c20 [i915]
> [  121.107375]  i915_gem_execbuffer2_ioctl+0x2c3/0x580 [i915]
> [  121.107409]  drm_ioctl_kernel+0xe4/0x120
> [  121.107437]  drm_ioctl+0x297/0x4c7
> [  121.107464]  ksys_ioctl+0x89/0xb0
> [  121.107489]  __x64_sys_ioctl+0x42/0x60
> [  121.107511]  do_syscall_64+0x6e/0x2c0
> [  121.107535]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

A bit on the fence on this, but also kinda the only option.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/drm/drm_mm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
> index d7939c054259..ee8b0e80ca90 100644
> --- a/include/drm/drm_mm.h
> +++ b/include/drm/drm_mm.h
> @@ -272,7 +272,7 @@ static inline bool drm_mm_node_allocated(const struct drm_mm_node *node)
>   */
>  static inline bool drm_mm_initialized(const struct drm_mm *mm)
>  {
> -	return mm->hole_stack.next;
> +	return READ_ONCE(mm->hole_stack.next);
>  }
>  
>  /**
> -- 
> 2.20.1
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
