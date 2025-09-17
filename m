Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25313B7E767
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B28010E64E;
	Wed, 17 Sep 2025 10:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZMzL6mfk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B8110E64E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 10:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758104541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mKyszV1q06Fp6TRfybx7eNtO4VCdcm3YS1IzQgwBUT4=;
 b=ZMzL6mfkrHmLoUibbiznuyddUlhAZ+I9R0pcZB+af6X3xUo1sgx0Pxuzn62xNpcd665q2j
 fqwyy7XngTT7Enhq2lvjQSNwLUiU31JcWcHgrq6IFenVpJ9k9t/WD78RUbjB+a9sQGa5V6
 /8Pz6ux3PJQm3AAA3uAwBXjszFRZfNc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-53qEK5KMMfmsxjTlWL_O-A-1; Wed, 17 Sep 2025 06:22:19 -0400
X-MC-Unique: 53qEK5KMMfmsxjTlWL_O-A-1
X-Mimecast-MFC-AGG-ID: 53qEK5KMMfmsxjTlWL_O-A_1758104539
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45f2a1660fcso31667675e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 03:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758104538; x=1758709338;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mKyszV1q06Fp6TRfybx7eNtO4VCdcm3YS1IzQgwBUT4=;
 b=eM6iaW7qtQSkccXUrN+Mg5dFcku1zBNJE1zTBkE2SXGd/TaTh0GhxBlcBKcmr5UHMA
 /8/x4gm3P2ZxQEWfNwIHil1N4OCEkn72uScL1SscnCme7GTIhs9lF4JYdwrWZABwOX2Z
 j/k1VCdqzFG2MaE0JcLrOnKyZFqfPhiQkn/smfJF/XaxdJZLbfebakC4Qi4MN56IYOTK
 9UDUHqQBDHj6+2zITtbt2kLe3z9QhxP1rIzRA8LJViE02kGpPZ8Hv7KNnSqSLmFpsCOm
 lGj5jZX4V3JPv86vVzFCj7cHsWBQ9gHzbCZWUhw+btp719EuGXRro5SAf1qMBz0lab1Q
 VtaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdbifTUbYiQYrerPDkRrudZt7GW46Ao4zupYfQXXl/2bs3+ELfIp035YP4vnGfAwXejnuCE/WK6e0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyV2FpGPw65JtdXumED7X3BEa4KIK29RqVL3yAR4Wets8LmN5fg
 2JieQn9cZXmrYO8AcqLq+ycVH5sgOQtCJOdtrO0g6mIFqNU2ffiWCnjGMtUOav43Sszt5btNPtL
 nhgu8brF3ngcgNS89W49/IVMolQCP7nl2S9qyN+uAnHy1ZOZor4v99a1JseZNuaJ3Fn99Ew==
X-Gm-Gg: ASbGncvh+lpQFUoVmZzSb624spkrnN7n+3Ee/AAbnKNLG1JXUmprO4i8vqR7HfZYGar
 0Ekuu2lFi35ObXZq5s9mn4voVnbyVCW7Xwf0jeZLfTmif2IbH/rKPTTR86DWgC3ANfzyI55+uZ+
 cVoDA+ooToNRWP8qFAjyEiPwq2DiWE72tZzPqZSpYihIfPHObPftH+8ztB4Budf2sgfZaMDDndr
 Xcf6z4sDS4uPdJst2ynEAihwMGcutFlE/V1NJgCZczpG8JbyovvRb+NPQR3MYd6Y2cK3YTN1s/W
 LNlSJBk1aP/ATzvzeiqOS1Z1e6qUyrIToyySQsBdqPkboEQU/Fo1zffdFUdS8Uywi4XVGyrrTK2
 StSyboLZS8fO/QFMqQPSIB99DmwpDRiIlvU/gpgUFEoW69l1W8+SQWp/+JrZGrwz8
X-Received: by 2002:a05:600c:3b20:b0:45d:e110:e673 with SMTP id
 5b1f17b1804b1-46202175527mr14813715e9.4.1758104538546; 
 Wed, 17 Sep 2025 03:22:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo6HbjqyIn3oQJnoxmTmcqeb7EBkzpfCOw15hL8v6Me3R6DzuZDAIwQ1WGLFWW9sjTfM1yRQ==
X-Received: by 2002:a05:600c:3b20:b0:45d:e110:e673 with SMTP id
 5b1f17b1804b1-46202175527mr14813245e9.4.1758104538056; 
 Wed, 17 Sep 2025 03:22:18 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:6d00:7b96:afc9:83d0:5bd?
 (p200300d82f276d007b96afc983d005bd.dip0.t-ipconnect.de.
 [2003:d8:2f27:6d00:7b96:afc9:83d0:5bd])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613930bdd8sm31088005e9.19.2025.09.17.03.22.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 03:22:17 -0700 (PDT)
Message-ID: <cd9bae54-a12b-43f0-8014-0c1d95916c0b@redhat.com>
Date: Wed, 17 Sep 2025 12:22:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 02/15] mm/huge_memory: add device-private THP support to PMD
 operations
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
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
References: <20250908000448.180088-1-balbirs@nvidia.com>
 <20250908000448.180088-3-balbirs@nvidia.com>
 <17e3c19e-0719-4643-8db8-cf8c5b5aa022@redhat.com>
 <49776f0a-d891-40be-bce3-c2b1f16bd825@nvidia.com>
 <4de00290-7c29-42f5-b8aa-58a77b17c1d5@redhat.com>
 <8a2c4803-d613-4592-9114-d68b97bf3fb0@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <8a2c4803-d613-4592-9114-d68b97bf3fb0@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vsGiwR0Fu8vs3xErVV36ZP-cfBK_GikJQl3sJtgMy0E_1758104539
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

>>>>
>>>> Couldn't we do here
>>>>
>>>> if (!pmd_present(pmdval))
>>>>       goto nomap;
>>>>
>>>> To replace the original pmd_none() .. check.
>>>>
>>>> A page table must always be present IIRC.
>>>>
>>>
>>> I am not sure about the pmd_none(), a page table may not be present, I've not audited
>>> the callers. But I think we can do
>>
>> IIRC page tables must always have the present bit set. So we can just simplify to the single pmd_present() check.
>>
> 
> Not sure about that one, are you happy if we follow it up later with a separate fix

Taking a look at other page table walkers, they couldn't possibly work if
tables would not be pmd_present().

E.g., walk_pmd_range() in mm/pagewalk.c has

if (walk->vma)
	split_huge_pmd(walk->vma, pmd, addr);
else if (pmd_leaf(*pmd) || !pmd_present(*pmd))
	continue; /* Nothing to do. */

err = walk_pte_range(pmd, addr, next, walk);
if (err)
	break;


If a PTE table would not be pmd_present() we would never ever call walk_pte_range().

So I am pretty sure that this can just be:

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 567e2d084071e..1916d22aaf1f1 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -290,7 +290,7 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
  
         if (pmdvalp)
                 *pmdvalp = pmdval;
-       if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
+       if (unlikely(!pmd_present(pmdval)))
                 goto nomap;
         if (unlikely(pmd_trans_huge(pmdval)))
                 goto nomap;

Unless I am missing something important :)

-- 
Cheers

David / dhildenb

