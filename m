Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A91776B4A3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 14:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF47610E3E0;
	Tue,  1 Aug 2023 12:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C9B10E3E5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 12:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690892537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qCOGVBdZnyjYdyZRMHmHHxu1tYr3H9cj3Pt4ncW7IHc=;
 b=AIPZtIC7i2HLTk9VErEcJUPflYrCR3bIRyJPVAh32iB5qIc9XsSAIFk6Xtmiind7y73yu8
 RuwGUBBjQSA/75MEJ85OJn8A3kJXGHJjLA3YSZjdT+ODfc94YhggHdYEN4ETdyZKkKfgSz
 5z0oV/mEf12j5HGvYc18hKfdt4d/BFE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-5rRjvrOyPguZzZnOJMfsng-1; Tue, 01 Aug 2023 08:22:15 -0400
X-MC-Unique: 5rRjvrOyPguZzZnOJMfsng-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fa9a282fffso29726885e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 05:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690892534; x=1691497334;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qCOGVBdZnyjYdyZRMHmHHxu1tYr3H9cj3Pt4ncW7IHc=;
 b=LUOy2qbSVx+kXK7jN+aVNkd0jYAYqxXIie4Yy62irP1Prv+yHHHR9yYLddXZDtPgXI
 IX2ex3yaWcMxhxsqYe8Q+mdjLRzT2eXWw/vN04CDq41gE5WT5F1ijWkD3cXST2PHVGfn
 oPrl9k7z0jRUVKtad+1Udz0ZzuWhDF2qzz7rZrpr2gyA/ODX6JaWJo1KMV6pCCK5zVii
 KByMh5oMCs8cYDdSOYflFmn+NrT/6yHXwSV8fovXrDTmDAFbaA/xO90RafYDTFam3gyc
 ZmYX5kPclxqatV1O9HFdMHQdeKHN/6qKg8A+bpeZiWvyRG505aLv+z2CmWrQY4kfdX9C
 VgHw==
X-Gm-Message-State: ABy/qLauNYF37BWXyLSc9b5MLCy4px6cZkUVoXljnoN/d8W3CcSLEU6d
 P40WPS/a5TcoNyDnQBi/ekulxhedldmg3VsixEb3VdVlpkDGjuj2CASGPPpQrej+OkNNp/Q8B9s
 zAxwsf7QYbuw4mJBPVYWks2ZTTLrS
X-Received: by 2002:a1c:f705:0:b0:3fc:7d2:e0c0 with SMTP id
 v5-20020a1cf705000000b003fc07d2e0c0mr2226490wmh.27.1690892534778; 
 Tue, 01 Aug 2023 05:22:14 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHzkOrlTwm/pEHFUyFKY6VDv9/CzW8YqaE1SGCS8fb9IwdHHcMi0y4ZOfW6rDrzP90+/jKi0Q==
X-Received: by 2002:a1c:f705:0:b0:3fc:7d2:e0c0 with SMTP id
 v5-20020a1cf705000000b003fc07d2e0c0mr2226464wmh.27.1690892534335; 
 Tue, 01 Aug 2023 05:22:14 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:d100:871b:ec55:67d:5247?
 (p200300cbc705d100871bec55067d5247.dip0.t-ipconnect.de.
 [2003:cb:c705:d100:871b:ec55:67d:5247])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a1ccc0b000000b003fbdd5d0758sm13758328wmb.22.2023.08.01.05.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 05:22:13 -0700 (PDT)
Message-ID: <d4bae5e4-ff92-bee9-d585-9f30e34ef646@redhat.com>
Date: Tue, 1 Aug 2023 14:22:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
To: Jason Gunthorpe <jgg@nvidia.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
References: <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL/B6yvO1bIkFRcF@nvidia.com>
 <CH3PR11MB7177FA18562FCED8A3171007F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMBSWxYnWLlzG3+6@nvidia.com>
 <IA0PR11MB71853E11B6C419DC0D043953F801A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMJbywGYN0QLh3vF@nvidia.com>
 <CH3PR11MB71779C83F8A0EC6C2F3F4B0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMbtsY4O3Ho3B69J@nvidia.com>
 <IA0PR11MB71857E9D6C3AD311CF698D13F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMj4Og063T6T/okI@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <ZMj4Og063T6T/okI@nvidia.com>
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01.08.23 14:19, Jason Gunthorpe wrote:
> On Tue, Aug 01, 2023 at 05:32:38AM +0000, Kasireddy, Vivek wrote:
> 
>>> You get another invalidate because the memfd removes the zero pages
>>> that hmm_range_fault installed in the PTEs before replacing them with
>>> actual writable pages. Then you do the move, and another
>>> hmm_range_fault, and basically the whole thing over again. Except this
>>> time instead of returning zero pages it returns actual writable
>>> page.
> 
>> Ok, when I tested earlier (by registering an invalidate callback) but without
>> hmm_range_fault(), I did not find this additional invalidate getting triggered.
>> Let me try with hmm_range_fault() and see if everything works as expected.
>> Thank you for your help.
> 
> If you do not get an invalidate then there is a pretty serious bug in
> the mm that needs fixing.
> 
> Anything hmm_range_fault() returns must be invalidated if the
> underying CPU mapping changes for any reasons. Since hmm_range_fault()
> will populate zero pages when reading from a hole in a memfd, it must
> also get an invalidation when the zero pages are changed into writable
> pages.

Can you point me at the code that returns that (shared) zero page?

-- 
Cheers,

David / dhildenb

