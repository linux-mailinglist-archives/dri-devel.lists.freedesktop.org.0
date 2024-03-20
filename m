Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3F6880C74
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 08:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7F110E28B;
	Wed, 20 Mar 2024 07:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="dGTNLMij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52E710E28B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 07:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1710921382; x=1711526182; i=deller@gmx.de;
 bh=uvNvLuBszXgVYXZdSwPN8AD8tI3aDeN137XHcSipi7k=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=dGTNLMijWBCSnsnpKyu9jeH4t26aIHEqWZKWWz1Q5JjQVClXVKM8FOAECKL/S/63
 bOZ+ge2GuW8KuWyMbTG6K1Hg5uBOnspl4myc0wjtbp75swaN/C3hJJr3YsYiKFsXN
 zAcu7xOJwbY+W4ld31MmUlfU21B+lZMw9835g+yaxRd1Srf3fy2ldzZ1B62xdRpGz
 xWGjNLgxJfM6tXSzrJN1ZDlWSqKbv40zWpVT9ttSC44EqEDi7+C3Dc1jWPQLJ39Rz
 vHj+sJei3DVCjPrhskStU3oMgDs44vVfkGcenI6FahB2tMUwwqEyzy/thcFKTow6L
 rf+m7563E2IN4ohSzg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.145.175]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKhs-1rOA1c0WaY-00OmMw; Wed, 20
 Mar 2024 08:56:22 +0100
Message-ID: <53670007-edbc-4762-9e57-0b3c29220d9e@gmx.de>
Date: Wed, 20 Mar 2024 08:56:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: fbdev: au1200fb: replace deprecated strncpy with
 strscpy
Content-Language: en-US
To: Justin Stitt <justinstitt@google.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Kees Cook <keescook@chromium.org>
References: <20240318-strncpy-drivers-video-fbdev-au1200fb-c-v1-1-680802a9f10a@google.com>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240318-strncpy-drivers-video-fbdev-au1200fb-c-v1-1-680802a9f10a@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KVcYXRTYi2Yl5N9QohZQn/e0yOrgjT69zc3Q76tdh+qsSd+Y//N
 rBBJAWMM7rwJUzE3exqHGaxYi/aFQRZi4pws9yNsVwMzyt6spfwMjDvzniE7mUR39LexH2s
 LZ9GviBWFVbgL4lB/psgfP58G8YRR3IXjZ1nGQhyGukK0goqDFzrEkvRCi2kUAvHzKhARV1
 sqi6/2eLCK3f0FPOOwvqA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:icEX6fWXWvo=;z2Bz9nQdvbUGV/r49J5VgTvdJ38
 3dc52GR2rrmGYRXBG6b1E0EEM7X6Jq03onspRoFdX2TJZKZ19XDSq6kUTWMYRT8ndpN97qaRw
 P76jvans/XJ9ZQrHteLT8dGfzeIuoRN4c/t1OGgrQzODoNsnrjBq3k5huJJy6aN/OvZPbMnle
 Cb4gm3Z4E+i3iF9BGmvsi9uIzxuwQ12rZmq1ZXZO64/gD04X9ykkmFib6ThqcHoPFTP8iVkrg
 kW0svK3y6kCnJrLjSPUew3RwxrtZ/5grrQiNN/SUnwItQ7e59V1XM6cXGlyXoYePaUnpMdcF5
 /KzysVx9oYuVjcgOuD0XJ07QwS+vHUy/BmeDmrGrGuDuychPuXwqUQBT/3qxssIuAraYilXUv
 ZGI3zGPKv4ppRnVl4/STTAQ6dcvHV6WvaymYWrfhiXggmNNjVZW2iFJnWEyfjSqPNrMNGcIfw
 y8idPwOJlpIviD+4Hzsvi9qFMm8GDVrgw4PZK7cdiboPTW7A8Ibl4G2ic0bPXiy1EiG5r3wGl
 +O7xtwY8xPnpeL4EAAtLKDdAKqc3YelTkyZU8EsolrofMSYfOCqU/o088lhkmApg+Sq1yRsGQ
 F42047QvvoAox3UaYkiOxMR/yA6ryX6ENDcFx7/ghizBzLHpFaV8BVFwBEh+pNsemgu6Xiw9g
 Z22haWTtuApmH6PKgbJz5ZHJT0jjGI3Y/AXX98rZFcM82vxi4vAOILSHpK9nHJpjAIl0q8Vqn
 fxf3ooZ/e+ga90d4Eubk8PF7GgGX958/FSGEeWnK6WBMOlpTzVtAkXBsJ3H29BBYdGqNWpXSm
 luLTw+BTXcv9C5ztxNAhRrL0bm2WgO98hbPnv6MI0WrL4=
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

On 3/19/24 00:46, Justin Stitt wrote:
> strncpy() is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
>
> Let's use the new 2-argument strscpy() which guarantees NUL-termination
> on the destination buffer while also simplifying the syntax. Note that
> strscpy() will not NUL-pad the destination buffer like strncpy() does.
>
> However, the NUL-padding behavior of strncpy() is not required since
> fbdev is already NUL-allocated from au1200fb_drv_probe() ->
> frameuffer_alloc(), rendering any additional NUL-padding redundant.
> |	p =3D kzalloc(fb_info_size + size, GFP_KERNEL);
>
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#str=
ncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.=
html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: build-tested only.
>
> Found with: $ rg "strncpy\("
> ---
>   drivers/video/fbdev/au1200fb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200=
fb.c
> index 6f20efc663d7..e718fea63662 100644
> --- a/drivers/video/fbdev/au1200fb.c
> +++ b/drivers/video/fbdev/au1200fb.c
> @@ -1557,7 +1557,7 @@ static int au1200fb_init_fbinfo(struct au1200fb_de=
vice *fbdev)
>   		return ret;
>   	}
>
> -	strncpy(fbi->fix.id, "AU1200", sizeof(fbi->fix.id));
> +	strscpy(fbi->fix.id, "AU1200");

I wonder if you really build-tested this, as this driver is for the mips a=
rchitecture...
And I don't see a strscpy() function which takes just 2 arguments.
But I might be wrong....

Helge
