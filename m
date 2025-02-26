Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5C3A4580C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 09:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4680710E884;
	Wed, 26 Feb 2025 08:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="oY4DJWtS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3480 seconds by postgrey-1.36 at gabe;
 Wed, 26 Feb 2025 08:25:43 UTC
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BF910E884;
 Wed, 26 Feb 2025 08:25:38 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
 by relay4.mymailcheap.com (Postfix) with ESMTPS id 9FD5A20318;
 Wed, 26 Feb 2025 08:25:37 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 by nf1.mymailcheap.com (Postfix) with ESMTPSA id 35C1840241;
 Wed, 26 Feb 2025 08:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1740558337; bh=gkQgxeEUaYMwCaZJ4Js8JHKMV94ACdETT+pLYOEXsy0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oY4DJWtSqWrxwWjOhCpEwTp7MPmuSgzAtJnOJ9c+XFcGUg7ZlfhY+jql7Xc15yEBF
 UO87RWHxV3WUBVMd/fO0UTg/wf3JV91Fs8GX/hb7yY8VaL01NcgDsBYKde/2xSnc68
 ee1peS7bwu07YxBMojLLrJEvCbVvVrfkQmFFfoLU=
Received: from [172.29.0.1] (unknown [203.175.14.48])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 27D87401E4;
 Wed, 26 Feb 2025 08:25:26 +0000 (UTC)
Message-ID: <53659f97-afbe-43a5-8e19-2cbeced1862a@aosc.io>
Date: Wed, 26 Feb 2025 16:25:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe/bo: fix alignment with non-4K kernel page sizes
To: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Mateusz Naklicki <mateusz.naklicki@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kexy Biscuit <kexybiscuit@aosc.io>,
 Shang Yatsen <429839446@qq.com>, stable@vger.kernel.org,
 Haien Liang <27873200@qq.com>, Shirong Liu <lsr1024@qq.com>,
 Haofeng Wu <s2600cw2@126.com>
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
 <20250226-xe-non-4k-fix-v1-1-80f23b5ee40e@aosc.io>
 <wcfp3i6jbsmvpokvbvs5n2yxffhrgu6jyoan3e3m6tb7wbjaq6@tbsit7ignlef>
 <Z76WIgGvvhlbYl/j@lstrano-desk.jf.intel.com>
 <3byh43hetsh37gd544nhurkzhn6ynotlzittvcqjxxwgqg6ucf@b6sdl65ssyxg>
 <Z76qHHpA47b2rhWc@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Mingcong Bai <jeffbai@aosc.io>
In-Reply-To: <Z76qHHpA47b2rhWc@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Queue-Id: 35C1840241
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 10.00]; BAYES_SPAM(0.24)[66.67%];
 MIME_GOOD(-0.10)[text/plain]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_ONE(0.00)[1];
 RCPT_COUNT_TWELVE(0.00)[26];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[];
 SPFBL_URIBL_EMAIL_FAIL(0.00)[jeffbai.aosc.io:server fail,lsr1024.qq.com:server
 fail,429839446.qq.com:server fail,27873200.qq.com:server
 fail,stable.vger.kernel.org:server fail]; 
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[126.com,gmail.com,qq.com];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,aosc.io,qq.com,126.com];
 RCVD_TLS_ALL(0.00)[]
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

Hi Matthew,

在 2025/2/26 13:43, Matthew Brost 写道:
> On Tue, Feb 25, 2025 at 11:05:16PM -0600, Lucas De Marchi wrote:
>> On Tue, Feb 25, 2025 at 08:18:42PM -0800, Matthew Brost wrote:
>>> On Tue, Feb 25, 2025 at 09:13:09PM -0600, Lucas De Marchi wrote:
>>>> On Wed, Feb 26, 2025 at 10:00:18AM +0800, Mingcong Bai via B4 Relay wrote:
>>>>> From: Mingcong Bai <jeffbai@aosc.io>
>>>>>
>>>>> The bo/ttm interfaces with kernel memory mapping from dedicated GPU
>>>>> memory. It is not correct to assume that SZ_4K would suffice for page
>>>>> alignment as there are a few hardware platforms that commonly uses non-4K
>>>>> pages - for instance, currently, Loongson 3A5000/6000 devices (of the
>>>>> LoongArch architecture) commonly uses 16K kernel pages.
>>>>>
>>>>> Per my testing Intel Xe/Arc families of GPUs works on at least
>>>>> Loongson 3A6000 platforms so long as "Above 4G Decoding" and "Resizable
>>>>> BAR" were enabled in the EFI firmware settings. I tested this patch series
>>>>> on my Loongson XA61200 (3A6000) motherboard with an Intel Arc A750 GPU.
>>>>>
>>>>> Without this fix, the kernel will hang at a kernel BUG():
>>>>>
>>>>> [    7.425445] ------------[ cut here ]------------
>>>>> [    7.430032] kernel BUG at drivers/gpu/drm/drm_gem.c:181!
>>>>> [    7.435330] Oops - BUG[#1]:
>>>>> [    7.438099] CPU: 0 UID: 0 PID: 102 Comm: kworker/0:4 Tainted: G            E      6.13.3-aosc-main-00336-g60829239b300-dirty #3
>>>>> [    7.449511] Tainted: [E]=UNSIGNED_MODULE
>>>>> [    7.453402] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05756-prestab
>>>>> [    7.467144] Workqueue: events work_for_cpu_fn
>>>>> [    7.471472] pc 9000000001045fa4 ra ffff8000025331dc tp 90000001010c8000 sp 90000001010cb960
>>>>> [    7.479770] a0 900000012a3e8000 a1 900000010028c000 a2 000000000005d000 a3 0000000000000000
>>>>> [    7.488069] a4 0000000000000000 a5 0000000000000000 a6 0000000000000000 a7 0000000000000001
>>>>> [    7.496367] t0 0000000000001000 t1 9000000001045000 t2 0000000000000000 t3 0000000000000000
>>>>> [    7.504665] t4 0000000000000000 t5 0000000000000000 t6 0000000000000000 t7 0000000000000000
>>>>> [    7.504667] t8 0000000000000000 u0 90000000029ea7d8 s9 900000012a3e9360 s0 900000010028c000
>>>>> [    7.504668] s1 ffff800002744000 s2 0000000000000000 s3 0000000000000000 s4 0000000000000001
>>>>> [    7.504669] s5 900000012a3e8000 s6 0000000000000001 s7 0000000000022022 s8 0000000000000000
>>>>> [    7.537855]    ra: ffff8000025331dc ___xe_bo_create_locked+0x158/0x3b0 [xe]
>>>>> [    7.544893]   ERA: 9000000001045fa4 drm_gem_private_object_init+0xcc/0xd0
>>>>> [    7.551639]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
>>>>> [    7.557785]  PRMD: 00000004 (PPLV0 +PIE -PWE)
>>>>> [    7.562111]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
>>>>> [    7.566870]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
>>>>> [    7.571628] ESTAT: 000c0000 [BRK] (IS= ECode=12 EsubCode=0)
>>>>> [    7.577163]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
>>>>> [    7.583128] Modules linked in: xe(E+) drm_gpuvm(E) drm_exec(E) drm_buddy(E) gpu_sched(E) drm_suballoc_helper(E) drm_display_helper(E) loongson(E) r8169(E) cec(E) rc_core(E) realtek(E) i2c_algo_bit(E) tpm_tis_spi(E) led_class(E) hid_generic(E) drm_ttm_helper(E) ttm(E) drm_client_lib(E) drm_kms_helper(E) sunrpc(E) la_ow_syscall(E) i2c_dev(E)
>>>>> [    7.613049] Process kworker/0:4 (pid: 102, threadinfo=00000000bc26ebd1, task=0000000055480707)
>>>>> [    7.621606] Stack : 0000000000000000 3030303a6963702b 000000000005d000 0000000000000000
>>>>> [    7.629563]         0000000000000001 0000000000000000 0000000000000000 8e1bfae42b2f7877
>>>>> [    7.637519]         000000000005d000 900000012a3e8000 900000012a3e9360 0000000000000000
>>>>> [    7.645475]         ffffffffffffffff 0000000000000000 0000000000022022 0000000000000000
>>>>> [    7.653431]         0000000000000001 ffff800002533660 0000000000022022 9000000000234470
>>>>> [    7.661386]         90000001010cba28 0000000000001000 0000000000000000 000000000005c300
>>>>> [    7.669342]         900000012a3e8000 0000000000000000 0000000000000001 900000012a3e8000
>>>>> [    7.677298]         ffffffffffffffff 0000000000022022 900000012a3e9498 ffff800002533a14
>>>>> [    7.685254]         0000000000022022 0000000000000000 900000000209c000 90000000010589e0
>>>>> [    7.693209]         90000001010cbab8 ffff8000027c78c0 fffffffffffff000 900000012a3e8000
>>>>> [    7.701165]         ...
>>>>> [    7.703588] Call Trace:
>>>>> [    7.703590] [<9000000001045fa4>] drm_gem_private_object_init+0xcc/0xd0
>>>>> [    7.712496] [<ffff8000025331d8>] ___xe_bo_create_locked+0x154/0x3b0 [xe]
>>>>> [    7.719268] [<ffff80000253365c>] __xe_bo_create_locked+0x228/0x304 [xe]
>>>>> [    7.725951] [<ffff800002533a10>] xe_bo_create_pin_map_at_aligned+0x70/0x1b0 [xe]
>>>>> [    7.733410] [<ffff800002533c7c>] xe_managed_bo_create_pin_map+0x34/0xcc [xe]
>>>>> [    7.740522] [<ffff800002533d58>] xe_managed_bo_create_from_data+0x44/0xb0 [xe]
>>>>> [    7.747807] [<ffff80000258d19c>] xe_uc_fw_init+0x3ec/0x904 [xe]
>>>>> [    7.753814] [<ffff80000254a478>] xe_guc_init+0x30/0x3dc [xe]
>>>>> [    7.759553] [<ffff80000258bc04>] xe_uc_init+0x20/0xf0 [xe]
>>>>> [    7.765121] [<ffff800002542abc>] xe_gt_init_hwconfig+0x5c/0xd0 [xe]
>>>>> [    7.771461] [<ffff800002537204>] xe_device_probe+0x240/0x588 [xe]
>>>>> [    7.777627] [<ffff800002575448>] xe_pci_probe+0x6c0/0xa6c [xe]
>>>>> [    7.783540] [<9000000000e9828c>] local_pci_probe+0x4c/0xb4
>>>>> [    7.788989] [<90000000002aa578>] work_for_cpu_fn+0x20/0x40
>>>>> [    7.794436] [<90000000002aeb50>] process_one_work+0x1a4/0x458
>>>>> [    7.800143] [<90000000002af5a0>] worker_thread+0x304/0x3fc
>>>>> [    7.805591] [<90000000002bacac>] kthread+0x114/0x138
>>>>> [    7.810520] [<9000000000241f64>] ret_from_kernel_thread+0x8/0xa4
>>>>> [    7.816489]
>>>>> [    7.817961] Code: 4c000020  29c3e2f9  53ff93ff <002a0001> 0015002c  03400000  02ff8063  29c04077  001500f7
>>>>> [    7.827651]
>>>>> [    7.829140] ---[ end trace 0000000000000000 ]---
>>>>>
>>>>> Revise all instances of `SZ_4K' with `PAGE_SIZE' and revise the call to
>>>>> `drm_gem_private_object_init()' in `*___xe_bo_create_locked()' (last call
>>>>> before BUG()) to use `size_t aligned_size' calculated from `PAGE_SIZE' to
>>>>> fix the above error.
>>>>>
>>>>> Cc: <stable@vger.kernel.org>
>>>>> Fixes: 4e03b584143e ("drm/xe/uapi: Reject bo creation of unaligned size")
>>>>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>>>> Tested-by: Mingcong Bai <jeffbai@aosc.io>
>>>>> Tested-by: Haien Liang <27873200@qq.com>
>>>>> Tested-by: Shirong Liu <lsr1024@qq.com>
>>>>> Tested-by: Haofeng Wu <s2600cw2@126.com>
>>>>> Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c32410a077b3ddb6dca3f28223360
>>>>> Co-developed-by: Shang Yatsen <429839446@qq.com>
>>>>> Signed-off-by: Shang Yatsen <429839446@qq.com>
>>>>> Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
>>>>> ---
>>>>> drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
>>>>> 1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>>> index 3f5391d416d469c636d951dd6f0a2b3b5ae95dab..dd03c581441f352eff51d0eafe1298fca7d9653d 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>>> @@ -1441,9 +1441,9 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>>>>> 		flags |= XE_BO_FLAG_INTERNAL_64K;
>>>>> 		alignment = align >> PAGE_SHIFT;
>>>>> 	} else {
>>>
>>> } else if (type == ttm_bo_type_device) {
>>> 	new code /w PAGE_SIZE
>>> } else {
>>> 	old code /w SZ_4K (or maybe XE_PAGE_SIZE now)?
>>> }
>>>
>>> See below for further explaination.
>>>
>>>>> -		aligned_size = ALIGN(size, SZ_4K);
>>>>> +		aligned_size = ALIGN(size, PAGE_SIZE);
>>>>
>>>> in the very beginning of the driver we were set to use XE_PAGE_SIZE
>>>> for things like this. It seems thing went side ways though.
>>>>
>>>> Thanks for fixing these. XE_PAGE_SIZE is always 4k, but I think we should
>>>> uxe XE_PAGE_SIZE for clarity.  For others in Cc...  any thoughts?
>>>>
>>>
>>> It looks like you have a typo here, Lucas. Could you please clarify?
>>>
>>> However, XE_PAGE_SIZE should always be 4k, as it refers to the GPU page
>>> size, which is fixed.
>>
>> yes, that's what I meant: I think we should use XE_PAGE_SIZE (here and
>> in other patches in this series) instead of SZ_4K. Even if both are
>> the same, it makes things clearer.
>>
> 
> I think, to some extent, it has to be considered in context—for example,
> Patch #2 in this series, where we are enforcing GuC memory requirements
> to 4K, makes SZ_4K appropriate. In contrast, in Patch #4, where we are
> operating in GPU page sizes, XE_PAGE_SIZE makes more sense.
> 
> Regardless, this series clearly shows that we have been carelessly
> mixing SZ_4K, XE_PAGE_SIZE, and PAGE_SIZE throughout the code—probably
> mostly my fault from the early Xe coding. I agree that we should try to
> clean this up.

This sounds good, I will revise as suggested in v2.

Best Regards,
Mingcong Bai

> 
> Matt
> 
>> Lucas De Marchi
> 

