Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7835704E1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 16:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BF28E9A2;
	Mon, 11 Jul 2022 14:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43918E99B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 14:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657548060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=th2buvr24d07qJGzIS/AKju5zI095zK3996wlFgRrAE=;
 b=UzYqXImoTryqVmnH9ulqx1t2YJDWqFffzeUwirRhSErQzBBhMOZ0a7Xr+cMp568rMHyCR3
 vv2LTIuzjdLSUS3+RjgRbH4g40NCsAp3BpSV3jdZp2kaMiTUUH34cEAkABlJrUiO68dBa0
 8ADiQpYmeZzu2nZXRCDfdL8/jgjwY5E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-O41mvVYwNbSFLciKPoft3A-1; Mon, 11 Jul 2022 10:00:57 -0400
X-MC-Unique: O41mvVYwNbSFLciKPoft3A-1
Received: by mail-wm1-f70.google.com with SMTP id
 a6-20020a05600c348600b003a2d72b7a15so5260484wmq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 07:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=th2buvr24d07qJGzIS/AKju5zI095zK3996wlFgRrAE=;
 b=lTFHK1eWdTbzF23CsoRqsZHjYMhYfGEvUwqWy6BVpmSHJEiXWTzfoh+8p78PPl6EAr
 70d/rc/N6c6CfEKp/Tm1jC+T1qTBHVaG2zW+pRiVkeuCnl6mibaqtQcwE+pln3F37DxV
 GWWMkgTTn3c8UmSKzGorM0hZB0M+oqhRuE+YCirLzW7himsgolT4p3AFHlT/TKY7jrSe
 dxXt3o2gtYYtUFj5WyUV64tmDQ/jhX+FmHeXfyU3mumSN/ceyeN9BXNhSkEh7GDAtwli
 0rfas+d/ITqYpIQf8r9FfhiKTsjwIA0VGf5wPiLZFQGtYYIjHoeKGPWiJIkYOybt73Z3
 MmUA==
X-Gm-Message-State: AJIora9nwefoyjaFpaF0mqHOlXcfQ9byLLiMqMQ6NKAyi+AeFFKY9Fmt
 lhA80K6PA9j2gvXbuk/lrDLv6Uwl6FTrWKNZ8OGuUeeKp7qBZike1t+npmxK4+dx6iA2Pe0C89g
 jTL5oIg6JYuHj9S/ou4DsCDIVogrs
X-Received: by 2002:a5d:6dab:0:b0:21d:9fc8:3029 with SMTP id
 u11-20020a5d6dab000000b0021d9fc83029mr8016761wrs.172.1657548056027; 
 Mon, 11 Jul 2022 07:00:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tHUpdQt0jOB6/Le/88y5FMlWl7A0VwJVjWJ8qwyFnogYLhO4qiJJpxW2UhqlLHOVvPkjmbsQ==
X-Received: by 2002:a5d:6dab:0:b0:21d:9fc8:3029 with SMTP id
 u11-20020a5d6dab000000b0021d9fc83029mr8016733wrs.172.1657548055721; 
 Mon, 11 Jul 2022 07:00:55 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:1400:c3:4ae0:6d5c:1ab2?
 (p200300cbc702140000c34ae06d5c1ab2.dip0.t-ipconnect.de.
 [2003:cb:c702:1400:c3:4ae0:6d5c:1ab2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c4e8c00b003a2cf17a894sm11063409wmq.41.2022.07.11.07.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 07:00:55 -0700 (PDT)
Message-ID: <4b2f9a61-ca67-6a34-41c9-c191cac756b3@redhat.com>
Date: Mon, 11 Jul 2022 16:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 07/15] mm/gup: migrate device coherent pages when
 pinning instead of failing
To: Matthew Wilcox <willy@infradead.org>
References: <20220707190349.9778-1-alex.sierra@amd.com>
 <20220707190349.9778-8-alex.sierra@amd.com>
 <2c4dd559-4fa9-f874-934f-d6b674543d0f@redhat.com>
 <Ysws7LOirtQ07JG/@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Ysws7LOirtQ07JG/@casper.infradead.org>
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.07.22 16:00, Matthew Wilcox wrote:
> On Mon, Jul 11, 2022 at 03:35:42PM +0200, David Hildenbrand wrote:
>>> +		/*
>>> +		 * Device coherent pages are managed by a driver and should not
>>> +		 * be pinned indefinitely as it prevents the driver moving the
>>> +		 * page. So when trying to pin with FOLL_LONGTERM instead try
>>> +		 * to migrate the page out of device memory.
>>> +		 */
>>> +		if (folio_is_device_coherent(folio)) {
>>> +			WARN_ON_ONCE(PageCompound(&folio->page));
>>
>> Maybe that belongs into migrate_device_page()?
> 
> ... and should be simply WARN_ON_ONCE(folio_test_large(folio)).
> No need to go converting it back into a page in order to test things
> that can't possibly be true.
> 

Good point.

-- 
Thanks,

David / dhildenb

