Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3396ACEB2A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 09:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B3810E8AE;
	Thu,  5 Jun 2025 07:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bAX6IU4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A4310E842
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 07:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749109774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wRyOEDXETxIkKIFfjZs2P8W26KRROUKYMIqAGAlgFBI=;
 b=bAX6IU4rv64l4uK+jdnx4Ks92fDCBrLb/YzqoWHpWwPw+KVAY1BHKmn07oxPW+jVi72V5J
 1SqS/IfCi2UDq3RUcGxB6gYIgKHGf7g+ln7h/r69CIAagGKiIdNq2bw0yPAs5TWl5OFJo8
 I95VgxsHkYUjUTumqmyizP3fAlYQfZ8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-B_FhqE6rOuu6WIQ1OZJGqw-1; Thu, 05 Jun 2025 03:49:31 -0400
X-MC-Unique: B_FhqE6rOuu6WIQ1OZJGqw-1
X-Mimecast-MFC-AGG-ID: B_FhqE6rOuu6WIQ1OZJGqw_1749109770
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4517abcba41so3616705e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 00:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749109770; x=1749714570;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wRyOEDXETxIkKIFfjZs2P8W26KRROUKYMIqAGAlgFBI=;
 b=X2WCE1dJ2E96NXCZMq1jYJvs7NxxvzEIl3EkBH3Xmlq/68lQZhm6qxNg3fYz+X/fGE
 AuQ7BiiHbLvLqNL9fwkwvcp07YxCk7eZee+ZgjXqAG3ZgdulTulZWPXXk4VxdG+xFDNy
 lmdudtd2OTTtXamq07YntURbaSVkD9uuPfuiGFKZ+b+nEruhiEkkykMg2XwC1zWrUHlS
 5eOXrR0JQDTBWKp6nDgkHhKH8opIu27nBZDzSDszplPqDA1p6a8wB0QKRwBcFRSvexLR
 wI/PmzLEmoiQiHotgsLMVgn8huTGhX4f8FZD7X90YOaTHhNgjLRighZl0MuN0M/UZfAg
 SBLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZalyJLn3mLAquUl40A+qRrKjyzqCljniiSZ3y83JlNiptL7KkuHA6s2r9YyFi5F5gbtdz61fwxv8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtLP23hFvZLgpNDGs9R7djyxTUHcLabU48GFqH7znLGRB7z+Q1
 ND81TgJ/9mX0e17+Ml9uQ65vWIvFC0DtMwDH2D3y3UwTXRGXySR2Msjj/79oTQlQAFSvM/r9V96
 h1QZeal9YWFViDrrTNm3YFaGzD2b1TLg8wz65f+zGVEX1orQSEp4XYcxlP/x2P1tKUOLuNw==
X-Gm-Gg: ASbGnct+8KfGuzvYDw4mnRHG0CtkRjcdYowmwUWiav0SJk2j8kj9/zzpEtQr/qMnhy6
 YTaegRQkuSs7YU1KrNWAY3M7YcUZYDVb5kZYq/5g28HT8d4WHzO7nFaMvc8r3D3tmE/u0rJGltp
 CMdjpF1p5oCQWufhWrbHKEcAEkknySkf4O0T9TdZYqg9MJ792iDq/pUr9zrMD6KKH2oeo2q5bgJ
 qgRxC84gfTkjrW+S8R9eB+TWZv1bzBj3GLSsxlxC6xjH3LIhzRRyrwlLCBoCTCi3afIKPzQlfpx
 a9MnQOEereMJwXg5PXjSB8Z96OGHSwg8S5R8QuGEOHTeWhl7erQ2IqDxo5dkaj1lWMgZTmvX0pQ
 PdFSKzx1XmvCaomT5ZMhbgb36WyRaPESaZrKz/uADbAVjp6U=
X-Received: by 2002:a05:600c:3106:b0:441:b3eb:570a with SMTP id
 5b1f17b1804b1-451f0a6a94bmr54009425e9.2.1749109770015; 
 Thu, 05 Jun 2025 00:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZsjcg/PLPpLyQGdb23N26umjiH63blsW4LCsG+AuyVl004iXQAfjzXr57lLLdanZJ4s608g==
X-Received: by 2002:a05:600c:3106:b0:441:b3eb:570a with SMTP id
 5b1f17b1804b1-451f0a6a94bmr54009085e9.2.1749109769586; 
 Thu, 05 Jun 2025 00:49:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2?
 (p200300d82f27ec004f4d0d38ba979aa2.dip0.t-ipconnect.de.
 [2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451fb22a7f2sm9315935e9.37.2025.06.05.00.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 00:49:29 -0700 (PDT)
Message-ID: <b064c820-1735-47db-96e3-6f2b00300c67@redhat.com>
Date: Thu, 5 Jun 2025 09:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] mm/pagewalk: Skip dax pages in pagewalk
To: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 gerald.schaefer@linux.ibm.com, jgg@ziepe.ca, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, zhang.lyra@gmail.com,
 debug@rivosinc.com, bjorn@kernel.org, balbirs@nvidia.com,
 lorenzo.stoakes@oracle.com, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-cxl@vger.kernel.org,
 dri-devel@lists.freedesktop.org, John@groves.net
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
 <6840f9ed3785a_249110084@dwillia2-xfh.jf.intel.com.notmuch>
 <20250605074637.GA7727@lst.de>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250605074637.GA7727@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J8Nt_GAn-P7dPt-n9Anf6BUogdFAoBu1LZRyGiUl5To_1749109770
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05.06.25 09:46, Christoph Hellwig wrote:
> On Wed, Jun 04, 2025 at 06:59:09PM -0700, Dan Williams wrote:
>> +/* return normal pages backed by the page allocator */
>> +static inline struct page *vm_normal_gfp_pmd(struct vm_area_struct *vma,
>> +					     unsigned long addr, pmd_t pmd)
>> +{
>> +	struct page *page = vm_normal_page_pmd(vma, addr, pmd);
>> +
>> +	if (!is_devdax_page(page) && !is_fsdax_page(page))
>> +		return page;
>> +	return NULL;
> 
> If you go for this make it more straight forward by having the
> normal path in the main flow:
> 
> 	if (is_devdax_page(page) || is_fsdax_page(page))
> 		return NULL;
> 	return page;

+1

But I'd defer introducing that for now if avoidable. I find the naming 
rather ... suboptimal :)

-- 
Cheers,

David / dhildenb

