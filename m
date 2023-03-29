Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0940C6CED82
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 17:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F64010EB5F;
	Wed, 29 Mar 2023 15:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F54010EB5F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 15:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680105093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z9sb+Q1T/f0oExcCGN2SqhwnX2wsQdIarY9QEcGAXAg=;
 b=EWoyd5rq/Nuu6VK4TvrR1fz9Uqi2vJopY59uYikwc+CYdm0jxxLhyDUUWO6qCGiRpPMaAN
 mO02OLvU0n+goa3HYQROGpAH+5rZBWjzO/yPhPsrW0+tuzICeoGubH2tn8QSYrUjuGiFI3
 ovA8k1XUIfJ2Wb+Mx5HdEPHn/LCkRWg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-28IIkP-yM7qabiQs11ce_Q-1; Wed, 29 Mar 2023 11:51:32 -0400
X-MC-Unique: 28IIkP-yM7qabiQs11ce_Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 b1-20020aa7dc01000000b004ad062fee5eso22764829edu.17
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 08:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680105091; x=1682697091;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9sb+Q1T/f0oExcCGN2SqhwnX2wsQdIarY9QEcGAXAg=;
 b=cWToVnfs60y94GBVFHI/JYWNnLGMtzANHNmt/76w0iEQ3sgPzrVfszb3c7gEZBZq1S
 ps04ZdglxBDWFc2Jn7frJb4S/thZWO2mRc6gAxdJPUHxOjbh+oRfbzEZHI5Fl7FiDcZ1
 MmMkHQY+OPzwvrvfHzw+jQQG0Ynr7M1/K2P8nkoZxlEqPtI7VhEDjFCI2uSATrXHVBEA
 4D/dMPH3T8jTULG80K0hCAoDLTS7HYASW8IEGWR3+AV1ORkqJJpJ71SWIGk42QSno1B6
 VOSfdAnksclfdN8DfwQYRDJdvQvGZJRQLx1WHFc43642Y2EV4X64x/CFbtkVg7J0F266
 aKbw==
X-Gm-Message-State: AAQBX9dRD+NSZi9gd/11ATkM3SaIgzjqQqLtVgKOp4tuAbBe+iTlI8l0
 RWEH45htY5fKFvs++5vnOjEwV8vvJ9Zv0fC+IkPpekADiSYeLxsWVyw1zIeXyqx2BZQnT9d13Iy
 yLPRYKOZZaBV/bvoXQpJHlyfO5xrY
X-Received: by 2002:a17:906:398b:b0:930:e9ee:c474 with SMTP id
 h11-20020a170906398b00b00930e9eec474mr20900067eje.54.1680105090928; 
 Wed, 29 Mar 2023 08:51:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350asgd3jAFhNuQ/8+BifUDdE5XZwkGSiyeY9A3D2dsxgcWmTRQCv788c+aqkTz8TuKmzzmUZog==
X-Received: by 2002:a17:906:398b:b0:930:e9ee:c474 with SMTP id
 h11-20020a170906398b00b00930e9eec474mr20900050eje.54.1680105090613; 
 Wed, 29 Mar 2023 08:51:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 kg6-20020a17090776e600b008b904cb2bcdsm16799197ejc.11.2023.03.29.08.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 08:51:30 -0700 (PDT)
Message-ID: <ab8ed64b-5c4a-4948-7067-bac5351a45f0@redhat.com>
Date: Wed, 29 Mar 2023 17:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20230329135401.105592-1-christian.koenig@amd.com>
 <46f01fc0-ec64-c215-b027-bd748711e6d8@redhat.com>
 <0080e53d-b597-ad34-7e66-6384cae456ae@redhat.com>
 <cf2f0771-39b0-49d6-011c-66b60b6a95c9@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] drm/ttm: set TTM allocated pages as reserved
In-Reply-To: <cf2f0771-39b0-49d6-011c-66b60b6a95c9@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Pierre-eric.Pelloux-prayer@amd.com, npiggin@gmail.com,
 Sean Christopherson <seanjc@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/29/23 17:29, Christian König wrote:
>> First, is it a _host_ corruption or a guest corruption/crash?  A guest 
>> crash would be KVM doing exactly what it's meant to do: it detects the 
>> non-reserved, non-refcounted page and refuses to map it into the guest.
> 
> Yes I think that this is what happens.

Ok I was worried all the time that this was host corruption/crash; which 
obviously would have been much worse.

> The use case and mapping is indeed valid as far as I can see, but
> the handling that KVM does here is really problematic.
> 
> What needs to happen instead is that when both hva_to_pfn_fast() and 
> hva_to_pfn_slow() fails you don't try to convert the PFN into a page and 
> so also don't get a reference to the page.
> 
> This somehow needs to be communicated to the callers of hva_to_pfn() so 
> that kvm_release_pfn() knows what to do.

There's a bit more complication here:

1) in the guest page fault path we can avoid taking the reference altogether

2) in other MMU-notifier-protected paths, we can also avoid taking the 
reference but we also must stop using kmap() in virt/kvm/pfncache.c.

3) other uses of kmap() must switch to MMU-notifier protection.


If the DRM people are okay with SetPageReserved() as a temporary hack, 
we can change or remove the WARN in kvm_is_zone_device_page(), since 
that is what you are referring to in the commit message.

Paolo

