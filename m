Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A56B38AF3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 22:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA5A10E8B2;
	Wed, 27 Aug 2025 20:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c2c+kvHH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F1310E8B2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 20:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756326598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PzokQis5ZL6qsKctP4Xs3z1Gldk6SHQ/UBTYZ2qmTrY=;
 b=c2c+kvHHPKIdt98+pGn+SXDMvMuo2AwPtKWZ+M+nIrj2rWmG06sbDDaQE2jhc8zwvv0RdQ
 EXCGQUTciysmddrzI1t9xyfMQLMxQSeTMXW+63gaQLD4P6Xc2tmp6T0tf70Z8fg/t0Vajj
 HlaR/fcnd/kJoFvIimE6VuA0ggqgL8I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-NeLU-sFYNN-aL0yDORVehw-1; Wed, 27 Aug 2025 16:29:56 -0400
X-MC-Unique: NeLU-sFYNN-aL0yDORVehw-1
X-Mimecast-MFC-AGG-ID: NeLU-sFYNN-aL0yDORVehw_1756326595
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45a1b05b15eso1107025e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 13:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756326595; x=1756931395;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PzokQis5ZL6qsKctP4Xs3z1Gldk6SHQ/UBTYZ2qmTrY=;
 b=xQn36DCw4HmQK8cfH40XHy3IX4hU/2Gut24PPYp5fgFQgtrhmznGQejtuoIbDp2GHa
 sycTCgdc6EzNPnvmPfkvmBl/fIBTmabOzWxfn/LoVXE2gKjD8VTeG0QoNwcBAmVMUPl3
 OtylXV6iV66MVq1uVn9ZvRtEwZzRQMEi2BHX8ND3+x0hNSdSV/vDsUJQanATis8YxKO1
 dzIXh/BGHhNpunPtruRKN5tk210Wkasgl8qkV3vIismeJHHKbbczQ1CoVMMhJD72bb1E
 yx9LuLTfnXYI8kKS2FVst1x+PTET3Be4yLdrGW7z/dCBCj7U0/4WGge/Atj7Vgmx1TUy
 ZRJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRTj/idWG5QDoLVmeYsrCv4FFZhSi/VqY0pwQXeg0lp5NBY4R3UdFNSysCzyGXS9tixl0xejVwHac=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywyop6e1O9PTiMikSFUjrCX5hFx2sqxvJgV50XF9c0jJ/jrYva2
 EPhIv7KHC8WWFXxmQ6VDo0OS2MeojXxWLnsZ+onGRywma8P6TZcBwgVITiPnxW/hr0e2tpDzV9j
 RSmLol22T5yLKoBKaDMf40T1sZQZDAkk90hzxiZX9XqPkJSzuzLIqz32YXQuc9k9/p+6a87AoDx
 pUzYs1
X-Gm-Gg: ASbGncvqUM/FWs81VkBJttCIHw2x2M7DuUzrT3WTNRviTG9t9SSsYSycNliSMoLb3Dd
 s/CWCMHKL37LIqE6RCG071a5TvpQFO7Zw3LrDv0khDDtnqXNBmy72O+IMIzwKDgJ3HvbSg81TWN
 yH9ou0hh+ei1859C/yFwZZTRCDJAHgeSEq7VCdN35W17CCZBslcj0pW4Qyl3yokXl+756xNRcAI
 wgYJz86VogkPVNbs3kXzjM5nA8lmCotZNA3wVmmHsVhlafrrURm9o+I/CqTOvMv/bR2I2Fnx8WI
 c+COflIglLp1CYXWs1KKnhhK+c3MiBHiWVz380aB1nNzfoI6UhnYHQjfWjzWwa9OW4Qkon4jm4a
 CtVMz3KPMSr6NVAr+NsYMmyBWJsnIWb9fhBOIqA820tK0bON8/fwd0/9hugtVbTLwByY=
X-Received: by 2002:a05:600c:c87:b0:459:dd34:52fb with SMTP id
 5b1f17b1804b1-45b5179ebb2mr190291905e9.12.1756326595154; 
 Wed, 27 Aug 2025 13:29:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRZbz0F38PgQXgnCEw95o1suaGM69HCqab1SOSSbvnFH7ZiXZ+shWII8MvVCiecn8ZaBeb2g==
X-Received: by 2002:a05:600c:c87:b0:459:dd34:52fb with SMTP id
 5b1f17b1804b1-45b5179ebb2mr190291705e9.12.1756326594730; 
 Wed, 27 Aug 2025 13:29:54 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1f:d000:d4e1:a22e:7d95:bb63?
 (p200300d82f1fd000d4e1a22e7d95bb63.dip0.t-ipconnect.de.
 [2003:d8:2f1f:d000:d4e1:a22e:7d95:bb63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b79799c81sm1683715e9.4.2025.08.27.13.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 13:29:54 -0700 (PDT)
Message-ID: <5cdd07b4-f924-4207-a8cf-09b4fc26d3d7@redhat.com>
Date: Wed, 27 Aug 2025 22:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 07/11] mm/thp: add split during migration support
To: Balbir Singh <balbirs@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
 <20250812024036.690064-8-balbirs@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250812024036.690064-8-balbirs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O4KOx9yqd536P8rtbnGJll1W_pcoFtoqkkckEVZMauY_1756326595
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

On 12.08.25 04:40, Balbir Singh wrote:
> Support splitting pages during THP zone device migration as needed.
> The common case that arises is that after setup, during migrate
> the destination might not be able to allocate MIGRATE_PFN_COMPOUND
> pages.
> 
> Add a new routine migrate_vma_split_pages() to support the splitting
> of already isolated pages. The pages being migrated are already unmapped
> and marked for migration during setup (via unmap). folio_split() and
> __split_unmapped_folio() take additional isolated arguments, to avoid
> unmapping and remaping these pages and unlocking/putting the folio.

No detailed review, just a high-level comment: please take better care 
of crafting your patch subjects.

This should probably be

mm/migrate_device: support splitting device folios during migration

-- 
Cheers

David / dhildenb

