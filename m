Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 537454C3181
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 17:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DD589065;
	Thu, 24 Feb 2022 16:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D1F10EA55;
 Thu, 24 Feb 2022 16:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645720436; x=1677256436;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Uz+P3GmwJWBqrlRoentvfV7N/aog/e2VXVk4SncJBwY=;
 b=TLAM+VRAYri9dwU74V4w6A9t1I1wxRZjYh7dmKSvRypkjfg7hvj61SRx
 4k/dXd8d8Brrl1v7wnXkeESiesWWcO30k86qFoRwEfaDHLXcL7P89r+pv
 7jzbqi+fhcjR4nDe0k11X5zhNJ2v8kXEcxXqKuFrzBujk49WdTPdQ1F/R
 DY9izEptti4dDRbIXpEXJ0uGJp4dV971Xyg+tg/Ck9kFyeieiatyOdF0K
 8aAWTPhEgfPzicu4V9ej+2pJoS5gsgrOLGa+cVxl/j1IPmvJZWN8POHMd
 Hk0MGWYVFwILMAqfq4Mcg3C8yI0j7MPPvaIhgeQOzatiOI05zR6VPPpxF A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252197407"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="252197407"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 08:33:28 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="548819626"
Received: from acstuden-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.98.77])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 08:33:28 -0800
Date: Thu, 24 Feb 2022 08:33:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH 1/2] kernel/hung_task: Exporting
 sysctl_hung_task_timeout_secs
Message-ID: <20220224163322.3qnm4zyvawr5eksf@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220223195203.13708-1-ramalingam.c@intel.com>
 <20220223195203.13708-2-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220223195203.13708-2-ramalingam.c@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 24, 2022 at 01:22:02AM +0530, Ramalingam C wrote:
>Exporting sysctl_hung_task_timeout_secs, to make it available for other
>kernel modules.

I guess this should only be done if second patch is accepted by sound
subsystem maintainers. If it is, then I'd do some changes in the commit
message.

Please use imperative style in commit messages. Here we also need to
give more details on why we are exporting this and Cc the maintainers.
Proposed new message:

Subject: kernel/hung_task: Export sysctl_hung_task_timeout_secs

Kernel modules may want to read sysctl_hung_task_timeout_secs so they
can do long waits by multiples of that value, avoiding the hung task
detector to trigger. This is already done in other places in the kernel
that are builtin-only, like:

	block/bio.c:submit_bio_wait()
	block/blk-mq.c:blk_execute_rq()
	mm/kfence/core.c:toggle_allocation_gate()

Export it so it can also be used by modules.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kai Vehmanen <kai.vehmanen@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz> 
Cc: Takashi Iwai <tiwai@suse.com>

>
>Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>cc: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> kernel/hung_task.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/kernel/hung_task.c b/kernel/hung_task.c
>index db59b6d4f0e7..01120265395d 100644
>--- a/kernel/hung_task.c
>+++ b/kernel/hung_task.c
>@@ -43,6 +43,7 @@ int __read_mostly sysctl_hung_task_check_count = PID_MAX_LIMIT;
>  * Zero means infinite timeout - no checking done:
>  */
> unsigned long __read_mostly sysctl_hung_task_timeout_secs = CONFIG_DEFAULT_HUNG_TASK_TIMEOUT;
>+EXPORT_SYMBOL(sysctl_hung_task_timeout_secs);
>
> /*
>  * Zero (default value) means use sysctl_hung_task_timeout_secs:
>-- 
>2.20.1
>
