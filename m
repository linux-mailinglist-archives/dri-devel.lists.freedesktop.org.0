Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50919C6B8C1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46F510E1BC;
	Tue, 18 Nov 2025 20:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CzkuG0mN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C2E10E1BC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:18:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 92589601B9;
 Tue, 18 Nov 2025 20:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39B5C2BC87;
 Tue, 18 Nov 2025 20:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763497111;
 bh=KdE+M0lVIS0HGmtD8Ko2F3jFdIzWzLb9S0ujof4OTvs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CzkuG0mNeQpbD3Hy+tj4eX/rn/+E3hFsBaVnbuNLfyC/t2+TLwKI8d549T7QP8eW8
 sQisDVOZD0G/5KwwegU4hVX5/hojgUlgx3ADXDvOu07qrfjr2KHDTZ0gFdWN8ssswZ
 7ETlZ7miEGm+0CO0XPnoARSKuW6XAKd4KL1K8g8jDQbVaFvTIC+vFyIo2f75DpI24l
 qeR6dM0weLyxEj3kGSYAmHUkmoFYHnYo+ecYAeor+kZbc2wfhJLOlVOSyRxP7mwcou
 +y47JzdCggFaeknWxJA3dsNmvBpaw5REHP4Fm0FuBfRI4Rxskb7TP1LsTX07tEPXGa
 BgHC+IGmVtNAw==
Message-ID: <249625c7-eb2a-41f0-94cd-4551e5a38f73@kernel.org>
Date: Tue, 18 Nov 2025 21:18:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org
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
References: <20251114012228.2634882-1-balbirs@nvidia.com>
 <5b481d76-638d-46d4-ad98-5508fc8b715e@kernel.org>
 <4daec24f-c97e-4c26-819b-e7762b301036@nvidia.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <4daec24f-c97e-4c26-819b-e7762b301036@nvidia.com>
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

On 14.11.25 10:10, Balbir Singh wrote:
> On 11/14/25 19:36, David Hildenbrand (Red Hat) wrote:
>> On 14.11.25 02:22, Balbir Singh wrote:
>>> Unmapped was added as a parameter to __folio_split() and related
>>> call sites to support splitting of folios already in the midst
>>> of a migration. This special case arose for device private folio
>>> migration since during migration there could be a disconnect between
>>> source and destination on the folio size.
>>
>> Didn't I already comment that the subject should start with "mm/huge_memory: introduce ..." ?
>>
> 
> Yeah.. the .c in the prefix is not desirable, I missed that in the subject line
> 
>> Yes I did: https://lore.kernel.org/all/048134fd-6a3d-4a6c-a2eb-9a9911c3b35f@kernel.org/
>>
>> You know, I'm a busy man, can you *please*
>>
>> * take better care of addressing all previous comments?
>> * wait more than 12 h after asking a question before you resend?
>>
> 
> I think addressed most of it, I missed the subject line, but in general addressed
> 
> 1. Using folio_split_ as the prefix to split functions, the main function is called folio_split_unmapped and the helper name was suggested by Zi to be __folio_freeze_and_split_unmapped() and it sounded better than what I had __folio_split_unmapped() or even __folio_split_freeze_unmapped()
> 2. Got rid of _to_order() as the function suffix
> 
> Do you have any more outstanding comments that I missed?

I'll take a look at v2 now given that I was distracted for 2 days :(

-- 
Cheers

David
