Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41827B317CE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 14:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BB510EADE;
	Fri, 22 Aug 2025 12:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bi/vnbYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2840C10E116;
 Fri, 22 Aug 2025 12:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755865739; x=1787401739;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=rYAteljHg/LYcH8raVDOfNCQBTOxx3YVhc8KvBI+fTU=;
 b=bi/vnbYH5nSHolrHz7YD4az8n4ickzmn8UyCzT/LR95BYfZ6e8zanbZZ
 Q9O6XuciIibhm5st3V3UQ3/dAlist3i0AvYXhGWDMkI45Qee2NT9U8tql
 A/+W0gwM9cD3NTsVAvJix3iqY03UvZgeuyHIWXpsUNHosmzyye/JDFEF4
 e0JcY177b8FUaNfQ/MTRwfKA1MDohAVEcqyTZGF/tYEOj/MxODEPEh8Y/
 hlrMvyQtF9NdVtj8VMbrXq6zHAYHJull5AwlwxWnj8lAtfFWxJyKk5JsR
 sLERKKZ7oBDPHgCky2rpPaJ5fDbPMTe89uG18dKmdE1MP8XEJl2z6Ppdd w==;
X-CSE-ConnectionGUID: acIS2n7TQsSihh7r4L33qQ==
X-CSE-MsgGUID: ysEHj64HR32r8m5a94BpDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61983860"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="61983860"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 05:28:58 -0700
X-CSE-ConnectionGUID: A3NFlRrcR4yx3FerU2nyJQ==
X-CSE-MsgGUID: 0wRAN96wTfOV7dhaRShc7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="172958259"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.134])
 ([10.245.244.134])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 05:28:57 -0700
Message-ID: <0353c333-2673-4157-bf93-08c6435e5827@intel.com>
Date: Fri, 22 Aug 2025 13:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/buddy: Optimize free block management with RB
 tree
From: Matthew Auld <matthew.auld@intel.com>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20250821150641.2720-1-Arunpravin.PaneerSelvam@amd.com>
 <6c813ddf-639e-4816-bd7d-70142a656663@intel.com>
Content-Language: en-GB
In-Reply-To: <6c813ddf-639e-4816-bd7d-70142a656663@intel.com>
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

On 22/08/2025 09:37, Matthew Auld wrote:
> On 21/08/2025 16:06, Arunpravin Paneer Selvam wrote:
>> Replace the freelist (O(n)) used for free block management with a
>> red-black tree, providing more efficient O(log n) search, insert,
>> and delete operations. This improves scalability and performance
>> when managing large numbers of free blocks per order (e.g., hundreds
>> or thousands).
>>
>> In the VK-CTS memory stress subtest, the buddy manager merges
>> fragmented memory and inserts freed blocks into the freelist. Since
>> freelist insertion is O(n), this becomes a bottleneck as fragmentation
>> increases. Benchmarking shows list_insert_sorted() consumes ~52.69% CPU
>> with the freelist, compared to just 0.03% with the RB tree
>> (rbtree_insert.isra.0), despite performing the same sorted insert.
>>
>> This also improves performance in heavily fragmented workloads,
>> such as games or graphics tests that stress memory.
>>
>> v3(Matthew):
>>    - Remove RB_EMPTY_NODE check in force_merge function.
>>    - Rename rb for loop macros to have less generic names and move to
>>      .c file.
>>    - Make the rb node rb and link field as union.
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> 
> CI is reporting a crash in rb_erase when running the drm_buddy kunit, 
> somewhere in drm_test_buddy_alloc_clear it seems.

Found one bug in the second patch:

--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -507,6 +507,8 @@ static int split_block(struct drm_buddy *mm,
                 return -ENOMEM;
         }

+       mark_split(mm, block);
+
         if (drm_buddy_block_is_clear(block)) {
                 mark_cleared(block->left);
                 mark_cleared(block->right);
@@ -516,8 +518,6 @@ static int split_block(struct drm_buddy *mm,
         mark_free(mm, block->left);
         mark_free(mm, block->right);

-       mark_split(mm, block);
-
         return 0;
  }

Otherwise the mark_split might get the wrong rb root if we reset the 
clear state first. Might help with this crash.

