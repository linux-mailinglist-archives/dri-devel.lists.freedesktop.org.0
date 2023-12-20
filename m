Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F9881AB00
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 00:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0462610E63D;
	Wed, 20 Dec 2023 23:25:37 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF3410E63C;
 Wed, 20 Dec 2023 23:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703114737; x=1734650737;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9K2nRtVniCRLeJk82cRYz2YcN0wincSMSqfvmRjYvfs=;
 b=UdfcLAqHHHpiuZ+cfBxQrbTcT5Tz29ZlQcqa4onRd8/DViVR3lAFUGYQ
 tVNhj4ELPwgHCAKJiaGK3Y3F7QlSGnWiAOapxmD8dBEsaFX9CglssXWoJ
 A8YGoWSFjnLWFGEGVJ56/J9d1P3yDG0QdZGSJmAIsmqggMj5FN0VEWUuD
 m7nAm7Dm1CVqxBJofQQ4mHY0LeOeYfeJGqxRNDCv6HNvQbtQfNTCFWUJE
 SAhzx0TE6ieKaiF9tope3bFGnmnd4cIU64ZvKikCCzlqBdgclNBqExrYv
 UpYXne5bhCnpbrirzAwytIOSzaegHn+dllC1QU0/lQ0d8Ovwoid9dHwWL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2744438"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; 
   d="scan'208";a="2744438"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 15:25:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="1107881160"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; d="scan'208";a="1107881160"
Received: from anaperez-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.101])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 15:25:30 -0800
Date: Thu, 21 Dec 2023 00:25:28 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [PATCH] drm/i915/guc: Avoid circular locking issue on busyness
 flush
Message-ID: <ZYN36KOa5eXyhGrc@ashyti-mobl2.lan>
References: <20231219195957.212600-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219195957.212600-1-John.C.Harrison@Intel.com>
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, Intel-GFX@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On Tue, Dec 19, 2023 at 11:59:57AM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Avoid the following lockdep complaint:
> <4> [298.856498] ======================================================
> <4> [298.856500] WARNING: possible circular locking dependency detected
> <4> [298.856503] 6.7.0-rc5-CI_DRM_14017-g58ac4ffc75b6+ #1 Tainted: G
>     N
> <4> [298.856505] ------------------------------------------------------
> <4> [298.856507] kworker/4:1H/190 is trying to acquire lock:
> <4> [298.856509] ffff8881103e9978 (&gt->reset.backoff_srcu){++++}-{0:0}, at:
> _intel_gt_reset_lock+0x35/0x380 [i915]
> <4> [298.856661]
> but task is already holding lock:
> <4> [298.856663] ffffc900013f7e58
> ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}, at:
> process_scheduled_works+0x264/0x530
> <4> [298.856671]
> which lock already depends on the new lock.
> 
> The complaint is not actually valid. The busyness worker thread does
> indeed hold the worker lock and then attempt to acquire the reset lock
> (which may have happened in reverse order elsewhere). However, it does
> so with a trylock that exits if the reset lock is not available
> (specifically to prevent this and other similar deadlocks).
> Unfortunately, lockdep does not understand the trylock semantics (the
> lock is an i915 specific custom implementation for resets).
> 
> Not doing a synchronous flush of the worker thread when a reset is in
> progress resolves the lockdep splat by never even attempting to grab
> the lock in this particular scenario.
> 
> There are situatons where a synchronous cancel is required, however.
> So, always do the synchronous cancel if not in reset. And add an extra
> synchronous cancel to the end of the reset flow to account for when a
> reset is occurring at driver shutdown and the cancel is no longer
> synchronous but could lead to unallocated memory accesses if the
> worker is not stopped.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
