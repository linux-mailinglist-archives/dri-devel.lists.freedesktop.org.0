Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D69D693962
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 19:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5562110E21D;
	Sun, 12 Feb 2023 18:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE13910E21D
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 18:36:09 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4PFGPx4ss4z9sQT;
 Sun, 12 Feb 2023 19:36:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1676226965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lxZXUVUBHauziIFIholFfSKQ5MMF9O6Qx9Uhvbrn2Dc=;
 b=mVzkxhe7LAOda6XwjghO85f9MZnVtuQxilhNn4SLbA7WFLs8wZWnluwdeDA3CHbOnzQm5N
 cS6+fmTZp4kKT58fbWQ+9BX5QGSqN4Xj5p0ni4kc1SIol43cvGjszMPxG/t0UcXc28cLRN
 0OiQtZJBMlHJnK71FBrFfIFBk4crWQ+bfaqb4eEJNbW9TN3D3ThT7r7IoJYvaQ7Yqq8Gjz
 xcl/wJS6EdUveHLjUW/VVR4R7XXJrcZv7rPkyiuyv9ZcwcZgqNhUIASbmK6q+8cn/htlpA
 ma9pJoBUxzM0IIsVa60PCjkEq7d1wU7To1Q1EJc2oD5WHz2UHnGRXNJqnldhQA==
From: Frank Oltmanns <frank@oltmanns.dev>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, Guido =?utf-8?Q?G=C3=BCn?=
 =?utf-8?Q?ther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 1/1] drm/panel: st7703: Fix resume of XBD599 panel
Date: Sun, 12 Feb 2023 18:52:05 +0100
References: <20230212120830.46880-1-frank@oltmanns.dev>
 <20230212120830.46880-2-frank@oltmanns.dev>
 <20230212123621.jo56yqlburd6g6ir@core>
In-reply-to: <20230212123621.jo56yqlburd6g6ir@core>
Message-ID: <874jrq20kz.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
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
Cc: Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 Sam Ravnborg <sam@ravnborg.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ond=C5=99ej,
hi Guido,

Ond=C5=99ej, thank you very much for your feedback!

I have a couple of questions.

Ond=C5=99ej Jirman <megi@xff.cz> writes:

> On Sun, Feb 12, 2023 at 01:08:29PM +0100, Frank Oltmanns wrote:
>> In contrast to the JH057N panel, the XBD599 panel does not require a 20
>> msec delay after initialization and exiting sleep mode. Therefore, move
>> the delay into the already existing device specific initialization
>> function.
>>
>> Also, the timing contraints after entering and exiting sleep mode differ
>> between the two panels:
>>  - The JH057N requires a shorter delay than the XDB599 after waking up
>>    from sleep mode and before enabling the display.
>>  - The XDB599 requires a delay in order to drain the display of charge,
>>    which is not required on the JH057N.
>
> There=E2=80=99s no difference between the panels here. It=E2=80=99s a con=
troller specified
> requirement.
>
> <https://megous.com/dl/tmp/1ef533ed8a7ce841.png>
>
> 60ms used in the driver between sleep out and display on is just
> incorrect from the datasheet perspective.

Please let me point you to the discussion you and Guido had ~2.5 years ago:
<https://lore.kernel.org/all/20200729154809.GA435075@bogon.m.sigxcpu.org/>

What resonates most with me is the following statement from Guido:
> > > > Given the amount of ST7703 look alikes i don=E2=80=99t think you ca=
n go by the
> > > > datasheet and hope not to break other panels. The current sleeps ca=
ter
> > > > for the rocktech panel (which suffered from similar issues you desc=
ribe
> > > > when we took other parameters) so you need to make those panel spec=
ific.

My takeaway is, that neither panel needed the actual 120 msec wait time. Bu=
t Guido was reluctant to change the timing for the Librem 5 devkit panel. T=
hat=E2=80=99s why I went for the panel specific implementation.

Of course, we can revisit that decision. Since I don=E2=80=99t have the Lib=
rem 5 devkit, I have to kindly ask Guido for advise.

> You also have to wait 120ms after sleep in (or HW reset) and before shutt=
ing
> down the panel. If you don=E2=80=99t, after a bunch of cycles of this inc=
orrect
> power up/down sequence the panel will start blinking weirdly, and the inc=
orrect
> power up/down sequence without delays will not be able to recover it. You=
=E2=80=99ll
> have to let the panel sit for 5-10 minutes powered off before it starts to
> behave itself again.
>
> The documentation for sleep in specifies what=E2=80=99s happening during =
sleep in,
> and why this delay is necessary after sleep in:
>
> <https://megous.com/dl/tmp/2284b9d0f506b9b8.png>

I read that screenshot, that we need a 120 msec wait after sleep OUT before=
 we can send another sleep in (see the =E2=80=9CRestriction=E2=80=9D row). =
I can=E2=80=99t seem to find the reference to the 120 msec delay after the =
sleep IN command. I read the flow chart at the bottom as informational abou=
t the duration of the whole procedure that happens after issuing the sleep =
in command. The only restriction is that we can=E2=80=99t issue any command=
 for 5 msec after sleep in was issued.

> So there needs to be 120ms delay after sleep in and after sleep out,
> regardless of which panel is driven by this controller, to ensure the pan=
el
> stays operational even when the user is quickly switching it on/off repea=
tedly.
>
> So I don=E2=80=99t think you should be doing panel specific quirks here.

Maybe. I can only say that without the timings in this patch (i.e. the ones=
 from your kernel branch) the display on my pinephone is flickering after t=
he first (and every subsequent) time the display is turned off. With your n=
ew timing everything works great on the pinephone. Guido states that the ti=
mings in your original patch (i.e. the XDB599 specific timings in this patc=
h) the Librem 5 devkit panel doesn=E2=80=99t work.

Do you have a proposal how to proceed without implementing panel specific t=
imings?

Thanks,
  Frank

>
> regards,
> 	o.
>
>> Therefore, introduce panel specific functions for the delays.
>>
>> The XDB599 does not require a 20 msec delay between the SETBGP and
>> SETVCOM commands. Therefore, remove the delay from the device specific
>> initialization function.
>>
>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
>> Cc: Ondrej Jirman <megi@xff.cz>
>> Reported-by: Samuel Holland <samuel@sholland.org>
>> =E2=80=94
>>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 40 ++++++++++++++++=E2=
=80=94
>>  1 file changed, 35 insertions(+), 5 deletions(-)
>>
>> diff =E2=80=93git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/driv=
ers/gpu/drm/panel/panel-sitronix-st7703.c
>> index 6747ca237ced..a149341c4a8b 100644
>> =E2=80=94 a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
>> @@ -66,6 +66,8 @@ struct st7703_panel_desc {
>>  	unsigned long mode_flags;
>>  	enum mipi_dsi_pixel_format format;
>>  	int (*init_sequence)(struct st7703 *ctx);
>> +	void (*wait_after_sleep_out)(void);
>> +	void (*drain_charge)(void);
>>  };
>>
>>  static inline struct st7703 *panel_to_st7703(struct drm_panel *panel)
>> @@ -126,10 +128,24 @@ static int jh057n_init_sequence(struct st7703 *ctx)
>>  				   0x18, 0x00, 0x09, 0x0E, 0x29, 0x2D, 0x3C, 0x41,
>>  				   0x37, 0x07, 0x0B, 0x0D, 0x10, 0x11, 0x0F, 0x10,
>>  				   0x11, 0x18);
>> +	msleep(20);
>>
>>  	return 0;
>>  }
>>
>> +static void jh057n_wait_after_sleep_out(void)
>> +{
>> +	/*
>> +	 * Panel is operational 120 msec after reset, i.e. 60 msec after
>> +	 * sleep out.
>> +	 */
>> +	msleep(60);
>> +}
>> +
>> +static void jh057n_drain_charge(void)
>> +{
>> +}
>> +
>>  static const struct drm_display_mode jh057n00900_mode =3D {
>>  	.hdisplay    =3D 720,
>>  	.hsync_start =3D 720 + 90,
>> @@ -152,6 +168,8 @@ static const struct st7703_panel_desc jh057n00900_pa=
nel_desc =3D {
>>  		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
>>  	.format =3D MIPI_DSI_FMT_RGB888,
>>  	.init_sequence =3D jh057n_init_sequence,
>> +	.wait_after_sleep_out =3D jh057n_wait_after_sleep_out,
>> +	.drain_charge =3D jh057n_drain_charge,
>>  };
>>
>>  static int xbd599_init_sequence(struct st7703 *ctx)
>> @@ -273,7 +291,6 @@ static int xbd599_init_sequence(struct st7703 *ctx)
>>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP,
>>  			       0x07, /* VREF_SEL =3D 4.2V */
>>  			       0x07  /* NVREF_SEL =3D 4.2V */);
>> -	msleep(20);
>>
>>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM,
>>  			       0x2C, /* VCOMDC_F =3D -0.67V */
>> @@ -315,6 +332,18 @@ static int xbd599_init_sequence(struct st7703 *ctx)
>>  	return 0;
>>  }
>>
>> +static void xbd599_wait_after_sleep_out(void)
>> +{
>> +	msleep(120);
>> +}
>> +
>> +static void xbd599_drain_charge(void)
>> +{
>> +	/* Drain diplay of charge, to work correctly on next power on. */
>> +	msleep(120);
>> +}
>> +
>> +
>>  static const struct drm_display_mode xbd599_mode =3D {
>>  	.hdisplay    =3D 720,
>>  	.hsync_start =3D 720 + 40,
>> @@ -336,6 +365,8 @@ static const struct st7703_panel_desc xbd599_desc =
=3D {
>>  	.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
>>  	.format =3D MIPI_DSI_FMT_RGB888,
>>  	.init_sequence =3D xbd599_init_sequence,
>> +	.wait_after_sleep_out =3D xbd599_wait_after_sleep_out,
>> +	.drain_charge =3D xbd599_drain_charge,
>>  };
>>
>>  static int st7703_enable(struct drm_panel *panel)
>> @@ -350,16 +381,13 @@ static int st7703_enable(struct drm_panel *panel)
>>  		return ret;
>>  	}
>>
>> -	msleep(20);
>> -
>>  	ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
>>  	if (ret < 0) {
>>  		dev_err(ctx->dev, =E2=80=9CFailed to exit sleep mode: %d\n=E2=80=9D, =
ret);
>>  		return ret;
>>  	}
>>
>> -	/* Panel is operational 120 msec after reset */
>> -	msleep(60);
>> +	ctx->desc->wait_after_sleep_out();
>>
>>  	ret =3D mipi_dsi_dcs_set_display_on(dsi);
>>  	if (ret)
>> @@ -384,6 +412,8 @@ static int st7703_disable(struct drm_panel *panel)
>>  	if (ret < 0)
>>  		dev_err(ctx->dev, =E2=80=9CFailed to enter sleep mode: %d\n=E2=80=9D,=
 ret);
>>
>> +	ctx->desc->drain_charge();
>> +
>>  	return 0;
>>  }
>>
>> =E2=80=93
>> 2.39.1
>>

--=-=-=--
