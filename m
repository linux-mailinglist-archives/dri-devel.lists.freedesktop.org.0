Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B04680EB4C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 13:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BAE10E5A8;
	Tue, 12 Dec 2023 12:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DCD10E5A8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 12:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702383324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ok0j17sWl34iTt5R96Y0m5SXIpdY1mUaWICyl+YWWJg=;
 b=WUaM3Do0bw6+qsNh8kmLlhEfL8zI7VOiCTortQkzT7oxwXhMRCtZ+Om8GKVBUre6O8tMpm
 OLdsF2UNDZgY/zWdpbeKPqv+fw0KUGF7BdYR5I7VJcSshERE4+CB3sfJ0jDHbEXl6FItTg
 UBfTE3vBLeMIfvuPh0JHWP4/YSm++v4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-Vpua9aafNR-3iHebaL1rFw-1; Tue, 12 Dec 2023 07:15:23 -0500
X-MC-Unique: Vpua9aafNR-3iHebaL1rFw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40c27a351e2so36135365e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 04:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702383322; x=1702988122;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ok0j17sWl34iTt5R96Y0m5SXIpdY1mUaWICyl+YWWJg=;
 b=AuLeEv7GLNYdzSGGT+tJPpTJCbPXxCTljGVOKCRMfBzo5eButUdEBn9p7cjevsmiJ1
 FNIsWU8YgJrGaelIVX1gVi67tY6oIiaLm4Cz9X5c9Xdv+ETbRxy/uqVLECqfMCZRA5B1
 ZiDvRsgN7xjoQJnNQYUPfCJzXuFxvskAjnQRCXdO8FMHaq6xpI8Ccmz2v2JEGQvefwDP
 zoJeqxSrK1B2BG6UKSa2oQ3yVp1C6aUr/rQ0FH/KDS/50SU0h6e0WFfHzhHrSkpQFEd2
 tn/m692nkCLcWJocv5qwj4Z22VhPETLnokiEbb/M0mnbvt3ckqPz4W/UPRv6WDWZrulL
 Sm2g==
X-Gm-Message-State: AOJu0YwGDmaR9HmIdMWBObATqqzYQ0g/y9ttUGJMJcorLb9rvTGe+OdK
 uV5kpUGt3R0bZXQ+f6XBAKTCVNAw4xaAC3TPZ7cB/tHlQyPvsCdAJvXVx2CvA6BRaRBQYRpgxj/
 ckJp8LyuwazAqourhaX+iSs0Nx+FL
X-Received: by 2002:a05:600c:3556:b0:40b:5e1c:2f9c with SMTP id
 i22-20020a05600c355600b0040b5e1c2f9cmr1714951wmq.44.1702383322690; 
 Tue, 12 Dec 2023 04:15:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyMX7CfRyk2WiXHjyT3u4xSlubF4VIdHX7Wnc2j5q5/IfMTnUNuAMWHEEQHcg+B8Q6+eT3gQ==
X-Received: by 2002:a05:600c:3556:b0:40b:5e1c:2f9c with SMTP id
 i22-20020a05600c355600b0040b5e1c2f9cmr1714943wmq.44.1702383322292; 
 Tue, 12 Dec 2023 04:15:22 -0800 (PST)
Received: from ?IPV6:2003:cb:c74b:ca00:4ca2:ff2c:9092:f070?
 (p200300cbc74bca004ca2ff2c9092f070.dip0.t-ipconnect.de.
 [2003:cb:c74b:ca00:4ca2:ff2c:9092:f070])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b00405959469afsm16528751wmq.3.2023.12.12.04.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 04:15:21 -0800 (PST)
Message-ID: <9a5584df-23df-4a3c-a6a5-fd1554250b0d@redhat.com>
Date: Tue, 12 Dec 2023 13:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios (v7)
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
References: <20231212073803.3233055-1-vivek.kasireddy@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20231212073803.3233055-1-vivek.kasireddy@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 Christoph Hellwig <hch@infradead.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Junxiao Chang <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.12.23 08:37, Vivek Kasireddy wrote:
> The first two patches were previously reviewed but not yet merged.
> These ones need to be merged first as the fourth patch depends on
> the changes introduced in them and they also fix bugs seen in
> very specific scenarios (running Qemu with hugetlb=on, blob=true
> and rebooting guest VM).
> 
> The third patch introduces memfd_pin_folios() API and the fourth
> patch converts udmabuf driver to use folios. The fifth patch shows
> how the udmabuf driver can make use of the new API to longterm-pin
> the folios. The last patch adds two new udmabuf selftests to verify
> data coherency after potential page migration.
> 

We should probably get started with the first two patches, they are
independent of the remaining discussion regarding memfd_pin_folios().

-- 
Cheers,

David / dhildenb

