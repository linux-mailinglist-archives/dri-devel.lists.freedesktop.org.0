Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC97E5FFF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 22:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9041810E85D;
	Wed,  8 Nov 2023 21:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF57C10E85D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 21:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1699479140; x=1700083940; i=deller@gmx.de;
 bh=8g+qouQ6w/MrUtcGiBFXPZfAqztZdYaKnGgwJmYaLA0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=QFJGB/yfZbeiiXhtVUUxpHEOsY3f3awz38L9PBpRUaegM1TNFi8IXg7J2zpLLAHh
 XvwOl2s2LgAHkwYy+sitXriXNZW0bOdJO1xr25kG6JmjyhX4SYCXJSNVQV7AYaEF6
 T7EkAxteGFivxzVkDSSwiq23E5Ibuo3IRZEZ2sYuJc4jA/gceHGSzms0X17gY2dqg
 EVA/PWmikY2dJazuIRWAFIRZZ169NLYLO2/VBIBtcrBDmANptOSqMfEsZvsiBu8o3
 a+YMaPHOssPzAwgv9Sp2RDA0qkuAlccuJJGbgK3JooSkONzlY4KImMQP40aRo1KLV
 pK2L/Q1c+1ExeH3ABw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.158.7]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mnps0-1rkHvC1j8U-00pPTc; Wed, 08
 Nov 2023 22:32:20 +0100
Message-ID: <9559f1d6-f68e-4c14-83b0-e5a545039124@gmx.de>
Date: Wed, 8 Nov 2023 22:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/22] fb: amifb: Stop using platform_driver_probe()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
 <20231107091740.3924258-2-u.kleine-koenig@pengutronix.de>
 <CAMuHMdVaaH_ZJT+jAyxZxnVYT3L=b4B-LEMTP4PqQH2TE0nH6g@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CAMuHMdVaaH_ZJT+jAyxZxnVYT3L=b4B-LEMTP4PqQH2TE0nH6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZbIvSrd0pdT70WD9GOHvzGIp93gRRjj75pcMgtABFgJVzjsv6gL
 bhdCH8KkYV232JKGEnXrs6ALutGI2xGbaGH9oD3lnQUrUNdH3PQXCzpF/WjAJe7ISc8lquX
 51Gc5WoVS66SNnLx6lk6h61rLSO1F1b7vFK+s5Ar6KTZAdUkFPkEMCxhjy0abyWRAlaOAbx
 ODbLsbnm/3u6e6o3MaZPA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BF/XgaNSlho=;XJszsbgLwvkw4EQZcuzXjSWxibQ
 HjCAncSL6OAdMpqmua+3dhwmNGC4E52BKI2bnoTnWBTXgrvgtMzs/LeNDS91REIdsivhAZlsX
 MQWFBcwX8PDBxZ6tmIF6CQ003MW8IYnFKbsQixfrWWEzoggY5dyNUY8PLOqFqIJUkhDXOd1Dl
 WzM2gL4jM7hWGOov2Szg++bifABnbjzI9u4D/XO9vamlTxmhfYHwPBL4kR1YoO5CF4Y50eZAw
 8FFilCwjAZ+ZpoyGnoNTjxW5+MBBgJqDzUiuJOZJqXsvp7hJnI//fTTiv9QXB4yv8g5MvQzLe
 GZUhIgncZeq6YzrnlLwDXicFJ5fpKzDOQmOAw9vOmKmx7n8W/6LkOHmc06hZDKUrJ9g3M61aD
 IoPiSZp3T5HH8jXqwGKQDSovZTpeooPAaz5qccag8GWNOu+htW6pI/CGl1uyuSTLsLmXd1Eji
 aLzxjHooltYFCmRdJivxXMERyOo41Jws7vC74BdzXoiYE5YniP9gnU8r006DbgHEloRZJk2ow
 2y9VcPya6iIKj0VC18SYF/DIMktMJjuWdFnbrcsok2/EE9/H+wsxOyeZkauZ1B2SdiiouCWXx
 3vm162VMzBtdoJeUm5uYhAsaGC52pNic8bh75oWPv9kA0j2zID/S6WpqHFhaZImnZDu1j8ORd
 ViejXq30zDrX8nSbT5OaaM3WA1PxwOoelKvri+D/ylOpMJNUjxvAFW/wOsMPRC+iNDeu4UI5g
 ugvgQAnwON5M1qlPbgZz1MJ35iCIySAfDpsp8m3RBYAMJdwCjmplm4WMuDaw4Wht7F4NWZg+Q
 JRGSfoq0OGZ0G1bnmBmkNAPCqu+/fKEmqxdMrehy9JrXb/iUooxvRZUMm50l8Ter8LFu0ndN3
 1MQLXTlI41gWuXpUGIZrZghdsSPyhGKgOnk+QgLfgLZVSQSqKH4p0z0Svo/RGcKg/wR4U8t2s
 fmYA2g==
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 kernel@pengutronix.de, Atul Raut <rauji.raut@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/8/23 22:06, Geert Uytterhoeven wrote:
> On Tue, Nov 7, 2023 at 10:20=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
>> On today's platforms the benefit of platform_driver_probe() isn't that
>> relevant any more. It allows to drop some code after booting (or module
>> loading) for .probe() and discard the .remove() function completely if
>> the driver is built-in. This typically saves a few 100k.
>
> Which is a lot on platforms with only a few MiBs of RAM...

True.
Given the warnings below, what is your suggestion?
Better to drop the amifb patch ?

Helge
...
> WARNING: modpost: vmlinux: section mismatch in reference:
> amifb_probe+0x15c (section: .text) -> ami_modedb (section: .init.data)
> ...

