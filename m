Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F14C9EED4
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 13:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F5B10E77B;
	Wed,  3 Dec 2025 12:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.b="I0yQBePL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exactco.de (exactco.de [176.9.10.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343C610E672
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 10:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; 
 s=x;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To
 :From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G5PC1GgcsBr1SusxOcrCjwE1PUKvlIwT+TcY7jxNmHA=; b=I0yQBePLf7foRsrJ40ktKtKwQW
 Gev0ts5pzu5ISJb59HSXCd7B4hqqZ//L0atDHpMTKmkTBPrhKWSwkuveRvj55u2QjegwL2TTGB5Zo
 9QPI1L8/ahakEjB5GD2zo0MhtxfMyhpulpYXADUvTMsPjmZDJ8Tniq/HqrS9ju1LScGGfFMS8DvE9
 Xr04l9LGNkvyNCi8ZPgTszTAzvuur87PoSQaVxaTz9REZuhdx8eJSt5bdgxsgymCJkZ2+nCO/0Xww
 GLKW8mZ2q7SFsKRkxG5kIxXzgSZlar7P77jOjwf4FiLfGsFpNpPVTfpSIytA3knNekJlucSGt+Z4D
 PGyWq6IQ==;
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] drm/ast: Fix big-endian support
From: =?utf-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
In-Reply-To: <e0f4a33f-9d36-4b7b-a1f8-1acc7434969c@suse.de>
Date: Wed, 3 Dec 2025 11:14:26 +0100
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0D9D1FD3-F716-40E2-B412-BAEA990DF8C0@exactco.de>
References: <20251202.170626.2134482663677806825.rene@exactco.de>
 <e0f4a33f-9d36-4b7b-a1f8-1acc7434969c@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-Mailman-Approved-At: Wed, 03 Dec 2025 12:01:17 +0000
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

(Resend w/o HTML, sorry!)
Hi,

thank you for the review!

> On 3. Dec 2025, at 10:40, Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>=20
> Hi,
>=20
> thanks for the patch.
>=20
> Am 02.12.25 um 17:06 schrieb Ren=C3=A9 Rebe:
>> The Aspeed ast drm driver has the frame-buffer RGBX swapped on
>=20
> It is XRGB.

indeed.

>> big-endian RISC systems. Fix by enabling byte swapping for any
>> __BIG_ENDIAN config.
>=20
> Is this the RISC support that Linux famously shot down? :)

Linux shut down RISC? Or Linus the non existing big-endian RISCV? ;-)

> Anyway, I have another BE fix for PPC64, which I didn't take. I'd =
rather merge your fix with some changes.
>=20
> [1] =
https://lore.kernel.org/dri-devel/407388289.1798972.1760725035958.JavaMail=
.zimbra@raptorengineeringinc.com/
>=20
>>=20
>> Fixes: 12fec1405dd5 ("drm: Initial KMS driver for AST (ASpeed =
Technologies) 2000 series (v2)")
>=20
> I'd leave out the Fixes tag.  We never claimed that the drivers =
supports BE, so it's not really a fix.

Well, in practice this machines are broken for years, would probably be =
nice to finally get this to production datacenter running Power 9, =E2=80=A6=
 or the last SPARC users.

>> Signed-off-by: Ren=C3=A9 Rebe <rene@exactco.de>
>> ---
>> Tested on Oracle T4-1 running sparc64 T2/Linux.
>> ---
>>  drivers/gpu/drm/ast/ast_mode.c | 14 ++++++++++++++
>>  drivers/gpu/drm/ast/ast_reg.h  |  6 ++++++
>>  2 files changed, 20 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c =
b/drivers/gpu/drm/ast/ast_mode.c
>> index 30b011ed0a05..155ae35470d9 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -708,6 +708,20 @@ static void ast_crtc_helper_mode_set_nofb(struct =
drm_crtc *crtc)
>>   ast_set_dclk_reg(ast, adjusted_mode, vmode);
>>   ast_set_crtthd_reg(ast);
>>   ast_set_sync_reg(ast, adjusted_mode, vmode);
>> +
>> +#ifdef __BIG_ENDIAN
>> + /* Big-endian byte-swapping */
>> + switch (ast_crtc_state->format->format) {
>=20
> This function sets the display mode. But the color format can change =
per frame. So it's not the right place.

Ah.

> Then, we also have a cursor plane that always scans out in ARGB4444 =
format. How does this change interact with the cursor? AFAIU it should =
mix up the pixels if set to 32-bit BE.

The cursor was correct in X, though I tested w/ the mag driver (which I =
also fixed some more). I=E2=80=99ll try the modesetting driver, too.

> Therefore, I think we need to set the BE mode in each plane's atomic =
update before it updates the video memory. At [2], for the primary =
plane, it has to be located between the color-update code and the damage =
handling. At [3], for the cursor plane, it can be within the if-damage =
branch. The cursor update needs unconditional 16-but swapping.
>=20
> [2] =
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-1=
2-01-1/drivers/gpu/drm/ast/ast_mode.c?ref_type=3Dtags#L559
> [3] =
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-1=
2-01-1/drivers/gpu/drm/ast/ast_cursor.c?ref_type=3Dtags#L209

I was not considering buffers in different modes. Can there be different =
VRAM access of different formats with this simple driver? Because 16 and =
32-bit planes / buffers will not work concurrently with global =
byte-swapping at the same time, ...

>> + case DRM_FORMAT_RGB565:
>> + ast_set_index_reg_mask(ast, AST_IO_VGACRI, AST_IO_VGACRA2, 0x3f, =
0x40);
>> + break;
>> + case DRM_FORMAT_XRGB8888:
>> + ast_set_index_reg_mask(ast, AST_IO_VGACRI, AST_IO_VGACRA2, 0x3f, =
0x80);
>=20
> Where did you get these bits from? According to the docs I have, 0x80 =
enables BE swapping in general and 0x40 selects 16-bit vs 32-bit swaps. =
So the 16-bit case would rather be 0xc0. But I might be wrong, as the =
docs are vague.

=46rom the spec I found with Google, but I think you are indeed correct, =
I somehow missed that bit that day.

> Did you test 16-bit output?
>=20
>> + break;
>> + default:
>> + break;
>> + }
>> +#endif
>>  }
>>    static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
>> diff --git a/drivers/gpu/drm/ast/ast_reg.h =
b/drivers/gpu/drm/ast/ast_reg.h
>> index 30578e3b07e4..5c8c0fd2e229 100644
>> --- a/drivers/gpu/drm/ast/ast_reg.h
>> +++ b/drivers/gpu/drm/ast/ast_reg.h
>> @@ -75,4 +75,10 @@
>>  #define AST_IO_VGAIR1_R (0x5A)
>>  #define AST_IO_VGAIR1_VREFRESH BIT(3)
>>  +/*
>> + * PCI Control
>> + */
>> +
>=20
> No separate block please. Just put the define between  VGACRA1 and =
VGACRA3 above.
>=20
> Please also add constants for setting the bits:
>=20
> #define AST_IO_VGACRA2_BE_MODE        BIT(7)
> #define AST_IO_VGACRA2_BE_MODE_16    BIT(6)

Sure will update, I was just using the style already present with reg =
magic numbers all over the place :-/

Thanks!
Ren=C3=A9

> Best regards
> Thomas
>=20
>> +#define AST_IO_VGACRA2 (0xA2) /* PCI control & big-endian */
>> +
>>  #endif
>=20
> --=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG =
N=C3=BCrnberg)
>=20
>=20

--=20
https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 =
https://patreon.com/renerebe

