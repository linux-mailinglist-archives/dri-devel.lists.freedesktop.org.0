Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3AC7F289B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 10:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0D910E456;
	Tue, 21 Nov 2023 09:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DE210E099;
 Tue, 21 Nov 2023 09:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700558461; x=1732094461;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=AN2NvCErWf1LeTnhhNUlQcQl2SXOxvm16eNLcP/5POw=;
 b=Hyc+WfMaqJu+lzJ2qkV9w7IXQBThlsKTGMmuhhNtEIQdzWDz6/Vkxv4k
 7sVmGkLEQNKpXc9cmR/BjRqvQsRTS9GbNBSgO1yRSlk/52wKOMo6W9S1z
 ej0h2OxyCGTpLto3oV4UBhtBH0TodAZaH5FtZf6x8EFlYBX3G7XqtVy9v
 Mvwl3BifTiZFeGUsD23BFOlPV9p4F6zi8uNqZem7VmsYHBF8B7GoWzEt0
 Ipy31BKaxHCZfU8+ibQwtcCcuYOOdo1Up/3/YLBxFZuqln8zI5teuGXos
 lvbdyoP4B/ZK5zVtoEWVr2yREvD7ukQFuMBdUK4kpXXz1Lklrlxa6o4CD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371140802"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="371140802"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 01:21:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="890202592"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="890202592"
Received: from cdeakx-mobl.amr.corp.intel.com (HELO localhost) ([10.252.58.54])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 01:20:56 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Edward
 Adam Davis <eadavis@qq.com>
Subject: Re: [PATCH V2] drm/modes: Fix divide error in
 drm_mode_debug_printmodeline
In-Reply-To: <ZVt3Yv2q8w0PjsMP@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <875y1wpsp3.fsf@intel.com>
 <tencent_DCCE6C78766FE82D816F9C94F0EAC2ED260A@qq.com>
 <ZVt3Yv2q8w0PjsMP@intel.com>
Date: Tue, 21 Nov 2023 11:20:53 +0200
Message-ID: <87edgjo422.fsf@intel.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, airlied@linux.ie, daniel.vetter@ffwll.ch,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 Danilo Krummrich <dakr@redhat.com>, mripard@kernel.org, tzimmermann@suse.de,
 nouveau@lists.freedesktop.org, daniel.vetter@intel.com,
 syzbot+2e93e6fb36e6fdc56574@syzkaller.appspotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Nov 2023, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Mon, Nov 20, 2023 at 10:41:18PM +0800, Edward Adam Davis wrote:
>> [Syz Log]
>> divide error: 0000 [#1] PREEMPT SMP KASAN
>> CPU: 0 PID: 5068 Comm: syz-executor357 Not tainted 6.6.0-syzkaller-16039=
-gac347a0655db #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS =
Google 10/09/2023
>> RIP: 0010:drm_mode_vrefresh drivers/gpu/drm/drm_modes.c:1303 [inline]
>> RIP: 0010:drm_mode_debug_printmodeline+0x118/0x4e0 drivers/gpu/drm/drm_m=
odes.c:60
>> Code: 00 41 0f b7 07 66 83 f8 02 b9 01 00 00 00 0f 43 c8 0f b7 c1 0f af =
e8 44 89 f0 48 69 c8 e8 03 00 00 89 e8 d1 e8 48 01 c8 31 d2 <48> f7 f5 49 8=
9 c6 eb 0c e8 fb 07 66 fc eb 05 e8 f4 07 66 fc 48 89
>> RSP: 0018:ffffc9000391f8d0 EFLAGS: 00010246
>> RAX: 000000000001f400 RBX: ffff888025045000 RCX: 000000000001f400
>> RDX: 0000000000000000 RSI: 0000000000008000 RDI: ffff888025045018
>> RBP: 0000000000000000 R08: ffffffff8528b9af R09: 0000000000000000
>> R10: ffffc9000391f8a0 R11: fffff52000723f17 R12: 0000000000000080
>> R13: dffffc0000000000 R14: 0000000000000080 R15: ffff888025045016
>> FS:  0000555556932380(0000) GS:ffff8880b9800000(0000) knlGS:000000000000=
0000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00000000005fdeb8 CR3: 000000007fcff000 CR4: 00000000003506f0
>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> Call Trace:
>>  <TASK>
>>  drm_mode_setcrtc+0x83b/0x1880 drivers/gpu/drm/drm_crtc.c:794
>>  drm_ioctl_kernel+0x362/0x500 drivers/gpu/drm/drm_ioctl.c:792
>>  drm_ioctl+0x636/0xb00 drivers/gpu/drm/drm_ioctl.c:895
>>  vfs_ioctl fs/ioctl.c:51 [inline]
>>  __do_sys_ioctl fs/ioctl.c:871 [inline]
>>  __se_sys_ioctl+0xf8/0x170 fs/ioctl.c:857
>>  do_syscall_x64 arch/x86/entry/common.c:51 [inline]
>>  do_syscall_64+0x44/0x110 arch/x86/entry/common.c:82
>>  entry_SYSCALL_64_after_hwframe+0x63/0x6b
>>=20
>> [Analysis]
>> When calculating den in drm_mode_vrefresh(), if the vscan value is too l=
arge,=20
>> there is a probability of unsigned integer overflow.
>>=20
>> [Fix]
>> Before multiplying by vscan, first check if their product will overflow.=
=20
>> If overflow occurs, return 0 and exit the subsequent process.
>>=20
>> Reported-and-tested-by: syzbot+2e93e6fb36e6fdc56574@syzkaller.appspotmai=
l.com
>> Fixes: ea40d7857d52 ("drm/vkms: fbdev emulation support")
>> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
>> ---
>>  drivers/gpu/drm/drm_modes.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
>> index ac9a406250c5..60739d861da2 100644
>> --- a/drivers/gpu/drm/drm_modes.c
>> +++ b/drivers/gpu/drm/drm_modes.c
>> @@ -36,6 +36,7 @@
>>  #include <linux/list.h>
>>  #include <linux/list_sort.h>
>>  #include <linux/of.h>
>> +#include <linux/overflow.h>
>>=20=20
>>  #include <video/of_display_timing.h>
>>  #include <video/of_videomode.h>
>> @@ -1297,8 +1298,10 @@ int drm_mode_vrefresh(const struct drm_display_mo=
de *mode)
>>  		num *=3D 2;
>>  	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
>>  		den *=3D 2;
>> -	if (mode->vscan > 1)
>> -		den *=3D mode->vscan;
>> +	if (mode->vscan > 1) {
>> +		if (unlikely(check_mul_overflow(den, mode->vscan, &den)))
>> +			return 0;
>> +	}
>
> I can't see any driver that actually supports vscan>1. Only
> nouveau has some code for it, but doesn't look like it does
> anything sensible. All other drivers for sure should be
> rejecting vscan>1 outright. Which driver is this?
>
> Is there an actual usecase where nouveau needs this (and does
> it even work?) or could we just rip out the whole thing and
> reject vscan>1 globally?

I thought the whole thing seemed familiar [1].

BR,
Jani.



[1] https://lore.kernel.org/r/20230802174746.2256-1-astrajoan@yahoo.com


>
>>=20=20
>>  	return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(num, 1000), den);
>>  }
>> --=20
>> 2.25.1

--=20
Jani Nikula, Intel
