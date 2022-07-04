Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D7565BAC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E078A10E753;
	Mon,  4 Jul 2022 16:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFC410E028
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 08:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656923922;
 bh=EoWxwT9/rvJfVDYjeyx47WXlpm1gsKW1JIjaJJT/qjE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=PD2HDbTtdxKx5IO3J2W4rq70ZmKX06+77y6teurjlTQWNAqSpGZi9F3myHZHb9ghg
 Vye3XjL7Ff2BB+DcuInSb7O05YTghZZq+w7Vzv/CBOgeGzrmiKjNwYIOvCzeHuySFN
 xy6Mdtf8X9CNzyNMetxnkDaINeD9RUFOZfkGDxM8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.146.45]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRCK6-1nwGWc1ii4-00NB1B; Mon, 04
 Jul 2022 10:38:42 +0200
Message-ID: <2f534dd1-418d-7bc0-aca8-15d26fac4132@gmx.de>
Date: Mon, 4 Jul 2022 10:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/4] fbmem: Prevent invalid virtual screen sizes in
 fb_set_var()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220701202352.559808-1-deller@gmx.de>
 <20220701202352.559808-4-deller@gmx.de>
 <CAMuHMdUTwM+y+yi5ASY9hQLgJD-4pjtStGA9m82853LmbdywOA@mail.gmail.com>
 <YsGfdEO4lU+y2004@p100>
 <CAMuHMdULPGmK_K3QeyEpBbO5Dr9_WEszHXDGLzvdv7f3Y2O7vw@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdULPGmK_K3QeyEpBbO5Dr9_WEszHXDGLzvdv7f3Y2O7vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r+c1TAW8rAPitzEZceC5MtJZfhFBg2tkFiwcRpHMMd66AzQI5OL
 VRlsTXAiA5XljMa0h80xXoV3Dyf/DLAAxLeadaNWp7Wkn5uMIWN/ZCGZabwZ+6cQpQkg/lh
 XhKuLOU7TTed+60vcawrG+O1HJH8vifP+FMdZH0jB5gwmb+7Zk18x7V0kyDz4fyOuv8QSNA
 s2GCnDQ9XhLlIy47lNzkQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pJk3w8wI76o=:XwlYdtlKuGU4LKWzuBWh1w
 aF6EPFe47DIq2zXd8ZR5pEKJ8d2cyc6T0KNTHZNrJ72H0luGjbDWgeAEJC/yIdAxpF+5RpcLj
 n7LT1tmKWJofDDd2i4za0WUNzShPX7LTy0XodAVApQwemPoqlAUtCEV5u8A25ze4FHjxZKOg3
 VN7OpSh1EDO7FtCWdBRaYU8H5JX5hGJjTNldRSxJzZrwxGGeqf1J7BnHBtBh6+pRrJuXfXkJm
 kqQ7vOFCIuG0/SjGbjRvrNRDRDYNqBIyld45YV015YStLw/19Hp/VLqM36OQZl1Bc97YfiIPa
 VCyTxPDMG0jRr/OB9TBaw9RgsLZ+gZEjXYtGMfkvevgjP+x3/89Zfr4iEfbHY4ncvJbCF+3W8
 5Y2OMq7lkWQ66ZsqaN9J7+WJ+Pq0qYpodKA8NPGjmMSoATuqoOFL9HXNVsfH4VMMsWvRj3IRK
 6L2WxrLgDHwydKabIM6P6S8Wdys6h+RSLRsb5ML1W5Fsk6T4FGgN7TSdeq6zKPB1z3aeCNY8L
 YuXQ4UeofHXhklVBj6mILuV7Kq/kGcL9fCBXuOov/Obut0Dc+YghtvOGUhW0j7X6wicUBz0g6
 mmKfin+0d0dJ9VaC8yVrP9z+E+SrlxFCUy6yVno7Z0aVfd1bT8XOIp7IE66XAbcb2clXEfcYq
 /qIEoA7RMGo+FfXKhokLEyQ1eGILH868PvbWE+7rLk5ILrUiOHSGjdrmMvD7XFcRPYPKJ/eg5
 p8k7nqEM2DnoC2a0IIZ9hwzaul/OWg1BVS4JbxOwCWTe1oSRzgDnQetSwGlKYVuua6V7eCfPJ
 IRBdBF9dB9Odq+7Nuvb8YcO3HLo6qHUApGOSXWqgrUgmdIX++gH+jd3w8jinPPcoaCMBZdV2l
 Lz5qYbFjwxCZLjUVrzXyOKxui1cFLP5A2WCC+uYtAHT8FfBOJYp+VuDvY1bcOxG5CDS5+eIBi
 JdKrMYZTeaqHJl45xRsGsndgoDHYrX4X6xW/oOfyC1HmNfati9nbkr8fB3W+p1UL3iU3xq41/
 qQyqnwvGtW1v9Mnlduy4tIdEvdEmjRENWaYNK/Sarope0a1RHfkM/5LqXuPXCUZCJSLUGYL2b
 EDr1crdzjDBWIZE5Gy+ngAu8s8dC23Zi9GJ
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel & DRM developers,

could you please comment on the change below?


On 7/3/22 16:41, Geert Uytterhoeven wrote:
> Hi Helge,
>
> On Sun, Jul 3, 2022 at 3:54 PM Helge Deller <deller@gmx.de> wrote:
>> * Geert Uytterhoeven <geert@linux-m68k.org>:
>>>> --- a/drivers/video/fbdev/core/fbmem.c
>>>> +++ b/drivers/video/fbdev/core/fbmem.c
>>>> @@ -1016,6 +1016,18 @@ fb_set_var(struct fb_info *info, struct fb_var=
_screeninfo *var)
>>>>         if (ret)
>>>>                 return ret;
>>>>
>>>> +       /* make sure virtual resolution >=3D physical resolution */
>>>> +       if (WARN_ON(var->xres_virtual < var->xres)) {
>>>
>>> WARN_ON_ONCE()?
>>> This does mean we would miss two or more buggy drivers in a single sys=
tem.
>>>
>>>> +               pr_warn("fbcon: Fix up invalid xres %d for %s\n",
>>>
>>> xres_virtual?
>>>
>>>> +                       var->xres_virtual, info->fix.id);
>>>> +               var->xres_virtual =3D var->xres;
>>>
>>> I think it's better to not fix this up, but return -EINVAL instead.
>>> After all if we get here, we have a buggy driver that needs to be fixe=
d.
>>>
>>>> +       }
>>>> +       if (WARN_ON(var->yres_virtual < var->yres)) {
>>>> +               pr_warn("fbcon: Fix up invalid yres %d for %s\n",
>>>> +                       var->yres_virtual, info->fix.id);
>>>> +               var->yres_virtual =3D var->yres;
>>>> +       }
>>>
>>> Same for yres.
>>
>> Geert, thanks for your valuable feedback!
>>
>> In general I don't like for this case any of the WARN_ON* functions.
>> They don't provide any useful info for us, dumps unneccessarily the
>> stack backtrace and would annoy existing users.
>
> Without the stack trace, most people won't notice...
>
>> We know, that DRM drivers can't change the resolution. If we would leav=
e
>> in any kind of warning, all DRM users will ask back - and we don't have
>> a solution for them. It's also no regression, because it didn't worked
>> before either.
>
> The warning will only be triggered when the requested virtual
> resolution is smaller than the requested physical resolution.  As
> long as the requested virtual and physical resolution match what
> was returned by FBIOGET_VSCREENINFO before, the warning won't
> be triggered.  So in normal use cases, the user won't be impacted.
> Fuzzers will see the warning, but the kernel will no longer crash
> on invalid values.

Still, fuzzers will crash if they have panic_on_warn enabled, which
was the case for the reproducer I got.

>> But we want to detect fbdev drivers which behave badly - so we should
>> print that info with the driver name.
>>
>> Below is a new patch which addresses this. The search for drm drivers
>> looks somewhat hackish - maybe someone can propose a better approach?
>>
>> Thoughts?
>>
>> Helge
>>
>>
>> From 0f33e2a3730342ab85df372f80b4f61762fb1130 Mon Sep 17 00:00:00 2001
>> From: Helge Deller <deller@gmx.de>
>> Date: Wed, 29 Jun 2022 15:53:55 +0200
>> Subject: [PATCH] fbmem: Check virtual screen sizes in fb_set_var()
>>
>> Verify that the fbdev or drm driver correctly adjusted the virtual scre=
en
>> sizes. On failure report (in case of fbdev drivers) the failing driver.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: stable@vger.kernel.org # v5.4+
>>
>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/cor=
e/fbmem.c
>> index 160389365a36..9b75aa4405ee 100644
>> --- a/drivers/video/fbdev/core/fbmem.c
>> +++ b/drivers/video/fbdev/core/fbmem.c
>> @@ -1016,6 +1016,21 @@ fb_set_var(struct fb_info *info, struct fb_var_s=
creeninfo *var)
>>         if (ret)
>>                 return ret;
>>
>> +       /* verify that virtual resolution >=3D physical resolution */
>> +       if (var->xres_virtual < var->xres ||
>> +           var->yres_virtual < var->yres) {

This is the part I'd like to get feedback from DRM on:
Shall we leave that in, or drop it as Geert suggested?

>> +               /* drm drivers don't support mode changes yet. Do not r=
eport. */
>> +               if (strstr(info->fix.id, "drm"))
>> +                       return -ENOTSUPP;





>> +
>> +               pr_warn("WARNING: fbcon: Driver %s missed to adjust vir=
tual"
>> +                       " screen size (%dx%d vs. %dx%d)\n",
>> +                       info->fix.id,
>> +                       var->xres_virtual, var->yres_virtual,
>> +                       var->xres, var->yres);
>> +               return -EINVAL;
>> +       }
>> +
>>         if ((var->activate & FB_ACTIVATE_MASK) !=3D FB_ACTIVATE_NOW)
>>                 return 0;
>
> Hence I think there is no need for ignoring drm.

