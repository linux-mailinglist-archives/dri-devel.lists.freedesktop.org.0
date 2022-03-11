Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFB14D5E1F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 10:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2B210E67F;
	Fri, 11 Mar 2022 09:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C466410E68A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 09:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646990172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EIGdPHjLg1hmetspOZdQaeJznczctW/NKNGy6+DAXDs=;
 b=UcdtxkZ0nU42xs84wkXeSqg5hsVAQXU72Gq9cdh0/yPjEKwptiEYktQ7KzWtuM1O+8JB6/
 4NHIYaQVafr0A675JjCIO7KYOLp4Rct/gdNoKg3u5xmjBoAr5Cee7OVQ/TNkbJYXkG4v/M
 MJwrXiljYtN1upzhsYAWme594iKu8UY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-yWt1kxizN8qGmaegpZ5DIQ-1; Fri, 11 Mar 2022 04:16:11 -0500
X-MC-Unique: yWt1kxizN8qGmaegpZ5DIQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 z1-20020adfec81000000b001f1f7e7ec99so2596310wrn.17
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 01:16:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=EIGdPHjLg1hmetspOZdQaeJznczctW/NKNGy6+DAXDs=;
 b=6iyhxY7EEYv3CkmYNMfaTAxSsFgEtCnK9VYuFGPsNphiOR4Cs7GfF+IlDuoCI5s3v6
 odswrLvT7tYolxzCyvbb8qUKOfyOvHU6cGgi12UvaMy953GomiMGSiTbgfudeESDFciW
 D4my1j1Wv0fTmO/wcXzG7QF4DAlcGYl9Lq0RJQIFOetdyMGFGNUxUiJB4omsqaHF/LjW
 AfHzgnSJgk8xNdmXysi0c7Eg2yE3lSKIGphN59klAoevDlWTAhgvaay1FHj5QtTrmxA+
 BCqQRMe4rdSF4tdPGlewuKf2+UAycPsIe/SgqnHVZ2s/f/Td+EqFoC5BhiO7igK/thrt
 uviQ==
X-Gm-Message-State: AOAM532LkmXSS/3HywVBUoKvuo+oBPWDWqV5TMWIImIbPVI2bCdP3Cgg
 A2MSV2REDYMSZ3Ff/Xf+VHZSW3R1NdQEZhwk6wVXZ6P62YG0mYOWw+W5JJT1vQKGFPcG2W/H+im
 Akw2AbQkgs2lDARH85aEY0hB1mjqx
X-Received: by 2002:a05:600c:4f0e:b0:389:eb27:581f with SMTP id
 l14-20020a05600c4f0e00b00389eb27581fmr2193333wmq.132.1646990169866; 
 Fri, 11 Mar 2022 01:16:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz66GE36RKglM3amxTnbF4SO/2NAriOwP++GkZh2LKs8fqberByaO4MYMTDcE67f9+yx5ejJw==
X-Received: by 2002:a05:600c:4f0e:b0:389:eb27:581f with SMTP id
 l14-20020a05600c4f0e00b00389eb27581fmr2193321wmq.132.1646990169610; 
 Fri, 11 Mar 2022 01:16:09 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:8200:163d:7a08:6e61:87a5?
 (p200300cbc7078200163d7a086e6187a5.dip0.t-ipconnect.de.
 [2003:cb:c707:8200:163d:7a08:6e61:87a5])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a05600c068800b00389bdc8c8c2sm6270654wmn.12.2022.03.11.01.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 01:16:09 -0800 (PST)
Message-ID: <07401a0a-6878-6af2-f663-9f0c3c1d88e5@redhat.com>
Date: Fri, 11 Mar 2022 10:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220310172633.9151-1-alex.sierra@amd.com>
 <20220310172633.9151-2-alex.sierra@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 1/3] mm: split vm_normal_pages for LRU and non-LRU
 handling
In-Reply-To: <20220310172633.9151-2-alex.sierra@amd.com>
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

On 10.03.22 18:26, Alex Sierra wrote:
> DEVICE_COHERENT pages introduce a subtle distinction in the way
> "normal" pages can be used by various callers throughout the kernel.
> They behave like normal pages for purposes of mapping in CPU page
> tables, and for COW. But they do not support LRU lists, NUMA
> migration or THP. Therefore we split vm_normal_page into two
> functions vm_normal_any_page and vm_normal_lru_page. The latter will
> only return pages that can be put on an LRU list and that support
> NUMA migration, KSM and THP.
> 
> We also introduced a FOLL_LRU flag that adds the same behaviour to
> follow_page and related APIs, to allow callers to specify that they
> expect to put pages on an LRU list.
> 

I still don't see the need for s/vm_normal_page/vm_normal_any_page/. And
as this patch is dominated by that change, I'd suggest (again) to just
drop it as I don't see any value of that renaming. No specifier implies any.

The general idea of this change LGTM.


I wonder how this interacts with the actual DEVICE_COHERENT coherent
series. Is this a preparation? Should it be part of the DEVICE_COHERENT
series?

IOW, should this patch start with

"With DEVICE_COHERENT, we'll soon have vm_normal_pages() return
device-managed anonymous pages that are not LRU pages. Although they
behave like normal pages for purposes of mapping in CPU page, and for
COW, they do not support LRU lists, NUMA migration or THP. [...]"

But then, I'm confused by patch 2 and 3, because it feels more like we'd
already have DEVICE_COHERENT then ("hmm_is_coherent_type").


-- 
Thanks,

David / dhildenb

