Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7152907ED1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 00:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F8D10EBD4;
	Thu, 13 Jun 2024 22:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="pR8TLr12";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036A410EBD4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 22:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1718317468; x=1718922268; i=deller@gmx.de;
 bh=KBB+55y/IC6fl5e3Z7unIgPDw0l/iJdwoMC5AOiOUGY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=pR8TLr12AfEFfIWVxFqHpD/90NqP1e+Is1Gd+WfTVVC437LgJ0FC9gKH1YW2gWb9
 Q9WXI5K5K7DU9c9XgEreHfU6cB3b334jZGRj3IrtjmLWOd4VxiJk9vx6Srw7tN6x9
 Mh7UNhUNCt0aSJFNBzXZ6jv1cu2fIKtFXcKZY1zccqnX0X+uEaCYzF6K32ts9dl22
 YLd+NbKIs4/Xm7MZL61hFqu9IV7adroyaYtuKMiChUI2mb/qFCrD1EhZ14abmaCoz
 vspEv3JTiPAGd89+rW9OOvEELtwa97qfFiUDW/A3V6E5thqQ/kSfKFzYAW3pbBkhM
 GxkD1a73ez2MvschSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([83.135.217.92]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5fMY-1sJWkw1Qa2-00A3Ud; Fri, 14
 Jun 2024 00:24:28 +0200
Message-ID: <64bbb753-ec26-41ca-a585-fb74ae9e854c@gmx.de>
Date: Fri, 14 Jun 2024 00:24:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: vesafb: Detect VGA compatibility from screen
 info's VESA attributes
To: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org, hpa@zytor.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
References: <20240613090240.7107-1-tzimmermann@suse.de>
 <5d8d2efe-45dd-4033-aaae-e7f923ef9e76@gmx.de>
 <87tthwqzq2.fsf@minerva.mail-host-address-is-not-set>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <87tthwqzq2.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TjMHWNSZZcAQQyk6VKxSPHrIpUpHj8lHp6rN7ELjRr34m9iSJl4
 +2DuZOCnbWB0DHkNGqzV5KTcnAV3Mp07TMvPO9m6yaj+aahiMI85Vq4ghBYhbWxHsRxgaTb
 zXaz3skuHXQO/GlRm5VG5cQwcT7ijfRpHk/N62QNtL2k5tSRoEW8Bs6w/6B/c2TQMrgKk/C
 N3xG6ip6qTwSjFasC5/Ug==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:spuUaHxCHPk=;2SjzIO9i4oxv8/LltaNQeSBccHq
 Hd+VCvLI3goo5W463P3U4N/fTsvgGgs3qCGPx2Jqv4g6V9tbAO92EXM8zq5/QTbbieAl1rk+c
 ERk1U+wivXbTBFlBfFR5Xb45mDKVU9BfLxhUVIae6jbOxEItYo8yHgp7G42CLSVx/HMnbNGEb
 6MLG/C2OIKAtUpWf4pZ0sXeX1CGGRd1NTZKUlYUAXugUskYtp9KXdSIezTivwmMVHXTR4Rm0x
 YWcvkZUlS2gHs5pSIV2avQevJg/O//q74SaHFgchO9DYpM3iLuto/2YhlQQyL3bvAUSHKV28p
 djg9y9f+gzAiQJbg19XsaCwBym+1bW91aaPiyM/cDus194ZIuKaWRCobSFvdG5SCMAyCWr2eS
 KDczFvnP9NWPx0c8zBBOnmQf6o08IJq6q9/rKFwd63XfuqS99K+S+cx+Cck1zq/2UU0dVUIsY
 irgz7sFBJweCnUcceYnPr1IZVb/ftThGINDTF0G62XvI5WbJF284r55K3xFpeQtxB+ia0tzG/
 s/EdmM0DaH7NbRBnfueVohnrydE84OuOBaQtnzc4okyuy1DAKrhLcP4NVnICwzvndRa/WMxEJ
 d0JufnUCrG5nuvZs8K9eXzzDhZMLVRPMNIAmeUCeyinF5/96qUM2XUiny5D39fbgxTVLl2wmG
 EshGE9HBei7I8xg5penkadqP4mL86F2wllH5FqAXeINla6RHiolSIvAl4fP8DwcxK+1okypry
 WU4ubxIBFShZgjKix4PUysZBiJ0ZRRjRXTcIYVEfMeFfju4RbULiIFBPr0Hrgb74VluVw1G9R
 9dtgDVyXnvTzUH1MgRLlLHieiHZx9U6ObPS2J7DZj2/nA=
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

On 6/13/24 23:50, Javier Martinez Canillas wrote:
> Helge Deller <deller@gmx.de> writes:
>
>> On 6/13/24 11:02, Thomas Zimmermann wrote:
>>> Test the vesa_attributes field in struct screen_info for compatibility
>>> with VGA hardware. Vesafb currently tests bit 1 in screen_info's
>>> capabilities field, It sets the framebuffer address size and is
>>> unrelated to VGA.
>>>
>>> Section 4.4 of the Vesa VBE 2.0 specifications defines that bit 5 in
>>> the mode's attributes field signals VGA compatibility. The mode is
>>> compatible with VGA hardware if the bit is clear. In that case, the
>>> driver can access VGA state of the VBE's underlying hardware. The
>>> vesafb driver uses this feature to program the color LUT in palette
>>> modes. Without, colors might be incorrect.
>>>
>>> The problem got introduced in commit 89ec4c238e7a ("[PATCH] vesafb: Fi=
x
>>> incorrect logo colors in x86_64"). It incorrectly stores the mode
>>> attributes in the screen_info's capabilities field and updates vesafb
>>> accordingly. Later, commit 5e8ddcbe8692 ("Video mode probing support f=
or
>>> the new x86 setup code") fixed the screen_info, but did not update ves=
afb.
>>> Color output still tends to work, because bit 1 in capabilities is
>>> usually 0.
>>>
>>> Besides fixing the bug in vesafb, this commit introduces a helper that
>>> reads the correct bit from screen_info.
>>
>> Nice catch, Thomas!
>>
>> But do we really need this additional helper?
>>
>>
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Fixes: 5e8ddcbe8692 ("Video mode probing support for the new x86 setup=
 code")
>>> Cc: <stable@vger.kernel.org> # v2.6.23+
>>
>>> ---
>>>    drivers/video/fbdev/vesafb.c | 2 +-
>>>    include/linux/screen_info.h  | 5 +++++
>>>    2 files changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb=
.c
>>> index 8ab64ae4cad3e..5a161750a3aee 100644
>>> --- a/drivers/video/fbdev/vesafb.c
>>> +++ b/drivers/video/fbdev/vesafb.c
>>> @@ -271,7 +271,7 @@ static int vesafb_probe(struct platform_device *de=
v)
>>>    	if (si->orig_video_isVGA !=3D VIDEO_TYPE_VLFB)
>>>    		return -ENODEV;
>>>
>>> -	vga_compat =3D (si->capabilities & 2) ? 0 : 1;
>>> +	vga_compat =3D !__screen_info_vbe_mode_nonvga(si);
>>
>> Instead maybe just this: ?
>>    +	/* mode is VGA-compatible if BIT 5 is _NOT_ set */
>>    +	vga_compat =3D (si->vesa_attributes & BIT(5)) =3D=3D 0;
>>
>> I suggest to make patch small, esp. if you ask for backport to v2.6.23+=
.
>>
>
> I prefer the helper. It's a static inline anyways and having it as a
> function makes it much easier to read / understand.

Really?

+static inline bool __screen_info_vbe_mode_nonvga(const struct screen_info=
 *si)
+{
+	return si->vesa_attributes & BIT(5); // VGA if _not_ set
+}

At least the double negation "!nonvga()" breaks my head and the "//" comme=
nt
should be converted to /*..*/ IMHO.

Helge
