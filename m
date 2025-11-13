Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214C0C5748C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 12:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8160310E7EA;
	Thu, 13 Nov 2025 11:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EjS7/pAB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 414 seconds by postgrey-1.36 at gabe;
 Thu, 13 Nov 2025 11:57:24 UTC
Received: from tor.source.kernel.org (unknown [193.37.139.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEB010E7EA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 11:57:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3347C601B9;
 Thu, 13 Nov 2025 11:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1B1C4CEF8;
 Thu, 13 Nov 2025 11:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763034628;
 bh=Pa2RgIARzCnIXz9o1YbhSbulkMlyeUbZVlsIzcP3LEg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EjS7/pABfgTH0LGoCqvoiauYcHaLTvT1cJh6jJCD5N5YbrXfRXgYWCRnQ44RDURMj
 YwxvBMXsr1iaMMEZoWT8XtrvjMzk3FHXfyxC41Yz30zcSY66dtMQF3+FiV/N9LxcDI
 sPaeqHe4mnqNeJlGpZQ0ZuyrbCeEbYYvZoVZLsEY069KRRpRoEflDWe5FMpKdxkr0q
 mSlXjQqewIs/TyG3TQSw0rKW9s6nyHDEpuwv4PMGQflPlIcE1qz5kCMHT2+4DmJcVb
 SN38L/lv2iYz0UnKrcRI1aUJuwES/Y1hFY9xU6HKf5sQuNbCet8Z107wGm6XF8Os2y
 +HqJ9qqvVXqIg==
Message-ID: <48265d08-df2b-48df-959b-d2ed1407ceca@kernel.org>
Date: Thu, 13 Nov 2025 12:50:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fix gpu/drm/nouveau: fix return type in
 nouveau_dmem_migrate_to_ram()
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org
Cc: kernel test robot <lkp@intel.com>,
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
References: <20251113051322.1753532-1-balbirs@nvidia.com>
 <5bdd8b10-171e-4171-a1f2-43c029dfd8e4@kernel.org>
 <7d5ff6bf-9e44-41da-a9b9-c5424c569e98@nvidia.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <7d5ff6bf-9e44-41da-a9b9-c5424c569e98@nvidia.com>
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

On 13.11.25 11:31, Balbir Singh wrote:
> On 11/13/25 20:09, David Hildenbrand (Red Hat) wrote:
>> On 13.11.25 06:13, Balbir Singh wrote:
>>> ret of type vm_fault_t is reused to capture the return value of
>>> nouveau_dmem_copy_folio(), which returns an int. Use a new copy_ret
>>> to fix the issue. The issue is not new, prior to this the function
>>> called was called nouveau_dmem_copy_one() and ret was used to capture
>>> it's value.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202511121922.oP20Lzb8-lkp@intel.com/
>>
>> It's a sparse warning, is there any runtime effect?
>>
> 
> No impact really, it's just a sparse warning

Okay, then please

1) Make that clear in the patch description

2) Make that clear in the patch subject.

In particular, the current subject is weird. Should probably be

"nouveau/dmem: fix sparse warning in nouveau_dmem_migrate_to_ram()"

Change itself LGTM, although I would probably call it "int err" or 
something like that instead.

-- 
Cheers

David
