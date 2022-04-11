Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AE04FB39D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 08:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D17A10ED2F;
	Mon, 11 Apr 2022 06:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA4B10E974
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 06:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649657995;
 bh=sfEMxueHlINxP3Ft9h3uCgQL3x0NL57EBnCByLr9WHw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=LXG4o5IDHO3ef5fr2tCKvvAdmWy6WIOep7bK3zPAw1v0pOte4O2KeD1jEN7hX5ct4
 IcwhR6sh4VZBXqQfqgaSM9+8BW5vCFjVtyaGLZZVttgDs/8q7oGwGLU+PTHciFrDh2
 adcuO0ETsyF73Pz5sk0MlqsJzWhDmnmrfh/Fm57M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.145.57]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvK0R-1nuukM0DMv-00rHOG; Mon, 11
 Apr 2022 08:19:55 +0200
Message-ID: <f68dde85-5ead-3c5c-3bf3-3e6bd7458f2e@gmx.de>
Date: Mon, 11 Apr 2022 08:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/7] video: fbdev: i740fb: Error out if 'pixclock' equals
 zero
Content-Language: en-US
To: Ondrej Zary <linux@zary.sk>, Zheyu Ma <zheyuma97@gmail.com>
References: <20220404084723.79089-1-zheyuma97@gmail.com>
 <eb2edc5a-afad-f0c9-012f-9b9f226d2e5a@gmx.de>
 <CAMhUBjmm6ADp2Fr89CCQNX5FnhmBBrwFE0EQ3sq7CLER0J3ZEg@mail.gmail.com>
 <202204101102.13505.linux@zary.sk>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <202204101102.13505.linux@zary.sk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7UMRgaQGw+lmVxgdw35JNxFmQ8/erZc7B2ZAznUL56KFExbyAyL
 eozhZDqrTS640g+EG/wkbxyUl8tATZwLYGBClGzFD5kDMy1zVp8ncsOPrHKCShmztq59eXl
 43nNT+8gxU1B2smqyyhJrXqFFnQ5TDJsLNhcWI8Uh+nsFWnporQ37jdkOTraCUBwf05DeQm
 egEJBdtNlJbsWoNHbWn6w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wz+exaJD4EU=:qCbHUBMR0eECdtBeg75SJM
 U4Thoi+oZ8fwwOrWoG2hwwJ07nadK6Jm03W7VVGxZEYRgPFh1iZpPDRgvRM4S1oB+TVrN9IvV
 2B/S4Lm21lqV9vwhXQK66Xc2YQjR6DxQkm+FeMVWdsOFDjTS7G+UwlxQB0NRUQ6h0s5oHTTkp
 n5U9MdMRoHHf/JfpRgPLBvCb55hXzHbbI6NmoZFjCjTuJe+eglBElNT0Eowp/LxqMnkWwoPjA
 8osGq39Rah3GpUONk5awjJHiR0pe8C1iesARwQNu42byJ9Nmip0nh+CD0XtGK/VnPiEEPdPeO
 yEINGfEAHdyYvn8ccLQjcA/JSZMDulF9dLFb2iKZfw7cYuKkmsOQrvCseLVzAESqVhX1vCM3L
 /FmPOOKieZ+6bzZPYAV/+OvsyHCjCTaKtv44feUrok68MrLiZZCGGzva5twG/e7uq+PW+hx0O
 xdnlq8hgdkIYmK+BJaubWb097/CLjtgw4jSbVfq+yuEQiT0GwaWTGHSJVRtcUDANHqLwv0h7q
 x1D+bzOomHGx8kmiP5uPq4zNlDBrhfAtNBuUQGj9gbIsLdyZnz1tjRBDdCUWvSisNnY0B8eE+
 6Pmq4EUmauZY5MlJX/4iY5w1vaBC6pzHjVqf35fQ+S/6aJtDqeRfa0Nx69h+K86yhJYH+A2sA
 +/QN+JQ6a1q19QElMcOywTVCoJ3AM25ThZ2RZ16wm9/km/K0wzAeSwgpa+Z/iQ7YIokH6hu0j
 Gw4Dpl8Kc1PBaWHrLjfiSDOqjP3gpgZL13w6YCXxx9j9d7qhHvkvPDYnyneSiMxwVCxMCfaw9
 Yiri1Y6qZK/6IFrCN/bMuipbcuCY0YGu2/QUgAo8CJ663SYVSIgXH0cL8A/E+uqCm1pO+shqM
 MTAWAP0JDcXSgUWFJsEuZqigyKLSLudz+57FTgBGqa25uA432PzWSgdJEoEPFG0eAJq6JT+UH
 98pFXzf3KPz4EK5SrFBm8/CICP60rHasqehg7bFe+VWjJXWONFwdcXUM2zNkLUKj2hy4rxMaj
 hCO6AlqijlgG+syyV4ATSMQ+NlLKZ9t3qfSu+PGqucClxai+BNEoqpVuk8noaVYKyCKBV76Bi
 iV/iWoQhb/7Iw0=
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/10/22 11:02, Ondrej Zary wrote:
> On Friday 08 April 2022 03:58:10 Zheyu Ma wrote:
>> On Fri, Apr 8, 2022 at 3:50 AM Helge Deller <deller@gmx.de> wrote:
>>>
>>> On 4/4/22 10:47, Zheyu Ma wrote:
>>>> The userspace program could pass any values to the driver through
>>>> ioctl() interface. If the driver doesn't check the value of 'pixclock=
',
>>>> it may cause divide error.
>>>>
>>>> Fix this by checking whether 'pixclock' is zero in the function
>>>> i740fb_check_var().
>>>>
>>>> The following log reveals it:
>>>>
>>>> divide error: 0000 [#1] PREEMPT SMP KASAN PTI
>>>> RIP: 0010:i740fb_decode_var drivers/video/fbdev/i740fb.c:444 [inline]
>>>> RIP: 0010:i740fb_set_par+0x272f/0x3bb0 drivers/video/fbdev/i740fb.c:7=
39
>>>> Call Trace:
>>>>     fb_set_var+0x604/0xeb0 drivers/video/fbdev/core/fbmem.c:1036
>>>>     do_fb_ioctl+0x234/0x670 drivers/video/fbdev/core/fbmem.c:1112
>>>>     fb_ioctl+0xdd/0x130 drivers/video/fbdev/core/fbmem.c:1191
>>>>     vfs_ioctl fs/ioctl.c:51 [inline]
>>>>     __do_sys_ioctl fs/ioctl.c:874 [inline]
>>>>
>>>> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
>>>
>>> Hello Zheyu,
>>>
>>> I've applied the patches #2-#7 of this series, but left
>>> out this specific patch (for now).
>>> As discussed on the mailing list we can try to come up with a
>>> better fix (to round up the pixclock when it's invalid).
>>> If not, I will apply this one later.
>>
>> I'm also looking forward to a more appropriate patch for this driver!
>
> I was not able to reproduce it at first but finally found it: the
> monitor must be unplugged. If a valid EDID is present,
> fb_validate_mode() call in i740fb_check_var() will refuse zero
> pixclock.
>
> Haven't found any obvious way to correct zero pixclock value. Most other=
 drivers simply return -EINVAL.

Thanks for checking, Ondrej!

So, I'll apply the EINVAL-patch from Zheyu for now.

Helge
