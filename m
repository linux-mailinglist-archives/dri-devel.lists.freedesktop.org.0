Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 238C53CFF37
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 18:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8451289CB9;
	Tue, 20 Jul 2021 16:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3045 seconds by postgrey-1.36 at gabe;
 Tue, 20 Jul 2021 16:24:26 UTC
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D6489CB9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 16:24:26 +0000 (UTC)
Date: Tue, 20 Jul 2021 16:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1626798264;
 bh=EJeCWsJFzfOWox+RhkqrrCD1XyOpMKF4vdKS1xlR9C0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=JY4/nOPz8dQWccoc9cuSmC+6ccS6qN9dRA2cighFFdUVYnlBjM860OTcmC9EBNZdl
 6csT6YER8UnTjIEGXRTTCPimX9yUQBv4tvht/35KLnRSo1+oN2b+ezbdw5boC2mPSV
 DWJZL61pvnZVA9o99Crn/Tyb+MgAS/q0Qvdyw1NA=
To: Bjorn Andersson <bjorn.andersson@linaro.org>
From: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 3/5] drm/panel/samsung-sofef00: make gpio optional
Message-ID: <8922066a-dbae-68ad-3708-2b2cf4d4d22a@connolly.tech>
In-Reply-To: <YPbztxBh4cCJF8p3@yoga>
References: <20210720153125.43389-1-caleb@connolly.tech>
 <20210720153125.43389-4-caleb@connolly.tech> <YPbztxBh4cCJF8p3@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bjorn,

On 20/07/2021 17:03, Bjorn Andersson wrote:
> On Tue 20 Jul 10:33 CDT 2021, Caleb Connolly wrote:
>
>> The OnePlus 6T panel fails to initialise if it has been reset,
>> workaround this by allowing panels to not specify a reset GPIO.
>>
>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
>> ---
>>   drivers/gpu/drm/panel/panel-samsung-sofef00.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu=
/drm/panel/panel-samsung-sofef00.c
>> index 8cb1853574bb..a20a5af14653 100644
>> --- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
>> +++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
>> @@ -44,6 +44,8 @@ struct sofef00_panel *to_sofef00_panel(struct drm_pane=
l *panel)
>>
>>   static void sofef00_panel_reset(struct sofef00_panel *ctx)
>>   {
>> +=09if (!ctx->reset_gpio)
> gpiod_set_value_cansleep(NULL, 1) is a perfectly valid nop, so I don't
> think you need to make this conditional.
Ah thanks, will revise.
>
> That said, don't you need this to get the panel out of reset once you
> apply power after it being powered off?

It seems like the panel is out of reset by default, my best guess for
this whole issue is that the bootloader does some initialisation

of the panel which we aren't able to reproduce, as the panel is left
initialised (for cont splash) we're able to just make use of it as is.

With these patches supplied the OnePlus 6T is able to boot and function
as expected, in the future it would be good to find a way to

properly set up the panel so that we aren't dependent on the bootloader...

>
>> +=09=09return;
>>   =09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>>   =09usleep_range(5000, 6000);
>>   =09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>> @@ -137,7 +139,8 @@ static int sofef00_panel_prepare(struct drm_panel *p=
anel)
>>   =09ret =3D sofef00_panel_on(ctx);
>>   =09if (ret < 0) {
>>   =09=09dev_err(dev, "Failed to initialize panel: %d\n", ret);
>> -=09=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>> +=09=09if (ctx->reset_gpio)
> Ditto.
>
>
> Regards,
> Bjorn
>
>> +=09=09=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>   =09=09return ret;
>>   =09}
>>
>> @@ -276,7 +279,7 @@ static int sofef00_panel_probe(struct mipi_dsi_devic=
e *dsi)
>>   =09=09return ret;
>>   =09}
>>
>> -=09ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>> +=09ctx->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_=
HIGH);
>>   =09if (IS_ERR(ctx->reset_gpio)) {
>>   =09=09ret =3D PTR_ERR(ctx->reset_gpio);
>>   =09=09dev_warn(dev, "Failed to get reset-gpios: %d\n", ret);
>> --
>> 2.32.0
>>
>>
Kind Regards,

Caleb


