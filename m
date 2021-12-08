Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D8346D022
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 10:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6BB6ECE4;
	Wed,  8 Dec 2021 09:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4EE6EE5D;
 Wed,  8 Dec 2021 09:32:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="261871058"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="261871058"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 01:32:46 -0800
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="479844855"
Received: from sbogar-mobl2.ger.corp.intel.com (HELO [10.249.254.43])
 ([10.249.254.43])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 01:32:44 -0800
Message-ID: <e7e5035c-980b-6ca9-d119-b6f3810d8e13@linux.intel.com>
Date: Wed, 8 Dec 2021 10:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v9 2/8] drm/i915/ttm: add tt shmem backend
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20211018091055.1998191-1-matthew.auld@intel.com>
 <20211018091055.1998191-2-matthew.auld@intel.com>
 <1a8431eb-566d-ac2b-85b7-31c590ec84ff@linux.intel.com>
 <52fadb30-bdc2-6432-931b-ef1bbf3be0ba@intel.com>
 <64b203a7-b09f-2982-ef3b-b33da7708d0f@linux.intel.com>
 <508f76bc-4afc-4029-fc8a-eb8bb464a973@linux.intel.com>
 <ca5587dc-e3cc-c5b4-6034-127d20a3677b@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ca5587dc-e3cc-c5b4-6034-127d20a3677b@linux.intel.com>
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
Cc: Oak Zeng <oak.zeng@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/8/21 10:24, Tvrtko Ursulin wrote:
>
> On 08/12/2021 08:39, Thomas Hellström wrote:
>>
>> On 12/8/21 09:30, Tvrtko Ursulin wrote:
>>
>>
>> ...
>>
>>
>>>>> Apart from the code organisation questions, on the practical level 
>>>>> - do you need writeback from the TTM backend or while I am 
>>>>> proposing to remove it from the "legacy" paths, I can propose 
>>>>> removing it from the TTM flow as well?
>>>>
>>>> Yeah, if that is somehow busted then we should remove from TTM 
>>>> backend also.
>>>
>>> Okay thanks, I wanted to check in case there was an extra need in 
>>> TTM. I will float a patch soon hopefully but testing will be a 
>>> problem since it seems very hard to repro at the moment.
>>
>> Do we have some information about what's causing the deadlock or a 
>> signature? I'm asking because if some sort of shrinker was added to TTM 
>
> Yes, signature is hung task detector kicking in and pretty much system 
> standstill ensues. You will find a bunch of tasks stuck like this:
>
> [  247.165578] chrome          D    0  1791   1785 0x00004080
> [  247.171732] Call Trace:
> [  247.174492]  __schedule+0x57e/0x10d2
> [  247.178514]  ? pcpu_alloc_area+0x25d/0x273
> [  247.183115]  schedule+0x7c/0x9f
> [  247.186647]  rwsem_down_write_slowpath+0x2ae/0x494
> [  247.192025]  register_shrinker_prepared+0x19/0x48
> [  247.197310]  ? test_single_super+0x10/0x10
> [  247.201910]  sget_fc+0x1fc/0x20e
> [  247.205540]  ? kill_litter_super+0x40/0x40
> [  247.210139]  ? proc_apply_options+0x42/0x42
> [  247.214838]  vfs_get_super+0x3a/0xdf
> [  247.218855]  vfs_get_tree+0x2b/0xc3
> [  247.222911]  fc_mount+0x12/0x39
> [  247.226814]  pid_ns_prepare_proc+0x9d/0xc5
> [  247.232468]  alloc_pid+0x275/0x289
> [  247.236432]  copy_process+0x5e5/0xeea
> [  247.240640]  _do_fork+0x95/0x303
> [  247.244261]  __se_sys_clone+0x65/0x7f
> [  247.248366]  do_syscall_64+0x54/0x7e
> [  247.252365]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>
> Or this:
>
> [  247.030274] minijail-init   D    0  1773   1770 0x80004082
> [  247.036419] Call Trace:
> [  247.039167]  __schedule+0x57e/0x10d2
> [  247.043175]  ? __schedule+0x586/0x10d2
> [  247.047381]  ? _raw_spin_unlock+0xe/0x20
> [  247.051779]  ? __queue_work+0x316/0x371
> [  247.056079]  schedule+0x7c/0x9f
> [  247.059602]  rwsem_down_write_slowpath+0x2ae/0x494
> [  247.064971]  unregister_shrinker+0x20/0x65
> [  247.069562]  deactivate_locked_super+0x38/0x88
> [  247.074538]  cleanup_mnt+0xcc/0x10e
> [  247.078447]  task_work_run+0x7d/0xa6
> [  247.082459]  do_exit+0x23d/0x831
> [  247.086079]  ? syscall_trace_enter+0x207/0x20e
> [  247.091055]  do_group_exit+0x8d/0x9d
> [  247.095062]  __x64_sys_exit_group+0x17/0x17
> [  247.099750]  do_syscall_64+0x54/0x7e
> [  247.103758]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>
> And smoking gun is:
>
> [  247.383338] CPU: 3 PID: 88 Comm: kswapd0 Tainted: G U            
> 5.4.154 #36
> [  247.383338] Hardware name: Google Delbin/Delbin, BIOS 
> Google_Delbin.13672.57.0 02/09/2021
> [  247.383339] RIP: 0010:__rcu_read_lock+0x0/0x1a
> [  247.383339] Code: ff ff 0f 0b e9 61 fe ff ff 0f 0b e9 76 fe ff ff 
> 0f 0b 49 8b 44 24 20 e9 59 ff ff ff 0f 0b e9 67 ff ff ff 0f 0b e9 1b 
> ff ff ff <0f> 1f 44 00 00 55 48 89 e5 65 48 8b 04 25 80 5d 01 00 ff 80 
> f8 03
> [  247.383340] RSP: 0018:ffffb0aa0031b978 EFLAGS: 00000286
> [  247.383340] RAX: 0000000000000000 RBX: fffff6b944ca8040 RCX: 
> fffff6b944ca8001
> [  247.383341] RDX: 0000000000000028 RSI: 0000000000000001 RDI: 
> ffff8b52bc618c18
> [  247.383341] RBP: ffffb0aa0031b9d0 R08: 0000000000000000 R09: 
> ffff8b52fb5f00d8
> [  247.383341] R10: 0000000000000000 R11: 0000000000000000 R12: 
> 0000000000000000
> [  247.383342] R13: 61c8864680b583eb R14: 0000000000000001 R15: 
> ffffb0aa0031b980
> [  247.383342] FS:  0000000000000000(0000) GS:ffff8b52fbf80000(0000) 
> knlGS:0000000000000000
> [  247.383343] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  247.383343] CR2: 00007c78a400d680 CR3: 0000000120f46006 CR4: 
> 0000000000762ee0
> [  247.383344] PKRU: 55555554
> [  247.383344] Call Trace:
> [  247.383345]  find_get_entry+0x4c/0x116
> [  247.383345]  find_lock_entry+0xc8/0xec
> [  247.383346]  shmem_writeback+0x7b/0x163
> [  247.383346]  i915_gem_shrink+0x302/0x40b
> [  247.383347]  ? __intel_runtime_pm_get+0x22/0x82
> [  247.383347]  i915_gem_shrinker_scan+0x86/0xa8
> [  247.383348]  shrink_slab+0x272/0x48b
> [  247.383348]  shrink_node+0x784/0xbea
> [  247.383348]  ? rcu_read_unlock_special+0x66/0x15f
> [  247.383349]  ? update_batch_size+0x78/0x78
> [  247.383349]  kswapd+0x75c/0xa56
> [  247.383350]  kthread+0x147/0x156
> [  247.383350]  ? kswapd_run+0xb6/0xb6
> [  247.383351]  ? kthread_blkcg+0x2e/0x2e
> [  247.383351]  ret_from_fork+0x1f/0x40
>
> Sadly getting logs or repro from 5.16-rc is more difficult due other 
> issues, or altogether gone, which is also a possibility. It is also 
> possible that transparent hugepages either enable the hang, or just 
> make it more likely.
>
> However due history of writeback I think it sounds plausible that it 
> is indeed unsafe. I will try to dig out a reply from Hugh Dickins who 
> advised against doing it and I think that advice did not change, or I 
> failed to find a later thread. There is at least a mention of that 
> discussion in the patch which added writeback.
>
>> itself, for the TTM page vectors, it would need to allocate shmem 
>> pages at shrink time rather than to unpin them at shrink time as we 
>> do here. And for that to have any chance of working sort of reliably, 
>> I think writeback is needed.
>
> I don't claim to understand it fully, but won't the system take care 
> of that, with the only difference being that allocation might work a 
> little less reliably under extreme memory pressure? 

Yes, IIRC it's exactly this that made the previous attempt of a generic 
TTM shrinker fail.


> And I did not find other drivers use it at least which may be and 
> indication we should indeed steer clear of it.

You're probably right.

>
> Regards,
>
> Tvrtko

Thanks,

Thomas




>
>> But I agree for this implementation, the need for writeback isn't 
>> different than for the non-TTM shmem objects> Thanks,
>>
>> Thomas
>>
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>
