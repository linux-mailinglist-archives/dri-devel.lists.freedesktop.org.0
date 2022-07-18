Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0861F57804F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 12:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D08A6CAB;
	Mon, 18 Jul 2022 10:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C6D90105
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 10:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658141813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wznRRcQ1E1EPLsgI7kgVwWWa1K3DaSgJ1EEclGC9ESw=;
 b=V24PrUZ6nYrljWk/PoWTU2YFghlOk1B4RNwMfuK8rSclRboXpQV/ro/Vd/oSLgmtnvJOdI
 6fPO8YzUwXfvkVwEwWIjrrh7OuQboqE1Cgn+nZKh6k9n1FvVuRzhU1KQXcodgFYKjFnTYv
 gz4lJFudWdX3BLz5ZYhVKNpSQJTG4Ig=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-e29ryvEgPyKwyUNbyLEtVg-1; Mon, 18 Jul 2022 06:56:32 -0400
X-MC-Unique: e29ryvEgPyKwyUNbyLEtVg-1
Received: by mail-wm1-f69.google.com with SMTP id
 z11-20020a05600c0a0b00b003a043991610so4090883wmp.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 03:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wznRRcQ1E1EPLsgI7kgVwWWa1K3DaSgJ1EEclGC9ESw=;
 b=olNrRRSIM3UHbngM/ASht5jmNI5liWm1gCi06Spu54tXHdW8YBjVugoeARBWg6S0+H
 ll5W4rKEn5kUaPcAdD1yaeDYrv/w/sDl+dno595l1TlDVqToxRSYGeQpNRcbx8aH/rwq
 NxHx7PYMin5cIQKP8WnGYrm7LQzMu20rf+K7RdODRkFKxjSTRKhp3qRfdzHZ/E7+Ja9d
 0t5RaBsWM5B0RHWPx0b08IvAzKAHXhyaZeIMR9sfadhUYYbKTE/8oOsik++V8562a1++
 Bf8pCyOzsSfF0dcNMzeXon1KdyA2imdMaWz1sb7wXBhDNEYv+gS1VQ82Oo0Q+vQ0TYls
 35uA==
X-Gm-Message-State: AJIora9Ljn+cmD4BKnXn39OjbuoiviV0NMjHdqNUfQoPYt7lKy2YNz/b
 fyzB3/5U4DRCbvD/wMSUnfpAZ3jHDdcGbmcqtVw8DIurABh5BNf8NIK53n2rE4BQop50r3G1+2j
 COYUiMmgrV5Mk/K/l+rdQjO7amxBU
X-Received: by 2002:a05:600c:3b8d:b0:3a2:ea2b:d0f9 with SMTP id
 n13-20020a05600c3b8d00b003a2ea2bd0f9mr25454658wms.120.1658141791259; 
 Mon, 18 Jul 2022 03:56:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1semjCkDwGjEQMzpCRvMdqQ/nTLWiXGmEKcwwSpdKliRLXOgrdG+Rkplh3ByVOTYHpbct/E2A==
X-Received: by 2002:a05:600c:3b8d:b0:3a2:ea2b:d0f9 with SMTP id
 n13-20020a05600c3b8d00b003a2ea2bd0f9mr25454634wms.120.1658141790977; 
 Mon, 18 Jul 2022 03:56:30 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:7400:6b3a:a74a:bd53:a018?
 (p200300cbc70574006b3aa74abd53a018.dip0.t-ipconnect.de.
 [2003:cb:c705:7400:6b3a:a74a:bd53:a018])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a5d5541000000b0021d728d687asm12298516wrw.36.2022.07.18.03.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 03:56:30 -0700 (PDT)
Message-ID: <225554c2-9174-555e-ddc0-df95c39211bc@redhat.com>
Date: Mon, 18 Jul 2022 12:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9 06/14] mm/gup: migrate device coherent pages when
 pinning instead of failing
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220715150521.18165-1-alex.sierra@amd.com>
 <20220715150521.18165-7-alex.sierra@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220715150521.18165-7-alex.sierra@amd.com>
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

On 15.07.22 17:05, Alex Sierra wrote:
> From: Alistair Popple <apopple@nvidia.com>
> 
> Currently any attempts to pin a device coherent page will fail. This is
> because device coherent pages need to be managed by a device driver, and
> pinning them would prevent a driver from migrating them off the device.
> 
> However this is no reason to fail pinning of these pages. These are
> coherent and accessible from the CPU so can be migrated just like
> pinning ZONE_MOVABLE pages. So instead of failing all attempts to pin
> them first try migrating them out of ZONE_DEVICE.
> 
> [hch: rebased to the split device memory checks,
>       moved migrate_device_page to migrate_device.c]
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

[...]

>  		/*
>  		 * Try to move out any movable page before pinning the range.
>  		 */
> @@ -1919,7 +1948,8 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>  				    folio_nr_pages(folio));
>  	}
>  
> -	if (!list_empty(&movable_page_list) || isolation_error_count)
> +	if (!list_empty(&movable_page_list) || isolation_error_count
> +		|| coherent_pages)

The common style is to

a) add the || to the end of the previous line
b) indent such the we have a nice-to-read alignment

if (!list_empty(&movable_page_list) || isolation_error_count ||
    coherent_pages)


Apart from that lgtm.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

