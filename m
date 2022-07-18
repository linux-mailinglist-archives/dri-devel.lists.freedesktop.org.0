Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64368578030
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 12:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38BD14BFA0;
	Mon, 18 Jul 2022 10:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE30218B9B7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658141487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQ3EHE5Y/uXmTBk59WY/sBfkyYOaAyrJ99vyQlUJOsY=;
 b=KtnHMQ45H6fUTApqJwQks4id7VGvoA60j+53ASM+EkgRLuiDz+S/mgikM2b2Jifu72jhmU
 WKTSPM3Vg+PYvCqgxkwJ2M0NSZvfQCB3uwVG3eB3UK7TO8sygSGBDC14khGRFGLC3GLQhe
 egm5yHoMlfMTr3t+MBDGvflqEHJfbvk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-VVlGv9RtNImm8BDE7BUGJg-1; Mon, 18 Jul 2022 06:51:26 -0400
X-MC-Unique: VVlGv9RtNImm8BDE7BUGJg-1
Received: by mail-wm1-f69.google.com with SMTP id
 a18-20020a05600c225200b003a30355c0feso3811229wmm.6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 03:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QQ3EHE5Y/uXmTBk59WY/sBfkyYOaAyrJ99vyQlUJOsY=;
 b=tOjtK7v3DCTFkib/I2d4k/WjPcLHAuuPIMGhP3jAwWAby1u2/gqyu8i2ybqwwQCkDc
 91AgtsWQURBAa1dasQUy54x6e4wKja/BoFTb6ARbF2mfvN8+fPFtZX90mYfItwdMe7wJ
 BF/UafNNCA/lYBd2r9wBaHUkBFzpa6rup14J/QtpRAqPLTmyBYjbvgvebzZ7R5G8UCLn
 1GeOlQGByFWFdXFQGkEAJ0m2zmWu+y0MdN9AAwEYfrMz8ryCh3/sPs405ZOFaIrFcQ/H
 bkojEXprMqIb4dVBtwiBpodoaEwXDbBTI/NDrPvfjHgtZKv5ahPPYvUvvZ/zOJauVWWm
 YZ/w==
X-Gm-Message-State: AJIora+VYVNKShM5cVTTqB2BIvOupNkruFKDmJy7zKwX4A0dWyMSbcRU
 OAEe6Fi0WoW+p0f6Pc3O/a9hnnU43JXjJpKiR4fJSGr/x0S7urEq5Rwxc7BuUatzoDQSek7zl+6
 eEDbpfydt1ysx2iz3mbfM8jEMtk4p
X-Received: by 2002:adf:f905:0:b0:21d:f460:1acf with SMTP id
 b5-20020adff905000000b0021df4601acfmr7759825wrr.108.1658141485569; 
 Mon, 18 Jul 2022 03:51:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vOXS/jyYuLht99baWDw+JXGFOCaonutnGNWmhXXtQ2efKyLTqtTuwadUZoGMqOmdhX/IMMMw==
X-Received: by 2002:adf:f905:0:b0:21d:f460:1acf with SMTP id
 b5-20020adff905000000b0021df4601acfmr7759740wrr.108.1658141484280; 
 Mon, 18 Jul 2022 03:51:24 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:7400:6b3a:a74a:bd53:a018?
 (p200300cbc70574006b3aa74abd53a018.dip0.t-ipconnect.de.
 [2003:cb:c705:7400:6b3a:a74a:bd53:a018])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003a033177655sm21076465wmp.29.2022.07.18.03.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 03:51:23 -0700 (PDT)
Message-ID: <95b3c8f3-2e4d-fa2f-1552-580236eea485@redhat.com>
Date: Mon, 18 Jul 2022 12:51:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9 04/14] mm: handling Non-LRU pages returned by
 vm_normal_pages
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220715150521.18165-1-alex.sierra@amd.com>
 <20220715150521.18165-5-alex.sierra@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220715150521.18165-5-alex.sierra@amd.com>
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
> With DEVICE_COHERENT, we'll soon have vm_normal_pages() return
> device-managed anonymous pages that are not LRU pages. Although they
> behave like normal pages for purposes of mapping in CPU page, and for
> COW. They do not support LRU lists, NUMA migration or THP.
> 
> Callers to follow_page() currently don't expect ZONE_DEVICE pages,
> however, with DEVICE_COHERENT we might now return ZONE_DEVICE. Check
> for ZONE_DEVICE pages in applicable users of follow_page() as well.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com> (v2)
> Reviewed-by: Alistair Popple <apopple@nvidia.com> (v6)
>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

