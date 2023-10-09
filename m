Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0BC7BEBDD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 22:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2E410E13F;
	Mon,  9 Oct 2023 20:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C5110E19E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 20:44:48 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-537f07dfe8eso20153a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 13:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696884287; x=1697489087;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FuJB1ifIzrcQ2ihsDfUK191dfHIspn0SStDEZitDuls=;
 b=3kprh7cCGLaFPdH9ZxoU30OagkCnrJ/9uG19ym8BxVjJmQDikjbwKL+4TvonddWjaF
 mTScNcR5TuAREnmToHOrOufI4yluPEwLBMhCCIElCu5nchXn49gpGtk5pQKIBaiWfSd2
 DUhOOzjHECR0/Uj/fpRMiS7H/5gd/E4E7DheSv/CtWrJroFpaO5ROqOdfbEKrDKHTdoG
 jojDz3CvieaNxTlfliDEJly3x9V+sQr3wWm8XcikI84YwhHapJ8yEU7ZTlqvBiIzhK4d
 6bWH9i0syoKUFz/Or1pOJHVs2QRQ8rHeqjERarfMrkQ7DT1mHy/x+mcjnDnWpu60GAvg
 T+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696884287; x=1697489087;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FuJB1ifIzrcQ2ihsDfUK191dfHIspn0SStDEZitDuls=;
 b=p4ijvd0jh6s5OGP/WpiPeNWqj7CKKoqm6yYjho9xhK0zPpV3NZHPuj1RACWOLHnUMs
 mIJqhB9zXUCR7BBDvNTTgjIHtQYEI1npfkt8do45q+yNk0+EM5ojkbD6fFQgtoOAL+5Q
 sS0clYwQ9I5GomG08A9F1S7WlGLx7KSqdpv8obGoE0Ltq60ooPVMVKYjVUWzwjtcri5k
 JrrN3E03t+BBeZR/XmD1827k99eUcCNRvweySEOr4QlW2MF07LzjiVYh5HFgsQ1uGOqU
 72CUEsF++4AfEycDjD7AkZux77twtNrjUmbzGXnjeNWNQV9tZ50auyHXaEN3gnSpuSVH
 +Llg==
X-Gm-Message-State: AOJu0Yx7Dnlccdr+kHSmNI+vlfE9Hk0/8zhaM5slB46/+Wtd/qWkd5TV
 bAe5G7FkZ38/3Rn5hxhRKTyElxB89te2lPNbq5r2qw==
X-Google-Smtp-Source: AGHT+IEqu4TY4aF2yT/aGnWd/fkQnL4QPiCCadQ30jdAb0NNju+Ea2/clODYa4Etdmm3fFqOfP8O4uMzkqNJM8wunjg=
X-Received: by 2002:a50:bb67:0:b0:519:7d2:e256 with SMTP id
 y94-20020a50bb67000000b0051907d2e256mr411821ede.0.1696884286810; Mon, 09 Oct
 2023 13:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231007060639.725350-1-yangcong5@huaqin.corp-partner.google.com>
 <20231007060639.725350-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20231007060639.725350-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 9 Oct 2023 13:44:34 -0700
Message-ID: <CAD=FV=W3ef3vWrWRDPKgeUjcapEticj4=EWdC-bOb=ph0DShsA@mail.gmail.com>
Subject: Re: [v1 2/2] drm/panel: ili9882t: Avoid blurred screen from fast sleep
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, hsinyi@google.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Oct 6, 2023 at 11:07=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> At present, we have found that there may be a problem of blurred
> screen during fast sleep/resume. The direct cause of the blurred
> screen is that the IC does not receive 0x28/0x10. Because of the
> particularity of the IC, before the panel enters sleep hid must
> stop scanning, i2c_hid_core_suspend before ili9882t_disable.
> This doesn't look very spec-compliant.

Presumably you could be more spec compliant if we used
"panel_follower" in this case? Would that be a better solution?


> So in order to solve this
> problem, the IC can handle it through the exception mechanism when
> it cannot receive 0X28/0X10 command. Handling exceptions requires a reset
> 50ms delay. Refer to vendor detailed analysis [1].
>
> Ilitek vendor also suggested switching the page before entering sleep to
> avoid panel IC not receiving 0x28/0x10 command.
>
> Note: 0x28 is display off, 0x10 is sleep in.
>
> [1]: https://github.com/ILITEK-LoganLin/Document/tree/main/ILITEK_Power_S=
equence
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/=
drm/panel/panel-ilitek-ili9882t.c
> index bbfcffe65623..0a1dd987b204 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> @@ -423,6 +423,23 @@ static inline struct ili9882t *to_ili9882t(struct dr=
m_panel *panel)
>         return container_of(panel, struct ili9882t, base);
>  }
>
> +static int ili9882t_switch_page(struct mipi_dsi_device *dsi, u8 page)
> +{
> +       u8 switch_cmd[] =3D {0x98, 0x82, 0x00};

Can't you just replace the last 0x00 above with "page" and get rid of
the manual assignment below?


> +       int ret;
> +
> +       switch_cmd[2] =3D page;
> +
> +       ret =3D mipi_dsi_dcs_write(dsi, ILI9882T_DCS_SWITCH_PAGE, switch_=
cmd, 3);

Instead of hardcoding 3, should use ARRAY_SIZE().


> +       if (ret) {
> +               dev_err(&dsi->dev,
> +                       "error switching panel controller page (%d)\n", r=
et);
> +               return ret;
> +       }
> +
> +       return 0;
> +}

optional: It feels like it would be nice to somehow use the
"_INIT_SWITCH_PAGE_CMD" macro I suggested in patch #1 instead of
having to hardcode 0x98, 0x82 again. In patch #1 I already suggested
breaking out the function to send a sequence of commands. If you had
that function take a pointer instead of hardcoding it to look at
->init_cmds then you could probably use the same function that you do
at init time?


>  static int ili9882t_enter_sleep_mode(struct ili9882t *ili)
>  {
>         struct mipi_dsi_device *dsi =3D ili->dsi;
> @@ -444,8 +461,10 @@ static int ili9882t_enter_sleep_mode(struct ili9882t=
 *ili)
>  static int ili9882t_disable(struct drm_panel *panel)
>  {
>         struct ili9882t *ili =3D to_ili9882t(panel);
> +       struct mipi_dsi_device *dsi =3D ili->dsi;
>         int ret;
>
> +       ili9882t_switch_page(dsi, 0x00);
>         ret =3D ili9882t_enter_sleep_mode(ili);
>         if (ret < 0) {
>                 dev_err(panel->dev, "failed to set panel off: %d\n", ret)=
;
> @@ -507,7 +526,7 @@ static int ili9882t_prepare(struct drm_panel *panel)
>         gpiod_set_value(ili->enable_gpio, 1);
>         usleep_range(1000, 2000);
>         gpiod_set_value(ili->enable_gpio, 0);
> -       usleep_range(1000, 2000);
> +       usleep_range(40000, 50000);

nit: use 40000, 41000 instead of 40000, 50000. Linux almost always
uses the longer delay, so that'll save ~9 ms. The only reason for the
range is to optimize kernel wakeups which is really not a concern
here.
