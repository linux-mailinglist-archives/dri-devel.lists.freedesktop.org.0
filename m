Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F7D9EB36E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 15:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3FA10E3C1;
	Tue, 10 Dec 2024 14:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="NCDm9gb0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D59210E3C1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1733841276; x=1734446076; i=deller@gmx.de;
 bh=ovhxzLa/8jUYl5kvOMEd8c3o5SBp/7V1cj39CApQCV4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NCDm9gb0swDTRCTglqe21NU7QQEX3bgut9OPRgavmzfdJHhTQh01hGpPvP7QW63x
 sa5JO+B/tPxbmYwILkcPFMnUzlrnX8Yh5j+2S8Z9u2XbnCYa+3VdZZAfdfd5ROJSL
 QaqbGM6ym7Xj9UZuSP0j/xOUJEnPTOfwpSCSdpziRDpW7Ob29fUoVd9X/ljomp41p
 4nj1fJzlwOgHFaTSlQ4Zk7Z91QSODRv4BYV8Mhoft9ARgJ9VH/i9GKn9TUcnd6/Cn
 0heyIf8wRsYTA1Yc/SOqrN9NfuQB48dwGdM0ODbgWIdyqQ2v+NFvyAwqh2lmVgo5E
 FKl+xsK8h/gB4r6F8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw7f-1u412V13ND-00cZfB; Tue, 10
 Dec 2024 15:34:36 +0100
Message-ID: <de810def-84ac-4d55-b625-536b5781a20f@gmx.de>
Date: Tue, 10 Dec 2024 15:34:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
From: Helge Deller <deller@gmx.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 arnd@arndb.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241210142329.660801-1-tzimmermann@suse.de>
 <20241210142329.660801-2-tzimmermann@suse.de>
 <b5136312-e18c-46cb-9a01-3efc61d6fd9a@gmx.de>
Content-Language: en-US
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <b5136312-e18c-46cb-9a01-3efc61d6fd9a@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JbFt7Btsk+9PSBxMORdqKfCeGnR9IN1dTyKsbfkNszHIk7rVWDq
 2lnFZ0zlRmKVx5AEi6AyMfbWihLWH0fRym3k5LD9Z/Oq27y+TvLF2S0CoM5VBTPz4/cpBSp
 ljoZ9L9AWBUgtX+Uebesp1EmHbTJ+ZpzKhyIO4A7dlkXfD6085iJxdoreGY93iIozYRZxU6
 /07ZixpC8O4XhIY1fu8uQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dFDXUuBbhKI=;9KrARmoGRB/gogMLahhp5km/jqS
 aNvDlj2B5Q+KRvj0+ht1+xbKke6/a6JxM9o7MnaJ3b0YxIb4XYBfYKPycUGi+2hQmSp1Mk1yd
 QO0XX0gsFyJUcZCVeG4euYvHyjHVJWxY6gdc/QV6l4JKiD+22sCsCyrY2IqJSa41nxI6WpqcM
 yB0AREQX40JGvntPwIgunCmTEgCtuhUTKmAxhD8QlZEcb7TaOMQCdDNC0EcFTV3F+Z3kNTzoq
 Ot7zuyQezAnrTIY0GcPKn4iQFCjbvWst6AUnnX/I764nhxfkCd98/Bgs6au1rGhlrAbfUG430
 sOLjzE3FyZbjpS3j4lbf05LKs/8G/GJKCoSZa5TfXZ+c4HroL6YHDJ6YrmkSozdB2Do5YdxR7
 bpN+6QcV4x2RLQQD0Pgl8CauxdNbBswEf5uNYLqaCVylIgtKHs7dD/GQayoS9boUZLXy0GaOS
 tLPkERSmj+sJ6zkOABBfdS63jUJE5S5RdR9fRJS2/JdZU/SVWxuprrtq8C2dwm97zGeYbpbVq
 aJR7vJfT7XXKvPw/sxcowNA3ILTV9GhrTAYpe+oQZMSgVPG32X/sIGyCxf+i2ZxbwNoLGiFk3
 AH4vBVgaO5CsPcGo0ZpomH992YvvMGVoKWEwnhoORwqA1m2e7qY5P10CRdFyKEZtGmxnec4BK
 hIEViYQchJNDXWw3pLl16ARU71q76TwRXSEdLAzPxU5flNenMYieqZdkmRsi3Ev7kcs5EXm+X
 hIgx0BaIJ3Z+YUEGCBo6WFWxjrUjAdWq+/IHdqu9d8/f8QCLeINmq1xIPqE6kk18qdnsDpkqs
 D13IH6wBaS9jbOfPlrrt3Y/i5J4rqI0RxUpC7TAkSFBbO/eseX8fPkDoOKRfh8oASc6s5jqsx
 GsitUSoVKJjhKz63BV4S4WmrLASHvf4anLXTIJ1t+McFKT8NNVIvbqXwUoWrqnj/CJ0f8yeQY
 LvtQuE/3PBk0U6d1GeGPmfKmA8JzlWqJkXQoL3y26diLUhogc9hOULdUSKggXysqwDI5WX6MX
 hbtCnoS6qGGhyASa3S8F7xVY3QoXk1cMQuI3Y+cm8BwehYJbPDSkXXskMvrxUa/r1Vi/dLoVv
 TK0u3cLjVvk8gWl3iV6XK0gcqRy0D9
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

On 12/10/24 15:29, Helge Deller wrote:
> On 12/10/24 15:09, Thomas Zimmermann wrote:
>> diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kcon=
fig
>> index 77ab44362f16..577e91ff7bf6 100644
>> --- a/drivers/staging/fbtft/Kconfig
>> +++ b/drivers/staging/fbtft/Kconfig
>> @@ -3,6 +3,7 @@ menuconfig FB_TFT
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "Support for small TFT LCD disp=
lay modules"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on FB && SPI
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on FB_DEVICE
>> +=C2=A0=C2=A0=C2=A0 depends on BACKLIGHT_DEVICE_CLASS
>
> Typo. Should be BACKLIGHT_CLASS_DEVICE...

Beside the typo:
In this case, doesn't it make sense to "select BACKLIGHT_DEVICE_CLASS" ins=
tead?
If people want the fbtft, backlight support should be enabled too.

Helge

