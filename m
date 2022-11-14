Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C510F627E7B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 13:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B4E10E09F;
	Mon, 14 Nov 2022 12:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA97410E09F;
 Mon, 14 Nov 2022 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668430099; x=1699966099;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QjWg+CvyxEun+gDyBKTRZt0HnPMmJR2v/osNqjtGL7o=;
 b=BBfAVfzdLl97fuH2WzEZmSAVfc7VmAAjEhB0oNOQpTXqN2dvajr14XOt
 /im29JU8XU4bD2YfvMcM12xlYA05OcEcR0sGuhZlN2XKDSJ94AodkK++K
 iOceg0mgk7xmw2ttV3o1OgG+q1iLosCc3D42DhuWye1JIprSiMizw6ywq
 GtKmm8yCYUwGqVY46+HFrgAOVU3PcO7mwlQk6t1bkDxh4FxU54300JSsI
 Tu1qHJm6adQaioO0rSYvOt6XHJES6Ftd+T3JCr44sMGr2BXrBaqxsbkcL
 dzoG37oqwP8R0J/cwM5NrLROSikq2yhYLx3LUO8S0mgfWz7XIY0rjmhtJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="292357585"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="292357585"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 04:48:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="638465112"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="638465112"
Received: from jsarha-mobl1.ger.corp.intel.com (HELO [10.249.254.68])
 ([10.249.254.68])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 04:48:14 -0800
Message-ID: <9d0b5696-496f-a03a-2b5c-e38f36a02d86@linux.intel.com>
Date: Mon, 14 Nov 2022 13:48:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] drm/i915: Fix unhandled deadlock in grab_vma()
Content-Language: en-US
To: Mani Milani <mani@chromium.org>
References: <20221110053133.2433412-1-mani@chromium.org>
 <1d066cb4-fb82-bffd-5e89-97ba572be3fa@intel.com>
 <a26db94512198c20457ce40a6dc8692a3f8bf196.camel@linux.intel.com>
 <CAHzEqDkFAiGkTFF3C--2NKt+ALjtfiNpWYca-Y-p=sekjQXGpw@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <CAHzEqDkFAiGkTFF3C--2NKt+ALjtfiNpWYca-Y-p=sekjQXGpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Mani.

On 11/14/22 03:16, Mani Milani wrote:
> Thank you for your comments.
>
> To Thomas's point, the crash always seems to happen when the following
> sequence of events occurs:
>
> 1. When inside "i915_gem_evict_vm()", the call to
> "i915_gem_object_trylock(vma->obj, ww)" fails (due to deadlock), and
> eviction of a vma is skipped as a result. Basically if the code
> reaches here:
> https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/i915/i915_gem_evict.c#L468
> And here is the stack dump for this scenario:
>      Call Trace:
>      <TASK>
>      dump_stack_lvl+0x68/0x95
>      i915_gem_evict_vm+0x1d2/0x369
>      eb_validate_vmas+0x54a/0x6ae
>      eb_relocate_parse+0x4b/0xdb
>      i915_gem_execbuffer2_ioctl+0x6f5/0xab6
>      ? i915_gem_object_prepare_write+0xfb/0xfb
>      drm_ioctl_kernel+0xda/0x14d
>      drm_ioctl+0x27f/0x3b7
>      ? i915_gem_object_prepare_write+0xfb/0xfb
>      __se_sys_ioctl+0x7a/0xbc
>      do_syscall_64+0x56/0xa1
>      ? exit_to_user_mode_prepare+0x3d/0x8c
>      entry_SYSCALL_64_after_hwframe+0x61/0xcb
>      RIP: 0033:0x78302de5fae7
>      Code: c0 0f 89 74 ff ff ff 48 83 c4 08 49 c7 c4 ff ff ff ff 5b 4c
> 89 e0 41 5c 41 5d 5d c3 0f 1f 80 00 00 00 00 b8 10 00 00 00 0f 05 <48>
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 51 c3 0c 00 f7 d8 64 89 01 48
>      RSP: 002b:00007ffe64b87f78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>      RAX: ffffffffffffffda RBX: 000003cc00470000 RCX: 000078302de5fae7
>      RDX: 00007ffe64b87fd0 RSI: 0000000040406469 RDI: 000000000000000d
>      RBP: 00007ffe64b87fa0 R08: 0000000000000013 R09: 000003cc004d0950
>      R10: 0000000000000200 R11: 0000000000000246 R12: 000000000000000d
>      R13: 0000000000000000 R14: 00007ffe64b87fd0 R15: 0000000040406469
>      </TASK>
> It is worth noting that "i915_gem_evict_vm()" still returns success in
> this case.
>
> 2. After step 1 occurs, the next call to "grab_vma()" always fails
> (with "i915_gem_object_trylock(vma->obj, ww)" failing also due to
> deadlock), which then results in the crash.
> Here is the stack dump for this scenario:
>      Call Trace:
>      <TASK>
>      dump_stack_lvl+0x68/0x95
>      grab_vma+0x6c/0xd0
>      i915_gem_evict_for_node+0x178/0x23b
>      i915_gem_gtt_reserve+0x5a/0x82
>      i915_vma_insert+0x295/0x29e
>      i915_vma_pin_ww+0x41e/0x5c7
>      eb_validate_vmas+0x5f5/0x6ae
>      eb_relocate_parse+0x4b/0xdb
>      i915_gem_execbuffer2_ioctl+0x6f5/0xab6
>      ? i915_gem_object_prepare_write+0xfb/0xfb
>      drm_ioctl_kernel+0xda/0x14d
>      drm_ioctl+0x27f/0x3b7
>      ? i915_gem_object_prepare_write+0xfb/0xfb
>      __se_sys_ioctl+0x7a/0xbc
>      do_syscall_64+0x56/0xa1
>      ? exit_to_user_mode_prepare+0x3d/0x8c
>      entry_SYSCALL_64_after_hwframe+0x61/0xcb
>      RIP: 0033:0x78302de5fae7
>      Code: c0 0f 89 74 ff ff ff 48 83 c4 08 49 c7 c4 ff ff ff ff 5b 4c
> 89 e0 41 5c 41 5d 5d c3 0f 1f 80 00 00 00 00 b8 10 00 00 00 0f 05 <48>
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 51 c3 0c 00 f7 d8 64 89 01 48
>      RSP: 002b:00007ffe64b87f78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>      RAX: ffffffffffffffda RBX: 000003cc00470000 RCX: 000078302de5fae7
>      RDX: 00007ffe64b87fd0 RSI: 0000000040406469 RDI: 000000000000000d
>      RBP: 00007ffe64b87fa0 R08: 0000000000000013 R09: 000003cc004d0950
>      R10: 0000000000000200 R11: 0000000000000246 R12: 000000000000000d
>      R13: 0000000000000000 R14: 00007ffe64b87fd0 R15: 0000000040406469
>      </TASK>
>
> My Notes:
> - I verified the two "i915_gem_object_trylock()" failures I mentioned
> above are due to deadlock by slightly modifying the code to call
> "i915_gem_object_lock()" only in those exact cases and subsequent to
> the trylock failure, only to look at the return error code.
> - The two cases mentioned above, are the only cases where
> "i915_gem_object_trylock(obj, ww)" is called with the second argument
> not being forced to NULL.
> - When in either of the two cases above (i.e. inside "grab_vma()" or
> "i915_gem_evict_vm") I replace calling "i915_gem_object_trylock" with
> "i915_gem_object_lock", the issue gets resolved (because deadlock is
> detected and resolved).
>
> So if this could matches the design better, another solution could be
> for "grab_vma" to continue to call "i915_gem_object_trylock", but for
> "i915_gem_evict_vm" to call "i915_gem_object_lock" instead.

No, i915_gem_object_lock() is not allowed when the vm mutex is held.


>
> Further info:
> - Would you like any further info on the crash? If so, could you
> please advise 1) what exactly you need and 2) how I can share with you
> especially if it is big dumps?

Yes, I would like to know how the crash manifests itself. Is it a kernel 
BUG or a kernel WARNING or is it the user-space application that crashes 
due to receiveing an -ENOSPC?

Thanks,

Thomas



>
> Thanks.
