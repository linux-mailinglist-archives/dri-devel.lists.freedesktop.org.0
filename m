Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D401DC16FBB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329A710E1DD;
	Tue, 28 Oct 2025 21:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="MsHrC8NY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8E310E1DD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1761686866; x=1762291666; i=deller@gmx.de;
 bh=PG0/qhSRW9MqkY2Xjjq/VGc3q0aSbWtBAE5Q2iopuqE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=MsHrC8NYNVjrmM47dru2nWLSHec/id+za6SlOsI26lxzYyp3Teosiw5dwB+mAPV/
 4l+eEnJ9mE9rLWCq6g3qdM8hfmg+nn9LAgDWyCZi/wv5hFLQ70qTqXZGpDslJFDR9
 EzdN3BgGWgpRuG9/cMfS1KLEUWpoh0BJnQK+vRlpNUnXv+Lf9S054CJzukM0FSW1N
 Ja1ZkYRdVN0xkT27L+uIE3lkxGKpgd6+NvvqLsB4LlThZcjIt0LLtPsIbAbpD4+gL
 Lccss6PizYoHsW5vm8jrW/M2Wp7NK3IWiXbEItqjOi8JkpidXxa7ylSRsW3INzm7c
 6Ep1iJyI7AyHfsNUgg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.74]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGVx-1vcw3j2yZ3-00IWtM; Tue, 28
 Oct 2025 22:27:46 +0100
Message-ID: <b392ab0e-16e8-4631-9867-26e3d20bef6c@gmx.de>
Date: Tue, 28 Oct 2025 22:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbcon: Set fb_display[i]->mode to NULL when the mode
 is released
To: Quanmin Yan <yanquanmin1@huawei.com>, tzimmermann@suse.de
Cc: simona@ffwll.ch, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 wangkefeng.wang@huawei.com, zuoze1@huawei.com, sunnanyong@huawei.com
References: <20251010081659.3609082-1-yanquanmin1@huawei.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251010081659.3609082-1-yanquanmin1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T0VE/7FqBpMh2ACBZll+7zOrZcU9ot0hhPozzx7cMqFohnPenAg
 kBv/8W71zoOGbTT+ubCi2zhw57JIs2ZY6A11pmiVbXhJws++jXHrPPWE0HgtvnLMrXXsvlo
 MiLEh4Hc8alVNlHlWLn8V5VZ+dsoz0CPr4i4fWSyzDRsDrR8pyhll3kDKaUTqpfgbXGQuza
 swoDh44I3Z7wp4X/7Zdsg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:e/7AnSJsyj4=;e/hC4HSPLYYBOtjD340BV4YnmaV
 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
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

On 10/10/25 10:16, Quanmin Yan wrote:
> Recently, we discovered the following issue through syzkaller:
>=20
> BUG: KASAN: slab-use-after-free in fb_mode_is_equal+0x285/0x2f0
> Read of size 4 at addr ff11000001b3c69c by task syz.xxx
> ...
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0xab/0xe0
>   print_address_description.constprop.0+0x2c/0x390
>   print_report+0xb9/0x280
>   kasan_report+0xb8/0xf0
>   fb_mode_is_equal+0x285/0x2f0
>   fbcon_mode_deleted+0x129/0x180
>   fb_set_var+0xe7f/0x11d0
>   do_fb_ioctl+0x6a0/0x750
>   fb_ioctl+0xe0/0x140
>   __x64_sys_ioctl+0x193/0x210
>   do_syscall_64+0x5f/0x9c0
>   entry_SYSCALL_64_after_hwframe+0x76/0x7e
>=20
> Based on experimentation and analysis, during framebuffer unregistration=
,
> only the memory of fb_info->modelist is freed, without setting the
> corresponding fb_display[i]->mode to NULL for the freed modes. This lead=
s
> to UAF issues during subsequent accesses. Here's an example of reproduct=
ion
> steps:
> 1. With /dev/fb0 already registered in the system, load a kernel module
>     to register a new device /dev/fb1;
> 2. Set fb1's mode to the global fb_display[] array (via FBIOPUT_CON2FBMA=
P);
> 3. Switch console from fb to VGA (to allow normal rmmod of the ko);
> 4. Unload the kernel module, at this point fb1's modelist is freed, leav=
ing
>     a wild pointer in fb_display[];
> 5. Trigger the bug via system calls through fb0 attempting to delete a m=
ode
>     from fb0.
>=20
> Add a check in do_unregister_framebuffer(): if the mode to be freed exis=
ts
> in fb_display[], set the corresponding mode pointer to NULL.
>=20
> Signed-off-by: Quanmin Yan <yanquanmin1@huawei.com>
> ---=20
>   drivers/video/fbdev/core/fbcon.c | 19 +++++++++++++++++++
>   drivers/video/fbdev/core/fbmem.c |  1 +
>   include/linux/fbcon.h            |  2 ++
>   3 files changed, 22 insertions(+)

applied.

Thanks!
Helge
