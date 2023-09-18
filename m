Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D157A52B8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 21:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D0F10E092;
	Mon, 18 Sep 2023 19:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta40.uswest2.a.cloudfilter.net
 (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AFD10E092
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 19:09:04 +0000 (UTC)
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
 by cmsmtp with ESMTP
 id iE4vqtoFubK1ViJcFq2yRt; Mon, 18 Sep 2023 19:09:03 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id iJcEquayovjFWiJcEqGcxa; Mon, 18 Sep 2023 19:09:02 +0000
X-Authority-Analysis: v=2.4 cv=eZMuwpIH c=1 sm=1 tr=0 ts=6508a04f
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=VSjF23E3Ok2ZiNtq:21 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10
 a=Z0r0GRSmFf-DnjB3DMoA:9 a=QEXdDO2ut3YA:10 a=m8lDLIEVUrKgScV2SIex:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B5tMPsVfntUMhpYWlnMiaWsyGXw6mb8koJoFx0gfO7o=; b=R5stTqN9xsgrwySPbtSX0O9i5C
 QSXuTu1SYXfR2ATKJiqLloT737kEr+VHOUSROOe+SqonHTpduxrILJFZITReMz0V7AJKC8gPXobXh
 0Lm80V938IYFqLDoH4OOx5utnFMKK3wtZ2QU5N/V7kb8wk2MDkp8nAhBQ2y7yagexWD3d489w8jbh
 sukPkV8YB4hICJgIAdIy4h2WMrWtFa+DoKNeXa8xr2rszFNbYMUehImHzgvi3otIFdDlGM3mApiTW
 cC28tfr7BXK/TgMPFka4DdmtMKSQrBVlO03OWWt495psWkdTXQV39LiONiRc30iYzRJauvyYrQoAb
 93C5X22A==;
Received: from [94.239.20.48] (port=51062 helo=[192.168.1.98])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gustavo@embeddedor.com>) id 1qiJcD-003BP8-0d;
 Mon, 18 Sep 2023 14:09:01 -0500
Message-ID: <7043f179-b670-db3c-3ab0-a1f3e991add9@embeddedor.com>
Date: Sun, 17 Sep 2023 21:10:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] udmabuf: Fix a potential (and unlikely) access to
 unallocated memory
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <3e37f05c7593f1016f0a46de188b3357cbbd0c0b.1695060389.git.christophe.jaillet@wanadoo.fr>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <3e37f05c7593f1016f0a46de188b3357cbbd0c0b.1695060389.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.239.20.48
X-Source-L: No
X-Exim-ID: 1qiJcD-003BP8-0d
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:51062
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJQ1963+KbdsLLiFL05zgTN5hkaOqFRS1LUmyPUKP+E8KibJYhykCBSaRWUznjV8zJaXL2U4+nC/bOY+HlP/h66/ELbUPAmDJPRnqDdFTDxKTIUIOBTh
 8lP3XWR0nrtemKbOVFsNoV1h4Jjr7gh+xVuCrRKmPlJSsjYiGZHj1xxQRu64QUA8xEDV6wi1WMA+IgwBsak5yUzfCQJyXstrTiXtDZXZmx83nOmvPfTkyiAr
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-hardening@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/18/23 12:46, Christophe JAILLET wrote:
> If 'list_limit' is set to a very high value, 'lsize' computation could
> overflow if 'head.count' is big enough.
> 
> In such a case, udmabuf_create() will access to memory beyond 'list'.
> 
> Use size_mul() to saturate the value, and have memdup_user() fail.
> 
> Fixes: fbb0de795078 ("Add udmabuf misc device")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/dma-buf/udmabuf.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index c40645999648..fb4c4b5b3332 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -314,13 +314,13 @@ static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg)
>   	struct udmabuf_create_list head;
>   	struct udmabuf_create_item *list;
>   	int ret = -EINVAL;
> -	u32 lsize;
> +	size_t lsize;
>   
>   	if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
>   		return -EFAULT;
>   	if (head.count > list_limit)
>   		return -EINVAL;
> -	lsize = sizeof(struct udmabuf_create_item) * head.count;
> +	lsize = size_mul(sizeof(struct udmabuf_create_item), head.count);
>   	list = memdup_user((void __user *)(arg + sizeof(head)), lsize);
>   	if (IS_ERR(list))
>   		return PTR_ERR(list);

How about this, and we get rid of `lsize`:

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index c40645999648..5cf9d849aaa8 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -314,14 +314,13 @@ static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg)
         struct udmabuf_create_list head;
         struct udmabuf_create_item *list;
         int ret = -EINVAL;
-       u32 lsize;

         if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
                 return -EFAULT;
         if (head.count > list_limit)
                 return -EINVAL;
-       lsize = sizeof(struct udmabuf_create_item) * head.count;
-       list = memdup_user((void __user *)(arg + sizeof(head)), lsize);
+       list = memdup_user((void __user *)(arg + sizeof(head)),
+                          size_mul(sizeof(*list), head.count));
         if (IS_ERR(list))
                 return PTR_ERR(list);


--
Gustavo
