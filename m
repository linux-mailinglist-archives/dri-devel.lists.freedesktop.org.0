Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84488AC2558
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 16:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B784E10E80D;
	Fri, 23 May 2025 14:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ih242rmi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE8110E80B;
 Fri, 23 May 2025 14:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9zrV7433NHFYKHB0uHhJrmu7dOYAkEyNGtUe1qTfMxY=; b=ih242rmiGTg7PIJBXm/mbCuRbd
 9HqXObANz4FIiecYRyNtFnWmzUTa4LI+LyRFX/qZoUH6HjlSA2+XShtnDMk5kiUpA8F9b9g+UmlvH
 VO9eWwxM+1xjqOkjPYQTz5UUrf1Pdqy+OGko1g+2jKGjnOmF1NZcWqnTHvDpAX3bRL3YTOizs3xvH
 VB/0yFhASnY+ANiv4EkJJ4eubbb+jkp4KkkuibNjyiL1tKzW+Vm2qrA9tJyM2TB3jB9vsXRde4yKu
 3b8MDNnQ1V71mvTymGIw0P9Pc7kKKq1CANuci5a/Trzq0b7nEKZCrPigj6kgpHaRZNRUL9DcfPpbe
 ZStse38Q==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uITfv-00CDpK-BA; Fri, 23 May 2025 16:47:07 +0200
Message-ID: <4255f9a9-be17-4a9a-b7cf-8e3d4f93b38b@igalia.com>
Date: Fri, 23 May 2025 15:47:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: Add __dma_fence_is_signaled()
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250522112540.161411-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250522112540.161411-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 22/05/2025 12:25, Philipp Stanner wrote:
> Some parties want to check whether a function is already signaled
> without actually signaling the fence, which is what
> dma_fence_is_signaled() might due if the fence ops 'signaled' callback

s/due/do/

> is implemented.
> 
> Add __dma_fence_is_signaled(), which _only_ checks whether a fence is
> signaled. Use it internally.
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   include/linux/dma-fence.h | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 48b5202c531d..ac951a54a007 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -381,6 +381,26 @@ bool dma_fence_remove_callback(struct dma_fence *fence,
>   			       struct dma_fence_cb *cb);
>   void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>   
> +/**
> + * __dma_fence_is_signaled - Only check whether a fence is signaled yet.
> + * @fence: the fence to check
> + *
> + * This function just checks whether @fence is signaled, without interacting
> + * with the fence in any way. The user must, therefore, ensure through other

s/user/caller/ ?

Otherwise looks good to me. For if/when Christian approves you can add my:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> + * means that fences get signaled eventually.
> + *
> + * This function does not require locking.
> + *
> + * See also dma_fence_is_signaled().
> + *
> + * Return: true if signaled, false otherwise.
> + */
> +static inline bool
> +__dma_fence_is_signaled(struct dma_fence *fence)
> +{
> +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> +}
> +
>   /**
>    * dma_fence_is_signaled_locked - Return an indication if the fence
>    *                                is signaled yet.
> @@ -398,7 +418,7 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>   static inline bool
>   dma_fence_is_signaled_locked(struct dma_fence *fence)
>   {
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (__dma_fence_is_signaled(fence))
>   		return true;
>   
>   	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> @@ -428,7 +448,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>   static inline bool
>   dma_fence_is_signaled(struct dma_fence *fence)
>   {
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (__dma_fence_is_signaled(fence))
>   		return true;
>   
>   	if (fence->ops->signaled && fence->ops->signaled(fence)) {

