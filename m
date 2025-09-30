Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B25AABAE904
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 22:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C29810E639;
	Tue, 30 Sep 2025 20:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="UWRGoznC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4CC10E63D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759265184; x=1759869984; i=deller@gmx.de;
 bh=gQKflzixSnOtPXH+ct3ATJr3ZXa8C8OGFHZcF8wvCJ4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=UWRGoznCnD2QpDmle4NUk7OyzirSDf0GwOjayG+46PO+Ec6eA8b5vRRJxf+B7Nd6
 TjLB+55Yb5KG4SWOaGQs6ekNmdJGPB/qzJdGO3ZtrRWFC1RuxgCwvdvLMr2g7pC6b
 BfKTz82mBVpl/RuCUNiiB5tLj3tlSM90+zF/YfGVT6F/dpvytbbWGcrWBsZllVyLO
 d3lr/6o4Tv4ZMm6KeiozsVJQsWXwliO0eAIjjmxiKHXDr1qJqFv+izxwOeeU/kBK+
 9fA6la/g5pQbT3XcM79/Vz6BSUePkxQWtlChve4i+mopPgokwyqAZTIAIxvmoBnCh
 UclmAKPYCa0ChtrDSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.4]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7QxL-1uEPGf24Kb-012u59; Tue, 30
 Sep 2025 22:46:24 +0200
Message-ID: <cb00a5e2-6e50-4b01-bcd7-33eeae57ed63@gmx.de>
Date: Tue, 30 Sep 2025 22:46:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Add bounds checking in bit_putcs to fix
 vmalloc-out-of-bounds
To: Albin Babu Varghese <albinbabuvarghese20@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: syzbot+48b0652a95834717f190@syzkaller.appspotmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250927075010.119671-1-albinbabuvarghese20@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250927075010.119671-1-albinbabuvarghese20@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:awbi77DUKol55j8Y4aOnxjExESRkJY8agfRap8I4YZaZzj+d6pW
 S9MlvQo8keis4LzD7ICBAgEhNQmBFD5yJM0G1qHMT4Qt9hpDPK2Wh4Km/4JyH4kngEfkxlm
 8dtll9FdS+kAnJTRgnYsJtC2Mts3hS2vrXGWQcYscXfxq/ZHvBoW1B32q7QPR78sS3Cz4yF
 YzDPDeP40Y41GvHUnh2hg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:17/sBWtJ44o=;2oYajW2AbNhLeSpFoWbqt0d81Bu
 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
 GK7HVS0LCLoIYw==
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

On 9/27/25 09:50, Albin Babu Varghese wrote:
> KASAN reports vmalloc-out-of-bounds writes in sys_imageblit during conso=
le
> resize operations. The crash happens when bit_putcs renders characters
> outside the allocated framebuffer region.
>=20
> Call trace: vc_do_resize -> clear_selection -> invert_screen ->
> do_update_region -> fbcon_putcs -> bit_putcs -> sys_imageblit
>=20
> The console resize changes dimensions but bit_putcs doesn't validate tha=
t
> the character positions fit within the framebuffer before rendering.
> This causes writes past the allocated buffer in fb_imageblit functions.
>=20
> Fix by checking bounds before rendering:
> - Return if dy + height > yres (would write past bottom)
> - Break if dx + width > xres (would write past right edge)
>=20
> Reported-by: syzbot+48b0652a95834717f190@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D48b0652a95834717f190
> Tested-by: syzbot+48b0652a95834717f190@syzkaller.appspotmail.com
> Signed-off-by: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
> ---
>   drivers/video/fbdev/core/bitblit.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/co=
re/bitblit.c
> index f9475c14f733..4c732284384a 100644
> --- a/drivers/video/fbdev/core/bitblit.c
> +++ b/drivers/video/fbdev/core/bitblit.c
> @@ -160,6 +160,9 @@ static void bit_putcs(struct vc_data *vc, struct fb_=
info *info,
>   	image.height =3D vc->vc_font.height;
>   	image.depth =3D 1;
>  =20
> +	if (image.dy + image.height > info->var.yres)
> +		return;
> +

I wonder if the image.height value should be capped in this case,
instead of not rendering any chars at all?
Something like (untested!):

+	if (image.dy >=3D info->var.yres)
+		return;
+       image.height =3D min(image.height, info->var.yres - image.dy);


>   	if (attribute) {
>   		buf =3D kmalloc(cellsize, GFP_ATOMIC);
>   		if (!buf)
> @@ -173,6 +176,10 @@ static void bit_putcs(struct vc_data *vc, struct fb=
_info *info,
>   			cnt =3D count;
>  =20
>   		image.width =3D vc->vc_font.width * cnt;
> +
> +		if (image.dx + image.width > info->var.xres)
> +			break;
> +

same here.


>   		pitch =3D DIV_ROUND_UP(image.width, 8) + scan_align;
>   		pitch &=3D ~scan_align;
>   		size =3D pitch * image.height + buf_align;

