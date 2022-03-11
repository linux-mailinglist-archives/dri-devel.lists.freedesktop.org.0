Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FCE4D688F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 19:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4F110EA37;
	Fri, 11 Mar 2022 18:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C860410E9ED;
 Fri, 11 Mar 2022 18:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647024029; x=1678560029;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=46/bMcu09bIxWS1KDrnIfbZUg1nV/7PZbzJRWpA4xPc=;
 b=ladhWrYRJU1G0bdLPeVLP3CKkkHpRgwgPCOus3uYGmrcXXZqu/p5VWux
 Q+2CKJjE1aQ5v6Dg+zFGR7zUjQoHVz6jYRZHVwnOud/PRql5wZsdhSBqt
 AGKMCYzQdZxl41udbseyuisiDY4ELHcw2hV2fd7ReLQ6xne6FoMKPwvSE
 h/uVm4HXqvl5fDt2C6m2bf5vddwwETGak6Nx9Yo/wSrhEfMrPQ54FZ1OA
 xNLzlTw6wVfE+3QAZhAZnZbFHYxT7VtzHAKiYzv+XKxCEcLGGW3vH/AEx
 WBL1YCq9r6HqHxG0qcTaN70yRvFcatQIooeXh9fbBYw1D/itZm64l5j0X w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="255577521"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="255577521"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 10:40:29 -0800
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="597196064"
Received: from rbgreen-mobl3.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.239.245])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 10:40:28 -0800
Date: Fri, 11 Mar 2022 10:40:28 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH] drm/i915/guc: Use iosys_map interface to update lrc_desc
Message-ID: <20220311184028.phqpfrnbzkryf2zs@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220308164742.692540-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220308164742.692540-1-balasubramani.vivekanandan@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, michael.cheng@intel.com,
 wayne.boyer@intel.com, intel-gfx@lists.freedesktop.org,
 casey.g.bowman@intel.com, dri-devel@lists.freedesktop.org,
 siva.mullati@intel.com,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 08, 2022 at 10:17:42PM +0530, Balasubramani Vivekanandan wrote:
>This patch is continuation of the effort to move all pointers in i915,
>which at any point may be pointing to device memory or system memory, to
>iosys_map interface.
>More details about the need of this change is explained in the patch
>series which initiated this task
>https://patchwork.freedesktop.org/series/99711/
>
>This patch converts all access to the lrc_desc through iosys_map
>interfaces.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---

...

>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>@@ -2245,13 +2256,13 @@ static void prepare_context_registration_info(struct intel_context *ce)
> 	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
> 		   i915_gem_object_is_lmem(ce->ring->vma->obj));
>
>-	desc = __get_lrc_desc(guc, ctx_id);
>-	desc->engine_class = engine_class_to_guc_class(engine->class);
>-	desc->engine_submit_mask = engine->logical_mask;
>-	desc->hw_context_desc = ce->lrc.lrca;
>-	desc->priority = ce->guc_state.prio;
>-	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>-	guc_context_policy_init(engine, desc);
>+	memset(&desc, 0, sizeof(desc));

previously we would re-use whatever was left in
guc->lrc_desc_pool_vaddr. Here we are changing it to always zero
everything and set the fields we are interested in.

As I'm not too familiar with this part and I see us traversing child guc_process_desc
which may point to the same id, it doesn't _feel_ safe. Did you check if
this is not zero'ing what it shouldn't?

Matt Brost / John / Daniele, could you clarify?

thanks
Lucas De Marchi
