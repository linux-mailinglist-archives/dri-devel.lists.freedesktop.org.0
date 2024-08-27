Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D920B9617EF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 21:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED1710E40B;
	Tue, 27 Aug 2024 19:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fQynwVmW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F4B10E40B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 19:26:45 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6bf7f4a1334so26423856d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 12:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724786803; x=1725391603;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHOyUE8iY/6Scs/W5U/CSdZ3JZ5DHLQy5vTA2vOVtz0=;
 b=fQynwVmWG4jh8o6U/EiQcC928I+a5MvFyT3O61zA/Xk2B4gsQloCAjFrIpQn60Vegb
 ve22aw2vqzNPHm8RtSBe6JIcnE0sRlNEo6AIWmNFqpj05rt2KR+jYFKK0I9Ebu3aAcgH
 YIWIIWpx2KFyW7GP/2DDq1nqRO7zIjxqgNsDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724786803; x=1725391603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHOyUE8iY/6Scs/W5U/CSdZ3JZ5DHLQy5vTA2vOVtz0=;
 b=g2q6CoybRX9nVQvqkgIJyzZVi+09aPRErTfViwfAsMkJpnhCYlWne/Gy2Jsrg10B63
 k7zELxfbZlANHb9Jg0U0/1ItqM7FW+57hNOODuys7xT8A6jCS8wxODwzsf/1kAG+G9TT
 gQd/lO2bB9itdBE7waHWrKgkQSc+awcHf+SHztR3U/hnSsLbx1r5peElUZJqswDGL0kk
 m5ugwcTpTouC4wkJJhWV5Aiw0RohryHle/9i9pSh+1IHVI6F4XfvBzh+KW7u0nJ2t+8O
 6K7TvQxogTxUm0IQuRgrw0yHBqd5V4Ep2JyzwJjVoG57dkZPLykHDOoqLJh5S4uMluXc
 nzxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV04HEBPeJmqqgOJHUdHt4vwTn86qw3Ajp91smTN4kNy3fk0LgXUTwUAqeeGjKAaCypvi6DO+/RcAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyU/MJq9lLc6qY/5B1kFvLl4llgHkWFldQaji1c1J3TKv5iYlHT
 SRBqRluhfLZRAVbvpcZ8Au00T4q7VXB1unp3YiRB97IQvoO51pMEeMXUfaBJGFKSAQUpXBzCoKs
 =
X-Google-Smtp-Source: AGHT+IHIChIiabXMbd/Sx1IwDViX/ka9wF6svHZFq1U2O+GNYswz9Iv1gs6OlM849/zqbK6fUI17IQ==
X-Received: by 2002:a05:6214:3f8f:b0:6bf:89fd:90f with SMTP id
 6a1803df08f44-6c16dc21690mr169913456d6.3.1724786802940; 
 Tue, 27 Aug 2024 12:26:42 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com.
 [209.85.219.51]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162dcd3afsm58932506d6.111.2024.08.27.12.26.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 12:26:41 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6c159151013so28133186d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 12:26:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV97KIsqU6hDFViUY94X0laHbcwKm9CjspUtoIwuUKhwKtj9RKAetcpKiTkSafjtyxl9RiGicwxaAQ=@lists.freedesktop.org
X-Received: by 2002:a05:6214:4613:b0:6c3:33b1:20d0 with SMTP id
 6a1803df08f44-6c333b121f9mr15126336d6.53.1724786801089; Tue, 27 Aug 2024
 12:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240824084422.202946-1-tejasvipin76@gmail.com>
In-Reply-To: <20240824084422.202946-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 27 Aug 2024 12:26:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VO+OTpMi0B=jzPkQLnof0r-amNVe_YzuXfBEjTvOE45Q@mail.gmail.com>
Message-ID: <CAD=FV=VO+OTpMi0B=jzPkQLnof0r-amNVe_YzuXfBEjTvOE45Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: novatek-nt35950: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Aug 24, 2024 at 1:44=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> +static void nt35950_set_cmd2_page(struct mipi_dsi_multi_context *dsi_ctx=
,
> +                                 struct nt35950 *nt, u8 page)
>  {
>         const u8 mauc_cmd2_page[] =3D { MCS_CMD_MAUCCTR, 0x55, 0xaa, 0x52=
,
>                                       0x08, page };
> -       int ret;
>
> -       ret =3D mipi_dsi_dcs_write_buffer(nt->dsi[0], mauc_cmd2_page,
> +       mipi_dsi_dcs_write_buffer_multi(dsi_ctx, mauc_cmd2_page,
>                                         ARRAY_SIZE(mauc_cmd2_page));
> -       if (ret < 0)
> -               return ret;
> +       if (dsi_ctx->accum_err)
> +               return;
>
>         nt->last_page =3D page;
> -       return 0;

nit: It's a style choice, but I personally would have changed the above to =
just:

if (!dsi_ctx->accum_err)
  nt->last_page =3D page;


> @@ -284,109 +258,68 @@ static int nt35950_on(struct nt35950 *nt)
>  {
>         const struct nt35950_panel_mode *mode_data =3D nt->desc->mode_dat=
a;
>         struct mipi_dsi_device *dsi =3D nt->dsi[0];
> -       struct device *dev =3D &dsi->dev;
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>
>         nt->cur_mode =3D nt35950_get_current_mode(nt);
>         nt->dsi[0]->mode_flags |=3D MIPI_DSI_MODE_LPM;
>         nt->dsi[1]->mode_flags |=3D MIPI_DSI_MODE_LPM;
>
> -       ret =3D nt35950_set_cmd2_page(nt, 0);
> -       if (ret < 0)
> -               return ret;
> -
> -       ret =3D nt35950_set_data_compression(nt, mode_data[nt->cur_mode].=
compression);
> -       if (ret < 0)
> -               return ret;
> -
> -       ret =3D nt35950_set_scale_mode(nt, mode_data[nt->cur_mode].scaler=
_mode);
> -       if (ret < 0)
> -               return ret;
> -
> -       ret =3D nt35950_set_scaler(nt, mode_data[nt->cur_mode].scaler_on)=
;
> -       if (ret < 0)
> -               return ret;
> +       nt35950_set_cmd2_page(&dsi_ctx, nt, 0);
> +       nt35950_set_data_compression(&dsi_ctx, nt, mode_data[nt->cur_mode=
].compression);
> +       nt35950_set_scale_mode(&dsi_ctx, mode_data[nt->cur_mode].scaler_m=
ode);
> +       nt35950_set_scaler(&dsi_ctx, mode_data[nt->cur_mode].scaler_on);
> +       nt35950_set_dispout(&dsi_ctx, nt);
>
> -       ret =3D nt35950_set_dispout(nt);
> -       if (ret < 0)
> -               return ret;
> -
> -       ret =3D mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLA=
NK);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to set tear on: %d\n", ret);
> -               return ret;
> -       }
> -
> -       ret =3D mipi_dsi_dcs_set_tear_scanline(dsi, 0);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to set tear scanline: %d\n", ret);
> -               return ret;
> -       }
> +       mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_V=
BLANK);
> +       mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx, 0);
>
>         /* CMD2 Page 1 */
> -       ret =3D nt35950_set_cmd2_page(nt, 1);
> -       if (ret < 0)
> -               return ret;
> +       nt35950_set_cmd2_page(&dsi_ctx, nt, 1);
>
>         /* Unknown command */
> -       mipi_dsi_dcs_write_seq(dsi, 0xd4, 0x88, 0x88);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4, 0x88, 0x88);
>
>         /* CMD2 Page 7 */
> -       ret =3D nt35950_set_cmd2_page(nt, 7);
> -       if (ret < 0)
> -               return ret;
> +       nt35950_set_cmd2_page(&dsi_ctx, nt, 7);
>
>         /* Enable SubPixel Rendering */
> -       mipi_dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_EN, 0x01);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PARAM_SPR_EN, 0x01);
>
>         /* SPR Mode: YYG Rainbow-RGB */
> -       mipi_dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_MODE, MCS_SPR_MODE_YYG_=
RAINBOW_RGB);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PARAM_SPR_MODE,
> +                                    MCS_SPR_MODE_YYG_RAINBOW_RGB);
>
>         /* CMD3 */
> -       ret =3D nt35950_inject_black_image(nt);
> -       if (ret < 0)
> -               return ret;
> +       nt35950_inject_black_image(&dsi_ctx);
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 120);
>
> -       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> -       if (ret < 0)
> -               return ret;
> -       msleep(120);
> -
> -       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> -       if (ret < 0)
> -               return ret;
> -       msleep(120);
> +       mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 120);
>
>         nt->dsi[0]->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
>         nt->dsi[1]->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
>
> -       return 0;
> +       return dsi_ctx.accum_err;

I think you only want to clear "MIPI_DSI_MODE_LPM" if there was no
error, right? That matches the old code. So you'd want:

if (dsi_ctx.accum_err)
  return dsi_ctx.accum_err;

nt->dsi[0]->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
nt->dsi[1]->mode_flags &=3D ~MIPI_DSI_MODE_LPM;

return 0;


>  static int nt35950_off(struct nt35950 *nt)
>  {
> -       struct device *dev =3D &nt->dsi[0]->dev;
> -       int ret;
> +       struct mipi_dsi_device *dsi =3D nt->dsi[0];
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>
> -       ret =3D mipi_dsi_dcs_set_display_off(nt->dsi[0]);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to set display off: %d\n", ret);
> -               goto set_lpm;
> -       }
> -       usleep_range(10000, 11000);
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +       mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
>
> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(nt->dsi[0]);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> -               goto set_lpm;
> -       }
> -       msleep(150);
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 150);
>
> -set_lpm:
> -       nt->dsi[0]->mode_flags |=3D MIPI_DSI_MODE_LPM;
> -       nt->dsi[1]->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +       if (dsi_ctx.accum_err) {
> +               nt->dsi[0]->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +               nt->dsi[1]->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +       }

I'm pretty sure you want to set MIPI_DSI_MODE_LPM _unconditionally,
right? The old code would set it in both error and non-error cases I
think.


> @@ -452,10 +384,8 @@ static int nt35950_prepare(struct drm_panel *panel)
>         nt35950_reset(nt);
>
>         ret =3D nt35950_on(nt);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +       if (ret < 0)
>                 goto end;
> -       }

I'd just get rid of the "if" test since "end" is next anyway. Given
that there's no error message it seems silly to have the "if" test
now.


> @@ -469,12 +399,8 @@ static int nt35950_prepare(struct drm_panel *panel)
>  static int nt35950_unprepare(struct drm_panel *panel)
>  {
>         struct nt35950 *nt =3D to_nt35950(panel);
> -       struct device *dev =3D &nt->dsi[0]->dev;
> -       int ret;
>
> -       ret =3D nt35950_off(nt);
> -       if (ret < 0)
> -               dev_err(dev, "Failed to deinitialize panel: %d\n", ret);
> +       nt35950_off(nt);

This is the only caller of nt35950_off() and you no longer check the
return code, so you can just make nt35950_off() void, right?
