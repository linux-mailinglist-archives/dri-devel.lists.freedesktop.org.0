Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469159BAE96
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 09:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECE110E395;
	Mon,  4 Nov 2024 08:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="YykEijnL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Mon, 04 Nov 2024 02:30:39 UTC
Received: from out30-99.freemail.mail.aliyun.com
 (out30-99.freemail.mail.aliyun.com [115.124.30.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7731F10E11D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 02:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1730687437; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=/9cmlej8OATRi4lM94Y98/vOaVDU8BB5/PiYbgOOWY8=;
 b=YykEijnLcaKlDyHqumZEtMsd5YCqKH52okAUZJNvPuXdvwW0blCGFAdS+kJv4xROr7WaVFcCkXRm5fWor5JPU/+ytHAp0B4P55CZAd831RC0OKsPQgLJSSIEYT5Ll0lslm8agjrw4mdoOxDlw3K/KN63aXkwj6fIu5fL9Hxxmak=
Received: from 30.74.144.113(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0WIZl5VU_1730687132 cluster:ay36) by smtp.aliyun-inc.com;
 Mon, 04 Nov 2024 10:25:32 +0800
Message-ID: <9d5ce0af-6fca-422f-b1f8-650879f8ff5a@linux.alibaba.com>
Date: Mon, 4 Nov 2024 10:25:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] mm: move ``get_order_from_str()`` to internal.h
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>, Barry Song <baohua@kernel.org>,
 David Hildenbrand <david@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Lance Yang <ioworker0@gmail.com>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20241101165719.1074234-2-mcanal@igalia.com>
 <20241101165719.1074234-5-mcanal@igalia.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20241101165719.1074234-5-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 04 Nov 2024 08:51:53 +0000
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



On 2024/11/2 00:54, Maíra Canal wrote:
> In order to implement a kernel parameter similar to ``thp_anon=`` for
> shmem, we'll need the function ``get_order_from_str()``.
> 
> Instead of duplicating the function, move the function to a shared
> header, in which both mm/shmem.c and mm/huge_memory.c will be able to
> use it.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   mm/huge_memory.c | 38 +++++++++++++++-----------------------
>   mm/internal.h    | 22 ++++++++++++++++++++++
>   2 files changed, 37 insertions(+), 23 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index f92068864469..a6edbd8c4f49 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -958,26 +958,6 @@ static int __init setup_transparent_hugepage(char *str)
>   }
>   __setup("transparent_hugepage=", setup_transparent_hugepage);
>   
> -static inline int get_order_from_str(const char *size_str)
> -{
> -	unsigned long size;
> -	char *endptr;
> -	int order;
> -
> -	size = memparse(size_str, &endptr);
> -
> -	if (!is_power_of_2(size))
> -		goto err;
> -	order = get_order(size);
> -	if (BIT(order) & ~THP_ORDERS_ALL_ANON)
> -		goto err;
> -
> -	return order;
> -err:
> -	pr_err("invalid size %s in thp_anon boot parameter\n", size_str);
> -	return -EINVAL;
> -}
> -
>   static char str_dup[PAGE_SIZE] __initdata;
>   static int __init setup_thp_anon(char *str)
>   {
> @@ -1007,10 +987,22 @@ static int __init setup_thp_anon(char *str)
>   				start_size = strsep(&subtoken, "-");
>   				end_size = subtoken;
>   
> -				start = get_order_from_str(start_size);
> -				end = get_order_from_str(end_size);
> +				start = get_order_from_str(start_size, THP_ORDERS_ALL_ANON);
> +				end = get_order_from_str(end_size, THP_ORDERS_ALL_ANON);
>   			} else {
> -				start = end = get_order_from_str(subtoken);
> +				start_size = end_size = subtoken;
> +				start = end = get_order_from_str(subtoken,
> +								 THP_ORDERS_ALL_ANON);
> +			}
> +
> +			if (start == -EINVAL) {
> +				pr_err("invalid size %s in thp_anon boot parameter\n", start_size);
> +				goto err;
> +			}
> +
> +			if (end == -EINVAL) {
> +				pr_err("invalid size %s in thp_anon boot parameter\n", end_size);
> +				goto err;
>   			}

There are already checks for ‘start’ and ‘end’ below, and will print 
error messages if error occurs. So I suspect whether these repeated 
checks and error infor are helpful.

Anyway, I don't have a strong preference.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
