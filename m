Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A89364ED64B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 10:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA4F10F43B;
	Thu, 31 Mar 2022 08:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9404E10F43B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648716918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZeceZ4MowtZcfgVk5LvYuyjG8NKEFJQ6vum/zhYc1I=;
 b=ApwXBKu75dvtElJOA1N1lRPWo6oHNElUX+bKgH1OLfO4gxNL/4cpKkkUm5ZM+YQkqjTCcR
 q+a0//mpAEYuKQgzpHdjI0gbfMTp0vZ290SjicwqK3UyF2bnGwkA/O6cB8n/xejzW8Hyyp
 nL/vy3MDNRqqRZ5KrY7BUR25Naq3KEc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-_BdfkX6APXi0tSuj8pCnoQ-1; Thu, 31 Mar 2022 04:55:16 -0400
X-MC-Unique: _BdfkX6APXi0tSuj8pCnoQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c62-20020a1c3541000000b003815245c642so1131595wma.6
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 01:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0ZeceZ4MowtZcfgVk5LvYuyjG8NKEFJQ6vum/zhYc1I=;
 b=C9hbf+quBImeBy/hGYT6RgLtZjjLHaFeV98M6ZULwTBcKR+gZ00ZNgH9MXnhNCvyhn
 LnSEqa60EfnX238JhPL6vaoX1GKz5l1m5+2cDXdOvpVbfZzx/6anRIQ+OIK8NK5+RgzK
 h7f36O5CB8rk899ZUZAuQzndvWii1cJ2vFnrwx3TkJy5Z1JQOk5w2fCK5kcUTsARozp3
 hGP+hWvHgM82cENG322mXuu8wmzz9+vflWbJNTRKABUIvvABTtNTdHx9AfFNgUfAW+vn
 esInOEw4lFvAm/o5CG2qboDdRy8BgfbJRT4qOtdDIRXUS+d/PxJWKrgBrPD7MRh4fco3
 o0Ow==
X-Gm-Message-State: AOAM531Fy8Oi2RvbmSmOB2khHrslLrR6gZvCnv6De23VcQq8D7HNq10y
 iTwRhE3j/OR1ryYUFHdoMWCIol6gR4IZXJAMbr6mpTpqjyyIFCaiAiS6Z9F77e0EmSA7ANaOmd2
 15BwWLnB8Vygmem92bQErWaMAiHaL
X-Received: by 2002:a5d:6dac:0:b0:205:ccac:c676 with SMTP id
 u12-20020a5d6dac000000b00205ccacc676mr3304076wrs.156.1648716915703; 
 Thu, 31 Mar 2022 01:55:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDW0zeqDZxqpReSRP+T3IGc5ZHXjnkjH5M+CBXHuSyrckPORChwL0jc6rBUWSqN1K/5sw+sA==
X-Received: by 2002:a5d:6dac:0:b0:205:ccac:c676 with SMTP id
 u12-20020a5d6dac000000b00205ccacc676mr3304051wrs.156.1648716915512; 
 Thu, 31 Mar 2022 01:55:15 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:ac00:381c:2e8b:3b48:488e?
 (p200300cbc707ac00381c2e8b3b48488e.dip0.t-ipconnect.de.
 [2003:cb:c707:ac00:381c:2e8b:3b48:488e])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c1d1400b0038cba2f88c0sm9231563wms.26.2022.03.31.01.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 01:55:14 -0700 (PDT)
Message-ID: <709b459a-3c71-49b1-7ac1-3144ae0fa89a@redhat.com>
Date: Thu, 31 Mar 2022 10:55:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 1/3] mm: add vm_normal_lru_pages for LRU handled pages
 only
To: Christoph Hellwig <hch@lst.de>, Alex Sierra <alex.sierra@amd.com>
References: <20220330212537.12186-1-alex.sierra@amd.com>
 <20220330212537.12186-2-alex.sierra@amd.com> <20220331085341.GA22102@lst.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220331085341.GA22102@lst.de>
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
Cc: rcampbell@nvidia.com, willy@infradead.org, Felix.Kuehling@amd.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, akpm@linux-foundation.org, linux-ext4@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31.03.22 10:53, Christoph Hellwig wrote:
>> -	page = vm_normal_page(vma, addr, pte);
>> +	page = vm_normal_lru_page(vma, addr, pte);
> 
> Why can't this deal with ZONE_DEVICE pages?  It certainly has
> nothing do with a LRU I think.  In fact being able to have
> stats that count say the number of device pages here would
> probably be useful at some point.
> 
> In general I find the vm_normal_lru_page vs vm_normal_page
> API highly confusing.  An explicit check for zone device pages
> in the dozen or so spots that care has a much better documentation
> value, especially if accompanied by comments where it isn't entirely
> obvious.

What's your thought on FOLL_LRU?

-- 
Thanks,

David / dhildenb

