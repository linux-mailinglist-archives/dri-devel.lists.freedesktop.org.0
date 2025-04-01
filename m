Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB4DA78151
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2522A10E62D;
	Tue,  1 Apr 2025 17:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LAYKJGel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24DE10E62D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 17:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743528003; x=1775064003;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9v2/BVb/MT2vav3Jc2L6UQQ0F0HWEHdTwDNdsMzxlAc=;
 b=LAYKJGel+E3XqiGa5aX4FxcQeElLAD8/lh7DjWPTlGPtIZhksTIaR/if
 kjjNRtZp+ZdmP2sroC7Hz/90F+JuBOUvrOaLLy1KkI7YnmSBIvLj0h8pT
 CUc99lPC5xoL6Pe3/sw//JDvCXM8fghxD02j9uRCuunYHA+/qcKkrrh8L
 a0XN/6bV2itJHa6fWBtgBylgIoCzolwapXAh8PDdzjD0+PFGjOj/LfyUU
 knoPWOGtuQTi9cfytRctFHtqSaOohEGI5nCaTEWUMBWBAKqgRhSp/48H3
 zTrbwOmLyf7lgQIaXQNCtw0NeHCAFL6mavmS3f5AuBt/Do4QzW/VVms2V A==;
X-CSE-ConnectionGUID: opzFv5v5RzWW4N04bCsM9w==
X-CSE-MsgGUID: /xaQUc54Ts28nBTdhJ9fEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55524280"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="55524280"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 10:20:03 -0700
X-CSE-ConnectionGUID: a6UK/Sh9T3y6kyIMcUMS8Q==
X-CSE-MsgGUID: UN9gT+yuT+qlqWWyQWl9pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126206433"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 01 Apr 2025 10:20:01 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6165934972;
 Tue,  1 Apr 2025 18:19:59 +0100 (IST)
Message-ID: <0ba89b4d-956a-4d9b-a9ae-62ca787c9975@intel.com>
Date: Tue, 1 Apr 2025 19:19:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] drm/xe/vf: Post-migration recovery of GGTT nodes
 and CTB
To: Tomasz Lis <tomasz.lis@intel.com>, dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250331132107.1242954-1-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250331132107.1242954-1-tomasz.lis@intel.com>
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

This series should be primary sent to the intel-xe as series is xe
specific and it's the only way to get CI results for the xe driver.

Once you dropped the drm_mm patch, the dri-devel is not required.

On 31.03.2025 15:21, Tomasz Lis wrote:
> To support VF Migration, it is necessary to do fixups to any
> non-virtualized resources. These fixups need to be applied within
> VM, on the KMD working with VF.
> 
> This series adds two fixup functions to the recovery worker:
> * for fixing drm_mm nodes which represent GGTT allocations
> * for fixing content of outgoing CTB buffer
> 
> v2: Fixed missing include, made checkpatch happy
> v3: Moved some functs to xe_ggtt.c; moved shift computation to just
>   after querying; improved documentation; switched some warns to asserts;
>   skipping fixups when GGTT shift eq 0; iterating through tiles rather
>   than gts; fixes in log messages
> v4: Updated kerneldocs, removed unused funct, properly allocate
>   balloning nodes if non existent, removed inline keywords, enums for
>   offsets in CTB messages, less error messages, if return unused then
>   made functs void
> v5: Removed drm_mm change, but added VF init modifications. These then
>   allowed to re-use ballooning functions during ggtt node fixing.
> v6: Minor update - fixed some misplaced funct declarations
> 
> Tomasz Lis (4):
>   drm/xe/vf: Divide ballooning into allocation and insertion
>   drm/xe/sriov: Shifting GGTT area post migration
>   drm/xe/guc: Introduce enum with offsets for multi-LRC register H2G
>   drm/xe/vf: Fixup CTB send buffer messages after migration
> 
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h  |   7 ++
>  drivers/gpu/drm/xe/xe_ggtt.c              |  40 ++++--
>  drivers/gpu/drm/xe/xe_ggtt.h              |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 147 +++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   3 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
>  drivers/gpu/drm/xe/xe_guc_ct.c            | 142 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.h            |   2 +
>  drivers/gpu/drm/xe/xe_guc_submit.c        |   4 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c          |  42 +++++++
>  10 files changed, 368 insertions(+), 22 deletions(-)
> 

