Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEA8592A61
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 09:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF88AFDFC;
	Mon, 15 Aug 2022 07:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCDDAB6A0;
 Mon, 15 Aug 2022 07:34:26 +0000 (UTC)
X-UUID: 959acbab234941399b0f551cce68c329-20220815
X-CPASD-INFO: 1356cf6c575f474587e1bfe31a0696fb@eoNvVpCYZJNhV3eyg3p_b1holWGSkoW
 Cc5tQZmdmkoKVgnxsTV5qXFWCgGpQYWNdYlV3fGtQYmBgZFB5i4Jyj1RgXmCCVHSTgHNtVWaRlg==
X-CLOUD-ID: 1356cf6c575f474587e1bfe31a0696fb
X-CPASD-SUMMARY: SIP:-1, APTIP:-2.0, KEY:0.0, FROMBLOCK:1, OB:0.0, URL:-5,
 TVAL:168.
 0, ESV:0.0, ECOM:-5.0, ML:0.0, FD:0.0, CUTS:270.0, IP:-2.0, MAL:-5.0, PHF:-5.0,
 PHC:-5
 .0, SPF:4.0, EDMS:-5, IPLABEL:4480.0, FROMTO:0, AD:0, FFOB:0.0, CFOB:0.0, SPC:0,
 SIG:-
 5, AUF:3, DUF:2354, ACD:50, DCD:50, SL:0, EISP:0, AG:0, CFC:0.741, CFSR:0.041,
 UAT:0, RA
 F:2, IMG:-5.0, DFA:0, DTA:0, IBL:-2.0, ADI:-5, SBL:0, REDM:0, REIP:0, ESB:0,
 ATTNUM:0, E AF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: 959acbab234941399b0f551cce68c329-20220815
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: 959acbab234941399b0f551cce68c329-20220815
X-User: lizhenneng@kylinos.cn
Received: from [172.20.124.41] [(116.128.244.169)] by mailgw
 (envelope-from <lizhenneng@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
 with ESMTP id 1747963816; Mon, 15 Aug 2022 15:34:25 +0800
Message-ID: <db2a43da-256d-402e-882b-c05436d4e83b@kylinos.cn>
Date: Mon, 15 Aug 2022 15:34:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] drm/radeon: add a force flush to delay work when radeon
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20220811072540.964309-1-lizhenneng@kylinos.cn>
 <b23e4037-2030-32d0-d626-b5a846fcafeb@gmail.com>
From: =?UTF-8?B?5p2O55yf6IO9?= <lizhenneng@kylinos.cn>
In-Reply-To: <b23e4037-2030-32d0-d626-b5a846fcafeb@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Pan Xinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


在 2022/8/12 18:55, Christian König 写道:
> Am 11.08.22 um 09:25 schrieb Zhenneng Li:
>> Although radeon card fence and wait for gpu to finish processing 
>> current batch rings,
>> there is still a corner case that radeon lockup work queue may not be 
>> fully flushed,
>> and meanwhile the radeon_suspend_kms() function has called 
>> pci_set_power_state() to
>> put device in D3hot state.
>
> If I'm not completely mistaken the reset worker uses the 
> suspend/resume functionality as well to get the hardware into a 
> working state again.
>
> So if I'm not completely mistaken this here would lead to a deadlock, 
> please double check that.

We have tested many times, there are no deadlock.

In which situation, there would lead to a deadlock?

>
> Regards,
> Christian.
>
>> Per PCI spec rev 4.0 on 5.3.1.4.1 D3hot State.
>>> Configuration and Message requests are the only TLPs accepted by a 
>>> Function in
>>> the D3hot state. All other received Requests must be handled as 
>>> Unsupported Requests,
>>> and all received Completions may optionally be handled as Unexpected 
>>> Completions.
>> This issue will happen in following logs:
>> Unable to handle kernel paging request at virtual address 
>> 00008800e0008010
>> CPU 0 kworker/0:3(131): Oops 0
>> pc = [<ffffffff811bea5c>]  ra = [<ffffffff81240844>]  ps = 0000 
>> Tainted: G        W
>> pc is at si_gpu_check_soft_reset+0x3c/0x240
>> ra is at si_dma_is_lockup+0x34/0xd0
>> v0 = 0000000000000000  t0 = fff08800e0008010  t1 = 0000000000010000
>> t2 = 0000000000008010  t3 = fff00007e3c00000  t4 = fff00007e3c00258
>> t5 = 000000000000ffff  t6 = 0000000000000001  t7 = fff00007ef078000
>> s0 = fff00007e3c016e8  s1 = fff00007e3c00000  s2 = fff00007e3c00018
>> s3 = fff00007e3c00000  s4 = fff00007fff59d80  s5 = 0000000000000000
>> s6 = fff00007ef07bd98
>> a0 = fff00007e3c00000  a1 = fff00007e3c016e8  a2 = 0000000000000008
>> a3 = 0000000000000001  a4 = 8f5c28f5c28f5c29  a5 = ffffffff810f4338
>> t8 = 0000000000000275  t9 = ffffffff809b66f8  t10 = ff6769c5d964b800
>> t11= 000000000000b886  pv = ffffffff811bea20  at = 0000000000000000
>> gp = ffffffff81d89690  sp = 00000000aa814126
>> Disabling lock debugging due to kernel taint
>> Trace:
>> [<ffffffff81240844>] si_dma_is_lockup+0x34/0xd0
>> [<ffffffff81119610>] radeon_fence_check_lockup+0xd0/0x290
>> [<ffffffff80977010>] process_one_work+0x280/0x550
>> [<ffffffff80977350>] worker_thread+0x70/0x7c0
>> [<ffffffff80977410>] worker_thread+0x130/0x7c0
>> [<ffffffff80982040>] kthread+0x200/0x210
>> [<ffffffff809772e0>] worker_thread+0x0/0x7c0
>> [<ffffffff80981f8c>] kthread+0x14c/0x210
>> [<ffffffff80911658>] ret_from_kernel_thread+0x18/0x20
>> [<ffffffff80981e40>] kthread+0x0/0x210
>>   Code: ad3e0008  43f0074a  ad7e0018  ad9e0020  8c3001e8 40230101
>>   <88210000> 4821ed21
>> So force lockup work queue flush to fix this problem.
>>
>> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
>> ---
>>   drivers/gpu/drm/radeon/radeon_device.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_device.c 
>> b/drivers/gpu/drm/radeon/radeon_device.c
>> index 15692cb241fc..e608ca26780a 100644
>> --- a/drivers/gpu/drm/radeon/radeon_device.c
>> +++ b/drivers/gpu/drm/radeon/radeon_device.c
>> @@ -1604,6 +1604,9 @@ int radeon_suspend_kms(struct drm_device *dev, 
>> bool suspend,
>>           if (r) {
>>               /* delay GPU reset to resume */
>>               radeon_fence_driver_force_completion(rdev, i);
>> +        } else {
>> +            /* finish executing delayed work */
>> + flush_delayed_work(&rdev->fence_drv[i].lockup_work);
>>           }
>>       }
>
