Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8964EC5F04F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713D410E25A;
	Fri, 14 Nov 2025 19:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="NEaPhBqi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDB410E25A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 19:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763148120; x=1763752920; i=deller@gmx.de;
 bh=6nUCeGy3uRb5NtOMxuqD9Fu4r4vfjNe/fiA7ghwX3/c=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=NEaPhBqilsKApBwwJcqBiFhjBWW5qXUjIK0wHakIwFNjMIW4usxd/HihCsr8Nf7d
 UEoP+lnw3lS4NRk545RZUre0Q08Vz+1VcysZb6kgHkjhwNftl54f9oHyUJiOXIBsU
 2iFoju9FtlUzqoufuMI03DqoffEHEapk/WdRQzZPjZ3wfDMeTpCrsRe33ZfMysjwU
 RiNUcP+7STV2bkbwxJ3hsD5tG+YuRHJyV71x8gdiW+ZsERSfiuyJWxz0gwUOc1enO
 lP7y3m85fZoUSU6hGXWdysOSAcOnIPgoVnPkkWewzP4Wf3sAzy0T8SHz1cOq6ZlsH
 70pcJo6kfnuJWw2k6w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.147]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Wuq-1vEVie0TJ6-002voi; Fri, 14
 Nov 2025 20:22:00 +0100
Message-ID: <148a116a-b893-4e91-8573-1eebc2bb5c0e@gmx.de>
Date: Fri, 14 Nov 2025 20:21:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stable] fbdev: Fix out-of-bounds issue in sys_fillrect()
To: Gu Bowen <gubowen5@huawei.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lu Jialin <lujialin4@huawei.com>
References: <20251112073207.1731125-1-gubowen5@huawei.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251112073207.1731125-1-gubowen5@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZhKYSOGuV9bVFWC2rGjkgKfoRB0elFk1aPSsjHly5tVq1K2V1AW
 ZRFPZgMfuJH5ALnq+LLb39hyMOCTx9Zr4sfG+Ahj9/0W+6w5N4h7VY5jHWSRMbxNT7MpMMa
 PXxbqEjpVYVhWFz+3Wq7S7nTRWI47ILThM97oK348gs28Uy7VteGN45ji7UpweVrNhhVj3V
 imZKNC4xA+YX0cxgUdV+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vtf00QxddQo=;XXddqnsMZK+hhosK/M+kQbGNeEk
 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
 JQCN5fsWtXyGzn8ChP1HlsR2oHL6a
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

On 11/12/25 08:32, Gu Bowen wrote:
> There was an out-of-bounds issue found by syzkaller test on v6.6.
>=20
> BUG: unable to handle page fault for address: ffffc90000c3f000
> PGD 100000067 P4D 100000067 PUD 100c80067 PMD 10ac1c067 PTE 0
> Oops: 0002 [#1] PREEMPT SMP KASAN PTI
> CPU: 3 PID: 6521 Comm: syz.3.1365 Not tainted 6.6.0+ #82
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.14.0-0=
-g155821a1990b-prebuilt.qemu.org 04/01/2014
> RIP: 0010:memset64 arch/x86/include/asm/string_64.h:58 [inline]
> RIP: 0010:memset_l include/linux/string.h:168 [inline]
> RIP: 0010:bitfill_aligned drivers/video/fbdev/core/sysfillrect.c:53 [inl=
ine]
> RIP: 0010:bitfill_aligned+0x144/0x1c0 drivers/video/fbdev/core/sysfillre=
ct.c:25
> Code: 23 04 24 48 31 d0 49 89 46 f8 44 89 e0 44 29 f8 29 c3 e8 9f 39 49 =
fe 89 d8 31 d2 4c 89 f7 41 f7 f4 48 89 c3 48 89 c1 48 89 e8 <f3> 48 ab 31 =
ff 4c 89 ee e8 df 2f 49 fe 4d 85 ed 0f 84 6b ff ff ff
> RSP: 0018:ffff888119ce7418 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: 0000000000000180 RCX: 0000000000000180
> RDX: 0000000000000000 RSI: ffffc90003873000 RDI: ffffc90000c3f000
> RBP: 0000000000000000 R08: 0000000000006000 R09: 0000000000000040
> R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000040
> R13: 0000000000000000 R14: ffffc90000c3f000 R15: 0000000000000000
> FS:  00007f1704b926c0(0000) GS:ffff8881f5980000(0000) knlGS:000000000000=
0000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffc90000c3f000 CR3: 00000001230d0002 CR4: 0000000000770ee0
> DR0: 0000000000000000 DR1: 000000000000e000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
> PKRU: 80000000
> Call Trace:
>   <TASK>
>   sys_fillrect+0x429/0x830 drivers/video/fbdev/core/sysfillrect.c:281
>   drm_fbdev_generic_defio_fillrect+0x27/0x140 drivers/gpu/drm/drm_fbdev_=
generic.c:37
>   bit_clear+0x183/0x220 drivers/video/fbdev/core/bitblit.c:73
>   __fbcon_clear+0x5ea/0x670 drivers/video/fbdev/core/fbcon.c:1281
>   fbcon_scroll+0x41e/0x560 drivers/video/fbdev/core/fbcon.c:1847
>   con_scroll+0x464/0x6a0 drivers/tty/vt/vt.c:577
>   lf+0x274/0x2d0 drivers/tty/vt/vt.c:1461
>   do_con_trol+0x5ea/0x3d80 drivers/tty/vt/vt.c:2149
>   do_con_write+0x780/0x10c0 drivers/tty/vt/vt.c:2905
>   con_write+0x28/0xc0 drivers/tty/vt/vt.c:3245
>   do_output_char+0x5de/0x850 drivers/tty/n_tty.c:433
>   process_output drivers/tty/n_tty.c:500 [inline]
>   n_tty_write+0x442/0xb00 drivers/tty/n_tty.c:2406
>   iterate_tty_write+0x2b5/0x630 drivers/tty/tty_io.c:1017
>   file_tty_write.constprop.0+0x20c/0x3b0 drivers/tty/tty_io.c:1088
>   call_write_iter include/linux/fs.h:2085 [inline]
>   do_iter_readv_writev+0x210/0x3c0 fs/read_write.c:737
>   do_iter_write+0x181/0x4e0 fs/read_write.c:862
>   vfs_writev+0x15b/0x4d0 fs/read_write.c:935
>   do_writev+0x136/0x370 fs/read_write.c:978
>   do_syscall_x64 arch/x86/entry/common.c:51 [inline]
>   do_syscall_64+0x59/0x110 arch/x86/entry/common.c:81
>   entry_SYSCALL_64_after_hwframe+0x78/0xe2
>=20
> When the virtual console is rotated in the backend state, it can lead to
> inconsistencies between the size of the virtual console's size and its
> hook functions. In such cases, clearing the screen may result in
> out-of-bounds issue.
>=20
> Fix it by adding a check in sys_fillrect() and moving set_blitting_type(=
)
> to the visible area of the VC.
>=20
> CC: stable@vger.kernel.org      # fbdev had been refactored on 6.15-rc1
> Fixes: 68648ed1f58d ("fbdev: add drawing functions for framebuffers in s=
ystem RAM")
> Signed-off-by: Gu Bowen <gubowen5@huawei.com>
> ---
>   drivers/video/fbdev/core/fbcon.c       | 2 +-
>   drivers/video/fbdev/core/sysfillrect.c | 6 ++++++
>   2 files changed, 7 insertions(+), 1 deletion(-)


That patch does not apply to git head.
Can you try to reproduce with git head?

Helge

 =20
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index b49f15a3442e..a6602f230089 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2702,9 +2702,9 @@ static void fbcon_modechanged(struct fb_info *info=
)
>   		return;
>  =20
>   	p =3D &fb_display[vc->vc_num];
> -	set_blitting_type(vc, info);
>  =20
>   	if (con_is_visible(vc)) {
> +		set_blitting_type(vc, info);
>   		var_to_display(p, &info->var, info);
>   		cols =3D FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
>   		rows =3D FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
> diff --git a/drivers/video/fbdev/core/sysfillrect.c b/drivers/video/fbde=
v/core/sysfillrect.c
> index bcdcaeae6538..e5c4ee317b0b 100644
> --- a/drivers/video/fbdev/core/sysfillrect.c
> +++ b/drivers/video/fbdev/core/sysfillrect.c
> @@ -238,6 +238,7 @@ void sys_fillrect(struct fb_info *p, const struct fb=
_fillrect *rect)
>   	u32 bpp =3D p->var.bits_per_pixel;
>   	unsigned long *dst;
>   	int dst_idx, left;
> +	long dst_offset;
>  =20
>   	if (p->state !=3D FBINFO_STATE_RUNNING)
>   		return;
> @@ -277,6 +278,11 @@ void sys_fillrect(struct fb_info *p, const struct f=
b_fillrect *rect)
>   		}
>   		while (height--) {
>   			dst +=3D dst_idx >> (ffs(bits) - 1);
> +			dst_offset =3D (unsigned long)dst - (unsigned long)p->screen_base;
> +			if (dst_offset < 0 || dst_offset >=3D p->fix.smem_len) {
> +				pr_err("dst offset out of bound: dst_offset(%ld)", dst_offset);
> +				return;
> +			}
>   			dst_idx &=3D (bits - 1);
>   			fill_op32(p, dst, dst_idx, pat, width*bpp, bits);
>   			dst_idx +=3D p->fix.line_length*8;

