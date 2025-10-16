Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38575BE3FEA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 16:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EEA10E9FC;
	Thu, 16 Oct 2025 14:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GibI3dyY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC4F10E304
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 14:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760626108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U03eGbs4wjj3PFtRG+pRSc+mdF22jPXyW9jnySqsUVw=;
 b=GibI3dyYFu1LMcoRFCk97vhuTB8D2JXWGa0HFO7rpim3MRAgF5DP8XePQjZuFwqBH4CxBX
 Bdhx66DO1yHo56M6Yp3iQ+MR6OSY0eMi1/oHrOvviYWSihyD1eWSLL3cqmwDM/Uz1Rs6AC
 v1FYz7IMuu6mcr0H5yuRaYccgAXYfMQ=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-usYdYUz1NIGe9Pf3-xMUww-1; Thu, 16 Oct 2025 10:48:25 -0400
X-MC-Unique: usYdYUz1NIGe9Pf3-xMUww-1
X-Mimecast-MFC-AGG-ID: usYdYUz1NIGe9Pf3-xMUww_1760626104
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e2e60221fso1534164b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 07:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760626104; x=1761230904;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U03eGbs4wjj3PFtRG+pRSc+mdF22jPXyW9jnySqsUVw=;
 b=TvwPClq6AbXfop5xW8RGcSC2xKdxjNhjuRh1Hs2WC0askEPphr+G6zNtwNkhACgpaJ
 +xHuTJ+3bWWGABLz9BZzkO/4ay6KLyeOS6aOXmOM1Z4QcCzrRdbyUJO31Se/EIa4ngVp
 FD9bp6P8wXWRmOOPmz0kjvZBu366XS9j5EiLnjHw7cyuSJI/hEAcqGKrfjOXEi1yLHep
 DfCL8gZVbCZajOA8IKJUKOo0+CJAHaKy/UlQcXMEKho2ml94ERnTBqa2/Yj6urKJMMXA
 yAYdIFFQxbQEMKktoCYua11hJ0snrUdeVPpGp4lckgZfcrEMybBvrdnMB5lmY2ldjIqM
 cyUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYzuEzI2xkDv/kwQgRItQfzUn+ptNp8jRk+hwPi4pXOL6HOfnQqjovzeiGC/Bmh9zCvNtyDxKsiGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgmBhC17Dtb2nJM0nTpYVCJq6yLZHcU86m0ZwOdftEsMeouAek
 ZE648IadZcuDznCC/KtnIkBmVkfpNvza804ZZFtC095kJqil6u39RyqV8pEPDDUkVQJLCxx6+ks
 i3yhciHKLuTeFpnhQQ4qcxzDqQbl/SNJpIdf0u96QDb0OcFfeoOnyYsHVz3so/f20CaFKLQ==
X-Gm-Gg: ASbGncsEUw2C3wxaebad0H/693/eDVTaxwED7XLzIzSBcRKWywrk5MlroYDOnVqMC4k
 pW8cbJ9bIKIXITBoTrhqZsfONwwKOAHRFX89sTe5XaadffrEnF25WaaP5h9sc6VF+LfHEXXMFhf
 aefuoZxZvgKWFGbnCSYg4752W0+1Rsa/PF7bbbe6jkB2HplFe6+fkio14zYXVKn++IvRaerhHWI
 B6BfNPtQKBD2JEXI4o5qPQ4OJgz89lUt68rL6RVoaN/i3coH44QgmaYaFJkYCwi/vwuvQiInsWl
 519aMn7C5/PJPFpgB/4v5SJwVOB1g55hANHl78QMZMKNawXBkjWdINGJMaKEVDrFxXHgng==
X-Received: by 2002:a05:6a00:1a94:b0:781:18b2:36aa with SMTP id
 d2e1a72fcca58-7a220a5700fmr415388b3a.4.1760626104093; 
 Thu, 16 Oct 2025 07:48:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGQ44ZW5qtLmpXABJdEGtyVfV9M7TtOdFyJpQ/vxnPLRjHGV4Uly8iyTm+ovbwyTlxsS9SKw==
X-Received: by 2002:a05:6a00:1a94:b0:781:18b2:36aa with SMTP id
 d2e1a72fcca58-7a220a5700fmr415341b3a.4.1760626103649; 
 Thu, 16 Oct 2025 07:48:23 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992d09671asm22675521b3a.47.2025.10.16.07.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 07:48:23 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:48:19 +0900
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: zack.rusin@broadcom.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jfalempe@redhat.com, ian.forbes@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH drm-misc-next v3 0/1] add drm_panic_support for vmwgfx-stdu
Message-ID: <aPEFs0kYfXGZUHCA@zeus>
References: <20250919032936.2267240-1-ryasuoka@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250919032936.2267240-1-ryasuoka@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p4rCjfytxFj-kgjlxDV8o1NQaGi5ce-JEJmcslk15cI_1760626104
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 19, 2025 at 12:29:29PM +0900, Ryosuke Yasuoka wrote:
> Add drm_panic support for stdu in vmwgfx. This patch was tested in a VM
> with VMSVGA on Virtual Box.
> 
> Based on the feedback for v2 patch, I've made the following updates in
> my v3 patch.
> - Use MEMREMAP_WB | MEMREMAP_DEC flags for memremap
> - Use vmw_priv->initial_height and initial_width for sb and VRAM
> - Move all panic related functions to the vmwgfx_kms.c file
> - Ensure if the current display unit is 0 in get_scanout_buffer()
> 
> I did not apply all of Ian's feedback in this v3 patch for the reasons
> outlined below.
> 
> > 1. You can call `vmw_kms_write_svga` directly in `panic_flush`. There
> > is no need to mark the buffer as dirty or send any commands.
> 
> In my test environment (VirtualBox), the panic screen appears unstably 
> without dirty command's submission. Without it, the screen sometimes
> appears immediately as expected, and at other times, there's a delay
> of 15 to 20 seconds. I've also observed that it sometimes only appears
> after switching between the VirtualBox console window and other windows.
> 
> With command submission, we can stably get a panic screen. Even if it
> fails, we may get the panic screen ultimately. Therefore, I think we
> should retain vmw_kms_panic_do_bo_dirty() to submit commands.
> 
> > 2. The format should be hardcoded to RGB565 to minimize the risk of
> > overrunning VRAM. Adjust the pitch accordingly to 2x width.
> 
> While it's possible to output the panic screen with RGB565 by adjusting
> pitch and width, and BPP on the (virtual) hardware side, this approach
> causes debugfs to fail. It appears that the BPP must be reset after the
> panic screen is displayed, and there is no way to wait for the screen
> to be fully displayed within the drm_panic handler code.
> 
> In my test environment, as VRAM has enough space even when using
> XRGB8888 (32 bits), I think the risk of overruning VRAM is low. So I've
> kept the default format and CPP size.
> 
> v1:
> https://lore.kernel.org/all/20250901083701.32365-1-ryasuoka@redhat.com/
> 
> v2:
> https://lore.kernel.org/all/20250908141152.221291-2-ryasuoka@redhat.com/
> - Map a scanout_buffer to VRAM in .get_scanout_buffer
> - And then write to VRAM directly using fifo in legacy mode to avoid
> allocations or command submissions.
> 
> 
> Ryosuke Yasuoka (1):
>   drm/vmwgfx: add drm_panic support for stdu mode
> 
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h  |   4 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 165 +++++++++++++++++++++++++++
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |   2 +
>  3 files changed, 171 insertions(+)
> 
> 
> base-commit: d41c79838c47bc822534cd53628fe5e0f8ad2424
> -- 
> 2.51.0

Hi all,

This is a gentle reminder for this v3 patch.
I would appreciate any feedback when you have a chance.

Ian, your feedback on v1 and v2 were very helpful. I would appreciate it
if you could take another look when you have a moment.

Any comments are welcome.

Thank you
Ryosuke

