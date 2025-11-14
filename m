Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61835C5C005
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 09:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC07C10EA14;
	Fri, 14 Nov 2025 08:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J1V0ndcd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BBC10EA16
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 08:33:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E9B17436D4;
 Fri, 14 Nov 2025 08:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B3CC19424;
 Fri, 14 Nov 2025 08:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763109195;
 bh=PFl33I0QJqg/12ihlGpsei/r6GgKWpKb7KCY1L2LsGY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=J1V0ndcdbmJYb817ivKEItL2rF4KI8nAuQGaxTw7ZVBI+LbR1RTSstti1Fm4IzhiY
 VzfYk8Q66tG3c7SGE97UTkwH3vaKsELxUkz/zws2peiK5UA1Hv1SiNOKxg5htGU06U
 +WQSI9qwkp1O5BH8tny+ZmVb4Hu/cX/kdOuu8d2T8Y7gSxxKOqXTZwpf4CmJqkrpw9
 96Iyf55ubQo0ob2h9TBcjn1gA4caqz1BqSB8e+NmevZZQ1Hmp7qgtvs9tB0asx5Xv/
 86hCNcS3CvgtobtHS3+6a8vx98BPwizKfvVDfnY+2JjVhcvMFQcSyMejS7BqAmPQK4
 w4/Cx+Y28i6Jg==
Message-ID: <95e27bd3-6ce7-46a3-81d5-0fc830908b10@kernel.org>
Date: Fri, 14 Nov 2025 09:33:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu/drm/nouveau: fix return type in
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
References: <20251114012221.2634832-1-balbirs@nvidia.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251114012221.2634832-1-balbirs@nvidia.com>
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

On 14.11.25 02:22, Balbir Singh wrote:
> ret of type vm_fault_t is reused to capture the return value of
> nouveau_dmem_copy_folio(), which returns an int. Use a new variable
> err to fix the issue. The issue is not new, prior to this the function
> called was called nouveau_dmem_copy_one() and ret was used to capture
> it's value.
> 
> The bug does not cause a real issue at runtime, the value is used
> as a boolean to check if nouveau_dmem_copy_folio() succeeded or failed.
> The different types should not impact the execution of the code at
> runtime.
> 

Also, as commented previously, the prefix in the subject does not match 
existing norms. Take a look at

	git log --oneline drivers/gpu/drm/nouveau/nouveau_dmem.c

and note how it's commonly something along the lines of "drm/nouveau" or 
better "drm/nouveau/dmem".

The only patch that uses "gpu/drm/nouveau" is from you recently. In 
fact, there is no other patch in the codebase that uses that prefix.

-- 
Cheers

David
