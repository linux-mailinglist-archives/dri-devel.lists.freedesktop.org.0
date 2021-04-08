Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAAF358224
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 13:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E751E6EAB0;
	Thu,  8 Apr 2021 11:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BB56EAB0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 11:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617882065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s9XSwEEi1zJXTpbPUBOMu9HhV0dFlRjs6EwHYbE6+e4=;
 b=iUZ1fzyD/9JtmUQF2tDt3fQPioZ/XZoUMP4Zc7GlRpWEP0zcpVHCX658CroFFlybrgHB44
 3yceAsIUsG5TK54+ct8Ml8PNz3sgj0nUJp6eP1H6RSF37uWeRcFEftjpGxRZ66XWFBvgvm
 P2TsrWV1fnk8S3Hjf5bm5u0aG/ZU7Yk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-WX3JeXTUN6O67WSnvlgpRQ-1; Thu, 08 Apr 2021 07:41:01 -0400
X-MC-Unique: WX3JeXTUN6O67WSnvlgpRQ-1
Received: by mail-ej1-f71.google.com with SMTP id jo6so715545ejb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 04:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s9XSwEEi1zJXTpbPUBOMu9HhV0dFlRjs6EwHYbE6+e4=;
 b=dUK4nJ1Dfl1QIKrZkbyOZurK6WXNECbTgUrnF6iI8koboM5QjzB0KgTVOGSwcFDJP/
 +3/Tx+B62ceSKHF+/38xrGdTx+CaYWZQbxYlgLdCrqnKgMD0MRF6Lq4GLU2oSj807MhX
 I+ui4YcscITBniLHJdZJkkFwzsS/vjU9ORcOik7TnADaITs1ZALSQOYhaIA/eRXt3FRd
 KLe5tJJuUj9cUGawZQ3UhiiDTt420pYUDNadRk4dflQH/DbxsGk7xV2HQ0knkOXFbtgX
 TLHlxDdT2yJtQyt9pElkV2a7t5U6J5+d2+O+0yKg3tfKbaFjyuL2B36prUttxIqh40Do
 UXgA==
X-Gm-Message-State: AOAM530O/z8EP9S1UczV6L4A0vQUD6vAb7d7sSR2AVXTgIgDKIycITj0
 jDOSZrLCVcQqOJUrn+m0R9AG8zJnW9lkfAUGvqbNsir3HGCUjaTUIyHg+cfyjIihb8Uubo/45W2
 EkLird24U4vXkz1xgigzX/N1w0CcH
X-Received: by 2002:aa7:cf90:: with SMTP id z16mr10682030edx.273.1617882060784; 
 Thu, 08 Apr 2021 04:41:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUNwVjPU6LZkoTiJz3z03af3SU7UKs6cSUJv0KPBteAvMvZy2H6osTmzxUIJoPNr0/d/3eYQ==
X-Received: by 2002:aa7:cf90:: with SMTP id z16mr10682002edx.273.1617882060615; 
 Thu, 08 Apr 2021 04:41:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t1sm4680038eds.53.2021.04.08.04.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 04:41:00 -0700 (PDT)
To: Jason Gunthorpe <jgg@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
 3pvd@google.com, Jann Horn <jannh@google.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
 <20210316153303.3216674-4-daniel.vetter@ffwll.ch>
 <20210329133101.GA1168973@nvidia.com> <YG7VWWkvnv2IPEXt@phenom.ffwll.local>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/3] mm: unexport follow_pfn
Message-ID: <5f956a46-da38-e72a-edaa-3b746a275f1e@redhat.com>
Date: Thu, 8 Apr 2021 13:40:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YG7VWWkvnv2IPEXt@phenom.ffwll.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/04/21 12:05, Daniel Vetter wrote:
> On Mon, Mar 29, 2021 at 10:31:01AM -0300, Jason Gunthorpe wrote:
>> On Tue, Mar 16, 2021 at 04:33:03PM +0100, Daniel Vetter wrote:
>>> Both kvm (in bd2fae8da794 ("KVM: do not assume PTE is writable after
>>> follow_pfn")) and vfio (in 07956b6269d3 ("vfio/type1: Use
>>> follow_pte()")) have lost their callsites of follow_pfn(). All the
>>> other ones have been switched over to unsafe_follow_pfn because they
>>> cannot be fixed without breaking userspace api.
>>>
>>> Argueably the vfio code is still racy, but that's kinda a bigger
>>
>> vfio and kvm
> 
> Hm I thought kvm is non-racy due to the mmu notifier catch races?

No, but the plan is indeed to have some struct for each page that uses 
follow_pfn and update it from the MMU notifiers.

Paolo

>>
>>> picture. But since it does leak the pte beyond where it drops the pt
>>> lock, without anything else like an mmu notifier guaranteeing
>>> coherence, the problem is at least clearly visible in the vfio code.
>>> So good enough with me.
>>>
>>> I've decided to keep the explanation that after dropping the pt lock
>>> you must have an mmu notifier if you keep using the pte somehow by
>>> adjusting it and moving it into the kerneldoc for the new follow_pte()
>>> function.
>>>
>>> Cc: 3pvd@google.com
>>> Cc: Jann Horn <jannh@google.com>
>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>> Cc: Jason Gunthorpe <jgg@nvidia.com>
>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>> Cc: Peter Xu <peterx@redhat.com>
>>> Cc: Alex Williamson <alex.williamson@redhat.com>
>>> Cc: linux-mm@kvack.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-samsung-soc@vger.kernel.org
>>> Cc: linux-media@vger.kernel.org
>>> Cc: kvm@vger.kernel.org
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> ---
>>>   include/linux/mm.h |  2 --
>>>   mm/memory.c        | 26 +++++---------------------
>>>   mm/nommu.c         | 13 +------------
>>>   3 files changed, 6 insertions(+), 35 deletions(-)
>>
>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Thanks for your r-b tags, I'll add them.
> -Daniel
> 
>>
>> Jason
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
