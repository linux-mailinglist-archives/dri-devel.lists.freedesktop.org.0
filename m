Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3A9A9AA9E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 12:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EC510E7C7;
	Thu, 24 Apr 2025 10:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="X/RPuHUs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2542610E7C7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 10:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1745491195; x=1746095995; i=deller@gmx.de;
 bh=xP4Tf79KqAuLlTb0FwQb/+buXy1DPxPoIe/ehI0F5Ig=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=X/RPuHUsRQBtEjnyySjzTdW7+n0EfeEXxu7mdLyVJbQRPswTFEqbDMTynhcZPCRU
 xH5B769uOvW+gg7VrZ5tWJnVijOUW4Wo/xUJtbQjTgbzr22hAOicclFt/fi9I7+RS
 Pk8bZqvUufr1QihlMVqt/TvuhndWe1LI9RCnZBlLxc3So7jHTAU2Amb2XfT3wJpRX
 4jJl7X8/0Ze3TvwvBtIvcsz0rxFfupC3PetWP+pY6u8nd6ultBpkd5TASmxZeYX8r
 AIN+Z0kIV6rFqLp6PS9Zb6GBuxxkqc+kem6SAqQavA2wEPbrMcC+Skk27FANHAC0R
 p3ABAyCAm33b5Oqucw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MeU0k-1uiKg32gey-00phI4; Thu, 24
 Apr 2025 12:39:55 +0200
Message-ID: <452a0622-5d2a-4a19-946c-536cf4130133@gmx.de>
Date: Thu, 24 Apr 2025 12:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: via: use new GPIO line value setter callbacks
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-video-v1-1-200ea4d24a29@linaro.org>
 <CACRpkdY0d_a8qzN2bJD+yzZ0P_twwPM21yV771YoABuVQzXAUg@mail.gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CACRpkdY0d_a8qzN2bJD+yzZ0P_twwPM21yV771YoABuVQzXAUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cX+jAVkwEd4MqhU2/AohxiHsnRCu7WChZ1Z5v2jXf+QyGJDa0+K
 cN/bXekuU/KbcPiki7EUXIDaJqK3MhVF98J/SduyB54mU7FENdGpxjlQq41qKCYUq2jPJ/Z
 43mJPeT79JcoIK8J6WmeY6HfgP8BBMzW8m95SjFqhDet1PM7VWSoGGCRFgJN/DHQ09CzIOl
 NHjhfWmJD5PJyyXcrW1zg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eFF75nhUyP4=;ufqSyyMvZAB4Vyo32iUIC1by4eI
 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
 IKiV6tUWJuWv4URAV6YNPeyJiP6O6Hg=
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

On 4/24/25 10:52, Linus Walleij wrote:
> On Tue, Apr 8, 2025 at 9:43=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>=20
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> struct gpio_chip now has callbacks for setting line values that return
>> an integer, allowing to indicate failures. Convert the driver to using
>> them.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

added to fbdev for-next tree.

Thanks!
Helge
