Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D8D56301A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 11:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52962113460;
	Fri,  1 Jul 2022 09:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE4611347D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 09:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656667845;
 bh=h5xamwQQXuxhrOv9jac26IcAI/w0rk+EjpF01FeFLZA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=YhZlcXfaJA50Jamm9WgpcQvbbUYLbX6LY8ZwZxTi2IMpYJG2zCxF4x9ny9GoHkv+u
 ODRads0N0uYqQZnlhMLc9+luhXfn77aT7jzVoYUXcDpUZz8DGvoLEOL4rWI6RJ+sEE
 qrLjW2ZQWIq7sYCDBAIp2vA/B8Llab9B6AuiU1Nw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.182.192]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhD6g-1nSu5n05Z4-00eHje; Fri, 01
 Jul 2022 11:30:45 +0200
Message-ID: <4580aa35-5a34-0d81-56d1-1f10218375d2@gmx.de>
Date: Fri, 1 Jul 2022 11:30:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] fbcon: Fix up user-provided virtual screen size
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-3-deller@gmx.de>
 <CAMuHMdXJRBywf+h_u1jgA6X7hLSByDDwSkskff47a0BHfd93iA@mail.gmail.com>
 <0c418b7d-474a-3f93-a1fb-2f13c4d19941@gmx.de>
 <CAMuHMdUoMJ6CmiKDh4MW_b-7uoxEF+H6QimsA7SfcE5kjo17vw@mail.gmail.com>
 <d57655b2-44d1-4083-c4e9-ef4f004f2b64@gmx.de>
 <CAMuHMdXk9Kz4-pv7-M9tufj-pruhOZWw_b51fegkr2JSqzL65g@mail.gmail.com>
 <cae3dc86-8156-eef5-1af4-b16cb2a42849@gmx.de>
 <CAMuHMdViqMgpiB2a-cLt1viVMgGbBz_Q=youNsWdLPYxcXxFpA@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdViqMgpiB2a-cLt1viVMgGbBz_Q=youNsWdLPYxcXxFpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+Mw8zvSInYVg0G6qdH3PSV2upBLyADa7R500Rg//2g8u1lesT7U
 iHMJMrNgNRtStkv7bYbS2vF74TRCVlm1CKAUONNUsgXv0jR+bZecOX1kdB8nYqcjko32mHi
 msXLwHmrq0eoUlO8UeVaW90kzTIZN19CtS3d8Qv0cnh9jJLHSwcM8AORBbJjIdmLyGux2+Q
 4lD3zd58XBmhSjk0+wWSA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:F4eAaiEEW1U=:v/OO2ZgoMlttSwufzM4EVt
 X8IOSUmAFClw8glqWauDzvE7Tz6uQbelS1aW6LUicF6bLUbjKdDpV4+pMz9M2X+xOIJqojta7
 vS6OkYu/tVf6E4WWEWt4LG1K0rPiuigGnWAKVGTAGXCPhIEkJ68ckRB/uukH5W1BnF/+SLuw1
 X7xRO+N6PE0AfJ0+/FTjBqMU+usBGuSVBdPdzvw74s/YGhH08YBeQ1OmV+005M1vg2UDQZuz4
 4lWtWPadmljeXg8sxLtcTNcnUJqmZPqMnRBWdRjPbHeh+C6NCpJOinJsI22Ub0NXf7183WS6G
 QfC6CL8qbPLAn6f++F+lx0gJjkPk/FiDnOYZMGmwyJ/VjOSb9c2gKdM3vzXRoFw7iG0h3w4Ut
 rcXfBTDXedj3qRNvJTbDQ38TKsk0VJi12JTK3nPbtDJW1MXKFkQaIkiFPMOGZlDvcsT3L7/hT
 hylt6zsMj+187U/AACuWDeVd4xwNiJpska61eCt4dfY5nBPqmDalNY8z68b/2XvRNn30Tdj3x
 EE++cOGkafBXWJMRN+ItEj/g9Bfm+Eko1N4Y9GASkFbgfAGkl0+Q8uj1GYGgOn8KIpMXWRXhp
 wHmvyN51kvA0GPtMfoORcNKdfzlL+sGr8FOd/emzPs/bh+/FlSfsUzmzNdK+kAOzHFk98/lkX
 ZjTRpJINr0qG5E5Z+zMHPHd5RRBAklIelnKEa1zYRRV1Osbox1EZh6hBzwgXrPFHp6OvjNKRU
 zsLTWdO5Xf6xnfReU3sxDI4U5Q1qYtgNkOC5Itw1EO/SGnUXxfMshhGwl2Zg00oc1eL83Oe6N
 NffeNHUr03cxbjDJA0eVoPvumsvyAIF4fAgZBek7PbKSK+INKo7rDCl7ifC5LRthyEJr8+/6V
 TTb2qJPprLBzNBajMCv5mA2+t4qy2XnxqiBnPGQjJUNBQQKA/WnnZ+VTEv7XOxTGKPIs68Yny
 yx/gMkoXgs8cFxNptiZmn0uL1EqGemlZ8wcOL7hvlZY8MfAUL61ClofZKz+grQR2ZGaJcs1y4
 5GoMSXpp0uvRphN8aPafCDFsilN1pDb+if4pQP5hVvliS/y33bYkY53oMe4YyFzMB9Pkm7L4c
 iShtaKgclGJsbSjl0g1ySX1px7Ps8w9UhRfz4E/1pUjZDwkKWzlNFIwXw==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On 7/1/22 09:28, Geert Uytterhoeven wrote:
> On Thu, Jun 30, 2022 at 10:10 PM Helge Deller <deller@gmx.de> wrote:
>> On 6/30/22 22:00, Geert Uytterhoeven wrote:
>>> On Thu, Jun 30, 2022 at 9:46 PM Helge Deller <deller@gmx.de> wrote:
>>>> On 6/30/22 21:36, Geert Uytterhoeven wrote:
>>>>> On Thu, Jun 30, 2022 at 9:31 PM Helge Deller <deller@gmx.de> wrote:
>>>>>> On 6/30/22 21:00, Geert Uytterhoeven wrote:
>>>>>>> On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wrot=
e:
>>>>>>>> The virtual screen size can't be smaller than the physical screen=
 size.
>>>>>>>> Based on the general rule that we round up user-provided input if
>>>>>>>> neccessary, adjust the virtual screen size as well if needed.
>>>>>>>>
>>>>>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>>>>> Cc: stable@vger.kernel.org # v5.4+
>>>>>>>
>>>>>>> Thanks for your patch!
>>>>>>>
>>>>>>>> --- a/drivers/video/fbdev/core/fbmem.c
>>>>>>>> +++ b/drivers/video/fbdev/core/fbmem.c
>>>>>>>> @@ -1106,6 +1106,11 @@ static long do_fb_ioctl(struct fb_info *in=
fo, unsigned int cmd,
>>>>>>>>                         return -EFAULT;
>>>>>>>>                 console_lock();
>>>>>>>>                 lock_fb_info(info);
>>>>>>>> +               /* adjust virtual screen size if user missed it *=
/
>>>>>>>> +               if (var.xres_virtual < var.xres)
>>>>>>>> +                       var.xres_virtual =3D var.xres;
>>>>>>>> +               if (var.yres_virtual < var.yres)
>>>>>>>> +                       var.yres_virtual =3D var.yres;
>>>>>>>>                 ret =3D fb_set_var(info, &var);
>>>>>>>>                 if (!ret)
>>>>>>>>                         fbcon_update_vcs(info, var.activate & FB_=
ACTIVATE_ALL);
>>>>>>>
>>>>>>> Given "[PATCH 4/5] fbmem: Prevent invalid virtual screen sizes in
>>>>>>> fb_set_var", I don't think we need this patch.
>>>>>>
>>>>>> We do.
>>>>>
>>>>> Why? It will be caught by [PATCH 4/5].
>>>>
>>>> Right, it will be caught by patch #4.
>>>> But if you drop this part, then everytime a user runs
>>>>         fbset -xres 800 -yres 600 -xvres 200
>>>> users will get the KERNEL BUG WARNING (from patch #4) including
>>>> a kernel backtrace in their syslogs.
>>>
>>> No, they will only see that warning if they are using a broken fbdev
>>> driver that implements .fb_check_var(), but fails to validate or
>>> update the passed geometry.
>>
>> IMHO this argument is mood.
>> That way you put pressure on and need such simple code in
>> each single driver to fix it up, instead of cleaning it up at a central
>> place.
>
> Most hardware has restrictions on resolution (e.g. xres must be a
> multiple of N), so the driver has to round up the resolution to make
> it fit.  And after that the driver has to validate and update the
> virtual resolution again anyway...
>
> If a driver does not support changing the video mode, it can leave
> out the .fb_check_var() and .fb_set_par() callbacks, so the fbdev
> core will ignore the userspace-supplied parameters, and reinstate
> the single supported mode. See e.g. "[PATCH] drm/fb-helper:
> Remove helpers to change frame buffer config"
> (https://lore.kernel.org/all/20220629105658.1373770-1-geert@linux-m68k.o=
rg).

I implemented all of your suggested changes - from this mail and the other=
s.
I've committed a new testing tree to the fbcon-fix-testing branch at:
https://github.com/hdeller/linux/tree/fbcon-fix-testing
The diff is here:
https://github.com/torvalds/linux/compare/master...hdeller:linux:fbcon-fix=
-testing

Although your idea is good since we now would find issues in the drivers,
I don't think we want to commit it, since the testcase from
the bug report then immediately crashes the kernel - see below.

I think we need to fix up earlier.
Your other patch to disable DRM's set_fb_var() might fix this specific iss=
ue,
but in general we may face other problems in other drivers too.
Thoughts?

Helge



root@debian:~# ./a.out
[   44.118212][ T3081] ------------[ cut here ]------------
[   44.118298][ T3081] WARNING: CPU: 2 PID: 3081 at drivers/video/fbdev/co=
re/fbmem.c:1020 fb_set_var.cold+0x10d/0x1bc
[   44.118376][ T3081] Modules linked in:
[   44.118401][ T3081] CPU: 2 PID: 3081 Comm: a.out Not tainted 5.19.0-rc4=
-00004-g11dd75029515 #17
[   44.118432][ T3081] Hardware name: QEMU Standard PC (i440FX + PIIX, 199=
6), BIOS 1.15.0-1.fc35 04/01/2014
[   44.118453][ T3081] RIP: 0010:fb_set_var.cold+0x10d/0x1bc
[   44.118709][ T3081] Call Trace:
[   44.118719][ T3081]  <TASK>
[   44.118731][ T3081]  ? fb_blank+0x190/0x190
[   44.118784][ T3081]  ? rcu_read_lock_sched_held+0x3a/0x70
[   44.118816][ T3081]  ? trace_contention_end+0xea/0x150
[   44.118845][ T3081]  ? __mutex_lock+0x259/0x1450
[   44.118875][ T3081]  ? do_fb_ioctl+0x2fd/0x6f0
[   44.118906][ T3081]  ? mutex_lock_io_nested+0x1260/0x1260
[   44.118936][ T3081]  ? lock_downgrade+0x6e0/0x6e0
[   44.118966][ T3081]  ? rwlock_bug.part.0+0x90/0x90
[   44.118998][ T3081]  ? _raw_spin_lock_irqsave+0x4e/0x50
[   44.119031][ T3081]  ? is_console_locked+0x5/0x10
[   44.119060][ T3081]  ? fbcon_info_from_console+0x61/0x190
[   44.119087][ T3081]  ? fbcon_modechange_possible+0x359/0x4c0
[   44.119116][ T3081]  do_fb_ioctl+0x63b/0x6f0
[   44.119146][ T3081]  ? putname+0xfe/0x140
[   44.119174][ T3081]  ? fb_set_suspend+0x1a0/0x1a0
[   44.119204][ T3081]  ? path_openat+0x1016/0x2810
[   44.119234][ T3081]  ? mark_lock.part.0+0xfc/0x1a00
[   44.119266][ T3081]  ? lock_chain_count+0x20/0x20
[   44.119297][ T3081]  ? lock_chain_count+0x20/0x20
[   44.119326][ T3081]  ? lock_downgrade+0x6e0/0x6e0
[   44.119358][ T3081]  ? _raw_spin_unlock_irqrestore+0x50/0x70
[   44.119396][ T3081]  fb_ioctl+0xe7/0x150
[   44.119424][ T3081]  ? do_fb_ioctl+0x6f0/0x6f0
[   44.119454][ T3081]  __x64_sys_ioctl+0x94c/0x18a0
[   44.119487][ T3081]  ? vfs_fileattr_set+0xb70/0xb70
[   44.119520][ T3081]  ? find_held_lock+0x2d/0x110
[   44.119550][ T3081]  ? __context_tracking_exit+0xb8/0xe0
[   44.119582][ T3081]  ? lock_downgrade+0x6e0/0x6e0
[   44.119613][ T3081]  ? lock_downgrade+0x6e0/0x6e0
[   44.119645][ T3081]  ? syscall_enter_from_user_mode+0x21/0x70
[   44.119678][ T3081]  ? syscall_enter_from_user_mode+0x21/0x70
[   44.119711][ T3081]  do_syscall_64+0x35/0x80
[   44.119751][ T3081]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
[   44.119786][ T3081] RIP: 0033:0x7ffb0251a9b9
[   44.119816][ T3081] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 =
00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08=
 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a7 54 0c 00 f7 d8 64 89 01 48
[   44.119842][ T3081] RSP: 002b:00007ffcce124e78 EFLAGS: 00000287 ORIG_RA=
X: 0000000000000010
[   44.119871][ T3081] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00=
007ffb0251a9b9
[   44.119890][ T3081] RDX: 00000000200001c0 RSI: 0000000000004601 RDI: 00=
00000000000004
[   44.119909][ T3081] RBP: 00007ffcce124e90 R08: 00007ffcce124e90 R09: 00=
007ffcce124e90
[   44.119928][ T3081] R10: 00007ffcce124e90 R11: 0000000000000287 R12: 00=
0055b9dba381d0
[   44.119947][ T3081] R13: 0000000000000000 R14: 0000000000000000 R15: 00=
00000000000000
[   44.119968][ T3081]  </TASK>
[   44.119980][ T3081] Kernel panic - not syncing: panic_on_warn set ...
[   44.119991][ T3081] CPU: 2 PID: 3081 Comm: a.out Not tainted 5.19.0-rc4=
-00004-g11dd75029515 #17
[   44.120017][ T3081] Hardware name: QEMU Standard PC (i440FX + PIIX, 199=
6), BIOS 1.15.0-1.fc35 04/01/2014
[   44.120031][ T3081] Call Trace:
[   44.120037][ T3081]  <TASK>
[   44.120046][ T3081]  dump_stack_lvl+0xcd/0x134
[   44.120075][ T3081]  panic+0x2d3/0x632
[   44.120099][ T3081]  ? panic_print_sys_info.part.0+0x10b/0x10b
[   44.120128][ T3081]  ? __warn.cold+0x1d1/0x2c5
[   44.120153][ T3081]  ? fb_set_var.cold+0x10d/0x1bc
[   44.120176][ T3081]  __warn.cold+0x1e2/0x2c5
[   44.120200][ T3081]  ? fb_set_var.cold+0x10d/0x1bc
[   44.120224][ T3081]  report_bug+0x1c0/0x210
[   44.120253][ T3081]  handle_bug+0x3c/0x60
[   44.120277][ T3081]  exc_invalid_op+0x14/0x40
[   44.120303][ T3081]  asm_exc_invalid_op+0x1b/0x20
[   44.120326][ T3081] RIP: 0010:fb_set_var.cold+0x10d/0x1bc
[   44.120352][ T3081] Code: b6 14 02 48 89 f0 83 e0 07 83 c0 03 38 d0 7c =
08 84 d2 0f 85 92 00 00 00 89 4d 0c e9 41 d8 5a fc 44 89 44 24 08 e8 3f b2=
 3a fb <0f> 0b 8b 74 24 08 49 8d 94 24 d0 01 00 00 48 c7 c7 60 b9 d9 86 e8
[   44.120375][ T3081] RSP: 0018:ffffc900019d7808 EFLAGS: 00010293
[   44.120395][ T3081] RAX: 0000000000000000 RBX: 1ffff9200033af07 RCX: 00=
00000000000000
[   44.120412][ T3081] RDX: ffff888043a39c00 RSI: ffffffff863b5621 RDI: 00=
00000000000004
[   44.120429][ T3081] RBP: ffffc900019d7be0 R08: 0000000000000000 R09: 00=
00000000000000
[   44.120445][ T3081] R10: 0000000000000340 R11: 0000000000000000 R12: ff=
ff888041abc000
[   44.120462][ T3081] R13: ffffc900019d7c34 R14: 0000000000000000 R15: 00=
00000000000080
[   44.120480][ T3081]  ? fb_set_var.cold+0x10d/0x1bc
[   44.120505][ T3081]  ? fb_set_var.cold+0x10d/0x1bc
[   44.120529][ T3081]  ? fb_blank+0x190/0x190
[   44.120558][ T3081]  ? rcu_read_lock_sched_held+0x3a/0x70
[   44.120586][ T3081]  ? trace_contention_end+0xea/0x150
[   44.120612][ T3081]  ? __mutex_lock+0x259/0x1450
[   44.120639][ T3081]  ? do_fb_ioctl+0x2fd/0x6f0
[   44.120667][ T3081]  ? mutex_lock_io_nested+0x1260/0x1260
[   44.120695][ T3081]  ? lock_downgrade+0x6e0/0x6e0
[   44.120723][ T3081]  ? rwlock_bug.part.0+0x90/0x90
[   44.120777][ T3081]  ? _raw_spin_lock_irqsave+0x4e/0x50
[   44.120809][ T3081]  ? is_console_locked+0x5/0x10
[   44.120835][ T3081]  ? fbcon_info_from_console+0x61/0x190
[   44.120860][ T3081]  ? fbcon_modechange_possible+0x359/0x4c0
[   44.120887][ T3081]  do_fb_ioctl+0x63b/0x6f0
[   44.120914][ T3081]  ? putname+0xfe/0x140
[   44.120940][ T3081]  ? fb_set_suspend+0x1a0/0x1a0
[   44.120968][ T3081]  ? path_openat+0x1016/0x2810
[   44.120995][ T3081]  ? mark_lock.part.0+0xfc/0x1a00
[   44.121025][ T3081]  ? lock_chain_count+0x20/0x20
[   44.121054][ T3081]  ? lock_chain_count+0x20/0x20
[   44.121081][ T3081]  ? lock_downgrade+0x6e0/0x6e0
[   44.121110][ T3081]  ? _raw_spin_unlock_irqrestore+0x50/0x70
[   44.121146][ T3081]  fb_ioctl+0xe7/0x150
[   44.121173][ T3081]  ? do_fb_ioctl+0x6f0/0x6f0
[   44.121200][ T3081]  __x64_sys_ioctl+0x94c/0x18a0
[   44.121231][ T3081]  ? vfs_fileattr_set+0xb70/0xb70
[   44.121261][ T3081]  ? find_held_lock+0x2d/0x110
[   44.121289][ T3081]  ? __context_tracking_exit+0xb8/0xe0
[   44.121318][ T3081]  ? lock_downgrade+0x6e0/0x6e0
[   44.121347][ T3081]  ? lock_downgrade+0x6e0/0x6e0
[   44.121377][ T3081]  ? syscall_enter_from_user_mode+0x21/0x70
[   44.121407][ T3081]  ? syscall_enter_from_user_mode+0x21/0x70
[   44.121439][ T3081]  do_syscall_64+0x35/0x80
[   44.121464][ T3081]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
[   44.121497][ T3081] RIP: 0033:0x7ffb0251a9b9
[   44.121515][ T3081] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 =
00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08=
 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a7 54 0c 00 f7 d8 64 89 01 48
[   44.121539][ T3081] RSP: 002b:00007ffcce124e78 EFLAGS: 00000287 ORIG_RA=
X: 0000000000000010
[   44.121564][ T3081] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00=
007ffb0251a9b9
[   44.121581][ T3081] RDX: 00000000200001c0 RSI: 0000000000004601 RDI: 00=
00000000000004
[   44.121597][ T3081] RBP: 00007ffcce124e90 R08: 00007ffcce124e90 R09: 00=
007ffcce124e90
[   44.121614][ T3081] R10: 00007ffcce124e90 R11: 0000000000000287 R12: 00=
0055b9dba381d0
[   44.121631][ T3081] R13: 0000000000000000 R14: 0000000000000000 R15: 00=
00000000000000
[   44.121650][ T3081]  </TASK>
[   44.122149][ T3081] Kernel Offset: disabled
[   44.291225][ T3081] Rebooting in 86400 seconds..
