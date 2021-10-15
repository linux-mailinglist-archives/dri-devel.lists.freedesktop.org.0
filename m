Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E917D42F773
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 17:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189806E32F;
	Fri, 15 Oct 2021 15:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741896E329;
 Fri, 15 Oct 2021 15:55:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="225399225"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="225399225"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 08:55:13 -0700
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="492609279"
Received: from tzahur-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.211.201])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 08:55:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: fix blank screen booting crashes
In-Reply-To: <6baae64b-e0c3-c7bb-ba69-dcdd2b771987@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210922015039.26411-1-matthew.brost@intel.com>
 <YU3Bq+XLVeRTIS4c@intel.com> <87pmsl2qdk.fsf@intel.com>
 <96f4f4e3-e5ac-fca8-44ed-bee0a6fe67e7@linux.intel.com>
 <6baae64b-e0c3-c7bb-ba69-dcdd2b771987@intel.com>
Date: Fri, 15 Oct 2021 18:55:04 +0300
Message-ID: <87y26uth9j.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 15 Oct 2021, John Harrison <john.c.harrison@intel.com> wrote:
> On 10/15/2021 07:52, Tvrtko Ursulin wrote:
>> On 04/10/2021 08:36, Jani Nikula wrote:
>>> On Fri, 24 Sep 2021, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel=
.com>=20
>>> wrote:
>>>> On Tue, Sep 21, 2021 at 06:50:39PM -0700, Matthew Brost wrote:
>>>>> From: Hugh Dickins <hughd@google.com>
>>>>>
>>>>> 5.15-rc1 crashes with blank screen when booting up on two ThinkPads
>>>>> using i915.=C2=A0 Bisections converge convincingly, but arrive at dif=
ferent
>>>>> and surprising "culprits", none of them the actual culprit.
>>>>>
>>>>> netconsole (with init_netconsole() hacked to call i915_init() when
>>>>> logging has started, instead of by module_init()) tells the story:
>>>>>
>>>>> kernel BUG at drivers/gpu/drm/i915/i915_sw_fence.c:245!
>>>>> with RSI: ffffffff814d408b pointing to sw_fence_dummy_notify().
>>>>> I've been building with CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy, and that
>>>>> function needs to be 4-byte aligned.
>>>>>
>>>>> v2:
>>>>> =C2=A0 (Jani Nikula)
>>>>> =C2=A0=C2=A0 - Change BUG_ON to WARN_ON
>>>>> v3:
>>>>> =C2=A0 (Jani / Tvrtko)
>>>>> =C2=A0=C2=A0 - Short circuit __i915_sw_fence_init on WARN_ON
>>>>> v4:
>>>>> =C2=A0 (Lucas)
>>>>> =C2=A0=C2=A0 - Break WARN_ON changes out in a different patch
>>>>>
>>>>> Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
>>>>> Signed-off-by: Hugh Dickins <hughd@google.com>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>> =C2=A0 drivers/gpu/drm/i915/gt/intel_context.c | 4 ++--
>>>>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c=20
>>>>> b/drivers/gpu/drm/i915/gt/intel_context.c
>>>>> index ff637147b1a9..e7f78bc7ebfc 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_context.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
>>>>> @@ -362,8 +362,8 @@ static int __intel_context_active(struct=20
>>>>> i915_active *active)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>> =C2=A0 }
>>>>> =C2=A0 -static int sw_fence_dummy_notify(struct i915_sw_fence *sf,
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum i915_sw_fence_notify state)
>>>>> +static int __i915_sw_fence_call
>>>>> +sw_fence_dummy_notify(struct i915_sw_fence *sf, enum=20
>>>>> i915_sw_fence_notify state)
>>>>> =C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY_DONE;
>>>>> =C2=A0 }
>>>>
>>>> This thing seems broken beyond just this alignment stuff. I'm getting
>>>> this spew from DEBUG_OBJECTS all the time on a glk here:
>>>
>>> Nobody followed through with this, so:
>>>
>>> https://lore.kernel.org/r/20211002020257.34a0e882@oasis.local.home
>>>
>>> and
>>>
>>> cdc1e6e225e3 ("drm/i915: fix blank screen booting crashes")
>>
>> John you pushed this yesterday? Will this cause a problem now if we=20
>> have two commits for the same bug:
> I'm thoroughly confused.
>
> I finally got far enough down my backlog to reach this and it did not=20
> appear to be in the tree yet so I tried pushing it. The DIM tool gave me=
=20
> a bunch of errors that didn't seem to make any sense. It certainly gave=20
> me the impression that it did not actually do anything. So I gave up on=20
> it. But now it seems like it did actually push something? And it was=20
> already merged after all?

Linus merged it directly to his tree because we didn't follow through
with this soon enough. Linus' tree feeds to drm-tip via drm-intel-fixes,
but I guess we haven't done backmerges from Linux' tree to drm-next to
drm-intel-gt-next with that commit. Once you applied the patch, dim
rebuilt drm-tip, which now got the same change from both drm-intel-fixes
and drm-intel-gt-next.

It happens.

But in general, if there are regressions with blank screens at boot
occurring in Linus' tree, the fix needs to move much faster.

BR,
Jani.


>
> John.
>
>>
>> commit b0179f0d18dd7e6fb6b1c52c49ac21365257e97e
>> Author:=C2=A0=C2=A0=C2=A0=C2=A0 Hugh Dickins <hughd@google.com>
>> AuthorDate: Tue Sep 21 18:50:39 2021 -0700
>> Commit:=C2=A0=C2=A0=C2=A0=C2=A0 John Harrison <John.C.Harrison@Intel.com>
>> CommitDate: Thu Oct 14 18:29:01 2021 -0700
>>
>> =C2=A0=C2=A0=C2=A0 drm/i915: fix blank screen booting crashes
>>
>>
>>
>> commit cdc1e6e225e3256d56dc6648411630e71d7c776b
>> Author:=C2=A0=C2=A0=C2=A0=C2=A0 Hugh Dickins <hughd@google.com>
>> AuthorDate: Sat Oct 2 03:17:29 2021 -0700
>> Commit:=C2=A0=C2=A0=C2=A0=C2=A0 Linus Torvalds <torvalds@linux-foundatio=
n.org>
>> CommitDate: Sat Oct 2 09:39:15 2021 -0700
>>
>> =C2=A0=C2=A0=C2=A0 drm/i915: fix blank screen booting crashes
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>>>
>>>> [=C2=A0=C2=A0 48.122629] ------------[ cut here ]------------
>>>> [=C2=A0=C2=A0 48.122640] ODEBUG: init destroyed (active state 0) objec=
t type:=20
>>>> i915_sw_fence hint: sw_fence_dummy_notify+0x0/0x10 [i915]
>>>> [=C2=A0=C2=A0 48.122963] WARNING: CPU: 0 PID: 815 at lib/debugobjects.=
c:505=20
>>>> debug_print_object+0x6e/0x90
>>>> [=C2=A0=C2=A0 48.122976] Modules linked in: i915 i2c_algo_bit ttm=20
>>>> drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops=20
>>>> prime_numbers intel_gtt agpgart fuse nls_iso8859_1 nls_cp437 vfat=20
>>>> fat intel_rapl_msr wmi_bmof intel_rapl_common x86_pkg_temp_thermal=20
>>>> r8169 realtek mdio_devres coretemp libphy efi_pstore evdev sdhci_pci=20
>>>> cqhci sdhci mei_me mmc_core i2c_i801 intel_pmc_core mei led_class=20
>>>> wmi i2c_smbus sch_fq_codel drm ip_tables x_tables ipv6 autofs4
>>>> [=C2=A0=C2=A0 48.123119] CPU: 0 PID: 815 Comm: kms_async_flips Not tai=
nted=20
>>>> 5.15.0-rc2-hsw+ #131
>>>> [=C2=A0=C2=A0 48.123125] Hardware name: Intel Corporation NUC7CJYH/NUC=
7JYB,=20
>>>> BIOS JYGLKCPX.86A.0027.2018.0125.1347 01/25/2018
>>>> [=C2=A0=C2=A0 48.123129] RIP: 0010:debug_print_object+0x6e/0x90
>>>> [=C2=A0=C2=A0 48.123137] Code: 07 08 02 83 c0 01 8b 4b 14 4c 8b 45 00 =
48 c7 c7=20
>>>> a0 19 0a 82 89 05 66 07 08 02 8b 43 10 48 8b 14 c5 c0 0d e4 81 e8 d7=20
>>>> 2e 3c 00 <0f> 0b 83 05 c5 c0 0c 01 01 48 83 c4 08 5b 5d c3 83 05 b7=20
>>>> c0 0c 01
>>>> [=C2=A0=C2=A0 48.123142] RSP: 0018:ffffc90000dabae0 EFLAGS: 00010282
>>>> [=C2=A0=C2=A0 48.123150] RAX: 0000000000000000 RBX: ffff88810004f848 R=
CX:=20
>>>> 0000000000000000
>>>> [=C2=A0=C2=A0 48.123154] RDX: 0000000080000001 RSI: ffffffff8112673f R=
DI:=20
>>>> ffffffff8112673f
>>>> [=C2=A0=C2=A0 48.123159] RBP: ffffffffa0577480 R08: ffff88827fbfcfe8 R=
09:=20
>>>> 000000000009fffb
>>>> [=C2=A0=C2=A0 48.123163] R10: 00000000fffe0000 R11: 3fffffffffffffff R=
12:=20
>>>> ffff88810a04d100
>>>> [=C2=A0=C2=A0 48.123167] R13: ffff88810a07d308 R14: ffff888109990800 R=
15:=20
>>>> ffff88810997b800
>>>> [=C2=A0=C2=A0 48.123171] FS:=C2=A0 00007ffff624b9c0(0000) GS:ffff88827=
6e00000(0000)=20
>>>> knlGS:0000000000000000
>>>> [=C2=A0=C2=A0 48.123176] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>>>> [=C2=A0=C2=A0 48.123181] CR2: 00007ffff7f93bf0 CR3: 0000000108e56000 C=
R4:=20
>>>> 0000000000350ef0
>>>> [=C2=A0=C2=A0 48.123185] Call Trace:
>>>> [=C2=A0=C2=A0 48.123190]=C2=A0 i915_sw_fence_reinit+0x15/0x40 [i915]
>>>> [=C2=A0=C2=A0 48.123341]=C2=A0 intel_context_init+0x16b/0x1d0 [i915]
>>>> [=C2=A0=C2=A0 48.123492]=C2=A0 intel_context_create+0x33/0x100 [i915]
>>>> [=C2=A0=C2=A0 48.123642]=C2=A0 default_engines+0x9d/0x120 [i915]
>>>> [=C2=A0=C2=A0 48.123806]=C2=A0 i915_gem_create_context+0x465/0x630 [i9=
15]
>>>> [=C2=A0=C2=A0 48.125964]=C2=A0 ? trace_kmalloc+0x29/0xd0
>>>> [=C2=A0=C2=A0 48.125976]=C2=A0 ? kmem_cache_alloc_trace+0x121/0x620
>>>> [=C2=A0=C2=A0 48.125984]=C2=A0 i915_gem_context_open+0x145/0x1d0 [i915]
>>>> [=C2=A0=C2=A0 48.126172]=C2=A0 i915_gem_open+0x75/0xb0 [i915]
>>>> [=C2=A0=C2=A0 48.126364]=C2=A0 drm_file_alloc+0x1b1/0x280 [drm]
>>>> [=C2=A0=C2=A0 48.126427]=C2=A0 drm_open+0xde/0x250 [drm]
>>>> [=C2=A0=C2=A0 48.126482]=C2=A0 drm_stub_open+0xa8/0x130 [drm]
>>>> [=C2=A0=C2=A0 48.126538]=C2=A0 chrdev_open+0xbf/0x240
>>>> [=C2=A0=C2=A0 48.126547]=C2=A0 ? cdev_device_add+0x90/0x90
>>>> [=C2=A0=C2=A0 48.126553]=C2=A0 do_dentry_open+0x151/0x3a0
>>>> [=C2=A0=C2=A0 48.126560]=C2=A0 path_openat+0x76f/0xa10
>>>> [=C2=A0=C2=A0 48.126568]=C2=A0 do_filp_open+0xa9/0x150
>>>> [=C2=A0=C2=A0 48.126575]=C2=A0 ? preempt_count_sub+0x9b/0xd0
>>>> [=C2=A0=C2=A0 48.126584]=C2=A0 ? _raw_spin_unlock+0x29/0x40
>>>> [=C2=A0=C2=A0 48.126593]=C2=A0 do_sys_openat2+0x97/0x160
>>>> [=C2=A0=C2=A0 48.126600]=C2=A0 __x64_sys_openat+0x54/0x90
>>>> [=C2=A0=C2=A0 48.126607]=C2=A0 do_syscall_64+0x38/0x90
>>>> [=C2=A0=C2=A0 48.126614]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>> [=C2=A0=C2=A0 48.126622] RIP: 0033:0x7ffff7cdca5b
>>>> [=C2=A0=C2=A0 48.126630] Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 =
8b 04 25=20
>>>> 18 00 00 00 85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00=20
>>>> 00 0f 05 <48> 3d 00 f0 ff ff 0f 87 91 00 00 00 48 8b 4c 24 28 64 48=20
>>>> 33 0c 25
>>>> [=C2=A0=C2=A0 48.126636] RSP: 002b:00007fffffffda20 EFLAGS: 00000246 O=
RIG_RAX:=20
>>>> 0000000000000101
>>>> [=C2=A0=C2=A0 48.126645] RAX: ffffffffffffffda RBX: 00007fffffffdb60 R=
CX:=20
>>>> 00007ffff7cdca5b
>>>> [=C2=A0=C2=A0 48.126649] RDX: 0000000000000002 RSI: 00007fffffffdb60 R=
DI:=20
>>>> 00000000ffffff9c
>>>> [=C2=A0=C2=A0 48.126654] RBP: 00007fffffffdb60 R08: 0000000000000001 R=
09:=20
>>>> 000000000000000e
>>>> [=C2=A0=C2=A0 48.126658] R10: 0000000000000000 R11: 0000000000000246 R=
12:=20
>>>> 0000000000000002
>>>> [=C2=A0=C2=A0 48.126663] R13: 00007ffff7f9406a R14: 0000000000000000 R=
15:=20
>>>> 00000000fffffffb
>>>> [=C2=A0=C2=A0 48.126669] irq event stamp: 29565
>>>> [=C2=A0=C2=A0 48.126673] hardirqs last=C2=A0 enabled at (29571):=20
>>>> [<ffffffff81126357>] __up_console_sem+0x67/0x70
>>>> [=C2=A0=C2=A0 48.126682] hardirqs last disabled at (29576):=20
>>>> [<ffffffff8112633c>] __up_console_sem+0x4c/0x70
>>>> [=C2=A0=C2=A0 48.126689] softirqs last=C2=A0 enabled at (29394):=20
>>>> [<ffffffff81c0032c>] __do_softirq+0x32c/0x499
>>>> [=C2=A0=C2=A0 48.126696] softirqs last disabled at (29371):=20
>>>> [<ffffffff810ba2ed>] irq_exit_rcu+0xdd/0x130
>>>> [=C2=A0=C2=A0 48.126704] ---[ end trace 4978f2ce56481e4b ]---
>>>> [=C2=A0=C2=A0 48.126711] ------------[ cut here ]------------
>>>> [=C2=A0=C2=A0 48.126714] ODEBUG: activate destroyed (active state 0) o=
bject=20
>>>> type: i915_sw_fence hint: sw_fence_dummy_notify+0x0/0x10 [i915]
>>>> [=C2=A0=C2=A0 48.127053] WARNING: CPU: 1 PID: 815 at lib/debugobjects.=
c:505=20
>>>> debug_print_object+0x6e/0x90
>>>> [=C2=A0=C2=A0 48.127062] Modules linked in: i915 i2c_algo_bit ttm=20
>>>> drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops=20
>>>> prime_numbers intel_gtt agpgart fuse nls_iso8859_1 nls_cp437 vfat=20
>>>> fat intel_rapl_msr wmi_bmof intel_rapl_common x86_pkg_temp_thermal=20
>>>> r8169 realtek mdio_devres coretemp libphy efi_pstore evdev sdhci_pci=20
>>>> cqhci sdhci mei_me mmc_core i2c_i801 intel_pmc_core mei led_class=20
>>>> wmi i2c_smbus sch_fq_codel drm ip_tables x_tables ipv6 autofs4
>>>> [=C2=A0=C2=A0 48.127216] CPU: 1 PID: 815 Comm: kms_async_flips Tainted=
:=20
>>>> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 5.15.0-rc2-hsw+ #131
>>>> [=C2=A0=C2=A0 48.127221] Hardware name: Intel Corporation NUC7CJYH/NUC=
7JYB,=20
>>>> BIOS JYGLKCPX.86A.0027.2018.0125.1347 01/25/2018
>>>> [=C2=A0=C2=A0 48.127226] RIP: 0010:debug_print_object+0x6e/0x90
>>>> [=C2=A0=C2=A0 48.127232] Code: 07 08 02 83 c0 01 8b 4b 14 4c 8b 45 00 =
48 c7 c7=20
>>>> a0 19 0a 82 89 05 66 07 08 02 8b 43 10 48 8b 14 c5 c0 0d e4 81 e8 d7=20
>>>> 2e 3c 00 <0f> 0b 83 05 c5 c0 0c 01 01 48 83 c4 08 5b 5d c3 83 05 b7=20
>>>> c0 0c 01
>>>> [=C2=A0=C2=A0 48.127238] RSP: 0018:ffffc90000daba88 EFLAGS: 00010282
>>>> [=C2=A0=C2=A0 48.127245] RAX: 0000000000000000 RBX: ffff88810004f848 R=
CX:=20
>>>> 0000000000000000
>>>> [=C2=A0=C2=A0 48.127250] RDX: 0000000080000001 RSI: ffffffff8112673f R=
DI:=20
>>>> ffffffff8112673f
>>>> [=C2=A0=C2=A0 48.127254] RBP: ffffffffa0577480 R08: ffff88827fbfcfe8 R=
09:=20
>>>> 000000000009fffb
>>>> [=C2=A0=C2=A0 48.127259] R10: 00000000fffe0000 R11: 3fffffffffffffff R=
12:=20
>>>> ffff88810a04d468
>>>> [=C2=A0=C2=A0 48.127263] R13: ffffffffa0577480 R14: ffffffff835ce0b8 R=
15:=20
>>>> ffff88810997b800
>>>> [=C2=A0=C2=A0 48.127268] FS:=C2=A0 00007ffff624b9c0(0000) GS:ffff88827=
6e80000(0000)=20
>>>> knlGS:0000000000000000
>>>> [=C2=A0=C2=A0 48.127273] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>>>> [=C2=A0=C2=A0 48.127277] CR2: 000055555556f5e8 CR3: 0000000108e56000 C=
R4:=20
>>>> 0000000000350ee0
>>>> [=C2=A0=C2=A0 48.127282] Call Trace:
>>>> [=C2=A0=C2=A0 48.127287]=C2=A0 debug_object_activate+0x174/0x200
>>>> [=C2=A0=C2=A0 48.127296]=C2=A0 i915_sw_fence_commit+0x15/0x20 [i915]
>>>> [=C2=A0=C2=A0 48.127461]=C2=A0 intel_context_init+0x173/0x1d0 [i915]
>>>> [=C2=A0=C2=A0 48.127627]=C2=A0 intel_context_create+0x33/0x100 [i915]
>>>> [=C2=A0=C2=A0 48.127792]=C2=A0 default_engines+0x9d/0x120 [i915]
>>>> [=C2=A0=C2=A0 48.127971]=C2=A0 i915_gem_create_context+0x465/0x630 [i9=
15]
>>>> [=C2=A0=C2=A0 48.128195]=C2=A0 ? trace_kmalloc+0x29/0xd0
>>>> [=C2=A0=C2=A0 48.128203]=C2=A0 ? kmem_cache_alloc_trace+0x121/0x620
>>>> [=C2=A0=C2=A0 48.128211]=C2=A0 i915_gem_context_open+0x145/0x1d0 [i915]
>>>> [=C2=A0=C2=A0 48.128389]=C2=A0 i915_gem_open+0x75/0xb0 [i915]
>>>> [=C2=A0=C2=A0 48.128577]=C2=A0 drm_file_alloc+0x1b1/0x280 [drm]
>>>> [=C2=A0=C2=A0 48.128632]=C2=A0 drm_open+0xde/0x250 [drm]
>>>> [=C2=A0=C2=A0 48.128687]=C2=A0 drm_stub_open+0xa8/0x130 [drm]
>>>> [=C2=A0=C2=A0 48.128742]=C2=A0 chrdev_open+0xbf/0x240
>>>> [=C2=A0=C2=A0 48.128749]=C2=A0 ? cdev_device_add+0x90/0x90
>>>> [=C2=A0=C2=A0 48.128754]=C2=A0 do_dentry_open+0x151/0x3a0
>>>> [=C2=A0=C2=A0 48.128761]=C2=A0 path_openat+0x76f/0xa10
>>>> [=C2=A0=C2=A0 48.128768]=C2=A0 do_filp_open+0xa9/0x150
>>>> [=C2=A0=C2=A0 48.128775]=C2=A0 ? preempt_count_sub+0x9b/0xd0
>>>> [=C2=A0=C2=A0 48.128782]=C2=A0 ? _raw_spin_unlock+0x29/0x40
>>>> [=C2=A0=C2=A0 48.128789]=C2=A0 do_sys_openat2+0x97/0x160
>>>> [=C2=A0=C2=A0 48.128795]=C2=A0 __x64_sys_openat+0x54/0x90
>>>> [=C2=A0=C2=A0 48.128802]=C2=A0 do_syscall_64+0x38/0x90
>>>> [=C2=A0=C2=A0 48.128808]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>> [=C2=A0=C2=A0 48.128815] RIP: 0033:0x7ffff7cdca5b
>>>> [=C2=A0=C2=A0 48.128821] Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 =
8b 04 25=20
>>>> 18 00 00 00 85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00=20
>>>> 00 0f 05 <48> 3d 00 f0 ff ff 0f 87 91 00 00 00 48 8b 4c 24 28 64 48=20
>>>> 33 0c 25
>>>> [=C2=A0=C2=A0 48.128826] RSP: 002b:00007fffffffda20 EFLAGS: 00000246 O=
RIG_RAX:=20
>>>> 0000000000000101
>>>> [=C2=A0=C2=A0 48.128835] RAX: ffffffffffffffda RBX: 00007fffffffdb60 R=
CX:=20
>>>> 00007ffff7cdca5b
>>>> [=C2=A0=C2=A0 48.128839] RDX: 0000000000000002 RSI: 00007fffffffdb60 R=
DI:=20
>>>> 00000000ffffff9c
>>>> [=C2=A0=C2=A0 48.128844] RBP: 00007fffffffdb60 R08: 0000000000000001 R=
09:=20
>>>> 000000000000000e
>>>> [=C2=A0=C2=A0 48.128848] R10: 0000000000000000 R11: 0000000000000246 R=
12:=20
>>>> 0000000000000002
>>>> [=C2=A0=C2=A0 48.128852] R13: 00007ffff7f9406a R14: 0000000000000000 R=
15:=20
>>>> 00000000fffffffb
>>>> [=C2=A0=C2=A0 48.128859] irq event stamp: 30217
>>>> [=C2=A0=C2=A0 48.128862] hardirqs last=C2=A0 enabled at (30223):=20
>>>> [<ffffffff81126357>] __up_console_sem+0x67/0x70
>>>> [=C2=A0=C2=A0 48.128869] hardirqs last disabled at (30228):=20
>>>> [<ffffffff8112633c>] __up_console_sem+0x4c/0x70
>>>> [=C2=A0=C2=A0 48.128875] softirqs last=C2=A0 enabled at (30050):=20
>>>> [<ffffffff81c0032c>] __do_softirq+0x32c/0x499
>>>> [=C2=A0=C2=A0 48.128881] softirqs last disabled at (30035):=20
>>>> [<ffffffff810ba2ed>] irq_exit_rcu+0xdd/0x130
>>>> [=C2=A0=C2=A0 48.128888] ---[ end trace 4978f2ce56481e4c ]---
>>>> [=C2=A0=C2=A0 48.128895] ------------[ cut here ]------------
>>>> [=C2=A0=C2=A0 48.128899] ODEBUG: active_state destroyed (active state =
0)=20
>>>> object type: i915_sw_fence hint: sw_fence_dummy_notify+0x0/0x10 [i915]
>>>> [=C2=A0=C2=A0 48.129179] WARNING: CPU: 1 PID: 815 at lib/debugobjects.=
c:505=20
>>>> debug_print_object+0x6e/0x90
>>>> [=C2=A0=C2=A0 48.129187] Modules linked in: i915 i2c_algo_bit ttm=20
>>>> drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops=20
>>>> prime_numbers intel_gtt agpgart fuse nls_iso8859_1 nls_cp437 vfat=20
>>>> fat intel_rapl_msr wmi_bmof intel_rapl_common x86_pkg_temp_thermal=20
>>>> r8169 realtek mdio_devres coretemp libphy efi_pstore evdev sdhci_pci=20
>>>> cqhci sdhci mei_me mmc_core i2c_i801 intel_pmc_core mei led_class=20
>>>> wmi i2c_smbus sch_fq_codel drm ip_tables x_tables ipv6 autofs4
>>>> [=C2=A0=C2=A0 48.129328] CPU: 1 PID: 815 Comm: kms_async_flips Tainted=
:=20
>>>> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 5.15.0-rc2-hsw+ #131
>>>> [=C2=A0=C2=A0 48.129334] Hardware name: Intel Corporation NUC7CJYH/NUC=
7JYB,=20
>>>> BIOS JYGLKCPX.86A.0027.2018.0125.1347 01/25/2018
>>>> [=C2=A0=C2=A0 48.129338] RIP: 0010:debug_print_object+0x6e/0x90
>>>> [=C2=A0=C2=A0 48.129344] Code: 07 08 02 83 c0 01 8b 4b 14 4c 8b 45 00 =
48 c7 c7=20
>>>> a0 19 0a 82 89 05 66 07 08 02 8b 43 10 48 8b 14 c5 c0 0d e4 81 e8 d7=20
>>>> 2e 3c 00 <0f> 0b 83 05 c5 c0 0c 01 01 48 83 c4 08 5b 5d c3 83 05 b7=20
>>>> c0 0c 01
>>>> [=C2=A0=C2=A0 48.129350] RSP: 0018:ffffc90000dabaa8 EFLAGS: 00010286
>>>> [=C2=A0=C2=A0 48.129357] RAX: 0000000000000000 RBX: ffff88810004f848 R=
CX:=20
>>>> 0000000000000000
>>>> [=C2=A0=C2=A0 48.129362] RDX: 0000000080000001 RSI: ffffffff8112673f R=
DI:=20
>>>> ffffffff8112673f
>>>> [=C2=A0=C2=A0 48.129366] RBP: ffffffffa0577480 R08: ffff88827fbfcfe8 R=
09:=20
>>>> 000000000009fffb
>>>> [=C2=A0=C2=A0 48.129371] R10: 00000000fffe0000 R11: 3fffffffffffffff R=
12:=20
>>>> ffff88810a04d100
>>>> [=C2=A0=C2=A0 48.129375] R13: ffff88810a07d308 R14: 0000000000000000 R=
15:=20
>>>> ffff88810997b800
>>>> [=C2=A0=C2=A0 48.129379] FS:=C2=A0 00007ffff624b9c0(0000) GS:ffff88827=
6e80000(0000)=20
>>>> knlGS:0000000000000000
>>>> [=C2=A0=C2=A0 48.129384] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>>>> [=C2=A0=C2=A0 48.129389] CR2: 000055555556f5e8 CR3: 0000000108e56000 C=
R4:=20
>>>> 0000000000350ee0
>>>> [=C2=A0=C2=A0 48.129393] Call Trace:
>>>> [=C2=A0=C2=A0 48.129398]=C2=A0 __i915_sw_fence_complete+0x70/0x240 [i9=
15]
>>>> [=C2=A0=C2=A0 48.129564]=C2=A0 ? preempt_count_sub+0x9b/0xd0
>>>> [=C2=A0=C2=A0 48.129572]=C2=A0 intel_context_init+0x173/0x1d0 [i915]
>>>> [=C2=A0=C2=A0 48.129738]=C2=A0 intel_context_create+0x33/0x100 [i915]
>>>> [=C2=A0=C2=A0 48.129902]=C2=A0 default_engines+0x9d/0x120 [i915]
>>>> [=C2=A0=C2=A0 48.130080]=C2=A0 i915_gem_create_context+0x465/0x630 [i9=
15]
>>>> [=C2=A0=C2=A0 48.130258]=C2=A0 ? trace_kmalloc+0x29/0xd0
>>>> [=C2=A0=C2=A0 48.130264]=C2=A0 ? kmem_cache_alloc_trace+0x121/0x620
>>>> [=C2=A0=C2=A0 48.130271]=C2=A0 i915_gem_context_open+0x145/0x1d0 [i915]
>>>> [=C2=A0=C2=A0 48.130449]=C2=A0 i915_gem_open+0x75/0xb0 [i915]
>>>> [=C2=A0=C2=A0 48.130635]=C2=A0 drm_file_alloc+0x1b1/0x280 [drm]
>>>> [=C2=A0=C2=A0 48.130689]=C2=A0 drm_open+0xde/0x250 [drm]
>>>> [=C2=A0=C2=A0 48.130744]=C2=A0 drm_stub_open+0xa8/0x130 [drm]
>>>> [=C2=A0=C2=A0 48.130801]=C2=A0 chrdev_open+0xbf/0x240
>>>> [=C2=A0=C2=A0 48.130807]=C2=A0 ? cdev_device_add+0x90/0x90
>>>> [=C2=A0=C2=A0 48.130813]=C2=A0 do_dentry_open+0x151/0x3a0
>>>> [=C2=A0=C2=A0 48.130819]=C2=A0 path_openat+0x76f/0xa10
>>>> [=C2=A0=C2=A0 48.130826]=C2=A0 do_filp_open+0xa9/0x150
>>>> [=C2=A0=C2=A0 48.130833]=C2=A0 ? preempt_count_sub+0x9b/0xd0
>>>> [=C2=A0=C2=A0 48.130839]=C2=A0 ? _raw_spin_unlock+0x29/0x40
>>>> [=C2=A0=C2=A0 48.130847]=C2=A0 do_sys_openat2+0x97/0x160
>>>> [=C2=A0=C2=A0 48.130853]=C2=A0 __x64_sys_openat+0x54/0x90
>>>> [=C2=A0=C2=A0 48.130860]=C2=A0 do_syscall_64+0x38/0x90
>>>> [=C2=A0=C2=A0 48.130866]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>> [=C2=A0=C2=A0 48.130873] RIP: 0033:0x7ffff7cdca5b
>>>> [=C2=A0=C2=A0 48.130878] Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 =
8b 04 25=20
>>>> 18 00 00 00 85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00=20
>>>> 00 0f 05 <48> 3d 00 f0 ff ff 0f 87 91 00 00 00 48 8b 4c 24 28 64 48=20
>>>> 33 0c 25
>>>> [=C2=A0=C2=A0 48.130883] RSP: 002b:00007fffffffda20 EFLAGS: 00000246 O=
RIG_RAX:=20
>>>> 0000000000000101
>>>> [=C2=A0=C2=A0 48.130892] RAX: ffffffffffffffda RBX: 00007fffffffdb60 R=
CX:=20
>>>> 00007ffff7cdca5b
>>>> [=C2=A0=C2=A0 48.130896] RDX: 0000000000000002 RSI: 00007fffffffdb60 R=
DI:=20
>>>> 00000000ffffff9c
>>>> [=C2=A0=C2=A0 48.130901] RBP: 00007fffffffdb60 R08: 0000000000000001 R=
09:=20
>>>> 000000000000000e
>>>> [=C2=A0=C2=A0 48.130905] R10: 0000000000000000 R11: 0000000000000246 R=
12:=20
>>>> 0000000000000002
>>>> [=C2=A0=C2=A0 48.130909] R13: 00007ffff7f9406a R14: 0000000000000000 R=
15:=20
>>>> 00000000fffffffb
>>>> [=C2=A0=C2=A0 48.130916] irq event stamp: 30843
>>>> [=C2=A0=C2=A0 48.130919] hardirqs last=C2=A0 enabled at (30849):=20
>>>> [<ffffffff81126357>] __up_console_sem+0x67/0x70
>>>> [=C2=A0=C2=A0 48.130926] hardirqs last disabled at (30854):=20
>>>> [<ffffffff8112633c>] __up_console_sem+0x4c/0x70
>>>> [=C2=A0=C2=A0 48.130932] softirqs last=C2=A0 enabled at (30050):=20
>>>> [<ffffffff81c0032c>] __do_softirq+0x32c/0x499
>>>> [=C2=A0=C2=A0 48.130938] softirqs last disabled at (30035):=20
>>>> [<ffffffff810ba2ed>] irq_exit_rcu+0xdd/0x130
>>>> [=C2=A0=C2=A0 48.130944] ---[ end trace 4978f2ce56481e4d ]---
>>>> [=C2=A0=C2=A0 48.130950] ------------[ cut here ]------------
>>>> [=C2=A0=C2=A0 48.130954] ODEBUG: active_state destroyed (active state =
0)=20
>>>> object type: i915_sw_fence hint: sw_fence_dummy_notify+0x0/0x10 [i915]
>>>> [=C2=A0=C2=A0 48.131232] WARNING: CPU: 1 PID: 815 at lib/debugobjects.=
c:505=20
>>>> debug_print_object+0x6e/0x90
>>>> [=C2=A0=C2=A0 48.131240] Modules linked in: i915 i2c_algo_bit ttm=20
>>>> drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops=20
>>>> prime_numbers intel_gtt agpgart fuse nls_iso8859_1 nls_cp437 vfat=20
>>>> fat intel_rapl_msr wmi_bmof intel_rapl_common x86_pkg_temp_thermal=20
>>>> r8169 realtek mdio_devres coretemp libphy efi_pstore evdev sdhci_pci=20
>>>> cqhci sdhci mei_me mmc_core i2c_i801 intel_pmc_core mei led_class=20
>>>> wmi i2c_smbus sch_fq_codel drm ip_tables x_tables ipv6 autofs4
>>>> [=C2=A0=C2=A0 48.131381] CPU: 1 PID: 815 Comm: kms_async_flips Tainted=
:=20
>>>> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 5.15.0-rc2-hsw+ #131
>>>> [=C2=A0=C2=A0 48.131387] Hardware name: Intel Corporation NUC7CJYH/NUC=
7JYB,=20
>>>> BIOS JYGLKCPX.86A.0027.2018.0125.1347 01/25/2018
>>>> [=C2=A0=C2=A0 48.131391] RIP: 0010:debug_print_object+0x6e/0x90
>>>> [=C2=A0=C2=A0 48.131397] Code: 07 08 02 83 c0 01 8b 4b 14 4c 8b 45 00 =
48 c7 c7=20
>>>> a0 19 0a 82 89 05 66 07 08 02 8b 43 10 48 8b 14 c5 c0 0d e4 81 e8 d7=20
>>>> 2e 3c 00 <0f> 0b 83 05 c5 c0 0c 01 01 48 83 c4 08 5b 5d c3 83 05 b7=20
>>>> c0 0c 01
>>>> [=C2=A0=C2=A0 48.131402] RSP: 0018:ffffc90000dabaa8 EFLAGS: 00010286
>>>> [=C2=A0=C2=A0 48.131410] RAX: 0000000000000000 RBX: ffff88810004f848 R=
CX:=20
>>>> 0000000000000000
>>>> [=C2=A0=C2=A0 48.131414] RDX: 0000000080000001 RSI: ffffffff8112673f R=
DI:=20
>>>> ffffffff8112673f
>>>> [=C2=A0=C2=A0 48.131419] RBP: ffffffffa0577480 R08: ffff88827fbfcfe8 R=
09:=20
>>>> 000000000009fffb
>>>> [=C2=A0=C2=A0 48.131423] R10: 00000000fffe0000 R11: 3fffffffffffffff R=
12:=20
>>>> ffff88810a04d100
>>>> [=C2=A0=C2=A0 48.131427] R13: ffff88810a07d308 R14: 0000000000000000 R=
15:=20
>>>> ffff88810997b800
>>>> [=C2=A0=C2=A0 48.131432] FS:=C2=A0 00007ffff624b9c0(0000) GS:ffff88827=
6e80000(0000)=20
>>>> knlGS:0000000000000000
>>>> [=C2=A0=C2=A0 48.131437] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>>>> [=C2=A0=C2=A0 48.131441] CR2: 000055555556f5e8 CR3: 0000000108e56000 C=
R4:=20
>>>> 0000000000350ee0
>>>> [=C2=A0=C2=A0 48.131446] Call Trace:
>>>> [=C2=A0=C2=A0 48.131450]=C2=A0 __i915_sw_fence_complete+0x9c/0x240 [i9=
15]
>>>> [=C2=A0=C2=A0 48.131614]=C2=A0 ? preempt_count_sub+0x9b/0xd0
>>>> [=C2=A0=C2=A0 48.131622]=C2=A0 intel_context_init+0x173/0x1d0 [i915]
>>>> [=C2=A0=C2=A0 48.131787]=C2=A0 intel_context_create+0x33/0x100 [i915]
>>>> [=C2=A0=C2=A0 48.131951]=C2=A0 default_engines+0x9d/0x120 [i915]
>>>> [=C2=A0=C2=A0 48.132129]=C2=A0 i915_gem_create_context+0x465/0x630 [i9=
15]
>>>> [=C2=A0=C2=A0 48.132306]=C2=A0 ? trace_kmalloc+0x29/0xd0
>>>> [=C2=A0=C2=A0 48.132313]=C2=A0 ? kmem_cache_alloc_trace+0x121/0x620
>>>> [=C2=A0=C2=A0 48.132320]=C2=A0 i915_gem_context_open+0x145/0x1d0 [i915]
>>>> [=C2=A0=C2=A0 48.132498]=C2=A0 i915_gem_open+0x75/0xb0 [i915]
>>>> [=C2=A0=C2=A0 48.132685]=C2=A0 drm_file_alloc+0x1b1/0x280 [drm]
>>>> [=C2=A0=C2=A0 48.132739]=C2=A0 drm_open+0xde/0x250 [drm]
>>>> [=C2=A0=C2=A0 48.132793]=C2=A0 drm_stub_open+0xa8/0x130 [drm]
>>>> [=C2=A0=C2=A0 48.132849]=C2=A0 chrdev_open+0xbf/0x240
>>>> [=C2=A0=C2=A0 48.132855]=C2=A0 ? cdev_device_add+0x90/0x90
>>>> [=C2=A0=C2=A0 48.132861]=C2=A0 do_dentry_open+0x151/0x3a0
>>>> [=C2=A0=C2=A0 48.132867]=C2=A0 path_openat+0x76f/0xa10
>>>> [=C2=A0=C2=A0 48.132874]=C2=A0 do_filp_open+0xa9/0x150
>>>> [=C2=A0=C2=A0 48.132881]=C2=A0 ? preempt_count_sub+0x9b/0xd0
>>>> [=C2=A0=C2=A0 48.132887]=C2=A0 ? _raw_spin_unlock+0x29/0x40
>>>> [=C2=A0=C2=A0 48.132895]=C2=A0 do_sys_openat2+0x97/0x160
>>>> [=C2=A0=C2=A0 48.132901]=C2=A0 __x64_sys_openat+0x54/0x90
>>>> [=C2=A0=C2=A0 48.132907]=C2=A0 do_syscall_64+0x38/0x90
>>>> [=C2=A0=C2=A0 48.132914]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>> [=C2=A0=C2=A0 48.132921] RIP: 0033:0x7ffff7cdca5b
>>>> [=C2=A0=C2=A0 48.132926] Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 =
8b 04 25=20
>>>> 18 00 00 00 85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00=20
>>>> 00 0f 05 <48> 3d 00 f0 ff ff 0f 87 91 00 00 00 48 8b 4c 24 28 64 48=20
>>>> 33 0c 25
>>>> [=C2=A0=C2=A0 48.132931] RSP: 002b:00007fffffffda20 EFLAGS: 00000246 O=
RIG_RAX:=20
>>>> 0000000000000101
>>>> [=C2=A0=C2=A0 48.132939] RAX: ffffffffffffffda RBX: 00007fffffffdb60 R=
CX:=20
>>>> 00007ffff7cdca5b
>>>> [=C2=A0=C2=A0 48.132944] RDX: 0000000000000002 RSI: 00007fffffffdb60 R=
DI:=20
>>>> 00000000ffffff9c
>>>> [=C2=A0=C2=A0 48.132948] RBP: 00007fffffffdb60 R08: 0000000000000001 R=
09:=20
>>>> 000000000000000e
>>>> [=C2=A0=C2=A0 48.132952] R10: 0000000000000000 R11: 0000000000000246 R=
12:=20
>>>> 0000000000000002
>>>> [=C2=A0=C2=A0 48.132956] R13: 00007ffff7f9406a R14: 0000000000000000 R=
15:=20
>>>> 00000000fffffffb
>>>> [=C2=A0=C2=A0 48.132963] irq event stamp: 31465
>>>> [=C2=A0=C2=A0 48.132966] hardirqs last=C2=A0 enabled at (31471):=20
>>>> [<ffffffff81126357>] __up_console_sem+0x67/0x70
>>>> [=C2=A0=C2=A0 48.132973] hardirqs last disabled at (31476):=20
>>>> [<ffffffff8112633c>] __up_console_sem+0x4c/0x70
>>>> [=C2=A0=C2=A0 48.132979] softirqs last=C2=A0 enabled at (30050):=20
>>>> [<ffffffff81c0032c>] __do_softirq+0x32c/0x499
>>>> [=C2=A0=C2=A0 48.132984] softirqs last disabled at (30035):=20
>>>> [<ffffffff810ba2ed>] irq_exit_rcu+0xdd/0x130
>>>> [=C2=A0=C2=A0 48.132991] ---[ end trace 4978f2ce56481e4e ]---
>>>> [=C2=A0=C2=A0 48.132996] ------------[ cut here ]------------
>>>> [=C2=A0=C2=A0 48.133000] ODEBUG: deactivate destroyed (active state 0)=
 object=20
>>>> type: i915_sw_fence hint: sw_fence_dummy_notify+0x0/0x10 [i915]
>>>> [=C2=A0=C2=A0 48.133277] WARNING: CPU: 1 PID: 815 at lib/debugobjects.=
c:505=20
>>>> debug_print_object+0x6e/0x90
>>>> [=C2=A0=C2=A0 48.133284] Modules linked in: i915 i2c_algo_bit ttm=20
>>>> drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops=20
>>>> prime_numbers intel_gtt agpgart fuse nls_iso8859_1 nls_cp437 vfat=20
>>>> fat intel_rapl_msr wmi_bmof intel_rapl_common x86_pkg_temp_thermal=20
>>>> r8169 realtek mdio_devres coretemp libphy efi_pstore evdev sdhci_pci=20
>>>> cqhci sdhci mei_me mmc_core i2c_i801 intel_pmc_core mei led_class=20
>>>> wmi i2c_smbus sch_fq_codel drm ip_tables x_tables ipv6 autofs4
>>>> [=C2=A0=C2=A0 48.133425] CPU: 1 PID: 815 Comm: kms_async_flips Tainted=
:=20
>>>> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 5.15.0-rc2-hsw+ #131
>>>> [=C2=A0=C2=A0 48.133430] Hardware name: Intel Corporation NUC7CJYH/NUC=
7JYB,=20
>>>> BIOS JYGLKCPX.86A.0027.2018.0125.1347 01/25/2018
>>>> [=C2=A0=C2=A0 48.133434] RIP: 0010:debug_print_object+0x6e/0x90
>>>> [=C2=A0=C2=A0 48.133440] Code: 07 08 02 83 c0 01 8b 4b 14 4c 8b 45 00 =
48 c7 c7=20
>>>> a0 19 0a 82 89 05 66 07 08 02 8b 43 10 48 8b 14 c5 c0 0d e4 81 e8 d7=20
>>>> 2e 3c 00 <0f> 0b 83 05 c5 c0 0c 01 01 48 83 c4 08 5b 5d c3 83 05 b7=20
>>>> c0 0c 01
>>>> [=C2=A0=C2=A0 48.133445] RSP: 0018:ffffc90000dabaa8 EFLAGS: 00010286
>>>> [=C2=A0=C2=A0 48.133453] RAX: 0000000000000000 RBX: ffff88810004f848 R=
CX:=20
>>>> 0000000000000000
>>>> [=C2=A0=C2=A0 48.133458] RDX: 0000000080000001 RSI: ffffffff8112673f R=
DI:=20
>>>> ffffffff8112673f
>>>> [=C2=A0=C2=A0 48.133462] RBP: ffffffffa0577480 R08: ffff88827fbfcfe8 R=
09:=20
>>>> 000000000009fffb
>>>> [=C2=A0=C2=A0 48.133468] R10: 00000000fffe0000 R11: 3fffffffffffffff R=
12:=20
>>>> ffff88810a04d100
>>>> [=C2=A0=C2=A0 48.133472] R13: ffff88810a07d308 R14: 0000000000000000 R=
15:=20
>>>> ffff88810997b800
>>>> [=C2=A0=C2=A0 48.133476] FS:=C2=A0 00007ffff624b9c0(0000) GS:ffff88827=
6e80000(0000)=20
>>>> knlGS:0000000000000000
>>>> [=C2=A0=C2=A0 48.133481] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>>>> [=C2=A0=C2=A0 48.133486] CR2: 000055555556f5e8 CR3: 0000000108e56000 C=
R4:=20
>>>> 0000000000350ee0
>>>> [=C2=A0=C2=A0 48.133490] Call Trace:
>>>> [=C2=A0=C2=A0 48.133495]=C2=A0 __i915_sw_fence_complete+0xab/0x240 [i9=
15]
>>>> [=C2=A0=C2=A0 48.133658]=C2=A0 ? preempt_count_sub+0x9b/0xd0
>>>> [=C2=A0=C2=A0 48.133666]=C2=A0 intel_context_init+0x173/0x1d0 [i915]
>>>> [=C2=A0=C2=A0 48.133830]=C2=A0 intel_context_create+0x33/0x100 [i915]
>>>> [=C2=A0=C2=A0 48.142705]=C2=A0 default_engines+0x9d/0x120 [i915]
>>>> [=C2=A0=C2=A0 48.142861]=C2=A0 i915_gem_create_context+0x465/0x630 [i9=
15]
>>>> [=C2=A0=C2=A0 48.142996]=C2=A0 ? trace_kmalloc+0x29/0xd0
>>>> [=C2=A0=C2=A0 48.143003]=C2=A0 ? kmem_cache_alloc_trace+0x121/0x620
>>>> [=C2=A0=C2=A0 48.143009]=C2=A0 i915_gem_context_open+0x145/0x1d0 [i915]
>>>> [=C2=A0=C2=A0 48.143141]=C2=A0 i915_gem_open+0x75/0xb0 [i915]
>>>> [=C2=A0=C2=A0 48.143438]=C2=A0 drm_file_alloc+0x1b1/0x280 [drm]
>>>> [=C2=A0=C2=A0 48.143516]=C2=A0 drm_open+0xde/0x250 [drm]
>>>> [=C2=A0=C2=A0 48.143557]=C2=A0 drm_stub_open+0xa8/0x130 [drm]
>>>> [=C2=A0=C2=A0 48.143598]=C2=A0 chrdev_open+0xbf/0x240
>>>> [=C2=A0=C2=A0 48.143604]=C2=A0 ? cdev_device_add+0x90/0x90
>>>> [=C2=A0=C2=A0 48.143608]=C2=A0 do_dentry_open+0x151/0x3a0
>>>> [=C2=A0=C2=A0 48.143614]=C2=A0 path_openat+0x76f/0xa10
>>>> [=C2=A0=C2=A0 48.143619]=C2=A0 do_filp_open+0xa9/0x150
>>>> [=C2=A0=C2=A0 48.143625]=C2=A0 ? preempt_count_sub+0x9b/0xd0
>>>> [=C2=A0=C2=A0 48.143631]=C2=A0 ? _raw_spin_unlock+0x29/0x40
>>>> [=C2=A0=C2=A0 48.143638]=C2=A0 do_sys_openat2+0x97/0x160
>>>> [=C2=A0=C2=A0 48.143644]=C2=A0 __x64_sys_openat+0x54/0x90
>>>> [=C2=A0=C2=A0 48.143648]=C2=A0 do_syscall_64+0x38/0x90
>>>> [=C2=A0=C2=A0 48.143654]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>> [=C2=A0=C2=A0 48.143660] RIP: 0033:0x7ffff7cdca5b
>>>> [=C2=A0=C2=A0 48.143664] Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 =
8b 04 25=20
>>>> 18 00 00 00 85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00=20
>>>> 00 0f 05 <48> 3d 00 f0 ff ff 0f 87 91 00 00 00 48 8b 4c 24 28 64 48=20
>>>> 33 0c 25
>>>> [=C2=A0=C2=A0 48.143668] RSP: 002b:00007fffffffda20 EFLAGS: 00000246 O=
RIG_RAX:=20
>>>> 0000000000000101
>>>> [=C2=A0=C2=A0 48.143675] RAX: ffffffffffffffda RBX: 00007fffffffdb60 R=
CX:=20
>>>> 00007ffff7cdca5b
>>>> [=C2=A0=C2=A0 48.143679] RDX: 0000000000000002 RSI: 00007fffffffdb60 R=
DI:=20
>>>> 00000000ffffff9c
>>>> [=C2=A0=C2=A0 48.143682] RBP: 00007fffffffdb60 R08: 0000000000000001 R=
09:=20
>>>> 000000000000000e
>>>> [=C2=A0=C2=A0 48.143685] R10: 0000000000000000 R11: 0000000000000246 R=
12:=20
>>>> 0000000000000002
>>>> [=C2=A0=C2=A0 48.143688] R13: 00007ffff7f9406a R14: 0000000000000000 R=
15:=20
>>>> 00000000fffffffb
>>>> [=C2=A0=C2=A0 48.143693] irq event stamp: 32275
>>>> [=C2=A0=C2=A0 48.143696] hardirqs last=C2=A0 enabled at (32281):=20
>>>> [<ffffffff81126357>] __up_console_sem+0x67/0x70
>>>> [=C2=A0=C2=A0 48.143701] hardirqs last disabled at (32286):=20
>>>> [<ffffffff8112633c>] __up_console_sem+0x4c/0x70
>>>> [=C2=A0=C2=A0 48.143706] softirqs last=C2=A0 enabled at (32138):=20
>>>> [<ffffffff81c0032c>] __do_softirq+0x32c/0x499
>>>> [=C2=A0=C2=A0 48.143710] softirqs last disabled at (32125):=20
>>>> [<ffffffff810ba2ed>] irq_exit_rcu+0xdd/0x130
>>>> [=C2=A0=C2=A0 48.143716] ---[ end trace 4978f2ce56481e4f ]---
>>>
>

--=20
Jani Nikula, Intel Open Source Graphics Center
