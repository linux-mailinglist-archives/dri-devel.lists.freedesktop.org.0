Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E1D42232C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 12:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995086E3BB;
	Tue,  5 Oct 2021 10:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE0C89178;
 Tue,  5 Oct 2021 10:13:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="226016660"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="226016660"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 03:13:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="438643168"
Received: from tbarret1-mobl.ger.corp.intel.com (HELO [10.213.238.194])
 ([10.213.238.194])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 03:13:18 -0700
Subject: Re: [Intel-gfx] [PATCH 25/33] drm/i915/guc: Support request
 cancellation
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, john.c.harrison@intel.com,
 Thomas Gleixner <tglx@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20210727002348.97202-1-matthew.brost@intel.com>
 <20210727002348.97202-26-matthew.brost@intel.com>
 <2a417f11-050a-2445-d5e9-38fe354402f2@intel.com>
 <20211005070656.25xszayci52wqe7h@linutronix.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c43aa0a4-0f3a-e9cd-2221-0f3ce3019421@linux.intel.com>
Date: Tue, 5 Oct 2021 11:13:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005070656.25xszayci52wqe7h@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 05/10/2021 08:06, Sebastian Andrzej Siewior wrote:
> On 2021-07-27 12:15:59 [-0700], Daniele Ceraolo Spurio wrote:
>> On 7/26/2021 5:23 PM, Matthew Brost wrote:
>>> This adds GuC backend support for i915_request_cancel(), which in turn
>>> makes CONFIG_DRM_I915_REQUEST_TIMEOUT work.
>>>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> I have a few instances of ODEBUG warnings since this commit
>     62eaf0ae217d4 ("drm/i915/guc: Support request cancellation")
> 
> like:
> 
> | ------------[ cut here ]------------
> | ODEBUG: init destroyed (active state 0) object type: i915_sw_fence hint: sw_fence_dummy_notify+0x0/0x10
> | WARNING: CPU: 0 PID: 987 at lib/debugobjects.c:505 debug_print_object+0x6e/0x90
> | Modules linked in:
> | CPU: 0 PID: 987 Comm: Xorg Not tainted 5.15.0-rc4+ #67
> | Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./Z68 Pro3-M, BIOS P2.10 04/24/2012
> | RIP: 0010:debug_print_object+0x6e/0x90
> …
> | Call Trace:
> |  i915_sw_fence_reinit+0x10/0x40
> |  intel_context_init+0x185/0x1e0
> |  intel_context_create+0x2e/0x100
> |  default_engines+0x9d/0x120
> |  i915_gem_create_context+0x40a/0x5d0
> |  ? trace_kmalloc+0x29/0xd0
> |  ? kmem_cache_alloc_trace+0xdd/0x190
> |  i915_gem_context_open+0x140/0x1c0
> |  i915_gem_open+0x70/0xa0
> |  drm_file_alloc+0x1af/0x270
> |  drm_open+0xdc/0x270
> |  drm_stub_open+0xa6/0x130
> |  chrdev_open+0xbe/0x250
> |  ? cdev_device_add+0x80/0x80
> |  do_dentry_open+0x15e/0x390
> |  path_openat+0x76b/0xa60
> |  do_filp_open+0xa4/0x150
> |  ? lock_release+0x149/0x2f0
> |  ? _raw_spin_unlock+0x24/0x40
> |  do_sys_openat2+0x92/0x160
> |  __x64_sys_openat+0x4f/0x90
> |  do_syscall_64+0x3b/0xc0
> |  entry_SYSCALL_64_after_hwframe+0x44/0xae
> | RIP: 0033:0x7f91b5cfdf07
> 
> and:
> | ODEBUG: activate destroyed (active state 0) object type: i915_sw_fence hint: sw_fence_dummy_notify+0x0/0x10
> | WARNING: CPU: 0 PID: 987 at lib/debugobjects.c:505 debug_print_object+0x6e/0x90
> |
> | Call Trace:
> |  debug_object_activate+0x174/0x200
> |  i915_sw_fence_commit+0x10/0x20
> |  intel_context_init+0x18d/0x1e0
> |  intel_context_create+0x2e/0x100
> |  default_engines+0x9d/0x120
> 
> ---
> 
> | ODEBUG: active_state destroyed (active state 0) object type: i915_sw_fence hint: sw_fence_dummy_notify+0x0/0x10
> | WARNING: CPU: 0 PID: 987 at lib/debugobjects.c:505 debug_print_object+0x6e/0x90
> | Call Trace:
> |  __i915_sw_fence_complete+0x6f/0x280
> |  intel_context_init+0x18d/0x1e0
> |  intel_context_create+0x2e/0x100
> |  default_engines+0x9d/0x120
> 
> Is this known? This is yesterday's -rc4, I first noticed it in -rc3.

Needs this fix:

commit d576b31bdece7b5034047cbe21170e948198d32f
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Sep 24 15:46:46 2021 +0100

     drm/i915: remember to call i915_sw_fence_fini

But in the fix we forgot to add:

Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")

So not sure if it will appear on it's own. Adding Joonas and Rodrigo for 
maintainer level help.

Regards,

Tvrtko
