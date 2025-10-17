Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89780BE9584
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 16:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6339110E15C;
	Fri, 17 Oct 2025 14:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OruBRzvr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA56510E15C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 14:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760712857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KVg3pi7NpQHtM6ZoxI30PgKBLj0yHkiDuj7fimQcvas=;
 b=OruBRzvrCF8s4wERz0fxZvb3rKQIXCUJ8oqhW/21xcBRe4PS1mDNEni9jF5qGRFal4IZCd
 nFZ+t46hiuEURmQb+3N7KymuTnYnpy1zsgEIq/DGlaevH5rCWoItUr95N0wLdEWJ+OKjS5
 MD7Z4MTCuEKTQVb19mqqbV3DGDpDCh4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-gAVZLrHgPCKCjn4c5Uo71w-1; Fri, 17 Oct 2025 10:54:14 -0400
X-MC-Unique: gAVZLrHgPCKCjn4c5Uo71w-1
X-Mimecast-MFC-AGG-ID: gAVZLrHgPCKCjn4c5Uo71w_1760712853
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-471005f28d2so8889425e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 07:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760712853; x=1761317653;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KVg3pi7NpQHtM6ZoxI30PgKBLj0yHkiDuj7fimQcvas=;
 b=hCgHmRv/sdebTh10hJhTvbRl2+H4hEdYY4syDJPMzzgFpVdToLRmptscoffYv1/OCB
 y1NMVNN4Ylh6lcge337ULZXattgjf3U3hYEgTZEAoojFU+b+Pe9LksTaSVjK1zrTAkyU
 VSVC+RG7G/fL6qI+gcYf3eBfE9qt+NjT4sIa0AsVaeto/bzIAJV0sU7Po/3FK+MVQu26
 wehDSjyONo9uI3LlX+mz1mmckdgKcrMK/l+Kf1/FsRMlmthMMvav2TX3W4e7ozMtsKOV
 uyXq5iGjFHDqR0MLJVkseCTs6IMae89rK7HLM1lBTRcapK8dqa3QvcaHPxUrYz/AuIay
 lqkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/MGwuFstvsE+x9VRvhFWjRENv3om4HcxeGBPbI+SOOD8B/9kydpnOf8p9u7CjHTTFN0BBn65VUkA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx80W/0bDnsAQS6neKtPnoUe8WYi//qlxKbyIOiLt7WCwG6hhCz
 BJHXGZ3NPgM0uvBb9dCSBiVNghjM0c+u1T6edTenV29NFJTZ6qEdj8LMAmfzalxGDIX9gGL/auS
 AMqSsc6vnBtbqth/uDBjiIzqnnaB5eqlQj6Ej4k2FEQMnJYszKGUWTtYi2+3E6w1kQUq9tA==
X-Gm-Gg: ASbGnctpv/eP6plSG/ajo8oo/MpvkNXKGjmyLWs2GEU2b5zcfEy/A0ObSQrnRI41l53
 YiwdvmAtpx7zsrSIsZZnFj5haBj92BRBcIFuWXW4j4Y1aibS3f+ydXuMju3PXkvQtKQo4hTuAQ3
 4TSTz9J27gKCPypgidyyqTtQ7JRMbA849LhcwzMGKo9t1clEDrLYQzCIej3ea9tVkr1uxSidjyY
 YHtyLUvFqYQS3fR1LZ4hIktTa8sE8ir3GTMUM0Bh6zR18N9TEp88Qm/z/l53eUjzm/E3ieXxMF1
 lGSs8TcE+gq7CPfg9Z7M6vd/foJAHOJ5LFeZx5jFSQltHzrNsT+hF/CNxXh1/3EWP3H07piTjJP
 31aHv6nyM79X5UqxpA4JQEe/3jKJKgUEkuMtSrex+j50fZ4cTgZkS6nuzH/VZuCuqRaxbNaUkIQ
 dhhipg5wZqsVFj9kzYu6/t561Z0rQ=
X-Received: by 2002:a05:600c:1d9b:b0:46e:4f25:aace with SMTP id
 5b1f17b1804b1-4711787604fmr35583645e9.6.1760712853339; 
 Fri, 17 Oct 2025 07:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY2i/XrXLNkdMltGFV0J0tBrRne+zVRBnrRcoyDQuxJFLmGYGJuLXfF8xyMKL8G2V4YC2CkQ==
X-Received: by 2002:a05:600c:1d9b:b0:46e:4f25:aace with SMTP id
 5b1f17b1804b1-4711787604fmr35583205e9.6.1760712852931; 
 Fri, 17 Oct 2025 07:54:12 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0c:c200:fa4a:c4ff:1b32:21ce?
 (p200300d82f0cc200fa4ac4ff1b3221ce.dip0.t-ipconnect.de.
 [2003:d8:2f0c:c200:fa4a:c4ff:1b32:21ce])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711441f975sm87898455e9.4.2025.10.17.07.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 07:54:12 -0700 (PDT)
Message-ID: <9beff9d6-47c7-4a65-b320-43efd1e12687@redhat.com>
Date: Fri, 17 Oct 2025 16:54:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: KVM/s390x regression
To: Christian Borntraeger <borntraeger@linux.ibm.com>, balbirs@nvidia.com
Cc: Liam.Howlett@oracle.com, airlied@gmail.com, akpm@linux-foundation.org,
 apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com,
 byungchul@sk.com, dakr@kernel.org, dev.jain@arm.com,
 dri-devel@lists.freedesktop.org, francois.dugast@intel.com,
 gourry@gourry.net, joshua.hahnjy@gmail.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lorenzo.stoakes@oracle.com, lyude@redhat.com,
 matthew.brost@intel.com, mpenttil@redhat.com, npache@redhat.com,
 osalvador@suse.de, rakie.kim@sk.com, rcampbell@nvidia.com,
 ryan.roberts@arm.com, simona@ffwll.ch, ying.huang@linux.alibaba.com,
 ziy@nvidia.com, kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-next@vger.kernel.org
References: <20251001065707.920170-4-balbirs@nvidia.com>
 <20251017144924.10034-1-borntraeger@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251017144924.10034-1-borntraeger@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Soms2L3nkcNGcxRRrtYaiQGXtuwyijHjJoXvvmGOEhc_1760712853
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.10.25 16:49, Christian Borntraeger wrote:
> This patch triggers a regression for s390x kvm as qemu guests can no longer start
> 
> error: kvm run failed Cannot allocate memory
> PSW=mask 0000000180000000 addr 000000007fd00600
> R00=0000000000000000 R01=0000000000000000 R02=0000000000000000 R03=0000000000000000
> R04=0000000000000000 R05=0000000000000000 R06=0000000000000000 R07=0000000000000000
> R08=0000000000000000 R09=0000000000000000 R10=0000000000000000 R11=0000000000000000
> R12=0000000000000000 R13=0000000000000000 R14=0000000000000000 R15=0000000000000000
> C00=00000000000000e0 C01=0000000000000000 C02=0000000000000000 C03=0000000000000000
> C04=0000000000000000 C05=0000000000000000 C06=0000000000000000 C07=0000000000000000
> C08=0000000000000000 C09=0000000000000000 C10=0000000000000000 C11=0000000000000000
> C12=0000000000000000 C13=0000000000000000 C14=00000000c2000000 C15=0000000000000000
> 
> KVM on s390x does not use THP so far, will investigate. Does anyone have a quick idea?

Only when running KVM guests and apart from that everything else seems 
to be fine?

That's weird :)

-- 
Cheers

David / dhildenb

