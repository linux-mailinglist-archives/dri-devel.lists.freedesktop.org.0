Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB3E462F3E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 10:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFD56F9A5;
	Tue, 30 Nov 2021 09:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DECE6F9A2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 09:06:30 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id o29so16784135wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 01:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1dBZLbZF5dWyM/EMU1vFF6wg/o7BNOVLFgZ+CDZNwEw=;
 b=aU52l4grnl9Q6gd5C2o3kKic3WMh2p6CdW3kAm0pct7ZVvj7zU0BBh45fQmrmHOztg
 OxdsB7YWiGeA0lvH/JfF7DQhVOLZIlW2u8W7aZXa+iVfVwo8JwUx+3bfN76SZPeiCN+5
 9X8sJnE+ZtPAD1r6WM9Rh6r6UfwKe5jIiRFwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1dBZLbZF5dWyM/EMU1vFF6wg/o7BNOVLFgZ+CDZNwEw=;
 b=2hkECHF/KTbrATGFOmGR6bltM6nDD1kqjQKysjQqQ0nc8fscT4iL+CaC2CnSHpLbYJ
 ry9HXhGpipsYJRhK+Ifnh6K5tZXz9cHx6ddbC6l+UTm0N713EoxbOzsqFyHeYQPii08K
 FR3r1Il+qiRB8MWJaj275+GU1UzX6Yvh0qlTbAw4x3Cz0Cq9krdEEeozqP+92d2K0ARS
 uUX0+YAXhKbkWt0jSchQZWkW0u9su9SfwG4zwbvScolnbqzsVSzaRtqmcd78pgsWSJzU
 QYAb0kw2UUT152X6q90vRX1RkZ4Ifn0k97o5RD6K1Al1gk+6XTdiGPclkpBXyyYp7sfi
 tf/g==
X-Gm-Message-State: AOAM533Hi5zCNqEwcMUC65SrnLp+cH5vvzplYaA5P3PwjBc+U6v/U8qs
 w+AhBsXqo3w3I84LuZoqVVsu9A==
X-Google-Smtp-Source: ABdhPJy27LOCVKczkaSg04kB6HvggkkLk506KKcdLUlwLC6sXlmw18xgS6ZOaIR73lti2D6YyLmTBA==
X-Received: by 2002:a05:600c:4104:: with SMTP id
 j4mr3423937wmi.178.1638263188907; 
 Tue, 30 Nov 2021 01:06:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q123sm1689665wma.30.2021.11.30.01.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 01:06:28 -0800 (PST)
Date: Tue, 30 Nov 2021 10:06:26 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 04/28] drm/qxl: use iterator instead of
 dma_resv_shared_list
Message-ID: <YaXpkoY1AUfYp6nn@phenom.ffwll.local>
References: <20211129120659.1815-1-christian.koenig@amd.com>
 <20211129120659.1815-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211129120659.1815-5-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 29, 2021 at 01:06:35PM +0100, Christian König wrote:
> I'm not sure why it is useful to know the number of fences
> in the reservation object, but we try to avoid exposing the
> dma_resv_shared_list() function.
> 
> So use the iterator instead. If more information is desired
> we could use dma_resv_describe() as well.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/qxl/qxl_debugfs.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
> index 1f9a59601bb1..6a36b0fd845c 100644
> --- a/drivers/gpu/drm/qxl/qxl_debugfs.c
> +++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
> @@ -57,13 +57,16 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
>  	struct qxl_bo *bo;
>  
>  	list_for_each_entry(bo, &qdev->gem.objects, list) {
> -		struct dma_resv_list *fobj;
> -		int rel;
> -
> -		rcu_read_lock();
> -		fobj = dma_resv_shared_list(bo->tbo.base.resv);
> -		rel = fobj ? fobj->shared_count : 0;
> -		rcu_read_unlock();
> +		struct dma_resv_iter cursor;
> +		struct dma_fence *fence;
> +		int rel = 0;
> +
> +		dma_resv_iter_begin(&cursor, bo->tbo.base.resv, true);
> +		dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +			if (dma_resv_iter_is_restarted(&cursor))

I think a kerneldoc patch for struct dma_resv_iter to highlight that
iterators can be restarted and users need to take that into account if
they accumulate statistics with dma_resv_iter_is_restarted() would be
good. I guess I'll go type that.

On this patch:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> +				rel = 0;
> +			++rel;
> +		}
>  
>  		seq_printf(m, "size %ld, pc %d, num releases %d\n",
>  			   (unsigned long)bo->tbo.base.size,
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
