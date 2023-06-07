Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCA1725992
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C76E10E481;
	Wed,  7 Jun 2023 09:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CABB10E48A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1686128913; x=1686733713; i=markus.elfring@web.de;
 bh=Yj97qsTfunhUueXNq0q1rJKCpavuSL6kOegsRx8g25k=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=kl2etMEc//aLe8DADiNPUeIzxN8fKbDdT1tK9D1cB4DlnIrWdT9UbWFFzgRrkppEIJADqNy
 6qYI5IVKr8L5KGvzvxQnl5qPneRFTIWCin0UEf+wlrg1FYa5g8P6thEO1TXUllGMFfKAe7X4U
 IIU/2i4+dqkhdBzjz8rk36HlZmYGkbwahS+93nSgwO276S8BckItKiC6jr8PmXlIAGPv/0jVo
 YJrluXl9JmVfJR6I6fumsAK809KzrSdl5dhD5RAo/kdCOjx8aAOrzAJehOYAvIbDsoTYOLhM8
 hRg6twKas6tDfJVUZSrX1FveZGKfIyUUDe8pOtUXazoVKIK3aYiA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MMXx5-1qQHiQ2XSB-00JQTz; Wed, 07
 Jun 2023 11:08:33 +0200
Message-ID: <5fed7bff-4040-497e-5e1d-f6d7f9f383f6@web.de>
Date: Wed, 7 Jun 2023 11:08:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [2/4] fbdev: imsttfb: Fix exception handling in imsttfb_probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zheng Wang <zyytlz.wz@163.com>
References: <069f2f78-01f3-9476-d860-2b695c122649@gmx.de>
 <97807a2d-ccf2-1fbf-06f7-085bb1bdf451@web.de>
 <e98a620b-7b3b-0d5c-3bc8-4cbbda1dd057@web.de>
In-Reply-To: <e98a620b-7b3b-0d5c-3bc8-4cbbda1dd057@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Y0md0Qw1j8+VIA5X1GbBuTsvGcd2kA9zbVGMqyU1XFZuGWS4Rbt
 Wrmx7DEjELt5xOXNxbScc1bh6rcriGx8Y+HvU9lxrQDHxEH00vdMz7Sl3YisNAG8bznnVxZ
 25KXioTDUmJtv3HXdnuYnFEf3kCqQYps2Qa/DnqPeJJr6UYUXSJn9JqKlBJRUlY88egrezg
 Mi/aF9i6dWR0Xe0QSVPhQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A5rpwg1B70s=;o+AY9AmHbs6mbknW/9N6YDGHsLO
 76QCNBId48OqKh57ALjUVPWB3k3WAG082/oYttS/cdQQ7kGUw1SeCUhrc/twVjfGRcslZxtFP
 AVrigbuFI7mDuZdnpzrZDg8yDcroHoGftrFjwa++Tmbw5wS9astk0LwWH1sy8Xn6RQZMEW+WO
 t4tt6xIjAkn+gGElf2Y7YwlZsFGdUx56y5KeYNoxC0J3EZWUdU/IvlcueGlq6kvz6BUXrgMqw
 XCtHDMtvGzFbpLVVpHX39WHpK6Hmp0UokSMxm9AjL61HFcUU2jEjP1EClan1iIFiDJ+Rc2gjZ
 4Xqlbbs5ZJ6c6QTZYo0nBTfoELKaA+oTzIK1RIBQlw1PikgZD7dFMSkOPznyz8ez97xm2Ku2L
 1fkhw0Yn0B6mXB7KAkSrol7AkaTeklCbhmvgeCcyH+IFgYTJF3GfyJoL7qMzk+SNo624XdU9p
 Y2xqsAhoUdn1EZYzweBN15PD1X1pgR6RWPPThiR7B2Qu317Hi1F3UoOfHLPylZ+NpjKTgcXoZ
 fMPkKxDQvJK1VZEa3KNS1tnpteq8tS5uPJqTnggk6tr9Gp7fy//l+eNiExUxNo5RBSXWQdQqW
 eg+CB84oT8+GNSEfsdrznprRPqOqag+NZcikUgzbSpgUaOfcl6MB1AhSdkrC/Xa2V8w1jrYs5
 ZffWjpthY6a/kFVvK6Ye3P76q1QcSQxvbCcCcGluAWKRCo4xwvEL22NZjF0iksFlMGqWJ+prk
 smptJRUQjKtb8Wbv+wNR21N0OUkxoW3W4ux6lV1JYasgtn0CvCpKmJGk5MqD4ZyaCO+R1mk2a
 SvjCmOmmLiKhSeMDtRsD5+j1ddQJn2zv+eZo06DZLW7yGULXYNE3uQuzlgVG2THX+9qrskwC5
 U3F0TS+PogSmlLG+VXfPeE/yJ4bywhlYicsKdD9e8KdXydgrxAVJyNA2MZ/Dciy4SHbu/YOi4
 st/UlCUf9VnD0QXOoaeQ+Lsw7AY=
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

> The exception handling was incomplete.
>
> The label =E2=80=9Cerror=E2=80=9D was used to jump to another pointer ch=
eck despite of
> the detail in the implementation of the function =E2=80=9Cimsttfb_probe=
=E2=80=9D
> that it was determined already that the corresponding variable
> contained a null pointer.
>
> * Thus use more appropriate labels instead.
>
> * Delete two redundant checks.

I noticed that the software evolution was continued with an other change v=
ariant.

fbdev: imsttfb: Fix error path of imsttfb_probe()
https://lore.kernel.org/linux-fbdev/20230527093901.487483-1-deller@gmx.de/
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
drivers/video/fbdev/imsttfb.c?h=3Dv6.4-rc5&id=3D518ecb6a209f6ff678aeadf9f2=
bf870c0982ca85

Regards,
Markus
