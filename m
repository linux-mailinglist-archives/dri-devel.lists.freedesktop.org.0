Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEF04E5353
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 14:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDCA10E336;
	Wed, 23 Mar 2022 13:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2601E10E336
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 13:40:20 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id h1so1896689edj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 06:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rMr4FkMh8i++YlyUqr9dMFhM5WbnxiWUCODo4w37S00=;
 b=Sgk0N73t/u+0G0kFZoTrnmhRMECH6CC0cYKNLmmSnx1Zd7/sp5ipFnV3fMujMZz9E6
 OH+L17h1ttCPy09jliLQb2SIMC9mH27D9DEkO6d5UK2XhR6vLHcEk1ceqY8Fyyc4/5QD
 oC6isVYPeEdGXApm0UPJKr+yqWUNPBl3nDwlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rMr4FkMh8i++YlyUqr9dMFhM5WbnxiWUCODo4w37S00=;
 b=LgfVHAB+rriw+E3fYYdSY1NeO6lzvZOTJNiKCtQlWPaIGtOT7iBiaK0py/Jh8JnRGp
 F8mpvIuMY0WPbbnOv14EqWB8OmWm+6mio6qvWSoZEvPG4abCtZUTXotgSERLkWqIDlmU
 z8av62vaPvYx5XgJ9n+zoLAdpGUJK3ouCHVhuNkRFb/LTUMWKHKNZN5tROTNnmyKc/MJ
 fxe4igHDOwmEMJmZ744MLiivZCrfkcDMqavuBwKvVFLeuOeDRj5Z48MHmRzTmeM+8WkY
 13A4R3X0CEGIYMDmlAcoa3vOqQPHVoxO/Izje27k2ZOenGXgc2IaLdNl8b2smgr71fD0
 IPQw==
X-Gm-Message-State: AOAM532hHIEycfi/GMe6KuPRoxQJwUkpeCtZB6SGLKhEvksZZWzNwyCj
 Evy7ffuVWu7ZUOxukO+x6dlgkQ==
X-Google-Smtp-Source: ABdhPJzlIU8sMDlhS6X2KQIMH8rkFPqS/tyPjHAQogMPdNNHGymqjCyha9rxXg0whd5L0J3m4BzcDA==
X-Received: by 2002:a05:6402:1e90:b0:419:4cdc:8b05 with SMTP id
 f16-20020a0564021e9000b004194cdc8b05mr60581edf.211.1648042818626; 
 Wed, 23 Mar 2022 06:40:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 hb19-20020a170906b89300b006daa95d178esm9852044ejb.60.2022.03.23.06.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:40:17 -0700 (PDT)
Date: Wed, 23 Mar 2022 14:40:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 11/23] dma-buf: drop the DAG approach for the dma_resv
 object v2
Message-ID: <YjsjQLLrYadsNiOV@phenom.ffwll.local>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-11-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321135856.1331-11-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 21, 2022 at 02:58:44PM +0100, Christian König wrote:
> So far we had the approach of using a directed acyclic
> graph with the dma_resv obj.
> 
> This turned out to have many downsides, especially it means
> that every single driver and user of this interface needs
> to be aware of this restriction when adding fences. If the
> rules for the DAG are not followed then we end up with
> potential hard to debug memory corruption, information
> leaks or even elephant big security holes because we allow
> userspace to access freed up memory.
> 
> Since we already took a step back from that by always
> looking at all fences we now go a step further and stop
> dropping the shared fences when a new exclusive one is
> added.
> 
> v2: Drop some now superflous documentation
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 16 +---------------
>  include/linux/dma-buf.h    |  7 -------
>  include/linux/dma-resv.h   | 22 +++++-----------------
>  3 files changed, 6 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 1c9af97fe904..4b12141579e2 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -358,35 +358,21 @@ EXPORT_SYMBOL(dma_resv_replace_fences);
>   * @fence: the exclusive fence to add
>   *
>   * Add a fence to the exclusive slot. @obj must be locked with dma_resv_lock().
> - * Note that this function replaces all fences attached to @obj, see also
> - * &dma_resv.fence_excl for a discussion of the semantics.
> + * See also &dma_resv.fence_excl for a discussion of the semantics.
>   */
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>  {
>  	struct dma_fence *old_fence = dma_resv_excl_fence(obj);
> -	struct dma_resv_list *old;
> -	u32 i = 0;
>  
>  	dma_resv_assert_held(obj);
>  
> -	old = dma_resv_shared_list(obj);
> -	if (old)
> -		i = old->shared_count;
> -
>  	dma_fence_get(fence);
>  
>  	write_seqcount_begin(&obj->seq);
>  	/* write_seqcount_begin provides the necessary memory barrier */
>  	RCU_INIT_POINTER(obj->fence_excl, fence);
> -	if (old)
> -		old->shared_count = 0;
>  	write_seqcount_end(&obj->seq);
>  
> -	/* inplace update, no shared fences */
> -	while (i--)
> -		dma_fence_put(rcu_dereference_protected(old->shared[i],
> -						dma_resv_held(obj)));
> -
>  	dma_fence_put(old_fence);
>  }
>  EXPORT_SYMBOL(dma_resv_add_excl_fence);
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 7ab50076e7a6..74083e62e19d 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -420,13 +420,6 @@ struct dma_buf {
>  	 * - Dynamic importers should set fences for any access that they can't
>  	 *   disable immediately from their &dma_buf_attach_ops.move_notify
>  	 *   callback.
> -	 *
> -	 * IMPORTANT:
> -	 *
> -	 * All drivers must obey the struct dma_resv rules, specifically the
> -	 * rules for updating fences, see &dma_resv.fence_excl and
> -	 * &dma_resv.fence. If these dependency rules are broken access tracking
> -	 * can be lost resulting in use after free issues.

Uh that's a bit much. I do think we should keep this, and update it to
point at whatever new dma_resv fence slot rules you're adding. Maybe just
keep the first part like:

	 * All drivers must obey the struct dma_resv rules, specifically the
	 * rules for updating and obeying fences.

With that

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	 */
>  	struct dma_resv *resv;
>  
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 20e13f36710a..ecb697d4d861 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -93,23 +93,11 @@ struct dma_resv {
>  	 *
>  	 * The exclusive fence, if there is one currently.
>  	 *
> -	 * There are two ways to update this fence:
> -	 *
> -	 * - First by calling dma_resv_add_excl_fence(), which replaces all
> -	 *   fences attached to the reservation object. To guarantee that no
> -	 *   fences are lost, this new fence must signal only after all previous
> -	 *   fences, both shared and exclusive, have signalled. In some cases it
> -	 *   is convenient to achieve that by attaching a struct dma_fence_array
> -	 *   with all the new and old fences.
> -	 *
> -	 * - Alternatively the fence can be set directly, which leaves the
> -	 *   shared fences unchanged. To guarantee that no fences are lost, this
> -	 *   new fence must signal only after the previous exclusive fence has
> -	 *   signalled. Since the shared fences are staying intact, it is not
> -	 *   necessary to maintain any ordering against those. If semantically
> -	 *   only a new access is added without actually treating the previous
> -	 *   one as a dependency the exclusive fences can be strung together
> -	 *   using struct dma_fence_chain.
> +	 * To guarantee that no fences are lost, this new fence must signal
> +	 * only after the previous exclusive fence has signalled. If
> +	 * semantically only a new access is added without actually treating the
> +	 * previous one as a dependency the exclusive fences can be strung
> +	 * together using struct dma_fence_chain.
>  	 *
>  	 * Note that actual semantics of what an exclusive or shared fence mean
>  	 * is defined by the user, for reservation objects shared across drivers
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
