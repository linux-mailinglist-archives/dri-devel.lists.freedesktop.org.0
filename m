Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4675704C5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 15:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492648E93C;
	Mon, 11 Jul 2022 13:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09108E933
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 13:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657547768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aE4NfC1H6uTSXnC9kdw86YADNW6bGnH63De3NmdMle8=;
 b=iwGnZJ5muhnMIngn+p2ClEYU5Y0mKylf0YCvwe1jhIpOOxbDtKy6HkHJWYYiuOimT7XWea
 /ZHoiiYqvOkeJKqU2+jTDL72SneMK6QsmF1y2COf8F+nF38J148WUxznXz6RzDrKIwbiCu
 XUU612GH+kVvhvDkD87iboRYFPgasyM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-VvewC7WoP3Gv1B3DzxIQ_w-1; Mon, 11 Jul 2022 09:56:06 -0400
X-MC-Unique: VvewC7WoP3Gv1B3DzxIQ_w-1
Received: by mail-wm1-f70.google.com with SMTP id
 az38-20020a05600c602600b003a2dff426aeso3915109wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 06:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aE4NfC1H6uTSXnC9kdw86YADNW6bGnH63De3NmdMle8=;
 b=m26HFhx/w0ad7O2Mk1L9MMjxlChqtyFR6DyMvZswrhezYT9qQiqDKg3qqaWjrrm4XK
 87nZ9aTVuIDBmw8MWo1uc5EtD6G5m9a0r8XHSqroSVEBYWMUohao8Qz5IhlVYFO2gltZ
 tEYy/2h83wAoYHM78a8VuGo3CswBSMYkCJ13y3ZrvXi4O2tr2NVjjAyfu4HWT5zbiBa4
 yu2a+9kY5JTsus7vZZKWPh93O4mmPrz2DrJIZicM4wI6W/J5vF80vtyWnKkX5f/+Xq9e
 s3S0p32f2/AdgyRjPiok/EekqfqI+hnEmVV7cSm/g5Yd7yD6c73dBtGjoeUyOtPqaxkA
 5ZRg==
X-Gm-Message-State: AJIora/5z9B1nU2HeeVTFX/A/1Lf9UEu0BrgB6QStUTXbgS3QyIr+23y
 +wtZmNGcAgVH9Gqtx8fOHVouRSWronJbMJgIqltD66dnFYvCaUKw8K+/MAhJg0oyy1omYKhO6/V
 Dv369qnlGf4taVe3HRvQi7063NnBF
X-Received: by 2002:a5d:6e85:0:b0:21d:65ec:22d with SMTP id
 k5-20020a5d6e85000000b0021d65ec022dmr17110878wrz.435.1657547765483; 
 Mon, 11 Jul 2022 06:56:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1twv2L3ZevD/RVvtfPY4LjhC4WGJFMlZ2FQQkXXNrSvlcGGqG7Pzzjip3VPLrNidVEXGx3eVw==
X-Received: by 2002:a5d:6e85:0:b0:21d:65ec:22d with SMTP id
 k5-20020a5d6e85000000b0021d65ec022dmr17110860wrz.435.1657547765208; 
 Mon, 11 Jul 2022 06:56:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:1400:c3:4ae0:6d5c:1ab2?
 (p200300cbc702140000c34ae06d5c1ab2.dip0.t-ipconnect.de.
 [2003:cb:c702:1400:c3:4ae0:6d5c:1ab2])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a05600c359200b003a2e2ba94ecsm5925143wmq.40.2022.07.11.06.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 06:56:04 -0700 (PDT)
Message-ID: <2ff85751-b0b6-eaa6-8338-2bf03ba6e973@redhat.com>
Date: Mon, 11 Jul 2022 15:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 02/15] mm: move page zone helpers into new
 header-specific file
To: Felix Kuehling <felix.kuehling@amd.com>, Alex Sierra
 <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220707190349.9778-1-alex.sierra@amd.com>
 <20220707190349.9778-3-alex.sierra@amd.com>
 <97816c26-d2dd-1102-4a13-fafb0b1a4bc3@redhat.com>
 <715fc1ae-7bd3-5b96-175c-e1cc74920739@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <715fc1ae-7bd3-5b96-175c-e1cc74920739@amd.com>
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

On 08.07.22 23:25, Felix Kuehling wrote:
> On 2022-07-08 07:28, David Hildenbrand wrote:
>> On 07.07.22 21:03, Alex Sierra wrote:
>>> [WHY]
>>> Have a cleaner way to expose all page zone helpers in one header
>> What exactly is a "page zone"? Do you mean a buddy zone as in
>> include/linux/mmzone.h ?
>>
> Zone as in ZONE_DEVICE. Maybe we could extend mmzone.h instead of 

Yes, I think so. And try moving as little as possible in this patch.

> creating page_zone.h? That should work as long as it's OK to include 
> mmzone.h in memremap.h.

I think so.

-- 
Thanks,

David / dhildenb

