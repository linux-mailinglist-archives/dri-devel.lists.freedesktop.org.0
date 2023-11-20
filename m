Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0D37F11FD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 12:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D3610E3A1;
	Mon, 20 Nov 2023 11:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243E110E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700479872; x=1732015872;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YGbR5p4kQb9i8HmQmSVaXtrNqPcOGMP09hVzD3QkDGY=;
 b=A9BXvuM5Os+yGzxANvusWSOUUh2VQkEIYX3q0HK4S3EzuMofbQX7YUBl
 w2qLdLDWeb9ap1MpAzCskxEQ6MDWh8NCT6NEHBNattUR0obqg8WuhHRED
 vfLKz6qUMPli6AIvjTcxWouHuOactAuuOZQKSaiQszpNNJz7pEJSi0l//
 3SaFz6+Vj2Bq6YsQjMVYMUmxPJQqQgiYb7MClafHphy/P6z4K2pHlOhDr
 IWEjDnu88aGJdiqn5usOYLPaFWaCzdTOMUhDYrPrLnl8JEbead15Fst5r
 FkGIPm5lo7gscbxD75qVQ0WgmP4e6dniwvxJWNiugBgzL+JhgybSeCtOo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="388739539"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="388739539"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 03:31:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="1097725092"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="1097725092"
Received: from avmoskal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.194])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 03:31:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Edward Adam Davis <eadavis@qq.com>,
 syzbot+2e93e6fb36e6fdc56574@syzkaller.appspotmail.com
Subject: Re: [PATCH] drm/modes: Fix divide error in
 drm_mode_debug_printmodeline
In-Reply-To: <tencent_F6C990AEE12ED34C8467CBC6FBD2F4467F06@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <000000000000bf0b1f060a2d9bea@google.com>
 <tencent_F6C990AEE12ED34C8467CBC6FBD2F4467F06@qq.com>
Date: Mon, 20 Nov 2023 13:31:04 +0200
Message-ID: <875y1wpsp3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mripard@kernel.org, tzimmermann@suse.de,
 daniel.vetter@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 19 Nov 2023, Edward Adam Davis <eadavis@qq.com> wrote:
> [Syz Log]
> divide error: 0000 [#1] PREEMPT SMP KASAN
> CPU: 0 PID: 5068 Comm: syz-executor357 Not tainted 6.6.0-syzkaller-16039-gac347a0655db #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/09/2023
> RIP: 0010:drm_mode_vrefresh drivers/gpu/drm/drm_modes.c:1303 [inline]
> RIP: 0010:drm_mode_debug_printmodeline+0x118/0x4e0 drivers/gpu/drm/drm_modes.c:60
> Code: 00 41 0f b7 07 66 83 f8 02 b9 01 00 00 00 0f 43 c8 0f b7 c1 0f af e8 44 89 f0 48 69 c8 e8 03 00 00 89 e8 d1 e8 48 01 c8 31 d2 <48> f7 f5 49 89 c6 eb 0c e8 fb 07 66 fc eb 05 e8 f4 07 66 fc 48 89
> RSP: 0018:ffffc9000391f8d0 EFLAGS: 00010246
> RAX: 000000000001f400 RBX: ffff888025045000 RCX: 000000000001f400
> RDX: 0000000000000000 RSI: 0000000000008000 RDI: ffff888025045018
> RBP: 0000000000000000 R08: ffffffff8528b9af R09: 0000000000000000
> R10: ffffc9000391f8a0 R11: fffff52000723f17 R12: 0000000000000080
> R13: dffffc0000000000 R14: 0000000000000080 R15: ffff888025045016
> FS:  0000555556932380(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000005fdeb8 CR3: 000000007fcff000 CR4: 00000000003506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  drm_mode_setcrtc+0x83b/0x1880 drivers/gpu/drm/drm_crtc.c:794
>  drm_ioctl_kernel+0x362/0x500 drivers/gpu/drm/drm_ioctl.c:792
>  drm_ioctl+0x636/0xb00 drivers/gpu/drm/drm_ioctl.c:895
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:871 [inline]
>  __se_sys_ioctl+0xf8/0x170 fs/ioctl.c:857
>  do_syscall_x64 arch/x86/entry/common.c:51 [inline]
>  do_syscall_64+0x44/0x110 arch/x86/entry/common.c:82
>  entry_SYSCALL_64_after_hwframe+0x63/0x6b
>
> [Analysis]
> When calculating den in drm_mode_vrefresh(), if the vscan value is too large, 
> there is a probability of unsigned integer overflow.
>
> [Fix]
> Before multiplying by vscan, first determine their ilog2. When their total 
> exceeds 32, return -EINVAL and exit the subsequent calculation.
>
> Reported-and-tested-by: syzbot+2e93e6fb36e6fdc56574@syzkaller.appspotmail.com
> Fixes: ea40d7857d52 ("drm/vkms: fbdev emulation support")
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>  drivers/gpu/drm/drm_modes.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index ac9a406250c5..c7ec1ab041f8 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -36,6 +36,7 @@
>  #include <linux/list.h>
>  #include <linux/list_sort.h>
>  #include <linux/of.h>
> +#include <linux/log2.h>
>  
>  #include <video/of_display_timing.h>
>  #include <video/of_videomode.h>
> @@ -1297,8 +1298,11 @@ int drm_mode_vrefresh(const struct drm_display_mode *mode)
>  		num *= 2;
>  	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
>  		den *= 2;
> -	if (mode->vscan > 1)
> +	if (mode->vscan > 1) {
> +		if (ilog2(den) + ilog2(mode->vscan) >= 32)

For future reference, check_mul_overflow() is the way to handle this.

> +			return -EINVAL;

Just so there's no confusion: NAK.

I'd be surprised if there were even a single place in the kernel where
someone checks drm_mode_vrefresh() for a negative error return.

This function must succeed.

Please change the types as needed instead.


BR,
Jani.

>  		den *= mode->vscan;
> +	}
>  
>  	return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(num, 1000), den);
>  }

-- 
Jani Nikula, Intel
