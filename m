Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6482493F11E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 11:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443F610E374;
	Mon, 29 Jul 2024 09:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTz/vxVb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7687C10E374
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 09:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722245393; x=1753781393;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Okn6Hh7a8OxqdINhFpBMmcm+OFNUZUiCDEeJ7M45+Ag=;
 b=FTz/vxVbdaVtlhCyuYMslzKkZUiFuUBaYzqYn9LrxwM15kb81n5LYetM
 u7VHgOIu1LDwy0B5gMcIjYhG2xkV89m95/lanGRU6mClaQjBMp6CiycTv
 +RV+IypDCFxOdg8RqH8CjdPkkisJ7K8Z0kDfryjJ7hZ4OYurt7Whr1JSM
 EN6dnqQR22gMSvmC0FzEipdP/2tDKz5w6rXpL3JCUx17ODXSAzQhZB6Jy
 2kV73zLRiWhEGliUX6QnhJpNc17gu8W0wMxg4X8vnotDuKQEjEIlvpImC
 2n78RUR9F4iFSH8pImfwcL8f4atWWFngoy8XNQ0XBmnXM5kEw6QiC8JNS A==;
X-CSE-ConnectionGUID: vbmrqboDTbaiGrwVu5Kbbw==
X-CSE-MsgGUID: xml9CuFKRSG/MVr29mpX3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="30606921"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="30606921"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 02:29:52 -0700
X-CSE-ConnectionGUID: si+UUBxSQyyqZAevhhfeqw==
X-CSE-MsgGUID: D2TdvVJKRvC0UDCGKJ8A3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="54513537"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.185])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 02:29:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yafang Shao <laoar.shao@gmail.com>, akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: Re: [PATCH resend v4 00/11] Improve the copy of task comm
In-Reply-To: <20240729023719.1933-1-laoar.shao@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240729023719.1933-1-laoar.shao@gmail.com>
Date: Mon, 29 Jul 2024 12:29:43 +0300
Message-ID: <87bk2gzgu0.fsf@intel.com>
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

On Mon, 29 Jul 2024, Yafang Shao <laoar.shao@gmail.com> wrote:
> Hello Andrew,
>
> Is it appropriate for you to apply this to the mm tree?
>
> Using {memcpy,strncpy,strcpy,kstrdup} to copy the task comm relies on the
> length of task comm. Changes in the task comm could result in a destination
> string that is overflow. Therefore, we should explicitly ensure the destination
> string is always NUL-terminated, regardless of the task comm. This approach
> will facilitate future extensions to the task comm.

Why are we normalizing calling double-underscore prefixed functions all
over the place? i.e. __get_task_comm().

get_task_comm() is widely used. At a glance, looks like it could be used
in many of the patches here too.


BR,
Jani.


>
> As suggested by Linus [0], we can identify all relevant code with the
> following git grep command:
>
>   git grep 'memcpy.*->comm\>'
>   git grep 'kstrdup.*->comm\>'
>   git grep 'strncpy.*->comm\>'
>   git grep 'strcpy.*->comm\>'
>
> PATCH #2~#4:   memcpy
> PATCH #5~#6:   kstrdup
> PATCH #7~#9:   strncpy
> PATCH #10~#11: strcpy
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Link: https://lore.kernel.org/all/CAHk-=wjAmmHUg6vho1KjzQi2=psR30+CogFd4aXrThr2gsiS4g@mail.gmail.com/ [0]
>
> Changes:
> v3->v4:
> - Rename __kstrndup() to __kmemdup_nul() and define it inside mm/util.c
>   (Matthew)
> - Remove unused local varaible (Simon)
>
> v2->v3: https://lore.kernel.org/all/20240621022959.9124-1-laoar.shao@gmail.com/
> - Deduplicate code around kstrdup (Andrew)
> - Add commit log for dropping task_lock (Catalin)
>
> v1->v2: https://lore.kernel.org/bpf/20240613023044.45873-1-laoar.shao@gmail.com/
> - Add comment for dropping task_lock() in __get_task_comm() (Alexei)
> - Drop changes in trace event (Steven)
> - Fix comment on task comm (Matus)
>
> v1: https://lore.kernel.org/all/20240602023754.25443-1-laoar.shao@gmail.com/
>
> Yafang Shao (11):
>   fs/exec: Drop task_lock() inside __get_task_comm()
>   auditsc: Replace memcpy() with __get_task_comm()
>   security: Replace memcpy() with __get_task_comm()
>   bpftool: Ensure task comm is always NUL-terminated
>   mm/util: Fix possible race condition in kstrdup()
>   mm/util: Deduplicate code in {kstrdup,kstrndup,kmemdup_nul}
>   mm/kmemleak: Replace strncpy() with __get_task_comm()
>   tsacct: Replace strncpy() with __get_task_comm()
>   tracing: Replace strncpy() with __get_task_comm()
>   net: Replace strcpy() with __get_task_comm()
>   drm: Replace strcpy() with __get_task_comm()
>
>  drivers/gpu/drm/drm_framebuffer.c     |  2 +-
>  drivers/gpu/drm/i915/i915_gpu_error.c |  2 +-
>  fs/exec.c                             | 10 ++++-
>  include/linux/sched.h                 |  4 +-
>  kernel/auditsc.c                      |  6 +--
>  kernel/trace/trace.c                  |  2 +-
>  kernel/trace/trace_events_hist.c      |  2 +-
>  kernel/tsacct.c                       |  2 +-
>  mm/kmemleak.c                         |  8 +---
>  mm/util.c                             | 61 ++++++++++++---------------
>  net/ipv6/ndisc.c                      |  2 +-
>  security/lsm_audit.c                  |  4 +-
>  security/selinux/selinuxfs.c          |  2 +-
>  tools/bpf/bpftool/pids.c              |  2 +
>  14 files changed, 51 insertions(+), 58 deletions(-)

-- 
Jani Nikula, Intel
