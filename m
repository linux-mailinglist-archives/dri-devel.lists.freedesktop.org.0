Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B560B7C0426
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 21:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1240B10E3D9;
	Tue, 10 Oct 2023 19:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3E710E3D8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 19:11:24 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4063bfc6c03so16325e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 12:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696965083; x=1697569883;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZoGL2Uu638tVmdTCZX+Di3sr5kqYNA/LstDS+q6xb8=;
 b=dpUm19aK29yRcF8YfBd/t0SapgsQmRP+ZcO4D8BUdYrSGiYxgacUmsMa4XM+K6H2zr
 3cvXJS2gOvNj5BYu9xZ1mglG4VxVN3oV+aOBoWn52XxZvkupLvw8GFyrNpQuKooDvS6E
 23muUW9TWs5e2JC7nul3lKM5qH0wMoM6cLzlKFITtWDW2f2C25W3QvXJUGSjUAZ5g2B0
 FcicD3TpGSmWZusZtLxFGrmQ3WZoiRYbiEFIM8VCjpdMhID2dsew9xR4v3IUTHAQ2zW9
 mNCSkDLDpqp/kl5AXNRhTy74d0QLJpLwSXJ/WodRJaaTo02uBdlzjqra5Iv8l8zFshTG
 nGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696965083; x=1697569883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZoGL2Uu638tVmdTCZX+Di3sr5kqYNA/LstDS+q6xb8=;
 b=Qb17yC6+IdSZpAgWAgAzr4rRsCJid0p2p+pkpT8wOzIbQ2PRw8yrLCAbbo6VqAqZKg
 CDx7ucjH0ISU10isueBHxofn0DOqGtgfcUQ3X54jsQRUZcnomY35GcdhHPiUy9BSJlyr
 WuPnpov2/+oIWmGYwpHiLikvWE0Stkkqiiadvp+U6k5i3suIA31XbKuZbJ8YTJpgfKNu
 x0QBzsYrrCo8ElEa7hrgenlTTqAfJcoWXocnZAGFdgdhgoLn/CCFBgAcGBWdDvuliB12
 aPf7nD95vil+emO+roxxRwGGk/HgnszVXkEQJwGK62lf3ki+7B60Fhek20if4vPXSdWj
 g0Yw==
X-Gm-Message-State: AOJu0Yw8usw9i3uEaJF2U7do2wb1CQPAFFKdQtX7peBjSFi2jFEmtm+J
 nr9jgwITUUzAY6q9heiATLeTqvu6iNo0VcZiRlGLzw==
X-Google-Smtp-Source: AGHT+IEekinj3pkVvXzCInSnjbCb1228aec9HG4yoCfY5EOtyEFUlTMrjRNS5gs3ENf9m3nv9ehAAvyirrVc4ZhO290=
X-Received: by 2002:a05:600c:4fc2:b0:406:5779:181d with SMTP id
 o2-20020a05600c4fc200b004065779181dmr25484wmq.2.1696965082564; Tue, 10 Oct
 2023 12:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231010121402.3687948-1-yangcong5@huaqin.corp-partner.google.com>
 <20231010121402.3687948-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20231010121402.3687948-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Tue, 10 Oct 2023 12:11:04 -0700
Message-ID: <CAD=FV=XXGBatMjFCeSuxCy0i1FK=ekU2yq7eXb1a9J3jSYAbhw@mail.gmail.com>
Subject: Re: [v2 2/3] drm/panel: ili9882t: Avoid blurred screen from fast sleep
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

On Tue, Oct 10, 2023 at 5:14=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> At present, we have found that there may be a problem of blurred
> screen during fast sleep/resume. The direct cause of the blurred
> screen is that the IC does not receive 0x28/0x10. Because of the
> particularity of the IC, before the panel enters sleep hid must
> stop scanning, i2c_hid_core_suspend before ili9882t_disable.
> This doesn't look very spec-compliant. So in order to solve this
> problem, the IC can handle it through the exception mechanism when
> it cannot receive 0X28/0X10 command. Handling exceptions requires a reset

very nitty, but can you make the "X" lowercase? ...so 0x28 not 0X28.


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
>  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/=
drm/panel/panel-ilitek-ili9882t.c
> index e095ad91c4bc..20ae370ebe2f 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> @@ -465,6 +465,24 @@ static int ili9882t_init_dcs_cmd(struct ili9882t *il=
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
> @@ -486,8 +504,10 @@ static int ili9882t_enter_sleep_mode(struct ili9882t=
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
> @@ -548,7 +568,7 @@ static int ili9882t_prepare(struct drm_panel *panel)
>         gpiod_set_value(ili->enable_gpio, 1);
>         usleep_range(1000, 2000);
>         gpiod_set_value(ili->enable_gpio, 0);
> -       usleep_range(1000, 2000);
> +       usleep_range(40000, 50000);

In response to v1 you said that you actually needed 50 ms here. Oh, I
guess that's also in the patch description. The above allows the
kernel to delay 40 ms. We need to change it to something that will
force the kernel to do 50 ms. That could be: "usleep_range(50000,
51000)", but actually when we're this order of magnitude it should be
just "msleep(50)".
