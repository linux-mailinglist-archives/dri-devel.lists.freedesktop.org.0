Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D21B3D36FE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 10:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BA86F925;
	Fri, 23 Jul 2021 08:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027F06F925
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 08:47:05 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id he41so2587094ejc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 01:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=L6YWqU+4VaYUGpHSr969WSYWDilbu78nOpHMXTymYu8=;
 b=YSW5HSgvsyOekSugI/wJU6Br+I7D5OvQbwthGG+lzKmO8vLRp6X53LOVYtYXQ/zQtO
 qFLddvIRAeAFccdOev4mukYQNwaAXzU6tliQtV86T1jbEUFbGz3taUQa/Y0hEt7WUTGu
 8tx9NANhlGRrNIv1OG3Dlz5hzkkWH2J8MSYf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=L6YWqU+4VaYUGpHSr969WSYWDilbu78nOpHMXTymYu8=;
 b=eJrRzwwQEIbfDWyQ9bTMx7XU0/khdxJBqrE7gnzJUWTbSCsGoBbrl84mQ8x+btBkV/
 elJyN8JdPRrsNp4JJfQYDUCjE01O1h48YB22fmVd3Gps1ZyI9vP+NhNX4h62/bre10iX
 5SKJfvJfTawOWpOFXtAsPMI+P6yZh9s3qyHZt5ez3/16D67ETwL469MbeUlaoLSf3CS5
 07EJFMdq3zQUw6wz8tGQTS4GlWLzOWTnCgvaa0ut67dp1LwklFLWmv6ssi8o51MLBCdN
 a1UWCCI7XuISKBGVAftU/Adesvm+JlGAu+pMRIrwDkueU209DU+SrLUdiVAP8ojkTGja
 O5Ug==
X-Gm-Message-State: AOAM532VBbb/0IRKcSAn2sim2cA/XFDUaI368ra4K+XqcqE0FheT2iWN
 eDSj4ZLWHZnE9TfOcxZ0MI9iRLRHavAAug==
X-Google-Smtp-Source: ABdhPJz6sf54xjaETXMte9Va4eCxZrpv5fMqt/GtArPzno0ct1BpcdiHBiIyPWChcwy8UmnofECBjA==
X-Received: by 2002:a17:906:7009:: with SMTP id
 n9mr3736367ejj.66.1627030023656; 
 Fri, 23 Jul 2021 01:47:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id cr9sm13480349edb.17.2021.07.23.01.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 01:47:03 -0700 (PDT)
Date: Fri, 23 Jul 2021 10:47:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
Message-ID: <YPqCBUDiibBWUs2/@phenom.ffwll.local>
References: <20210722124127.17901-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210722124127.17901-1-christian.koenig@amd.com>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 02:41:23PM +0200, Christian König wrote:
> Doing this in vmw_ttm_destroy() is to late.
> 
> It turned out that this is not a good idea at all because it leaves pointers
> to freed up system memory pages in the GART tables of the drivers.

So I wanted to review this series, and I can't reconcile your claim here
with the demidlayering Dave has done. The driver patches here don't
ouright undo what Dave has done, but that means the bug has been
preexisting since forever (or is due to some other change?), and your
commit message is a bit confusing here.

The final patch just undoes the demidlayering from Dave, and I really
don't see where there's even a functional change there.

And even these patches here don't really change a hole lot with the
calling sequence for at least final teardown: ttm_tt_destroy_common calls
ttm_tt_unpopulate as the first thing, so at least there there's no change.

Can you pls elaborate more clearly what exactly you're fixing and what
exactly needs to be reordered and where this bug is from (commit sha1)? As
is I'm playing detective and the evidence presented is extremely since and
I can't reconcile it at all.

I mean I know you don't like typing commit message and documentation, but
it does get occasionally rather frustrating on the reviewer side if I have
to interpolate between some very sparse hints for this stuff :-/
-Daniel

> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index b0973c27e774..904031d03dbe 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -526,14 +526,9 @@ static void vmw_ttm_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>  	struct vmw_ttm_tt *vmw_be =
>  		container_of(ttm, struct vmw_ttm_tt, dma_ttm);
>  
> -	vmw_ttm_unbind(bdev, ttm);
>  	ttm_tt_destroy_common(bdev, ttm);
>  	vmw_ttm_unmap_dma(vmw_be);
> -	if (vmw_be->dev_priv->map_mode == vmw_dma_alloc_coherent)
> -		ttm_tt_fini(&vmw_be->dma_ttm);
> -	else
> -		ttm_tt_fini(ttm);
> -
> +	ttm_tt_fini(ttm);
>  	if (vmw_be->mob)
>  		vmw_mob_destroy(vmw_be->mob);
>  
> @@ -578,6 +573,8 @@ static void vmw_ttm_unpopulate(struct ttm_device *bdev,
>  						 dma_ttm);
>  	unsigned int i;
>  
> +	vmw_ttm_unbind(bdev, ttm);
> +
>  	if (vmw_tt->mob) {
>  		vmw_mob_destroy(vmw_tt->mob);
>  		vmw_tt->mob = NULL;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
