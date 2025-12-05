Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF131CAA3BE
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 11:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA8710E22E;
	Sat,  6 Dec 2025 10:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.b="lqSGvvKs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exactco.de (exactco.de [176.9.10.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AFD10EBA6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 19:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; 
 s=x;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To
 :From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6/COw37DCfQEvTYvlwNMhC/DONDQbiQoIRIia42GC0s=; b=lqSGvvKsVjVe/8lif/Z5eYNEUA
 3nLa7VvmmYr1zQ/8IgAyzjlqx15Fsv1lT/PH02LEjhsnLlNiYGmL+6a3Ysf8XKfoELtChtP1DOL7l
 t+OU23dVfZCp9KjFbZfzbyLxwA1GqVxVb/AiVqdeSfnGKuYPqH82WTSFKAbmGVbE9NczzMxJAmXlC
 yqET8ahnXRgZ4x0sRaSzPs9RYHAQYUzbr6DHUJ6kppHraxiR84D1kOknS4g9rllY08ksjlkkQFFbs
 SqIXQskQ2trGgPd0RhhniK+uKXqtDPJlUVgXPbRdC0OQRp+vByIEZJThVyxbiM18MRCGzY2nY0pXz
 lybHvnDQ==;
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] drm/ast: Fix big-endian support
From: =?utf-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
In-Reply-To: <9191ea89-81ce-4200-a356-39fa4a155062@suse.de>
Date: Fri, 5 Dec 2025 20:50:06 +0100
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Dave Airlie <airlied@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A0A92AB8-FA61-4AAC-96C9-00BE93E3F6D6@exactco.de>
References: <20251202.170626.2134482663677806825.rene@exactco.de>
 <e0f4a33f-9d36-4b7b-a1f8-1acc7434969c@suse.de>
 <20251205.161459.1654100040521559754.rene@exactco.de>
 <758090394.145092.1764959517083.JavaMail.zimbra@raptorengineeringinc.com>
 <9191ea89-81ce-4200-a356-39fa4a155062@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-Mailman-Approved-At: Sat, 06 Dec 2025 10:07:49 +0000
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

Hi,

> On 5. Dec 2025, at 20:46, Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>=20
> Hi
>=20
> Am 05.12.25 um 19:31 schrieb Timothy Pearson:
>>=20
>> ----- Original Message -----
>>> From: "Ren=C3=A9 Rebe" <rene@exactco.de>
>>> To: tzimmermann@suse.de
>>> Cc: "dri-devel" <dri-devel@lists.freedesktop.org>, "linux-kernel" =
<linux-kernel@vger.kernel.org>, "Dave Airlie"
>>> <airlied@redhat.com>, "Timothy Pearson" =
<tpearson@raptorengineering.com>
>>> Sent: Friday, December 5, 2025 9:14:59 AM
>>> Subject: Re: [PATCH] drm/ast: Fix big-endian support
>>> Hello Thomas,
>>>=20
>>> On Wed, 3 Dec 2025 10:40:17 +0100, Thomas Zimmermann =
<tzimmermann@suse.de>
>>> wrote:
>>>=20
>>>> [2]
>>>> =
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-1=
2-01-1/drivers/gpu/drm/ast/ast_mode.c?ref_type=3Dtags#L559
>>>> [3]
>>>> =
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-1=
2-01-1/drivers/gpu/drm/ast/ast_cursor.c?ref_type=3Dtags#L209
>>>>=20
>>>>> + case DRM_FORMAT_RGB565:
>>>>> + ast_set_index_reg_mask(ast, AST_IO_VGACRI, AST_IO_VGACRA2, 0x3f,
>>>>> 0x40);
>>>>> + break;
>>>>> + case DRM_FORMAT_XRGB8888
>>> While working on it I discovered that the Big-Endian byte-swapping
>>> bits do apparently not just-work on a newer AST2400 in our Power 8
>>> while my initial patch did work as tested with an AST2200 in the Sun
>>> T4-1 :-/
>=20
> In the upcoming v6.19-rc1, ast will support per-chip quirks. So we can =
control this by chip version, if necessary
>=20
>>>=20
>>> Maybe that is what Timothy meant with "This is due to a ppc64 =
hardware
>>> quirk, which when combined with a hardware design fault in the =
AST2500
>>> VGA controller results in a need to use software-based red-blue
>>> channel swapping." [1]
>>>=20
>>> Is there a way to simply specify the frame-buffer as BGRX8888? In a
>>> quick test the drm layer complaint about "not supported" and "no
>>> compatible format found"?
>> I've been all around that loop.  You can't do that -- the fb code has =
no idea how to drive such a framebuffer, and elsewhere in the kernel =
it's made clear that the GPU driver *must* provide a RGBX8888 linear =
framebuffer if the Linux fb code is going to be able to display a =
console.
>>=20
>> Does the Sun T4 CPU perform automatic byte swapping on PCI[e] data =
transactions?  That might be the difference; POWER performs the byte =
swapping, and since the ASpeed device is broken in BE mode we can't swap =
back by setting the BE register bit in the AST GPU hardware.
>>=20
>> Fun fact -- it'll sorta work on the framebuffer side, but we lose the =
entire control BAR in the process.  ASpeed seems OK with this, they just =
say something along the lines of "oh, BE is not supported despite our =
documentation" :facepalm:
>=20
> On the 2400-and-onwards models, ast could set =
drm_device.mode_config.quirk_addfb_prefer_host_byte_order. If set, the =
format lookup will select a different format on BE machines. [1] For =
example requesting XRGB8888 returns BGRX8888 instead. If ast later sees =
such a format in the atomic_update code, it could transparently swap =
bytes when writing out pixels to the video memory.  IIRC this works =
transparently to DRM clients and fbcon.  I think this would be the =
preferred way of fixing the issue.

Uff, I get better than nothing ;-)

> [1] =
https://elixir.bootlin.com/linux/v6.18/source/drivers/gpu/drm/drm_fourcc.c=
#L123
>=20
> For the pre-2400 chips, I suggest to fix this problem with the =
hardware byte swapping if possible. That seems like the correct =
approach.

I had re-done the code as you suggested, should I send a v2 as tested on =
the sparc64 t4-1 and we quirk later, non working chips or ppc64 later?

	Ren=C3=A9

> Best regards
> Thomas

--=20
https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 =
https://patreon.com/renerebe

