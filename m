Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EB8782BC6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 16:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD2910E278;
	Mon, 21 Aug 2023 14:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from domac.alu.hr (domac.alu.unizg.hr [161.53.235.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F7E10E278
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 14:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by domac.alu.hr (Postfix) with ESMTP id 6A9BC60171;
 Mon, 21 Aug 2023 16:28:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
 t=1692628120; bh=0nRTqe/pCPlhMFJPMwlnr1DydCqbb1rQ2tL2k/ZoNno=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=W0eyZ9Z8XgJPDJ34ilzkrZ8wy1dw/4BqI/uiQ3s9ZJYqSLvHlJUI0hnd0oKg4HjEE
 NFtdXYycuP63phOoJn8vtS3Bz9qdRisSKr+QK9ENx4ZoITpU5p5mIxmXc8BvR/J1KD
 S+XKxMwnSQCa2Od5n3xGQeuUTSGSfpNypkia8/Dv5ai3qaQ9EFU6FXcSbA9Pqe0Z25
 +HYAyIfekSsxCoae6EZ2qsDK4QsGv03o4YC/uvZYBwKul078cmWxFpOcb6wCF6Ihkl
 x7F/URwP4saeI+3aO+RcSZFrkpQI83k0Ep3Uh/+3FUIa/LTy2LxwJw7q6Hj0fWTPd9
 p6kederUW6Xmw==
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
 by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MEIT_o-HFzvE; Mon, 21 Aug 2023 16:28:37 +0200 (CEST)
Received: from [192.168.1.6] (unknown [94.250.191.183])
 by domac.alu.hr (Postfix) with ESMTPSA id 950576016E;
 Mon, 21 Aug 2023 16:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
 t=1692628117; bh=0nRTqe/pCPlhMFJPMwlnr1DydCqbb1rQ2tL2k/ZoNno=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uWjPLX7SYA1adfd1RQDLSzJ7qnwURl8BTasCSyBIEAZQaeF3IJ2QcEN16VVxJeRtS
 fwjHK/2SVwiCmFwaM4MRkxrJzPJt7rAwowglgZxb9k9DTCZnvtkURTaxxdvIa66/Q9
 JMQBK37Z50AFZhh3a8tRpQdiOefvWUlQfXNUENjXysLElI7k3aduZBTOnwaasi1Gv2
 Awx1RPd0/0FJTsFUtBXUaQRKVEbsRJN/IAbjotPOe52WVLgZZMxq9U1tpEpLgmk973
 h4VZn+k8FX5KDTx6R5Ju4sncjAongFWC+tRLRkMwJfzsCkLdoVb/8rkUCPwTeGxWiH
 eLViR7ZToypdQ==
Message-ID: <5d83d59a-3c49-aae7-61ca-de9c2f3ba9c9@alu.unizg.hr>
Date: Mon, 21 Aug 2023 16:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [BUG] KCSAN: data-race in drm_sched_entity_is_ready [gpu_sched] /
 drm_sched_entity_push_job [gpu_sched]
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org
References: <43668e49-c2c0-9979-9de3-b4904c2a8f82@alu.unizg.hr>
 <36b4e667-c287-1614-fe1f-5e772850d1fb@alu.unizg.hr>
 <b74a5cc3-8174-67f3-17ab-2e8a7d8fa1a6@amd.com>
From: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
In-Reply-To: <b74a5cc3-8174-67f3-17ab-2e8a7d8fa1a6@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Luben Tuikov <luben.tuikov@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

Thank you for the update.

Should I continue reporting what KCSAN gives? I will try to filter these to save your time for
evaluation ...

Kind regards,
Mirsad

On 8/21/23 15:20, Christian König wrote:
> Hi Mirsad,
> 
> well this is a false positive.
> 
> That drm_sched_entity_is_ready() doesn't see the data written by drm_sched_entity_push_job() is part of the logic here.
> 
> Regards,
> Christian.
> 
> Am 18.08.23 um 15:44 schrieb Mirsad Todorovac:
>> On 8/17/23 21:54, Mirsad Todorovac wrote:
>>> Hi,
>>>
>>> This is your friendly bug reporter.
>>>
>>> The environment is vanilla torvalds tree kernel on Ubuntu 22.04 LTS and a Ryzen 7950X box.
>>>
>>> Please find attached the complete dmesg output from the ring buffer and lshw output.
>>>
>>> NOTE: The kernel reports tainted kernel, but to my knowledge there are no proprietary (G) modules,
>>>        but this taint is turned on by the previous bugs.
>>>
>>> dmesg excerpt:
>>>
>>> [ 8791.864576] ==================================================================
>>> [ 8791.864648] BUG: KCSAN: data-race in drm_sched_entity_is_ready [gpu_sched] / drm_sched_entity_push_job [gpu_sched]
>>>
>>> [ 8791.864776] write (marked) to 0xffff9b74491b7c40 of 8 bytes by task 3807 on cpu 18:
>>> [ 8791.864788]  drm_sched_entity_push_job+0xf4/0x2a0 [gpu_sched]
>>> [ 8791.864852]  amdgpu_cs_ioctl+0x3888/0x3de0 [amdgpu]
>>> [ 8791.868731]  drm_ioctl_kernel+0x127/0x210 [drm]
>>> [ 8791.869222]  drm_ioctl+0x38f/0x6f0 [drm]
>>> [ 8791.869711]  amdgpu_drm_ioctl+0x7e/0xe0 [amdgpu]
>>> [ 8791.873660]  __x64_sys_ioctl+0xd2/0x120
>>> [ 8791.873676]  do_syscall_64+0x58/0x90
>>> [ 8791.873688]  entry_SYSCALL_64_after_hwframe+0x73/0xdd
>>>
>>> [ 8791.873710] read to 0xffff9b74491b7c40 of 8 bytes by task 1119 on cpu 27:
>>> [ 8791.873722]  drm_sched_entity_is_ready+0x16/0x50 [gpu_sched]
>>> [ 8791.873786]  drm_sched_select_entity+0x1c7/0x220 [gpu_sched]
>>> [ 8791.873849]  drm_sched_main+0xd2/0x500 [gpu_sched]
>>> [ 8791.873912]  kthread+0x18b/0x1d0
>>> [ 8791.873924]  ret_from_fork+0x43/0x70
>>> [ 8791.873939]  ret_from_fork_asm+0x1b/0x30
>>>
>>> [ 8791.873955] value changed: 0x0000000000000000 -> 0xffff9b750ebcfc00
>>>
>>> [ 8791.873971] Reported by Kernel Concurrency Sanitizer on:
>>> [ 8791.873980] CPU: 27 PID: 1119 Comm: gfx_0.0.0 Tainted: G             L     6.5.0-rc6-net-cfg-kcsan-00038-g16931859a650 #35
>>> [ 8791.873994] Hardware name: ASRock X670E PG Lightning/X670E PG Lightning, BIOS 1.21 04/26/2023
>>> [ 8791.874002] ==================================================================
>>
>> P.S.
>>
>> According to Mr. Heo's instructions, I am adding the unwound trace here:
>>
>> [ 1879.706518] ==================================================================
>> [ 1879.706616] BUG: KCSAN: data-race in drm_sched_entity_is_ready [gpu_sched] / drm_sched_entity_push_job [gpu_sched]
>>
>> [ 1879.706737] write (marked) to 0xffff8f3672748c40 of 8 bytes by task 4087 on cpu 10:
>> [ 1879.706748] drm_sched_entity_push_job (./include/drm/spsc_queue.h:74 drivers/gpu/drm/scheduler/sched_entity.c:574) gpu_sched
>> [ 1879.706808] amdgpu_cs_ioctl (drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1375 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1469) amdgpu
>> [ 1879.710589] drm_ioctl_kernel (drivers/gpu/drm/drm_ioctl.c:788) drm
>> [ 1879.711068] drm_ioctl (drivers/gpu/drm/drm_ioctl.c:892) drm
>> [ 1879.711551] amdgpu_drm_ioctl (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2748) amdgpu
>> [ 1879.715319] __x64_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:870 fs/ioctl.c:856 fs/ioctl.c:856)
>> [ 1879.715334] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80)
>> [ 1879.715345] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120)
>>
>> [ 1879.715365] read to 0xffff8f3672748c40 of 8 bytes by task 1098 on cpu 11:
>> [ 1879.715376] drm_sched_entity_is_ready (drivers/gpu/drm/scheduler/sched_entity.c:134) gpu_sched
>> [ 1879.715435] drm_sched_select_entity (drivers/gpu/drm/scheduler/sched_main.c:248 drivers/gpu/drm/scheduler/sched_main.c:893) gpu_sched
>> [ 1879.715495] drm_sched_main (drivers/gpu/drm/scheduler/sched_main.c:1019) gpu_sched
>> [ 1879.715554] kthread (kernel/kthread.c:389)
>> [ 1879.715563] ret_from_fork (arch/x86/kernel/process.c:145)
>> [ 1879.715575] ret_from_fork_asm (arch/x86/entry/entry_64.S:312)
>>
>> [ 1879.715590] value changed: 0x0000000000000000 -> 0xffff8f360663dc00
>>
>> [ 1879.715604] Reported by Kernel Concurrency Sanitizer on:
>> [ 1879.715612] CPU: 11 PID: 1098 Comm: gfx_0.0.0 Tainted: G             L     6.5.0-rc6+ #47
>> [ 1879.715624] Hardware name: ASRock X670E PG Lightning/X670E PG Lightning, BIOS 1.21 04/26/2023
>> [ 1879.715631] ==================================================================
>>
>> It seems that the line in question might be:
>>
>>     first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>>
>> which expands to:
>>
>> static inline bool spsc_queue_push(struct spsc_queue *queue, struct spsc_node *node)
>> {
>>     struct spsc_node **tail;
>>
>>     node->next = NULL;
>>
>>     preempt_disable();
>>
>>     tail = (struct spsc_node **)atomic_long_xchg(&queue->tail, (long)&node->next);
>>     WRITE_ONCE(*tail, node);
>>     atomic_inc(&queue->job_count);
>>
>>     /*
>>      * In case of first element verify new node will be visible to the consumer
>>      * thread when we ping the kernel thread that there is new work to do.
>>      */
>>     smp_wmb();
>>
>>     preempt_enable();
>>
>>     return tail == &queue->head;
>> }
>>
>> According to the manual, preempt_disable() only guaranteed exclusion on a single CPU/core/thread, so
>> we might be plagued with the slow, old fashioned locking unless anyone had a better idea.
>>
>> Best regards,
>> Mirsad Todorovac
