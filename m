Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF90D08D1F
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 12:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015D010E8A1;
	Fri,  9 Jan 2026 11:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aKOO1ICD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5414210E89F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 11:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767956963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WLh4YdMT4BQhhiGpX2c08r18nWKZ1SS4NAmL7UFi+k=;
 b=aKOO1ICDaLzOW/be1m+BMMUZTPefN/5RZwFT8Z3Rhslz6wNuuZ0TsgxyokgrHGQbdCGOPw
 uZKJBfsnUalWPlwOqQqnR621LD/7M+w368DBtFlh0TiENOpLrgm0Z1LJOJ9zaIKzkbE+85
 PPlYs46Ze8+DG7ZMGs2g59ywtq0I7fo=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-kWwfuIq7MhCNvfAojoY9tw-1; Fri, 09 Jan 2026 06:09:20 -0500
X-MC-Unique: kWwfuIq7MhCNvfAojoY9tw-1
X-Mimecast-MFC-AGG-ID: kWwfuIq7MhCNvfAojoY9tw_1767956959
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-59b3b255ee8so3825976e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 03:09:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767956959; x=1768561759;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+WLh4YdMT4BQhhiGpX2c08r18nWKZ1SS4NAmL7UFi+k=;
 b=L/lSyydD3AEiau64sFoaQG6g5EoCVQSRLJnDS9mccQKW1/sh9YjR4hSd7rCWNZ3EZw
 w0m4r7X7mCUWQnohccB/fPaSnbOc1o+UKCS/WRA9EIfI2FlYWNUF7wB6dijeXadFmr7U
 mVEaxfXa7zGZKuPQOzHLwi8IaYJhim6oreFINDAoRqwkHrGGMGbIDY8RVNz6N586Ivsv
 dA5DjLwVTa6iOhZBAstOV7JDY8erC3ueqCYipp4QIoyu1Yb1IQdTx1T/HBiRQqCbFmhb
 agC0HS1+ye4clo1aXbWyZVoLDG/Bra5xgx0HyDLOA8JyFnb1DIpvCyqUCBvxVe3pZAMY
 OoVg==
X-Gm-Message-State: AOJu0YwqC4+iydqoyYCcnRoXPKCASMQMT9vajcm5wcgMxdvhTPizqjY/
 TakMoCr9J5ZU321yzZWb2MPmzHwWjJd/KxJRV2hD1/oZUjGkMplKNTcHXJYB9/BupHr4AtMAWl6
 dn4xv0HlU0AN0xaTgc8V2mWEPSyo0JisD9Sv2ei2xznaidObe1ABRYQTe8xkGbsD5LpIE
X-Gm-Gg: AY/fxX6/DMGj7lwMrQ0UEn16ZNdsttYyw1q7K0Ls5sCijdIsx8zpZ4XsOKeq8quxXi8
 fptBGZnFgeruMlGOKax3aJ7AlEaPmELM/pNIPHoEydCzWdVlqPzFSwpzhb0p257AfhX3q7SWqcx
 xQ12YN7KI30VlXiyfNDT0vkbna8skwpeu9NNoEFWpr4wbhWGJhIbIff+shLlbfZz4i+dTwz81Ru
 9z7E7PKb75r9bOuH+J4GuU5j3WZ4AWpWa4rqhvaYp5kdBuANKdkDdk3hWJop3sjbtNJTTLaNX0L
 z08IA1ZSNEXv7VGh/mwf89ZDrtU14WueCR6z64Dfc4ccIfi2bRX5dskmIRbPO5hwz9Xk70WAqta
 5mrbK6TBVUYgp2Nf7eLltdP2uUX/lOobmPjI=
X-Received: by 2002:a05:6512:138c:b0:595:840c:cdd0 with SMTP id
 2adb3069b0e04-59b6ef23821mr2942330e87.2.1767956958657; 
 Fri, 09 Jan 2026 03:09:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1Kdn6xqqEz7oS8njPdOYi3SCUUHgKoVYObUp3Vur8XucGkM8H4lTSJgH2gDE+3acZOyL3Ug==
X-Received: by 2002:a05:6512:138c:b0:595:840c:cdd0 with SMTP id
 2adb3069b0e04-59b6ef23821mr2942314e87.2.1767956958199; 
 Fri, 09 Jan 2026 03:09:18 -0800 (PST)
Received: from [192.168.1.86] (85-23-51-1.bb.dnainternet.fi. [85.23.51.1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm2716455e87.42.2026.01.09.03.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 03:09:17 -0800 (PST)
Message-ID: <d1d80b81-678d-4d28-9ac2-95cb74824e73@redhat.com>
Date: Fri, 9 Jan 2026 13:09:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] mm: Split device-private and coherent folios
 before freeing
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Balbir Singh <balbirs@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Andrew Morton
 <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-4-francois.dugast@intel.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20260109085605.443316-4-francois.dugast@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BB-ytjz3szxTRZLHfsrpayu92X663SIPaUlNo7uNxWo_1767956959
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/9/26 10:54, Francois Dugast wrote:

> From: Matthew Brost <matthew.brost@intel.com>
>
> Split device-private and coherent folios into individual pages before
> freeing so that any order folio can be formed upon the next use of the
> pages.
>
> Cc: Balbir Singh <balbirs@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> Cc: linux-cxl@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  mm/memremap.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 63c6ab4fdf08..7289cdd6862f 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -453,6 +453,8 @@ void free_zone_device_folio(struct folio *folio)
>  	case MEMORY_DEVICE_COHERENT:
>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
>  			break;
> +
> +		folio_split_unref(folio);
>  		pgmap->ops->folio_free(folio);
>  		percpu_ref_put_many(&folio->pgmap->ref, nr);
>  		break;

This breaks folio_free implementations like nouveau_dmem_folio_free
which checks the folio order and act upon that.
Maybe add an order parameter to folio_free or let the driver handle the split?

Thanks,
Mika

