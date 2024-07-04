Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB2D927A52
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 17:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC30E10E088;
	Thu,  4 Jul 2024 15:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="gEHUN9mZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1439010E088
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 15:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1720107651; x=1720712451; i=wahrenst@gmx.net;
 bh=hud1vpInUQlaKt9ICSakeFJcziAncxZvxPZh1ULIInQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=gEHUN9mZQpcA8fkXuUOxqch91i+iX60pXLem6vjqbVdQa51zqSpE2NuZqnEiePHV
 SlVfyQJ6pY0ATtkxFaYr7sXWtGDqkzqnpZD9M5BCfkMCUuRWzI3OTS6lnXp3EIJFQ
 txx86wQrMglvTKL9lj4mwEqFy2MpRcNDrGoWRvNcgYHJZGS+MBB2xjMU1PacooRPB
 eTLizDu9eEb+oX8i2J80SwThUsSPIi7l2BImoiq7iL18PQ4LApooa73TySHj1vvTr
 wYYeJDGxf7qBn+Scub4T0YDu41fPHDbv0dIAL60KyEtudL+KtGW4q0UZs4wDp5+6e
 aSV5rkHFMIFfx+EALQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mj8mV-1rtenX40FJ-00mKAp; Thu, 04
 Jul 2024 17:40:51 +0200
Message-ID: <c14c1656-9f16-4dae-bca6-117583473a58@gmx.net>
Date: Thu, 4 Jul 2024 17:40:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 10/11] serial: 8250_bcm2835aux: add PM suspend/resume
 support
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jassi Brar <jassisinghbrar@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com
References: <20240630153652.318882-1-wahrenst@gmx.net>
 <20240630165304.323095-1-wahrenst@gmx.net>
 <6b987d6c-daa0-481f-8333-9e0fb9996a69@broadcom.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <6b987d6c-daa0-481f-8333-9e0fb9996a69@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ve7EXqG1MpDqKtVknr59hKvp+E96Mnf1jhzgBGe1/6Za/l2DRx8
 7QOuTgEuOOCyECYAUetqTl7XZAVRzOJHv9emADRX6P7/QQBS1IflvRoK6da05FXcbyc/wjx
 fulFLHATNYHqKnzwSPkTWacDr0M8Tt08uHrce2pEWNlkWHk2lSclwhRD9vTk7oNGnPvrS4w
 UKSfxFWn/kqb/8hzyPrGA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wuzcuiK83II=;7RPNe1qDOEPvIJ597g7St04Xbie
 z0DirYdff5Jy2GvQ2B+n0becS07714DFe4wg0f6wJm60DaQI6yBna58CeRZ8JD5HZtE/KbudP
 /23o0TI/Vfa79loPgGzRLuPxDt9uo6JBgEKcgS7jM/pqifK8jq5J8+uiNC3tTSI7dRqhLrGw6
 dGoU1JtDv7z/h02Ak/0/FyQiRwxh1JCnxxCnjyiEF/fbgVhjZMPQgS2ZOz4TDrAICgxyQXgVE
 GoT8jWrJTAUlTmZ+j9tLq1THOC+egk2N24IcxIEn0ehiWC4EC/G5YOfZLNTp870ph3iUpwhWU
 ACrFJK/5KuZkkEv7sZwONL/avUkaVL62AdW4nIo6sdjcVyd1jmXF7jJqLOpAkFw0tWbYe4rfG
 1POa78mtA9eXCw5msvzFUel4hLgV5mLhufb58EQqL54/9lL1wn+199G+2K6azqOuzsNleopHy
 2J3Vl/RYrVCzvHCxcuUudTSGPKJH69hb8s/ekM5e8I0OTT9717ShidQ+eoxfKodKKNchndtXB
 4TzGYjEKyPB3jwmiMimpzvKuBmwhHf7T5H+sJ0mBTTRGuHwH1myI3/7sC/xnzrL8taZUwPPLv
 mKsWvluqcDlNHKXjp4dCMQoe4eNW/twC2TLoYLKYFMT4qFdBDl7nmDdCaANFO8bUEbQxrUfG4
 Pr9ac09npjouWUI1ylRtcNvNWqEftMQTSn63W9QcjOY9oH4wujsyyNJBbX9aAcKMkuOAd1J7D
 X12oVaOm/y/A40bCE7rqOMksPFJTDjZUC10viZFOkZCdFR6cXp3SEcuHa1DjhuDKYFG44EWCM
 xVHFvBYoeExUCzquqhYIwLI9QHlXqK9tVKQyIBIYiyntw=
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

Hi Florian,

Am 04.07.24 um 16:12 schrieb Florian Fainelli:
>
>
> On 6/30/2024 5:53 PM, Stefan Wahren wrote:
>> This adds suspend/resume support for the 8250_bcm2835aux
>> driver to provide power management support on attached
>> devices.
>>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>>
>> Since i don't have a RS485 setup, any test feedback would be great.
>>
>> =C2=A0 drivers/tty/serial/8250/8250_bcm2835aux.c | 23 +++++++++++++++++=
++++++
>> =C2=A0 1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/tty/serial/8250/8250_bcm2835aux.c
>> b/drivers/tty/serial/8250/8250_bcm2835aux.c
>> index 121a5ce86050..cccd2a09cb6f 100644
>> --- a/drivers/tty/serial/8250/8250_bcm2835aux.c
>> +++ b/drivers/tty/serial/8250/8250_bcm2835aux.c
>> @@ -213,11 +213,34 @@ static const struct acpi_device_id
>> bcm2835aux_serial_acpi_match[] =3D {
>> =C2=A0 };
>> =C2=A0 MODULE_DEVICE_TABLE(acpi, bcm2835aux_serial_acpi_match);
>>
>> +static int __maybe_unused bcm2835aux_suspend(struct device *dev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct bcm2835aux_data *data =3D dev_get_drvdata(de=
v);
>> +
>> +=C2=A0=C2=A0=C2=A0 serial8250_suspend_port(data->line);
>
> Don't you also need to disable the clock here, unless the device is a
> wake-up source, and conversely re-enable the clock upon resume?
at first I experiment with the pm implementation from 8250_uniphier.c,
but this didn't work as soon as I drop "no_console_suspend" from the
Kernel cmdline. Maybe that's the wrong pattern.

