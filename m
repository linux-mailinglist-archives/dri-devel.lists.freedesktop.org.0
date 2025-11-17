Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E279C643E6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 14:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7673510E3CA;
	Mon, 17 Nov 2025 13:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hvxskFR0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A2010E3CA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 13:01:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 55A7760143;
 Mon, 17 Nov 2025 13:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4B1C2BC86;
 Mon, 17 Nov 2025 13:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763384506;
 bh=amY5A1MHjQ5DB1R9kBa+KNUTxrZTkL8fLkB067sXIpo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hvxskFR0Olndl96YcM/fnsoWPxCeOzLsTLCTG9nE4r2WJlmPRyNBEjrW4rv8MF+CW
 SpbAkJyliL//jX9jgCYCMtQUFbhN7WBXcVf7UDS5xch6nt/i5+ki91q+HwB6QkEYHJ
 O9Lm+sFiHn/dpF46I6a1rWOzP+y8Nj9fof64cKmkrSUh1BtorHrVtS7+JLnAX5YG2q
 +S7YV6rM/ADE37JjSvwUgaBesPuNGfLBsuRhcQwFt8MCBSJR5gsbIawUeDi3ifQm98
 loCt1Bd81JuXCSYvxfUmSfA2ijkVCySYbjbrDq7/hwL7JTENWQ+LFAylfi2yXP9g4X
 30AO0YtSSAp8A==
Message-ID: <b4182bfe-4081-468b-86d3-f1ac04ca4f5d@kernel.org>
Date: Mon, 17 Nov 2025 14:01:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fixup: gpu/drm/nouveau: enable THP support for GPU
 memory migration
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
References: <20251115003333.3516870-1-balbirs@nvidia.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251115003333.3516870-1-balbirs@nvidia.com>
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

On 15.11.25 01:33, Balbir Singh wrote:
> Kernel test robot, reported a sparse error with the patch
> 
> The sparse report states:
> 
>>> drivers/gpu/drm/nouveau/nouveau_dmem.c:259:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [assigned] [usertype] ret @@     got int @@
>     drivers/gpu/drm/nouveau/nouveau_dmem.c:259:13: sparse:     expected restricted vm_fault_t [assigned] [usertype] ret
>     drivers/gpu/drm/nouveau/nouveau_dmem.c:259:13: sparse:     got int
> 

I would have simplified that to (and avoided the long line)

"The kernel test robot reports a sparse warning "expected restricted 
vm_fault_t [assigned] [usertype] ret ... got int."

Whoever applies that can massage it I am sure.

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David
