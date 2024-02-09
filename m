Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D63A84F8EB
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 16:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C7210F681;
	Fri,  9 Feb 2024 15:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="qJq53reP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE99510F679
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 15:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1707494018; x=1708098818; i=deller@gmx.de;
 bh=NfxzhdKyztjF8ciazrBlmb+rl5JXJQ+cQZovv89eN0A=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=qJq53rePK2vW8Lv3zisaV/7HPKeiY/59o73G2CBKrbefuehS4eDm5t059sdTI7kM
 bnd3I3zMbKqb3aS1EPyiztXU49TTqtY/BlYZUmmCRegAvmALA1fd+xwLf/TGGE8xH
 32jDL3V/WDVyc1rfd1J48HG1cJmY0f6ff2Z0v2uQQCgePs/Wae/i4neq6CgR8a4gy
 gB60G5HJSj6IiJETALpbvtD84RNgepS1gtMrejhZCMHgPXFo/Q5yESGLO60k/uBLX
 +OKTqkD226MnUhjm1tvI+BbynlEuehsPHTNHvqbyUFsGF6nBahyHaU1NZcuErTYln
 nMDBSqqjZsl7M3W4Tw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.148.154]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3UZ6-1rXuxk1fE2-000ZEv; Fri, 09
 Feb 2024 16:53:38 +0100
Message-ID: <8f6efa96-0744-4313-bb15-b38a992e05fc@gmx.de>
Date: Fri, 9 Feb 2024 16:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] fbdev/hyperv_fb: Fix logic error for Gen2 VMs in
 hvfb_getmem()
Content-Language: en-US
To: Michael Kelley <mhklinux@outlook.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>
References: <20240201060022.233666-1-mhklinux@outlook.com>
 <f2fe331b-06cb-4729-888f-1f5eafe18d0f@suse.de>
 <SN6PR02MB4157811F082C62B6132EC283D44B2@SN6PR02MB4157.namprd02.prod.outlook.com>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <SN6PR02MB4157811F082C62B6132EC283D44B2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QSiZ+s4XAjHSPPDYeN2Jp309cR9lAC54p6AHsoDUVta6UMqBck8
 uBQXIKMGM1WXxKm8/pNobcID9yl2jZVPS3ij5o7/r1mcIc6VdLuXSnxeia4eJeIzPu421Gu
 SIvaTPW/KceoYB4E2jQutzimEzJURU9fhinfIIaJM76ybv7YUFctYDwGE51YlfzRHV3L5hV
 8XWwOJ7ssNXgHhyq+0/fw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x1QbuVO1suU=;Z+0HoRj/htJU/tvJRZwKRTyrd6J
 odHg16h6Mdr8rT4caDUlCHget/VV65tATPe9XVIzCRM9TynVBgcYGWh7qSpopMhT4PX/kscum
 YUOLjmpo60RsJT/Ju11pCiB2pOSFpS2Wh6gSAtiz+fY74HaLGQSnsOkNn/QnGd95q03a7fRiq
 cG0qIEE4Hh50GMk0r0BTmySTPSGHf0muNRzij364tqOwn3nHdWv++dDK+j9CqDMmoRS5bqM+P
 XXNwtKxzFOdRO+v3u5eNZdsBY7OwNlamZT9qWvowHvG0OvgGypyu8sv0ILc+OUhdItwhXAUFk
 BEKF+ThuKDpX9M7DRfFUDtX5HILWn3wFjdjbVw3kyabTGUBYoVD1ei7PjOyRqBBddICLZrVhf
 SfnStDv+aqZCFgHFmJrMT0jbn8y6jozAXKVoNIUIohPtFE+7Yo/+YEkU2eEHiZ6HpETWzthcs
 brqZFHSMGT0/mlWGXX+Whi4aFuMDTomL4IwqeZJ8MwiU8aVEBIxxv73isxzb/YJAqV0Qx0I7d
 ag2Yk1dnf0uZUTtLUHjyLN/mqZGTACjCoohVFEu9kD9UfIYa/gsrwPL98n6zZuzw4LcMqWraA
 GGXHP2fG2GPD82Wed+88n/Bt2GQ2bdTZBCcClX3uVi1Hqh23Q89Zs12rWRx9oBqKlFOrix57j
 FHnyl1ahM35aCzJoZ9Q/Bi3KT1+WF7DDpiyOwv+oyz9NdqERHeutsOj+ob4/c93XFCmE8fQNX
 pdAToYLdIQ0SulrNo4gN0M+7of7OV53NvFQRhTHh5NwBEPfDKZDtR8fkMCfV0egOcXOrKzT7l
 CvWm4EfPiJRjNnce2CQwKMKRi3ITVO82qkchLCVVHdpHU=
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

On 2/9/24 16:23, Michael Kelley wrote:
> From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Thursday, February 1=
, 2024 12:17 AM
>>
>> Hi
>>
>> Am 01.02.24 um 07:00 schrieb mhkelley58@gmail.com:
>>> From: Michael Kelley <mhklinux@outlook.com>
>>>
>>> A recent commit removing the use of screen_info introduced a logic
>>> error. The error causes hvfb_getmem() to always return -ENOMEM
>>> for Generation 2 VMs. As a result, the Hyper-V frame buffer
>>> device fails to initialize. The error was introduced by removing
>>> an "else if" clause, leaving Gen2 VMs to always take the -ENOMEM
>>> error path.
>>>
>>> Fix the problem by removing the error path "else" clause. Gen 2
>>> VMs now always proceed through the MMIO memory allocation code,
>>> but with "base" and "size" defaulting to 0.
>>
>> Indeed, that's how it was supposed to work. IDK how I didn't notice thi=
s
>> bug. Thanks a lot for the fix.
>>
>>>
>>> Fixes: 0aa0838c84da ("fbdev/hyperv_fb: Remove firmware framebufferswit=
h aperture helpers")
>>> Signed-off-by: Michael Kelley <mhklinux@outlook.com>
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Wei Liu and Helge Deller --
>
> Should this fix go through the Hyper-V tree or the fbdev tree?   I'm not
> aware of a reason that it really matters, but it needs to be one or the
> other, and sooner rather than later, because the Hyper-V driver is broke=
n
> starting in 6.8-rc1.

I'm fine with either.
If there is an upcoming hyper-v pull request, I'm fine if this is included
there. If not, let me know and I can take it via fbdev.

Helge



>
> Michael
>
>>
>>> ---
>>>    drivers/video/fbdev/hyperv_fb.c | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/hyperv_fb.c
>> b/drivers/video/fbdev/hyperv_fb.c
>>> index c26ee6fd73c9..8fdccf033b2d 100644
>>> --- a/drivers/video/fbdev/hyperv_fb.c
>>> +++ b/drivers/video/fbdev/hyperv_fb.c
>>> @@ -1010,8 +1010,6 @@ static int hvfb_getmem(struct hv_device *hdev,
>> struct fb_info *info)
>>>    			goto getmem_done;
>>>    		}
>>>    		pr_info("Unable to allocate enough contiguous physical memory on =
Gen 1 VM. Using MMIO instead.\n");
>>> -	} else {
>>> -		goto err1;
>>>    	}
>>>
>>>    	/*
>>
>
>

