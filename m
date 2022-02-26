Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4D44C52F9
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 02:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5DF10ECF2;
	Sat, 26 Feb 2022 01:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E13910ECEF;
 Sat, 26 Feb 2022 01:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645838071; x=1677374071;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=c4XwgTkvLvVzkvLFlz50S3TkyY0nGuUR81eTNzG5ibk=;
 b=STqVMPiglJxUG9G5n8GTRynEeLA602c8t3YeJqc5XA1tpqinLkayjRtt
 Xx8EmTyVw5aYX5fO1ABW/4TP5UISArZlKYhVGbVzTjCw1k2/+H3R2jF6N
 uECH4FZKOUFsuFYNb6/ehhXkRFnC/nBXJCVkz1VVP9YGxY84WVd3bTCnt
 E14Cd9hXgY2DofVDUrK2DvCEEOTr2bYyDRWvx/+jV6uR8qS0SW66Sdhhu
 21jjyQzQfqgyWqv2GhXUAhJo5TpRzbeMxBAgBU6c8VQJ6P0bZgxpTH+1p
 EMKHAHjbduXTy4Qmvw7WjBYrwVfFF1Knsi0stbSeV8nEkEjgjhkJ5YSKK A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="252537539"
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; d="scan'208";a="252537539"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 17:14:30 -0800
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; d="scan'208";a="638418910"
Received: from unknown (HELO ldmartin-desk2) ([10.209.25.147])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 17:14:30 -0800
Date: Fri, 25 Feb 2022 17:14:28 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: apply PM_EARLY for non-GTT
 mappable objects
Message-ID: <20220226011428.zeyshg37i4ovykbo@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220225103443.225228-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220225103443.225228-1-matthew.auld@intel.com>
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 25, 2022 at 10:34:43AM +0000, Matthew Auld wrote:
>On DG2 we allow objects that are smaller than the min_page_size, under
>the premise that these are never mapped by the GTT, like with the paging
>structures. Currently the suspend-resume path will try to map such
>objects through the migration vm, which hits:
>
>[  560.529217] kernel BUG at drivers/gpu/drm/i915/gt/intel_migrate.c:431!
>[  560.536081] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
>[  560.541629] CPU: 4 PID: 2062 Comm: rtcwake Tainted: G        W         5.17.0-rc5-demarchi+ #175
>[  560.550716] Hardware name: Intel Corporation CoffeeLake Client Platform/CoffeeLake S UDIMM RVP, BIOS CNLSFWR1.R00.X220.B00.2103302221 03/30/2021
>[  560.563627] RIP: 0010:emit_pte+0x2e7/0x380 [i915]
>[  560.568665] Code: ee 02 48 89 69 04 83 c6 05 83 c0 05 39 f0 0f 4f c6 48 8b 73 08 39 d0 0f 4f c2 44 89 f2 4c 8d 4a ff 49 85 f1 0f 84 62 fe ff ff <0f> 0b 48 c7 03 00 00 00 00 4d 89 c6 8b 01 48 29 ce 48 8d 57 0c 48
>[  560.587691] RSP: 0018:ffffc9000104f8a0 EFLAGS: 00010206
>[  560.592906] RAX: 0000000000000040 RBX: ffffc9000104f908 RCX: ffffc900025114d0
>[  560.600024] RDX: 0000000000010000 RSI: 00000003f9fe2000 RDI: ffffc900025114dc
>[  560.607458] RBP: 0000000001840000 R08: ffff88810f335540 R09: 000000000000ffff
>[  560.614865] R10: 000000000000081b R11: 0000000000000001 R12: 000000000000081b
>[  560.622300] R13: 0000000000000000 R14: 0000000000010000 R15: ffff888107c3e240
>[  560.629716] FS:  00007f5b7c086580(0000) GS:ffff88846dc00000(0000) knlGS:0000000000000000
>[  560.638090] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>[  560.644132] CR2: 00007f3ab0a133a8 CR3: 000000010a43e003 CR4: 00000000003706e0
>[  560.651590] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>[  560.659002] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>[  560.666438] Call Trace:
>[  560.668885]  <TASK>
>[  560.670983]  intel_context_migrate_copy+0x1b1/0x4c0 [i915]
>[  560.676794]  __i915_ttm_move+0x628/0x790 [i915]
>[  560.681704]  ? dma_resv_iter_next+0x8f/0xb0
>[  560.686223]  ? dma_resv_iter_first+0xe5/0x140
>[  560.690894]  ? i915_deps_add_resv+0x4b/0x110 [i915]
>[  560.696147]  ? dma_resv_reserve_shared+0x161/0x310
>[  560.701228]  i915_gem_obj_copy_ttm+0x10f/0x220 [i915]
>[  560.706650]  i915_ttm_backup+0x191/0x2f0 [i915]
>[  560.711558]  i915_gem_process_region+0x266/0x3b0 [i915]
>[  560.717153]  ? verify_cpu+0xf0/0x100
>[  560.721040]  ? pci_pm_resume_early+0x20/0x20
>[  560.725603]  i915_ttm_backup_region+0x47/0x70 [i915]
>[  560.730927]  i915_gem_backup_suspend+0x141/0x170 [i91
>
>For now let's just force the memcpy path for such objects during
>suspend-resume.
>
>Fixes: 00e27ad85bc9 ("drm/i915/migrate: add acceleration support for DG2")
>Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
