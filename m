Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DD7562362
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7D012AE43;
	Thu, 30 Jun 2022 19:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C2412AE40
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656618412;
 bh=0VSzZMl9imSgsa21JUdDx2qvQsqurx1STKaKBRGqUeM=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=V6g/pVbDTq2TKSLyelKYjG0aihrM6bmFXHyFsfXEYOw1wREoj9r/SMJ2tZJ4/wZoJ
 1XT17BSAqIMPb8d4DAz3rfFQisWHW6FpvzHUPt10kTMj2S/BEMalj6xyOV9aqGdxB+
 im7K46ZqOC1UhjFQtIV9shIGXdnDUFHp+Ss3I/lo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.136.11]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hzZ-1nfX8l1Khr-011nJn; Thu, 30
 Jun 2022 21:46:52 +0200
Message-ID: <d57655b2-44d1-4083-c4e9-ef4f004f2b64@gmx.de>
Date: Thu, 30 Jun 2022 21:46:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/5] fbcon: Fix up user-provided virtual screen size
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-3-deller@gmx.de>
 <CAMuHMdXJRBywf+h_u1jgA6X7hLSByDDwSkskff47a0BHfd93iA@mail.gmail.com>
 <0c418b7d-474a-3f93-a1fb-2f13c4d19941@gmx.de>
 <CAMuHMdUoMJ6CmiKDh4MW_b-7uoxEF+H6QimsA7SfcE5kjo17vw@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdUoMJ6CmiKDh4MW_b-7uoxEF+H6QimsA7SfcE5kjo17vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ix1Sw4SBVRNJvNlvBEHRYEJRMvMrGXMSNQmVFKWi0WZVNmdhT0w
 kxn2k4QFSjVPCuL0GShIIh81A5aGro86p1rlOyMyeLQI1E5Apb85zQOGtG14i1VBtszUoxj
 AzKeqw+aWp1WzucJTcNclUpY4UyeUebK37h92CKdpStMbH+U56cBs5ac9fA5WyyuhhVYInn
 TdxC4TXi2lf4LQYLKAAMw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CdDgpjmD/iQ=:w7JZSejoUlKGsp/9SY1ktk
 noEpdOy+w1Wf2+DbO2ryXCiK6svJgUHD1Xfr4XGqqpbsLgmLLTejI1ZMGHXDpWEponkLWqyvv
 Kh+auFPzfaWUpvYYUtkpuwU8drbVNljaFYIka0V8Y5mAn0VPgbJqYwanuAxN72/cCArstKL16
 6O/liVxayQSRIf3ylAerWClIbn69eObEH2X7lKYqE+gSt/dcghIJjnudUF30m++gOagUoK4yC
 YT5elQicH4e/0dqWL2MWwaFlHFh6GRYq/LZcZPtr9AlNl6NTzDp85dfv+oOlDJXBD5ZY2ysdt
 Jjsv7IeCnMjJ2q4FIrfRu3/1AUgiE8x1Is9odZNz13RQj8npmA5ODkZXR92I+ZQqwe1OyLXxw
 AVPPr3+JFzMwwI/S0pKqAqGH9Ig9jeXO9o520gqnY91pWx/uzCFKYOql1c0J3o9cQR76IvfRe
 9kIaEtkZLUwwmWHpulowAmew8/Mt5+aSrmvFT/aoRTNH6gSrxEG4cCIrdb4ICTdovL0ytnNq/
 wmh++JXw53b8IE7O7JuwJ04i7CxAXgt/y8/VWozE0WYvZOKhjsonQC5NLM1NEP/H3VVj6YUGj
 4XWgrcbanyHq7IH7fW550vl7W0EummG1rI/iL60uZL22RlsJiCiVX2ObGLsmUfxgyY0w7biWY
 T6XHnpHMGzcUGyTvzhbFuD5a2LajhbvtRJY680CVXsxJLqlw1i7qj1jscZpx65lAGVxmB90Fd
 IYoAMb+7G32MAiv3IiSZd0orbIDZMdzXQg8s+06v8rw9x5vxNh+zO+8QiCb7NFJspWGtqERTn
 GLC5ZAo0KVz755t6ZCBKVGAqAYI/sQU4pQbNn47f3DM2RGtwVy48R/wkEsZhvyFC/7nXXMiOI
 LPOIqb8GDUCB5jCDjWtSrclCKoJRpEymUE9W69M5XKYVjs84lPyDj7g6ajognswCZ7aOsPL4S
 a7OwI9MTjaiwWva1t8zASOYjTO6FmRZzH794KNK4Gu7Hu4YAvQ3y7GWqZ/hMaJMkvkfV/8cjV
 6DzmED8vMDnJBHwCw+1dLdme9XZfNqSdBG1juQVUHUkqJ4hi7QdgX57Z5do09r0mkv27r+8cH
 /mqTZiEW07jFuQCgsd38i9XhEEuPN2AXcP+tv5FxbHDsyF8p1Lc7WaEVw==
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

On 6/30/22 21:36, Geert Uytterhoeven wrote:
> Hi Helge,
>
> On Thu, Jun 30, 2022 at 9:31 PM Helge Deller <deller@gmx.de> wrote:
>> On 6/30/22 21:00, Geert Uytterhoeven wrote:
>>> On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wrote:
>>>> The virtual screen size can't be smaller than the physical screen siz=
e.
>>>> Based on the general rule that we round up user-provided input if
>>>> neccessary, adjust the virtual screen size as well if needed.
>>>>
>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>> Cc: stable@vger.kernel.org # v5.4+
>>>
>>> Thanks for your patch!
>>>
>>>> --- a/drivers/video/fbdev/core/fbmem.c
>>>> +++ b/drivers/video/fbdev/core/fbmem.c
>>>> @@ -1106,6 +1106,11 @@ static long do_fb_ioctl(struct fb_info *info, =
unsigned int cmd,
>>>>                         return -EFAULT;
>>>>                 console_lock();
>>>>                 lock_fb_info(info);
>>>> +               /* adjust virtual screen size if user missed it */
>>>> +               if (var.xres_virtual < var.xres)
>>>> +                       var.xres_virtual =3D var.xres;
>>>> +               if (var.yres_virtual < var.yres)
>>>> +                       var.yres_virtual =3D var.yres;
>>>>                 ret =3D fb_set_var(info, &var);
>>>>                 if (!ret)
>>>>                         fbcon_update_vcs(info, var.activate & FB_ACTI=
VATE_ALL);
>>>
>>> Given "[PATCH 4/5] fbmem: Prevent invalid virtual screen sizes in
>>> fb_set_var", I don't think we need this patch.
>>
>> We do.
>
> Why? It will be caught by [PATCH 4/5].

Right, it will be caught by patch #4.
But if you drop this part, then everytime a user runs
	fbset -xres 800 -yres 600 -xvres 200
users will get the KERNEL BUG WARNING (from patch #4) including
a kernel backtrace in their syslogs.
This is not what you want.

If you drop the WARN() from patch #4 you'll end up with my
last patch series.



>>> Moreover, this
>>> patch will prevent triggering the WARN_ON()s in [PATCH 4/5]
>>
>> Right.
>>
>>> in the most common buggy case of drivers plainly ignoring var.[xy]res_=
virtual.
>>
>> In summary:
>> This patch #2 is fixing up user-space invalid input and is not
>> allowed to trigger any WARN_ON().
>
> It's the responsibility of the driver to at least look at its parameters=
.
> What other invalid values might it let pass, that we cannot catch
> at the generic level?
>
>> We could drop patch #4, but then we wouldn't catch bad drivers.
>
> I do want to keep patch #4.
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

