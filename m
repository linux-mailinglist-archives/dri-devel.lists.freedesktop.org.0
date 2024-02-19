Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C51C85AB5F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 19:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5804710E450;
	Mon, 19 Feb 2024 18:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="UuCzQEkK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta040.useast.a.cloudfilter.net
 (omta040.useast.a.cloudfilter.net [44.202.169.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D8610E41D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 18:47:48 +0000 (UTC)
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
 by cmsmtp with ESMTPS
 id c5exrEYObTHHuc8g7rt1uD; Mon, 19 Feb 2024 18:47:47 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id c8g6rZx23uTgrc8g6rYGii; Mon, 19 Feb 2024 18:47:46 +0000
X-Authority-Analysis: v=2.4 cv=Vo6AAP2n c=1 sm=1 tr=0 ts=65d3a252
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=VhncohosazJxI00KdYJ/5A==:17
 a=VSjF23E3Ok2ZiNtq:21 a=IkcTkHD0fZMA:10 a=k7vzHIieQBIA:10 a=wYkD_t78qR0A:10
 a=VwQbUJbxAAAA:8 a=hpmp6n0Fncvi9LRvqokA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PsUWlBLUfZeSjk+Yv21JCfUUB/vLVf1BaKRuAmYHUeo=; b=UuCzQEkK7vHOFykbSc9v990Ogl
 NAB8YOvszb6OOJidZ4Yp43lBZgqAoSUSYiLUnc5d3IMdxbWsGrR+bL4gmPSQ+dVgJyh8wD43KouWm
 TpFRBhC7CmnaaW3u7rGihpPgM+gIxbJG60M21G81RHJqA8zb3Azvp9GmNgpYSkX+X9Ymz5eM0Eo7I
 vCInVKdGqPPKyOKoL88Xm1F6w+ROJPDY6wq0nhNePvWxBthCnzSsQgH2184A6PsGwM0cJixX9y75N
 ZWOTW1gUtkMr+uJvIdd3rQtxiY/iKnI67TDWBJAqtfC9POiBgzWT5+e98bmPcVhTQeQCtgwGgTcti
 cHw5qIYQ==;
Received: from [201.172.172.225] (port=57308 helo=[192.168.15.10])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <gustavo@embeddedor.com>) id 1rc8g5-002Aa2-1q;
 Mon, 19 Feb 2024 12:47:45 -0600
Message-ID: <292b9fb0-5661-488b-a52a-d5e7dbb3dc45@embeddedor.com>
Date: Mon, 19 Feb 2024 12:47:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] udmabuf: Fix a potential (and unlikely) access to
 unallocated memory
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 keescook@chromium.org, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <f75d0426a17b57dbddacd7da345c1c62a3dbb7ce.1708278363.git.christophe.jaillet@wanadoo.fr>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <f75d0426a17b57dbddacd7da345c1c62a3dbb7ce.1708278363.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.172.225
X-Source-L: No
X-Exim-ID: 1rc8g5-002Aa2-1q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.10]) [201.172.172.225]:57308
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOrQ1WGzHn5oWWsNln9Sg11gMF5ED0Cgns+teNXq287lxFL6X1fa4S0HJgnPQfKrflTqliGEFyHs5rDV96SBxm4kiibIl2el975fzjNOqCVauOkNDhDz
 TCit+H2cRj+77DV/W0qOKQOsKbw84jXN/CFeAL92OU1IIbH3TP8uqRdPaTxuY1hKUOxb5pHSswTDAZr8D9jEHUrH+GbGSNq0O4mKsRj+tFfecE67kZEFeiRp
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



On 2/18/24 11:46, Christophe JAILLET wrote:
> If 'list_limit' is set to a very high value, 'lsize' computation could
> overflow if 'head.count' is big enough.
> 
> In such a case, udmabuf_create() would access to memory beyond 'list'.
> 
> Use memdup_array_user() which checks for overflow.
> 
> While at it, include <linux/string.h>.
> 
> Fixes: fbb0de795078 ("Add udmabuf misc device")'

I don't think this tag is needed in this case.

Also, please, CC linux-hardening next time.

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In any case, LGTM:

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
> v2: - Use memdup_array_user()   [Kees Cook]
>      - Use sizeof(*list)   [Gustavo A. R. Silva]
>      - Add include <linux/string.h>
> 
> v1: https://lore.kernel.org/all/3e37f05c7593f1016f0a46de188b3357cbbd0c0b.1695060389.git.christophe.jaillet@wanadoo.fr/
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/dma-buf/udmabuf.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index c40645999648..5728948ea6f2 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -11,6 +11,7 @@
>   #include <linux/module.h>
>   #include <linux/shmem_fs.h>
>   #include <linux/slab.h>
> +#include <linux/string.h>
>   #include <linux/udmabuf.h>
>   #include <linux/vmalloc.h>
>   #include <linux/iosys-map.h>
> @@ -314,14 +315,13 @@ static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg)
>   	struct udmabuf_create_list head;
>   	struct udmabuf_create_item *list;
>   	int ret = -EINVAL;
> -	u32 lsize;
>   
>   	if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
>   		return -EFAULT;
>   	if (head.count > list_limit)
>   		return -EINVAL;
> -	lsize = sizeof(struct udmabuf_create_item) * head.count;
> -	list = memdup_user((void __user *)(arg + sizeof(head)), lsize);
> +	list = memdup_array_user((void __user *)(arg + sizeof(head)),
> +				 sizeof(*list), head.count);
>   	if (IS_ERR(list))
>   		return PTR_ERR(list);
>   
