Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F559B1309A
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 18:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD9610E0F1;
	Sun, 27 Jul 2025 16:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="ZVGF4J2g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30DA10E16A
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 16:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1753633712; x=1754238512; i=deller@gmx.de;
 bh=pkLDT0HEsunX2btfz401SE7y2JBuE7M2u3LhGnMVqDw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ZVGF4J2g6XFJoNwVshZ5gG5PZ8fiyT/NonOCvP74vVQD7oPpO0CYQ39CARmdmiEo
 e6TQpBvj0Sj/XLMa4lQ13ZXEcrA5KxR8KL0yQ4MZLC6J2Yoq3SjPaawX18ItM7BOu
 fwA/eIZgCin1XzzsWKk0s2HgfVVEQB271OrbDXPrh74VyuQHwVrWyXMeWoTaRD+rP
 JEk8Ixq4sc27Uos1HbmaOd4/Z7mGwQjlX3+l5sSn/AWzUQzI97Or0uRmjmbdKfeJ4
 1AH+FvUfhWtbvD276qIi8p1T1qKSMmozGP4a2SxrlsJt7oBgpknzsHIhX2PU8f/9b
 QXTC5b5ffZBI7TeHzQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.22]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUowb-1v6hn726M5-00V1Kw; Sun, 27
 Jul 2025 18:28:32 +0200
Message-ID: <00dfd97d-892f-405e-b395-caf7e8e8f1e9@gmx.de>
Date: Sun, 27 Jul 2025 20:17:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: pm3fb: Fix potential divide by zero
To: Alex Guo <alexguo1023@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CAMuHMdW5wU1ForGOGD-+HDUu7wcnBx3jx911nLEqbJ71t4MBsg@mail.gmail.com>
 <20250611161207.4031677-1-alexguo1023@gmail.com>
 <CAMuHMdW=GyUHsfqtSD8iYaV_nRszEunaDMCoL6zWf5_bPS0T4Q@mail.gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CAMuHMdW=GyUHsfqtSD8iYaV_nRszEunaDMCoL6zWf5_bPS0T4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:e05JDAVMkyZ+FQ8bw/sOH11d+LSn4k+EZk0JAbBUOxdLsFr6grc
 bL5L72uooH7pgjg2RJwsF+ib3Slj+1hjNlq3ceyjA/AQECPn4m1EKJ+di8cpiCEZgP6DF3K
 MvzQ44c/oyvkOCEYvAYaqlIDxc+GLJi3hMSZvRjXr4qZrHEMIjU4LCmpAyGAXJkR9S/Wd4D
 w4gzxtnqK6rzY57oYxCQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nMzw6wrqWvo=;h1NOHVh/mmKRv5p/xOcKR4jgXAJ
 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
 C3qFFYoa7tQ==
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

Hi Alex,

On 6/12/25 11:29, Geert Uytterhoeven wrote:
> On Wed, 11 Jun 2025 at 18:12, Alex Guo <alexguo1023@gmail.com> wrote:
>>> On Sat, 7 Jun 2025 at 22:14, Alex Guo <alexguo1023@gmail.com> wrote:
>>>> variable var->pixclock can be set by user. In case it equals to
>>>>   zero, divide by zero would occur in pm3fb_check_var. Similar
>>>> crashes have happened in other fbdev drivers. There is no check
>>>> and modification on var->pixclock along the call chain to
>>>> pm3fb_check_var. So we fix this by checking whether 'pixclock'
>>>> is zero.
>>>>
>>>> Similar commit: commit 16844e58704 ("video: fbdev: tridentfb:
>>>> Error out if 'pixclock' equals zero")
>>>>
>>>> Signed-off-by: Alex Guo <alexguo1023@gmail.com>
>>>
>>> Thanks for your patch, which is now commit 59d1fc7b3e1ae9d4
>>> ("fbdev: pm3fb: fix potential divide by zero") in fbdev/for-next.
>>>
>>>> --- a/drivers/video/fbdev/pm3fb.c
>>>> +++ b/drivers/video/fbdev/pm3fb.c
>>>> @@ -998,6 +998,9 @@ static int pm3fb_check_var(struct fb_var_screenin=
fo *var, struct fb_info *info)
>>>>                  return -EINVAL;
>>>>          }
>>>>
>>>> +       if (!var->pixclock)
>>>> +               return -EINVAL;
>>>
>>> While this fixes the crash, this is correct behavior for an fbdev driv=
er.
>>> When a value is invalid, it should be rounded up to a valid value inst=
ead,
>>> if possible.
>>
>> Thanks for your confirmation and suggestions.
>>
>> I added this patch based on existing checks on var->pixclock in other d=
rivers, such as savagefb_check_var, nvidiafb_check_var, etc.
>> Are you suggesting that it is better to replace an invalid value (var->=
pixclock =3D=3D 0) with a default valid value, instead of returning -EINVA=
L?
>=20
> Indeed.
>=20
>> If so, could you advise what a suitable default value would be for this=
 case?
>=20
> The answer is hidden in the existing check below:
>=20
>>>> +
>>>>          if (PICOS2KHZ(var->pixclock) > PM3_MAX_PIXCLOCK) {
>>>>                  DPRINTK("pixclock too high (%ldKHz)\n",
>>>>                          PICOS2KHZ(var->pixclock));
>>>>                  return -EINVAL;
>>>>          }
>=20
> It can be replaced by:
>=20
>      if (var->pixclock <=3D KHZ2PICOS(PM3_MAX_PIXCLOCK))
>              var->pixclock =3D KHZ2PICOS(PM3_MAX_PIXCLOCK) + 1;
>=20
> The "+ 1" is needed because of rounding.

You sent a whole bunch of patches [1] which check pixclock against
zero, but you don't set the default value as Geert pointed out
above. Can you maybe revise your patches accordingly?

Helge

[1] https://patchwork.kernel.org/project/linux-fbdev/list/
