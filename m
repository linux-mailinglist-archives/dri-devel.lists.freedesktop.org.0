Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4900560AE2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 22:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD6910F0DF;
	Wed, 29 Jun 2022 20:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0714B10F0F6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 20:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656533165;
 bh=9MAVZ3xrTPh8AYx1aq2x2X7367U1zqasYfzFWVMUtK4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=KMPHyOD8tPgLLDm6yc5kKly2pyRprbjItGEmRId2BPpuNSwXFP2gkZBsybTRcu+9R
 oCjm1iPojT1j/vwPcUV3dse7v1gZehTc7WxmaLuotSqcEEtHNhT9P7HAA9fT4Eh1Jp
 9mRTbD6li/tlCyiBiPojRYjw//jrEImNLpVvaJTE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.135.51]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4QwW-1nfb8V0T5y-011OCV; Wed, 29
 Jun 2022 22:06:05 +0200
Message-ID: <e0224c85-dc03-ad8f-85e7-51325899ac38@gmx.de>
Date: Wed, 29 Jun 2022 22:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 3/4] fbcon: Prevent that screen size is smaller than
 font size
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220626102853.124108-1-deller@gmx.de>
 <20220626102853.124108-4-deller@gmx.de>
 <CAMuHMdV5zLoQWi2qd9HpP65WEvCw_q3VTsZ0MnBV1t8xM7KFUw@mail.gmail.com>
 <f3b01426-1cd4-40b9-7dd7-0965c4c0611c@gmx.de>
 <CAMuHMdUz1OMe+opM2b=XyYpQc4ynCyamXGFTjkbnzMr3wFvb8g@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdUz1OMe+opM2b=XyYpQc4ynCyamXGFTjkbnzMr3wFvb8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CWqgo1+Ci9R/2f4bBXRRQjPy772oMPSOIaQ5xRgV9H3VneZh9eI
 ptHcT7GGl7y/SOAwiixJ51bzsGS/Rf+p3ckFp6Vilkk4rbQLuApJdbBnzGd8OmlFSE8UmSm
 jMyQBggULXMQ1y3Uebcn2QN81RySZKC7PdYCnMRVaHy7CBUfRFNwvu9B6eCZSCU7FRauCIQ
 iiYcTIkn3uBP+70Z3W+xw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lALLXqdfIiY=:u2lIIo0e/zXabzUSq0N5hx
 rh6vN7c0nvOQpkNfADI/Az5bdKE0ucs5tYPxmR5JrMEm6D1uQh8j7cMFaHvm8F2z5FPAwYrx6
 dW8kxOs8aBnpDtiD1vEa6CNJRNLtBAEm0NEKflVTUEV++jojZHJl1j85ZTrqMethOoVHYouJg
 fZbDmgGb2xFRv+1BWogpXXlmqorEIBFto5PfOY73viz46AJUkn+sEnF/2AXKdULax8dr+BV0A
 knLl1FRAu+2Chjffx3Phv6cYf76i7gMhYDq/XqBWjrrngbpHHo40YEyD0+A2kC9mZiS5+cMrR
 rd+1H6xiwtDSWyj5uS893D6jfLe0eFo8CG98gvN4BEUcQG7DwJj0ad/vzj30ReEhV6PjBKXMo
 YEr8O+pt8iNHB2YMB56L+6wGRH03Smq+JhxzHzz/bFQYNo6jz92Kk9wThqs9KbVBNJPhgymDt
 aVwa+ikTZbRl+ZmBsI/CFaAXHb4T0R/QkmgJERngvG/zARdjhzz1FdCX4e4K0zi2T3FUxEFj7
 sOfU9UGFKCKqXO/PNCjqgSjARoXAlHkbK9dg7uvrskQgRS7MSxux+3BQAlvIS5ft4Dmy1pLVb
 IIeM5CHYT5g8BEMOBifY/Ueehqh4wyvT+rNhSFpaGIEE93Mj4PRvyS85k0Ava29PU20gNcQPh
 zlwngUqgaohEaBmZlXNaeEoM3guAguDEcu2yVf6HGbCzKYo076elfZxWIXUkJslTvfN6Az25u
 AWY4PhI0Th58m9ytMrPXv8ELOPpEH14LFB/zqFXCaDbIbwNElaRPBtZkxfoTeiL3ka8p0pod7
 hqcHL+SAUB6T8s5G51d9jtIov3T0lKEkwiViKVI7zdkg3UvOpWBhvItPp/ZaKoG2sDY7d2zPT
 13YOfpPh2dckyrO3Waf5EK0nrFvNavqNWCnYd1s9VJc48buPmr0gVZSQ/XoQLVKipcKDvS7xj
 o1vTzsOVf02amTmic0nR8kG2oyRul+M/juYgv8HtzuIVAn7us/kmxHTCK+36XVn3JtCSDpT23
 dM/v0Ure7YbQ6GB5EGzH5rTtpFcDoByWGyFbgYsbcLMc6qByLYJ1jPyL+rmjxxMfkpBdIdiRH
 PiF7pHxslipHwBVZ/U2QsnzRso4b7ToBOsdGSpVRWqbtbI8sLBn3Rb3UA==
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

On 6/29/22 09:03, Geert Uytterhoeven wrote:
> Hi Helge,
>
> On Tue, Jun 28, 2022 at 10:52 PM Helge Deller <deller@gmx.de> wrote:
>> On 6/28/22 10:39, Geert Uytterhoeven wrote:
>>> On Sun, Jun 26, 2022 at 12:33 PM Helge Deller <deller@gmx.de> wrote:
>>>> We need to prevent that users configure a screen size which is smalle=
r than the
>>>> currently selected font size. Otherwise rendering chars on the screen=
 will
>>>> access memory outside the graphics memory region.
>>>>
>>>> This patch adds a new function fbcon_modechange_possible() which
>>>> implements this check and which later may be extended with other chec=
ks
>>>> if necessary.  The new function is called from the FBIOPUT_VSCREENINF=
O
>>>> ioctl handler in fbmem.c, which will return -EINVAL if userspace aske=
d
>>>> for a too small screen size.
>>>>
>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Cc: stable@vger.kernel.org # v5.4+
>>>
>>> Thanks for your patch, which is now commit f0b6a66d33ca6e7e ("fbcon:
>>> Prevent that screen size is smaller than font size") in fbdev/for-next
>
>>>> --- a/drivers/video/fbdev/core/fbmem.c
>>>> +++ b/drivers/video/fbdev/core/fbmem.c
>>>> @@ -1112,7 +1112,9 @@ static long do_fb_ioctl(struct fb_info *info, u=
nsigned int cmd,
>>>>                         return -EFAULT;
>>>>                 console_lock();
>>>>                 lock_fb_info(info);
>>>> -               ret =3D fb_set_var(info, &var);
>>>> +               ret =3D fbcon_modechange_possible(info, &var);
>>>
>>> Again, this should be done (if done at all) after the call to
>>> fb_ops.check_var(), as it breaks the FBIOPUT_VSCREENINFO rounding rule=
.
>>>
>>> What if the user just wants to display graphics, not text?
>>
>> Yes, I need to go back to an older version here too and check that
>> the test is only run on text consoles.
>> That check was dropped, due feedback that you could switch
>> back from graphics (e.g. X11) to text console at any time....so the
>> check for text-only is not correct.
>>
>>> Can't the text console be disabled instead?
>>
>> I think the solution is to return failure if switching back to text mod=
e isn't possible if
>> fonts are bigger than the screen resolution. That will be another patch=
.
>
> Isn't the font a per-VC setting? Hence can't you change resolution,
> switch to a different VC, and run into this?
>
> I think the only real solution is to set the number of text columns
> and/or rows to zero, and make sure that is handled correctly.

I agree, there doesn't seem to be a simple solution.
On the other hand, such usecase seems very unlikely.
If you have a proposal for a pacth I'd welcome it.

Anyway, I've just sent out a new patch series. It does not include any pat=
ch
for this theoretical problem yet.

Helge
