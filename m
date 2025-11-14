Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD315C5BE15
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 09:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3424A10E9C5;
	Fri, 14 Nov 2025 08:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R7TDnADR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC9510E9C5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 08:02:34 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-64180bd67b7so2350103a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 00:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763107353; x=1763712153; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4KbiNU5yCfEN4FXal09etJPtHEak6Phh1dFiA4B8zJk=;
 b=R7TDnADR1yQtCIvbdbgw9oEffBYYFyi9SqapIe8E01HpYFB0z2S7Nil3mnfRuaYvXV
 v5aBZ7KEgSjOOSJwNvTorfYS/WtQGqnvBJ9JysYI6UUWQX2gcEoDLvLBt6NWRB1Ds1RZ
 EtsOZt81TxPDEV7V78YxHJkojkLvKLBH/GXCMeiq1zBxJkoX+tJTq7TL9R2aWDoyV7CO
 Hbz3HrNmyqkBfaNBVfOduJeQ7OMoDisatE58Lc2/HLMKUd4Z2EV7GcrT8ebEXYPVfJgF
 TZndwwIqh5fwa9nzfuUAaDA+aLCIbaAJ5n5Mzx2VMHRm3tA+Hlm6HIyg19QHwPiZzFzT
 T9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763107353; x=1763712153;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4KbiNU5yCfEN4FXal09etJPtHEak6Phh1dFiA4B8zJk=;
 b=jMPVT/0/5La63N+p7LQjcROYkM9zFaNrg8BJj4F/6NXy3LQ62UfG4ytE2pDwVV6Lrv
 2nn5K9htmdfbUNwrsWCpLDercNGcO5OtJO4YnbGMNj9gS0Ju3QCqiQDL+lUhnJXqfsiH
 JwAZ7aExJeyhl9zNqIYMQDHMH1fX2zCdyVMaNnGZsBYqEeguOJ/htIs0TDAPEfV8BBcV
 ievFx5vP6LMJ5UhYAiFkMa5v3oRtfDiP9rFTGrdOukGCUWtF3EAoSJr0WYkbSBvIZniI
 8XazHuKLtMR6bsr+s9kmaS5Rx9PmR+uaQg3oLi+xxkoMBwwCmDt6pTRYqa9vScjaxA6L
 ATgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdNZvrpsLVM5qSzIPYBJElcuSmi26hegF65TR7RhxEBcoUNltNHhmBcY18yc6+8rWmYLlGwC4Hj6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzof+ZoFx/ww2bNrZZRgzsI4AqY2KMOpzsymS6gPEqrlKGZew1Y
 tVFZha9eJDwtI7Cw/hAUxh5aGd0ZFgTZISCpN1Fp/0mHLTieRHh7fYOo
X-Gm-Gg: ASbGncvBg/l0R4s8UzNXCvjOiPDoavRUopX/QKSbkhdVvtatwRSSzT2UNesfr1o9Y+j
 PXMOue+jq5atOC/0NRrUndhd8yzuIJu5eOxqm4dEMuEJlnX3uiVXBlf1DYTibeJnrBiWyBfFaQS
 vvB4MkXiBp8Bu9AifHQqYXRjPTOpYgdUAO7p/PR/YpfUOEY6Ilbw7ybyZ0qM5Czt5lLomvJDy4V
 OBEkfh/wJ1MtEehnXiEfVTBCnvRlF9Ovt5YLIr039QJd0GRW6t79FslxY1YKK7IYGHTOtxVa0SI
 XaxircKtAUOvOv+/LAJv1gbUEG/ldrGmdiNIz9bC3C8JPqfu/3Zbs9z+9yhEo6RhUqrhe8so9yY
 LGUm2MGR1zkOJiWeeAJoL3BUr9buUQCoVaxTE+6MNDa0RixRj4tMkD0/kO5SoVsaWqGdChC2H4N
 bTyKQbCSxp0OlGIA==
X-Google-Smtp-Source: AGHT+IFHp4R0zTwE4dMochE8kl4UmvqdsH7ba7lQ82B8UAtO+/J0teWF71l9ELhwzjeYKUxsrmiq1w==
X-Received: by 2002:a05:6402:3592:b0:640:7529:b8d3 with SMTP id
 4fb4d7f45d1cf-64350e2321amr1683582a12.9.1763107353191; 
 Fri, 14 Nov 2025 00:02:33 -0800 (PST)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a2d746bsm3123759a12.0.2025.11.14.00.02.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 14 Nov 2025 00:02:32 -0800 (PST)
Date: Fri, 14 Nov 2025 08:02:32 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
Message-ID: <20251114080232.kxms4vjlkiiuxqpl@master>
References: <20251114012228.2634882-1-balbirs@nvidia.com>
 <20251114032105.sdkjaoiwpdmpynew@master>
 <870151ce-ca90-4cd4-8f21-35f4da329924@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <870151ce-ca90-4cd4-8f21-35f4da329924@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 14, 2025 at 02:30:03PM +1100, Balbir Singh wrote:
>On 11/14/25 14:21, Wei Yang wrote:
>> On Fri, Nov 14, 2025 at 12:22:28PM +1100, Balbir Singh wrote:
>> [...]
>>> @@ -4079,6 +4091,36 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>> 	return ret;
>>> }
>>>
>>> +/*
>>> + * This function is a helper for splitting folios that have already been unmapped.
>>> + * The use case is that the device or the CPU can refuse to migrate THP pages in
>>> + * the middle of migration, due to allocation issues on either side
>>> + *
>>> + * The high level code is copied from __folio_split, since the pages are anonymous
>>> + * and are already isolated from the LRU, the code has been simplified to not
>>> + * burden __folio_split with unmapped sprinkled into the code.
>>> + *
>>> + * None of the split folios are unlocked
>>> + */
>>> +int folio_split_unmapped(struct folio *folio, unsigned int new_order)
>>> +{
>>> +	int extra_pins, ret = 0;
>>> +
>>> +	VM_WARN_ON_FOLIO(folio_mapped(folio), folio);
>>> +	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
>>> +	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
>>> +
>> 
>> Compared with original logic, we did check folio_split_supported() and
>> check whether new_order is supported for the file system.
>> 
>> Currently folio_split_unmapped() only pass 0 as new_order, which looks good.
>> But for a generic helper, it looks reasonable to do the check, IMHO.
>> 
>
>This is meant to be used in the middle of a migration where the src/dst do 
>no agree on the folio_order() due to allocation issues. When mTHP support
>is added to device migration, order support will be added and checked.
>FYI: This routines supports just anonymous pages ATM
>

OK, I don't see these assumptions. Not sure it would be abused.

Maybe a comment would help? Or remove the new_order now? We can add it when it
is truly used.

>>> +	if (!can_split_folio(folio, 1, &extra_pins))
>>> +		return -EAGAIN;
>>> +
>>> +	local_irq_disable();
>>> +	ret = __folio_freeze_and_split_unmapped(folio, new_order, &folio->page, NULL,
>>> +						NULL, false, NULL, SPLIT_TYPE_UNIFORM,
>>> +						0, extra_pins);
>>> +	local_irq_enable();
>>> +	return ret;
>>> +}
>>> +
>>> /*
>>>  * This function splits a large folio into smaller folios of order @new_order.
>>>  * @page can point to any page of the large folio to split. The split operation
>> 
>> 
>
>Balbir

-- 
Wei Yang
Help you, Help me
