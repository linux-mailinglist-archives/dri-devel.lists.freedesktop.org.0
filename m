Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE6533D74
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 15:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEE710E451;
	Wed, 25 May 2022 13:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178D410E451
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 13:13:57 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id o9so4786985wmd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lmbJRuO8uHeaBnVDzKY/ZYIDnHRrOxdK5BjQnLSy42w=;
 b=Pg/PqdMHjPIw9ISgM0XG0Quw8mgnBQMljExJqpBKyIldTVVwIG4CebJ6u7VjSJmlkI
 /68YGv7wGJsRAJp+58CvnscocvB6gGa7TlmeZ807OmyQidk/oltdSjMSSzjzhGgRKhZz
 yAm2MJk57oAqUOb5dFVPdxBCc69cqVB65Y1y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lmbJRuO8uHeaBnVDzKY/ZYIDnHRrOxdK5BjQnLSy42w=;
 b=uInQs5eYDPF6/bvZekM+jRw9lyOT+INMBNlCI+aWCclpDu32rtbAQU21saAGHnlyVj
 eD2jULxz3RFpVz5tHyfLmKVzrnhDlrzg9Y4xGzQyMVRyyqoTRcltxdfr34pwSGyojJwv
 diP05+Hal7XWjE9QpTXgaB5x3ezPrZ8VpHzT7cB9Yyrsguo35Rby8fZcVBuw+DJZj1ZI
 M30/3/e09E3vEQAPY7z5UwpC8+Z3ies/mf98vty/F8KebG94tGTu8Q89ClQtCBWmO5w5
 MenekNeCa7W0AMGBOMVs3Ez6HT4KpluVfLjzmic8m4ztPD70GSrwtQnTqlLBZApHaLpU
 ocvQ==
X-Gm-Message-State: AOAM530tBBRMxYzRYEwwm8MEp+mLzxi4pevljoTXct0RsUmoAhfbfm7b
 YzkvdBJL3msQTnaVhHIYSa03mg==
X-Google-Smtp-Source: ABdhPJwxgdGa79ycChw5p3tzy0jtFWtqcvHwQvr8K6MJgm1hA+uLhjMa/mzAxYHClQnbnKrzvuq1tQ==
X-Received: by 2002:a05:600c:350f:b0:397:7204:ce8e with SMTP id
 h15-20020a05600c350f00b003977204ce8emr1636850wmq.0.1653484435543; 
 Wed, 25 May 2022 06:13:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p40-20020a05600c1da800b003973a3fe4fasm2216698wms.42.2022.05.25.06.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 06:13:54 -0700 (PDT)
Date: Wed, 25 May 2022 15:13:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/5] dma-buf: return only unsignaled fences in
 dma_fence_unwrap_for_each v3
Message-ID: <Yo4rkGsNuG8bDRp0@phenom.ffwll.local>
References: <20220506141009.18047-1-christian.koenig@amd.com>
 <20220506141009.18047-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220506141009.18047-3-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 06, 2022 at 04:10:07PM +0200, Christian König wrote:
> dma_fence_chain containers cleanup signaled fences automatically, so
> filter those out from arrays as well.
> 
> v2: fix missing walk over the array
> v3: massively simplify the patch and actually update the description.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/linux/dma-fence-unwrap.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
> index e7c219da4ed7..a4d342fef8e0 100644
> --- a/include/linux/dma-fence-unwrap.h
> +++ b/include/linux/dma-fence-unwrap.h
> @@ -43,9 +43,13 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
>   * Unwrap dma_fence_chain and dma_fence_array containers and deep dive into all
>   * potential fences in them. If @head is just a normal fence only that one is
>   * returned.
> + *
> + * Note that signalled fences are opportunistically filtered out, which
> + * means the iteration is potentially over no fence at all.
>   */
>  #define dma_fence_unwrap_for_each(fence, cursor, head)			\
>  	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
> -	     fence = dma_fence_unwrap_next(cursor))
> +	     fence = dma_fence_unwrap_next(cursor))			\
> +		if (!dma_fence_is_signaled(fence))
>  
>  #endif
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
