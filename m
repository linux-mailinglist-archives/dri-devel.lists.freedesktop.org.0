Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A39E57C5A4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 10:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C71611ADEE;
	Thu, 21 Jul 2022 08:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4C911A199
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 08:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658390472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U81cy9CSvVVdYWusFPfbgXUwAXqnFtMTt2aTn1ob23Q=;
 b=ZkZUpQwEdJHfboGHpORHgxuTmGma71f1MhMqc9+yy6pf1+sf6k2kFh9iLOFIDb/IsvJ9Mf
 87kKxB8pOyb7+Kzuld93mZKvzRXh2unO/OvGFMWJRxqjK+1/W8lGiBU7EsuIID1etMhAWY
 lk9XwBxOZHBinrcTWCELXpwo5cFhRlI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-2YiTee8TPSSvQHIlvbspTQ-1; Thu, 21 Jul 2022 04:01:11 -0400
X-MC-Unique: 2YiTee8TPSSvQHIlvbspTQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 k26-20020adfb35a000000b0021d6c3b9363so123063wrd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 01:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=U81cy9CSvVVdYWusFPfbgXUwAXqnFtMTt2aTn1ob23Q=;
 b=HHR8Hr4S4BudY05GQBA1kOM7M+YoHi/LEC+ADrdpddDe1Kij6hW98I3SVhtvbouMxl
 Y1Z0tSUaxw5HAREZfDMWpqulXIN970bsGhY9JNtCwMM7LA/rjNhr3sTCNZDd7iZjT+dM
 F5sC6VJB8ZcW00t+JqyKKMjJPiPPp1WB39KELKZnWvokP14dbCutZhL+Z8MbB+8DMU5S
 KF1opIanowRdbjjpeUsvn2xpc9XUWhQkAa26nLtv4cQx6dlt4Q6MfBEHX6QhEJEILzS7
 xqKjQ/LEM3KcBTzqVuH5gZals3TmNOHUb3C7QXFaPBx0HUYjfnh6TDykjKERO0tD/jF6
 UBjQ==
X-Gm-Message-State: AJIora8ts3rVVStmnlZBqgVEUZzS9bB2nMzuefEcy6Dj6vuhy7wN/uEQ
 DMN5kwnhmCBiM5YB1BJeXr4Vf8mdWZ++344Yed5qAnAdOX16CRs6PoXt5+l377RYX9ExFZcIFTU
 fY/C5GvSd5L6JZoFpaNRojZ7vNLLH
X-Received: by 2002:a5d:4301:0:b0:21b:8af6:4a21 with SMTP id
 h1-20020a5d4301000000b0021b8af64a21mr34534634wrq.296.1658390470350; 
 Thu, 21 Jul 2022 01:01:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vsZMcTagC0gCtvDk0TNJLA8Jh/PA0P+4jFZJgnmhKZDdzVU3YPOvehRpLoTuyv/pkgq+5j2Q==
X-Received: by 2002:a5d:4301:0:b0:21b:8af6:4a21 with SMTP id
 h1-20020a5d4301000000b0021b8af64a21mr34534605wrq.296.1658390469900; 
 Thu, 21 Jul 2022 01:01:09 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:e000:25d3:15fa:4c8b:7e8d?
 (p200300cbc707e00025d315fa4c8b7e8d.dip0.t-ipconnect.de.
 [2003:cb:c707:e000:25d3:15fa:4c8b:7e8d])
 by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b003a33227e49bsm678871wms.4.2022.07.21.01.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 01:01:09 -0700 (PDT)
Message-ID: <e730a5bc-a5ba-7ba9-f94e-867e31e46a48@redhat.com>
Date: Thu, 21 Jul 2022 10:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] mm/gup.c: Fix formating in
 check_and_migrate_movable_page()
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
References: <20220721020552.1397598-1-apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220721020552.1397598-1-apopple@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: alex.sierra@amd.com, linux-mm@kvack.org, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21.07.22 04:05, Alistair Popple wrote:
> Commit b05a79d4377f ("mm/gup: migrate device coherent pages when pinning
> instead of failing") added a badly formatted if statement. Fix it.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reported-by: David Hildenbrand <david@redhat.com>
> ---
> 
> Apologies Andrew for missing this. Hopefully this fixes things.
> 
>  mm/gup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 364b274a10c2..c6d060dee9e0 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1980,8 +1980,8 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>  				    folio_nr_pages(folio));
>  	}
>  
> -	if (!list_empty(&movable_page_list) || isolation_error_count
> -		|| coherent_pages)
> +	if (!list_empty(&movable_page_list) || isolation_error_count ||
> +	    coherent_pages)
>  		goto unpin_pages;
>  
>  	/*

Happy to see the series go upstream soon.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

