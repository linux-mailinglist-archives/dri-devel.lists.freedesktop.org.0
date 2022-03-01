Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3482D4C85DE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 09:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0442410E9FD;
	Tue,  1 Mar 2022 08:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608E110E9FD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 08:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646121792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5HcmxS711SnBUiFSO6QPeyhMTExbS2pi4xO3biwyng=;
 b=QwekiK8GmAri3TS3n7TewZAm7BlmHA084g8Cjf1KZYUwXTSnFUxx9BXEWl1Lx1HUGTyRBT
 /jPjbn8OQREaStKlta91gWCkpvXZew3m55viraLJyDVprI1azvpxY76JtPGCgOGkqXyQ3S
 +3parVm/buw0MnMY4roB4lvNZGKou7Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-5xVNZBICOLWdtshoNZSZEg-1; Tue, 01 Mar 2022 03:03:11 -0500
X-MC-Unique: 5xVNZBICOLWdtshoNZSZEg-1
Received: by mail-wm1-f70.google.com with SMTP id
 m34-20020a05600c3b2200b0038115c73361so1182640wms.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 00:03:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g5HcmxS711SnBUiFSO6QPeyhMTExbS2pi4xO3biwyng=;
 b=KCsHTcD4/8bRxFcy2SAv6+TuA2JPu9qxwtV4mI0qkcEhVPyeJk0RumlEkvZeooTqMo
 i8UqvnKrXM5iWKTgtKdd23LJd8i/9zYKROfkJ+g5xkezD6PM6nFcH/yYCov6c6Em64mT
 eI6bEcoiSi0KENRHcbUelNFlOUiAAPoArz9U1tneonkt3KJAB3NS64749jd6CacXWhue
 mV/PJ8OSXY4bhPmYMTyrD/HhUNj/GmBTfRqrG2mPqeWgzAQ0jGgFX+buMC/R0pyo0hy2
 qWXZwAkh1pA4RPo0QVWDolSB/7Ry6LfIWVG/kI4ahoBQybalfw8KfpfH7kjBEsph8zFn
 oHRQ==
X-Gm-Message-State: AOAM533PwCNfCK6ZYNjNYPxajoqx15GWhMuEdgGxj9q1Cxpc85qiYJ/Y
 Ns5o8JOXl0EUD3YwOZSOVbhQOCfiZ4IBBuaKT06V1RfQvPfisk7TbboULj02uOa/l0RAxPPoqyq
 4cNeo/0ynMOCoxCncKYeyO7UHSjL2
X-Received: by 2002:adf:f049:0:b0:1ee:7523:ed53 with SMTP id
 t9-20020adff049000000b001ee7523ed53mr17566906wro.586.1646121789943; 
 Tue, 01 Mar 2022 00:03:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpcJ4TqolQDE6BE7vD6rbCwoSwmTCrugFFkBxu6/s97N/cr/HBlvpSmDNAY1B2ylV7rKaSQQ==
X-Received: by 2002:adf:f049:0:b0:1ee:7523:ed53 with SMTP id
 t9-20020adff049000000b001ee7523ed53mr17566887wro.586.1646121789674; 
 Tue, 01 Mar 2022 00:03:09 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:5e00:88ce:ad41:cb1b:323?
 (p200300cbc70e5e0088cead41cb1b0323.dip0.t-ipconnect.de.
 [2003:cb:c70e:5e00:88ce:ad41:cb1b:323])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c2c4c00b003816932de9csm1668126wmg.24.2022.03.01.00.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 00:03:09 -0800 (PST)
Message-ID: <2a042493-d04d-41b1-ea12-b326d2116861@redhat.com>
Date: Tue, 1 Mar 2022 09:03:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] mm: split vm_normal_pages for LRU and non-LRU handling
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220218192640.GV4160@nvidia.com>
 <20220228203401.7155-1-alex.sierra@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220228203401.7155-1-alex.sierra@amd.com>
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

On 28.02.22 21:34, Alex Sierra wrote:
> DEVICE_COHERENT pages introduce a subtle distinction in the way
> "normal" pages can be used by various callers throughout the kernel.
> They behave like normal pages for purposes of mapping in CPU page
> tables, and for COW. But they do not support LRU lists, NUMA
> migration or THP. Therefore we split vm_normal_page into two
> functions vm_normal_any_page and vm_normal_lru_page. The latter will
> only return pages that can be put on an LRU list and that support
> NUMA migration and THP.

Why not s/vm_normal_any_page/vm_normal_page/ and avoid code churn?

> 
> We also introduced a FOLL_LRU flag that adds the same behaviour to
> follow_page and related APIs, to allow callers to specify that they
> expect to put pages on an LRU list.

[...]
> -#define FOLL_WRITE	0x01	/* check pte is writable */
> -#define FOLL_TOUCH	0x02	/* mark page accessed */
> -#define FOLL_GET	0x04	/* do get_page on page */
> -#define FOLL_DUMP	0x08	/* give error on hole if it would be zero */
> -#define FOLL_FORCE	0x10	/* get_user_pages read/write w/o permission */
> -#define FOLL_NOWAIT	0x20	/* if a disk transfer is needed, start the IO
> -				 * and return without waiting upon it */
> -#define FOLL_POPULATE	0x40	/* fault in pages (with FOLL_MLOCK) */
> -#define FOLL_NOFAULT	0x80	/* do not fault in pages */
> -#define FOLL_HWPOISON	0x100	/* check page is hwpoisoned */
> -#define FOLL_NUMA	0x200	/* force NUMA hinting page fault */
> -#define FOLL_MIGRATION	0x400	/* wait for page to replace migration entry */
> -#define FOLL_TRIED	0x800	/* a retry, previous pass started an IO */
> -#define FOLL_MLOCK	0x1000	/* lock present pages */
> -#define FOLL_REMOTE	0x2000	/* we are working on non-current tsk/mm */
> -#define FOLL_COW	0x4000	/* internal GUP flag */
> -#define FOLL_ANON	0x8000	/* don't do file mappings */
> -#define FOLL_LONGTERM	0x10000	/* mapping lifetime is indefinite: see below */
> -#define FOLL_SPLIT_PMD	0x20000	/* split huge pmd before returning */
> -#define FOLL_PIN	0x40000	/* pages must be released via unpin_user_page */
> -#define FOLL_FAST_ONLY	0x80000	/* gup_fast: prevent fall-back to slow gup */
> +#define FOLL_WRITE	0x01	 /* check pte is writable */
> +#define FOLL_TOUCH	0x02	 /* mark page accessed */
> +#define FOLL_GET	0x04	 /* do get_page on page */
> +#define FOLL_DUMP	0x08	 /* give error on hole if it would be zero */
> +#define FOLL_FORCE	0x10	 /* get_user_pages read/write w/o permission */
> +#define FOLL_NOWAIT	0x20	 /* if a disk transfer is needed, start the IO
> +				  * and return without waiting upon it */
> +#define FOLL_POPULATE	0x40	 /* fault in pages (with FOLL_MLOCK) */
> +#define FOLL_NOFAULT	0x80	 /* do not fault in pages */
> +#define FOLL_HWPOISON	0x100	 /* check page is hwpoisoned */
> +#define FOLL_NUMA	0x200	 /* force NUMA hinting page fault */
> +#define FOLL_MIGRATION	0x400	 /* wait for page to replace migration entry */
> +#define FOLL_TRIED	0x800	 /* a retry, previous pass started an IO */
> +#define FOLL_MLOCK	0x1000	 /* lock present pages */
> +#define FOLL_REMOTE	0x2000	 /* we are working on non-current tsk/mm */
> +#define FOLL_COW	0x4000	 /* internal GUP flag */
> +#define FOLL_ANON	0x8000	 /* don't do file mappings */
> +#define FOLL_LONGTERM	0x10000	 /* mapping lifetime is indefinite: see below */
> +#define FOLL_SPLIT_PMD	0x20000	 /* split huge pmd before returning */
> +#define FOLL_PIN	0x40000	 /* pages must be released via unpin_user_page */
> +#define FOLL_FAST_ONLY	0x80000	 /* gup_fast: prevent fall-back to slow gup */
> +#define FOLL_LRU	0x100000 /* return only LRU (anon or page cache) */
>  

Can we minimize code churn, please?


>  		if (PageReserved(page))
> diff --git a/mm/migrate.c b/mm/migrate.c
> index c31d04b46a5e..17d049311b78 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -1614,7 +1614,7 @@ static int add_page_for_migration(struct mm_struct *mm, unsigned long addr,
>  		goto out;
>  
>  	/* FOLL_DUMP to ignore special (like zero) pages */
> -	follflags = FOLL_GET | FOLL_DUMP;
> +	follflags = FOLL_GET | FOLL_DUMP | FOLL_LRU;
>  	page = follow_page(vma, addr, follflags);

Why wouldn't we want to dump DEVICE_COHERENT pages? This looks wrong.


-- 
Thanks,

David / dhildenb

