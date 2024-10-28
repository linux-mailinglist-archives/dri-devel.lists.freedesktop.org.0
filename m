Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E989B39BF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 19:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A9910E380;
	Mon, 28 Oct 2024 18:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="E4cMPAzK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E6E10E380
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 18:55:04 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2fc968b3545so45105371fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 11:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730141700; x=1730746500;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kPm2vEW8xTYHQPK8zA4XdYIjeKKSO98gok6NxNxwW8I=;
 b=E4cMPAzKLT5AS5Lc2ITBLnk6QWqxP76uQQu/ELtP2vtpYe+XycgvSHgea25xkdFOqa
 cnE38UEvFeMKMAVHiINkAw6fDr0hrEAFWnWB9bWgdfz4qxqik6OsSRzzQjwl5PF1cd9i
 H/sHXo0/Q+T5PwBw3nziaMoPZXj2tLpCaDzaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730141700; x=1730746500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kPm2vEW8xTYHQPK8zA4XdYIjeKKSO98gok6NxNxwW8I=;
 b=bvM0iXAH94koAOeYLTwIGYXzqKe7SOk6ZdQ2wNBw5V2i3pv96k8jIxYo6UA8BT/QKL
 hn6+q/Psuk9zEBNX7CEgIpqaCi79LsvLHtVGP4bhDxgLPZwmf25v6U6SU+KPi6qqZNID
 2TidASVQ1MB4+1qL8ShIjYsQlcd/8cmgZNRnRmJWuum5uBnx5ehXac8ZWMzQSXu0gtVT
 X0usx/ILDNuhLAF2I3q/uzoS7c9/v1elLEcu5JtWIbLi1UGQtPIT+9mv24+0i0FfZscq
 zZe1Zc5NzinQv7O7kI+71ePTS7N5pz5DF1Luy/W/mOdxeBkJluGoY0JYII7jDjoWBdI9
 R1gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAhoOl6geMBKyTMXm+GB6IDWqC7P88cVXSylp+qXTvRDEIX0oWczHYAFc0xCb/5HoDIkL7g/mZuH4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzxm9eUKfbaUxnSPA2CcC0OYjhYI8c/GGQE0ANOxDyWfhgTKSrZ
 vML0kwC+QDnHKqtDLwj3jig8KtO1FYmvRX6Z59EjwNZe6kBPoOdxp0AuuRE+sJap/EiW0Qgc41V
 UoA==
X-Google-Smtp-Source: AGHT+IGnujn/FvUTR0d5EyWfYHXNmqPzzxI9EJfGlQMJdRMGZmK3BgVvBpW+LDRk71gs6EXhofWiOA==
X-Received: by 2002:a2e:b895:0:b0:2fa:d354:1435 with SMTP id
 38308e7fff4ca-2fcbddfa6admr37136111fa.0.1730141700319; 
 Mon, 28 Oct 2024 11:55:00 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fcb453e798sm12240361fa.58.2024.10.28.11.54.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 11:54:59 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2fb3debdc09so36137141fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 11:54:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVYw9UeLnJGjGjxCLcNylggZWH0+dHd2/iKMeUqd4Rvb+lA8K+Nw8xMaSoft4A+G61sumi4MCaAqg0=@lists.freedesktop.org
X-Received: by 2002:a05:651c:150a:b0:2fb:4abb:7001 with SMTP id
 38308e7fff4ca-2fcbdf61dc4mr37792351fa.2.1730141698498; Mon, 28 Oct 2024
 11:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20241026035928.183454-1-tejasvipin76@gmail.com>
In-Reply-To: <20241026035928.183454-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Oct 2024 11:54:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vps5vWD72O_kYhuKudduYed41+tZrVRB6x+FiaZrm-EA@mail.gmail.com>
Message-ID: <CAD=FV=Vps5vWD72O_kYhuKudduYed41+tZrVRB6x+FiaZrm-EA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: leadtek-ltk050h3146w: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
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

On Fri, Oct 25, 2024 at 9:00=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> @@ -418,79 +398,42 @@ static const struct ltk050h3146w_desc ltk050h3146w_=
data =3D {
>                 MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
>  };
>
> -static int ltk050h3146w_a2_select_page(struct ltk050h3146w *ctx, int pag=
e)
> +static void ltk050h3146w_a2_select_page(struct mipi_dsi_multi_context *d=
si_ctx, int page)
>  {
> -       struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> -       u8 d[3] =3D { 0x98, 0x81, page };
> +       u8 d[4] =3D { 0xff, 0x98, 0x81, page };
>
> -       return mipi_dsi_dcs_write(dsi, 0xff, d, ARRAY_SIZE(d));
> +       mipi_dsi_dcs_write_buffer_multi(dsi_ctx, d, ARRAY_SIZE(d));

FWIW: the above might be slightly better as:

mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x98, 0x81, page);

That would make it more documenting that the 0xff is the "cmd", has
fewer lines of code, and also gets the array marked as "static const"
which might make the compiler slightly more efficient. ;-)

Not really a huge deal, though.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
