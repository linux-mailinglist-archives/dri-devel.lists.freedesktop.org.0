Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C1469E827
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 20:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C2E10E7B9;
	Tue, 21 Feb 2023 19:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr
 [80.12.242.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4A710E7B9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 19:17:38 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id UY8spK3kX0GfyUY8tpaEcn; Tue, 21 Feb 2023 20:17:36 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 21 Feb 2023 20:17:36 +0100
X-ME-IP: 86.243.2.178
Message-ID: <c16136b3-d6d6-392e-7d58-cd81bcf426f6@wanadoo.fr>
Date: Tue, 21 Feb 2023 20:17:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/amdkfd: Fix an illegal memory access
To: qu.huang@linux.dev
References: <eb49be7c44ae95c4d18e66b59874ef1c@linux.dev>
 <48e5eae7-4848-3aa2-2cb4-5c7ba32a9848@amd.com>
Content-Language: fr
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <48e5eae7-4848-3aa2-2cb4-5c7ba32a9848@amd.com>
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
Cc: Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 21/02/2023 à 17:26, Felix Kuehling a écrit :
> 
> On 2023-02-21 06:35, qu.huang-fxUVXftIFDnyG1zEObXtfA@public.gmane.org 
> wrote:
>> From: Qu Huang <qu.huang-fxUVXftIFDnyG1zEObXtfA@public.gmane.org>
>>
>> In the kfd_wait_on_events() function, the kfd_event_waiter structure is
>> allocated by alloc_event_waiters(), but the event field of the waiter
>> structure is not initialized; When copy_from_user() fails in the
>> kfd_wait_on_events() function, it will enter exception handling to
>> release the previously allocated memory of the waiter structure;
>> Due to the event field of the waiters structure being accessed
>> in the free_waiters() function, this results in illegal memory access
>> and system crash, here is the crash log:
>>
>> localhost kernel: RIP: 0010:native_queued_spin_lock_slowpath+0x185/0x1e0
>> localhost kernel: RSP: 0018:ffffaa53c362bd60 EFLAGS: 00010082
>> localhost kernel: RAX: ff3d3d6bff4007cb RBX: 0000000000000282 RCX: 
>> 00000000002c0000
>> localhost kernel: RDX: ffff9e855eeacb80 RSI: 000000000000279c RDI: 
>> ffffe7088f6a21d0
>> localhost kernel: RBP: ffffe7088f6a21d0 R08: 00000000002c0000 R09: 
>> ffffaa53c362be64
>> localhost kernel: R10: ffffaa53c362bbd8 R11: 0000000000000001 R12: 
>> 0000000000000002
>> localhost kernel: R13: ffff9e7ead15d600 R14: 0000000000000000 R15: 
>> ffff9e7ead15d698
>> localhost kernel: FS:  0000152a3d111700(0000) 
>> GS:ffff9e855ee80000(0000) knlGS:0000000000000000
>> localhost kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> localhost kernel: CR2: 0000152938000010 CR3: 000000044d7a4000 CR4: 
>> 00000000003506e0
>> localhost kernel: Call Trace:
>> localhost kernel: _raw_spin_lock_irqsave+0x30/0x40
>> localhost kernel: remove_wait_queue+0x12/0x50
>> localhost kernel: kfd_wait_on_events+0x1b6/0x490 [hydcu]
>> localhost kernel: ? ftrace_graph_caller+0xa0/0xa0
>> localhost kernel: kfd_ioctl+0x38c/0x4a0 [hydcu]
>> localhost kernel: ? kfd_ioctl_set_trap_handler+0x70/0x70 [hydcu]
>> localhost kernel: ? kfd_ioctl_create_queue+0x5a0/0x5a0 [hydcu]
>> localhost kernel: ? ftrace_graph_caller+0xa0/0xa0
>> localhost kernel: __x64_sys_ioctl+0x8e/0xd0
>> localhost kernel: ? syscall_trace_enter.isra.18+0x143/0x1b0
>> localhost kernel: do_syscall_64+0x33/0x80
>> localhost kernel: entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> localhost kernel: RIP: 0033:0x152a4dff68d7
>>
>> Signed-off-by: Qu Huang 
>> <qu.huang-fxUVXftIFDnyG1zEObXtfA@public.gmane.org>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_events.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
>> index 729d26d..e5faaad 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
>> @@ -787,6 +787,7 @@ static struct kfd_event_waiter 
>> *alloc_event_waiters(uint32_t num_events)
>>       for (i = 0; (event_waiters) && (i < num_events) ; i++) {
>>           init_wait(&event_waiters[i].wait);
>>           event_waiters[i].activated = false;
>> +        event_waiters[i].event = NULL;
> 
> Thank you for catching this. We're often lazy about initializing things 
> to NULL or 0 because most of our data structures are allocated with 
> kzalloc or similar. I'm not sure why we're not doing this here. If we 
> allocated event_waiters with kcalloc, we could also remove the 
> initialization of activated. I think that would be the cleaner and safer 
> solution.

Hi,

I think that the '(event_waiters) &&' in the 'for' can also be removed.
'event_waiters' is already NULL tested a few lines above


Just my 2c.

CJ

> 
> Regards,
>    Felix
> 
> 
>>       }
>>
>>       return event_waiters;
>> -- 
>> 1.8.3.1
> 

