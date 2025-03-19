Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA66A69764
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 19:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B2610E164;
	Wed, 19 Mar 2025 18:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="KhZXkuk/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2456110E164
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 18:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1742407448; x=1743012248; i=deller@gmx.de;
 bh=xuihO2mJ8YzCzkQm989rIYF9z98E4snXJIeDZ1KRA44=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=KhZXkuk/d+JuEPCrZNq27A18v8aQUKta1iDeP7U37u6USkYFbCVVzSxUHFoBBCqw
 p7Edz5imv6+q9N8Kf1lUR6c9H5P4IeqN2jUcriLfwuQxmf+hvoDMYJ3FFWJ9HiFDf
 n1Bo/sD0gEgr6BYO7UFOj49k0Sq6KhNqSLIsDR+Mb1lwuYnz5Rv0EBmf1TWiPkTqM
 1rVl/8DxGcWk3Hct6MU8mvPyMx1qI+77cKjSigimLDb1bzqJhprro3HGB8YXGhq85
 JcGT05gJdhU4L4R7x/1wzkTq4fvxppgSVwvZaQDr4gXjRlSMpUBITeV9jgUdwSm0Q
 SW74AQA/sZNDVD+qZg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.121]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIwzA-1tagpW0IKg-00MITx; Wed, 19
 Mar 2025 19:04:08 +0100
Message-ID: <0acc718e-2290-4638-a9d1-3182e2a4aa7f@gmx.de>
Date: Wed, 19 Mar 2025 19:04:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 0/2] Refactoring the fbcon packed pixel drawing
 routines
To: Zsolt Kajtar <soci@c64.rulez.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
References: <20250309184716.13732-1-soci@c64.rulez.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250309184716.13732-1-soci@c64.rulez.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DPub7ujLJTq9UHWiW1S4AfgzQjhWDVJzBOScYsFS8Syoy0COF+n
 Rc1etlVUSumMW3/Vt3oTVLvcpw9IU6mySfobONu219kX/p9cKqp4EQejSCxAvZZLPZZ7GzU
 JSsSFY96t+d4kF3jxNqbev2sOxnf5AMc6y63JLd8B2fE1YDnZWA+uN7I0f7k0g81eDGUVjj
 ZTMEkAnGSP893gq4Vw0Vg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/kdf1N/Lj1c=;94l3ciKiw0EAkL86vCjHyFSbCBo
 bstaztnBsKXx7w8Z9SZcgNDfifJ6fKWKcbLiLTDVm94giLC5RV7EOnPQihoaQaZR51EyBaAHR
 Nl0kgDWTyZIOr/rkiS7BK9uMM3wuTHjzbGxQ3d+dzrNPvexhd4xneTBonmSFiTUrTSvTzSBsg
 w6XgLBl5AXEVFnr7Mq1QfgNybFdpLbmsZHJnKbnRX17oC0z33lqwv4CiY5EW0fPe+yuQBd3ff
 yXV2X1F0rS7aRyX8wx9AsT/pyTbjpJA8lX6cry0bLNKDcXdyByIfsUZz27P8xRDyZMgoda/AR
 wn9nqN+GJuP1aqsb9WMaW8Vh5stHXxIW4UtDjt2Z8Hy52TAU1f5ijTozKkid/oDjeI6wKLito
 5UbxAHv1ecMc/i2Dhsihrril4w2qgKe1XGxMSPEYfnN5KxdfyE8y7qd313qx3gvkL44KyptLV
 j/3fInJ7AneCOCjNuwUhuhpJltxyttmRf+3Me/XqfZJZVW7bP/fZQlZRKJlCW3KN2V1e1gSBC
 yVz7dm1ZhInifvnixADADS1ZhG5wChbh8TIireMcIyC1vstuqm3nbbKdeFdedz5DYqg/mR/bl
 +WQpTbD7vjgXcbz1FYMSmo8EOZfzKby27Ox7hON7yK/Biw32+oUYcJpuckOvl1jhu75H0/kRX
 41YvOJyB/Rpgt4guOV+es1QyeK24/dNFcV2BxIxRW59rVzrZXerGAEkZhhFsSaZyS2PosS7/v
 AlXA3fwIt3yAOp3NwPXQjyTFAhD4qSQk3NZUn9LTqj34fQSv7l7nSeavg9B4GywStUr2IKuuP
 HuG4nSE7GOIZsY9aDaquzQqq+bfmQEOYDRttELUu8PRopEQL2oMCDTLC0FjQppz1VzgDdera0
 HXrSbYVeEcThfY25ysh+e7bWxCnS+MuTjSY+tHjQuPz5ypkkjVTe7g09VQieDLJJFa/JiRPT0
 lI2VrSJF7FPs8HkrpcgjsATW+LA1OapUiQnzx0JO1DBP37KEdfY9PIqpVQvNumwKyOw/BCNBh
 zpDRCbgiZchWczz1K0VdNVc6D9VR+1qaIL2yEZEn4cvgw93vzgSSNKpsxS6uVkOgZkesN0WNu
 Jd1G+FkOyfrvRdu33iiYt7l2/0ZUPfeLyS3bQBBP6Ts5vPlIlOOsOxKUeo8W/9yQzr7l2ZFf5
 fkqtJeS5SXJHN5ojlcOt64XHIQJ8ElLB11LV+7qlw0CJ4+cXQnCyS6cNm/IZEsWQjReUT+RsO
 6yRNiXCB8rpm9WS/uI/lOuBnXuzTQ785P337JWKX7fL637dDg3ntl/d9O5bAPbfChhkd2Ss57
 6soX/sn3CC9ufUQvvKlBDQd+C23PlvK6di2nR03pHAjdqwm2zWhPXlrfZaVJMtcYKsgNRuNv6
 TwIeK1lIfXPI371xwH6kkgzoGBNwRsuLyrAAAdz1hYwHfKJ96AyFuCCWy4o47wni1sFBCuaoV
 ZeXcG9GDaGQFXTBiIhtl0LhSVQRg=
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

On 3/9/25 19:47, Zsolt Kajtar wrote:
> This is the same patch as before just updated to latest fbdev
> master and with better description. And hopefully sent intact this
> time.
>
> Zsolt Kajtar (2):
>    Refactoring the fbcon packed pixel drawing routines
>    Adding contact info for packed pixel drawing

This patch series has now been in fbdev for-next git tree for 10 days
without any major issues reported so far.

I think it's a good and necessary cleanup, although it's of
course quite big (but mostly copy&paste).

I'd like to get some feedback if there are any major
objections that this goes upstream during the next merge window?
(Thomas: I know you were not very enthusiastic about
the previous patch set. I think this one is better.)

Helge

>   MAINTAINERS                             |  16 +
>   drivers/video/fbdev/core/Kconfig        |  10 +-
>   drivers/video/fbdev/core/cfbcopyarea.c  | 428 +-------------------
>   drivers/video/fbdev/core/cfbfillrect.c  | 362 +----------------
>   drivers/video/fbdev/core/cfbimgblt.c    | 357 +----------------
>   drivers/video/fbdev/core/cfbmem.h       |  43 ++
>   drivers/video/fbdev/core/fb_copyarea.h  | 405 +++++++++++++++++++
>   drivers/video/fbdev/core/fb_draw.h      | 274 ++++++-------
>   drivers/video/fbdev/core/fb_fillrect.h  | 280 ++++++++++++++
>   drivers/video/fbdev/core/fb_imageblit.h | 495 ++++++++++++++++++++++++
>   drivers/video/fbdev/core/syscopyarea.c  | 369 +-----------------
>   drivers/video/fbdev/core/sysfillrect.c  | 324 +---------------
>   drivers/video/fbdev/core/sysimgblt.c    | 333 +---------------
>   drivers/video/fbdev/core/sysmem.h       |  39 ++
>   14 files changed, 1480 insertions(+), 2255 deletions(-)
>   create mode 100644 drivers/video/fbdev/core/cfbmem.h
>   create mode 100644 drivers/video/fbdev/core/fb_copyarea.h
>   create mode 100644 drivers/video/fbdev/core/fb_fillrect.h
>   create mode 100644 drivers/video/fbdev/core/fb_imageblit.h
>   create mode 100644 drivers/video/fbdev/core/sysmem.h
>

