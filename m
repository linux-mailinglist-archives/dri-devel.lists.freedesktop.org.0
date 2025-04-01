Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9622FA7815A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C29F10E634;
	Tue,  1 Apr 2025 17:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DfqT+uiJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A4410E634
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 17:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743528118; x=1775064118;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sw5kQGXBvDon0GtKAlU/GgteLsqCcT1S93qr/H1Icuc=;
 b=DfqT+uiJKAu4JzuagkqIyYhXgTxyC/+tEz1FG88Ge1ULvup7uoIXdV1K
 RbbVcXBNMjAjSd4pHyvwNZirx6mEPIrNy06QySb+ugJX10ENjUbh6MTFy
 b5yaj3FYo01LzH1KbU1QUB8B4A34akCwo1LvNZ1NwodXPdpBdKHcYgO6F
 5cPTONH7mqybI3J9hnLNI/m1fYpfMimN6wweBLOzyFibMAuNOGlwApJYg
 ZMy3AW4SwsNLVkTM5aSjWKXctJCzEGner9ydgQoyT6dAlOXaIb972QJV8
 R7Vpkr2TbluPdHGPUFJ6ghpWoB5KCS5XDC82geZvf9JPVVaeoOg/kgtlH A==;
X-CSE-ConnectionGUID: D2uamLv4QTKJ8XLEAXJfpg==
X-CSE-MsgGUID: ileDZyTRS/6RqgHlcvVpSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55524613"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="55524613"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 10:21:53 -0700
X-CSE-ConnectionGUID: TXx+znVgR9qIz6q8nYbPtg==
X-CSE-MsgGUID: 9o0yRzTTRuuxo1YFWrajfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126206797"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 01 Apr 2025 10:21:49 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 406F634973;
 Tue,  1 Apr 2025 18:21:44 +0100 (IST)
Message-ID: <e4b7e7ae-60d4-48f8-8b3a-ae8f0f41a916@intel.com>
Date: Tue, 1 Apr 2025 19:21:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] drm/xe/vf: Divide ballooning into allocation and
 insertion
To: Tomasz Lis <tomasz.lis@intel.com>, dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250331132107.1242954-1-tomasz.lis@intel.com>
 <20250331132107.1242954-2-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250331132107.1242954-2-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Tomasz,

Since we use 'ballooning' concept for GGTT, please include 'GGTT' in the
title to make it more specific

On 31.03.2025 15:21, Tomasz Lis wrote:
> The balloon nodes used to fill areas of GGTT inaccessible for
> a specific VF, were allocaten and inserted into GGTT within

typo

> one function. This disallowed re-using the insertion part
> during VF migration recovery.

The wording "This disallowed re-using" sounds like there is a bug in
current implementation, while all we want is to refactor the code, to
make if more reusable, so IMO we can just drop this sentence, and just
add in the one below that the split is for the "reuse".

> 
> This patch separates allocation (init/fini functs) from the insertion
> of balloons (balloon/deballoon functs). Locks are also moved to ensure
> calls from post-migration recovery worker will not cause a deadlock.

hmm, this new locking is not looking as robust as before ... see below

> 
> v2: Moved declarations to proper header
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c        |  9 +---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 64 ++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  2 +
>  3 files changed, 52 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 5fcb2b4c2c13..2d7456e37ef4 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -452,9 +452,7 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
>  	node->base.start = start;
>  	node->base.size = end - start;
>  
> -	mutex_lock(&ggtt->lock);

Functions that don't take the lock on it's own and expect lock to be
already taken we usually name with "_locked" suffix and use explicit

	lockdep_assert_held

to make sure it is enforced

also consider whether there should be just two variants of the function
defined in xe_ggtt:

	xe_ggtt_node_insert_balloon_locked()
	{
		lockdep_assert_held
		...
	}

	xe_ggtt_node_insert_balloon()
	{
		mutex_lock
		xe_ggtt_node_insert_balloon_locked()
		mutex_unlock
	}

>  	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
> -	mutex_unlock(&ggtt->lock);
>  
>  	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
>  		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
> @@ -477,16 +475,11 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
>  		return;
>  
>  	if (!drm_mm_node_allocated(&node->base))
> -		goto free_node;
> +		return;
>  
>  	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
>  
> -	mutex_lock(&node->ggtt->lock);
>  	drm_mm_remove_node(&node->base);
> -	mutex_unlock(&node->ggtt->lock);

same here

	xe_ggtt_node_remove_balloon_locked()
	{
		lockdep_assert_held
		...
	}

	xe_ggtt_node_remove_balloon()
	{
		mutex_lock
		xe_ggtt_node_remove_balloon_locked()
		mutex_unlock
	}

> -
> -free_node:
> -	xe_ggtt_node_fini(node);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index a439261bf4d7..9edbe34f45f4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -560,26 +560,33 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>  	return gt->sriov.vf.self_config.lmem_size;
>  }
>  
> -static struct xe_ggtt_node *
> -vf_balloon_ggtt_node(struct xe_ggtt *ggtt, u64 start, u64 end)
> +static int
> +vf_balloon_ggtt_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> +		     u64 start, u64 end)

as this function is now just a simple wrapper around
xe_ggtt_node_insert_balloon then maybe it's not needed and caller may
use xe_ggtt_node_insert_balloon directly?

>  {
> -	struct xe_ggtt_node *node;
>  	int err;
>  
> -	node = xe_ggtt_node_init(ggtt);
>  	if (IS_ERR(node))

this runtime check shouldn't be needed any more as any node_init()
failure shall trigger probe abort

> -		return node;
> +		return PTR_ERR(node);
>  
>  	err = xe_ggtt_node_insert_balloon(node, start, end);
>  	if (err) {
> -		xe_ggtt_node_fini(node);
> -		return ERR_PTR(err);
> +		return err;
>  	}
>  
> -	return node;
> +	return 0;
>  }
>  
> -static int vf_balloon_ggtt(struct xe_gt *gt)
> +static void xe_gt_sriov_vf_balloon_init(struct xe_gt *gt)

please don't use fully qualified names for static functions
here it could be as simple as:

	vf_init_ggtt_balloons()

> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
> +
> +	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
> +	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);

failure in any of xe_ggtt_node_init() is fatal from the VF POV and shall
trigger immediate probe abort

btw, maybe it's good time to add new function variant:

	xe_ggtt_node_init_managed()

to make sure we don't forget to call xe_ggtt_node_fini() ?

> +}
> +
> +int xe_gt_sriov_vf_balloon_ggtt(struct xe_gt *gt)

all new public functions shall have proper kernel-doc

>  {
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -589,6 +596,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>  	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	lockdep_assert_held(&tile->mem.ggtt->lock);
>  
>  	if (!config->ggtt_size)
>  		return -ENODATA;
> @@ -611,7 +619,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>  	start = xe_wopcm_size(xe);
>  	end = config->ggtt_base;
>  	if (end != start) {
> -		tile->sriov.vf.ggtt_balloon[0] = vf_balloon_ggtt_node(ggtt, start, end);
> +		vf_balloon_ggtt_node(ggtt, tile->sriov.vf.ggtt_balloon[0], start, end);
>  		if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
>  			return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
>  	}
> @@ -619,7 +627,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>  	start = config->ggtt_base + config->ggtt_size;
>  	end = GUC_GGTT_TOP;
>  	if (end != start) {
> -		tile->sriov.vf.ggtt_balloon[1] = vf_balloon_ggtt_node(ggtt, start, end);
> +		vf_balloon_ggtt_node(ggtt, tile->sriov.vf.ggtt_balloon[1], start, end);
>  		if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
>  			xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
>  			return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
> @@ -629,15 +637,34 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>  	return 0;
>  }
>  
> -static void deballoon_ggtt(struct drm_device *drm, void *arg)
> +void xe_gt_sriov_vf_deballoon_ggtt(struct xe_gt *gt)

if this is a public function now, then kernel-doc is required

>  {
> -	struct xe_tile *tile = arg;
> +	struct xe_tile *tile = gt_to_tile(gt);
>  
>  	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +	lockdep_assert_held(&tile->mem.ggtt->lock);

why here?
it should be already part of the xe_ggtt_node_remove_balloon()

>  	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[1]);
>  	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
>  }
>  
> +static void xe_gt_sriov_vf_balloon_fini(struct xe_gt *gt)

don't use fully qualified names for static functions
look around how everything else is named!

> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +
> +	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
> +	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> +}
> +
> +static void deballoon_ggtt(struct drm_device *drm, void *arg)
> +{
> +	struct xe_tile *tile = arg;
> +
> +	mutex_lock(&tile->mem.ggtt->lock);
> +	xe_gt_sriov_vf_deballoon_ggtt(tile->primary_gt);
> +	mutex_unlock(&tile->mem.ggtt->lock);
> +	xe_gt_sriov_vf_balloon_fini(tile->primary_gt);
> +}
> +
>  /**
>   * xe_gt_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
>   * @gt: the &xe_gt
> @@ -650,14 +677,21 @@ int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  	int err;
>  
>  	if (xe_gt_is_media_type(gt))
>  		return 0;
>  
> -	err = vf_balloon_ggtt(gt);
> -	if (err)
> +	xe_gt_sriov_vf_balloon_init(gt);
> +
> +	mutex_lock(&ggtt->lock);
> +	err = xe_gt_sriov_vf_balloon_ggtt(gt);
> +	mutex_unlock(&ggtt->lock);
> +	if (err) {
> +		xe_gt_sriov_vf_balloon_fini(gt);

since you have split ballooning into two parts, both parts deserve it's
own cleanup "actions" to avoid any mistakes in manual cleanup sequence
like this (or we can rely on the new xe_ggtt_node_init_managed if added)

>  		return err;
> +	}
>  
>  	return drmm_add_action_or_reset(&xe->drm, deballoon_ggtt, tile);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index ba6c5d74e326..c87b0e9c7ebc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -18,6 +18,8 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
> +int xe_gt_sriov_vf_balloon_ggtt(struct xe_gt *gt);
> +void xe_gt_sriov_vf_deballoon_ggtt(struct xe_gt *gt);
>  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  

