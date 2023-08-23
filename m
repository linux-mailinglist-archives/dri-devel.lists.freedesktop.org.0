Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F73178544C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 11:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0637910E403;
	Wed, 23 Aug 2023 09:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C5010E403
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692783277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YYx05oPPdNvRjCRq1VumETYbjmZRLlpNaD9WnSUc+2Q=;
 b=CX0I0zxLjPpEyiYZekP91KiOjQnaBSq4JlX5M+9hTGN5jWwM6MwB14v9mcDiMt8CLX60fH
 M6yWmM4cJU1M/9cron/4XLYhC+fH0oRTV/N/KJFhKzwxLoCvDrtqKh6w7Hm1CvcQfjOy8Y
 X3908U+gxKMaYT9AG/jLHyuZcz6mFIg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-yJw47YrRNAC21jy9kQQ73A-1; Wed, 23 Aug 2023 05:34:36 -0400
X-MC-Unique: yJw47YrRNAC21jy9kQQ73A-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3feff2359d9so5220875e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 02:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692783275; x=1693388075;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YYx05oPPdNvRjCRq1VumETYbjmZRLlpNaD9WnSUc+2Q=;
 b=Y4Ej7h0jyJzEKltslKmLvida6NldDxBOY749H52y+Rnkgot5biPcYajfF/+eiU+5SY
 AcJyIekiVKxnR7VrO7oVIU/3ijQRQFVqkTPgIgQYK8iFLrHnWWHtp8ZfbygO5FFyyjoh
 BhBNP68yTGny/BcNgdxP+3pGA8XCTTnkgKca9VoDE5p56VMfBT3cRSU+DSFHdRtxIMlb
 oH7QI/4nnnvEqWiVQVOKr1Wrn4uo6TKiy6vtx85hu3y1is/FVo6rc3ya4w68HG3qSBi5
 4kpjYeUicmoKfIxIBgul1Fn63VPLLBxRaibZssMOykZVnnRHFaD2PgMalrTKEIskbtqE
 Hi/A==
X-Gm-Message-State: AOJu0YypLMQDAShoQZFhBBVA1W6Ar6YV15jjHaYD4dgqCPVerI+10WWb
 e5jy98v4OQBQd1y3+HDGu/1Fx+VeP+3nmnvIpgAPGfB6LcpydF3FlX06UHB0+avVLzN2B7NcQ2U
 0iQCZsSX2Dkpj4zowO+Mr4MJDE10o
X-Received: by 2002:adf:f8c4:0:b0:319:6ed2:a5c4 with SMTP id
 f4-20020adff8c4000000b003196ed2a5c4mr9947440wrq.26.1692783275075; 
 Wed, 23 Aug 2023 02:34:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6DUaWC/A6Y5ioCxr0UQQ9i+dT7AZIhw75r/TF9DBQf4fx8vw15yvVUGF8xSzH3OyePc+kgA==
X-Received: by 2002:adf:f8c4:0:b0:319:6ed2:a5c4 with SMTP id
 f4-20020adff8c4000000b003196ed2a5c4mr9947417wrq.26.1692783274733; 
 Wed, 23 Aug 2023 02:34:34 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:e700:4d5c:81e2:253e:e397?
 (p200300cbc70ce7004d5c81e2253ee397.dip0.t-ipconnect.de.
 [2003:cb:c70c:e700:4d5c:81e2:253e:e397])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a5d4448000000b0031432f1528csm18383361wrr.45.2023.08.23.02.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Aug 2023 02:34:34 -0700 (PDT)
Message-ID: <8afa35bb-c3ed-c939-46a4-a9a277b6d4e2@redhat.com>
Date: Wed, 23 Aug 2023 11:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
To: Jason Gunthorpe <jgg@nvidia.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
References: <20230817064934.3424431-1-vivek.kasireddy@intel.com>
 <ZN42XjuXUyma5uE+@nvidia.com>
 <IA0PR11MB7185ABFBB06771B7646F8F50F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZOSo2cuw1ashK3+Z@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <ZOSo2cuw1ashK3+Z@nvidia.com>
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
 Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> - Add a new API to the backing store/allocator to longterm-pin the page.
>>    For example, something along the lines of shmem_pin_mapping_page_longterm()
>>    for shmem as suggested by Daniel. A similar one needs to be added for
>>    hugetlbfs as well.
> 
> This may also be reasonable.

Sounds reasonable to keep the old API (that we unfortunately have) working.

-- 
Cheers,

David / dhildenb

