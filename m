Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091F09D133B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 15:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD6710E4E7;
	Mon, 18 Nov 2024 14:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XYHSlXQS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D930A10E4E7;
 Mon, 18 Nov 2024 14:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aRPJo6oa1QTCNsRN2c0ERmDqm5TWPP/WO86iMSK2Gps=; b=XYHSlXQS8z8Xt+Yfi0KIgAJYYC
 c4Mfp2wdoHF+HwTLPMClmTHkRZ25MDRBRGshIU5zrKevJSQ432eDD+lVBNhlCe/BB8ZkWmO2+3C2E
 wR0gvSivhB7/nWX4Oq4iQOyCSgdphtx9VkpLgLc6x9W4coVrrtuR070JMai0m+0cUUUihwfiB5wSF
 7XGlM7yPM7C5g861udkFlPWviRJxFebKYj676bj6Pp2Fv2DQyb1xU/MRU0H61KCDa4cyvOdKA8sLK
 JR8ISGoOepeFa1SV677X4f6oEYE8YJ7CFXeX/L6lxCTLsNa3GImzEpR7yZ+YTyqv3TCQyRI8SZT0n
 HxYICCSQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tD2tQ-008Y7T-Uh; Mon, 18 Nov 2024 15:38:20 +0100
Message-ID: <57e02488-1e6b-4e61-a082-4c54be07e071@igalia.com>
Date: Mon, 18 Nov 2024 14:38:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] Documentation/gpu: Clarify drm memory stats
 definition
To: Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, dri-devel@lists.freedesktop.org
References: <20241116044452.5925-1-Yunxiang.Li@amd.com>
 <20241116044452.5925-4-Yunxiang.Li@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20241116044452.5925-4-Yunxiang.Li@amd.com>
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


On 16/11/2024 04:44, Yunxiang Li wrote:
> Define how to handle buffers with multiple possible placement so we
> don't get incompatible implementations. Callout the resident requirement
> for drm-purgeable- explicitly. Remove the requirement for there to be
> only drm-memory- or only drm-resident-, it's not what's implemented and
> having both is better for back-compat. Also re-order the paragraphs to
> flow better.
> 
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
> CC: dri-devel@lists.freedesktop.org
> ---
>   Documentation/gpu/drm-usage-stats.rst | 36 ++++++++++++---------------
>   1 file changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index ff964c707754a..973663f91a292 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -140,13 +140,9 @@ both.
>   Memory
>   ^^^^^^
>   
> -- drm-memory-<region>: <uint> [KiB|MiB]
> -
> -Each possible memory type which can be used to store buffer objects by the
> -GPU in question shall be given a stable and unique name to be returned as the
> -string here.
> -
> -The region name "memory" is reserved to refer to normal system memory.
> +Each possible memory type which can be used to store buffer objects by the GPU
> +in question shall be given a stable and unique name to be used as the "<region>"
> +string. The region name "memory" is reserved to refer to normal system memory.
>   
>   Value shall reflect the amount of storage currently consumed by the buffer
>   objects belong to this client, in the respective memory region.
> @@ -154,31 +150,27 @@ objects belong to this client, in the respective memory region.
>   Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>   indicating kibi- or mebi-bytes.
>   
> -This key is deprecated and is an alias for drm-resident-<region>. Only one of
> -the two should be present in the output.

IMO the second sentence should stay in principle (I mean at the new 
location, where you moved it). Intent is to avoid new implementations 
adding both keys. The fact amdgpu has both is not relevant for that 
purpose. We don't want someone just reading it is an alias and having to 
have any doubt whether they need to output both or not.

> +- drm-total-<region>: <uint> [KiB|MiB]
> +
> +The total size of all created buffers including shared and private memory. The
> +backing store for the buffers does not have to be currently instantiated to
> +count under this category. To avoid double counting, if a buffer falls under
> +multiple regions, the implementation should pick only one of the regions, and do
> +so in a consistent manner.

Addition feels fine to me in principle. I would only suggest rewording 
it a bit to avoid ambiguity about what it means to "fall under". Perhaps 
like this:

To avoid double counting when buffers can be instantiated in one of the 
multiple allowed memory regions, the implementation should account the 
total against only one of the regions, and should pick this region in a 
consistent manner.

>   
>   - drm-shared-<region>: <uint> [KiB|MiB]
>   
>   The total size of buffers that are shared with another file (e.g., have more
> -than a single handle).
> -
> -- drm-total-<region>: <uint> [KiB|MiB]
> -
> -The total size of all created buffers including shared and private memory. The
> -backing store for the buffers does not have to be currently instantiated to be
> -counted under this category.
> +than a single handle). Same caveat as drm-total- applies.

I suggest to explicitly point out the caveat is the multiple region one.

>   
>   - drm-resident-<region>: <uint> [KiB|MiB]
>   
>   The total size of buffers that are resident (have their backing store present or
>   instantiated) in the specified region.
>   
> -This is an alias for drm-memory-<region> and only one of the two should be
> -present in the output.

I think it does not harm to keep this note at both keys. Or at least 
make one reference the other for this point specifically.

> -
>   - drm-purgeable-<region>: <uint> [KiB|MiB]
>   
> -The total size of buffers that are purgeable.
> +The total size of buffers that are resident and purgeable.

Is it not redundant? How could something not resident be purgeable in 
the first place?
>   For example drivers which implement a form of 'madvise' like functionality can
>   here count buffers which have instantiated backing store, but have been marked
> @@ -192,6 +184,10 @@ One practical example of this can be presence of unsignaled fences in an GEM
>   buffer reservation object. Therefore the active category is a subset of
>   resident.
>   
> +- drm-memory-<region>: <uint> [KiB|MiB]
> +
> +This key is deprecated and is an alias for drm-resident-<region> if present.
> +
>   Implementation Details
>   ======================
>   

Regards,

Tvrtko
