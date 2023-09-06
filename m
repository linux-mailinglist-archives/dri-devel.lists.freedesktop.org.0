Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A783C793A6E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 12:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21E710E5FB;
	Wed,  6 Sep 2023 10:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC02410E5FA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 10:55:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B96AC106F;
 Wed,  6 Sep 2023 03:56:14 -0700 (PDT)
Received: from [10.57.93.3] (unknown [10.57.93.3])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2702A3F7C5;
 Wed,  6 Sep 2023 03:55:33 -0700 (PDT)
Message-ID: <b8e13cd6-7be7-1375-c625-a64ff81a49e3@arm.com>
Date: Wed, 6 Sep 2023 11:55:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v16 20/20] drm/panfrost: Switch to generic memory shrinker
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
 <20230903170736.513347-21-dmitry.osipenko@collabora.com>
 <b07f5338-192d-7f11-8c07-bcbfd9617cd4@arm.com>
 <20230905100801.6d523065@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230905100801.6d523065@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, kernel@collabora.com,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/09/2023 09:08, Boris Brezillon wrote:
> On Mon, 4 Sep 2023 14:20:24 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 03/09/2023 18:07, Dmitry Osipenko wrote:
>>> Replace Panfrost's custom memory shrinker with a common drm-shmem
>>> memory shrinker.
>>>
>>> Tested-by: Steven Price <steven.price@arm.com> # Firefly-RK3288  
>>
>> I just gave this version of the series a spin and I can trigger the following 
>> warning:
>>
>> [  477.776163] ------------[ cut here ]------------
>> [  477.781353] WARNING: CPU: 0 PID: 292 at drivers/gpu/drm/drm_gem_shmem_helper.c:227 drm_gem_shmem_free+0x1fc/0x200 [drm_shmem_helper]
>> [  477.794790] panfrost ffa30000.gpu: drm_WARN_ON(refcount_read(&shmem->pages_use_count))
>> [  477.794797] Modules linked in: panfrost gpu_sched drm_shmem_helper
>> [  477.810942] CPU: 0 PID: 292 Comm: glmark2-es2-drm Not tainted 6.5.0-rc2-00527-gc8a0c16fa830 #1
>> [  477.820564] Hardware name: Rockchip (Device Tree)
>> [  477.825820]  unwind_backtrace from show_stack+0x10/0x14
>> [  477.831670]  show_stack from dump_stack_lvl+0x58/0x70
>> [  477.837319]  dump_stack_lvl from __warn+0x7c/0x1a4
>> [  477.842680]  __warn from warn_slowpath_fmt+0x134/0x1a0
>> [  477.848429]  warn_slowpath_fmt from drm_gem_shmem_free+0x1fc/0x200 [drm_shmem_helper]
>> [  477.857199]  drm_gem_shmem_free [drm_shmem_helper] from drm_gem_handle_delete+0x84/0xb0
>> [  477.866163]  drm_gem_handle_delete from drm_ioctl+0x214/0x4ec
>> [  477.872592]  drm_ioctl from sys_ioctl+0x568/0xd48
>> [  477.877857]  sys_ioctl from ret_fast_syscall+0x0/0x1c
>> [  477.883504] Exception stack(0xf0a49fa8 to 0xf0a49ff0)
>> [  477.889148] 9fa0:                   005969c0 bef34880 00000006 40086409 bef34880 00000001
>> [  477.898289] 9fc0: 005969c0 bef34880 40086409 00000036 bef34880 00590b64 00590aec 00000000
>> [  477.907428] 9fe0: b6ec408c bef3485c b6ead42f b6c31f98
>> [  477.913188] irq event stamp: 37296889
>> [  477.917319] hardirqs last  enabled at (37296951): [<c03c1968>] __up_console_sem+0x50/0x60
>> [  477.926531] hardirqs last disabled at (37296972): [<c03c1954>] __up_console_sem+0x3c/0x60
>> [  477.935714] softirqs last  enabled at (37296986): [<c03016cc>] __do_softirq+0x318/0x4d4
>> [  477.944708] softirqs last disabled at (37296981): [<c034f9ec>] __irq_exit_rcu+0x140/0x160
>> [  477.953878] ---[ end trace 0000000000000000 ]---
>>
>> So something, somewhere has gone wrong with the reference counts.
> 
> Missing `got_pages_sgt = true;` in the fault handler, when creating the
> sgt and populating the first 2MB chunk, I guess (should have been part
> of "drm/shmem-helper: Use flag for tracking page count bumped by
> get_pages_sgt()"). This kinda proves my point though: adding flags
> for things that can be inferred from other fields is a bad idea, because
> there's always the risk of not updating all the places that are manually
> filling these other fields...

Yes that seems to fix the problem. And I agree derived fields like this
are often problematic - it's better to avoid them whenever possible.

Steve

