Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E63254EA990
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 10:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A9F10E7C6;
	Tue, 29 Mar 2022 08:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E3210E7D6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 08:46:44 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w21so19162052wra.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=WQ2kaLdWd6bHTTrUYmbjDh5DyF5e2Q5tFk7Y5yf6aUw=;
 b=eTH/oHfZCV5h175g+RYPvPFYYi6sXFINblkVYg23zTrxiBsRnTFWise7hJ4+9STE/G
 ZDHccT2vFfBJrJN4Ag/Fk7dNV1RxSoITw3Mi+zPhCs0Qwnu8Av84KmlR4TkM+8Ecmy9q
 /Io6bY6jMY35VykqPN/PuL1VVXtUHa8wHreG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WQ2kaLdWd6bHTTrUYmbjDh5DyF5e2Q5tFk7Y5yf6aUw=;
 b=J3V8+eEbdBhf8SdCEUTAknQR/sPsC68T2yqIHZz7/1/YkFd8mYXgoDlcIByb+lNkaG
 sj3TjzNYEm9QdKc37Q7KrtrKXt/ynuJJcsw3JFMnPTNVCsSQ+zMrw6gUbjjhpkSlavxn
 gXhu9jc0CNDCm5eR54v8lkv0j+nqan/mM3vmbuh2QZbLgPZNqIBdQTpMgprl1NnpsllG
 b/4Fz+d7Zba/WgS2n0GATnhdYa/KbwaUDQ6mnFXcizsChjD/HwTZKshPsgwk0BnOnNPJ
 qfDE8NZvj+T6g6H5z1+k8KtxTCb/+8sRqu0JhZpwFB69ZFc1MgJAK98HycRO0duCJGfR
 648w==
X-Gm-Message-State: AOAM533VFsQlzRqyFGEhZ78HtmTgPGcXijptlHUHfDPrI4aGTIJSSZXD
 BrhwhAZ1Obp+3yhE1AckCKMAow==
X-Google-Smtp-Source: ABdhPJwf7Cm09Z2yPWUhWw1HzwyqJfse0xcCimVQyH8DzhRGXu5ot9HMcA9Ssfthoofr9lmI4zKDOw==
X-Received: by 2002:adf:e488:0:b0:205:a8e0:6095 with SMTP id
 i8-20020adfe488000000b00205a8e06095mr22344861wrm.324.1648543603106; 
 Tue, 29 Mar 2022 01:46:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a05600c34d400b0038caf684679sm2398607wmq.0.2022.03.29.01.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 01:46:42 -0700 (PDT)
Date: Tue, 29 Mar 2022 10:46:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] dma-buf/sync-file: fix logic error in new fence
 merge code
Message-ID: <YkLHcMGARAA9Ektl@phenom.ffwll.local>
References: <20220329070001.134180-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220329070001.134180-1-christian.koenig@amd.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 09:00:00AM +0200, Christian König wrote:
> When the array is empty because everything is signaled we can't use
> add_fence() to add something because that would filter the signaled
> fence again.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Fixes: 519f490db07e ("dma-buf/sync-file: fix warning about fence containers")
> ---
>  drivers/dma-buf/sync_file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index b8dea4ec123b..514d213261df 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -262,7 +262,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>  	}
>  
>  	if (index == 0)
> -		add_fence(fences, &index, dma_fence_get_stub());
> +		fences[index++] = dma_fence_get_stub();

Uh idiot me wondered about this and somehow convinced myself that adding a
random fences instead of a singalled stub is ok. I should have checked
more carefully :-/

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  
>  	if (num_fences > index) {
>  		struct dma_fence **tmp;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
