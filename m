Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4627E993F1D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 09:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E1210E08B;
	Tue,  8 Oct 2024 07:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Uoq3meEk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258BC10E08B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 07:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1728371101; x=1728975901; i=deller@gmx.de;
 bh=f+ufFDJXja7wX9qR+vE3YFkMVbWWK5IGKDZFtJyW7i8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Uoq3meEkv7G6OttIM/J19rcWGp5CICBHUsjaoDYV146v1xzE6grCCxpe7M31JARZ
 TtSRXUFtmCVqZA8wNlQpfCwYbDk1q3MjRfeZzPtXln0trqX4Yve0wxxKEc64ETfmA
 omesbjJkHuPrGb+O/LPJzP8k7PvnVBGDulDY1PDF3K98TEqG4FzQteCkRx9lB9yhx
 t3Wl3j6fH36CNT1srPUqZ3XRuofj3HuIp8FxVB7Q+Wx8aqIEbm+V4eYax7+7GEUkn
 ZS1NGPMLIfourb5vFcoiqD9jli8EhOZtgmT1U70YrEKQsGvRJDVpC3mmA3FF4Gzpa
 48Nvr+zt2DcmB/ndyQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mv31c-1toerc3NdA-00xGQo; Tue, 08
 Oct 2024 09:05:00 +0200
Message-ID: <ba3303db-f51f-431d-83fe-b02306dbc8fb@gmx.de>
Date: Tue, 8 Oct 2024 09:04:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241007163516.433885-2-u.kleine-koenig@baylibre.com>
 <863209ef-289d-4414-b19f-e0a308d0fba0@suse.de>
 <7l2xan5aa4kvbzeolwdpeccnsfnp5o5zjucnibd6mdhj2abw46@y7vwlg6tnqmt>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <7l2xan5aa4kvbzeolwdpeccnsfnp5o5zjucnibd6mdhj2abw46@y7vwlg6tnqmt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dF+pkZiIPTrKhQjser2sba5DTjlNy7cfkrRXEK5+qtAkBcXZPCD
 JgMCRnUlKHOwoqQkxi3GkBtMKhuURV7ZLOe06JAyKARSDNQlkmtEjwhWu5+FKHA27BX/uRa
 ugJnRXMshE7e5zfydnYsmXRHtB3M+BvFCSICAIDxxPNqsbLL+Pdn/QiAluyHcud/lNjsqeQ
 6ZD2xBOTI9AlkbVgJZY7w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IckWKcrGQtE=;m7kuKzAOsLzNCBqW0tXi5FR0RA4
 tgS9u3/jwtWREsbn+ey9X9PKEZCrNmSry71wHQiw7mVV05cpK1RlKd2uJAz+Ijfar26zrH4Uw
 7/Tv4/6bPVdew29hdWWJ5bvSaYGFeXU1xnqlTAo7hRY+Pi8zDcWpcqLtJ/9TlgBeZyZoOeDm0
 4VI5T4ttK6y7Gfz/HACAVFEmKau46q191t5Lbf1SIddw11yiCPnYPrrMoy0eD7frIY+npQz1K
 xKPhgqK1PNiKOFiUuoSf73zu8onaLkE4Ob6Ne1oDEjipsqALf90wBk0AR/txju9Rk9aIyscE6
 pSt4w7dhzi90dye7MSyvcnCjG8iIPMCc2aEXG9ZC0MtnIzB1OSi4e2NUPmBtfPhxuU2t4f/hq
 TMDXhp0NwJsAYBBPsmraI7XQOeCY+rVH5UiRH7eyu5H0Gg8qZFAAoCMlnFxQSUqMAZ+rDbNIr
 XIVGiTJWTL4vag0UVpc+AknS4zl2GOI1cgUiaqkcABy5j2UZ6gvpYAlUHCzucnGYCFvUA73W8
 pV8AQGLRXWP5FqQ35UNWP4lAXZPu/QqPHF9Q0uQd8s96IwPD0A+CBLS3eIUH0h2Zev8c6OXKp
 UR3xJ32LbEzvbosBRSUVhHu/Klixkrw3QAFaBzoJM/sNx/RuJQZtDER9rnNja/UjvCm1WDOnN
 /bcBnlPYnTpoCmcP0Cr/sytukr5MXYeLEtU5F/86qRV5yGUoAT3tl9pB/hLZ4e9wLrNfQ8c+R
 0oS12h7Qq4FtPuhEKV5+zuuy1o6zFkxXnZctGkZqNB7sbyghTezGfySJzaly40Xjj1gm9sjoo
 Hp4thUobUUvfXJmgBOK0RB1Q==
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

On 10/8/24 08:58, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Oct 08, 2024 at 08:30:40AM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 07.10.24 um 18:35 schrieb Uwe Kleine-K=C3=B6nig:
>>> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
>>> return void") .remove() is (again) the right callback to implement for
>>> platform drivers.
>>>
>>> Convert all platform drivers below drivers/dma after the previous
>>> conversion commits apart from the wireless drivers to use .remove(),
>>> with the eventual goal to drop struct platform_driver::remove_new(). A=
s
>>> .remove() and .remove_new() have the same prototypes, conversion is do=
ne
>>> by just changing the structure member name in the driver initializer.
>>
>> This paragraph refers to dma and wireless code. I don't understand how =
that
>> is related.
>
> Ah, too many patches and missing automation in some parts.
>
> @Helge, can you replace this paragraph by:

will do.
Thanks!
Helge


> 	Convert all platform drivers below drivers/video/fbdev to use .remove()=
,
> 	with the eventual goal to drop struct platform_driver::remove_new(). As
> 	.remove() and .remove_new() have the same prototypes, conversion is don=
e
> 	by just changing the structure member name in the driver initializer.
>
> ? Or should I resend?
>
> Thanks for noticing,
> Uwe

