Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05AC78C211
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 12:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727F910E1DB;
	Tue, 29 Aug 2023 10:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283EA10E1DA;
 Tue, 29 Aug 2023 10:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693303906; x=1724839906;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TCaknBJQgkAY1ehfuPHPMUUGmoFcsxoJKao3euveK58=;
 b=OThQKTw1uoT6imsnTa6lwqHzy/aC778Ji68Xyp11UryiZcaxA7SFQ2uR
 uXiRCL0mXSmROHTAKgEOwLWEZMM/GutYKXXRm62hYOLfJFfHvIwSwkTrJ
 +O39aZZZHDC3Nb3cnFyKk/wRUkfx/wIAmjS6KQA1BsV1AgVau7glQZPrq
 pf8Lyst5iwaASGxgiYOz1NfBjLZb4sn2EIhU2DH4Of7BoqzgQ5VDDG1gm
 Zimhns/l/doROYzPQeftmpWwTp9O6eiJ7eC6LPMH/bnh70XR4KAa4kk7r
 11P+yyMjSjQm7ClZ4YLDZeTzERELOhMyus8Ru9h2ODhvtJsJEX7edaEOP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="372742950"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="372742950"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 03:11:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="773643888"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="773643888"
Received: from ogbrugge-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.42.59])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 03:11:37 -0700
Date: Tue, 29 Aug 2023 12:11:19 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH v5] drm/i915: Avoid circular locking dependency when
 flush delayed work on gt reset
Message-ID: <ZO3ERy0HOd6Jlf3p@ashyti-mobl2.lan>
References: <20230811182011.546026-1-zhanjun.dong@intel.com>
 <3a745c83-e7cf-6a24-5556-8c0c019adfec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a745c83-e7cf-6a24-5556-8c0c019adfec@intel.com>
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, intel-gfx@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zhanjun,

On Tue, Aug 22, 2023 at 11:53:24AM -0700, John Harrison wrote:
> On 8/11/2023 11:20, Zhanjun Dong wrote:
> 
>     This attempts to avoid circular locking dependency between flush delayed
>     work and intel_gt_reset.
>     When intel_gt_reset was called, task will hold a lock.
>     To cacel delayed work here, the _sync version will also acquire a lock,
>     which might trigger the possible cirular locking dependency warning.
>     When intel_gt_reset called, reset_in_progress flag will be set, add code
>     to check the flag, call async verion if reset is in progress.

I liked the previous commit, it just needed to be wrapped (not in
the dmesg copy-paste part).

>     Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>     Cc: John Harrison <John.C.Harrison@Intel.com>
>     Cc: Andi Shyti <andi.shyti@linux.intel.com>
>     Cc: Daniel Vetter <daniel@ffwll.ch>
>     ---
>      drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 ++++++++++-
>      1 file changed, 10 insertions(+), 1 deletion(-)
> 
>     diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>     index a0e3ef1c65d2..600388c849f7 100644
>     --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>     +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>     @@ -1359,7 +1359,16 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
> 
>      static void guc_cancel_busyness_worker(struct intel_guc *guc)
>      {
>     -       cancel_delayed_work_sync(&guc->timestamp.work);
>     +       /*
>     +        * When intel_gt_reset was called, task will hold a lock.
>     +        * To cacel delayed work here, the _sync version will also acquire a lock, which might
>     +        * trigger the possible cirular locking dependency warning.
>     +        * Check the reset_in_progress flag, call async verion if reset is in progress.
>     +        */

Indeed the commit message is a bit misleading and it raises some
alarms if explained it this way.

> This needs to explain in much more detail what is going on and why it is not a
> problem. E.g.:
> 
>     The busyness worker needs to be cancelled. In general that means using the
>     synchronous cancel version to ensure that an in-progress worker will not
>     keep executing beyond whatever is happening that needs the cancel. E.g.
>     suspend, driver unload, etc. However, in the case of a reset, the
>     synchronous version is not required and can trigger a false deadlock
>     detection warning.
> 
>     The business worker takes the reset mutex to protect against resets
>     interfering with it. However, it does a trylock and bails out if the reset
>     lock is already acquired. Thus there is no actual deadlock or other concern
>     with the worker running concurrently with a reset. So an asynchronous
>     cancel is safe in the case of a reset rather than a driver unload or
>     suspend type operation. On the other hand, if the cancel_sync version is
>     used when a reset is in progress then the mutex deadlock detection sees the
>     mutex being acquired through multiple paths and complains.
> 
>     So just don't bother. That keeps the detection code happy and is safe
>     because of the trylock code described above.

Can you please update the commit message with John's suggestion?

Is there any further question on this?

Andi
