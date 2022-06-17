Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E20254F483
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 11:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A5210EEE5;
	Fri, 17 Jun 2022 09:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDC010EEE5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 09:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655458843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H2YIQuKwekY0WiBRZ5F8WSRdemt7ajPawZ+d5zPsp/4=;
 b=cAXYms0CzOZPvbN82uRWBMX1L7gTmobv9vIb2pT6xVS3MjOCDFAfWX40X3w6NasEp1BrH0
 9H+SZHjwu+1e0IJp41NBzTI236K59G8XYN1NPcqPgrzBpyoO7BKZ4yavRmI0H7ixVmhCev
 FsSZf6+r50HgckCA7jFoRLIgZLfre7k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-GT3bK7tzNceSArN7IW6M3A-1; Fri, 17 Jun 2022 05:40:42 -0400
X-MC-Unique: GT3bK7tzNceSArN7IW6M3A-1
Received: by mail-wr1-f70.google.com with SMTP id
 bw25-20020a0560001f9900b002175d64fd29so832426wrb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 02:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=H2YIQuKwekY0WiBRZ5F8WSRdemt7ajPawZ+d5zPsp/4=;
 b=6gk1xIBS/af9RLtaM6pjHctXphDJ8O2JYkFR7Ch0lQQtuW/wklq6PvNz1iboiaI4NK
 BchZc3D6L267rC+D12zUrhIY0KEkU88Y4FiJNWITN5f4cNnCtkcj6kVODmgW/GjOKWZ/
 A0mUYaIV8H7Eo87M15+N/j4PvFSKTCFCdkRRdCUeccvTM8CPFEz5OEemgPW3gj96JbJ3
 WGzFWwd49SR+fc1Jb82t3S3rG+66zMObXxSK3G1fscl7sGYoBG/LXcu5SgoZtFiuPZ96
 fSYKhol6kvALU4hzlmmjSuL9khDzRP6AZTkeeL14Qim24RLVk6oFAMiM1JUIr+buZ0wB
 FoxQ==
X-Gm-Message-State: AJIora8J1N57S4Pskj/Hlw42jxesDQO9bCdD1MbP9Ots/gVgnFofGagr
 L1hgMlcVauxsphTaZ7KVb4cajPgOLOVcLEwO5uau4MW+kB+DIHJwVKiTdYIjx73FUK7QWL5ngVH
 tM61oLIpGF0W3GABNboU3sEMylDpe
X-Received: by 2002:adf:ea90:0:b0:215:a11d:3329 with SMTP id
 s16-20020adfea90000000b00215a11d3329mr8273293wrm.709.1655458841258; 
 Fri, 17 Jun 2022 02:40:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tcyIDstW1UoHx515Nm3zkT6PwFo4LTcTooQfD0VdaRVMK+nlfneS0G9f2+zYKCej73GtUeFg==
X-Received: by 2002:adf:ea90:0:b0:215:a11d:3329 with SMTP id
 s16-20020adfea90000000b00215a11d3329mr8273248wrm.709.1655458840923; 
 Fri, 17 Jun 2022 02:40:40 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:7e00:bb5b:b526:5b76:5824?
 (p200300cbc70a7e00bb5bb5265b765824.dip0.t-ipconnect.de.
 [2003:cb:c70a:7e00:bb5b:b526:5b76:5824])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a5d614e000000b0020d09f0b766sm4082674wrt.71.2022.06.17.02.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 02:40:40 -0700 (PDT)
Message-ID: <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
Date: Fri, 17 Jun 2022 11:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-2-alex.sierra@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
In-Reply-To: <20220531200041.24904-2-alex.sierra@amd.com>
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

On 31.05.22 22:00, Alex Sierra wrote:
> Device memory that is cache coherent from device and CPU point of view.
> This is used on platforms that have an advanced system bus (like CAPI
> or CXL). Any page of a process can be migrated to such memory. However,
> no one should be allowed to pin such memory so that it can always be
> evicted.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> [hch: rebased ontop of the refcount changes,
>       removed is_dev_private_or_coherent_page]
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/memremap.h | 19 +++++++++++++++++++
>  mm/memcontrol.c          |  7 ++++---
>  mm/memory-failure.c      |  8 ++++++--
>  mm/memremap.c            | 10 ++++++++++
>  mm/migrate_device.c      | 16 +++++++---------
>  mm/rmap.c                |  5 +++--
>  6 files changed, 49 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 8af304f6b504..9f752ebed613 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -41,6 +41,13 @@ struct vmem_altmap {
>   * A more complete discussion of unaddressable memory may be found in
>   * include/linux/hmm.h and Documentation/vm/hmm.rst.
>   *
> + * MEMORY_DEVICE_COHERENT:
> + * Device memory that is cache coherent from device and CPU point of view. This
> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
> + * type. Any page of a process can be migrated to such memory. However no one

Any page might not be right, I'm pretty sure. ... just thinking about special pages
like vdso, shared zeropage, ... pinned pages ...

> + * should be allowed to pin such memory so that it can always be evicted.
> + *
>   * MEMORY_DEVICE_FS_DAX:
>   * Host memory that has similar access semantics as System RAM i.e. DMA
>   * coherent and supports page pinning. In support of coordinating page
> @@ -61,6 +68,7 @@ struct vmem_altmap {
>  enum memory_type {
>  	/* 0 is reserved to catch uninitialized type fields */
>  	MEMORY_DEVICE_PRIVATE = 1,
> +	MEMORY_DEVICE_COHERENT,
>  	MEMORY_DEVICE_FS_DAX,
>  	MEMORY_DEVICE_GENERIC,
>  	MEMORY_DEVICE_PCI_P2PDMA,
> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)

In general, this LGTM, and it should be correct with PageAnonExclusive I think.


However, where exactly is pinning forbidden?

-- 
Thanks,

David / dhildenb

