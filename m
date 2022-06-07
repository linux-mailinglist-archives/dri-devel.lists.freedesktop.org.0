Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F2253FF8B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 14:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F1810EDED;
	Tue,  7 Jun 2022 12:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE4810EDED
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 12:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654606659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4QSRH8DM0EWIFp4tvv53kVC06dJu/u/EgMkz7xegTNs=;
 b=IlfHaANbAfeu4tHp+sErIt4woPcYRu6h6I71aKbtmUlbpmW6QfLLNFa7dFgg5Zk2uKttLZ
 j5qmqfZNkwAxuTU7zM20xwkdT0Xlo76+cAsNXtuJFOJzOGpzBupylmtTTAP4oMbcw8Yfbp
 Xd47FZhQdtW6S4b5UlME2R2GGkvizSk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-lAfjrvu1PfGQqh4Y0q8Xsw-1; Tue, 07 Jun 2022 08:57:35 -0400
X-MC-Unique: lAfjrvu1PfGQqh4Y0q8Xsw-1
Received: by mail-wr1-f70.google.com with SMTP id
 q14-20020a5d61ce000000b00210353e32b0so3860497wrv.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 05:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4QSRH8DM0EWIFp4tvv53kVC06dJu/u/EgMkz7xegTNs=;
 b=WrEJ6TwnU6j9wtGO1tPVWviWkXql0E2Rr06BnjzlA00woRnZZy8993yEgOXGqTR/zR
 arQkOh6H0b8uYmhgRkPWCrlFKO1QxOGPSWYFXlRREPgm0qJpB5KAA71n2seutA9q1MuK
 GBXyfdQr3B02KngEtE2wHMdjc+e/2PQXjh4wSQzu0rl4jD9g2DNcLlncelOPi6CV/5DA
 rF307O9GGmo9UdSqtICETWttOcawc6RbWtLtTYRiEfMrMwvLdH5mREO8DUQoDbJ/OlK0
 3ULd4YRAjNv5JqxVPV0yBzuvNPKFXPbokQRnXz1a2heXNYO4/KcQ2V4IDRtKMoYkCGVj
 NIcA==
X-Gm-Message-State: AOAM531seO/5F6iZgtnN73U0zlh+MmhqfJ4eAPrJKfxdRm8ybio8fpp0
 gDYK14QeSN1khlj7AxawXTUCyx7gGWRPZoeb3Fz5mDY4etmV+uI61krRplnsKIpSYVAjkFle1bL
 cX+JYykaUpC3PvTQJPeZ9K0Pvc5Uf
X-Received: by 2002:a05:600c:4f90:b0:397:89b1:539b with SMTP id
 n16-20020a05600c4f9000b0039789b1539bmr54389412wmq.149.1654606654443; 
 Tue, 07 Jun 2022 05:57:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUkMuPhmF8WVpmZThM74o1w4iOAEeqbYNAVijCPByVKvmwU21f0ZJXPf9IJ4t1pum0BoCPxA==
X-Received: by 2002:a05:600c:4f90:b0:397:89b1:539b with SMTP id
 n16-20020a05600c4f9000b0039789b1539bmr54389386wmq.149.1654606654169; 
 Tue, 07 Jun 2022 05:57:34 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:500:4c8d:4886:f874:7b6f?
 (p200300cbc70905004c8d4886f8747b6f.dip0.t-ipconnect.de.
 [2003:cb:c709:500:4c8d:4886:f874:7b6f])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a7bc5d4000000b0039aef592ca0sm20181432wmk.35.2022.06.07.05.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 05:57:33 -0700 (PDT)
Message-ID: <11e5905b-f3a9-dced-d5dc-1446a3334f7f@redhat.com>
Date: Tue, 7 Jun 2022 14:57:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/3] mm/page_alloc: use might_alloc()
To: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>
References: <20220605152539.3196045-1-daniel.vetter@ffwll.ch>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220605152539.3196045-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05.06.22 17:25, Daniel Vetter wrote:
> ... instead of open codding it. Completely equivalent code, just
> a notch more meaningful when reading.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> ---
>  mm/page_alloc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 2db95780e003..277774d170cb 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -5177,10 +5177,7 @@ static inline bool prepare_alloc_pages(gfp_t gfp_mask, unsigned int order,
>  			*alloc_flags |= ALLOC_CPUSET;
>  	}
>  
> -	fs_reclaim_acquire(gfp_mask);
> -	fs_reclaim_release(gfp_mask);
> -
> -	might_sleep_if(gfp_mask & __GFP_DIRECT_RECLAIM);
> +	might_alloc(gfp_mask);
>  
>  	if (should_fail_alloc_page(gfp_mask, order))
>  		return false;

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

