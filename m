Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A768655C052
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 12:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80689113B70;
	Tue, 28 Jun 2022 10:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275B212B2F9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 10:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656412906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8pRM3r8AeF6GLv7Aybx1vUx/f9NMkwqu6LnYZ6evvqI=;
 b=FEMCP5UHCqHS8JYmq5HoEAt39H2O2l/LOpmdOwaP9xRZ5yhd40Q9Mi5FM1DMoWnQamlhKd
 1/U2CErYXB4IKtY0yd6kPeljNITwtDHvw/3L+ar8N0ux+lAUnon95Zkdk8oalXsd2SVQyq
 3rkg/U6QJsn5epK3C7lzMcbUnjfm+pM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-EY6CGaOBN-ejFniPS9h6zQ-1; Tue, 28 Jun 2022 06:41:44 -0400
X-MC-Unique: EY6CGaOBN-ejFniPS9h6zQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 t13-20020adfe10d000000b0021bae3def1eso1696267wrz.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 03:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8pRM3r8AeF6GLv7Aybx1vUx/f9NMkwqu6LnYZ6evvqI=;
 b=cWkDfHXwyK0rO/WW4T3unlRuiYq3OQhyF+EwEZXY+KC/eOHwq2xmhoNUbEysNdF5Jm
 eIvVjS4geRVWdP9s8TVP0ytE/L0NamNbhRm9IGDldpwshPYgzgNYcibHxZiZxcL27IzG
 6A2AR2zccxcLXX94pc2vP/vQXfIel5r/chDNmrhX879ZKzfpzE5iqpcq3F3YHLPuKShK
 ULdMlCPQSnUS/2oSG1l47oZEfL/YCrDPk2/fu2M1mJkiP5WHcMkdlybZId7aMg0f27mC
 bqsRg5QdkOSwZetqVhQ2dgJN7t9zQd/JDKulDVEcoU9GEvHwEN05xSjfZoHOaph0EcIp
 7iNg==
X-Gm-Message-State: AJIora/s1wA3R/0sY5mff2jfErFNgxTvs7lP99RghNo7O91UuObuX0Wx
 OfZqWrXN1tMLVrYucJhuqBZyRgmU/IYlJR0Sa9SuiZbGNRBf20QXpJeb+EGLG+mz+OB7gmVFSJd
 VAWxll6+1pddzQvXhBMJrcPPECwkO
X-Received: by 2002:a05:6000:3c6:b0:21b:9d00:db29 with SMTP id
 b6-20020a05600003c600b0021b9d00db29mr17371383wrg.338.1656412903687; 
 Tue, 28 Jun 2022 03:41:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vrjQcjOOWZyri2deV7Hh8adDyK403V4lqaRVOfb8p/+5njBKdZBau0GhQDi3asydV8iTuiRw==
X-Received: by 2002:a05:6000:3c6:b0:21b:9d00:db29 with SMTP id
 b6-20020a05600003c600b0021b9d00db29mr17371350wrg.338.1656412903411; 
 Tue, 28 Jun 2022 03:41:43 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:a00:46df:e778:456a:8d6b?
 (p200300cbc7090a0046dfe778456a8d6b.dip0.t-ipconnect.de.
 [2003:cb:c709:a00:46df:e778:456a:8d6b])
 by smtp.gmail.com with ESMTPSA id
 q13-20020adfcd8d000000b00219b391c2d2sm15851990wrj.36.2022.06.28.03.41.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 03:41:42 -0700 (PDT)
Message-ID: <336094c6-0c94-2b43-5472-c44638e8446a@redhat.com>
Date: Tue, 28 Jun 2022 12:41:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 06/14] mm: add device coherent checker to
 is_pinnable_page
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220628001454.3503-1-alex.sierra@amd.com>
 <20220628001454.3503-7-alex.sierra@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220628001454.3503-7-alex.sierra@amd.com>
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

On 28.06.22 02:14, Alex Sierra wrote:
> is_device_coherent checker was added to is_pinnable_page and renamed
> to is_longterm_pinnable_page. The reason is that device coherent
> pages are not supported for longterm pinning.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  include/linux/memremap.h | 25 +++++++++++++++++++++++++
>  include/linux/mm.h       | 24 ------------------------
>  mm/gup.c                 |  5 ++---
>  mm/gup_test.c            |  4 ++--
>  mm/hugetlb.c             |  2 +-
>  5 files changed, 30 insertions(+), 30 deletions(-)


Rename of the function should be a separate cleanup patch before any
other changes, and the remaining change should be squashed into patch
#1, to logically make sense, because it still states "no one should be
allowed to pin such memory so that it can always be evicted."

Or am I missing something?

-- 
Thanks,

David / dhildenb

