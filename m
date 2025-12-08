Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B08CAE44C
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 23:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258D710E3FD;
	Mon,  8 Dec 2025 22:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="pdmoYckG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF72F10E2A8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 22:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1765231321; x=1765836121; i=deller@gmx.de;
 bh=bdPJi7GKHnwHdhS8FRUx+plvpbTsYQFJ9hNXkR5DyLQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=pdmoYckGEPppxP+hCFekonNW0x8ghjMT9fVw6MqPn7MN7coj3sPrUuHJMmsgMi7s
 ZIizcr/mRLt7zg7KPjEPyVLmyc6JLoZgo5Px6NJOFIcf8d9fPtDUg3bHRR5vchvo1
 UF9HQ4S41P+/9DiGnGcQtUWe389b4bDpQ7pYx81MAb/iOhjkDE5CeumMb3KPIdo/1
 we6iC0d/FFGiK0dC0snwmsPuqcUR8vCszL6lz7FwHGx9KvdYtorDh1AuuGMt7FLWZ
 2VioCfEHMGY1VFfgVAIAUFknXmnfTM3H7XdEpQKyGSx4o95xRw6kCxn0oltI+bgUk
 l3UDws1d9yYKOX22eg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.255]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McYCl-1w2t093jf3-00i8dy; Mon, 08
 Dec 2025 23:02:00 +0100
Message-ID: <dc2a9d7b-0495-4365-8353-b51dc0526b74@gmx.de>
Date: Mon, 8 Dec 2025 23:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riva/fbdev: fix divide error in nv3_arb()
To: Guangshuo Li <lgs201920130244@gmail.com>,
 Antonino Daplas <adaplas@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20251207072532.518547-1-lgs201920130244@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251207072532.518547-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dxqlLXJL8J3RzfMpLZv+vvGY1I9AUE3xF0muSuyE9Lf41DIIOSY
 G41aEP+Qg8qN7t3VLWOaI0k/6JVckwsx0T1ga797Xk+0EmdHwfnp1+7VhXwgUzp6OX3J0ey
 3uE7foE92HreBKTrEreoFOCdwdP21jsomMe6BbAv6JBAZ0NZsu3aYmiX6FYGbYTmGxBGtcy
 57QR3oxJ8M1zdigjHS0Lg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rR60tlFJr1g=;3QDzMlbYkU+G7uhU9eg2O5GtisW
 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
 CK4/cH5XNy4YO/x+UYX5gQgIKV++F
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

On 12/7/25 08:25, Guangshuo Li wrote:
> A userspace program can trigger the RIVA NV3 arbitration code by
> calling the FBIOPUT_VSCREENINFO ioctl on /dev/fb*. When doing so,
> the driver recomputes FIFO arbitration parameters in nv3_arb(), using
> state->mclk_khz (derived from the PRAMDAC MCLK PLL) as a divisor
> without validating it first.
>=20
> In a normal setup, state->mclk_khz is provided by the real hardware
> and is non-zero. However, an attacker can construct a malicious or
> misconfigured device (e.g. a crafted/emulated PCI device) that exposes
> a bogus PLL configuration, causing state->mclk_khz to become zero.
> Once nv3_get_param() calls nv3_arb(), the division by state->mclk_khz in
> the gns calculation causes a divide error and crashes the kernel.
>=20
> Fix this by checking whether state->mclk_khz is zero and bailing out bef=
ore doing the division.
>=20
> The following log reveals it:
>=20
> rivafb: setting virtual Y resolution to 2184
> divide error: 0000 [#1] PREEMPT SMP KASAN PTI
> CPU: 0 PID: 2187 Comm: syz-executor.0 Not tainted 5.18.0-rc1+ #1
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.0-5=
9-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
> RIP: 0010:nv3_arb drivers/video/fbdev/riva/riva_hw.c:439 [inline]
> RIP: 0010:nv3_get_param+0x3ab/0x13b0 drivers/video/fbdev/riva/riva_hw.c:=
546
> Code: c1 e8 03 42 0f b6 14 38 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 =
d2 0f 85 b7 0e 00 00 41 8b 46 18 01 d8 69 c0 40 42 0f 00 99 <41> f7 fc 48 =
63 c8 4c 89 e8 48 c1 e8 03 42 0f b6 14 38 4c 89 e8 83
> RSP: 0018:ffff888013b2f318 EFLAGS: 00010206
> RAX: 0000000001d905c0 RBX: 0000000000000016 RCX: 0000000000040000
> RDX: 0000000000000000 RSI: 0000000000000080 RDI: ffff888013b2f6f0
> RBP: 0000000000000002 R08: ffffffff82226288 R09: 0000000000000001
> R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000000
> R13: ffff888013b2f4d8 R14: ffff888013b2f6d8 R15: dffffc0000000000
> Call Trace:
>    nv3CalcArbitration.constprop.0+0x255/0x460 drivers/video/fbdev/riva/r=
iva_hw.c:603
>    nv3UpdateArbitrationSettings drivers/video/fbdev/riva/riva_hw.c:637 [=
inline]
>    CalcStateExt+0x447/0x1b90 drivers/video/fbdev/riva/riva_hw.c:1246
>    riva_load_video_mode+0x8a9/0xea0 drivers/video/fbdev/riva/fbdev.c:779
>    rivafb_set_par+0xc0/0x5f0 drivers/video/fbdev/riva/fbdev.c:1196

Doesn't it make sense to check mclk_khz (or the various variables which
lead to mclk_khz) in rivafb_set_par() or any of the other functions mentio=
ned
in this trace?
If in doubt, mclk_khz could be initialized to a sane value?

Helge


>    fb_set_var+0x604/0xeb0 drivers/video/fbdev/core/fbmem.c:1033
>    do_fb_ioctl+0x234/0x670 drivers/video/fbdev/core/fbmem.c:1109
>    fb_ioctl+0xdd/0x130 drivers/video/fbdev/core/fbmem.c:1188
>    __x64_sys_ioctl+0x122/0x190 fs/ioctl.c:856
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>   drivers/video/fbdev/riva/riva_hw.c | 3 +++
>   1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/video/fbdev/riva/riva_hw.c b/drivers/video/fbdev/ri=
va/riva_hw.c
> index 8b829b720064..d70c6c4d28e8 100644
> --- a/drivers/video/fbdev/riva/riva_hw.c
> +++ b/drivers/video/fbdev/riva/riva_hw.c
> @@ -436,6 +436,9 @@ static char nv3_arb(nv3_fifo_info * res_info, nv3_si=
m_state * state,  nv3_arb_in
>       vmisses =3D 2;
>       eburst_size =3D state->memory_width * 1;
>       mburst_size =3D 32;
> +	if (!state->mclk_khz)
> +		return (0);
> +
>       gns =3D 1000000 * (gmisses*state->mem_page_miss + state->mem_laten=
cy)/state->mclk_khz;
>       ainfo->by_gfacc =3D gns*ainfo->gdrain_rate/1000000;
>       ainfo->wcmocc =3D 0;

