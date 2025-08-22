Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89278B3220F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 20:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2850110EB80;
	Fri, 22 Aug 2025 18:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IHlqjETq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CD210EB7F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 18:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755886258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Cs65i5/BwS5INh2iU3PXL6F11yYfHDlCfNAhWqRXwfw=;
 b=IHlqjETqzwCuONFy5g3tX285k9HokVykuW9NR4wiLQpEBOzKxW0849TNNbS1S6DVCJHvuW
 mwROS5gDqKdbloa9ZFdwLW6jbeD/RNHcEYaEz+oIHSMWIuFQZCoOphU8fx6j6L4vgHVvWv
 am6keBNUTrSU6idrcZKFnYncn72PTso=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-i2u6k7CDOP-cBGajrFmmSQ-1; Fri, 22 Aug 2025 14:10:57 -0400
X-MC-Unique: i2u6k7CDOP-cBGajrFmmSQ-1
X-Mimecast-MFC-AGG-ID: i2u6k7CDOP-cBGajrFmmSQ_1755886255
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3b9e4157303so1665913f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 11:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755886255; x=1756491055;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cs65i5/BwS5INh2iU3PXL6F11yYfHDlCfNAhWqRXwfw=;
 b=nI8kKwVODqFBUsXEDLl5SjmAbIWRdmD/CHB9axSNzFz44jqN5L2dUlay/V89zUhsTT
 92NzS6eGtp+8NmGJhS2VTkTCY8IkH1AbXHBzrp3CZPMRdcCqcG/ZBnkpi6vY2mi0fGwM
 zkC13Rgy0PZueV51etLXpf+jMibN3GNfXoi/9YdGj1iTQtYh1Q33yabQMA+lvF/qO8fh
 SPV8D0O3LKlqbbxXHRr18B2Mc/pjwe2WDSuYl/15WmQmM0nRDI3Vt9gN0RwvAsoSkSkt
 7D/ZbBRRJ76Ny83vewDcewt8uUy70qWhE8W9AhtPjV3rASRORLaFQsEya0SW2NJmXPbY
 lxTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOFKDRS1DeN55WiewKlYNrhqCOK9vOYUUMnm/SQSdeDIcZnR/U2sSaGkhD7/MJGh+Fna1Hy92DvQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzE8tHIftXckcdBTvmAIv8w/wTouVzj7lIo0wZEQWM3O+b58Oxg
 zQhesOnxHjNF7N2aB8ruMBb/kC0/vz6wdGFeRpBOatdrMErJkgBkEvNhZ4Amlhx1FxySsVfB/A2
 XS83JrRgaJ36ICm118MhAPquYhCOCYcsIPGotJgNN1CJIkW9wz5q1KkycAJA4F3AbJeNKIg==
X-Gm-Gg: ASbGnctkHQsR+KotcbYh3KsOHfn2Zb2fYvUx0zQfPHGT4AGfk6JMjUmSZxtEx8/YVLi
 b0CgObrOUp7kvnkuH5DX8op80j3WvONO4Nr1bhnrlMO3vQiKsPwO/R/ZniyiQGSGJ9efTHo4ceD
 DPyX0B9a+SE00w36MtWHBOs/Imcwbt2M+etYCjk9G02uTlRC8OHce/pQsFtg+L0mEbiz4kxJuzO
 QTEZmLY/ndK5nq7YFjbs0SIAXVMzn6L9z51hWVsWvJ+g6oLskMh9iZ/oR8meOkdXjNItxbmxn8N
 wxldkk+aGJeP4ww6wkfoOM4pIww+gqV+QaPIr0qQiRNj+FDdsZNa3Ag9y2SF5wPkBYuHOmpuyv7
 iNUUu7NZc13cmbkwMM3ARvo1qOLLaPTfrR/R/NiVomVFte0vz9/gPTEP//XveN6thPOM=
X-Received: by 2002:a05:6000:26ce:b0:3b7:83c0:a9e0 with SMTP id
 ffacd0b85a97d-3c5daefc76amr3207817f8f.25.1755886254506; 
 Fri, 22 Aug 2025 11:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFruF/9yLWC9qQiiSeqlnaZybt0y1Lc6OlpmYaNOwlaf7dspYYth5O1iwJEpGlFoX5TNvjMRA==
X-Received: by 2002:a05:6000:26ce:b0:3b7:83c0:a9e0 with SMTP id
 ffacd0b85a97d-3c5daefc76amr3207779f8f.25.1755886254021; 
 Fri, 22 Aug 2025 11:10:54 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2e:6100:d9da:ae87:764c:a77e?
 (p200300d82f2e6100d9daae87764ca77e.dip0.t-ipconnect.de.
 [2003:d8:2f2e:6100:d9da:ae87:764c:a77e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c70f238640sm404818f8f.26.2025.08.22.11.10.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 11:10:53 -0700 (PDT)
Message-ID: <9a9eb9ca-a5ae-4230-8921-fd0e0a79ccbb@redhat.com>
Date: Fri, 22 Aug 2025 20:10:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 29/35] scsi: core: drop nth_page() usage within SG
 entry
To: Bart Van Assche <bvanassche@acm.org>, linux-kernel@vger.kernel.org
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Doug Gilbert <dgilbert@interlog.com>, Alexander Potapenko
 <glider@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-30-david@redhat.com>
 <58816f2c-d4a7-4ec0-a48e-66a876ea1168@acm.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZoEEwEIAEQCGwMCF4ACGQEFCwkIBwICIgIG
 FQoJCAsCBBYCAwECHgcWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaJzangUJJlgIpAAKCRBN
 3hD3AP+DWhAxD/9wcL0A+2rtaAmutaKTfxhTP0b4AAp1r/eLxjrbfbCCmh4pqzBhmSX/4z11
 opn2KqcOsueRF1t2ENLOWzQu3Roiny2HOU7DajqB4dm1BVMaXQya5ae2ghzlJN9SIoopTWlR
 0Af3hPj5E2PYvQhlcqeoehKlBo9rROJv/rjmr2x0yOM8qeTroH/ZzNlCtJ56AsE6Tvl+r7cW
 3x7/Jq5WvWeudKrhFh7/yQ7eRvHCjd9bBrZTlgAfiHmX9AnCCPRPpNGNedV9Yty2Jnxhfmbv
 Pw37LA/jef8zlCDyUh2KCU1xVEOWqg15o1RtTyGV1nXV2O/mfuQJud5vIgzBvHhypc3p6VZJ
 lEf8YmT+Ol5P7SfCs5/uGdWUYQEMqOlg6w9R4Pe8d+mk8KGvfE9/zTwGg0nRgKqlQXrWRERv
 cuEwQbridlPAoQHrFWtwpgYMXx2TaZ3sihcIPo9uU5eBs0rf4mOERY75SK+Ekayv2ucTfjxr
 Kf014py2aoRJHuvy85ee/zIyLmve5hngZTTe3Wg3TInT9UTFzTPhItam6dZ1xqdTGHZYGU0O
 otRHcwLGt470grdiob6PfVTXoHlBvkWRadMhSuG4RORCDpq89vu5QralFNIf3EysNohoFy2A
 LYg2/D53xbU/aa4DDzBb5b1Rkg/udO1gZocVQWrDh6I2K3+cCs7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <58816f2c-d4a7-4ec0-a48e-66a876ea1168@acm.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _KpsFTBK230rf8ZiCfeIRZYcVLCJB2YZNMzs7MawgJQ_1755886255
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

On 22.08.25 20:01, Bart Van Assche wrote:
> On 8/21/25 1:06 PM, David Hildenbrand wrote:
>> It's no longer required to use nth_page() when iterating pages within a
>> single SG entry, so let's drop the nth_page() usage.
> Usually the SCSI core and the SG I/O driver are updated separately.
> Anyway:

Thanks, I had it separately but decided to merge per broader subsystem 
before sending. I can split it up in the next version.

-- 
Cheers

David / dhildenb

