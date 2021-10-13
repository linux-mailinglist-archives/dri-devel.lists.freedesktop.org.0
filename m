Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C024742C346
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E460589F8B;
	Wed, 13 Oct 2021 14:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8355A8825B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 14:32:17 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m22so9276108wrb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 07:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iKQ96m1zzkQMuFL3fcXQPzaxnnE4DluBXjRvFkSR5wI=;
 b=ODf6itJ3fnWbDlharuS4Wj+1XeDkgwC8SSXHTy+CeDfYmS8y1a4+OuduJ3MChaifTP
 GgeKZkeLiaUbLvIOiC9S9XqAmkICJYYBhlnJYHE/QKU/OA30SExGMtA3ucg3zDbW//2+
 KcKkk1wVoLLSvWfWDVDOeUNBKIGDSsrz3/GoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iKQ96m1zzkQMuFL3fcXQPzaxnnE4DluBXjRvFkSR5wI=;
 b=GPlUdDq1e8W2uPbM/At65JsnVDuGeTq5YhlBvUXmGesqviMe/mRSQHpPBlR4utYV7S
 VECAzSgXYw98V5kDZ9eqnYeCMf9A1S/xK0mtwFvSd3l1OycDu57r9UxhVjtwfVH1V6K2
 woK+YOKiN4j/mNYyjSf55pQnTY/0C4qvFsg1cKfvsvABNWs16Jg64o2t9WSzJeuITf01
 rIKthTYA7V+vbjTXrTDrZm5cwakVGWRE5Tga9hETYkA8J4Z929LXfW+XG7TCstBhK34D
 HTpDdicf2tf7eX5ByjklOJjCDR7WjreDQ64/3Gn2eWj0XHxgIAIjPlCNcrB5kiVJOT4E
 QN0g==
X-Gm-Message-State: AOAM531vBXDSY5FP0paO++5xM8UJA9t83yUHL7FbGPxOdkyPH96FBLBk
 aiD396f/RAcbdtY0uWb/cO+oHQ==
X-Google-Smtp-Source: ABdhPJxOOVUWtj4KaDAa/dBN+HmwBExqoN7dFMBZ9hrJ2SWC4H73/jm3/GoodLipJP6b1uo6WHOAGQ==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr13006075wmi.143.1634135535984; 
 Wed, 13 Oct 2021 07:32:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b19sm5756585wmb.1.2021.10.13.07.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 07:32:15 -0700 (PDT)
Date: Wed, 13 Oct 2021 16:32:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 28/28] drm/etnaviv: replace dma_resv_get_excl_unlocked
Message-ID: <YWbt7cLOLDSQhkOV@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-29-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005113742.1101-29-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Tue, Oct 05, 2021 at 01:37:42PM +0200, Christian König wrote:
> We certainly hold the reservation lock here, no need for the RCU dance.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 4dd7d9d541c0..7e17bc2b5df1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -195,7 +195,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>  			if (ret)
>  				return ret;
>  		} else {
> -			bo->excl = dma_resv_get_excl_unlocked(robj);

Maybe have that in the series to sunset dma_resv_get_excl_unlocked()? Just
so it makes a bit more sense from a motivation pov. Or explain that in the
commit message.

Anyway looks correct.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> +			bo->excl = dma_fence_get(dma_resv_excl_fence(robj));
>  		}
>  
>  	}
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
