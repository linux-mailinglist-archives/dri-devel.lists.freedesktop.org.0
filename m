Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3773475901E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 10:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB0E10E41C;
	Wed, 19 Jul 2023 08:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17B110E41C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689754875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lHNdzhJYXIyEvVVXeSxx/4ftxohEVfyVH2IVByUb0ic=;
 b=H+85tU3l/XL2ySiw1RieVnRnd6OaOXcXMdxqg8OZbdp7J3klrQm/jrs9qEseqh4gA5bo04
 sIapRpQfiAJMLpDN63kSjdesp2Yq5gp+i5V8RVQd7I6RlHmIqjuEyYLzFcNKps/wIZvV+f
 BX1dVl8n3OyO6l0yLwelTperNImAVrQ=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-73fDwDvYPeeFMQlNeyWqyg-1; Wed, 19 Jul 2023 04:21:14 -0400
X-MC-Unique: 73fDwDvYPeeFMQlNeyWqyg-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4fbcdca8fb6so5673519e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 01:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689754873; x=1692346873;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lHNdzhJYXIyEvVVXeSxx/4ftxohEVfyVH2IVByUb0ic=;
 b=HoSxWVgCf5a39RyxOL7VBrzp00/OCaVMu7rZ8IiXW5Jmibfd7ew/wprh+/8xG3ktmR
 0U2HX+rWN7bUzR32G49pCm/CAf5JDO+MClKxef2K2gO6yRN8wMQvi6/pM8avbHEzgme4
 PNb4ZWtNc5xVB+YNR+pzkM2o9EES82lnkXkiKAIe4/46Lf8vQ8NRRdYeOm585aiWkVRh
 D+ftGWaPJUCiecjTQH44IX+7Ln8LFQfTnoEDxwGE946QmnvVrV52X41FNKDp7dNQHr7q
 dMC8JDtEtre+Q7TC4Lxw/FQXlyEngzHEIGX/gDZHLsSDmda8azpEPFlyOD+4Xdut2e7B
 8pVA==
X-Gm-Message-State: ABy/qLbZ1i/JzX9GH69hOtHjt4/KaKWbR5DNq77nFZm1aga8NdVASiLU
 DpJnzYE3BQuAoGs2ZxIWrN4DDYtBoBWfys6nZOQW7qQm1jf+qqq4KID+hB+6GkmZc+0mjj2Hu0a
 P/imALC/2UYI391dnm6cUzTgFGFxD
X-Received: by 2002:a05:6512:750:b0:4fb:8cc0:57e3 with SMTP id
 c16-20020a056512075000b004fb8cc057e3mr1188130lfs.62.1689754872991; 
 Wed, 19 Jul 2023 01:21:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFai0n0RcKXdiYpXZ+aojTS7Ksd/OHMwbJ10bIJdz+36AnhayvLRUmFZjEcfE4R/uLtmx1AWQ==
X-Received: by 2002:a05:6512:750:b0:4fb:8cc0:57e3 with SMTP id
 c16-20020a056512075000b004fb8cc057e3mr1188110lfs.62.1689754872632; 
 Wed, 19 Jul 2023 01:21:12 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74b:4f00:b030:1632:49f2:63?
 (p200300cbc74b4f00b030163249f20063.dip0.t-ipconnect.de.
 [2003:cb:c74b:4f00:b030:1632:49f2:63])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c230700b003fba6709c68sm1048356wmo.47.2023.07.19.01.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jul 2023 01:21:12 -0700 (PDT)
Message-ID: <0dc0e6b5-4c07-2ae3-80d3-99a5386c8f7d@redhat.com>
Date: Wed, 19 Jul 2023 10:21:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 4/4] perf/core: use vma_is_initial_stack() and
 vma_is_initial_heap()
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20230719075127.47736-1-wangkefeng.wang@huawei.com>
 <20230719075127.47736-5-wangkefeng.wang@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230719075127.47736-5-wangkefeng.wang@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-perf-users@vger.kernel.org,
 linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 amd-gfx@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19.07.23 09:51, Kefeng Wang wrote:
> Use the helpers to simplify code, also kill unneeded goto cpy_name.
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   kernel/events/core.c | 22 +++++++---------------
>   1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 78ae7b6f90fd..d59f6327472f 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -8685,22 +8685,14 @@ static void perf_event_mmap_event(struct perf_mmap_event *mmap_event)
>   		}
>   
>   		name = (char *)arch_vma_name(vma);
> -		if (name)
> -			goto cpy_name;
> -
> -		if (vma->vm_start <= vma->vm_mm->start_brk &&
> -				vma->vm_end >= vma->vm_mm->brk) {
> -			name = "[heap]";
> -			goto cpy_name;
> +		if (!name) {
> +			if (vma_is_initial_heap(vma))
> +				name = "[heap]";
> +			else if (vma_is_initial_stack(vma))
> +				name = "[stack]";
> +			else
> +				name = "//anon";
>   		}
> -		if (vma->vm_start <= vma->vm_mm->start_stack &&
> -				vma->vm_end >= vma->vm_mm->start_stack) {
> -			name = "[stack]";
> -			goto cpy_name;
> -		}
> -
> -		name = "//anon";
> -		goto cpy_name;

If you're removing that goto, maybe also worth removing the goto at the 
end of the previous if branch.

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Cheers,

David / dhildenb

