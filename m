Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CD655C054
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 12:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBDC12B6CB;
	Tue, 28 Jun 2022 10:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E450812B66A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656412973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ONUUHv3MjjvFIJKVWzF/NPSOZ8SZcSjCl83bnjLd8nk=;
 b=eha/kchIuy7SQWLk+P4dBWc68NtxG169x9RJrDjtxWfdkkI70F4+CET/pK7oisrcBx6yOs
 40CVOZJEbrGSisZ/NYuqSoSD8X4gaylEsv1Zlkk5f8V/HCIdcdT5OLuLUcCQXN2Ct9DRQf
 SsjAeZywB3bPOzin77SChhm1p0Dg9dM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-Wn0VlptTPJy0QLSOFNYwPw-1; Tue, 28 Jun 2022 06:42:49 -0400
X-MC-Unique: Wn0VlptTPJy0QLSOFNYwPw-1
Received: by mail-wr1-f69.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so1698389wra.15
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 03:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ONUUHv3MjjvFIJKVWzF/NPSOZ8SZcSjCl83bnjLd8nk=;
 b=nlz8I3mjr2fJKknKfpW5ebmmhkKIJrGIrwN679LZXl42AL+BTuTdZQNcB8jRpX3u4M
 gRiaY+EOu0cjTHJsActlonkK5gL163bLRywG+Ll6kG4btL+9TBX8ojH0dcUa8+RJQ09q
 d9fHv1QPvbtGX3sIcfobBtQFGab90koID+pKnsJEfdwiN+FvhZrQaPpjGrw6XMl91+pn
 ZT95gYnUJarJqA2YF0EZf+9LOoRdvA4QL1BqQU8cKl2oWqMdigRbhM9XBrNlgSOLSsc5
 Yz7cjx4deKDchb6m38tK5iCn1gnmPz+oO+V3VaHCIOBfXoMYnvcm0Fh2Kxh9xEjtNBQI
 6TNg==
X-Gm-Message-State: AJIora9WXTSVP/GZPaPlRSerJPF4GJiJimvoOwaN+eDN+qpdaLjBuvMv
 FeX/tH+I/Yl1Vh4HEX2tMF6LokJcd0hMgLnSryv/1f43Nqe0RbI8VgcTrRZvP+awHWpdFVFQacc
 S18qNdlnuq0DHQY/QDxhrsmoQIEQ3
X-Received: by 2002:a05:600c:1991:b0:39c:88ba:2869 with SMTP id
 t17-20020a05600c199100b0039c88ba2869mr19766108wmq.14.1656412968363; 
 Tue, 28 Jun 2022 03:42:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t89v3kQLLnvmZ+A4VBSjVx4SCynlA5GjVj55ld5GAWdEkQJAn2Ag3b6wuqeEuz7QSmx4Iu0w==
X-Received: by 2002:a05:600c:1991:b0:39c:88ba:2869 with SMTP id
 t17-20020a05600c199100b0039c88ba2869mr19766075wmq.14.1656412968043; 
 Tue, 28 Jun 2022 03:42:48 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:a00:46df:e778:456a:8d6b?
 (p200300cbc7090a0046dfe778456a8d6b.dip0.t-ipconnect.de.
 [2003:cb:c709:a00:46df:e778:456a:8d6b])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a056000018200b002103cfd2fbasm13329363wrx.65.2022.06.28.03.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 03:42:47 -0700 (PDT)
Message-ID: <79a7969c-311f-d36b-4d44-dfe2f02c9b99@redhat.com>
Date: Tue, 28 Jun 2022 12:42:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 02/14] mm: handling Non-LRU pages returned by
 vm_normal_pages
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220628001454.3503-1-alex.sierra@amd.com>
 <20220628001454.3503-3-alex.sierra@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220628001454.3503-3-alex.sierra@amd.com>
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
> With DEVICE_COHERENT, we'll soon have vm_normal_pages() return
> device-managed anonymous pages that are not LRU pages. Although they
> behave like normal pages for purposes of mapping in CPU page, and for
> COW. They do not support LRU lists, NUMA migration or THP.
> 
> We also introduced a FOLL_LRU flag that adds the same behaviour to
> follow_page and related APIs, to allow callers to specify that they
> expect to put pages on an LRU list.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> ---

I think my review feedback regarding FOLL_LRU has been ignored.


-- 
Thanks,

David / dhildenb

