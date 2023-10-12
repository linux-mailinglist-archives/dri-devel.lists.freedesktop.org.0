Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B38AB7C712F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 17:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1C410E182;
	Thu, 12 Oct 2023 15:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C1610E182
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 15:15:49 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5032a508e74so4011e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 08:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697123747; x=1697728547;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDm03tbPxIT0QGcdFVM1esLuIKdKzQrObVrEEj/6HeY=;
 b=s9yhXFh5cxTNhmCUtxYznZKFKZs8tDoAsvZcJi5u8tRDT5wbk3AN++Z58uOS8RrKJX
 ZJWkhTL7oLBmmifvlihX31plLQOg2outAMPi1fLZcdXbdcnA5raIsECXj+x4JP8Loz0M
 +gK+rNs8aRCHuP26pfmBsojib+45e/JITrqKyLj1fwjOL15Oui6XFxGucEBnd8oiqr24
 gUmXvqWLwE1KrqSoaFz6KCEKD91tVenT1Mva86/uH5QDI+JmTpBJXW2AoEvds3Cq1Zl3
 JHfFq4uG9/hWd82iV9jw4yq5QADz9iZsDl527Q30hsqXwBpjNPoFW41Vs9gdYOQHsBs/
 rKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697123747; x=1697728547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WDm03tbPxIT0QGcdFVM1esLuIKdKzQrObVrEEj/6HeY=;
 b=BgJeCgtu5DmerGdoxDsRv9DxBHRu9myEVLzGhm6A93Lynaa9j6H4cz3qAcIUywbXtP
 hbrSVRt26UkDvV2bBjIdJqyylZ9ziqNCvzlBk0EWTz6AVEhipRIM9O0XFkf3ekB18eB5
 8MiILaKfpK8UX9rEACkaCsJb1j3BJd2Qs9g5dasIRjxUKfhxVPyliMCEOQXwCKYFQFXm
 pkT4T0BkM2OOXKnsj6ZwCyZb4tSzpQIRkIkpdY9X7cmRD1GnuN8m0Vk/mvLzL+Dtpz/q
 G2sjf1zO+SbaGnDQ2U1VNSu0kFbHLS/xpq/hMp8U/VacYkvXWDafORA8CNFS3tU8JOr0
 0VUQ==
X-Gm-Message-State: AOJu0Yw1872jzJEWWGtwXG5joaQXlRMuUJHEJTmqGLaat0miKAJV2mY4
 ZnnTcBwQEa37YXmf2dawG3iqa3rv1eoSuiD4gidA3w==
X-Google-Smtp-Source: AGHT+IHHqpNk40g2RjFLWXJqCM+SrOl6/nUGrqlwoOct5RnINpCVGcxlf2fuOuGr7mEG7vCf8J+GfWVR7r/yc7HI5eQ=
X-Received: by 2002:a19:ad41:0:b0:501:ba53:a4f7 with SMTP id
 s1-20020a19ad41000000b00501ba53a4f7mr199955lfd.0.1697123747342; Thu, 12 Oct
 2023 08:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231012121004.2127918-1-yangcong5@huaqin.corp-partner.google.com>
 <20231012121004.2127918-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20231012121004.2127918-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 12 Oct 2023 08:15:32 -0700
Message-ID: <CAD=FV=VwUHctAQXGr_6FZfTS3r0-MZaSiB8+YkfJJzrJsnZDLw@mail.gmail.com>
Subject: Re: [v3 2/3] drm/panel: ili9882t: Avoid blurred screen from fast sleep
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
Cc: neil.armstrong@linaro.org, will@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, catalin.marinas@arm.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 12, 2023 at 5:10=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> At present, we have found that there may be a problem of blurred
> screen during fast sleep/resume. The direct cause of the blurred
> screen is that the IC does not receive 0x28/0x10. Because of the
> particularity of the IC, before the panel enters sleep hid must
> stop scanning, as i2c_hid_core_suspend before ili9882t_disable.
> If move the ili9882t_enter_sleep_mode function to ili9882t_unprepare,
> touch reset will pull low before panel entersleep, which does not meet
> the timing requirements..

The above makes me believe that the reset GPIO should be moved out of
the input driver and into the panel driver. I could just imagine that
the kernel might have some reason it wants to suspend the i2c hid
device. If that causes the panel to suddenly start failing then that
would be bad... I think we should fix this.


> So in order to solve this problem, the IC
> can handle it through the exception mechanism when it cannot receive
> 0x28/0x10 command. Handling exceptions requires a reset 50ms delay.
> Refer to vendor detailed analysis [1].
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
>  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/=
drm/panel/panel-ilitek-ili9882t.c
> index 93a40c2f1483..54ff1efb94aa 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> @@ -463,6 +463,24 @@ static int ili9882t_init_dcs_cmd(struct ili9882t *il=
i)
>         return 0;
>  }
>
> +static int ili9882t_switch_page(struct mipi_dsi_device *dsi, u8 page)
> +{
> +       int ret;
> +       const struct panel_init_cmd cmd =3D _INIT_SWITCH_PAGE_CMD(page);
> +
> +       ret =3D mipi_dsi_dcs_write(dsi, cmd.data[0],
> +                                cmd.len <=3D 1 ? NULL :
> +                                &cmd.data[1],
> +                                cmd.len - 1);
> +       if (ret) {
> +               dev_err(&dsi->dev,
> +                       "error switching panel controller page (%d)\n", r=
et);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static int ili9882t_enter_sleep_mode(struct ili9882t *ili)
>  {
>         struct mipi_dsi_device *dsi =3D ili->dsi;
> @@ -484,8 +502,10 @@ static int ili9882t_enter_sleep_mode(struct ili9882t=
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
> @@ -546,7 +566,7 @@ static int ili9882t_prepare(struct drm_panel *panel)
>         gpiod_set_value(ili->enable_gpio, 1);
>         usleep_range(1000, 2000);
>         gpiod_set_value(ili->enable_gpio, 0);
> -       usleep_range(1000, 2000);
> +       usleep_range(50000, 51000);

From my previous response, I think the above is better as msleep(50).
