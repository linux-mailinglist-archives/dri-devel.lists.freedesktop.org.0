Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DE7BA48B9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 18:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AAC10EAA1;
	Fri, 26 Sep 2025 16:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKpo5tuB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DD110EA9A;
 Fri, 26 Sep 2025 16:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758902744; x=1790438744;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rd+7hbNMpp75M/aBANgHZpJMCcqOEXVDoS/5QQiFAzg=;
 b=bKpo5tuBzc9ibYqUpbLHwsnjKECH992YJ1Kp3ZXFnzmjal7ZhtaxyLYX
 Dt0zvDCNRiPTyieY/j+LV7Y5MJGMa9wka0abbgx6zzercKhxEiQ4TOdOv
 QG7JywOsSYmfIY5e4Ay7CyGmnedQXAS5Xh5Vay6G1bzTi6bwIJEQReiBX
 ZJmKOyFomIkvirIT1mu6Jo9DzfkEGJOiS9W8LRDyP+TdSj4FpHGzrNCg5
 7Kqb2V141R8dNh0sxRe8N8mmSu3chAYYK7VfiSmg/kuJA1qguEiI0IaYF
 23LscPx4Bjty73Rb3rpohjN4CxG8uDIzwd+bbjBnBMJb1215zVU7AtKuU Q==;
X-CSE-ConnectionGUID: xQiDfgSYS9GpTaSm1YGWfQ==
X-CSE-MsgGUID: m++LUWBUTneeQ9HLQigmNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="86683348"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="86683348"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:05:44 -0700
X-CSE-ConnectionGUID: rhVB3u+zTRGCnz7LOGFJKA==
X-CSE-MsgGUID: En2DyOE6Rza804+hgeyW0w==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.9])
 ([10.245.245.9])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:05:42 -0700
Message-ID: <25825f68-e17b-492e-877b-9282667e2dff@intel.com>
Date: Fri, 26 Sep 2025 17:05:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] drm/buddy: Optimize free block management with RB
 tree
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com, jani.nikula@linux.intel.com,
 peterz@infradead.org, samuel.pitoiset@gmail.com, stable@vger.kernel.org
References: <20250923090242.60649-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250923090242.60649-1-Arunpravin.PaneerSelvam@amd.com>
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

On 23/09/2025 10:02, Arunpravin Paneer Selvam wrote:
> Replace the freelist (O(n)) used for free block management with a
> red-black tree, providing more efficient O(log n) search, insert,
> and delete operations. This improves scalability and performance
> when managing large numbers of free blocks per order (e.g., hundreds
> or thousands).
> 
> In the VK-CTS memory stress subtest, the buddy manager merges
> fragmented memory and inserts freed blocks into the freelist. Since
> freelist insertion is O(n), this becomes a bottleneck as fragmentation
> increases. Benchmarking shows list_insert_sorted() consumes ~52.69% CPU
> with the freelist, compared to just 0.03% with the RB tree
> (rbtree_insert.isra.0), despite performing the same sorted insert.
> 
> This also improves performance in heavily fragmented workloads,
> such as games or graphics tests that stress memory.
> 
> As the buddy allocator evolves with new features such as clear-page
> tracking, the resulting fragmentation and complexity have grown.
> These RB-tree based design changes are introduced to address that
> growth and ensure the allocator continues to perform efficiently
> under fragmented conditions.
> 
> The RB tree implementation with separate clear/dirty trees provides:
> - O(n log n) aggregate complexity for all operations instead of O(n^2)
> - Elimination of soft lockups and system instability
> - Improved code maintainability and clarity
> - Better scalability for large memory systems
> - Predictable performance under fragmentation
> 
> v3(Matthew):
>    - Remove RB_EMPTY_NODE check in force_merge function.
>    - Rename rb for loop macros to have less generic names and move to
>      .c file.
>    - Make the rb node rb and link field as union.
> 
> v4(Jani Nikula):
>    - The kernel-doc comment should be "/**"
>    - Move all the rbtree macros to rbtree.h and add parens to ensure
>      correct precedence.
> 
> v5:
>    - Remove the inline in a .c file (Jani Nikula).
> 
> v6(Peter Zijlstra):
>    - Add rb_add() function replacing the existing rbtree_insert() code.
> 
> v7:
>    - A full walk iteration in rbtree is slower than the list (Peter Zijlstra).
>    - The existing rbtree_postorder_for_each_entry_safe macro should be used
>      in scenarios where traversal order is not a critical factor (Christian).
> 
> Cc: stable@vger.kernel.org
> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

