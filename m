Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0074451552
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 21:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22AE6E101;
	Mon, 15 Nov 2021 20:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BC46E101;
 Mon, 15 Nov 2021 20:32:14 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id n29so33046888wra.11;
 Mon, 15 Nov 2021 12:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=HsPcMHuEMz7O+yrTQl7qwb2P3zC00235cZZe8DUejI0=;
 b=JWuzw7mBrzPMi5lYASzq8kbn1O1/PfGzccNnS9afXGn9bXGZz3DsJzw+zAFPq6PMB6
 nwynhtnM8GkBg6nagHC9rBsH6FLow8lnd2iM2VVjweBTkb1VxnJzMmSDR3pp3M30Q8PP
 iqC5aKbtef/sqri1QHLd8WuYvMNXNxPfxtnVkm+VXFEzcVjVSkwilee+NH5LR88XwAby
 YcsgD8RRDzHxVQu3oS/Zju2QQfQlPumUBkoLrCqUQkBLNfjtgm0SRiueQ2FUEx8Lw5j/
 vhMNdEioke2mHjEyEIYbJ545UIb0zg0G9bGRdvQFsAt2KQ2gQddM01RJduRacl9XH6Hf
 RW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HsPcMHuEMz7O+yrTQl7qwb2P3zC00235cZZe8DUejI0=;
 b=bNZSpIAs2crRtsOTDQE/49gHSzSALH74zU8H7ee87Udf7qKBiH2OsZ4tfm/SFry6nh
 O14mT9wXwo1Dnk1FLL8Ngm9agPlOhcPU11UDU+heGqTBJPhcoyFAsHC4t/hqvq+pkGEV
 i8Lvt+utlzsmn4SYXXiqR4choLfLyK/n+T80ywPZ9grANQ931pstLtkeu37Mxj3Sx05O
 wXEsRO0ZxjpPM7x3F7nzljjbCdR06y83sfFl1NZiXrnSJHwDGzQgS7uA+yPJ0h5spdkJ
 DKYHdpRuURQ3fPeT8cooC/d/GR1+scBkqvxCdDbaogH+QA972DyNv5DUtkbIzQBG/LNh
 H9tw==
X-Gm-Message-State: AOAM533eSUISXHKm6qAKczI5TOKYf/x41sLCqZVY9jzv5W1/hUwqHy2p
 EQMXNb5hTrdqLpt4kEXpUo6PbyBM5Nk=
X-Google-Smtp-Source: ABdhPJwRFQwzhMpUG11OPi2r9Dc0UsgLdADcroRh0BwoD68zNkqFAtyPUaRRKOswq2VJa3lo6JnZxQ==
X-Received: by 2002:adf:efc6:: with SMTP id i6mr2366100wrp.428.1637008332592; 
 Mon, 15 Nov 2021 12:32:12 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:f6a2:bc13:dfeb:7039?
 ([2a02:908:1252:fb60:f6a2:bc13:dfeb:7039])
 by smtp.gmail.com with ESMTPSA id l2sm370910wmq.42.2021.11.15.12.32.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 12:32:11 -0800 (PST)
Subject: Re: [PATCH 12/26] drm/scheduler: use new iterator in
 drm_sched_job_add_implicit_dependencies v2
To: Daniel Vetter <daniel@ffwll.ch>, Sascha Hauer <sha@pengutronix.de>
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-13-christian.koenig@amd.com>
 <20211115140353.GC6556@pengutronix.de> <YZJp8Uj4NpeP+zui@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cac7a0f0-2acb-df09-dc05-df66123cbbfa@gmail.com>
Date: Mon, 15 Nov 2021 21:32:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YZJp8Uj4NpeP+zui@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.11.21 um 15:08 schrieb Daniel Vetter:
> On Mon, Nov 15, 2021 at 03:03:53PM +0100, Sascha Hauer wrote:
>> Hi,
>>
>> On Fri, Sep 17, 2021 at 02:34:59PM +0200, Christian König wrote:
>>> Simplifying the code a bit.
>>>
>>> v2: use dma_resv_for_each_fence
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 26 ++++++--------------------
>>>   1 file changed, 6 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 042c16b5d54a..5bc5f775abe1 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -699,30 +699,16 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>>   					    struct drm_gem_object *obj,
>>>   					    bool write)
>>>   {
>>> +	struct dma_resv_iter cursor;
>>> +	struct dma_fence *fence;
>>>   	int ret;
>>> -	struct dma_fence **fences;
>>> -	unsigned int i, fence_count;
>>> -
>>> -	if (!write) {
>>> -		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
>>> -
>>> -		return drm_sched_job_add_dependency(job, fence);
>>> -	}
>>> -
>>> -	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
>>> -	if (ret || !fence_count)
>>> -		return ret;
>>>   
>>> -	for (i = 0; i < fence_count; i++) {
>>> -		ret = drm_sched_job_add_dependency(job, fences[i]);
>>> +	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
>>> +		ret = drm_sched_job_add_dependency(job, fence);
>>>   		if (ret)
>>> -			break;
>>> +			return ret;
>>>   	}
>>> -
>>> -	for (; i < fence_count; i++)
>>> -		dma_fence_put(fences[i]);
>>> -	kfree(fences);
>>> -	return ret;
>>> +	return 0;
>>>   }
>>>   EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
>>>   
>> This patch lets the panfrost driver explode on v5.16-rc1 with the
>> following. I didn't bisect it, but it goes away when I revert this
>> patch. I only started weston, nothing more.
>>
>> Any idea what goes wrong here?
> Should be fixed in 13e9e30cafea1, but Christian pushed it to the wrong
> patch so it missed -rc1.
>
> Christian, this needs to go into drm-misc-fixes, pls cherry-pick it over.

The problem is it doesn't apply to drm-misc-fixes. Looks like the branch 
wasn't updated.

What's going on here?

Christian.

> -Daniel
>
>> Sascha
>>
>> [   12.512606] Fence drm_sched:pan_js:a:1 released with pending signals!
>> [   12.513225] WARNING: CPU: 3 PID: 257 at drivers/dma-buf/dma-fence.c:526 dma_fence_release+0xac/0xe8
>> [   12.514056] Modules linked in:
>> [   12.514334] CPU: 3 PID: 257 Comm: weston Not tainted 5.16.0-rc1-00043-g794870164a37 #443
>> [   12.514621] ------------[ cut here ]------------
>> [   12.515040] Hardware name: Rockchip RK3568 EVB1 DDR4 V10 Board (DT)
>> [   12.515044] pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   12.515049] pc : dma_fence_release+0xac/0xe8
>> [   12.515056] lr : dma_fence_release+0xac/0xe8
>> [   12.515061] sp : ffff8000123ebb20
>> [   12.515064] x29: ffff8000123ebb20 x28: ffff8000123ebd58
>> [   12.515518] refcount_t: addition on 0; use-after-free.
>> [   12.516015]  x27: 0000000000000000
>> [   12.516668] WARNING: CPU: 0 PID: 145 at lib/refcount.c:25 refcount_warn_saturate+0x98/0x140
>> [   12.516992] x26: 0000000000000001
>> [   12.517366] Modules linked in:
>> [   12.517654]  x25: ffff000004b051c0
>> [   12.518108]
>> [   12.518555]  x24: 0000000000000000
>> [   12.518854] CPU: 0 PID: 145 Comm: irq/25-panfrost Not tainted 5.16.0-rc1-00043-g794870164a37 #443
>> [   12.519576]
>> [   12.519866] Hardware name: Rockchip RK3568 EVB1 DDR4 V10 Board (DT)
>> [   12.520133] x23: 0000000000000000
>> [   12.520430] pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   12.520559]  x22: ffff800010d41b78
>> [   12.520856] pc : refcount_warn_saturate+0x98/0x140
>> [   12.521625]  x21: ffff000004b05050
>> [   12.521755] lr : refcount_warn_saturate+0x98/0x140
>> [   12.522299]
>> [   12.522588] sp : ffff8000122b3bc0
>> [   12.523192] x20: ffff000004b05040
>> [   12.523489] x29: ffff8000122b3bc0
>> [   12.523906]  x19: ffff000004b05078
>> [   12.524203]  x28: 0000000000000000
>> [   12.524620]  x18: 0000000000000010
>> [   12.524751]  x27: ffff000003791880
>> [   12.525040]
>> [   12.525329]
>> [   12.525618] x17: 0000000000000000
>> [   12.525915] x26: ffff8000122b3d30
>> [   12.526212]  x16: 0000000000000000
>> [   12.526509]  x25: 0000000000000001
>> [   12.526806]  x15: ffff0000050e2dc0
>> [   12.526937]  x24: ffff000003791a10
>> [   12.527067]
>> [   12.527357]
>> [   12.527646] x14: 00000000000001b5
>> [   12.527942] x23: 0000000000000000
>> [   12.528240]  x13: ffff0000050e2dc0
>> [   12.528536]  x22: ffff000003505280
>> [   12.528833]  x12: 00000000ffffffea
>> [   12.528964]  x21: ffff000003a2a220
>> [   12.529095]
>> [   12.529384]
>> [   12.529673] x11: ffff800011761ec8
>> [   12.529970] x20: ffff000004b05078
>> [   12.530267]  x10: ffff8000115e1e88
>> [   12.530564]  x19: ffff000004b05000
>> [   12.530861]  x9 : ffff8000115e1ee0
>> [   12.530992]  x18: 0000000000000010
>> [   12.531123]
>> [   12.531412]
>> [   12.531701] x8 : 000000000017ffe8
>> [   12.531998] x17: 0000000000500600
>> [   12.532294]  x7 : c0000000fffeffff
>> [   12.532591]  x16: 0000000000000000
>> [   12.532888]  x6 : 0000000000000001
>> [   12.533019]  x15: ffff000003505700
>> [   12.533150]
>> [   12.533439]
>> [   12.533728] x5 : ffff00007fb8c9a0
>> [   12.534025] x14: 0000000000000000
>> [   12.534322]  x4 : 0000000000000000
>> [   12.534619]  x13: 292d2d3d45505954
>> [   12.534914]  x3 : 0000000000000001
>> [   12.535045]  x12: 4220534253532d20
>> [   12.535176]
>> [   12.535465]
>> [   12.535754] x2 : ffff00007fb8c9a8
>> [   12.536051] x11: 5449442d204f4354
>> [   12.536347]  x1 : ea6e0584a53f2200
>> [   12.536643]  x10: 2d204f41552d204e
>> [   12.536941]  x0 : 0000000000000000
>> [   12.537073]  x9 : 4e41502b20666961
>> [   12.537203]
>> [   12.537492]
>> [   12.537782] Call trace:
>> [   12.538078] x8 : 642076635a6e2820
>> [   12.538377]  dma_fence_release+0xac/0xe8
>> [   12.538671]  x7 : 205d343430353135
>> [   12.538967]  dma_resv_add_excl_fence+0x1b8/0x1f0
>> [   12.539098]  x6 : 352e32312020205b
>> [   12.539230]  panfrost_job_push+0x1bc/0x200
>> [   12.539442]
>> [   12.539732]  panfrost_ioctl_submit+0x358/0x438
>> [   12.540073] x5 : ffff00007fb539a0
>> [   12.540370]  drm_ioctl_kernel+0xb8/0x170
>> [   12.540771]  x4 : 0000000000000000
>> [   12.541069]  drm_ioctl+0x214/0x450
>> [   12.541424]  x3 : 0000000000000001
>> [   12.541556]  __arm64_sys_ioctl+0xa0/0xe0
>> [   12.541943]
>> [   12.542233]  invoke_syscall+0x40/0xf8
>> [   12.542573] x2 : ffff00007fb539a8
>> [   12.542871]  el0_svc_common.constprop.0+0xc0/0xe0
>> [   12.543167]  x1 : 0ac4fb7a0680bb00
>> [   12.543465]  do_el0_svc+0x20/0x80
>> [   12.543805]  x0 : 0000000000000000
>> [   12.543936]  el0_svc+0x1c/0x50
>> [   12.544255]
>> [   12.544544]  el0t_64_sync_handler+0xa8/0xb0
>> [   12.544955] Call trace:
>> [   12.545250]  el0t_64_sync+0x16c/0x170
>> [   12.545540]  refcount_warn_saturate+0x98/0x140
>> [   12.545837] ---[ end trace ba74542f51246288 ]---
>> [   12.546103]  drm_sched_job_done.isra.0+0x154/0x158
>> [   12.546285] ------------[ cut here ]------------
>> [   12.546598]  drm_sched_job_done_cb+0x10/0x18
>> [   12.546813] refcount_t: underflow; use-after-free.
>> [   12.547133]  dma_fence_signal_timestamp_locked+0xcc/0x108
>> [   12.547533] WARNING: CPU: 3 PID: 257 at lib/refcount.c:28 refcount_warn_saturate+0xec/0x140
>> [   12.547920]  dma_fence_signal_locked+0x20/0x30
>> [   12.548336] Modules linked in:
>> [   12.548737]  panfrost_job_handle_done+0x34/0x50
>> [   12.549110]
>> [   12.549525]  panfrost_job_handle_irqs+0x358/0x570
>> [   12.549997] CPU: 3 PID: 257 Comm: weston Tainted: G        W         5.16.0-rc1-00043-g794870164a37 #443
>> [   12.550719]  panfrost_job_irq_handler_thread+0x18/0x40
>> [   12.551108] Hardware name: Rockchip RK3568 EVB1 DDR4 V10 Board (DT)
>> [   12.551373]  irq_thread_fn+0x28/0x98
>> [   12.551769] pstate: 404000c9 (nZcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   12.551899]  irq_thread+0x12c/0x230
>> [   12.552309] pc : refcount_warn_saturate+0xec/0x140
>> [   12.553131]  kthread+0x174/0x180
>> [   12.553578] lr : refcount_warn_saturate+0xec/0x140
>> [   12.554121]  ret_from_fork+0x10/0x20
>> [   12.554432] sp : ffff8000123ebaa0
>> [   12.555038] ---[ end trace ba74542f51246289 ]---
>> [   12.555340] x29: ffff8000123ebaa0 x28: ffff8000123ebd58 x27: 0000000000000000
>> [   12.558083] x26: 0000000000000001 x25: ffff000004b051c0 x24: 0000000000000000
>> [   12.558711] x23: 0000000000000000 x22: ffff0000050e2940 x21: ffff8000123ebb08
>> [   12.559337] x20: ffff000004b05040 x19: ffff000004d85468 x18: 0000000000000010
>> [   12.559965] x17: 0000000000000000 x16: 0000000000000000 x15: ffff0000050e2dc0
>> [   12.560593] x14: 0000000000000000 x13: 30343178302f3839 x12: 78302b6574617275
>> [   12.561222] x11: 7461735f6e726177 x10: 5f746e756f636665 x9 : 3178302f38397830
>> [   12.561849] x8 : 2b65746172757461 x7 : 205d303435353435 x6 : 352e32312020205b
>> [   12.562477] x5 : ffff00007fb8c9a0 x4 : 0000000000000000 x3 : 0000000000000001
>> [   12.563104] x2 : ffff00007fb8c9a8 x1 : ea6e0584a53f2200 x0 : 0000000000000000
>> [   12.563733] Call trace:
>> [   12.563950]  refcount_warn_saturate+0xec/0x140
>> [   12.564344]  drm_sched_entity_wakeup+0x98/0xa0
>> [   12.564736]  dma_fence_signal_timestamp_locked+0xcc/0x108
>> [   12.565216]  dma_fence_release+0xd4/0xe8
>> [   12.565564]  dma_resv_add_excl_fence+0x1b8/0x1f0
>> [   12.565970]  panfrost_job_push+0x1bc/0x200
>> [   12.566333]  panfrost_ioctl_submit+0x358/0x438
>> [   12.566726]  drm_ioctl_kernel+0xb8/0x170
>> [   12.567072]  drm_ioctl+0x214/0x450
>> [   12.567373]  __arm64_sys_ioctl+0xa0/0xe0
>> [   12.567721]  invoke_syscall+0x40/0xf8
>> [   12.568047]  el0_svc_common.constprop.0+0xc0/0xe0
>> [   12.568463]  do_el0_svc+0x20/0x80
>> [   12.568755]  el0_svc+0x1c/0x50
>> [   12.569030]  el0t_64_sync_handler+0xa8/0xb0
>> [   12.569399]  el0t_64_sync+0x16c/0x170
>> [   12.569724] ---[ end trace ba74542f5124628a ]---
>> [   12.595086] ------------[ cut here ]------------
>> [   12.595530] Fence drm_sched:pan_js:a:2 released with pending signals!
>> [   12.596124] WARNING: CPU: 3 PID: 257 at drivers/dma-buf/dma-fence.c:526 dma_fence_release+0xac/0xe8
>> [   12.596934] Modules linked in:
>> [   12.597217] CPU: 3 PID: 257 Comm: weston Tainted: G        W         5.16.0-rc1-00043-g794870164a37 #443
>> [   12.598045] Hardware name: Rockchip RK3568 EVB1 DDR4 V10 Board (DT)
>> [   12.598593] pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   12.599202] pc : dma_fence_release+0xac/0xe8
>> [   12.599584] lr : dma_fence_release+0xac/0xe8
>> [   12.599960] sp : ffff8000123ebb20
>> [   12.600252] x29: ffff8000123ebb20 x28: ffff8000123ebd58 x27: 0000000000000000
>> [   12.600878] x26: 0000000000000001 x25: ffff000004b05280 x24: 0000000000000000
>> [   12.601503] x23: 0000000000000000 x22: ffff800010d41b78 x21: ffff000004b05050
>> [   12.602138] x20: ffff000004b05040 x19: ffff000004b05078 x18: 0000000000000010
>> [   12.602782] x17: 0000000000000000 x16: 0000000000000000 x15: ffff0000050e2dc0
>> [   12.603409] x14: 000000000000025c x13: ffff0000050e2dc0 x12: 00000000ffffffea
>> [   12.604035] x11: ffff800011761ec8 x10: ffff8000115e1e88 x9 : ffff8000115e1ee0
>> [   12.604662] x8 : 000000000017ffe8 x7 : c0000000fffeffff x6 : 0000000000000001
>> [   12.605288] x5 : ffff00007fb8c9a0 x4 : 0000000000000000 x3 : 0000000000000001
>> [   12.605914] x2 : ffff00007fb8c9a8 x1 : ea6e0584a53f2200 x0 : 0000000000000000
>> [   12.606542] Call trace:
>> [   12.606760]  dma_fence_release+0xac/0xe8
>> [   12.607111]  dma_resv_add_excl_fence+0x1b8/0x1f0
>> [   12.607517]  panfrost_job_push+0x1bc/0x200
>> [   12.607882]  panfrost_ioctl_submit+0x358/0x438
>> [   12.608274]  drm_ioctl_kernel+0xb8/0x170
>> [   12.608622]  drm_ioctl+0x214/0x450
>> [   12.608921]  __arm64_sys_ioctl+0xa0/0xe0
>> [   12.609269]  invoke_syscall+0x40/0xf8
>> [   12.609597]  el0_svc_common.constprop.0+0xc0/0xe0
>> [   12.610011]  do_el0_svc+0x20/0x80
>> [   12.610304]  el0_svc+0x1c/0x50
>> [   12.610577]  el0t_64_sync_handler+0xa8/0xb0
>> [   12.610946]  el0t_64_sync+0x16c/0x170
>> [   12.611276] ---[ end trace ba74542f5124628b ]---
>> [   12.612869] ------------[ cut here ]------------
>> [   12.613288] refcount_t: saturated; leaking memory.
>> [   12.613730] WARNING: CPU: 3 PID: 257 at lib/refcount.c:19 refcount_warn_saturate+0xc0/0x140
>> [   12.614476] Modules linked in:
>> [   12.614753] CPU: 3 PID: 257 Comm: weston Tainted: G        W         5.16.0-rc1-00043-g794870164a37 #443
>> [   12.615586] Hardware name: Rockchip RK3568 EVB1 DDR4 V10 Board (DT)
>> [   12.616154] pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   12.616773] pc : refcount_warn_saturate+0xc0/0x140
>> [   12.617200] lr : refcount_warn_saturate+0xc0/0x140
>> [   12.617622] sp : ffff8000123eba60
>> [   12.617913] x29: ffff8000123eba60 x28: ffff8000123ebc00 x27: ffff000004cdbc00
>> [   12.618548] x26: 0000000000000002 x25: ffff000006f4c100 x24: 0000000000000000
>> [   12.619195] x23: ffff000004b051c0 x22: ffff000005b16100 x21: ffff000006487900
>> [   12.619840] x20: 0000000000000001 x19: ffff000004b051f8 x18: 0000000000000010
>> [   12.620486] x17: 00480000000007a0 x16: 0791078f07a00780 x15: ffff0000050e2dc0
>> [   12.621120] x14: 000000000000027f x13: ffff0000050e2dc0 x12: 00000000ffffffea
>> [   12.621746] x11: ffff800011761ec8 x10: ffff8000115e1e88 x9 : ffff8000115e1ee0
>> [   12.622372] x8 : 000000000017ffe8 x7 : c0000000fffeffff x6 : 0000000000000001
>> [   12.623000] x5 : ffff00007fb8c9a0 x4 : 0000000000000000 x3 : 0000000000000001
>> [   12.623626] x2 : ffff00007fb8c9a8 x1 : ea6e0584a53f2200 x0 : 0000000000000000
>> [   12.624256] Call trace:
>> [   12.624474]  refcount_warn_saturate+0xc0/0x140
>> [   12.624867]  drm_gem_plane_helper_prepare_fb+0x118/0x140
>> [   12.625336]  drm_atomic_helper_prepare_planes+0x104/0x1a8
>> [   12.625811]  drm_atomic_helper_commit+0x80/0x360
>> [   12.626218]  drm_atomic_nonblocking_commit+0x48/0x58
>> [   12.626656]  drm_mode_atomic_ioctl+0x9ec/0xb88
>> [   12.627050]  drm_ioctl_kernel+0xb8/0x170
>> [   12.627397]  drm_ioctl+0x214/0x450
>> [   12.627698]  __arm64_sys_ioctl+0xa0/0xe0
>> [   12.628046]  invoke_syscall+0x40/0xf8
>> [   12.628372]  el0_svc_common.constprop.0+0xc0/0xe0
>> [   12.628787]  do_el0_svc+0x20/0x80
>> [   12.629079]  el0_svc+0x1c/0x50
>> [   12.629354]  el0t_64_sync_handler+0xa8/0xb0
>> [   12.629723]  el0t_64_sync+0x16c/0x170
>> [   12.630048] ---[ end trace ba74542f5124628c ]---
>> [   12.683010] inno-video-combo-phy fe850000.video-phy: fin=24000000, rate=996000000, fout=996000000, prediv=1, fbdiv=83
>> [   12.684140] rockchip-drm display-subsystem: [drm] Update mode to 1920x1080p60, type: 11 for vp0, output 0x00000800  HDMI0
>> [   12.685576] rockchip-drm display-subsystem: [drm] Update mode to 1080x1920p60, type: 16 for vp1, output 0x00000020 MIPI0
>> [   12.910994] panel_simple_xfer_dsi_cmd_seq:-----------------> enter
>> [   13.103035] panel_simple_xfer_dsi_cmd_seq:<-----------------leaver
>> [   13.296693] ------------[ cut here ]------------
>> [   13.297140] Fence drm_sched:pan_js:a:3 released with pending signals!
>> [   13.297743] WARNING: CPU: 3 PID: 257 at drivers/dma-buf/dma-fence.c:526 dma_fence_release+0xac/0xe8
>> [   13.298560] Modules linked in:
>> [   13.298840] CPU: 3 PID: 257 Comm: weston Tainted: G        W         5.16.0-rc1-00043-g794870164a37 #443
>> [   13.299670] Hardware name: Rockchip RK3568 EVB1 DDR4 V10 Board (DT)
>> [   13.300219] pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   13.300830] pc : dma_fence_release+0xac/0xe8
>> [   13.301208] lr : dma_fence_release+0xac/0xe8
>> [   13.301585] sp : ffff8000123ebb20
>> [   13.301877] x29: ffff8000123ebb20 x28: ffff8000123ebd58 x27: 0000000000000000
>> [   13.302507] x26: 0000000000000001 x25: ffff000004b051c0 x24: 0000000000000000
>> [   13.303134] x23: 0000000000000000 x22: ffff800010d41b78 x21: ffff000004b05050
>> [   13.303761] x20: ffff000004b05040 x19: ffff000004b05078 x18: 0000000000000010
>> [   13.304388] x17: 0000000000000000 x16: 0000000000000000 x15: ffff0000050e2dc0
>> [   13.305014] x14: 00000000000002a9 x13: ffff0000050e2dc0 x12: 00000000ffffffea
>> [   13.305641] x11: ffff800011761ec8 x10: ffff8000115e1e88 x9 : ffff8000115e1ee0
>> [   13.306268] x8 : 000000000017ffe8 x7 : c0000000fffeffff x6 : 0000000000000001
>> [   13.306894] x5 : ffff00007fb8c9a0 x4 : 0000000000000000 x3 : 0000000000000001
>> [   13.307519] x2 : ffff00007fb8c9a8 x1 : ea6e0584a53f2200 x0 : 0000000000000000
>> [   13.308149] Call trace:
>> [   13.308367]  dma_fence_release+0xac/0xe8
>> [   13.308713]  dma_resv_add_excl_fence+0x1b8/0x1f0
>> [   13.309119]  panfrost_job_push+0x1bc/0x200
>> [   13.309483]  panfrost_ioctl_submit+0x358/0x438
>> [   13.309875]  drm_ioctl_kernel+0xb8/0x170
>> [   13.310221]  drm_ioctl+0x214/0x450
>> [   13.310521]  __arm64_sys_ioctl+0xa0/0xe0
>> [   13.310868]  invoke_syscall+0x40/0xf8
>> [   13.311195]  el0_svc_common.constprop.0+0xc0/0xe0
>> [   13.311609]  do_el0_svc+0x20/0x80
>> [   13.311903]  el0_svc+0x1c/0x50
>> [   13.312177]  el0t_64_sync_handler+0xa8/0xb0
>> [   13.312545]  el0t_64_sync+0x16c/0x170
>> [   13.312869] ---[ end trace ba74542f5124628d ]---
>> [   13.340454] ------------[ cut here ]------------
>> [   13.340897] Fence drm_sched:pan_js:a:4 released with pending signals!
>> [   13.341505] WARNING: CPU: 3 PID: 257 at drivers/dma-buf/dma-fence.c:526 dma_fence_release+0xac/0xe8
>> [   13.342318] Modules linked in:
>> [   13.342598] CPU: 3 PID: 257 Comm: weston Tainted: G        W         5.16.0-rc1-00043-g794870164a37 #443
>> [   13.343426] Hardware name: Rockchip RK3568 EVB1 DDR4 V10 Board (DT)
>> [   13.343975] pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   13.344584] pc : dma_fence_release+0xac/0xe8
>> [   13.344961] lr : dma_fence_release+0xac/0xe8
>> [   13.345338] sp : ffff8000123ebb20
>> [   13.345629] x29: ffff8000123ebb20 x28: ffff8000123ebd58 x27: 0000000000000000
>> [   13.346257] x26: 0000000000000001 x25: ffff000004b05280 x24: 0000000000000000
>> [   13.346884] x23: 0000000000000000 x22: ffff800010d41b78 x21: ffff000004b05050
>> [   13.347511] x20: ffff000004b05040 x19: ffff000004b05078 x18: 0000000000000010
>> [   13.348138] x17: 0000000000000000 x16: 0000000000000000 x15: ffff0000050e2dc0
>> [   13.348764] x14: 00000000000002cc x13: ffff0000050e2dc0 x12: 00000000ffffffea
>> [   13.349391] x11: ffff800011761ec8 x10: ffff8000115e1e88 x9 : ffff8000115e1ee0
>> [   13.350019] x8 : 000000000017ffe8 x7 : c0000000fffeffff x6 : 0000000000000001
>> [   13.350646] x5 : ffff00007fb8c9a0 x4 : 0000000000000000 x3 : 0000000000000001
>> [   13.351272] x2 : ffff00007fb8c9a8 x1 : ea6e0584a53f2200 x0 : 0000000000000000
>> [   13.351900] Call trace:
>> [   13.352116]  dma_fence_release+0xac/0xe8
>> [   13.352463]  dma_resv_add_excl_fence+0x1b8/0x1f0
>> [   13.352869]  panfrost_job_push+0x1bc/0x200
>> [   13.353232]  panfrost_ioctl_submit+0x358/0x438
>> [   13.353624]  drm_ioctl_kernel+0xb8/0x170
>> [   13.353971]  drm_ioctl+0x214/0x450
>> [   13.354269]  __arm64_sys_ioctl+0xa0/0xe0
>> [   13.354616]  invoke_syscall+0x40/0xf8
>> [   13.354942]  el0_svc_common.constprop.0+0xc0/0xe0
>> [   13.355356]  do_el0_svc+0x20/0x80
>> [   13.355650]  el0_svc+0x1c/0x50
>> [   13.355925]  el0t_64_sync_handler+0xa8/0xb0
>> [   13.356293]  el0t_64_sync+0x16c/0x170
>> [   13.356618] ---[ end trace ba74542f5124628e ]---
>> [   13.379841] ------------[ cut here ]------------
>> [   13.380285] Fence drm_sched:pan_js:a:5 released with pending signals!
>> [   13.380877] WARNING: CPU: 3 PID: 257 at drivers/dma-buf/dma-fence.c:526 dma_fence_release+0xac/0xe8
>> [   13.381680] Modules linked in:
>> [   13.381953] CPU: 3 PID: 257 Comm: weston Tainted: G        W         5.16.0-rc1-00043-g794870164a37 #443
>> [   13.382781] Hardware name: Rockchip RK3568 EVB1 DDR4 V10 Board (DT)
>> [   13.383328] pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   13.383937] pc : dma_fence_release+0xac/0xe8
>> [   13.384314] lr : dma_fence_release+0xac/0xe8
>> [   13.384690] sp : ffff8000123ebb20
>> [   13.384980] x29: ffff8000123ebb20 x28: ffff8000123ebd58 x27: 0000000000000000
>> [   13.385608] x26: 0000000000000001 x25: ffff000004b051c0 x24: 0000000000000000
>> [   13.386235] x23: 0000000000000000 x22: ffff800010d41b78 x21: ffff000004b05050
>> [   13.386860] x20: ffff000004b05040 x19: ffff000004b05078 x18: 0000000000000010
>> [   13.387487] x17: 0000000000000000 x16: 0000000000000000 x15: ffff0000050e2dc0
>> [   13.388114] x14: 00000000000002ef x13: ffff0000050e2dc0 x12: 00000000ffffffea
>> [   13.388741] x11: ffff800011761ec8 x10: ffff8000115e1e88 x9 : ffff8000115e1ee0
>> [   13.389368] x8 : 000000000017ffe8 x7 : c0000000fffeffff x6 : 0000000000000001
>> [   13.389994] x5 : ffff00007fb8c9a0 x4 : 0000000000000000 x3 : 0000000000000001
>> [   13.390621] x2 : ffff00007fb8c9a8 x1 : ea6e0584a53f2200 x0 : 0000000000000000
>> [   13.391247] Call trace:
>> [   13.391464]  dma_fence_release+0xac/0xe8
>> [   13.391811]  dma_resv_add_excl_fence+0x1b8/0x1f0
>> [   13.392217]  panfrost_job_push+0x1bc/0x200
>> [   13.392581]  panfrost_ioctl_submit+0x358/0x438
>> [   13.392972]  drm_ioctl_kernel+0xb8/0x170
>> [   13.393319]  drm_ioctl+0x214/0x450
>> [   13.393619]  __arm64_sys_ioctl+0xa0/0xe0
>> [   13.393967]  invoke_syscall+0x40/0xf8
>> [   13.394294]  el0_svc_common.constprop.0+0xc0/0xe0
>> [   13.394708]  do_el0_svc+0x20/0x80
>> [   13.395002]  el0_svc+0x1c/0x50
>> [   13.395275]  el0t_64_sync_handler+0xa8/0xb0
>> [   13.395643]  el0t_64_sync+0x16c/0x170
>> [   13.395968] ---[ end trace ba74542f5124628f ]---
>> [   13.398130] ------------[ cut here ]------------
>> [   13.398566] Fence drm_sched:pan_js:a:6 released with pending signals!
>> [   13.399206] WARNING: CPU: 3 PID: 257 at drivers/dma-buf/dma-fence.c:526 dma_fence_release+0xac/0xe8
>> [   13.400011] Modules linked in:
>> [   13.400286] CPU: 3 PID: 257 Comm: weston Tainted: G        W         5.16.0-rc1-00043-g794870164a37 #443
>> [   13.401114] Hardware name: Rockchip RK3568 EVB1 DDR4 V10 Board (DT)
>> [   13.401660] pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   13.402269] pc : dma_fence_release+0xac/0xe8
>> [   13.402646] lr : dma_fence_release+0xac/0xe8
>> [   13.403024] sp : ffff8000123ebb20
>> [   13.403316] x29: ffff8000123ebb20 x28: ffff8000123ebd58 x27: 0000000000000000
>> [   13.403943] x26: 0000000000000001 x25: ffff000004b05400 x24: 0000000000000000
>> [   13.404570] x23: 0000000000000000 x22: ffff800010d41b78 x21: ffff000004b05350
>> [   13.405197] x20: ffff000004b05340 x19: ffff000004b05378 x18: 0000000000000010
>> [   13.405825] x17: 0000000000000000 x16: 0000000000000000 x15: ffff0000050e2dc0
>> [   13.406451] x14: 0000000000000000 x13: 00000000000000f5 x12: 00000000000001d3
>> [   13.407076] x11: 000000000003f188 x10: 00000000000009a0 x9 : ffff8000123eb8a0
>> [   13.407703] x8 : ffff0000050e3340 x7 : ffff00007fb92a80 x6 : 0000000000000000
>> [   13.408329] x5 : 0000000000000000 x4 : ffff00007fb8c9a0 x3 : ffff00007fb8f950
>> [   13.408955] x2 : ffff00007fb8c9a0 x1 : ea6e0584a53f2200 x0 : 0000000000000000
>> [   13.409583] Call trace:
>> [   13.409800]  dma_fence_release+0xac/0xe8
>> [   13.410146]  dma_resv_add_excl_fence+0x1b8/0x1f0
>> [   13.410553]  panfrost_job_push+0x1bc/0x200
>> [   13.410917]  panfrost_ioctl_submit+0x358/0x438
>> [   13.411309]  drm_ioctl_kernel+0xb8/0x170
>> [   13.411656]  drm_ioctl+0x214/0x450
>> [   13.411956]  __arm64_sys_ioctl+0xa0/0xe0
>> [   13.412303]  invoke_syscall+0x40/0xf8
>> [   13.412628]  el0_svc_common.constprop.0+0xc0/0xe0
>> [   13.413042]  do_el0_svc+0x20/0x80
>> [   13.413335]  el0_svc+0x1c/0x50
>> [   13.413607]  el0t_64_sync_handler+0xa8/0xb0
>> [   13.413976]  el0t_64_sync+0x16c/0x170
>> [   13.414298] ---[ end trace ba74542f51246290 ]---
>> [   13.430129] ------------[ cut here ]------------
>> [   13.430226] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
>> [   13.430557] refcount_t: saturated; leaking memory.
>> [   13.431321] Mem abort info:
>> [   13.431324]   ESR = 0x96000044
>> [   13.431326]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [   13.431330]   SET = 0, FnV = 0
>> [   13.431333]   EA = 0, S1PTW = 0
>> [   13.431335]   FSC = 0x04: level 0 translation fault
>> [   13.431337] Data abort info:
>> [   13.431339]   ISV = 0, ISS = 0x00000044
>> [   13.431340]   CM = 0, WnR = 1
>> [   13.431343] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000004978000
>> [   13.431346] [0000000000000008] pgd=0000000000000000, p4d=0000000000000000
>> [   13.431354] Internal error: Oops: 96000044 [#1] PREEMPT SMP
>> [   13.431359] Modules linked in:
>> [   13.431364] CPU: 0 PID: 145 Comm: irq/25-panfrost Tainted: G        W         5.16.0-rc1-00043-g794870164a37 #443
>> [   13.431370] Hardware name: Rockchip RK3568 EVB1 DDR4 V10 Board (DT)
>> [   13.431374] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   13.431379] pc : dma_fence_signal_timestamp_locked+0x78/0x108
>> [   13.431854] WARNING: CPU: 3 PID: 257 at lib/refcount.c:22 refcount_warn_saturate+0x6c/0x140
>> [   13.432059] lr : dma_fence_signal+0x30/0x60
>> [   13.432327] Modules linked in:
>> [   13.432789] sp : ffff8000122b3b50
>> [   13.433057]
>> [   13.433331] x29: ffff8000122b3b50
>> [   13.433757] CPU: 3 PID: 257 Comm: weston Tainted: G        W         5.16.0-rc1-00043-g794870164a37 #443
>> [   13.434008]  x28: 0000000000000000
>> [   13.434342] Hardware name: Rockchip RK3568 EVB1 DDR4 V10 Board (DT)
>> [   13.434601]  x27: ffff000003791880
>> [   13.435163] pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   13.435751]
>> [   13.435753] x26: ffff8000122b3d30
>> [   13.436237] pc : refcount_warn_saturate+0x6c/0x140
>> [   13.436504]  x25: 0000000000000001
>> [   13.437393] lr : refcount_warn_saturate+0x6c/0x140
>> [   13.437938]  x24: ffff000003791a10
>> [   13.438542] sp : ffff8000123ebb40
>> [   13.439042]
>> [   13.439767] x29: ffff8000123ebb40
>> [   13.440130] x23: 0000000000000000
>> [   13.440398]  x28: ffff8000123ebd58
>> [   13.440687]  x22: ffff000003505280
>> [   13.440819]  x27: 0000000000000000
>> [   13.441108]  x21: ffff8000122b3b88
>> [   13.441931]
>> [   13.442228]
>> [   13.442773] x26: 0000000000000001
>> [   13.443070] x20: ffff000004b051c0
>> [   13.443674]  x25: ffff000004b051c0
>> [   13.443806]  x19: ffff000004b051c0
>> [   13.444095]  x24: 0000000000000000
>> [   13.444513]  x18: 0000000000000000
>> [   13.444811]
>> [   13.445227]
>> [   13.445524] x23: 0000000000000000
>> [   13.445814] x17: 3837783028203032
>> [   13.445945]  x22: ffff000004b051c0
>> [   13.446236]  x16: 3139323835323120
>> [   13.446525]  x21: ffff000004d73100
>> [   13.446822]  x15: 00000205aa24947a
>> [   13.447120]
>> [   13.447417]
>> [   13.447715] x20: ffff000004b05400
>> [   13.447846] x14: 0000000000000326
>> [   13.447977]  x19: 00000000ffffffff
>> [   13.448266]  x13: 0000000000000000
>> [   13.448555]  x18: 0000000000000010
>> [   13.448851]  x12: 0000000000000000
>> [   13.449148]
>> [   13.449446]
>> [   13.449743] x17: 0000000000000000
>> [   13.449874] x11: 0000000000000001
>> [   13.450006]  x16: 0000000000000000
>> [   13.450296]  x10: ffff8000122b3d48
>> [   13.450585]  x15: 000060978994e822
>> [   13.450882]  x9 : 00000000000019e0
>> [   13.451179]
>> [   13.451477]
>> [   13.451774] x14: 00000000000000b6
>> [   13.451905] x8 : ffff8000122b3d78
>> [   13.452037]  x13: 00000000000000b6
>> [   13.452326]  x7 : 0000000000000000
>> [   13.452614]  x12: 0000000000000000
>> [   13.452912]  x6 : 000000001fcf847e
>> [   13.453209]
>> [   13.453506]
>> [   13.453803] x11: 0000000000000001
>> [   13.453934] x5 : 00ffffffffffffff
>> [   13.454066]  x10: 00000000000009a0
>> [   13.454356]  x4 : 0015ef3c03fd7c00
>> [   13.454643]  x9 : ffff8000123eb8c0
>> [   13.454941]  x3 : 0000000000000018
>> [   13.455238]
>> [   13.455536]
>> [   13.455833] x8 : ffff0000050e3340
>> [   13.455965] x2 : ffff000004b051f0
>> [   13.456096]  x7 : ffff00007fb92a80
>> [   13.456386]  x1 : 000000032053be4d
>> [   13.456676]  x6 : 0000000000000115
>> [   13.456973]  x0 : 0000000000000000
>> [   13.457271]
>> [   13.457568]
>> [   13.457866] x5 : 0000000000000000
>> [   13.457998] Call trace:
>> [   13.458128]  x4 : ffff00007fb8c9a0
>> [   13.458419]  dma_fence_signal_timestamp_locked+0x78/0x108
>> [   13.458707]  x3 : ffff00007fb8f950
>> [   13.459005]  dma_fence_signal+0x30/0x60
>> [   13.459302]
>> [   13.459600]  drm_sched_fence_finished+0x10/0x18
>> [   13.459897] x2 : ffff00007fb8c9a0
>> [   13.460029]  drm_sched_job_done.isra.0+0xac/0x158
>> [   13.460159]  x1 : ea6e0584a53f2200
>> [   13.460449]  drm_sched_job_done_cb+0x10/0x18
>> [   13.460738]  x0 : 0000000000000000
>> [   13.461036]  dma_fence_signal_timestamp_locked+0xcc/0x108
>> [   13.461333]
>> [   13.461631]  dma_fence_signal_locked+0x20/0x30
>> [   13.461929] Call trace:
>> [   13.462060]  panfrost_job_handle_done+0x34/0x50
>> [   13.462192]  refcount_warn_saturate+0x6c/0x140
>> [   13.462481]  panfrost_job_handle_irqs+0x358/0x570
>> [   13.462695]  dma_resv_add_excl_fence+0x1d4/0x1f0
>> [   13.462992]  panfrost_job_irq_handler_thread+0x18/0x40
>> [   13.463462]  panfrost_job_push+0x1bc/0x200
>> [   13.463760]  irq_thread_fn+0x28/0x98
>> [   13.464094]  panfrost_ioctl_submit+0x358/0x438
>> [   13.464225]  irq_thread+0x12c/0x230
>> [   13.464620]  drm_ioctl_kernel+0xb8/0x170
>> [   13.464909]  kthread+0x174/0x180
>> [   13.465319]  drm_ioctl+0x214/0x450
>> [   13.465617]  ret_from_fork+0x10/0x20
>> [   13.465988]  __arm64_sys_ioctl+0xa0/0xe0
>> [   13.466290] Code: 3707fe20 f9400a80 9100e3f5 f9001fe0 (f9000415)
>> [   13.466756]  invoke_syscall+0x40/0xf8
>> [   13.466891] ---[ end trace ba74542f51246291 ]---
>> [   13.467275]  el0_svc_common.constprop.0+0xc0/0xe0
>> [   13.467491] note: irq/25-panfrost[145] exited with preempt_count 2
>> [   13.467883]  do_el0_svc+0x20/0x80
>> [   13.468375] genirq: exiting task "irq/25-panfrost" (145) is an active IRQ thread (irq 25)
>> [   13.468678]  el0_svc+0x1c/0x50
>> [   13.475908]  el0t_64_sync_handler+0xa8/0xb0
>> [   13.476277]  el0t_64_sync+0x16c/0x170
>> [   13.476601] ---[ end trace ba74542f51246292 ]---
>> [   13.986987] panfrost fde60000.gpu: gpu sched timeout, js=0, config=0x7300, status=0x0, head=0x8de9f40, tail=0x8de9f40, sched_job=(____ptrval____)
>> [   14.462959] sched: RT throttling activated
>> [   34.474959] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [   34.475481] rcu:     3-....: (5248 ticks this GP) idle=09f/1/0x4000000000000000 softirq=2517/2517 fqs=2602
>> [   34.476312]  (t=5250 jiffies g=505 q=301)
>> [   34.476667] Task dump for CPU 3:
>> [   34.476951] task:pan_js          state:R  running task     stack:    0 pid:  146 ppid:     2 flags:0x0000000a
>> [   34.477820] Call trace:
>> [   34.478035]  dump_backtrace+0x0/0x198
>> [   34.478365]  show_stack+0x14/0x60
>> [   34.478659]  sched_show_task+0x148/0x168
>> [   34.479008]  dump_cpu_task+0x40/0x4c
>> [   34.479326]  rcu_dump_cpu_stacks+0xe8/0x128
>> [   34.479696]  rcu_sched_clock_irq+0x9bc/0xd38
>> [   34.480072]  update_process_times+0x94/0xd8
>> [   34.480440]  tick_sched_handle.isra.0+0x30/0x50
>> [   34.480840]  tick_sched_timer+0x48/0x98
>> [   34.481178]  __hrtimer_run_queues+0x110/0x1b0
>> [   34.481562]  hrtimer_interrupt+0xe4/0x238
>> [   34.481917]  arch_timer_handler_phys+0x28/0x40
>> [   34.482310]  handle_percpu_devid_irq+0x80/0x130
>> [   34.482710]  generic_handle_domain_irq+0x38/0x58
>> [   34.483116]  gic_handle_irq+0x4c/0x110
>> [   34.483450]  call_on_irq_stack+0x28/0x3c
>> [   34.483798]  do_interrupt_handler+0x78/0x80
>> [   34.484166]  el1_interrupt+0x34/0x80
>> [   34.484484]  el1h_64_irq_handler+0x14/0x20
>> [   34.484846]  el1h_64_irq+0x74/0x78
>> [   34.485148]  queued_spin_lock_slowpath+0x118/0x3c0
>> [   34.485568]  _raw_spin_lock+0x5c/0x68
>> [   34.485895]  panfrost_job_run+0x24c/0x3f8
>> [   34.486250]  drm_sched_main+0x130/0x390
>> [   34.486591]  kthread+0x174/0x180
>> [   34.486878]  ret_from_fork+0x10/0x20
>> [   35.810989] vcc3v3_lcd1_n: disabling
>> [   97.486958] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [   97.487479] rcu:     3-....: (20999 ticks this GP) idle=09f/1/0x4000000000000000 softirq=2517/2517 fqs=10402
>> [   97.488326]  (t=21003 jiffies g=505 q=379)
>> [   97.488687] Task dump for CPU 3:
>> [   97.488971] task:pan_js          state:R  running task     stack:    0 pid:  146 ppid:     2 flags:0x0000000a
>> [   97.489842] Call trace:
>> [   97.490056]  dump_backtrace+0x0/0x198
>> [   97.490388]  show_stack+0x14/0x60
>> [   97.490682]  sched_show_task+0x148/0x168
>> [   97.491030]  dump_cpu_task+0x40/0x4c
>> [   97.491349]  rcu_dump_cpu_stacks+0xe8/0x128
>> [   97.491718]  rcu_sched_clock_irq+0x9bc/0xd38
>> [   97.492095]  update_process_times+0x94/0xd8
>> [   97.492463]  tick_sched_handle.isra.0+0x30/0x50
>> [   97.492862]  tick_sched_timer+0x48/0x98
>> [   97.493200]  __hrtimer_run_queues+0x110/0x1b0
>> [   97.493582]  hrtimer_interrupt+0xe4/0x238
>> [   97.493937]  arch_timer_handler_phys+0x28/0x40
>> [   97.494330]  handle_percpu_devid_irq+0x80/0x130
>> [   97.494730]  generic_handle_domain_irq+0x38/0x58
>> [   97.495136]  gic_handle_irq+0x4c/0x110
>> [   97.495473]  call_on_irq_stack+0x28/0x3c
>> [   97.495818]  do_interrupt_handler+0x78/0x80
>> [   97.496186]  el1_interrupt+0x34/0x80
>> [   97.496503]  el1h_64_irq_handler+0x14/0x20
>> [   97.496865]  el1h_64_irq+0x74/0x78
>> [   97.497166]  queued_spin_lock_slowpath+0x118/0x3c0
>> [   97.497588]  _raw_spin_lock+0x5c/0x68
>> [   97.497912]  panfrost_job_run+0x24c/0x3f8
>> [   97.498268]  drm_sched_main+0x130/0x390
>> [   97.498607]  kthread+0x174/0x180
>> [   97.498895]  ret_from_fork+0x10/0x20
>> [  140.108141] random: crng init done
>> [  140.108457] random: 7 urandom warning(s) missed due to ratelimiting
>> [  160.498958] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [  160.499475] rcu:     3-....: (36750 ticks this GP) idle=09f/1/0x4000000000000000 softirq=2517/2517 fqs=18205
>> [  160.500322]  (t=36756 jiffies g=505 q=482)
>> [  160.500684] Task dump for CPU 3:
>> [  160.500969] task:pan_js          state:R  running task     stack:    0 pid:  146 ppid:     2 flags:0x0000000a
>> [  160.501837] Call trace:
>> [  160.502054]  dump_backtrace+0x0/0x198
>> [  160.502384]  show_stack+0x14/0x60
>> [  160.502679]  sched_show_task+0x148/0x168
>> [  160.503027]  dump_cpu_task+0x40/0x4c
>> [  160.503346]  rcu_dump_cpu_stacks+0xe8/0x128
>> [  160.503714]  rcu_sched_clock_irq+0x9bc/0xd38
>> [  160.504091]  update_process_times+0x94/0xd8
>> [  160.504458]  tick_sched_handle.isra.0+0x30/0x50
>> [  160.504858]  tick_sched_timer+0x48/0x98
>> [  160.505195]  __hrtimer_run_queues+0x110/0x1b0
>> [  160.505580]  hrtimer_interrupt+0xe4/0x238
>> [  160.505934]  arch_timer_handler_phys+0x28/0x40
>> [  160.506327]  handle_percpu_devid_irq+0x80/0x130
>> [  160.506727]  generic_handle_domain_irq+0x38/0x58
>> [  160.507133]  gic_handle_irq+0x4c/0x110
>> [  160.507467]  call_on_irq_stack+0x28/0x3c
>> [  160.507813]  do_interrupt_handler+0x78/0x80
>> [  160.508181]  el1_interrupt+0x34/0x80
>> [  160.508497]  el1h_64_irq_handler+0x14/0x20
>> [  160.508858]  el1h_64_irq+0x74/0x78
>> [  160.509158]  queued_spin_lock_slowpath+0x118/0x3c0
>> [  160.509579]  _raw_spin_lock+0x5c/0x68
>> [  160.509903]  panfrost_job_run+0x24c/0x3f8
>> [  160.510259]  drm_sched_main+0x130/0x390
>> [  160.510599]  kthread+0x174/0x180
>> [  160.510886]  ret_from_fork+0x10/0x20
>> [  223.510959] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [  223.511478] rcu:     3-....: (52501 ticks this GP) idle=09f/1/0x4000000000000000 softirq=2517/2517 fqs=26008
>> [  223.512325]  (t=52509 jiffies g=505 q=536)
>> [  223.512688] Task dump for CPU 3:
>> [  223.512971] task:pan_js          state:R  running task     stack:    0 pid:  146 ppid:     2 flags:0x0000000a
>> [  223.513842] Call trace:
>> [  223.514056]  dump_backtrace+0x0/0x198
>> [  223.514387]  show_stack+0x14/0x60
>> [  223.514681]  sched_show_task+0x148/0x168
>> [  223.515029]  dump_cpu_task+0x40/0x4c
>> [  223.515348]  rcu_dump_cpu_stacks+0xe8/0x128
>> [  223.515717]  rcu_sched_clock_irq+0x9bc/0xd38
>> [  223.516094]  update_process_times+0x94/0xd8
>> [  223.516462]  tick_sched_handle.isra.0+0x30/0x50
>> [  223.516860]  tick_sched_timer+0x48/0x98
>> [  223.517198]  __hrtimer_run_queues+0x110/0x1b0
>> [  223.517582]  hrtimer_interrupt+0xe4/0x238
>> [  223.517935]  arch_timer_handler_phys+0x28/0x40
>> [  223.518327]  handle_percpu_devid_irq+0x80/0x130
>> [  223.518727]  generic_handle_domain_irq+0x38/0x58
>> [  223.519133]  gic_handle_irq+0x4c/0x110
>> [  223.519466]  call_on_irq_stack+0x28/0x3c
>> [  223.519812]  do_interrupt_handler+0x78/0x80
>> [  223.520181]  el1_interrupt+0x34/0x80
>> [  223.520498]  el1h_64_irq_handler+0x14/0x20
>> [  223.520860]  el1h_64_irq+0x74/0x78
>> [  223.521161]  queued_spin_lock_slowpath+0x118/0x3c0
>> [  223.521584]  _raw_spin_lock+0x5c/0x68
>> [  223.521908]  panfrost_job_run+0x24c/0x3f8
>> [  223.522264]  drm_sched_main+0x130/0x390
>> [  223.522605]  kthread+0x174/0x180
>> [  223.522892]  ret_from_fork+0x10/0x20
>> [  286.522958] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [  286.523478] rcu:     3-....: (68252 ticks this GP) idle=09f/1/0x4000000000000000 softirq=2517/2517 fqs=33807
>> [  286.524325]  (t=68262 jiffies g=505 q=612)
>> [  286.524687] Task dump for CPU 3:
>> [  286.524972] task:pan_js          state:R  running task     stack:    0 pid:  146 ppid:     2 flags:0x0000000a
>> [  286.525840] Call trace:
>> [  286.526057]  dump_backtrace+0x0/0x198
>> [  286.526387]  show_stack+0x14/0x60
>> [  286.526681]  sched_show_task+0x148/0x168
>> [  286.527029]  dump_cpu_task+0x40/0x4c
>> [  286.527347]  rcu_dump_cpu_stacks+0xe8/0x128
>> [  286.527715]  rcu_sched_clock_irq+0x9bc/0xd38
>> [  286.528092]  update_process_times+0x94/0xd8
>> [  286.528459]  tick_sched_handle.isra.0+0x30/0x50
>> [  286.528859]  tick_sched_timer+0x48/0x98
>> [  286.529197]  __hrtimer_run_queues+0x110/0x1b0
>> [  286.529579]  hrtimer_interrupt+0xe4/0x238
>> [  286.529933]  arch_timer_handler_phys+0x28/0x40
>> [  286.530326]  handle_percpu_devid_irq+0x80/0x130
>> [  286.530726]  generic_handle_domain_irq+0x38/0x58
>> [  286.531132]  gic_handle_irq+0x4c/0x110
>> [  286.531466]  call_on_irq_stack+0x28/0x3c
>> [  286.531812]  do_interrupt_handler+0x78/0x80
>> [  286.532180]  el1_interrupt+0x34/0x80
>> [  286.532496]  el1h_64_irq_handler+0x14/0x20
>> [  286.532857]  el1h_64_irq+0x74/0x78
>> [  286.533157]  queued_spin_lock_slowpath+0x118/0x3c0
>> [  286.533580]  _raw_spin_lock+0x5c/0x68
>> [  286.533904]  panfrost_job_run+0x24c/0x3f8
>> [  286.534259]  drm_sched_main+0x130/0x390
>> [  286.534600]  kthread+0x174/0x180
>> [  286.534887]  ret_from_fork+0x10/0x20
>> [  349.534957] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [  349.535478] rcu:     3-....: (84003 ticks this GP) idle=09f/1/0x4000000000000000 softirq=2517/2517 fqs=41602
>> [  349.536324]  (t=84015 jiffies g=505 q=716)
>> [  349.536687] Task dump for CPU 3:
>> [  349.536970] task:pan_js          state:R  running task     stack:    0 pid:  146 ppid:     2 flags:0x0000000a
>> [  349.537839] Call trace:
>> [  349.538055]  dump_backtrace+0x0/0x198
>> [  349.538387]  show_stack+0x14/0x60
>> [  349.538681]  sched_show_task+0x148/0x168
>> [  349.539029]  dump_cpu_task+0x40/0x4c
>> [  349.539348]  rcu_dump_cpu_stacks+0xe8/0x128
>> [  349.539717]  rcu_sched_clock_irq+0x9bc/0xd38
>> [  349.540094]  update_process_times+0x94/0xd8
>> [  349.540462]  tick_sched_handle.isra.0+0x30/0x50
>> [  349.540862]  tick_sched_timer+0x48/0x98
>> [  349.541201]  __hrtimer_run_queues+0x110/0x1b0
>> [  349.541585]  hrtimer_interrupt+0xe4/0x238
>> [  349.541937]  arch_timer_handler_phys+0x28/0x40
>> [  349.542330]  handle_percpu_devid_irq+0x80/0x130
>> [  349.542730]  generic_handle_domain_irq+0x38/0x58
>> [  349.543136]  gic_handle_irq+0x4c/0x110
>> [  349.543469]  call_on_irq_stack+0x28/0x3c
>> [  349.543815]  do_interrupt_handler+0x78/0x80
>> [  349.544183]  el1_interrupt+0x34/0x80
>> [  349.544500]  el1h_64_irq_handler+0x14/0x20
>> [  349.544862]  el1h_64_irq+0x74/0x78
>> [  349.545164]  queued_spin_lock_slowpath+0x118/0x3c0
>> [  349.545586]  _raw_spin_lock+0x5c/0x68
>> [  349.545910]  panfrost_job_run+0x24c/0x3f8
>> [  349.546265]  drm_sched_main+0x130/0x390
>> [  349.546604]  kthread+0x174/0x180
>> [  349.546891]  ret_from_fork+0x10/0x20
>> [  412.546958] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [  412.547478] rcu:     3-....: (99754 ticks this GP) idle=09f/1/0x4000000000000000 softirq=2517/2517 fqs=49377
>> [  412.548325]  (t=99768 jiffies g=505 q=784)
>> [  412.548686] Task dump for CPU 3:
>> [  412.548971] task:pan_js          state:R  running task     stack:    0 pid:  146 ppid:     2 flags:0x0000000a
>> [  412.549841] Call trace:
>> [  412.550058]  dump_backtrace+0x0/0x198
>> [  412.550389]  show_stack+0x14/0x60
>> [  412.550684]  sched_show_task+0x148/0x168
>> [  412.551031]  dump_cpu_task+0x40/0x4c
>> [  412.551350]  rcu_dump_cpu_stacks+0xe8/0x128
>> [  412.551719]  rcu_sched_clock_irq+0x9bc/0xd38
>> [  412.552095]  update_process_times+0x94/0xd8
>> [  412.552463]  tick_sched_handle.isra.0+0x30/0x50
>> [  412.552863]  tick_sched_timer+0x48/0x98
>> [  412.553201]  __hrtimer_run_queues+0x110/0x1b0
>> [  412.553583]  hrtimer_interrupt+0xe4/0x238
>> [  412.553936]  arch_timer_handler_phys+0x28/0x40
>> [  412.554331]  handle_percpu_devid_irq+0x80/0x130
>> [  412.554732]  generic_handle_domain_irq+0x38/0x58
>> [  412.555139]  gic_handle_irq+0x4c/0x110
>> [  412.555471]  call_on_irq_stack+0x28/0x3c
>> [  412.555817]  do_interrupt_handler+0x78/0x80
>> [  412.556186]  el1_interrupt+0x34/0x80
>> [  412.556502]  el1h_64_irq_handler+0x14/0x20
>> [  412.556864]  el1h_64_irq+0x74/0x78
>> [  412.557164]  queued_spin_lock_slowpath+0x118/0x3c0
>> [  412.557587]  _raw_spin_lock+0x5c/0x68
>> [  412.557912]  panfrost_job_run+0x24c/0x3f8
>> [  412.558267]  drm_sched_main+0x130/0x390
>> [  412.558607]  kthread+0x174/0x180
>> [  412.558894]  ret_from_fork+0x10/0x20
>> [  475.558957] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [  475.559476] rcu:     3-....: (115505 ticks this GP) idle=09f/1/0x4000000000000000 softirq=2517/2517 fqs=57191
>> [  475.560329]  (t=115521 jiffies g=505 q=857)
>> [  475.560697] Task dump for CPU 3:
>> [  475.560981] task:pan_js          state:R  running task     stack:    0 pid:  146 ppid:     2 flags:0x0000000a
>> [  475.561850] Call trace:
>> [  475.562067]  dump_backtrace+0x0/0x198
>> [  475.562398]  show_stack+0x14/0x60
>> [  475.562693]  sched_show_task+0x148/0x168
>> [  475.563041]  dump_cpu_task+0x40/0x4c
>> [  475.563360]  rcu_dump_cpu_stacks+0xe8/0x128
>> [  475.563728]  rcu_sched_clock_irq+0x9bc/0xd38
>> [  475.564104]  update_process_times+0x94/0xd8
>> [  475.564472]  tick_sched_handle.isra.0+0x30/0x50
>> [  475.564871]  tick_sched_timer+0x48/0x98
>> [  475.565209]  __hrtimer_run_queues+0x110/0x1b0
>> [  475.565592]  hrtimer_interrupt+0xe4/0x238
>> [  475.565946]  arch_timer_handler_phys+0x28/0x40
>> [  475.566339]  handle_percpu_devid_irq+0x80/0x130
>> [  475.566739]  generic_handle_domain_irq+0x38/0x58
>> [  475.567145]  gic_handle_irq+0x4c/0x110
>> [  475.567477]  call_on_irq_stack+0x28/0x3c
>> [  475.567822]  do_interrupt_handler+0x78/0x80
>> [  475.568190]  el1_interrupt+0x34/0x80
>> [  475.568507]  el1h_64_irq_handler+0x14/0x20
>> [  475.568869]  el1h_64_irq+0x74/0x78
>> [  475.569170]  queued_spin_lock_slowpath+0x118/0x3c0
>> [  475.569593]  _raw_spin_lock+0x5c/0x68
>> [  475.569915]  panfrost_job_run+0x24c/0x3f8
>> [  475.570270]  drm_sched_main+0x130/0x390
>> [  475.570610]  kthread+0x174/0x180
>> [  475.570897]  ret_from_fork+0x10/0x20
>> [  538.570958] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [  538.571478] rcu:     3-....: (131256 ticks this GP) idle=09f/1/0x4000000000000000 softirq=2517/2517 fqs=64992
>> [  538.572333]  (t=131274 jiffies g=505 q=947)
>> [  538.572701] Task dump for CPU 3:
>> [  538.572986] task:pan_js          state:R  running task     stack:    0 pid:  146 ppid:     2 flags:0x0000000a
>> [  538.573854] Call trace:
>> [  538.574070]  dump_backtrace+0x0/0x198
>> [  538.574402]  show_stack+0x14/0x60
>> [  538.574696]  sched_show_task+0x148/0x168
>> [  538.575044]  dump_cpu_task+0x40/0x4c
>> [  538.575363]  rcu_dump_cpu_stacks+0xe8/0x128
>> [  538.575732]  rcu_sched_clock_irq+0x9bc/0xd38
>> [  538.576109]  update_process_times+0x94/0xd8
>> [  538.576477]  tick_sched_handle.isra.0+0x30/0x50
>> [  538.576878]  tick_sched_timer+0x48/0x98
>> [  538.577216]  __hrtimer_run_queues+0x110/0x1b0
>> [  538.577599]  hrtimer_interrupt+0xe4/0x238
>> [  538.577953]  arch_timer_handler_phys+0x28/0x40
>> [  538.578346]  handle_percpu_devid_irq+0x80/0x130
>> [  538.578745]  generic_handle_domain_irq+0x38/0x58
>> [  538.579151]  gic_handle_irq+0x4c/0x110
>> [  538.579487]  call_on_irq_stack+0x28/0x3c
>> [  538.579833]  do_interrupt_handler+0x78/0x80
>> [  538.580201]  el1_interrupt+0x34/0x80
>> [  538.580518]  el1h_64_irq_handler+0x14/0x20
>> [  538.580880]  el1h_64_irq+0x74/0x78
>> [  538.581181]  queued_spin_lock_slowpath+0x118/0x3c0
>> [  538.581603]  _raw_spin_lock+0x5c/0x68
>> [  538.581927]  panfrost_job_run+0x24c/0x3f8
>> [  538.582283]  drm_sched_main+0x130/0x390
>> [  538.582623]  kthread+0x174/0x180
>> [  538.582910]  ret_from_fork+0x10/0x20
>> [  601.582956] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [  601.583477] rcu:     3-....: (147007 ticks this GP) idle=09f/1/0x4000000000000000 softirq=2517/2517 fqs=72788
>> [  601.584330]  (t=147027 jiffies g=505 q=1018)
>> [  601.584706] Task dump for CPU 3:
>> [  601.584991] task:pan_js          state:R  running task     stack:    0 pid:  146 ppid:     2 flags:0x0000000a
>> [  601.585859] Call trace:
>> [  601.586075]  dump_backtrace+0x0/0x198
>> [  601.586406]  show_stack+0x14/0x60
>> [  601.586701]  sched_show_task+0x148/0x168
>> [  601.587048]  dump_cpu_task+0x40/0x4c
>> [  601.587368]  rcu_dump_cpu_stacks+0xe8/0x128
>> [  601.587736]  rcu_sched_clock_irq+0x9bc/0xd38
>> [  601.588112]  update_process_times+0x94/0xd8
>> [  601.588480]  tick_sched_handle.isra.0+0x30/0x50
>> [  601.588880]  tick_sched_timer+0x48/0x98
>> [  601.589218]  __hrtimer_run_queues+0x110/0x1b0
>> [  601.589602]  hrtimer_interrupt+0xe4/0x238
>> [  601.589956]  arch_timer_handler_phys+0x28/0x40
>> [  601.590348]  handle_percpu_devid_irq+0x80/0x130
>> [  601.590747]  generic_handle_domain_irq+0x38/0x58
>> [  601.591153]  gic_handle_irq+0x4c/0x110
>> [  601.591486]  call_on_irq_stack+0x28/0x3c
>> [  601.591832]  do_interrupt_handler+0x78/0x80
>> [  601.592201]  el1_interrupt+0x34/0x80
>> [  601.592517]  el1h_64_irq_handler+0x14/0x20
>> [  601.592879]  el1h_64_irq+0x74/0x78
>> [  601.593181]  queued_spin_lock_slowpath+0x118/0x3c0
>> [  601.593603]  _raw_spin_lock+0x5c/0x68
>> [  601.593927]  panfrost_job_run+0x24c/0x3f8
>> [  601.594283]  drm_sched_main+0x130/0x390
>> [  601.594623]  kthread+0x174/0x180
>> [  601.594910]  ret_from_fork+0x10/0x20
>> [  664.594957] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [  664.595479] rcu:     3-....: (162758 ticks this GP) idle=09f/1/0x4000000000000000 softirq=2517/2517 fqs=80598
>> [  664.596333]  (t=162780 jiffies g=505 q=1086)
>> [  664.596709] Task dump for CPU 3:
>> [  664.596993] task:pan_js          state:R  running task     stack:    0 pid:  146 ppid:     2 flags:0x0000000a
>> [  664.597862] Call trace:
>> [  664.598078]  dump_backtrace+0x0/0x198
>> [  664.598409]  show_stack+0x14/0x60
>> [  664.598704]  sched_show_task+0x148/0x168
>> [  664.599052]  dump_cpu_task+0x40/0x4c
>> [  664.599369]  rcu_dump_cpu_stacks+0xe8/0x128
>> [  664.599738]  rcu_sched_clock_irq+0x9bc/0xd38
>> [  664.600114]  update_process_times+0x94/0xd8
>> [  664.600482]  tick_sched_handle.isra.0+0x30/0x50
>> [  664.600882]  tick_sched_timer+0x48/0x98
>> [  664.601220]  __hrtimer_run_queues+0x110/0x1b0
>> [  664.601604]  hrtimer_interrupt+0xe4/0x238
>> [  664.601958]  arch_timer_handler_phys+0x28/0x40
>> [  664.602352]  handle_percpu_devid_irq+0x80/0x130
>> [  664.602751]  generic_handle_domain_irq+0x38/0x58
>> [  664.603158]  gic_handle_irq+0x4c/0x110
>> [  664.603491]  call_on_irq_stack+0x28/0x3c
>> [  664.603838]  do_interrupt_handler+0x78/0x80
>> [  664.604206]  el1_interrupt+0x34/0x80
>> [  664.604522]  el1h_64_irq_handler+0x14/0x20
>> [  664.604883]  el1h_64_irq+0x74/0x78
>> [  664.605187]  queued_spin_lock_slowpath+0x118/0x3c0
>> [  664.605609]  _raw_spin_lock+0x5c/0x68
>> [  664.605934]  panfrost_job_run+0x24c/0x3f8
>> [  664.606290]  drm_sched_main+0x130/0x390
>> [  664.606631]  kthread+0x174/0x180
>> [  664.606918]  ret_from_fork+0x10/0x20
>> [  727.606956] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [  727.607476] rcu:     3-....: (178509 ticks this GP) idle=09f/1/0x4000000000000000 softirq=2517/2517 fqs=88380
>> [  727.608331]  (t=178533 jiffies g=505 q=1152)
>> [  727.608706] Task dump for CPU 3:
>> [  727.608990] task:pan_js          state:R  running task     stack:    0 pid:  146 ppid:     2 flags:0x0000000a
>> [  727.609858] Call trace:
>> [  727.610074]  dump_backtrace+0x0/0x198
>> [  727.610403]  show_stack+0x14/0x60
>> [  727.610698]  sched_show_task+0x148/0x168
>> [  727.611047]  dump_cpu_task+0x40/0x4c
>> [  727.611366]  rcu_dump_cpu_stacks+0xe8/0x128
>> [  727.611735]  rcu_sched_clock_irq+0x9bc/0xd38
>> [  727.612112]  update_process_times+0x94/0xd8
>> [  727.612479]  tick_sched_handle.isra.0+0x30/0x50
>> [  727.612879]  tick_sched_timer+0x48/0x98
>> [  727.613216]  __hrtimer_run_queues+0x110/0x1b0
>> [  727.613601]  hrtimer_interrupt+0xe4/0x238
>> [  727.613955]  arch_timer_handler_phys+0x28/0x40
>> [  727.614348]  handle_percpu_devid_irq+0x80/0x130
>> [  727.614748]  generic_handle_domain_irq+0x38/0x58
>> [  727.615154]  gic_handle_irq+0x4c/0x110
>> [  727.615485]  call_on_irq_stack+0x28/0x3c
>> [  727.615832]  do_interrupt_handler+0x78/0x80
>> [  727.616200]  el1_interrupt+0x34/0x80
>> [  727.616517]  el1h_64_irq_handler+0x14/0x20
>> [  727.616879]  el1h_64_irq+0x74/0x78
>> [  727.617180]  queued_spin_lock_slowpath+0x118/0x3c0
>> [  727.617602]  _raw_spin_lock+0x5c/0x68
>> [  727.617926]  panfrost_job_run+0x24c/0x3f8
>> [  727.618282]  drm_sched_main+0x130/0x390
>> [  727.618621]  kthread+0x174/0x180
>> [  727.618908]  ret_from_fork+0x10/0x20
>> [  790.618957] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [  790.619475] rcu:     3-....: (194260 ticks this GP) idle=09f/1/0x4000000000000000 softirq=2517/2517 fqs=96141
>> [  790.620331]  (t=194286 jiffies g=505 q=1219)
>> [  790.620708] Task dump for CPU 3:
>> [  790.620991] task:pan_js          state:R  running task     stack:    0 pid:  146 ppid:     2 flags:0x0000000a
>> [  790.621860] Call trace:
>> [  790.622075]  dump_backtrace+0x0/0x198
>> [  790.622405]  show_stack+0x14/0x60
>> [  790.622699]  sched_show_task+0x148/0x168
>> [  790.623049]  dump_cpu_task+0x40/0x4c
>> [  790.623367]  rcu_dump_cpu_stacks+0xe8/0x128
>> [  790.623737]  rcu_sched_clock_irq+0x9bc/0xd38
>> [  790.624113]  update_process_times+0x94/0xd8
>> [  790.624481]  tick_sched_handle.isra.0+0x30/0x50
>> [  790.624880]  tick_sched_timer+0x48/0x98
>> [  790.625218]  __hrtimer_run_queues+0x110/0x1b0
>> [  790.625603]  hrtimer_interrupt+0xe4/0x238
>> [  790.625957]  arch_timer_handler_phys+0x28/0x40
>> [  790.626350]  handle_percpu_devid_irq+0x80/0x130
>> [  790.626752]  generic_handle_domain_irq+0x38/0x58
>> [  790.627158]  gic_handle_irq+0x4c/0x110
>> [  790.627493]  call_on_irq_stack+0x28/0x3c
>> [  790.627839]  do_interrupt_handler+0x78/0x80
>> [  790.628208]  el1_interrupt+0x34/0x80
>> [  790.628526]  el1h_64_irq_handler+0x14/0x20
>> [  790.628888]  el1h_64_irq+0x74/0x78
>> [  790.629188]  queued_spin_lock_slowpath+0x118/0x3c0
>> [  790.629613]  _raw_spin_lock+0x5c/0x68
>> [  790.629937]  panfrost_job_run+0x24c/0x3f8
>> [  790.630292]  drm_sched_main+0x130/0x390
>> [  790.630632]  kthread+0x174/0x180
>> [  790.630919]  ret_from_fork+0x10/0x20
>> [  853.630955] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [  853.631478] rcu:     3-....: (210011 ticks this GP) idle=09f/1/0x4000000000000000 softirq=2517/2517 fqs=103932
>> [  853.632340]  (t=210039 jiffies g=505 q=1318)
>> [  853.632716] Task dump for CPU 3:
>> [  853.633000] task:pan_js          state:R  running task     stack:    0 pid:  146 ppid:     2 flags:0x0000000a
>> [  853.633869] Call trace:
>> [  853.634084]  dump_backtrace+0x0/0x198
>> [  853.634418]  show_stack+0x14/0x60
>> [  853.634712]  sched_show_task+0x148/0x168
>> [  853.635061]  dump_cpu_task+0x40/0x4c
>> [  853.635379]  rcu_dump_cpu_stacks+0xe8/0x128
>> [  853.635748]  rcu_sched_clock_irq+0x9bc/0xd38
>> [  853.636124]  update_process_times+0x94/0xd8
>> [  853.636492]  tick_sched_handle.isra.0+0x30/0x50
>> [  853.636892]  tick_sched_timer+0x48/0x98
>> [  853.637230]  __hrtimer_run_queues+0x110/0x1b0
>> [  853.637613]  hrtimer_interrupt+0xe4/0x238
>> [  853.637965]  arch_timer_handler_phys+0x28/0x40
>> [  853.638358]  handle_percpu_devid_irq+0x80/0x130
>> [  853.638760]  generic_handle_domain_irq+0x38/0x58
>> [  853.639166]  gic_handle_irq+0x4c/0x110
>> [  853.639499]  call_on_irq_stack+0x28/0x3c
>> [  853.639845]  do_interrupt_handler+0x78/0x80
>> [  853.640213]  el1_interrupt+0x34/0x80
>> [  853.640530]  el1h_64_irq_handler+0x14/0x20
>> [  853.640892]  el1h_64_irq+0x74/0x78
>> [  853.641193]  queued_spin_lock_slowpath+0x118/0x3c0
>> [  853.641616]  _raw_spin_lock+0x5c/0x68
>> [  853.641940]  panfrost_job_run+0x24c/0x3f8
>> [  853.642295]  drm_sched_main+0x130/0x390
>> [  853.642634]  kthread+0x174/0x180
>> [  853.642921]  ret_from_fork+0x10/0x20
>> [  916.642956] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [  916.643477] rcu:     3-....: (225762 ticks this GP) idle=09f/1/0x4000000000000000 softirq=2517/2517 fqs=111709
>> [  916.644339]  (t=225792 jiffies g=505 q=1390)
>> [  916.644715] Task dump for CPU 3:
>> [  916.644999] task:pan_js          state:R  running task     stack:    0 pid:  146 ppid:     2 flags:0x0000000a
>> [  916.645868] Call trace:
>> [  916.646083]  dump_backtrace+0x0/0x198
>> [  916.646414]  show_stack+0x14/0x60
>> [  916.646708]  sched_show_task+0x148/0x168
>> [  916.647055]  dump_cpu_task+0x40/0x4c
>> [  916.647373]  rcu_dump_cpu_stacks+0xe8/0x128
>> [  916.647743]  rcu_sched_clock_irq+0x9bc/0xd38
>> [  916.648119]  update_process_times+0x94/0xd8
>> [  916.648488]  tick_sched_handle.isra.0+0x30/0x50
>> [  916.648887]  tick_sched_timer+0x48/0x98
>> [  916.649225]  __hrtimer_run_queues+0x110/0x1b0
>> [  916.649608]  hrtimer_interrupt+0xe4/0x238
>> [  916.649962]  arch_timer_handler_phys+0x28/0x40
>> [  916.650355]  handle_percpu_devid_irq+0x80/0x130
>> [  916.650756]  generic_handle_domain_irq+0x38/0x58
>> [  916.651162]  gic_handle_irq+0x4c/0x110
>> [  916.651495]  call_on_irq_stack+0x28/0x3c
>> [  916.651842]  do_interrupt_handler+0x78/0x80
>> [  916.652210]  el1_interrupt+0x34/0x80
>> [  916.652527]  el1h_64_irq_handler+0x14/0x20
>> [  916.652889]  el1h_64_irq+0x74/0x78
>> [  916.653190]  queued_spin_lock_slowpath+0x118/0x3c0
>> [  916.653614]  _raw_spin_lock+0x5c/0x68
>> [  916.653937]  panfrost_job_run+0x24c/0x3f8
>> [  916.654293]  drm_sched_main+0x130/0x390
>> [  916.654632]  kthread+0x174/0x180
>> [  916.654920]  ret_from_fork+0x10/0x20
>>
>> -- 
>> Pengutronix e.K.                           |                             |
>> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

