Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4AB47133A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 10:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619E010E6E3;
	Sat, 11 Dec 2021 09:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from manul.sfritsch.de (manul.sfritsch.de
 [IPv6:2a01:4f8:172:195f:112::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C5210E6E3;
 Sat, 11 Dec 2021 09:59:33 +0000 (UTC)
Message-ID: <b6acb31c-ec63-4242-32da-a35e950e5a67@sfritsch.de>
Date: Sat, 11 Dec 2021 10:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/nouveau: wait for the exclusive fence after the
 shared ones v2
Content-Language: de-DE
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dmoulding@me.com, bskeggs@redhat.com
References: <20211209102335.18321-1-christian.koenig@amd.com>
From: Stefan Fritsch <sf@sfritsch.de>
In-Reply-To: <20211209102335.18321-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09.12.21 11:23, Christian König wrote:
> Always waiting for the exclusive fence resulted on some performance
> regressions. So try to wait for the shared fences first, then the
> exclusive fence should always be signaled already.
> 
> v2: fix incorrectly placed "(", add some comment why we do this.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Tested-by: Stefan Fritsch <sf@sfritsch.de>

Please also add a cc for linux-stable, so that this is fixed in 5.15.x

Cheers,
Stefan

> ---
>   drivers/gpu/drm/nouveau/nouveau_fence.c | 28 +++++++++++++------------
>   1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 05d0b3eb3690..0ae416aa76dc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -353,15 +353,22 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
>   
>   		if (ret)
>   			return ret;
> -	}
>   
> -	fobj = dma_resv_shared_list(resv);
> -	fence = dma_resv_excl_fence(resv);
> +		fobj = NULL;
> +	} else {
> +		fobj = dma_resv_shared_list(resv);
> +	}
>   
> -	if (fence) {
> +	/* Waiting for the exclusive fence first causes performance regressions
> +	 * under some circumstances. So manually wait for the shared ones first.
> +	 */
> +	for (i = 0; i < (fobj ? fobj->shared_count : 0) && !ret; ++i) {
>   		struct nouveau_channel *prev = NULL;
>   		bool must_wait = true;
>   
> +		fence = rcu_dereference_protected(fobj->shared[i],
> +						dma_resv_held(resv));
> +
>   		f = nouveau_local_fence(fence, chan->drm);
>   		if (f) {
>   			rcu_read_lock();
> @@ -373,20 +380,13 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
>   
>   		if (must_wait)
>   			ret = dma_fence_wait(fence, intr);
> -
> -		return ret;
>   	}
>   
> -	if (!exclusive || !fobj)
> -		return ret;
> -
> -	for (i = 0; i < fobj->shared_count && !ret; ++i) {
> +	fence = dma_resv_excl_fence(resv);
> +	if (fence) {
>   		struct nouveau_channel *prev = NULL;
>   		bool must_wait = true;
>   
> -		fence = rcu_dereference_protected(fobj->shared[i],
> -						dma_resv_held(resv));
> -
>   		f = nouveau_local_fence(fence, chan->drm);
>   		if (f) {
>   			rcu_read_lock();
> @@ -398,6 +398,8 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
>   
>   		if (must_wait)
>   			ret = dma_fence_wait(fence, intr);
> +
> +		return ret;
>   	}
>   
>   	return ret;
