Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8724B82F4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 09:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B96310E980;
	Wed, 16 Feb 2022 08:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7E010E97E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 08:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645000269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dMr7qMjbySmB3FKzyMaIvMtNvTUPHIVGxBY8lAVP/YQ=;
 b=DeJRhDb7nqDCwLuiCmEKyytC1Z3xdAPFHGJrEnEN/Nqm7ZkvzJAid8s0Zr3rU3V4VnlDlV
 cSNPcBUs8LzWPYB2f2glG3VSR1EgleA/+U+V8bF/w55d32fAf0vj3j9cAp5IPgXanLeN/0
 cfs2E/2cZXZmRCyTqoIyRebAqhfEh/Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-VhqcIARwPMyyCUbPhAph5g-1; Wed, 16 Feb 2022 03:31:06 -0500
X-MC-Unique: VhqcIARwPMyyCUbPhAph5g-1
Received: by mail-wm1-f72.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so212182wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 00:31:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=dMr7qMjbySmB3FKzyMaIvMtNvTUPHIVGxBY8lAVP/YQ=;
 b=kCE68QIYoVxSTKBbAf6mms3cU3O4pqqENWlajgubfiOtVjiJ86cesmBVqgfTe3eDuu
 iuDkSEW8Rd6MXKTzkKY4AFvjc3EC2v+lKuCwXMrBpsXA19+wJ9koerK0dmSEqFBAEU6T
 1butkl1G3Dj8mtIYP3VjGE0yQuhRE/mhSHno5pXiQng4OF2gEOG7pgbL6Q0rtRuFw6M2
 DueEKLbZ6RKf5LUtUze5a+jn7JQyHUca6b090YqV4BncjDGGmb9y1kT3Xr3IpiyiN50h
 jmdTD2UAochaFVu9Vr4E3Tb7S1XWNFt5Q5cNWpUEtmtfBk2y39CRno7yGbf+QiNhENld
 snyQ==
X-Gm-Message-State: AOAM533eLSCNa1DubtuFar4zDcwJZ4WT5fawt5EFvjTIcBNrLcArw84A
 XhCJ/nelfOSwZMzSUlXF4nG1eDc9HFPeifwtW71b3DllXxAq9lHqAfPQn/ChajLaMrf2qASfW2/
 OtNvxdSu0U1O7LQvAvNU8MXvAKtMS
X-Received: by 2002:a5d:6a03:0:b0:1e4:4055:7e35 with SMTP id
 m3-20020a5d6a03000000b001e440557e35mr1391879wru.495.1645000264851; 
 Wed, 16 Feb 2022 00:31:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzw1zMgqtvBG1B1Fs/z6twGtOuFvl241Tm8Z6QUAB1L998Nv+s1BS79V+EKfFEFJWSxdpuYnw==
X-Received: by 2002:a5d:6a03:0:b0:1e4:4055:7e35 with SMTP id
 m3-20020a5d6a03000000b001e440557e35mr1391848wru.495.1645000264537; 
 Wed, 16 Feb 2022 00:31:04 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:600:4ff7:25c:5aad:2711?
 (p200300cbc70b06004ff7025c5aad2711.dip0.t-ipconnect.de.
 [2003:cb:c70b:600:4ff7:25c:5aad:2711])
 by smtp.gmail.com with ESMTPSA id y17sm17260030wma.5.2022.02.16.00.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 00:31:04 -0800 (PST)
Message-ID: <98d8bbc5-ffc2-8966-fdc1-a844874e7ae8@redhat.com>
Date: Wed, 16 Feb 2022 09:31:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <877d9vd10u.fsf@nvdebian.thelocal> <20220216020357.GD4160@nvidia.com>
 <6156515.kVgMqSaHHm@nvdebian>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
In-Reply-To: <6156515.kVgMqSaHHm@nvdebian>
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, Felix Kuehling <felix.kuehling@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16.02.22 03:36, Alistair Popple wrote:
> On Wednesday, 16 February 2022 1:03:57 PM AEDT Jason Gunthorpe wrote:
>> On Wed, Feb 16, 2022 at 12:23:44PM +1100, Alistair Popple wrote:
>>
>>> Device private and device coherent pages are not marked with pte_devmap and they
>>> are backed by a struct page. The only way of inserting them is via migrate_vma.
>>> The refcount is decremented in zap_pte_range() on munmap() with special handling
>>> for device private pages. Looking at it again though I wonder if there is any
>>> special treatment required in zap_pte_range() for device coherent pages given
>>> they count as present pages.
>>
>> This is what I guessed, but we shouldn't be able to just drop
>> pte_devmap on these pages without any other work?? Granted it does
>> very little already..
> 
> Yes, I agree we need to check this more closely. For device private pages
> not having pte_devmap is fine, because they are non-present swap entries so
> they always get special handling in the swap entry paths but the same isn't
> true for coherent device pages.

I'm curious, how does the refcount of a PageAnon() DEVICE_COHERENT page
look like when mapped? I'd assume it's also (currently) still offset by
one, meaning, if it's mapped into a single page table it's always at
least 2.

Just a note that if my assumption is correct and if we'd have such a
page mapped R/O, do_wp_page() would always have to copy it
unconditionally and would not be able to reuse it on write faults.
(while I'm working on improving the reuse logic, I think there is also
work in progress to avoid this additional reference on some ZONE_DEVICE
stuff -- I'd assume that would include DEVICE_COHERENT ?)

> 
>> I thought at least gup_fast needed to be touched or did this get
>> handled by scanning the page list after the fact?
> 
> Right, for gup I think the only special handling required is to prevent
> pinning. I had assumed that check_and_migrate_movable_pages() would still get
> called for gup_fast but unless I've missed something I don't think it does.
> That means gup_fast could still pin movable and coherent pages. Technically
> that is ok for coherent pages, but it's undesirable.

We really should have the same pinning rules for GUP vs. GUP-fast.
is_pinnable_page() should be the right place for such checks (similarly
as indicated in my reply to the migration series).

-- 
Thanks,

David / dhildenb

