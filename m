Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FC090AE1F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 14:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B9810E39A;
	Mon, 17 Jun 2024 12:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="typiv+Th";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB62A10E39A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 12:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1718628169; x=1719232969; i=deller@gmx.de;
 bh=yvd9o/Qkt3lo4YXw/psYYeivIy21uPHvOst4VD1kGNE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=typiv+ThXbjT/2Dz7upgnb6Hn74s5h62xlPKAmEegpA33Ih8g+meTJhVn6k+PA2P
 GMe2nOyucnuLVCkM6bA/pFoiQ1IO3A6ToYSrXkJ9r11RzKFQTN4Faucrwr9jFISb9
 V92JZcQ9zrxVGoumqxb61n7K4O4cEdzaEUP9iHEQpQjK1f6Xvg3L/PVJ3srHnSqEg
 YF+y1oC+k6FGaTQrqwXdtQzWQrEH81t4P6RIytz0gdPmENUJRMKERBQuuK1tqfI7S
 sjGOzUhkHb50eP97/SPdn+/mhYNo9bFw/CHtTqPMcSBqh5Xq3sMT1T3D1n5C+pAMI
 9C7CEcKu7pN3eXjL+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([83.135.217.92]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mzyyk-1sYFoN0Fde-011su5; Mon, 17
 Jun 2024 14:42:49 +0200
Message-ID: <60216bc6-cde3-4927-81a1-ec808f5ba4d3@gmx.de>
Date: Mon, 17 Jun 2024 14:42:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: vesafb: Detect VGA compatibility from screen
 info's VESA attributes
To: Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org,
 javierm@redhat.com, hpa@zytor.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
References: <20240617110725.23330-1-tzimmermann@suse.de>
 <f42169dc-ebcd-4df9-8119-3dbac28746de@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <f42169dc-ebcd-4df9-8119-3dbac28746de@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:X4VJogwKxbmJ3Lib0sd/Qlz26/uPGKH25L9BYglWneHSPrkX8of
 0L2JPE3HybLh9OQj77RWNwAR2mNRmOXD17LOKXHf0w2XkrWgJnpj23K+3u9jlVoW+RRYu34
 kUl1+zEFv2ZpFuTbnA2ATEl2Sg4PGwOut2UarErYMv4iWKGEMPtzX5uTEehPKCyl2obxOko
 GmoReheyCdj2MHvUGJDSQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ae57VLU5580=;C5zWINxEcmkdkeePxv16mjMFp6i
 vbBvBw8TQxmbbEqOhOrK0gp05SByMLAwO2ORijZr2nQ0J2UmIx+WhlTMVaXetF2EfSFp/btTC
 bsl43pmaEov9e+R17E/1U9D5EsjA5A/Xcxd4RyX6yfvYTrHwhDvcqIJFRvajYPyxlJSzBNX4e
 AQF9UMxQk2If6iLygAHjZq8r8X1G2A/eoTcnA+yFYQ2uRo0UIj01XYL8liqW7dqAIzTvCSNEC
 bbFkXg6J/pK5oInEGkLWL3Jqp1vXNXtTFhY4yPK2FE0CLi5+pGDyMMD6sxc22geu/3Qz2lH4X
 hLG25741qdBv0q2hzweepx7iQ7aWYaLgXMwHVCguwagdzoumjaQuS4Bk4VnaRnqkZ1lCNYt91
 Tg7pb8P4TLDKa44vHjoaI1BV9Jb0KLz2viPYJybPRPIdX3h59XjAmup9HLYP7pEj/IZ+MZozj
 pvZ0wTzI+cyHMKK+Ah6ngX9aOd4r08Xu/5bnjx5m7/7/NTfo32lbSvjZcUz2tWkSDnC1JyzS/
 XTzC7MrLkCue6YDt+VsPJtjQOoc3nf0IWJlJ5OOFtwOBqqR0nP8I+LYl4jsFe9Ued3E45sonY
 hzLCGPwfF7jN59Vktv+MtQIl+19yWSGDnzy8Tb7mFU6nXi1TEjND3fKfIXVjZs+cbWYc2Hxdr
 Twdr3rwGmHGkIiLl+d/Zx77abwfnQH+QJQOaJpBQLjwhBmZ7sOpZcAJOPbdBe6M5SY14YCtte
 UFLWeHhANpvGCOFTpQK686PInbJUJnH93385QOLNBCrzb9X7uZLjvxuAev9ncC2Xu9o4BSAVt
 BGIrzwvqOqwLXkX/QjCCD+9lItLhT7sV/Ue0ChuJTx7do=
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

On 6/17/24 13:30, Thomas Zimmermann wrote:
>
>
> Am 17.06.24 um 13:06 schrieb Thomas Zimmermann:
>> Test the vesa_attributes field in struct screen_info for compatibility
>> with VGA hardware. Vesafb currently tests bit 1 in screen_info's
>> capabilities field, It sets the framebuffer address size and is
>> unrelated to VGA.
>>
>> Section 4.4 of the Vesa VBE 2.0 specifications defines that bit 5 in
>> the mode's attributes field signals VGA compatibility. The mode is
>> compatible with VGA hardware if the bit is clear. In that case, the
>> driver can access VGA state of the VBE's underlying hardware. The
>> vesafb driver uses this feature to program the color LUT in palette
>> modes. Without, colors might be incorrect.
>>
>> The problem got introduced in commit 89ec4c238e7a ("[PATCH] vesafb: Fix
>> incorrect logo colors in x86_64"). It incorrectly stores the mode
>> attributes in the screen_info's capabilities field and updates vesafb
>> accordingly. Later, commit 5e8ddcbe8692 ("Video mode probing support fo=
r
>> the new x86 setup code") fixed the screen_info, but did not update vesa=
fb.
>> Color output still tends to work, because bit 1 in capabilities is
>> usually 0.
>>
>> Besides fixing the bug in vesafb, this commit introduces a helper that
>> reads the correct bit from screen_info.
>>
>> v2:
>> - clarify comment on non-VGA modes (Helge)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: 5e8ddcbe8692 ("Video mode probing support for the new x86 setup =
code")
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> Cc: <stable@vger.kernel.org> # v2.6.23+
>> ---
>> =C2=A0 drivers/video/fbdev/vesafb.c |=C2=A0 2 +-
>> =C2=A0 include/linux/screen_info.h=C2=A0 | 10 ++++++++++
>> =C2=A0 2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.=
c
>> index 8ab64ae4cad3e..5a161750a3aee 100644
>> --- a/drivers/video/fbdev/vesafb.c
>> +++ b/drivers/video/fbdev/vesafb.c
>> @@ -271,7 +271,7 @@ static int vesafb_probe(struct platform_device *dev=
)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (si->orig_video_isVGA !=3D VIDEO_TYPE=
_VLFB)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>> -=C2=A0=C2=A0=C2=A0 vga_compat =3D (si->capabilities & 2) ? 0 : 1;
>> +=C2=A0=C2=A0=C2=A0 vga_compat =3D !__screen_info_vbe_mode_nonvga(si);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vesafb_fix.smem_start =3D si->lfb_base;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vesafb_defined.bits_per_pixel =3D si->lf=
b_depth;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (15 =3D=3D vesafb_defined.bits_per_pi=
xel)
>> diff --git a/include/linux/screen_info.h b/include/linux/screen_info.h
>> index 75303c126285a..d21f8e4e9f4a4 100644
>> --- a/include/linux/screen_info.h
>> +++ b/include/linux/screen_info.h
>> @@ -49,6 +49,16 @@ static inline u64 __screen_info_lfb_size(const struc=
t screen_info *si, unsigned
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return lfb_size;
>> =C2=A0 }
>> +static inline bool __screen_info_vbe_mode_nonvga(const struct screen_i=
nfo *si)
>> +{
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * VESA modes typically run on VGA hardware. S=
et bit 5 signal that this
>
> 'signals'

I've fixed this up in your patch and applied it to the fbdev git tree.
No need to send new patch...

Thanks!
Helge
