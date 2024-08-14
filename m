Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C810952461
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 23:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DC610E02C;
	Wed, 14 Aug 2024 21:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="clz0GnUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AD510E02C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 21:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1723669244; x=1724274044; i=wahrenst@gmx.net;
 bh=A5HpoTDVSE1dS0ZLEhv9UsGr/Pgabg63vssx9s0dUQw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=clz0GnUOIXqPeB5tT9rV6hgLrO9pu5+YBKNgBueBrpi7OW+PFkOP6sFCr+sLMyk5
 210O/siWBcpQhSQBdY3q87eS6Im6Ic983SclpJbYoHeDtp+ciZwETKEnTNCKYfTiT
 KIzGw4TUZYV2OUJAN6KUOlC19/f0vYLCaVIxxhWAk84kx6YHiQMhvo/oNPoxFNTxX
 XLKQpb7pVD6AeDzbVCkMZWM+OG36VlgtfRKt4lqUa7sztHig+sFhvhEIyft29VHq5
 mC2E32z7fp2mgZ2h50QCRrckX7R4eW/TYcP82Y2WARG3HnwHIX4HniPzQuBnIpuZV
 cSkSQNSuXxhubZlrow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4hvb-1sDMPs47zb-010U3p; Wed, 14
 Aug 2024 22:54:44 +0200
Message-ID: <462f908d-7df5-4e8f-a15f-53e66459d488@gmx.net>
Date: Wed, 14 Aug 2024 22:54:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 15/16] serial: 8250_bcm2835aux: add PM suspend/resume
 support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
 <20240728130029.78279-7-wahrenst@gmx.net>
 <CAPDyKFoJh3j8xSeXZ9o031YZLTCDYVA+dgvURuwozjDpU_aauA@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAPDyKFoJh3j8xSeXZ9o031YZLTCDYVA+dgvURuwozjDpU_aauA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:GWkQ30JTD9xmzJR7P4IsreC0adykqs3k0ETwX0XotEfmlCrcnxI
 MGUBUkwDz8LCP6J8AjbtMm1Q/awqSTaNghR5KlrGCLJ2cLgJckBX5SF/J004XIGbOkJXbCV
 hUq7yrgoPZXrAWPvUEi9kpO+Bp12Bpgu078Px16rIC0/Uy8eHBcSrVY3EGbCv+X9W3F1wVu
 ew5PZASbz/KKWNcS+ULwA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hL4PaKZPPPY=;gsO0pSxVZEKGBEM+PAQKwJcoRVA
 5ELE+o7snnyenaSp7N6Ju2qX0tzQuFaPc8W+tRLEdFob/GHP4qtD8M6AoO+GUoCWb/XFVAdx5
 RnjVtfK+ylVB1ZAc12xsMtlsyvickXcvC/7htLZ0nYSYaErn/GuH72btB/m6j3AC6gkLEnDq4
 Rw4Zud4n7SKAJbsy3sjmeYt2CGY/OvwHbPuAIxVnsshn3vKywQtM0vrJUfEbMK77tWvcrULve
 olIVzC5AA0f99iqpbUcfBEgGBncB8Wpba78n5QI1Y5O0EzyPdcby/lgO8QkCYsFnQKgGC2pRK
 QjDXUsS7fg4HMJaAJ+c4A2HL1mSEuTrCSXQ1Hp5QYnMs1ytbNN2VzYFZIB2tflFxIJMYbM/0G
 RP0tQVUgYBuzlbRvlz9/SpDkEawURI1RZfsb0fnhzIOGDuZzYcqK1BQ3l9sLTvUXoL1cFPV26
 IMKPHiAdd1C53iIbsKNnDwXHpDOWCrTXmBRoHmnjArKN4aWpHTIz0q59OFzk3EYw4JAhPop7t
 HJfbvnqjsRvDd0x+LsZYC27juNFnwFWg8kXKoHjSWys3eJccPciGwWnHjoLbumbFGs/L8NIPi
 nduwzYEJ0PiMioHglHoRNlEs5mFz/olG6HFU5ryCRL1sesC9n6oeYzxtrPy6JWYoe0CR/pM1w
 JX1NMD/mFRZib2c8kZscWoUYB2mkVPTOTQkkuD7BGURw3yNgSk6evVsCQGGhl5Y8k73GBTtHB
 kdkdkeRLIQLm//z7pyKJR1gtzZcRcxTA5rB+ItJFTocOEVoGfzrCeOG9yE/ZyjLkLHaMUO+Dx
 bfSx6RiGAN7KNaKI/OEji3/w==
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

Am 14.08.24 um 14:18 schrieb Ulf Hansson:
> On Sun, 28 Jul 2024 at 15:07, Stefan Wahren <wahrenst@gmx.net> wrote:
>> This adds suspend/resume support for the 8250_bcm2835aux
>> driver to provide power management support on attached
>> devices.
>>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>>   drivers/tty/serial/8250/8250_bcm2835aux.c | 37 +++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
>> diff --git a/drivers/tty/serial/8250/8250_bcm2835aux.c b/drivers/tty/serial/8250/8250_bcm2835aux.c
>> index 121a5ce86050..36e2bb34d82b 100644
>> --- a/drivers/tty/serial/8250/8250_bcm2835aux.c
>> +++ b/drivers/tty/serial/8250/8250_bcm2835aux.c
>> @@ -13,6 +13,7 @@
>>    */
>>
>>   #include <linux/clk.h>
>> +#include <linux/console.h>
>>   #include <linux/io.h>
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>> @@ -213,11 +214,47 @@ static const struct acpi_device_id bcm2835aux_serial_acpi_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(acpi, bcm2835aux_serial_acpi_match);
>>
>> +static int bcm2835aux_suspend(struct device *dev)
>> +{
>> +       struct bcm2835aux_data *data = dev_get_drvdata(dev);
>> +       struct uart_8250_port *up = serial8250_get_port(data->line);
>> +
>> +       serial8250_suspend_port(data->line);
>> +
>> +       if (device_may_wakeup(dev))
>> +               return 0;
>> +
>> +       if (uart_console(&up->port) && !console_suspend_enabled)
>> +               return 0;
>> +
>> +       clk_disable_unprepare(data->clk);
>> +       return 0;
>> +}
>> +
>> +static int bcm2835aux_resume(struct device *dev)
>> +{
>> +       struct bcm2835aux_data *data = dev_get_drvdata(dev);
>> +       int ret;
>> +
>> +       ret = clk_prepare_enable(data->clk);
> Doesn't this create clk prepare/enable - unprepare/disable imbalance
> problem when the uart is configured for system wakeup?
Thanks, i will send a follow-up

Regards
>
>> +       if (ret)
>> +               return ret;
>> +
>> +       serial8250_resume_port(data->line);
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct dev_pm_ops bcm2835aux_dev_pm_ops = {
>> +       SYSTEM_SLEEP_PM_OPS(bcm2835aux_suspend, bcm2835aux_resume)
>> +};
>> +
>>   static struct platform_driver bcm2835aux_serial_driver = {
>>          .driver = {
>>                  .name = "bcm2835-aux-uart",
>>                  .of_match_table = bcm2835aux_serial_match,
>>                  .acpi_match_table = bcm2835aux_serial_acpi_match,
>> +               .pm = pm_ptr(&bcm2835aux_dev_pm_ops),
>>          },
>>          .probe  = bcm2835aux_serial_probe,
>>          .remove_new = bcm2835aux_serial_remove,
>> --
>> 2.34.1
>>
> Kind regards
> Uffe
>

