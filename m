Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4162F4B9F85
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 13:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5295D10EC07;
	Thu, 17 Feb 2022 12:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E1610EC0F;
 Thu, 17 Feb 2022 12:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645099283; x=1676635283;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HzuMge0HgvrgsfVTm5W51mX+jwwjkuRZ9Y8PB/COKp8=;
 b=SAnrgxXj/PHNcQZwzE/pZx/yo+DfY+AMPJNlI/seCB0yn5pQedng/Z5/
 HbTrM5Nj44JuEwZNDn/4mf/Nfe6CVVW+bdd3i3+tTe36c+zbtOtRoymS4
 k+fEEGs1aheWEt90G116q+zjnRCmh3OGj04zOwFeZQP5qPB69Y4nhOQ0m
 1yXnk6GhHf5sVcBTmQ4HYHdXMMmJ1PoPdOgDeEZCtNfEsXTfT41atpyZI
 ncALEHUwRSAT7P5Lk69TBhvRhNcLxJgkI2tUSfCjhnb8hQqGZ7KHulBhC
 WjcM0ugZjnH8hXJzKyHMYIU/6gtEQEQHgoc+9RTam49j3JzSVZ5V3XY7e A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="337302575"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="337302575"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 04:01:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="625984298"
Received: from dfdonlon-mobl.ger.corp.intel.com (HELO [10.252.23.27])
 ([10.252.23.27])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 04:01:22 -0800
Message-ID: <29a38d49-3eea-3443-2549-f3597ab5cc49@intel.com>
Date: Thu, 17 Feb 2022 12:01:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/i915: Clarify vma lifetime
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220210071958.227234-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220210071958.227234-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 10/02/2022 07:19, Thomas Hellström wrote:
> It's unclear what reference the initial vma kref refernce refers to.
> A vma can have multiple weak references, the object vma list,
> the vm's bound list and the GT's closed_list, and the initial vma
> reference can be put from lookups of all these lists.
> 
> With the current implementation this means
> that any holder of yet another vma refcount (currently only
> i915_gem_object_unbind()) needs to be holding two of either
> *) An object refcount,
> *) A vm open count
> *) A vma open count
> 
> in order for us to not risk leaking a reference by having the
> initial vma reference being put twice.
> 
> Address this by re-introducing i915_vma_destroy() which removes all
> weak references of the vma and *then* puts the initial vma refcount.
> This makes a strong vma reference hold on to the vma unconditionally.
> 
> Perhaps a better name would be i915_vma_revoke() or i915_vma_zombify(),
> since other callers may still hold a refcount, but with the prospect of
> being able to replace the vma refcount with the object lock in the near
> future, let's stick with i915_vma_destroy().
> 
> Finally this commit fixes a race in that previously i915_vma_release() and
> now i915_vma_destroy() could destroy a vma without taking the vm->mutex
> after an advisory check that the vma mm_node was not allocated.
> This would race with the ungrab_vma() function creating a trace similar
> to the below one. This was fixed in one __i915_vma_put() callsites in
> Fixes: bc1922e5d349 ("drm/i915: Fix a race between vma / object destruction and unbinding")
> but although not seemingly triggered by CI, that
> is not sufficient. This patch is needed to fix that properly.
> 
> [823.012188] Console: switching to colour dummy device 80x25
> [823.012422] [IGT] gem_ppgtt: executing
> [823.016667] [IGT] gem_ppgtt: starting subtest blt-vs-render-ctx0
> [852.436465] stack segment: 0000 [#1] PREEMPT SMP NOPTI
> [852.436480] CPU: 0 PID: 3200 Comm: gem_ppgtt Not tainted 5.16.0-CI-CI_DRM_11115+ #1
> [852.436489] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS ADLPFWI1.R00.2422.A00.2110131104 10/13/2021
> [852.436499] RIP: 0010:ungrab_vma+0x9/0x80 [i915]
> [852.436711] Code: ef e8 4b 85 cf e0 e8 36 a3 d6 e0 8b 83 f8 9c 00 00 85 c0 75 e1 5b 5d 41 5c 41 5d c3 e9 d6 fd 14 00 55 53 48 8b af c0 00 00 00 <8b> 45 00 85 c0 75 03 5b 5d c3 48 8b 85 a0 02 00 00 48 89 fb 48 8b
> [852.436727] RSP: 0018:ffffc90006db7880 EFLAGS: 00010246
> [852.436734] RAX: 0000000000000000 RBX: ffffc90006db7598 RCX: 0000000000000000
> [852.436742] RDX: ffff88815349e898 RSI: ffff88815349e858 RDI: ffff88810a284140
> [852.436748] RBP: 6b6b6b6b6b6b6b6b R08: ffff88815349e898 R09: ffff88815349e8e8
> [852.436754] R10: 0000000000000001 R11: 0000000051ef1141 R12: ffff88810a284140
> [852.436762] R13: 0000000000000000 R14: ffff88815349e868 R15: ffff88810a284458
> [852.436770] FS:  00007f5c04b04e40(0000) GS:ffff88849f000000(0000) knlGS:0000000000000000
> [852.436781] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [852.436788] CR2: 00007f5c04b38fe0 CR3: 000000010a6e8001 CR4: 0000000000770ef0
> [852.436797] PKRU: 55555554
> [852.436801] Call Trace:
> [852.436806]  <TASK>
> [852.436811]  i915_gem_evict_for_node+0x33c/0x3c0 [i915]
> [852.437014]  i915_gem_gtt_reserve+0x106/0x130 [i915]
> [852.437211]  i915_vma_pin_ww+0x8f4/0xb60 [i915]
> [852.437412]  eb_validate_vmas+0x688/0x860 [i915]
> [852.437596]  i915_gem_do_execbuffer+0xc0e/0x25b0 [i915]
> [852.437770]  ? deactivate_slab+0x5f2/0x7d0
> [852.437778]  ? _raw_spin_unlock_irqrestore+0x50/0x60
> [852.437789]  ? i915_gem_execbuffer2_ioctl+0xc6/0x2c0 [i915]
> [852.437944]  ? init_object+0x49/0x80
> [852.437950]  ? __lock_acquire+0x5e6/0x2580
> [852.437963]  i915_gem_execbuffer2_ioctl+0x116/0x2c0 [i915]
> [852.438129]  ? i915_gem_do_execbuffer+0x25b0/0x25b0 [i915]
> [852.438300]  drm_ioctl_kernel+0xac/0x140
> [852.438310]  drm_ioctl+0x201/0x3d0
> [852.438316]  ? i915_gem_do_execbuffer+0x25b0/0x25b0 [i915]
> [852.438490]  __x64_sys_ioctl+0x6a/0xa0
> [852.438498]  do_syscall_64+0x37/0xb0
> [852.438507]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [852.438515] RIP: 0033:0x7f5c0415b317
> [852.438523] Code: b3 66 90 48 8b 05 71 4b 2d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 41 4b 2d 00 f7 d8 64 89 01 48
> [852.438542] RSP: 002b:00007ffd765039a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [852.438553] RAX: ffffffffffffffda RBX: 000055e4d7829dd0 RCX: 00007f5c0415b317
> [852.438562] RDX: 00007ffd76503a00 RSI: 00000000c0406469 RDI: 0000000000000017
> [852.438571] RBP: 00007ffd76503a00 R08: 0000000000000000 R09: 0000000000000081
> [852.438579] R10: 00000000ffffff7f R11: 0000000000000246 R12: 00000000c0406469
> [852.438587] R13: 0000000000000017 R14: 00007ffd76503a00 R15: 0000000000000000
> [852.438598]  </TASK>
> [852.438602] Modules linked in: snd_hda_codec_hdmi i915 mei_hdcp x86_pkg_temp_thermal snd_hda_intel snd_intel_dspcfg drm_buddy coretemp crct10dif_pclmul crc32_pclmul snd_hda_codec ttm ghash_clmulni_intel snd_hwdep snd_hda_core e1000e drm_dp_helper ptp snd_pcm mei_me drm_kms_helper pps_core mei syscopyarea sysfillrect sysimgblt fb_sys_fops prime_numbers intel_lpss_pci smsc75xx usbnet mii
> [852.440310] ---[ end trace e52cdd2fe4fd911c ]---
> 
> Fixes: 7e00897be8bf ("drm/i915: Add object locking to i915_gem_evict_for_node and i915_gem_evict_something, v2.")
> Fixes: bc1922e5d349 ("drm/i915: Fix a race between vma / object destruction and unbinding")
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
