Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF907877D5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 20:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261CF10E5AC;
	Thu, 24 Aug 2023 18:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231A710E155
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 18:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692901824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1DaVCUYtUUYNIU8IoTdr4/o0Q5aZzEujz7FLGwlWzrM=;
 b=J5o2yJuz5qjyqOA5LypjsSFkR3EVYw19wOd0KEjH+KHkL2aM2q9Naj4WPaTwsd6N4iXcNx
 Wxj5G58ydnL+RncVLSW77aiyfV0hAbnhLbN8idALPzPzAcMYOuc1Xl1+SB4sriQdcz1tSo
 eau58McntJ5zgkrly5cxksLY6jgf5Vs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-ik3litO4PJSx199BejLYYQ-1; Thu, 24 Aug 2023 14:30:20 -0400
X-MC-Unique: ik3litO4PJSx199BejLYYQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4011f56165eso6327165e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 11:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692901819; x=1693506619;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1DaVCUYtUUYNIU8IoTdr4/o0Q5aZzEujz7FLGwlWzrM=;
 b=XSH6PM+Qu8YegRrhblvFNoZLtcI6ADHnUq8VfBe/ot7F/bvRSI6jNrp4F3q5e0UAHI
 grSr4PYMS/AXazh/SJuB8G7ugqwuJcyeqRZmoNS7K+6LcJqrFla3TCMa81ElyULbdvll
 9Tm7hUpRUpqurNjXOZQHoKAPONYKUeq1tkpoC4lPS3fcBEpBMEB2KWJ/APtCXr1oDNnm
 xwzU8Tqzuk3LO4d1fbq2bV/XLOHkWTtJdJ4dSEsW9fIZ86qGDdO/KymD4stlytyQdAVJ
 hc7dzSYYMLYI7rkLBCBv6fDXS19T/eI2HEzPac7nVL8mn3kFkW4z+H7u9z/wBQs7kHAY
 tlag==
X-Gm-Message-State: AOJu0Yw5bogTcwtNJktslIfINR3OeKab79za525aitLGNDDYHZb1/ae1
 g5gsJKYH4u9srstGvOgfc98YMbcjpzCXin9d5WQHdK9gxh8C4uanBtFwDTyAUc/ZWNTFif0ZNRN
 aPQ5lOquBhCIxB5bhB3vrZWCTZJAP
X-Received: by 2002:a7b:cd94:0:b0:401:b3a5:ec04 with SMTP id
 y20-20020a7bcd94000000b00401b3a5ec04mr585618wmj.16.1692901819051; 
 Thu, 24 Aug 2023 11:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN04IIxMsQ/oKjnheZdkOIfcTD73tF4gyi9QjRzFBXkXJ9aEOscxTYQ2RdrpRS72cpDPmMlw==
X-Received: by 2002:a7b:cd94:0:b0:401:b3a5:ec04 with SMTP id
 y20-20020a7bcd94000000b00401b3a5ec04mr585603wmj.16.1692901818664; 
 Thu, 24 Aug 2023 11:30:18 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:6200:16ba:af70:999d:6a1a?
 (p200300cbc709620016baaf70999d6a1a.dip0.t-ipconnect.de.
 [2003:cb:c709:6200:16ba:af70:999d:6a1a])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a7bcc8d000000b003fe1cac37d8sm3325190wma.11.2023.08.24.11.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 11:30:18 -0700 (PDT)
Message-ID: <b35cd8f7-e7dd-e47b-112c-62ee84c92768@redhat.com>
Date: Thu, 24 Aug 2023 20:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
References: <20230817064934.3424431-1-vivek.kasireddy@intel.com>
 <ZN42XjuXUyma5uE+@nvidia.com>
 <IA0PR11MB7185ABFBB06771B7646F8F50F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZOSo2cuw1ashK3+Z@nvidia.com>
 <8afa35bb-c3ed-c939-46a4-a9a277b6d4e2@redhat.com>
 <IA0PR11MB7185B7B437E98F7F594D3E0EF81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <IA0PR11MB7185B7B437E98F7F594D3E0EF81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, "Chang, Junxiao" <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24.08.23 08:31, Kasireddy, Vivek wrote:
> Hi David,
> 
>>
>>>> - Add a new API to the backing store/allocator to longterm-pin the page.
>>>>     For example, something along the lines of
>> shmem_pin_mapping_page_longterm()
>>>>     for shmem as suggested by Daniel. A similar one needs to be added for
>>>>     hugetlbfs as well.
>>>
>>> This may also be reasonable.
>>
>> Sounds reasonable to keep the old API (that we unfortunately have) working.
> I agree; I'd like to avoid adding new APIs unless absolutely necessary. Given this,
> and considering the options I have mentioned earlier, what would be your
> recommendation for how page migration needs to be done in udmabuf driver?

I guess using proper APIs for shmem and hugetlb. So, turning roughly 
what you have in patch#1 for now into common code, and only calling into 
that from udmabug.

-- 
Cheers,

David / dhildenb

