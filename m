Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2701560C29
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 00:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FD310E3B7;
	Wed, 29 Jun 2022 22:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D6610E3B7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 22:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656540910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JfIp4/8d6FKNViDaImkd8XOnHcFGT6GmiXjgK1Qhx+g=;
 b=Cla+XRC2CGYt5+grjuInG8UO4kN3Cr2T6gD1i1maS231r1u3tHzDMQ28WY8Bz83wJrRat+
 bs8gmL9VnGMTVDJzDKLWZ5weHWc6HwiA645pmvrQawIeGx+9ivaXce6EMWV43BZi8XSRbg
 sIam1t8N5iQGTcRYRfPTe4P6DtfKBaw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-wCnHeH1INFuKlYODTTYdhQ-1; Wed, 29 Jun 2022 18:15:09 -0400
X-MC-Unique: wCnHeH1INFuKlYODTTYdhQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 83-20020a1c0256000000b003a03f8cc1acso380246wmc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 15:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JfIp4/8d6FKNViDaImkd8XOnHcFGT6GmiXjgK1Qhx+g=;
 b=xaSd2U++XQ2mRV6biWn4v3bi66Cvt20yUUh32vhlFupxVu3QvIjVM9vb5NZ7awq58T
 wcmdo99gmu7GO1N94XTsXksZ37xrzqjHx8eylTdS/0Hi/SIkRrN1Q8RJrCO/Ob+L9ncn
 oO32jNi0BEqW/1NI8H0cOyNwMlkDBst2YWgK7+F1UMy3DgcU+iLKNSlPknrFo0vrONrB
 gct5sJluM4AWc2n5/ImQPdqaJud2QTHpUezaqZUaMat4Av9xkhrmE+3fFkyrYERrwz5m
 QnNWbbDYNAbioJJOA6mzEvLchJUdaioKWw7l9FlCDJwMoBPbwz5/Szbbz3PtMwSsEHPI
 qjmQ==
X-Gm-Message-State: AJIora/ZXtlgVys1k58IREc5ysEAbK+kUX1NgnxalKenWYuCd20NIeCE
 m3dBU82Fhic75EDmzKMjtWr/J81S02RsobYfJeyNVD2J5QAnESQ3W8i2hwZ2zw0CWNNnX+f/z15
 nAFoP2meuO4mYz/7vi3qWNoP/WKS4
X-Received: by 2002:a5d:5481:0:b0:21a:3573:def0 with SMTP id
 h1-20020a5d5481000000b0021a3573def0mr5049192wrv.28.1656540908360; 
 Wed, 29 Jun 2022 15:15:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t5fcdInM+cviZFvBrEBaCvHGKr28RaqkJjmjlhZihtB4ptS3bDvlPUJ4iGFvCByQR4VNIvKw==
X-Received: by 2002:a5d:5481:0:b0:21a:3573:def0 with SMTP id
 h1-20020a5d5481000000b0021a3573def0mr5049172wrv.28.1656540908120; 
 Wed, 29 Jun 2022 15:15:08 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:e600:d4fa:af4b:d7b6:20df?
 (p200300cbc708e600d4faaf4bd7b620df.dip0.t-ipconnect.de.
 [2003:cb:c708:e600:d4fa:af4b:d7b6:20df])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a5d5954000000b0020fcaba73bcsm17891932wri.104.2022.06.29.15.15.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 15:15:07 -0700 (PDT)
Message-ID: <49315889-96de-8e41-f8ee-dd5b33c5e1db@redhat.com>
Date: Thu, 30 Jun 2022 00:15:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 01/14] mm: rename is_pinnable_pages to
 is_pinnable_longterm_pages
To: Felix Kuehling <felix.kuehling@amd.com>, Alex Sierra
 <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220629035426.20013-1-alex.sierra@amd.com>
 <20220629035426.20013-2-alex.sierra@amd.com>
 <f00f9c93-c115-d222-dc8c-11493ccd2567@redhat.com>
 <575b48a6-e372-acda-9a7c-449f307a588c@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <575b48a6-e372-acda-9a7c-449f307a588c@amd.com>
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
Cc: rcampbell@nvidia.com, willy@infradead.org, apopple@nvidia.com,
 dri-devel@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30.06.22 00:08, Felix Kuehling wrote:
> On 2022-06-29 03:33, David Hildenbrand wrote:
>> On 29.06.22 05:54, Alex Sierra wrote:
>>> is_pinnable_page() and folio_is_pinnable() were renamed to
>>> is_longterm_pinnable_page() and folio_is_longterm_pinnable()
>>> respectively. These functions are used in the FOLL_LONGTERM flag
>>> context.
>> Subject talks about "*_pages"
>>
>>
>> Can you elaborate why the move from mm.h to memremap.h is justified?
> 
> Patch 2 adds is_device_coherent_page in memremap.h and updates 
> is_longterm_pinnable_page to call is_device_coherent_page. memremap.h 
> cannot include mm.h because it is itself included by mm.h. So the choice 
> was to move is_longterm_pinnable_page to memremap.h, or move 
> is_device_coherent_page and all its dependencies to mm.h. The latter 
> would have been a bigger change.

I really don't think something mm generic that compiles without
ZONE_DEVICE belongs into memremap.h. Please find a cleaner way to get
this done.

-- 
Thanks,

David / dhildenb

