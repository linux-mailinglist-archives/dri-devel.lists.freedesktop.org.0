Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02365622EC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6403112A953;
	Thu, 30 Jun 2022 19:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72F712A960
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656616622;
 bh=7gtU+evKtCrce+u2ndkJeF5V9ZUk6lDYiPcCyt1McJU=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=HByKSqe+13SDzPcTpOwDfbElstCddKgEKWhm/8w983usHpMbdb1apJAS6WTLfIxy/
 UG9Xi6LWzbM2Mkm+u15RS95wXOtYSYr5pQmt8Ka+HfP4lswRQgKhNn8++6UHyDXTqi
 hCxf7nJzwt30AL31t9MtMYuRLVS9YOLiO5fb1syk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.136.11]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLQxN-1oOnWf1215-00ISVs; Thu, 30
 Jun 2022 21:17:02 +0200
Message-ID: <1ba5f6d6-1c31-a8fb-867b-e2a7fda7da56@gmx.de>
Date: Thu, 30 Jun 2022 21:16:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/5] fbmem: Prevent invalid virtual screen sizes in
 fb_set_var()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-5-deller@gmx.de>
 <CAMuHMdVJ0PsDyTdGoOHPOKdaR7AffG2FpFmw6fxoNdXx9y-J4A@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdVJ0PsDyTdGoOHPOKdaR7AffG2FpFmw6fxoNdXx9y-J4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cIpqSG96tsRX2oygHV0kkQvULG0rk5hxU/laT11Y7SNmhovZwF0
 h8Ym10wVfZR/BmSIMoxEOSq6mp485GtwEUsd1CilIouKeo0EVzgEeoewl/Tpp+dordVuPr2
 Wpe2pzawmSQCBNTDP6tebWe+GLvevdK2T3f49V7LDNb6azID6tx/KqmAtQ3gMwGvk1mVJHW
 EpDdwqdH3l+hyEtQXXihA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QwOc/WLjIH0=:JCK9+hAh9TgrJPSbHxxNQv
 NbhIR4rTbJ1bSei2IBEunwfsAIuwT5Iil4yabekxIQzj/m/F0u7PoRXPWh4Q4y9rLWDQVdRIf
 VZXemU+uQZ/+IhYEDa1YrC5taYHVyKG41+JaT0ycPq5Sp/BVYE0MhE82A5yCDRfeNeE75xsSA
 GTFqBYIhJ5pZ4PvFKBe9/zEnSqPX4lxYdtU1w7cAUKPVU7LhCw520aiEYHu6I5ReEyMrrvvJW
 i2vdYNEM7eZeasfLlQR8CWtF0aWnGzOjV3I9+7vtFSPziXN0efb2t38cuu1F4Fn7uJAGwr6kZ
 c+Ms3pA4q3/yQ7mhlR9nZCjbV3ujdNt4lDX7pPPkx+EP+ICrE+DDdaBU9OcVf8eTUOJYf0X0T
 0zoLHpQhRlAwfug400vj0PY9VbcuVWqspsCtySg9P9NJq7hnbIIkqhG1IzEn/j+W4AA/p2/TM
 tn0F/O8pFcIP8OyEI/e4VyOYlPj0mJLp3hHUZ43cQwQaIZ8q1zW4iJNGXRMhFOBsKsIDPG6/r
 xIlH3HW0povs+r7n1onJj2CWtslwEmZuYuTsduzEpV27xilYDpE+zdSVAeDuAlAUKK0BS/fQS
 UPtGbN3odZyxHz1MpMaRO3gTeRGE5JyOAYFVagdeWoY9b5/WV/V7Q51EF1PD2gdhR5OnN1yp0
 EmPXPvS66z8JNGWoGULAxvfxOH+/fBlRFcwROSUXbFyDhZ2ggm8p/vlAXM/utyZ9M/++ofMoD
 ugZhYXo4rniI602DwzSprhx/+RQqJfbKcYgipGOMqJUJZ+yxwnDv77v6nT8A1WMLuHpy3Khtq
 dKRem0JFg3rmvPl8u6fnz1QjkCEoMu4XF4G77lUD4HJauEjWbm2sGb5bkvo8qQq4xnL+Afrc6
 kDdkdiPNPnQGzmQ76SjzovwkFHAfKHEji7SueDZH8AJoseWRNUl+HgbEO+g3I9QjqKlhuWnpw
 ea99vn3CHpXtieaXooiG5+BKcfSdGgia8+CBvgP78kXspTjQkRaVgPwZLM7MSpHRR3PkbUr/W
 HWBUGrdfx5nsMIOPeJEV+NQh1f0ZYwxdNTeAvQ9RFB+ed0EERpewOMLD49WwVk4JMRoKSmj3M
 I+7h5t0CKeUi9gYjoFWr6E8+iTmWwjcBGoNPRki4ibAmoywVcXaRKadsg==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/30/22 21:11, Geert Uytterhoeven wrote:
> Hi Helge,
>
> On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wrote:
>> Prevent that drivers configure a virtual screen resolution smaller than
>> the physical screen resolution.  This is important, because otherwise w=
e
>> may access memory outside of the graphics memory area.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: stable@vger.kernel.org # v5.4+
>
> Thanks for your patch!
>
>> --- a/drivers/video/fbdev/core/fbmem.c
>> +++ b/drivers/video/fbdev/core/fbmem.c
>> @@ -1006,6 +1006,12 @@ fb_set_var(struct fb_info *info, struct fb_var_s=
creeninfo *var)
>>         if (var->xres < 8 || var->yres < 8)
>>                 return -EINVAL;
>>
>> +       /* make sure virtual resolution >=3D physical resolution */
>> +       if (WARN_ON(var->xres_virtual < var->xres))
>> +               var->xres_virtual =3D var->xres;
>> +       if (WARN_ON(var->yres_virtual < var->yres))
>> +               var->yres_virtual =3D var->yres;
>
> This should be moved below the call to info->fbops->fb_check_var(),
> so the WARN_ON() catches buggy fbdev drivers, not userspace fuzzers.

Yes, makes sense.

THX,
Helge


>> +
>>         /* Too huge resolution causes multiplication overflow. */
>>         if (check_mul_overflow(var->xres, var->yres, &unused) ||
>>             check_mul_overflow(var->xres_virtual, var->yres_virtual, &u=
nused))
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m=
68k.org
>
> In personal conversations with technical people, I call myself a hacker.=
 But
> when I'm talking to journalists I just say "programmer" or something lik=
e that.
>                                 -- Linus Torvalds

