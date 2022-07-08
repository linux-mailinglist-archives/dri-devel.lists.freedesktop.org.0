Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB4E56B86E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 13:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E6410F481;
	Fri,  8 Jul 2022 11:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFAB10F481
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 11:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657279590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gysJ5OLsHMu4TIG7j1vcOsFr+CV/gmdUfz5sTZsCQeI=;
 b=EQAV9uLhWw8WkpzKPenQFLkMjfLagumRXrXrvjjb7EgeIDgd9QdZZNLMYcSA+4LUa6epBY
 QSuQA7rX3TPEV8i0wWGtMQUfJSDlt6OIRkZNIlJp0aWkDLOREe1l38UaZSPX8PNn4ITKb3
 199xHgzBVl2lloLSg/oF9j4bazmho+s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-ZUtdIFd5ODCcyrC34iEZMA-1; Fri, 08 Jul 2022 07:26:23 -0400
X-MC-Unique: ZUtdIFd5ODCcyrC34iEZMA-1
Received: by mail-wr1-f69.google.com with SMTP id
 o1-20020adfba01000000b0021b90bd28d2so3759281wrg.14
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 04:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gysJ5OLsHMu4TIG7j1vcOsFr+CV/gmdUfz5sTZsCQeI=;
 b=KMx43zTF2eH+BbfUhc0Vl2C/8Yu6KNlXQ8ZMcEUL5GpXRr9W03bglTG/53LkbfvUmK
 965lAC6b/suTwhyBPIIKB9XRaygNkCM6Sh91acZLqzu/73qXYazUZxvrCRaE9QsKLOcA
 UEnltWUyUUHOnivdu0Wn612nimn/0/hNhS8PNeleGttQPMaxRUAOtZZVdH21RsrF+OrC
 NhiZOUUuFBJHx9q6GT7pD0rU4L/pZugcQAp8Z5j9Q5A3KklpWi9MSD/4WiCu+nolRvcH
 v/CGrd/eLPXdy7Lhq0i06xPj63NC+HI+l+5vA9keJjCKGuCq+sNs0xsaJugng9xzNL33
 oaag==
X-Gm-Message-State: AJIora+M3vLtW8/yCDrecpgNmCnjK+5pp2fhciLLefz8Rpz83UD9Nhqo
 zAQhuX5uWjsdn1SNWegILBLY6+W2q3jEgWf9vjcYEXBBNK/ncLfUbGnubcb9sa7J8TFn4wOe+qi
 J8M9qbhQtef76Cm+6LpxHAhVyjVx3
X-Received: by 2002:a5d:6288:0:b0:21d:6c75:82 with SMTP id
 k8-20020a5d6288000000b0021d6c750082mr2870474wru.218.1657279582259; 
 Fri, 08 Jul 2022 04:26:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tMgQ+oLwIiDj4/5npv648AeUcMBCTGWDC+qeOo4nVAZAd5xF+qI9gwsPYGbFe8dDYrww+5UA==
X-Received: by 2002:a5d:6288:0:b0:21d:6c75:82 with SMTP id
 k8-20020a5d6288000000b0021d6c750082mr2870444wru.218.1657279582045; 
 Fri, 08 Jul 2022 04:26:22 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:6300:c44f:789a:59b5:91e9?
 (p200300cbc7026300c44f789a59b591e9.dip0.t-ipconnect.de.
 [2003:cb:c702:6300:c44f:789a:59b5:91e9])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a05600c4e1200b003a2d47d3051sm2145967wmq.41.2022.07.08.04.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 04:26:21 -0700 (PDT)
Message-ID: <eddef4be-9c7b-78ae-7cb4-6dda7e20195c@redhat.com>
Date: Fri, 8 Jul 2022 13:26:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 01/15] mm: rename is_pinnable_pages to
 is_longterm_pinnable_pages
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220707190349.9778-1-alex.sierra@amd.com>
 <20220707190349.9778-2-alex.sierra@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220707190349.9778-2-alex.sierra@amd.com>
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
> is_pinnable_page() and folio_is_pinnable() were renamed to
> is_longterm_pinnable_page() and folio_is_longterm_pinnable()
> respectively. These functions are used in the FOLL_LONGTERM flag
> context.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  include/linux/mm.h | 8 ++++----
>  mm/gup.c           | 4 ++--
>  mm/gup_test.c      | 2 +-
>  mm/hugetlb.c       | 2 +-
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb

