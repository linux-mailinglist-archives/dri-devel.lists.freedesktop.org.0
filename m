Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1479A46F0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 21:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8729B10E974;
	Fri, 18 Oct 2024 19:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="FjXaxS7l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD4810E974
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 19:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1729279374; x=1729884174; i=friedrich.vock@gmx.de;
 bh=p/y+z5jxfsQ/fBMcyMHk+5zEn2fHpgV0nNSE+Zp3Qwo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=FjXaxS7lUIwSjlZ7utLKv0cF/4WKnwMRW9dYzcMCw+bGgtdxn6sK6b7KmDFLlo6c
 H61xE7/ysFHcLEkTXhDN/gBT5Gx20DmtujhR76l8Y0xizoNWsVYdSbs2yIKUkCscQ
 9KR4BwtbLSlU0oya6WTgMbEOny6ZtWdid5USm0NJemigzbE92aMTgWHxTdM0hLoWr
 LCR4uKIPJ85vAEGgMqA3XOZyYj9RW+JMRsEmDypoJiUuu+6+wTeLhOVIpGZl4UqS/
 Bv8boejTM/UJbqAmtY6JuAs9A6iBc9dQME2sObjcgYb5v8ZDHntKrzOe7S8Gh8syh
 wELTGE9P9cG2Y/75wg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvK0X-1tssjw2foH-00rJjr; Fri, 18
 Oct 2024 21:17:45 +0200
Message-ID: <d1887b83-001d-4901-aa76-056bb82c9dde@gmx.de>
Date: Fri, 18 Oct 2024 21:17:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Eliminate all duplicate fences in
 dma_fence_unwrap_merge
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20241018054608.6478-1-friedrich.vock@gmx.de>
 <b2832f2b-16fd-4c1f-864e-ecc32f7e8009@amd.com>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <b2832f2b-16fd-4c1f-864e-ecc32f7e8009@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:a5So3Ub0o4w5DdwvZMpmJ053u2SGKxIBbNkLHwOQfIBGvMAJQw7
 u1foLhrvR9xO8X27EKf2lWBB0LghcAdS8HGJcGwR5AlRH1Hpi3WARYC2v01ZKxlCa1zxl5x
 Jgxl/kTB4IskbhfoT1Qgd0l+2RILQzlJBu5WoAgTgbBmk4DQ+uxxTMe/4Gx5GI0r0ZHg4LG
 yXsJK0Kdc/DWrdyXPuqZA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Kn51NujxdHI=;G+s96xOoJirriDuwD6W+s5aGdNa
 /8hyb0OWXGm4/IpoGfkIz7Eo6XM61BnD4vTFxIMFY9NR6A4bAXBH/K/vBGXpWVVY5S6JbtTJw
 Mx7h2Fv2EL+QPx1rprnsFcKqT6iUtdVTXpCK4Y2xSlztaAPkUwLjfdBPmS097ji6rEksQgtb3
 23548ZleA5F1GZLTugMhI8fvCSyygQCtIrNhTOxWMrmElXjw2kEeapNkxTrnEUd33NcVbAd/y
 XDspxNl2rz2sGazuyd5CgVzluIh4FW75dy2CVaTxDs78R9gE+9rKaoFLSbY6NKI56tcWO++3A
 cCCT7q2SesBVpTIFFiOX/N1qzEFHtMpRf0GQjTo+17QdTC+pQDbhpjK2U6EEvrKnoHRV2zIwc
 RU9ZxfjcpgVBPQe+qAQ/Aw8Lb4AJre1GBskjqFPGJVObbrXv9o4zCtYvsZuDqeE+ALuTV4oDn
 eEPhAZtXrbMQYiKvFQ+ctI/FlUwN/dfNoPlla4vlrB2Y9N59y6IwUtebvU/bxjg7MaahaqyO8
 IrnKgBL+liq+EJ3zZ8aK5T47P1gOim1+GY/QUaTzBZQSjs+WopXmHWk69YFwPpu6y/VfsB4DE
 GbER1QIK6o1oUjQ4JVT0PbqmxI9XK02iWkT5UxdD1JbA4hDJXCovaFkf0eoJCC1te9Rl2P652
 bY1smfNWGTSoFzd28fhmPUFj6xLz0fR56OJDgHuzgoIl0ZJ1t6eMN1YwH2d8guaOUrsF8zNbl
 a3HOe1R/iqnWtwOX8P+MAdSQ3LYzr2hdUgJCG5uhmv8rY3cWCAi9291DL36nbflhIXKKqS/l5
 t5VcK+P3yS+YQG4RroJGHzdn3tzg3Vp7i0zRBd2u7PO7s=
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

Hi,

On 18.10.24 10:56, Christian K=C3=B6nig wrote:
> Am 18.10.24 um 07:46 schrieb Friedrich Vock:
>> When dma_fence_unwrap_merge is called on fence chains where the fences
>> aren't ordered by context, the merging logic breaks down and we end up
>> inserting fences twice. Doing this repeatedly leads to the number of
>> fences going up exponentially, and in some gaming workloads we'll end u=
p
>> running out of memory to store the resulting array altogether, leading
>> to a warning such as:
>
> Ah! I was searching for that one for quite a while now.
>
> I own you a beer should you ever be near Cologne.

I visit the area somewhat regularly, I'll let you know the next time
around ;-)

>
> Please also see my patch on the mailing list to use kvzalloc() to
> mitigate this.
>
>>
>> vkd3d_queue: page allocation failure: order:7,
>> mode:0x40dc0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO),
>> nodemask=3D(null),cpuset=3D/,mems_allowed=3D0
>> CPU: 2 PID: 5287 Comm: vkd3d_queue Tainted: G S
>> 6.10.7-200.fsync.fc40.x86_64 #1
>> Hardware name: Dell Inc. G5 5505/0NCW8W, BIOS 1.11.0 03/22/2022
>> Call Trace:
>> =C2=A0 <TASK>
>> =C2=A0 dump_stack_lvl+0x5d/0x80
>> =C2=A0 warn_alloc+0x164/0x190
>> =C2=A0 ? srso_return_thunk+0x5/0x5f
>> =C2=A0 ? __alloc_pages_direct_compact+0x1d9/0x220
>> =C2=A0 __alloc_pages_slowpath.constprop.2+0xd14/0xd80
>> =C2=A0 __alloc_pages_noprof+0x32b/0x350
>> =C2=A0 ? dma_fence_array_create+0x48/0x110
>> =C2=A0 __kmalloc_large_node+0x6f/0x130
>> =C2=A0 __kmalloc_noprof+0x2dd/0x4a0
>> =C2=A0 ? dma_fence_array_create+0x48/0x110
>> =C2=A0 dma_fence_array_create+0x48/0x110
>> =C2=A0 __dma_fence_unwrap_merge+0x481/0x5b0
>> =C2=A0 sync_file_merge.constprop.0+0xf8/0x180
>> =C2=A0 sync_file_ioctl+0x476/0x590
>> =C2=A0 ? srso_return_thunk+0x5/0x5f
>> =C2=A0 ? __seccomp_filter+0xe8/0x5a0
>> =C2=A0 __x64_sys_ioctl+0x97/0xd0
>> =C2=A0 do_syscall_64+0x82/0x160
>> =C2=A0 ? srso_return_thunk+0x5/0x5f
>> =C2=A0 ? drm_syncobj_destroy_ioctl+0x8b/0xb0
>> =C2=A0 ? srso_return_thunk+0x5/0x5f
>> =C2=A0 ? srso_return_thunk+0x5/0x5f
>> =C2=A0 ? __check_object_size+0x58/0x230
>> =C2=A0 ? srso_return_thunk+0x5/0x5f
>> =C2=A0 ? srso_return_thunk+0x5/0x5f
>> =C2=A0 ? drm_ioctl+0x2ba/0x530
>> =C2=A0 ? __pfx_drm_syncobj_destroy_ioctl+0x10/0x10
>> =C2=A0 ? srso_return_thunk+0x5/0x5f
>> =C2=A0 ? ktime_get_mono_fast_ns+0x3b/0xd0
>> =C2=A0 ? srso_return_thunk+0x5/0x5f
>> =C2=A0 ? amdgpu_drm_ioctl+0x71/0x90 [amdgpu]
>> =C2=A0 ? srso_return_thunk+0x5/0x5f
>> =C2=A0 ? syscall_exit_to_user_mode+0x72/0x200
>> =C2=A0 ? srso_return_thunk+0x5/0x5f
>> =C2=A0 ? do_syscall_64+0x8e/0x160
>> =C2=A0 ? syscall_exit_to_user_mode+0x72/0x200
>> =C2=A0 ? srso_return_thunk+0x5/0x5f
>> =C2=A0 ? do_syscall_64+0x8e/0x160
>> =C2=A0 ? srso_return_thunk+0x5/0x5f
>> =C2=A0 ? syscall_exit_to_user_mode+0x72/0x200
>> =C2=A0 ? srso_return_thunk+0x5/0x5f
>> =C2=A0 ? do_syscall_64+0x8e/0x160
>> =C2=A0 ? do_syscall_64+0x8e/0x160
>> =C2=A0 ? srso_return_thunk+0x5/0x5f
>> =C2=A0 entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>
>> It's a bit unfortunate that we end up with quadratic complexity w.r.t.
>> the number of merged fences in all cases, but I'd argue in practice
>> there shouldn't be more than a handful of in-flight fences to merge.
>>
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3617
>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>> ---
>> =C2=A0 drivers/dma-buf/dma-fence-unwrap.c | 13 +++++++++++--
>> =C2=A0 1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-
>> fence-unwrap.c
>> index 628af51c81af..46277cef0bc6 100644
>> --- a/drivers/dma-buf/dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/dma-fence-unwrap.c
>> @@ -68,7 +68,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned
>> int num_fences,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_fence *tmp, **array;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t timestamp;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i;
>> -=C2=A0=C2=A0=C2=A0 size_t count;
>> +=C2=A0=C2=A0=C2=A0 size_t count, j;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 count =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 timestamp =3D ns_to_ktime(0);
>> @@ -127,6 +127,10 @@ struct dma_fence
>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 * function is used multiple times. So attempt to order
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 * the fences by context as we pass over them and merge
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 * fences with the same context.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 *
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * We will remove any remaining duplicate fences down
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * below, but doing this here saves us from having to
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * iterate over the array to detect the duplicate.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (!tmp || tmp->context > next->context) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp =3D next;
>> @@ -145,7 +149,12 @@ struct dma_fence
>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tmp) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arr=
ay[count++] =3D dma_fence_get(tmp);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for=
 (j =3D 0; j < count; ++j) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (array[count] =3D=3D tmp)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(j =3D=3D count)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 array[count++] =3D dma_fence_get(tmp);
>
> That is clearly not the right solution. Since comparing the context
> should have already removed all duplicates.

Sadly, not. This is true as long as the fences are ordered by context,
but this is not a given. The error manifests precisely when they are not
ordered.

Imagine we try to merge two chains/arrays that contain the same 4 fences
(I'll call them fences 1-4), but the second one has another fence with a
higher context (fence 5) in front of it.

I'll try to visualize the chains/arrays as ASCII art - we start out in a
state like this (the ^ marker referring to the current iterator position):

Result: <empty>

1. 1 -> 2 -> 3 -> 4
    ^
2. 5 -> 1 -> 2 -> 3 -> 4
    ^

Since fences 1-4 have a lower context than fence 5, we'll insert fences
1-4 first:

Result: 1 -> 2 -> 3 -> 4

1. 1 -> 2 -> 3 -> 4
                      ^
2. 5 -> 1 -> 2 -> 3 -> 4
    ^

Only then will we insert fence 5:

Result: 1 -> 2 -> 3 -> 4 -> 5

1. 1 -> 2 -> 3 -> 4
                      ^
2. 5 -> 1 -> 2 -> 3 -> 4
         ^

Now we're at fence 1 in the second chain/array, but we've already
inserted fences 1-4 from the first chain/array, so we fail to merge
them. Instead, they get reinserted:

Result: 1 -> 2 -> 3 -> 4 -> 5 -> 1 -> 2 -> 3 -> 4

1. 1 -> 2 -> 3 -> 4
                      ^
2. 5 -> 1 -> 2 -> 3 -> 4
                          ^

We can't assume the fences are in any sort of order w.r.t their context,
so if we want to check for duplicates exhaustively we'll always end up
with some kind of O(n^2) algorithm. I see only a handful of ways we can go=
:

a) Don't check exhaustively (current behavior). Obviously, this doesn't
work that well in practice.

b) Eat the O(n^2) cost (this patch). I've kept the current merging code
since it's an easy way to reduce the amount of times we have to do the
expensive duplicate check, but other than that I'm not sure we can do
much to reduce cost.

c) Enforce order w.r.t. context. I don't think we can require that fence
chains order their fences by context, they should be ordered by timeline
point (maybe it would work for arrays, but whatever). That leaves us
with having to sort the fences by context just before merging. That
would reduce complexity to some O(n log n) at worst, but in practice I
fear it might not be worth it compared to just iterating over the result
array a few times, especially given that once this bug is fixed, we
should be back to only a few fences to merge :)

Regards,
Friedrich

>
> Going to double check the code.
>
> Thanks,
> Christian.
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 fences[sel] =3D dma_fence_unwrap_next(&iter[sel]);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } while (tmp);
>> --
>> 2.47.0
>>
>

