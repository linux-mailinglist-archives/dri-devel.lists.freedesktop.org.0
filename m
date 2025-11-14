Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAAAC5BFC9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 09:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D10E10E038;
	Fri, 14 Nov 2025 08:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sDtifvHi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7499B10E038
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 08:29:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2FEFC4421F;
 Fri, 14 Nov 2025 08:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54210C4CEF8;
 Fri, 14 Nov 2025 08:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763108997;
 bh=UMYYNNpZ5GR5sG0zLLPnTA5aiyC6fn01mRMVDGvSnmE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sDtifvHijRGM0EyOPu1rUe8yBQtBPa1jZ74qwhW5jEU7vIPFGtOR/TQ9qbrfCIK25
 PY+uIAbZOtl1C67PN2tiSUax8+3tovE0zPQO/vKsKkjHz1WvndXq2NRIHxGKbXrtGG
 PTGSa2PV6iJhVbxXY6AJaA60k3sIvHvhS1QvUHxILWqQ/rF1EQhDqreitAiRUcQ1nz
 OsOEzmF5mxSo44xJcAJ6M83suR+Y8Cuf2el+aPa+ZMtoyn2YSy2b2KBx5+KAIhKLOj
 bhiEvPMWbfTauZ+6yRLEsEXV9FZofqYtSm06182j/dNqc4+wy5490+XUaiBQ1BkUJF
 jxhDr7KTxZWZA==
Message-ID: <38276135-44cb-4b27-b711-7d012e2908a8@kernel.org>
Date: Fri, 14 Nov 2025 09:29:47 +0100
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

Again, spell out that it is a sparse warning one way or the other and 
ideally paste the relevant part here,

Also, take a look at the definition of "bug", like at wikipedia

"In engineering, a bug is a design defect in an engineered system—such 
as software, computer hardware, electronics, circuitry or machinery—that 
causes an undesired result."

Talking about a bug when nothing is broken can be really misleading to 
people that watch out for CVEs etc.

-- 
Cheers

David
