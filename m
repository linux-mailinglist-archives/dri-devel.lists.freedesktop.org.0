Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41783B3FC2D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 12:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A7810E654;
	Tue,  2 Sep 2025 10:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YWJI1Yvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED6E10E650;
 Tue,  2 Sep 2025 10:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756808607; x=1788344607;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rR6Wp8GZtCXlW02r8wzOYU1nLDI4RbUlUd1eOGVJRvk=;
 b=YWJI1YvcMxW1HqiUX5ImrjolyNz3IywTTi5bFKPMxU5xVIU+djvD7dwn
 GSfZjJixA0sNZ+5bWpKEfujWZHSUjZ4JIKB1LpAFrfcgbKl6WyA+mOIgC
 CJFUzPLuN0Yj+Jcrabji5N5U7ev5CZELvzkPkz4duQommfwrwAr1CEEI6
 /5aJcqnKo/HiqjZVta3G3gWGq+mKdxwjlikYR6ERHwXxCGLdmS4TfGnv/
 tC1yQYypcIC0U6ZUOtBtfIpukReoJPgULkwS2aFYws0qbgHBSHVQ1XxTr
 gR6f8TUKw8T0xXkFT3x6R74HvcoBibyWeLLyiGIWHHRRDqhF8LRvlrfst w==;
X-CSE-ConnectionGUID: rdmBTHfhScC3mfxIMX+E/Q==
X-CSE-MsgGUID: WmacfJQETc6suhGV3aBO/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58990908"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58990908"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 03:23:27 -0700
X-CSE-ConnectionGUID: wYlb5+c0QZOMWQXpcfYFtg==
X-CSE-MsgGUID: 0zTKK58kQziK686jbzw0vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="176516743"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 03:23:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, matthew.auld@intel.com, peterz@infradead.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: alexander.deucher@amd.com, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: Re: [PATCH v5 1/2] drm/buddy: Optimize free block management with
 RB tree
In-Reply-To: <20250901185604.2222-1-Arunpravin.PaneerSelvam@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250901185604.2222-1-Arunpravin.PaneerSelvam@amd.com>
Date: Tue, 02 Sep 2025 13:23:20 +0300
Message-ID: <23142157adbc54a6e2f03a2ebaf209c9bd89439e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 02 Sep 2025, Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com> wrote:
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
> v3(Matthew):
>   - Remove RB_EMPTY_NODE check in force_merge function.
>   - Rename rb for loop macros to have less generic names and move to
>     .c file.
>   - Make the rb node rb and link field as union.
>
> v4(Jani Nikula):
>   - The kernel-doc comment should be "/**"
>   - Move all the rbtree macros to rbtree.h and add parens to ensure
>     correct precedence.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>  drivers/gpu/drm/drm_buddy.c | 142 ++++++++++++++++++++++--------------
>  include/drm/drm_buddy.h     |   9 ++-
>  include/linux/rbtree.h      |  56 ++++++++++++++
>  3 files changed, 152 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index a94061f373de..978cabfbcf0f 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c

...

> +static inline struct drm_buddy_block *
> +rbtree_last_entry(struct drm_buddy *mm, unsigned int order)

Drive-by reminder that "inline" in a .c file is, in absense of evidence
to the contrary, superfluous. Please just let the compiler do its job.

BR,
Jani.


-- 
Jani Nikula, Intel
