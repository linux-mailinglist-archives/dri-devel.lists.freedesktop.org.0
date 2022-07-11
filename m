Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE245704B4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 15:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA06410E7CB;
	Mon, 11 Jul 2022 13:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A8A12BBB3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 13:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657547582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TiDFw+H9wQAOoFgenmknWW5ulkS2E0Ovm/60i012Tps=;
 b=bty9a/+z0po9y951Q9OaFfA4QOPqe//PWk8MD1gR4J0tKzF3NylJ2ikslSpTq9YG4OvP7i
 xooGpKzVJfRxbNJ5eZrWgD2cqsH9lt06u43E8EC7+ZAaRx9+vN2625MUD/SQzsAHzOiWUI
 wCo6BpOdZR4E9TR57FWW76ri8KkSSUc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-PFpX_dOwOz-545Nmn4-4RA-1; Mon, 11 Jul 2022 09:53:01 -0400
X-MC-Unique: PFpX_dOwOz-545Nmn4-4RA-1
Received: by mail-wm1-f72.google.com with SMTP id
 i132-20020a1c3b8a000000b003a2e8a77dd1so274889wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 06:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=TiDFw+H9wQAOoFgenmknWW5ulkS2E0Ovm/60i012Tps=;
 b=tiHmh1S+8wXF/ZymLOWAuaQm7o6Oo86wsbHaR3mpXr02riPI+E2m3V90TvM622tzEQ
 XOnE7qMHOU0AB4Qy6kCoK9xRfxa6f16HiJouUv8jGEAEmPMP1JmTHOHkcvun/Ehqc0ke
 dQrWhTjA3Qrah3pQgooG9zGcy5RPmrCrk+MXJTZJNvD4B+CXsSay17tyNgWPiLJdvwPk
 QSrsjQSHqsyTjIsDrpCiabAuils8kV9EPKEdpb7vchB5KPlrwuSzAJg8H8yNgET1KFSH
 Xp/F+bxeRMWf0BXm39CtN8BISMVSU3rlWHRgvTA80xBD8563QvdVTDVymDFsp758uoiy
 9SqA==
X-Gm-Message-State: AJIora+kJy+pPRMPrDjI2pKJbiaPiQBFh5vey1LYF0xff8JUKhFJLWMF
 mHVUyEyc5MDSJvSTaYupmYGeTRlNV+pu9vrp4H1emj7E7NOoCxoNQF/2wtKi1Jm7oVdmCJBRW2w
 Sln9Oae7fGQ+NToY5MQd5k6zufDQb
X-Received: by 2002:adf:f151:0:b0:21d:76a7:76d3 with SMTP id
 y17-20020adff151000000b0021d76a776d3mr16557681wro.702.1657547579796; 
 Mon, 11 Jul 2022 06:52:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tVRhLI1q2NxvdCqXB46XQEdcekPaWp69NFcGLqv0djixdSMTe1BzXGsV30YFN4gPC0osccbA==
X-Received: by 2002:adf:f151:0:b0:21d:76a7:76d3 with SMTP id
 y17-20020adff151000000b0021d76a776d3mr16557660wro.702.1657547579573; 
 Mon, 11 Jul 2022 06:52:59 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:1400:c3:4ae0:6d5c:1ab2?
 (p200300cbc702140000c34ae06d5c1ab2.dip0.t-ipconnect.de.
 [2003:cb:c702:1400:c3:4ae0:6d5c:1ab2])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a056000110f00b0021d6c7a9f50sm6200486wrw.41.2022.07.11.06.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 06:52:58 -0700 (PDT)
Message-ID: <7a772ca0-0c82-2251-dd54-8ad466774e99@redhat.com>
Date: Mon, 11 Jul 2022 15:52:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220707190349.9778-1-alex.sierra@amd.com>
 <20220707190349.9778-7-alex.sierra@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v8 06/15] mm: remove the vma check in migrate_vma_setup()
In-Reply-To: <20220707190349.9778-7-alex.sierra@amd.com>
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
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.07.22 21:03, Alex Sierra wrote:
> From: Alistair Popple <apopple@nvidia.com>
> 
> migrate_vma_setup() checks that a valid vma is passed so that the page
> tables can be walked to find the pfns associated with a given address
> range. However in some cases the pfns are already known, such as when
> migrating device coherent pages during pin_user_pages() meaning a valid
> vma isn't required.

As raised in my other reply, without a VMA ... it feels odd to use a
"migrate_vma" API. For an internal (mm/migrate_device.c) use case it is
ok I guess, but it certainly adds a bit of confusion. For example,
because migrate_vma_setup() will undo ref+lock not obtained by it.

I guess the interesting point is that

a) Besides migrate_vma_pages() and migrate_vma_setup(), the ->vma is unused.

b) migrate_vma_setup() does collect+unmap+cleanup if unmap failed.

c) With our source page in our hands, we cannot be processing a hole in
a VMA.



Not sure if it's better. but I would

a) Enforce in migrate_vma_setup() that there is a VMA. Code outside of
mm/migrate_device.c shouldn't be doing some hacks like this.

b) Don't call migrate_vma_setup() from migrate_device_page(), but
directly migrate_vma_unmap() and add a comment.


That will leave a single change to this patch (migrate_vma_pages()). But
is that even required? Because ....

> @@ -685,7 +685,7 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>  			continue;
>  		}
>  
> -		if (!page) {
> +		if (!page && migrate->vma) {

How could we ever have !page in case of migrate_device_page()?

Instead, I think a VM_BUG_ON(migrate->vma); should hold and you can just
simplify.

>  			if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE))
>  				continue;
>  			if (!notified) {
-- 
Thanks,

David / dhildenb

