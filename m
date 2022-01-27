Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C119049E1D9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 13:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE78F10E624;
	Thu, 27 Jan 2022 12:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F52D10E242;
 Thu, 27 Jan 2022 12:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643284943; x=1674820943;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uuwqT3wE+Hck4tTNxy/JwOSuAjnlY40+Kz0NltRhjBo=;
 b=EZBFiMRBce7KfMUdSngu4nEmK5tuMlo/HT9kq1dbRorCLepPorRGtSGy
 /5XcaspCa9LO21Rt0SZcsmICrT6Sf3MOwnaVY/34cVkBO0eMDUz3O6jk7
 HIVCvHysPmBFIkzx7BGyJ3/AVfIfUNyIUdTPlvG17PzF71C0xfJ/xzT1T
 DFjPuEIvIyCsFKCO0NrjDWj90yO2G506b1d0ZsDN6sFZ+grXemQIHIDnO
 9pNoD87LCBNH6iuJwhuZN8y62y0cCSdK6clVldsuWKxPS7gkHwj1oFUGf
 cTnhTqwJY8xDpK09oFeq6I2uyjbrTAiAsXmNN+o5BGYmW4yEeti2bAyHF g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="230404282"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="230404282"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 04:02:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="480264868"
Received: from grossi-mobl.ger.corp.intel.com (HELO [10.252.33.31])
 ([10.252.33.31])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 04:02:21 -0800
Message-ID: <83aec5cf-2e5c-77ec-b716-0416551c3f2a@linux.intel.com>
Date: Thu, 27 Jan 2022 13:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Lock dpt_obj around
 set_cache_level, v2.
Content-Language: en-US
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220126073703.1215696-1-maarten.lankhorst@linux.intel.com>
 <fdea6db7-44e4-dcbc-548a-7888c089d25e@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <fdea6db7-44e4-dcbc-548a-7888c089d25e@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 26-01-2022 om 13:55 schreef Gwan-gyeong Mun:
>
>
> On 1/26/22 9:37 AM, Maarten Lankhorst wrote:
>> set_cache_level may unbind the object, which will result in the below
>> lockdep splat:
>> <6> [184.578145] [IGT] kms_addfb_basic: starting subtest addfb25-framebuffer-vs-set-tiling
>> <4> [184.578220] ------------[ cut here ]------------
>> <4> [184.578221] WARN_ON(debug_locks && !(lock_is_held(&(&((obj)->base.resv)->lock.base)->dep_map) != 0))
>> <4> [184.578237] WARNING: CPU: 6 PID: 5544 at drivers/gpu/drm/i915/i915_gem.c:123 i915_gem_object_unbind+0x4a9/0x510 [i915]
>> <4> [184.578323] Modules linked in: vgem drm_shmem_helper snd_hda_codec_hdmi i915 mei_hdcp x86_pkg_temp_thermal snd_hda_intel coretemp crct10dif_pclmul snd_intel_dspcfg crc32_pclmul ttm snd_hda_codec ghash_clmulni_intel snd_hwdep drm_kms_helper snd_hda_core e1000e mei_me syscopyarea ptp snd_pcm sysfillrect mei pps_core sysimgblt fb_sys_fops prime_numbers intel_lpss_pci smsc75xx usbnet mii
>> <4> [184.578349] CPU: 6 PID: 5544 Comm: kms_addfb_basic Not tainted 5.16.0-CI-Patchwork_22006+ #1
>> <4> [184.578351] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR4 RVP, BIOS ADLPFWI1.R00.2422.A00.2110131104 10/13/2021
>> <4> [184.578352] RIP: 0010:i915_gem_object_unbind+0x4a9/0x510 [i915]
>> <4> [184.578424] Code: 00 be ff ff ff ff 48 8d 78 68 e8 a2 6e 2b e1 85 c0 0f 85 b1 fb ff ff 48 c7 c6 48 37 9e a0 48 c7 c7 d9 fc a1 a0 e8 a3 54 26 e1 <0f> 0b e9 97 fb ff ff 31 ed 48 8b 5c 24 58 65 48 33 1c 25 28 00 00
>> <4> [184.578426] RSP: 0018:ffffc900013b3b68 EFLAGS: 00010286
>> <4> [184.578428] RAX: 0000000000000000 RBX: ffffc900013b3bb0 RCX: 0000000000000001
>> <4> [184.578429] RDX: 0000000080000001 RSI: ffffffff8230b42d RDI: 00000000ffffffff
>> <4> [184.578430] RBP: ffff888120e10000 R08: 0000000000000000 R09: c0000000ffff7fff
>> <4> [184.578431] R10: 0000000000000001 R11: ffffc900013b3980 R12: ffff8881176ea740
>> <4> [184.578432] R13: ffff888120e10000 R14: 0000000000000000 R15: 0000000000000001
>> <4> [184.578433] FS:  00007f65074f5e40(0000) GS:ffff88888f300000(0000) knlGS:0000000000000000
>> <4> [184.578435] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> <4> [184.578436] CR2: 00007fff4420ede8 CR3: 000000010c2f2005 CR4: 0000000000770ee0
>> <4> [184.578437] PKRU: 55555554
>> <4> [184.578438] Call Trace:
>> <4> [184.578439]  <TASK>
>> <4> [184.578440]  ? dma_resv_iter_first_unlocked+0x78/0xf0
>> <4> [184.578447]  intel_dpt_create+0x88/0x220 [i915]
>> <4> [184.578530]  intel_framebuffer_init+0x5b8/0x620 [i915]
>> <4> [184.578612]  intel_framebuffer_create+0x3d/0x60 [i915]
>> <4> [184.578691]  intel_user_framebuffer_create+0x18f/0x2c0 [i915]
>> <4> [184.578775]  drm_internal_framebuffer_create+0x36d/0x4c0
>> <4> [184.578779]  drm_mode_addfb2+0x2f/0xd0
>> <4> [184.578781]  ? drm_mode_addfb_ioctl+0x10/0x10
>> <4> [184.578784]  drm_ioctl_kernel+0xac/0x140
>> <4> [184.578787]  drm_ioctl+0x201/0x3d0
>> <4> [184.578789]  ? drm_mode_addfb_ioctl+0x10/0x10
>> <4> [184.578796]  __x64_sys_ioctl+0x6a/0xa0
>> <4> [184.578800]  do_syscall_64+0x37/0xb0
>> <4> [184.578803]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>> <4> [184.578805] RIP: 0033:0x7f6506736317
>> <4> [184.578807] Code: b3 66 90 48 8b 05 71 4b 2d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 41 4b 2d 00 f7 d8 64 89 01 48
>> <4> [184.578808] RSP: 002b:00007fff44211a98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> <4> [184.578810] RAX: ffffffffffffffda RBX: 0000000000000006 RCX: 00007f6506736317
>> <4> [184.578811] RDX: 00007fff44211b30 RSI: 00000000c06864b8 RDI: 0000000000000006
>> <4> [184.578812] RBP: 00007fff44211b30 R08: 00007fff44311170 R09: 0000000000000000
>> <4> [184.578813] R10: 0000000000000008 R11: 0000000000000246 R12: 00000000c06864b8
>> <4> [184.578813] R13: 0000000000000006 R14: 0000000000000000 R15: 0000000000000000
>> <4> [184.578819]  </TASK>
>> <4> [184.578820] irq event stamp: 47931
>> <4> [184.578821] hardirqs last  enabled at (47937): [<ffffffff81130dd2>] __up_console_sem+0x62/0x70
>> <4> [184.578824] hardirqs last disabled at (47942): [<ffffffff81130db7>] __up_console_sem+0x47/0x70
>> <4> [184.578826] softirqs last  enabled at (47340): [<ffffffff81e0032d>] __do_softirq+0x32d/0x493
>> <4> [184.578828] softirqs last disabled at (47335): [<ffffffff810b9196>] irq_exit_rcu+0xa6/0xe0
>> <4> [184.578830] ---[ end trace f17ec219f892c7d4 ]---
>>
>> Changes since v1:
>> - Fix intel_pin_fb_obj_dpt too.
>>
>> Fixes: 0f341974cbc2 ("drm/i915: Add i915_vma_unbind_unlocked, and take obj lock for i915_vma_unbind, v2.")
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Testcase: kms_addfb_basic
>> ---
>>   drivers/gpu/drm/i915/display/intel_dpt.c    | 6 +++++-
>>   drivers/gpu/drm/i915/display/intel_fb_pin.c | 6 +++++-
>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
>> index 63a83d5f85a1..c2f8f853db90 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>> @@ -253,7 +253,11 @@ intel_dpt_create(struct intel_framebuffer *fb)
>>       if (IS_ERR(dpt_obj))
>>           return ERR_CAST(dpt_obj);
>>   -    ret = i915_gem_object_set_cache_level(dpt_obj, I915_CACHE_NONE);
>> +    ret = i915_gem_object_lock_interruptible(dpt_obj, NULL);
>> +    if (!ret) {
>> +        ret = i915_gem_object_set_cache_level(dpt_obj, I915_CACHE_NONE);
>> +        i915_gem_object_unlock(dpt_obj);
>> +    }
>>       if (ret) {
>>           i915_gem_object_put(dpt_obj);
>>           return ERR_PTR(ret);
>> diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
>> index 9c555f6d1958..c4b3d76341f3 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
>> @@ -36,7 +36,11 @@ intel_pin_fb_obj_dpt(struct drm_framebuffer *fb,
>>         atomic_inc(&dev_priv->gpu_error.pending_fb_pin);
>>   -    ret = i915_gem_object_set_cache_level(obj, I915_CACHE_NONE);
>> +    ret = i915_gem_object_lock_interruptible(obj, NULL);
>> +    if (!ret) {
>> +        ret = i915_gem_object_set_cache_level(obj, I915_CACHE_NONE);
>> +        i915_gem_object_unlock(obj);
>> +    }
>>       if (ret) {
>>           vma = ERR_PTR(ret);
>>           goto err;
>>
>
> Hi Maarten,
>
> Even if v2 is applied, when the igt_runner runs with fast-feedback.testlist as input,lock problem log occurs in dmesg below in kms_busy test.
>
> Testing was done in adlp.
>
> I think the lock check routine would have to be added even when doing intel_dpt_destroy(), what do you think?
>
>
> -----------------------------------------------------------------------------------------------------------
> [  374.868359] ------------[ cut here ]------------
> [  374.868409] WARNING: CPU: 2 PID: 6696 at drivers/gpu/drm/i915/gem/i915_gem_object.h:171 __i915_vma_unbind+0xdf/0xf0 [i915]
> [  374.868506] Modules linked in: vgem drm_shmem_helper fuse snd_hda_codec_hdmi smsc75xx usbnet mii mei_hdcp x86_pkg_temp_thermal snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep coretemp snd_hda_core snd_pcm mei_me mei i915 drm_buddy crct10dif_pclmul crc32_pclmul ttm ghash_clmulni_intel drm_dp_helper i2c_i801 drm_kms_helper i2c_smbus intel_lpss_pci syscopyarea sysfillrect sysimgblt fb_sys_fops prime_numbers
> [  374.868539] CPU: 2 PID: 6696 Comm: kms_busy Not tainted 5.17.0-rc1-drm-tip-test+ #26
> [  374.868541] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS ADLPFWI1.R00.2162.A00.2104190450 04/19/2021
> [  374.868543] RIP: 0010:__i915_vma_unbind+0xdf/0xf0 [i915]
> [  374.868631] Code: 15 32 1c 5c e2 85 d2 0f 84 5c ff ff ff 48 8b b8 38 01 00 00 be ff ff ff ff 48 83 c7 68 e8 a9 e0 8a e1 85 c0 0f 85 3f ff ff ff <0f> 0b e9 38 ff ff ff 41 bc f5 ff ff ff eb 86 66 90 0f 1f 44 00 00
> [  374.868633] RSP: 0018:ffffc900022f3cd0 EFLAGS: 00010246
> [  374.868636] RAX: 0000000000000000 RBX: ffff88810c204b40 RCX: 0000000000000000
> [  374.868637] RDX: 0000000080000000 RSI: ffffffff822dc04f RDI: ffffffff82339ebf
> [  374.868638] RBP: ffff88810c204b40 R08: 00000000ffffffff R09: 0000000000000000
> [  374.868639] R10: 0000000000000001 R11: ffffffffa023ba80 R12: ffff8881095ebb18
> [  374.868641] R13: ffff8881095eb800 R14: 00000000ffffffff R15: ffff8881095eb848
> [  374.868642] FS:  00007f0326c43c00(0000) GS:ffff88849f300000(0000) knlGS:0000000000000000
> [  374.868643] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  374.868645] CR2: 00007f0329403938 CR3: 00000001429c4006 CR4: 0000000000770ee0
> [  374.868646] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  374.868647] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
> [  374.868649] PKRU: 55555554
> [  374.868650] Call Trace:
> [  374.868651]  <TASK>
> [  374.868654]  __i915_vm_close+0xab/0x190 [i915]
> [  374.868729]  intel_dpt_destroy+0x29/0x60 [i915]
> [  374.868823]  intel_user_framebuffer_destroy+0x48/0x50 [i915]
> [  374.868945]  drm_mode_rmfb+0x1eb/0x220
> [  374.868958]  ? drm_mode_rmfb+0x220/0x220
> [  374.868963]  ? drm_mode_rmfb+0x220/0x220
> [  374.868966]  drm_ioctl_kernel+0xb1/0x140
> [  374.868973]  drm_ioctl+0x201/0x3b0
> [  374.868977]  ? drm_mode_rmfb+0x220/0x220
> [  374.868981]  ? tty_ioctl+0x447/0x980
> [  374.868986]  ? find_held_lock+0x2b/0x80
> [  374.868995]  __x64_sys_ioctl+0x83/0xa0
> [  374.869000]  do_syscall_64+0x38/0xc0
> [  374.869006]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  374.869009] RIP: 0033:0x7f0328fde50b
> [  374.869012] Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
> [  374.869014] RSP: 002b:00007ffec4a3f278 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [  374.869017] RAX: ffffffffffffffda RBX: 00007ffec4a3f2bc RCX: 00007f0328fde50b
> [  374.869019] RDX: 00007ffec4a3f2bc RSI: 00000000c00464af RDI: 0000000000000005
> [  374.869020] RBP: 00000000c00464af R08: 0000000000000000 R09: 0000000000000000
> [  374.869021] R10: fffffffffffffdea R11: 0000000000000246 R12: 00007ffec4a3f360
> [  374.869022] R13: 0000000000000005 R14: 00007ffec4a3f400 R15: 0000000000000000
> [  374.869032]  </TASK>
> [  374.869034] irq event stamp: 258641
> [  374.869035] hardirqs last  enabled at (258647): [<ffffffff8113a437>] __up_console_sem+0x67/0x70
> [  374.869039] hardirqs last disabled at (258652): [<ffffffff8113a41c>] __up_console_sem+0x4c/0x70
> [  374.869041] softirqs last  enabled at (257220): [<ffffffff810c104d>] irq_exit_rcu+0xdd/0x130
> [  374.869045] softirqs last disabled at (257215): [<ffffffff810c104d>] irq_exit_rcu+0xdd/0x130
> [  374.869047] ---[ end trace 0000000000000000 ]---
> [  374.869178] ------------[ cut here ]------------
> [  374.869180] WARNING: CPU: 2 PID: 6696 at drivers/gpu/drm/i915/gem/i915_gem_object.h:171 __i915_vma_evict+0x2b0/0x330 [i915]
> [  374.869272] Modules linked in: vgem drm_shmem_helper fuse snd_hda_codec_hdmi smsc75xx usbnet mii mei_hdcp x86_pkg_temp_thermal snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep coretemp snd_hda_core snd_pcm mei_me mei i915 drm_buddy crct10dif_pclmul crc32_pclmul ttm ghash_clmulni_intel drm_dp_helper i2c_i801 drm_kms_helper i2c_smbus intel_lpss_pci syscopyarea sysfillrect sysimgblt fb_sys_fops prime_numbers
> [  374.869303] CPU: 2 PID: 6696 Comm: kms_busy Tainted: G        W    5.17.0-rc1-drm-tip-test+ #26
> [  374.869305] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS ADLPFWI1.R00.2162.A00.2104190450 04/19/2021
> [  374.869306] RIP: 0010:__i915_vma_evict+0x2b0/0x330 [i915]
> [  374.869389] Code: 00 00 00 e8 d2 3c 2e e1 e9 84 fe ff ff 48 8b b8 38 01 00 00 be ff ff ff ff 48 83 c7 68 e8 08 e2 8a e1 85 c0 0f 85 91 fd ff ff <0f> 0b e9 8a fd ff ff 0f 0b e9 ca fd ff ff e8 2d e3 8a e1 85 c0 0f
> [  374.869391] RSP: 0018:ffffc900022f3cb0 EFLAGS: 00010246
> [  374.869393] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> [  374.869394] RDX: 0000000080000000 RSI: ffffffff822dc04f RDI: ffffffff82339ebf
> [  374.869395] RBP: ffff88810c204b40 R08: 00000000ffffffff R09: 0000000000000001
> [  374.869396] R10: 0000000000000001 R11: ffff88810156ddc8 R12: ffff88813fcc34c0
> [  374.869397] R13: ffff8881095eb800 R14: 00000000ffffffff R15: ffff8881095eb848
> [  374.869398] FS:  00007f0326c43c00(0000) GS:ffff88849f300000(0000) knlGS:0000000000000000
> [  374.869400] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  374.869401] CR2: 00007f0329403938 CR3: 00000001429c4006 CR4: 0000000000770ee0
> [  374.869402] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  374.869403] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
> [  374.869404] PKRU: 55555554
> [  374.869405] Call Trace:
> [  374.869406]  <TASK>
> [  374.869408]  __i915_vma_unbind+0x6c/0xf0 [i915]
> [  374.869491]  __i915_vm_close+0xab/0x190 [i915]
> [  374.869565]  intel_dpt_destroy+0x29/0x60 [i915]
> [  374.869658]  intel_user_framebuffer_destroy+0x48/0x50 [i915]
> [  374.869750]  drm_mode_rmfb+0x1eb/0x220
> [  374.869757]  ? drm_mode_rmfb+0x220/0x220
> [  374.869761]  ? drm_mode_rmfb+0x220/0x220
> [  374.869765]  drm_ioctl_kernel+0xb1/0x140
> [  374.869771]  drm_ioctl+0x201/0x3b0
> [  374.869774]  ? drm_mode_rmfb+0x220/0x220
> [  374.869779]  ? tty_ioctl+0x447/0x980
> [  374.869782]  ? find_held_lock+0x2b/0x80
> [  374.869789]  __x64_sys_ioctl+0x83/0xa0
> [  374.869793]  do_syscall_64+0x38/0xc0
> [  374.869797]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  374.869800] RIP: 0033:0x7f0328fde50b
> [  374.869802] Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
> [  374.869803] RSP: 002b:00007ffec4a3f278 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [  374.869805] RAX: ffffffffffffffda RBX: 00007ffec4a3f2bc RCX: 00007f0328fde50b
> [  374.869807] RDX: 00007ffec4a3f2bc RSI: 00000000c00464af RDI: 0000000000000005
> [  374.869808] RBP: 00000000c00464af R08: 0000000000000000 R09: 0000000000000000
> [  374.869809] R10: fffffffffffffdea R11: 0000000000000246 R12: 00007ffec4a3f360
> [  374.869810] R13: 0000000000000005 R14: 00007ffec4a3f400 R15: 0000000000000000
> [  374.869819]  </TASK>
> [  374.869820] irq event stamp: 259173
> [  374.869821] hardirqs last  enabled at (259179): [<ffffffff8113a437>] __up_console_sem+0x67/0x70
> [  374.869824] hardirqs last disabled at (259184): [<ffffffff8113a41c>] __up_console_sem+0x4c/0x70
> [  374.869827] softirqs last  enabled at (257220): [<ffffffff810c104d>] irq_exit_rcu+0xdd/0x130
> [  374.869841] softirqs last disabled at (259195): [<ffffffff810c104d>] irq_exit_rcu+0xdd/0x130
> [  374.869843] ---[ end trace 0000000000000000 ]---
> [  374.892030] Console: switching to colour frame buffer device 240x67
> [  374.920158] ------------[ cut here ]------------
> [  374.920161] WARNING: CPU: 2 PID: 6696 at drivers/gpu/drm/i915/gem/i915_gem_object.h:171 __i915_vma_unbind+0xdf/0xf0 [i915]
> [  374.920298] Modules linked in: vgem drm_shmem_helper fuse snd_hda_codec_hdmi smsc75xx usbnet mii mei_hdcp x86_pkg_temp_thermal snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep coretemp snd_hda_core snd_pcm mei_me mei i915 drm_buddy crct10dif_pclmul crc32_pclmul ttm ghash_clmulni_intel drm_dp_helper i2c_i801 drm_kms_helper i2c_smbus intel_lpss_pci syscopyarea sysfillrect sysimgblt fb_sys_fops prime_numbers
> [  374.920327] CPU: 2 PID: 6696 Comm: kms_busy Tainted: G        W    5.17.0-rc1-drm-tip-test+ #26
> [  374.920329] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS ADLPFWI1.R00.2162.A00.2104190450 04/19/2021
> [  374.920331] RIP: 0010:__i915_vma_unbind+0xdf/0xf0 [i915]
> [  374.920418] Code: 15 32 1c 5c e2 85 d2 0f 84 5c ff ff ff 48 8b b8 38 01 00 00 be ff ff ff ff 48 83 c7 68 e8 a9 e0 8a e1 85 c0 0f 85 3f ff ff ff <0f> 0b e9 38 ff ff ff 41 bc f5 ff ff ff eb 86 66 90 0f 1f 44 00 00
> [  374.920420] RSP: 0018:ffffc900022f3ba0 EFLAGS: 00010246
> [  374.920422] RAX: 0000000000000000 RBX: ffff88810c205f40 RCX: 0000000000000000
> [  374.920424] RDX: 0000000080000000 RSI: ffffffff822dc04f RDI: ffffffff82339ebf
> [  374.920425] RBP: ffff88810c205f40 R08: 00000000ffffffff R09: 0000000000000000
> [  374.920426] R10: 0000000000000001 R11: ffffffffa023ba80 R12: ffff888140ecd318
> [  374.920427] R13: ffff888140ecd000 R14: 00000000ffffffff R15: ffff888140ecd048
> [  374.920428] FS:  0000000000000000(0000) GS:ffff88849f300000(0000) knlGS:0000000000000000
> [  374.920430] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  374.920431] CR2: 00007f032940af28 CR3: 0000000006612001 CR4: 0000000000770ee0
> [  374.920432] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  374.920433] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
> [  374.920435] PKRU: 55555554
> [  374.920436] Call Trace:
> [  374.920437]  <TASK>
> [  374.920439]  __i915_vm_close+0xab/0x190 [i915]
> [  374.920513]  intel_dpt_destroy+0x29/0x60 [i915]
> [  374.920608]  intel_user_framebuffer_destroy+0x48/0x50 [i915]
> [  374.920697]  drm_fb_release+0x108/0x1c0
> [  374.920702]  ? find_held_lock+0x2b/0x80
> [  374.920710]  drm_file_free.part.0+0x1a4/0x260
> [  374.920716]  drm_release_noglobal+0x1c/0xa0
> [  374.920719]  __fput+0xa3/0x260
> [  374.920724]  task_work_run+0x59/0xa0
> [  374.920729]  do_exit+0x382/0xc00
> [  374.920735]  do_group_exit+0x33/0xb0
> [  374.920737]  get_signal+0x15e/0xe00
> [  374.920744]  arch_do_signal_or_restart+0xf0/0x7f0
> [  374.920754]  exit_to_user_mode_prepare+0x148/0x1d0
> [  374.920758]  syscall_exit_to_user_mode+0x19/0x50
> [  374.920762]  do_syscall_64+0x48/0xc0
> [  374.920765]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  374.920768] RIP: 0033:0x7f0328fde50b
> [  374.920769] Code: Unable to access opcode bytes at RIP 0x7f0328fde4e1.
> [  374.920770] RSP: 002b:00007ffec4a3f278 EFLAGS: 00000246
> [  374.920772] RAX: 0000000000000000 RBX: 00007ffec4a3f2bc RCX: 00007f0328fde50b
> [  374.920774] RDX: 00007ffec4a3f2bc RSI: 00000000c00464af RDI: 0000000000000005
> [  374.920775] RBP: 00000000c00464af R08: 0000000000000000 R09: 0000000000000000
> [  374.920776] R10: fffffffffffffdea R11: 0000000000000246 R12: 00007ffec4a3f360
> [  374.920777] R13: 0000000000000005 R14: 00007ffec4a3f400 R15: 0000000000000000
> [  374.920784]  </TASK>
> [  374.920785] irq event stamp: 365965
> [  374.920786] hardirqs last  enabled at (365971): [<ffffffff8113a437>] __up_console_sem+0x67/0x70
> [  374.920789] hardirqs last disabled at (365976): [<ffffffff8113a41c>] __up_console_sem+0x4c/0x70
> [  374.920792] softirqs last  enabled at (365380): [<ffffffff81a8c945>] unix_release_sock+0xf5/0x4f0
> [  374.920795] softirqs last disabled at (365378): [<ffffffff81a8c91e>] unix_release_sock+0xce/0x4f0
> [  374.920796] ---[ end trace 0000000000000000 ]---
> [  374.920813] ------------[ cut here ]------------
> [  374.920814] WARNING: CPU: 2 PID: 6696 at drivers/gpu/drm/i915/gem/i915_gem_object.h:171 __i915_vma_evict+0x2b0/0x330 [i915]
> [  374.920972] Modules linked in: vgem drm_shmem_helper fuse snd_hda_codec_hdmi smsc75xx usbnet mii mei_hdcp x86_pkg_temp_thermal snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep coretemp snd_hda_core snd_pcm mei_me mei i915 drm_buddy crct10dif_pclmul crc32_pclmul ttm ghash_clmulni_intel drm_dp_helper i2c_i801 drm_kms_helper i2c_smbus intel_lpss_pci syscopyarea sysfillrect sysimgblt fb_sys_fops prime_numbers
> [  374.921003] CPU: 2 PID: 6696 Comm: kms_busy Tainted: G        W    5.17.0-rc1-drm-tip-test+ #26
> [  374.921005] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS ADLPFWI1.R00.2162.A00.2104190450 04/19/2021
> [  374.921006] RIP: 0010:__i915_vma_evict+0x2b0/0x330 [i915]
> [  374.921095] Code: 00 00 00 e8 d2 3c 2e e1 e9 84 fe ff ff 48 8b b8 38 01 00 00 be ff ff ff ff 48 83 c7 68 e8 08 e2 8a e1 85 c0 0f 85 91 fd ff ff <0f> 0b e9 8a fd ff ff 0f 0b e9 ca fd ff ff e8 2d e3 8a e1 85 c0 0f
> [  374.921097] RSP: 0018:ffffc900022f3b80 EFLAGS: 00010246
> [  374.921102] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> [  374.921103] RDX: 0000000080000000 RSI: ffffffff822dc04f RDI: ffffffff82339ebf
> [  374.921104] RBP: ffff88810c205f40 R08: 00000000ffffffff R09: 0000000000000001
> [  374.921105] R10: 0000000000000001 R11: ffff88810156ddc8 R12: ffff88813fcc6940
> [  374.921107] R13: ffff888140ecd000 R14: 00000000ffffffff R15: ffff888140ecd048
> [  374.921108] FS:  0000000000000000(0000) GS:ffff88849f300000(0000) knlGS:0000000000000000
> [  374.921109] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  374.921111] CR2: 00007f032940af28 CR3: 0000000006612001 CR4: 0000000000770ee0
> [  374.921112] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  374.921113] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
> [  374.921114] PKRU: 55555554
> [  374.921115] Call Trace:
> [  374.921116]  <TASK>
> [  374.921118]  __i915_vma_unbind+0x6c/0xf0 [i915]
> [  374.921207]  __i915_vm_close+0xab/0x190 [i915]
> [  374.921284]  intel_dpt_destroy+0x29/0x60 [i915]
> [  374.921377]  intel_user_framebuffer_destroy+0x48/0x50 [i915]
> [  374.921469]  drm_fb_release+0x108/0x1c0
> [  374.921472]  ? find_held_lock+0x2b/0x80
> [  374.921480]  drm_file_free.part.0+0x1a4/0x260
> [  374.921485]  drm_release_noglobal+0x1c/0xa0
> [  374.921487]  __fput+0xa3/0x260
> [  374.921491]  task_work_run+0x59/0xa0
> [  374.921495]  do_exit+0x382/0xc00
> [  374.921500]  do_group_exit+0x33/0xb0
> [  374.921503]  get_signal+0x15e/0xe00
> [  374.921510]  arch_do_signal_or_restart+0xf0/0x7f0
> [  374.921519]  exit_to_user_mode_prepare+0x148/0x1d0
> [  374.921522]  syscall_exit_to_user_mode+0x19/0x50
> [  374.921525]  do_syscall_64+0x48/0xc0
> [  374.921528]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  374.921531] RIP: 0033:0x7f0328fde50b
> [  374.921532] Code: Unable to access opcode bytes at RIP 0x7f0328fde4e1.
> [  374.921533] RSP: 002b:00007ffec4a3f278 EFLAGS: 00000246
> [  374.921535] RAX: 0000000000000000 RBX: 00007ffec4a3f2bc RCX: 00007f0328fde50b
> [  374.921536] RDX: 00007ffec4a3f2bc RSI: 00000000c00464af RDI: 0000000000000005
> [  374.921538] RBP: 00000000c00464af R08: 0000000000000000 R09: 0000000000000000
> [  374.921539] R10: fffffffffffffdea R11: 0000000000000246 R12: 00007ffec4a3f360
> [  374.921540] R13: 0000000000000005 R14: 00007ffec4a3f400 R15: 0000000000000000
> [  374.921547]  </TASK>
> [  374.921548] irq event stamp: 366515
> [  374.921549] hardirqs last  enabled at (366521): [<ffffffff8113a437>] __up_console_sem+0x67/0x70
> [  374.921552] hardirqs last disabled at (366526): [<ffffffff8113a41c>] __up_console_sem+0x4c/0x70
> [  374.921555] softirqs last  enabled at (365380): [<ffffffff81a8c945>] unix_release_sock+0xf5/0x4f0
> [  374.921556] softirqs last disabled at (365378): [<ffffffff81a8c91e>] unix_release_sock+0xce/0x4f0
> [  374.921558] ---[ end trace 0000000000000000 ]---

The bug on vm_close is a separate bug, and would probably best be fixed in a separate patch.

Could I get a r-b on this? It should fix some issues, even if the unbind there is a separate bug.

~Maarten

