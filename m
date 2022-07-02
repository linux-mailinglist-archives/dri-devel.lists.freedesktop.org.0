Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFF1565ABC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457CE10E282;
	Mon,  4 Jul 2022 16:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F1410E0A1
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 18:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656785586;
 bh=SDqv3erOc/+QmehnfQgcAWWkmR8Gf6EQuzVoY5gdwII=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=hBRgbP54x6aTwomkttzFajQ+55keMQmNzWinN+sZgAxfSRK5dBRZcsWCWcHXucstx
 XRLleB29It/qKY1sklZ/25HOJ21o2n52PtsOpnYXIx4fTR3jErHa6+MEQ1zk+q+HEm
 uOXBbP1uhbLqs24IpCWO8FA2P72H7Q6jDA5QOmeA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.191.144]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MV67y-1o0QhC2Cww-00SAxx; Sat, 02
 Jul 2022 18:26:32 +0200
Message-ID: <aaa9d0f8-323a-b59f-b626-09bd1b8ebe73@gmx.de>
Date: Sat, 2 Jul 2022 18:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/5] fbmem: Prevent invalid virtual screen sizes in
 fb_set_var()
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-5-deller@gmx.de>
 <CAMuHMdVJ0PsDyTdGoOHPOKdaR7AffG2FpFmw6fxoNdXx9y-J4A@mail.gmail.com>
 <1ba5f6d6-1c31-a8fb-867b-e2a7fda7da56@gmx.de>
 <CAMuHMdVMp-ywWmDevdZTwHHhdiHnsFhze376guTEMd1T=tb-Pg@mail.gmail.com>
 <CAMuHMdVs1J0kvA2Kinx121vF=35dUEY+1Jrx3sjF3NHoD=wMfQ@mail.gmail.com>
 <f6c687a5-539d-965f-fc2a-6ff3044798a8@mailbox.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <f6c687a5-539d-965f-fc2a-6ff3044798a8@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZLJYPL0WQOBvSoQU77Dl0kjvDDJEI+BDND2RUgQkL1eHT5kdpXa
 tnrhQzwe0nYCiTl51pgssvI/Ex/r5+lHUGu+eamkjInzE6JzIyHu05juP0QYSWOPzNHd5HN
 OcdRPQdopmGvmyVRj25jxbf9FvtPeveYuYZcICyAmtorWEZonl/p2GbausTfGHAsshnZyPd
 8ypK99UliRreD1My3x5OQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hYtRGrPn0Xo=:3h/x0rl0urksmc8w5ewkLe
 WAgHrTq043mTOXoA3bcY58Dd3tZVXrmZhKrW6hS54zOZMQ5ueq4mFGdXiku/pmeeN+LxWlsrz
 MsYLAFAzpC2W8jAi0HcePU4BIlmh13CBFtKJjqxdShabk7YrQiajKGYGXuqgPq58Dpf3/JgRx
 +2CJIWk/C1gQzcT7lxhQWOCCJhcouThTX/4MVrGaQZnzee1K+mxCjEdpal5qC83u7VIlbYPqO
 N5FlIrFBeu9HSm4CIFYDTRUtL6bjtnNL7q6sLVlv5cx3Ht5LED1Svd4vgMtFejIQRGzPVb1tT
 VKjubTsDIy6Lx7xo4EHH9/eC17CYpOaGdz7otRRKChw0rZttA75f/Qq7nKWYStSf9YUlCjPwE
 7w05FsP4l0v7zNnQzipTF9KvZ7Sfqszqqrprj9lXgPGbu7JACfO64u6ruJMPree9lB/PqnUXB
 7NRdBdFu3oPsu8dE+MzZzt2mGfoed7WaWdgVWUosYLhBvosvodoIJcBsecQI+jcnwA8DRz6HR
 RdXAcwjCv2gu3uL+lpVTpqXPKL/419D5vg2lgFhg+fsJ91hCYr5zpjspBV8lTCgRmjftVAY+P
 IkOXgAmToSiVXWdGyrqSPan7vfgetVbHWEeTeuhUiYPvXF3VGf38LgglB+1cRGGq6bufayNUe
 oecu3Sqc0/zZEALL31yCiwVqPKgs/d0gMUnHMG67MMV7Fj3i0twlt4SUj2wCGjt1GYb7ZjQK0
 jsAge6Vys4lsPTAfm/RkeEuwuEBLcgBO1xr5cK81zIwXkyS1fqrmcDolKq0NjYNNNnjPuqjKG
 JFVTzlqrZRw4nEdeMuswO0HWj6ddB6iqZpCw45L6VzQXgbVJf7/NF6dOH6ztbgtJf7geC9ttV
 GCzhjDpDnMbY+G5Rr8JHXEfLFfnur8Is3RQHdYiFfjIFh29OnaQJJPFVnYTjHJ4mk2I3qJfia
 JzydG6mwCrhY5DVnRAmivM+o+AtAPddw49RdoRTzcS8ZENRAy2wssyzYgtBd3pD8vSAaTqdra
 WdLWRRqHtXt1irn88mHAkOjKVpNg94M3hdzwYR0XJ4obI/KTMjTpxeFGyeNP5sQt2FdWl/Pb7
 G0k4AGbTiKB6f70niGD4irKcYy9LfikIRNFUE9IGQyhVqpV0E3gHroSrw==
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

On 7/2/22 14:05, Michel D=C3=A4nzer wrote:
> On 2022-07-01 16:49, Geert Uytterhoeven wrote:
>> On Thu, Jun 30, 2022 at 9:38 PM Geert Uytterhoeven <geert@linux-m68k.or=
g> wrote:
>>> On Thu, Jun 30, 2022 at 9:17 PM Helge Deller <deller@gmx.de> wrote:
>>>> On 6/30/22 21:11, Geert Uytterhoeven wrote:
>>>>> On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wrote:
>>>>>> Prevent that drivers configure a virtual screen resolution smaller =
than
>>>>>> the physical screen resolution.  This is important, because otherwi=
se we
>>>>>> may access memory outside of the graphics memory area.
>>>>>>
>>>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>>> Cc: stable@vger.kernel.org # v5.4+
>>>>>
>>>>> Thanks for your patch!
>>>>>
>>>>>> --- a/drivers/video/fbdev/core/fbmem.c
>>>>>> +++ b/drivers/video/fbdev/core/fbmem.c
>>>>>> @@ -1006,6 +1006,12 @@ fb_set_var(struct fb_info *info, struct fb_v=
ar_screeninfo *var)
>>>>>>         if (var->xres < 8 || var->yres < 8)
>>>>>>                 return -EINVAL;
>>>>>>
>>>>>> +       /* make sure virtual resolution >=3D physical resolution */
>>>>>> +       if (WARN_ON(var->xres_virtual < var->xres))
>>>>>> +               var->xres_virtual =3D var->xres;
>>>>>> +       if (WARN_ON(var->yres_virtual < var->yres))
>>>>>> +               var->yres_virtual =3D var->yres;
>>>>>
>>>>> This should be moved below the call to info->fbops->fb_check_var(),
>>>>> so the WARN_ON() catches buggy fbdev drivers, not userspace fuzzers.
>>>>
>>>> Yes, makes sense.
>>>
>>> And print the name of the frame buffer device driver, so people know
>>> who to blame.
>>
>> Or better, do not continue, but return with a failure:
>>
>>     if (WARN(var->xres_virtual < var->xres || var->yres_virtual < var->=
yres,
>>         "%ps for %s is broken\n", info->fbops->fb_check_var, info->fix.=
id)
>>             return -EINVAL;
>
> I'd also recommend WARN(_ON)_ONCE, or users with a broken driver might g=
et spammed.

Yes, that's probably better. Will do.

Thanks!
Helge
