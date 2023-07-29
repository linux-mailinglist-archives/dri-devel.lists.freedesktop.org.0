Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BE5767FC0
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 15:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E7E10E0CB;
	Sat, 29 Jul 2023 13:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE7210E0CB
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1690638821; x=1691243621; i=deller@gmx.de;
 bh=SF33N+Kpc/wyG9nSqcNT0LlTEH8fet6dIuByUxd0Cic=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=c7PuZP+dLY/6HRY5CvV47NQ/1RIsow3/wc19NKo0POC7seqZVHaGzIFSamX7HNh7XnPjnSl
 F1MjawpMBcXcdnzTMza184dmiHLoQ0U6JClins9LfVaqdEEXJIiVRsLOJPbISJGXixgWyiYW5
 QSCNlgYwZKRbyksX0e07YuKZKvhr6qIZZbPMkcJc1RfRDke8eTiQJ5dVQil7Hb1lhCdC0ZDYw
 EuoP6E4A4w8cOBbsm77c8riEbqlmGF7Ua9nyI1lRkpsxqdHdT86QKTbxQ+ENcb4kAvujtb7+7
 ehwn+6Pu39M6L8reSF9pRmdeci20dg3mLS1LApTYJ9Bm64IqawMA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.147.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzQg6-1pdXSH2mXY-00vLlS; Sat, 29
 Jul 2023 15:53:41 +0200
Message-ID: <1ab418ae-592f-4347-fa75-bf9b00115afe@gmx.de>
Date: Sat, 29 Jul 2023 15:53:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/47] fbdev: Use I/O helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
References: <20230728182234.10680-1-tzimmermann@suse.de>
 <c1a4b7c9-50f2-c43f-277d-c2af9ccc0b50@gmx.de>
 <20230728210127.GA1156027@ravnborg.org>
 <78da21f8-7d00-797e-363a-736ee53b2eb6@gmx.de>
 <126ac851-2f81-4cfd-b06a-774f8428cc93@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <126ac851-2f81-4cfd-b06a-774f8428cc93@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6NOl6qf6INO7VOFdQE2JnRYWdtQDNRo6M9Ca0Q2Is8v9m4IHvfQ
 ua61qy3N+QL+ov3IpkAlBqWzpRLUFIs6319HjFbUd9mLzNsO+tOGAf1YOPOOClcXwlM6iSp
 kqWdFK7mJFVa4iGcdOkTd27JYbqIFT2XR9R2NcEgYG99BLVOTU1kMY1lltzGzVz3OWKFPW0
 zncOfO05x8K5vTsSIA1Nw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BEPvo3atSHo=;8ZJQxXtTgZ/i8YZdeod/v+Sx78d
 sV7QGqx5P+XbbewQrCUuMM2mIUX57WAhxzXzPwb8HZtWALbUvGqjBKEquCKElhDra9J1W4FsW
 RSbH37IgKyiEPUuLhO3hYhjxJ1OESVY9l46kaw6MCW9UdBOZL0QiCLmw/NgpdUWUkbmqozflr
 By7lwt8Jh04wVLXvhb6zuHhVkqn+x8zyP1dSWKEmjqz7SAJqedZ6dFLka4W1uQIBQeajseAWd
 5ukRIAAbk7QTSjOlfu28AH0ZYXZQYZBq87n7EpBjmNO7omIBL2l4LLbYkJ+FR17J03p9rJNY2
 N+ptylEF2CfmhShVYEK3IUGwR89DB6qc1VQFMNgE2YLeo3NzyKMUc8owaCPcxVJ0XlqQXqUdW
 2h7TrrlowCT34sYOoTuVhJgvPpp2xqvGH7HVOEu3yt0araUQULvDoWaZdHuA6YQOZDQ9duzca
 e8l5pfYPEoRqsaE3V9+PGRcw29X6ajx84Cfbrl/57KlvpV7zNrusmfz5fkcWOCTTVgRmsa95W
 DhCT16EIP6TBdqS89NaaLaZfVXjZ6PsCmx0XvivgFHHxj9urbbRgZnnHEnRN4Qb1AJYl5NsQk
 6ChMZ/3d1cL6STQ8mKyN1gRVln7d/80QWP3TsmFb/U6U+6pyhQa34AFjePb8AyTuVi1IctBdh
 ySFP8XAk/xMXeMTEuovcs1ejQ+l+yFsPmzQwLZkJDJXang0Ap099PVacpsxmtuD0xzYo223VE
 Zg2DpdJpT+UbYxiYbDB2tFbIO0Yux5/Hcv6cO4F0MpAUCQFScJl3WJ2usEQxHolmDaVeuIcM+
 4V+NxQDfqrxB31DHnYrS6btho99ZsNzVUsn3i58StsPbsHHis35HLMYnWp5M4Qd/2v/bafmss
 mTwVw/Arwed7vSe6A1gNwVgYmS1esFcNDY+01azGbDr82SsBybEYbP2/sRxiLZBqdwQTLylVg
 uuxFsRNLE56F12ao/HwpC6fJMfA=
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org,
 javierm@redhat.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/29/23 15:21, Thomas Zimmermann wrote:
> Hi Helge
>
> Am 29.07.23 um 08:51 schrieb Helge Deller:
>> On 7/28/23 23:01, Sam Ravnborg wrote:
>>> Hi Helge,
>>>
>>> On Fri, Jul 28, 2023 at 08:46:59PM +0200, Helge Deller wrote:
>>>> On 7/28/23 18:39, Thomas Zimmermann wrote:
>>>>> Most fbdev drivers operate on I/O memory.
>>>>
>>>> Just nitpicking here:
>>>> What is I/O memory?
>>>> Isn't it either memory, or I/O ?
>>>> I mean, I would never think of the cfb* draw functions under I/O.
>>>>
>>>>> And most of those use the
>>>>> default implementations for file I/O and console drawing. Convert al=
l
>>>>> these low-hanging fruits to the fb_ops initializer macro and Kconfig
>>>>> token for fbdev I/O helpers.
>>>>
>>>> I do see the motivation for your patch, but I think the
>>>> macro names are very misleading.
>>>>
>>>> You have:
>>>> #define __FB_DEFAULT_IO_OPS_RDWR \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_read=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D fb_io_read, \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_write=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D fb_io_write
>>>>
>>>> #define __FB_DEFAULT_IO_OPS_DRAW \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_fillrect=C2=A0=
=C2=A0=C2=A0 =3D cfb_fillrect, \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_copyarea=C2=A0=
=C2=A0=C2=A0 =3D cfb_copyarea, \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_imageblit=C2=A0=
=C2=A0 =3D cfb_imageblit
>>>>
>>>> #define __FB_DEFAULT_IO_OPS_MMAP \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_mmap=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D NULL /* default implementation */
>>>>
>>>> #define FB_DEFAULT_IO_OPS \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_IO_OPS_=
RDWR, \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_IO_OPS_=
DRAW, \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_IO_OPS_=
MMAP
>>>>
>>>> I think FB_DEFAULT_IO_OPS is OK for read/write/mmap.
>>>> But I would suggest to split out __FB_DEFAULT_IO_OPS_DRAW.
>>>> Something like:
>>>> #define FB_DEFAULT_IO_OPS \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_IO_OPS_=
RDWR, \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __FB_DEFAULT_IO_OPS_=
MMAP
>>>
>>>
>>>> #define FB_DEFAULT_CFB_OPS \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_fillrect=C2=A0=
=C2=A0=C2=A0 =3D cfb_fillrect, \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_copyarea=C2=A0=
=C2=A0=C2=A0 =3D cfb_copyarea, \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fb_imageblit=C2=A0=
=C2=A0 =3D cfb_imageblit
>>>
>>> The prefix cfb, I have recently learned, equals color frame buffer.
>>
>> correct.
>>
>>> They are named such for purely historical reasons.
>>
>> well, they operate on MEMORY which represents a (color) frame buffer,
>> either in host memory or memory on some card on some bus.
>> So, the naming cfb is not historical, but even today correct.
>>
>>> What is important is where the data are copied as we have two
>>> implementations of for example copyarea - one using system memory, the
>>> other using IO memory.
>>
>> sys_copyarea() and cfb_copyarea().
>>
>>> The naming FB_DEFAULT_IO_OPS says this is the defaults to IO memory
>>> operations, which tell what they do
>>
>> This is exactly what I find misleading. IO_OPS sounds that it operates
>> on file I/O (like file read/write), but not on iomem.
>>
>>> and avoid the strange cfb acronym.
>>
>>> Reserve cfb for color frame buffers only - and maybe in the end rename
>>> the three cfbcopyarea, cfbfillrect, cfbimgblt to use the io prefix.
>>
>> Again, the io prefix is what I think is misleading.
>> Why not name it what it really is and what is used in the kernel alread=
y, e.g.
>> iomem_copyarea() and sysmem_copyarea().
>> which would lead to
>> FB_DEFAULT_IOMEM_OPS and FB_DEFAULT_SYSMEM_OPS.
>
> Yes there's been a bit of confusion and discussion on the naming before.=
 I'd be happy if we can standardize on sysmem and iomem.
>
> I can add a patch to this patchset to rename the _IO_ macros and tokens =
to use _IOMEM_. That's not too much change. A later patchset can address s=
ysmem and deferred I/O helpers separately.

Sound good.

> On motivation: for now it's a cleanup to make the a bit code easier to u=
nderstand. But once all drivers set their callbacks correctly, we can make=
 the I/O mem code optional. It's currently the default and built-in uncond=
itionally. But it's not uncommon that it's unused entirely.

Probably true for x86, on others it might be useful to make the sysmem opt=
ional as well. I did not checked.

Anyway, thanks for your work!

Helge

>
> Best regards
> Thomas
>
>>
>>> Which is much simpler to do after this series - and nice extra benefit=
.
>>>
>>> I hope this properly explains why I like the current naming and
>>> acked it when the macros were introduced.
>>
>> IMHO the naming isn't perfect, but that's just nitpicking.
>> Besides that, Thomas' patches are a nice cleanup.
>> So, if you want add a
>> Acked-by: Helge Deller <deller@gmx.de>
>> to the series.
>>
>> Helge
>

