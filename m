Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EB072598A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D7110E47D;
	Wed,  7 Jun 2023 09:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1938810E47D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1686128881; x=1686733681; i=markus.elfring@web.de;
 bh=VItb0Sx4/20fRlUbFbydrSn0LtSMWdtqET4bVw9sDX8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=HLoi2klC/omwU1T319lQhG1bk5mLG+NJleJ4t3xlVS798WU6L4lkfzcr0iaO6so3oJFrnjb
 J+CzpnpdE85Yml/sNsIqTt3GpZuUoMMk0KnGpArU5Kk/4opRfH7ehYBWwDC+4ZgUQGsKdvWng
 Kk3+pZyJXVhPY9IMTIoRZeebbsO5BNc7yfuXdGqBM91K0Z8HASMf5wmkYGdAdcmpASexckinf
 bESOlFDaJ/K6JJG5xyMLBS7sjyTWZoWtB+U1GLG4Z6ujjLsxja2OdDIWaKE7rzKIZYTxYUC5d
 uMayXzWmz2IpHOMGlo5COE8ZR8cBLS9uvwAXOPYqiq6R9/Cc8GRA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MA4bO-1qIOvS3yos-00By47; Wed, 07
 Jun 2023 11:08:01 +0200
Message-ID: <dc893f7c-c517-4a30-818c-261d6c64b5ba@web.de>
Date: Wed, 7 Jun 2023 11:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [1/4] fbdev: imsttfb: Fix error handling in init_imstt()
To: Helge Deller <deller@gmx.de>, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zheng Wang <zyytlz.wz@163.com>
References: <069f2f78-01f3-9476-d860-2b695c122649@gmx.de>
 <97807a2d-ccf2-1fbf-06f7-085bb1bdf451@web.de>
 <c551c670-7458-ed50-eb2f-5a2b7ba421a8@web.de>
 <7e5643de-5d64-272e-cb36-bbe1e5c187ec@gmx.de>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <7e5643de-5d64-272e-cb36-bbe1e5c187ec@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ePYFjpUfSnNiyvQ1dJJgtd6Eb7pJAYYz2Yrjv2wodsTZ4t5rB+k
 G0DXWUgvSRDBQJoAAJ9oL3RKG/sxvlkdhkJ5GdcsLd7yQBT4A5YLyruDhCXEf7B9x3XdZwq
 r9jeTFC5SJcwqMiQ8VGZ550oNbQ3GuAPFAyNfkDXJsYNwkzyA6sd2DvKbun0HzzQSVRIctO
 rELufPAqvXdK3G31NjqaA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NozEjkHBoME=;HBRRwY92dw6NXPRvbNvVTFrQyq8
 Of56V40YDaace08x0vKVzSmBaOhzdIXoveoRYfYQreTXpb8aHBOz22OnftsJY5DcxTYn8MF0m
 FAhAYUC8MEVihMs/cv5QFw6sur66c3eb3oT71/RsqT0CZwIyayGlul0rZVMTzgZJiaaZXfYMj
 tqxIWxMMODmldBLx0HAOKcqr0yh7RoGC3YadkOVWm8y4tLtoMKustQ91Sueyz3V3qsIjUoVkB
 NeDfduFN1z/TbdvbH1C+EAgmwATZBcc1VXFW43VCU6eOLeUhACGySuyNjRfydwOCrftiq8d0v
 pdg7zSY3/zFiDVUR4JAVZNZKONRog2QS0k+L6gCAKqRquRQw7AYANi7c2Uo24uXq9r724AF6q
 sk4diwDb089C8kheoPSqPPXMT9bUCBv0kvRfr3/h2iPlBDqSUYHyFxxr39XKfnHXmCq/ju7vd
 ude716P1Rc0QhDBylgFfEzGHuDidXUu6SQZzkdgZVx7b8yM/5Eo/7+IPmaJp9I6RLVibLAmo2
 E7E7Fa8OTE8oG6trGrAlG6wkGxDA3JS4JrphCRLYnUKlN8vcP+5VRW0C/peyyk2eG5izBH2CH
 RB9d7ewTvUHuQuPhf9QJfESGmP4m8F9NfIqSweYVW8vkOieXhoCl+QmfopLnwME9zmEWkQsRL
 Rxk6upBf0cpKy7/gNGlCbGQ30WU5XbsYEJ3RCdyuLMmgEfERDGocM8kjeGuU9BaeceM0h9F1l
 CgmBQ5T+FWhCshszbdpRB5ekEp8qmrlnu46wHdmj44DAI8JwrhXITu1HNx/QvTiTEkp1ZG4eD
 wbN0nOtZy2ZUoCA+Y9rSm6bxKRcj8/IN6iSUxhh2UcRKg0KeUSkLC/Rbp+a01MW4VUXH3XWCP
 d5KuDxlE3p8WUV79+2Kt9aOWIKaz+Tj6yYY7sxU3l+1sX5dlqEGN463keZtkoycR27fpptPu2
 /Q2UrQ==
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
Cc: 1395428693sheep@gmail.com, hackerzheng666@gmail.com,
 LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr, alex000young@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> I think the return value isn't checked at all, so you could
> simply return below "-ENODEV" for all cases (instead of "return ret").
> Then you don't need the e_nodev label and can simplify the flow.

I noticed that the software evolution was continued with an other change variant.

fbdev: imsttfb: Release framebuffer and dealloc cmap on error path
https://lore.kernel.org/linux-fbdev/20230527093016.486521-1-deller@gmx.de/
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/video/fbdev/imsttfb.c?h=v6.4-rc5&id=5cf9a090a39c97f4506b7b53739d469b1c05a7e9

Regards,
Markus
