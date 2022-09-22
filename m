Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A12D5E63FA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 15:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793AD10E367;
	Thu, 22 Sep 2022 13:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7304D10E36A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 13:45:23 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id g2so6187762qkk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 06:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=lTLxj593wgb0rSkyx/kVpkcZN0XitEmW0vMjErWHotA=;
 b=FyJaKv2cOaRg6P7yvu8zs1jVRm/8RMTbc6dfECJ+ZO5o/HmyZWXx30/9G58nVbrc5b
 uilHyUda0dD/kYG1qtguthEwDaL9y8JeP+HPCBHfMWclRlKZoOK/NXZxzGUfoaxervvy
 D0TcePhLr6rEHe3E5Hlf5A5QN/T9th71F+ymU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=lTLxj593wgb0rSkyx/kVpkcZN0XitEmW0vMjErWHotA=;
 b=1QbBbeZ35D3iACKmWB6oF/FoYSHHX3RyhxRTwdWDbaE2rsV8wkIrtbG99rAmkyqhxm
 lwsmwdQDomCq4sCrdce2ijWI0Q63TVl7Do3GKf4+0LdJ8hbJ/SEniMi35spj4UbG9fCh
 FO41kygT8hzjwtxPjYNtqJcNvAWv5O/f3Yc3FrwFnUhFK1cpqlDRlgpa2r2Z8D8l0oa0
 n6I5rfVpwMWJ9yrAycFaY1NpFKXUXIRSuGZN4nPTzeXEMgECh4mbxgNloHyo5z4IS0hb
 xZYao1Gy4VQmCsvT33RQ8MRmiG8RDi5uM68mkxKMQDXqOiWgV2fCRuLLfa82HOHeUF0H
 rQow==
X-Gm-Message-State: ACrzQf3N5AZxLjBa7ydZIskaqHPe80z0HdhTtQIT0ruAYJrBXG5Tah52
 Y5nP/spSxNrnotUmNd3i/5ITzw==
X-Google-Smtp-Source: AMsMyM6DBqbYqDsHBnddfGDZuwycGpoIY7LinhBIG4+l+K0bdEu/uf1UKptO3KnL1trAn9LU6bZY/Q==
X-Received: by 2002:a05:620a:f15:b0:6cf:2130:88e3 with SMTP id
 v21-20020a05620a0f1500b006cf213088e3mr2093263qkl.519.1663854322211; 
 Thu, 22 Sep 2022 06:45:22 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
 by smtp.googlemail.com with ESMTPSA id
 w7-20020ac857c7000000b0035bbb6268e2sm3902332qta.67.2022.09.22.06.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 06:45:21 -0700 (PDT)
Message-ID: <4d75a9fd-1b94-7208-9de8-5a0102223e68@ieee.org>
Date: Thu, 22 Sep 2022 08:45:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/12] net: ipa: Proactively round up to kmalloc bucket
 size
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Vlastimil Babka <vbabka@suse.cz>
References: <20220922031013.2150682-1-keescook@chromium.org>
 <20220922031013.2150682-4-keescook@chromium.org>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20220922031013.2150682-4-keescook@chromium.org>
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
Cc: linux-wireless@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Jakub Kicinski <kuba@kernel.org>,
 David Sterba <dsterba@suse.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jacob Shin <jacob.shin@amd.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/21/22 10:10 PM, Kees Cook wrote:
> Instead of discovering the kmalloc bucket size _after_ allocation, round
> up proactively so the allocation is explicitly made for the full size,
> allowing the compiler to correctly reason about the resulting size of
> the buffer through the existing __alloc_size() hint.
> 
> Cc: Alex Elder <elder@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: netdev@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   drivers/net/ipa/gsi_trans.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ipa/gsi_trans.c b/drivers/net/ipa/gsi_trans.c
> index 18e7e8c405be..cec968854dcf 100644
> --- a/drivers/net/ipa/gsi_trans.c
> +++ b/drivers/net/ipa/gsi_trans.c
> @@ -89,6 +89,7 @@ int gsi_trans_pool_init(struct gsi_trans_pool *pool, size_t size, u32 count,
>   			u32 max_alloc)
>   {
>   	void *virt;
> +	size_t allocate;

I don't care about this but the reverse Christmas tree
convention would put the "allocate" variable definition
above "virt".

Whether you fix that or not, this patch looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

>   	if (!size)
>   		return -EINVAL;
> @@ -104,13 +105,15 @@ int gsi_trans_pool_init(struct gsi_trans_pool *pool, size_t size, u32 count,
>   	 * If there aren't enough entries starting at the free index,
>   	 * we just allocate free entries from the beginning of the pool.
>   	 */
> -	virt = kcalloc(count + max_alloc - 1, size, GFP_KERNEL);
> +	allocate = size_mul(count + max_alloc - 1, size);
> +	allocate = kmalloc_size_roundup(allocate);
> +	virt = kzalloc(allocate, GFP_KERNEL);
>   	if (!virt)
>   		return -ENOMEM;
>   
>   	pool->base = virt;
>   	/* If the allocator gave us any extra memory, use it */
> -	pool->count = ksize(pool->base) / size;
> +	pool->count = allocate / size;
>   	pool->free = 0;
>   	pool->max_alloc = max_alloc;
>   	pool->size = size;

