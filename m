Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 369A4203037
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515EC6E5A2;
	Mon, 22 Jun 2020 07:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D3E6E105;
 Sat, 20 Jun 2020 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1592657807;
 bh=ypxhGWOAU0x47edkgXOGRtJjGgNSKxoy9ckaT3hv3bQ=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=liqNX3vsW6V+2jwh0SjfGLYRVnHO5z7lieVqJROiAaJwLkmG2Qv956evJbEH8CDlF
 IXZx8rJFMTPUYgbsGDJfz6Ef3vmdPFf3GCw3dmvudRP4xDnb+9KtblUnBC8ZuQ2yIt
 qwW0xz+4QSkSNsw89vPqWWysXjU8QSDXUMlnkfRI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.139.185]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mrwrx-1j8OE61yib-00o0QC; Sat, 20
 Jun 2020 14:56:47 +0200
Subject: Re: [PATCH v2] drm/amdkfd: Fix memory leaks according to error
 branches
To: Julia Lawall <julia.lawall@inria.fr>, Bernard Zhao <bernard@vivo.com>,
 opensource.kernel@vivo.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <0e76e678-94b1-8f69-d52c-2b67608d5ef8@web.de>
 <alpine.DEB.2.22.394.2006201126130.2918@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <8527c6b5-c3ed-340d-4ba0-6396d6cc5da2@web.de>
Date: Sat, 20 Jun 2020 14:56:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2006201126130.2918@hadrien>
Content-Language: en-GB
X-Provags-ID: V03:K1:oP/ITVu7Ur7FRnqxphsFlkED4ONhpXaAiJsEuKf9/0MgSVrW+y4
 kr5hR6VqA5ilXfaiZeFoCQG21Bh2egYUEI70MpkvV5i18PMvkCBjoTYgCrVrwVzWrLH+uj0
 SdJw/jjUlxxxeAkVVWIQgdY+3RKmJ1Qnbcv6RwEFxEhP/egG9Yt13hAoi/4KEDJcVAOgS+k
 o+iLN2RMr3faFOtWDmUng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jh3yB5aGkpw=:+v9f+1BB+3Sm2Ymjgxa9zS
 lj8fsxCEIncQ+bgNyRhnkReXmvU1fhLGWNdinP+7VTNY/t+QO6VSOx8KMumxhNjyEysMEOL27
 gLJkTCmp1h0Nwfj4DX+O902bH9BGjHufO7m+ZhQi8Xk+FJR6oEB2AjmDV7s89aHCagy0MmNlD
 YpsSEXn1ehnKMI0x0Hk0Ge5LVS5yXkYPQ/5gXBBIrax6qkch9+w5JXdgJDAu+nP8q2+fq2MOJ
 pcXXI/llj0WAzCOkv2XOyV06ai/A7SnVnPCjEyWFB9+07i13tn+0CIpLxZRPG/zh82BnkSLwH
 V1eAzTKCdYY9B9vL1rKviC5p9sjR2AKKWGYVLgW4AULk0gSHnKH9VU3uyRj2lvbt8fHbhDWrY
 WCuxYTbLBCK8pZ2crpeuxiO/2jCziFOYc9kJtjLqCxB35j+7L8hCMTwHnI0AuoKOHQHVmtNOa
 MjEcPB4V+9JZmWH2DUaV8q6Xx2kGHTyvg3O1zI0+4LBKDczbia4g7XmRO3LMSIjjHPX0ZuwnD
 ETDPWZUQYHLw4Xqm5eW+EF0FmWNDMXixUmNi41729acgzXfI3AO23pbmSUMSfAwZsHGywZ93R
 QxveplmbHvIWTJn3qlP2rHuh8sLNrkSQd8gyDZqXApPVmbTogyE3OFijYmKQnzt2aHTBlJGUP
 1Q3XNnuY+v8B797WuruUPgvIIWnG4A8IT11QpGfGt4QucXFwLXcwqpDSX8BabA34pVD47Rugh
 NVdTk4rIE+2o3SQUj2AlDSrbPXAwKapnCVAtCK5gpnnmAP3P/LFZ/4gz+mgh0M/YT/NDtZS/j
 LevJr4XPgUT4DDyFz3aV01gr4mMwBwRM30swmoUuES1dg1Zb8F3keaBRnO9Z58EYwT5iOVpmC
 LEIqZ8BX8PFrQ29lYzWcvWEewcmabXe1aRdk3t99IeCwcgVhfxris6NeXSBsI11GkGI70HoDg
 qQHijnze4DSk7cm3Is0hoMxIUmEdkLCq6M/r+jvlkKR4vum/RLxHTDDfDlIf1vXpa4k+reC2g
 xOSe5JjDhvDi5hEGiOy93+/PyJARlVYmio964Vaso6PekB4ff2SyOsNQuxSGzecRJZg9BifUv
 Lu417UKmg7KoCbQTE5tcPARp495PNfEIluY121lKp2REF2V4nOCV6xtXAppPHsvoizXBzxFOC
 qBJ0hgmiiJ4/HB9NuMiGJwsZksfn515rP2JK/D/KsBow0t6sRGqDmZsOC/abYXLwVmDAu0HDA
 PzyMN9hCOhM6fZFnu
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Felix_K=c3=bchling?= <Felix.Kuehling@amd.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> I suggest to improve this change description.
>>
>> * Can an other wording variant be nicer?
>
> Markus's suggestion is as usual extremely imprecise.

I pointed a general possibility out. I did not propose an exact wording
alternative as it happened for other patches.


> However, I also find the message quite unclear.

I find this response interesting.


> It would be good to always use English words.

I am curious how this review will evolve further with such information
also after the third patch version.
https://lore.kernel.org/lkml/20200620091152.11206-1-bernard@vivo.com/
https://lore.kernel.org/patchwork/patch/1260303/

Regards,
Markus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
