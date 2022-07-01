Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5251A563AD2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 22:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0352A14BECF;
	Fri,  1 Jul 2022 20:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD8914BECF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 20:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656706415;
 bh=IDGeeU+OCpJgNkbxdn4+n3cEveAvz/Yrwi9U+ZgIPzE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ZaLSJnANJZbhCUkaE1bO4YnVbxIBQG11pV6Vc0kJrb5lzN6SN0IceTtX7u7r3jaFC
 nCCgZClIlr7DIEtbgefAkXDIFR0WbHHacHXd0TW8ZsoKo9rBzDZgpcdjZxQnEAtW3D
 svZjE0Rkn3AVzgrEXzT3WZZ1zkLdIlnwcFMVnd+Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.182.192]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3lY1-1o6XwC17f1-000vsl; Fri, 01
 Jul 2022 22:13:35 +0200
Message-ID: <695b55ec-1118-bb1f-a630-8474059ccb81@gmx.de>
Date: Fri, 1 Jul 2022 22:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] fbcon: Fix up user-provided virtual screen size
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-3-deller@gmx.de>
 <CAMuHMdXJRBywf+h_u1jgA6X7hLSByDDwSkskff47a0BHfd93iA@mail.gmail.com>
 <0c418b7d-474a-3f93-a1fb-2f13c4d19941@gmx.de>
 <CAMuHMdUoMJ6CmiKDh4MW_b-7uoxEF+H6QimsA7SfcE5kjo17vw@mail.gmail.com>
 <d57655b2-44d1-4083-c4e9-ef4f004f2b64@gmx.de>
 <CAMuHMdXk9Kz4-pv7-M9tufj-pruhOZWw_b51fegkr2JSqzL65g@mail.gmail.com>
 <cae3dc86-8156-eef5-1af4-b16cb2a42849@gmx.de>
 <CAMuHMdViqMgpiB2a-cLt1viVMgGbBz_Q=youNsWdLPYxcXxFpA@mail.gmail.com>
 <4580aa35-5a34-0d81-56d1-1f10218375d2@gmx.de>
 <CAMuHMdV_8+Cp=BCWhADQ-2B9o3sk6GSdmxxVLLiAnWV-Nwncug@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdV_8+Cp=BCWhADQ-2B9o3sk6GSdmxxVLLiAnWV-Nwncug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wNGzHrE1pBHovSvZnSY4QJpAwfV6gXFT4aWq7GdRRW1MnIkGWnR
 wUvbHXmkoFSZKCXXkl4UJkNIbm7TSsMJhonbS0RINlMM4hFGFeIxZiMr5Sn0tqtxfbRT6lS
 ayRZh+6YK+lVEkhMtTsA9CcNuz/8SfXczUpsEBZaCbR3zz9y7VuvMkgx94k7+XMwFUdQ5yk
 3cr1tqKk7UjXDroo4StSQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zJ9UIdDKMTo=:tTzWDExCSTbxhR3xKx/tfm
 30I/FG/H7Iu8JQ4osAxGCDCJ7GRfLiS/vF5ZjgY2nN+oYCXIbrSZX5NN87fIDjGNK+dRgWxAP
 UA04X8S01AwEl5U9G4oAN26eT96L7nva1cWwAgaW8hyQOZh+iDSfKr5oGxveYdf/N5/7VaE9b
 eIdy+UTYI+s1YFCgol0ePXVYjcX/AmxDK0t8d/L3XocOYQZBbMcgk21h01WEMnmKRY+ZsEjra
 V6Huq3GHz6H1ljDkY6pGxfFRDzqo0UZWSN1Byly2B7XZQFewM1BQRekkI+x9DKaNQvWkkaabw
 /a62A3Zmasit++glJeYChfEfymV9B4pYLm5rjPlQ6+s2Z9c0yXlD3ttBT0spGtW8aFraaR6nk
 I4DFc9rJGkHgka2GpCzh9TFXHD27WVAN+erdt/eamMI3BgrTTB67QWFAHhdhmEC0IH9lYmvz1
 Cxe5l4yC6PQUv3pc+pgSEJCK2ijm8NAfpSUaDny7rZICsnShEOsl0odGJwKxpM16RSiXdYCTp
 HX3fCQneROp4aRF6M+QX1akt1N/36gTQGX7U3W9MOYCQPlDWoSfbdXdpo9B1LgSoigdNHE1wn
 TebA/pkH4E0yZwafpPbqDtvk6DumuepfFiCyONT9hyP8dCtmsZKoJeskKBlkguDa9QbmL6gj8
 CMLi3U08VHf+AZX4CIEunNVo1J1lMJ/HVAPYJ+ftbC24N9GMKNp5641Cv43TQWhxACsRS0tp5
 /XW/6khtTyOxw3sOQPIyd9rufhRDuULhq7zwSYy02xtY7g9tN8yvC/e555ums4dBD4mZ03MG4
 oEDLaTY/BSXTFilkn1BAQBWv9bSEz/i9lI6MrxEVtX1DM6nZ/4u9foXy0fXa1VmsoXLPz9TlD
 EDVIVQcVdaQzRnmFfCaIccx2Y4EBra3sbI4AaMuHuWHTxO+i/SX/9VQw7HvUzdwUOgEyD9ahF
 5wQIBOlodVE7MErc8zxumt3DHaA0DON61dC2iTCFxzpTdmGO/JmbpLMoZ+UEmp6MhcH4gNHgV
 OPQD9S5M7AeIuDkjXn/zpShC98D6cEyawGmCFOeqF0A6nSIcRoOiBouI6t7GY97EdybsknZMV
 t/gbLHzcTO1qjI2+kNvGHf7IXHpljNjqQ2zlUd56ytwZGCiI3ZONq6zgw==
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

On 7/1/22 16:52, Geert Uytterhoeven wrote:
> Hi Helge,
>
> On Fri, Jul 1, 2022 at 11:30 AM Helge Deller <deller@gmx.de> wrote:
>> On 7/1/22 09:28, Geert Uytterhoeven wrote:
>>> On Thu, Jun 30, 2022 at 10:10 PM Helge Deller <deller@gmx.de> wrote:
>>>> On 6/30/22 22:00, Geert Uytterhoeven wrote:
>>>>> On Thu, Jun 30, 2022 at 9:46 PM Helge Deller <deller@gmx.de> wrote:
>>>>>> On 6/30/22 21:36, Geert Uytterhoeven wrote:
>>>>>>> On Thu, Jun 30, 2022 at 9:31 PM Helge Deller <deller@gmx.de> wrote=
:
>>>>>>>> On 6/30/22 21:00, Geert Uytterhoeven wrote:
>>>>>>>>> On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wr=
ote:
>>>>>>>>>> The virtual screen size can't be smaller than the physical scre=
en size.
>>>>>>>>>> Based on the general rule that we round up user-provided input =
if
>>>>>>>>>> neccessary, adjust the virtual screen size as well if needed.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>>>>>>> Cc: stable@vger.kernel.org # v5.4+
>>>>>>>>>
>>>>>>>>> Thanks for your patch!
>>>>>>>>>
>>>>>>>>>> --- a/drivers/video/fbdev/core/fbmem.c
>>>>>>>>>> +++ b/drivers/video/fbdev/core/fbmem.c
>>>>>>>>>> @@ -1106,6 +1106,11 @@ static long do_fb_ioctl(struct fb_info *=
info, unsigned int cmd,
>>>>>>>>>>                         return -EFAULT;
>>>>>>>>>>                 console_lock();
>>>>>>>>>>                 lock_fb_info(info);
>>>>>>>>>> +               /* adjust virtual screen size if user missed it=
 */
>>>>>>>>>> +               if (var.xres_virtual < var.xres)
>>>>>>>>>> +                       var.xres_virtual =3D var.xres;
>>>>>>>>>> +               if (var.yres_virtual < var.yres)
>>>>>>>>>> +                       var.yres_virtual =3D var.yres;
>>>>>>>>>>                 ret =3D fb_set_var(info, &var);
>>>>>>>>>>                 if (!ret)
>>>>>>>>>>                         fbcon_update_vcs(info, var.activate & F=
B_ACTIVATE_ALL);
>>>>>>>>>
>>>>>>>>> Given "[PATCH 4/5] fbmem: Prevent invalid virtual screen sizes i=
n
>>>>>>>>> fb_set_var", I don't think we need this patch.
>>>>>>>>
>>>>>>>> We do.
>>>>>>>
>>>>>>> Why? It will be caught by [PATCH 4/5].
>>>>>>
>>>>>> Right, it will be caught by patch #4.
>>>>>> But if you drop this part, then everytime a user runs
>>>>>>         fbset -xres 800 -yres 600 -xvres 200
>>>>>> users will get the KERNEL BUG WARNING (from patch #4) including
>>>>>> a kernel backtrace in their syslogs.
>>>>>
>>>>> No, they will only see that warning if they are using a broken fbdev
>>>>> driver that implements .fb_check_var(), but fails to validate or
>>>>> update the passed geometry.
>>>>
>>>> IMHO this argument is mood.
>>>> That way you put pressure on and need such simple code in
>>>> each single driver to fix it up, instead of cleaning it up at a centr=
al
>>>> place.
>>>
>>> Most hardware has restrictions on resolution (e.g. xres must be a
>>> multiple of N), so the driver has to round up the resolution to make
>>> it fit.  And after that the driver has to validate and update the
>>> virtual resolution again anyway...
>>>
>>> If a driver does not support changing the video mode, it can leave
>>> out the .fb_check_var() and .fb_set_par() callbacks, so the fbdev
>>> core will ignore the userspace-supplied parameters, and reinstate
>>> the single supported mode. See e.g. "[PATCH] drm/fb-helper:
>>> Remove helpers to change frame buffer config"
>>> (https://lore.kernel.org/all/20220629105658.1373770-1-geert@linux-m68k=
.org).
>>
>> I implemented all of your suggested changes - from this mail and the ot=
hers.
>> I've committed a new testing tree to the fbcon-fix-testing branch at:
>> https://github.com/hdeller/linux/tree/fbcon-fix-testing
>> The diff is here:
>> https://github.com/torvalds/linux/compare/master...hdeller:linux:fbcon-=
fix-testing
>>
>> Although your idea is good since we now would find issues in the driver=
s,
>> I don't think we want to commit it, since the testcase from
>> the bug report then immediately crashes the kernel - see below.
>
> That is expected behavior with panic_on_warn?

Oh well. You're right!
The kernel config had panic_on_warn enabled, which I didn't noticed.
I disabled that option and now it works:

[  147.430332][ T3171] WARNING: CPU: 0 PID: 3171 at drivers/video/fbdev/co=
re/fbmem.c:1025 fb_set_var.cold+0x83/0x1bc
....
[  147.431126][ T3171] ---[ end trace 0000000000000000 ]---
[  147.431132][ T3171] fbcon: Fix up invalid yres 0 for bochs-drmdrmfb

> The right fix is to fix the broken .fb_check_var() implementation.

Yep.
I'll send this patch series now.

Helge
