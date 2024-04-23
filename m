Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1275E8AF81B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 22:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C98D1136B6;
	Tue, 23 Apr 2024 20:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0bksULoN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E691136B6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 20:42:15 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-439b1c72676so33611cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 13:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713904934; x=1714509734;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gBaEPajCkSnKrTb2DDUtDRO7q5j6yIsYeUTfCcOrMGA=;
 b=0bksULoNo5GN1+Y9vhZwrCJap58mKs2+x9jT5wTV5AzpXJllQc5rqDLpa/GxutZ5hG
 RHiOtAB+mCWeUce4crm0qSrsEswY5MqHiMzNrLyGJ+88KKDkIfzCskcJ9OTpUCqLvTpA
 C6U9W8JJEEXdDTn/gW3zQqIx/lgX+qx4ss56R9B0y3KZ0fkcm3FKgAJ/CW+FslXLjVi9
 0nCvLGYAfenw3tms5gqFK1yl5F/A0+wPeyhhQRw/l63S5ao71kufd7aAy5fOhGSUo0oM
 NoA/VWLLxXhLr+9nCCuMM6dZobAK7uUDViZq6IaO+MknDwkZrvSqjUurIXpALRlQFbUE
 24RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713904934; x=1714509734;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBaEPajCkSnKrTb2DDUtDRO7q5j6yIsYeUTfCcOrMGA=;
 b=TZkjk8wtJtYtUK4q1/SwMxGMMz7uGnfqRKht49WSW9Ogh9+sogBG+uhivH9HJtIruz
 j46VgHwuwcyabRcDLCYjIeaRxbsrFPenvdI7DcuH4tNkl1822Q+deDTe8pisvaT73Xia
 1kypUm4fvuuOuWqRtRfTjrwseyJXwJk2qrMU+gc7ifwlwHSoREZYDKx/YiUyS75QndjV
 oDKcRSngkYI7lTduo/FpCy33gp8D/dgSntYR422Hk203s6HoMz1j5I7jh5rkoMg+xn94
 vkYLCUcoj3eHQe3oBBDg9CBYGewSRLlwaWGl5M13rXBTFQFMy67x5GLcEAcBg4CpLEd+
 jMqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQpuA/SVZljMCD083Nl3/NtKzUzW78LbYVGrZNGyPahvm05XY4v2adk2i33nR5cy91zw4czaq8Ayd9LcdmLSYf2O18bLkGNNkpDwpr2H9A
X-Gm-Message-State: AOJu0Yx3GhsQv/HCF8f9Z4Fun7yLtzACkjDD+xoE789ljbguwDv6v2Z8
 rnHNdCFT6llpuE610eIRgDiuB1/yORJzr7mU4YdFtB586ojvaYiXWCIj+/vU1siFKExTPfk/1NK
 wJVy4p478iuxlpbBifIe+Wej28sO4puKgVNfQ
X-Google-Smtp-Source: AGHT+IHM5cqjg54cb9ro/IxJNIkES3D9cFrBeXaYCys/rrJyRDxCkf4sLwPEhC9IJaInYueqnzKY2005j/7L4KiVNz0=
X-Received: by 2002:a05:622a:4402:b0:434:d055:5b00 with SMTP id
 ka2-20020a05622a440200b00434d0555b00mr63892qtb.20.1713904934205; Tue, 23 Apr
 2024 13:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240418081548.12160-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240418081548.12160-3-lvzhaoxiong@huaqin.corp-partner.google.com>
 <zanx5y3obqmewnbooovf52hx6vh7tpi4zsbse2dyzcqzddmzhw@kewxoa6n3mja>
 <CACb=7PURWtS8bwT5EcAFHhu7deHd2Y8cNOattfdwyEYpOUcbnQ@mail.gmail.com>
 <vbt2nxddw2dc7hkreq4iybv5zv5xyp32oajybeqsphgfrhzmn7@tskvckljmxpe>
 <CACb=7PVTvV9nsFu1ZAXu7YTjSOAGZka+c__EJq3J3qgSJGEShw@mail.gmail.com>
In-Reply-To: <CACb=7PVTvV9nsFu1ZAXu7YTjSOAGZka+c__EJq3J3qgSJGEShw@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Tue, 23 Apr 2024 13:41:59 -0700
Message-ID: <CAD=FV=VYAzqsGEBJai9b9n+HxHiG59L1vF73AEWcTwLS_ryjWw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel: kd101ne3: add new panel driver
To: Hsin-Yi Wang <hsinyi@google.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>, mripard@kernel.org, 
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 cong yang <yangcong5@huaqin.corp-partner.google.com>
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

On Tue, Apr 23, 2024 at 11:10=E2=80=AFAM Hsin-Yi Wang <hsinyi@google.com> w=
rote:
>
> > > > > +#define _INIT_DCS_CMD(...) { \
> > > > > +     .type =3D INIT_DCS_CMD, \
> > > > > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > > > > +     .data =3D (char[]){__VA_ARGS__} }
> > > > > +
> > > > > +#define _INIT_DELAY_CMD(...) { \
> > > > > +     .type =3D DELAY_CMD,\
> > > > > +     .len =3D sizeof((char[]){__VA_ARGS__}), \
> > > > > +     .data =3D (char[]){__VA_ARGS__} }
> > > >
> > > > This is the third panel driver using the same appoach. Can you use
> > > > mipi_dsi_generic_write_seq() instead of the huge table? Or if you p=
refer
> > > > the table, we should extract this framework to a common helper.
> > > > (my preference is shifted towards mipi_dsi_generic_write_seq()).
> > > >
> > > The drawback of mipi_dsi_generic_write_seq() is that it can cause the
> > > kernel size grows a lot since every sequence will be expanded.
> > >
> > > Similar discussion in here:
> > > https://lore.kernel.org/dri-devel/CAD=3DFV=3DWju3WS45=3DEpXMUg7FjYDh3=
-=3Dmvm_jS7TF1tsaAzbb4Uw@mail.gmail.com/
> > >
> > > This patch would increase the module size from 157K to 572K.
> > > scripts/bloat-o-meter shows chg +235.95%.
> > >
> > > So maybe the common helper is better regarding the kernel module size=
?
> >
> > Yes, let's get a framework done in a useful way.
> > I'd say, drop the _INIT_DELAY_CMD. msleep() and usleep_range() should b=
e
> > used instead (and it's up to the developer to select correct delay
> > function).
> >
> > >
> > > > > +
> > > > > +static const struct panel_init_cmd kingdisplay_kd101ne3_init_cmd=
[] =3D {
> > > > > +     _INIT_DELAY_CMD(50),
> > > > > +     _INIT_DCS_CMD(0xE0, 0x00),
> >
> > [skipped the body of the table]
> >
> > > > > +     _INIT_DCS_CMD(0x0E, 0x48),
> > > > > +
> > > > > +     _INIT_DCS_CMD(0xE0, 0x00),
> >
> > > > > +     _INIT_DCS_CMD(0X11),
> >
> > Also, at least this is mipi_dsi_dcs_exit_sleep_mode().
> >
> > > > > +     /* T6: 120ms */
> > > > > +     _INIT_DELAY_CMD(120),
> > > > > +     _INIT_DCS_CMD(0X29),
> >
> > And this is mipi_dsi_dcs_set_display_on().
> >
> > Having a single table enourages people to put known commands into the
> > table, the practice that must be frowned upon and forbidden.
> >
> > We have functions for some of the standard DCS commands. So, maybe
> > instead of adding a single-table based approach we can improve
> > mipi_dsi_generic_write_seq() to reduce the bloat. E.g. by moving the
> > error handling to a common part of enable() / prepare() function.
> >
>
> For this panel, I think it can also refer to how
> panel-kingdisplay-kd097d04.c does. Create the table for init cmd data,
> not what operation to use, and use mipi_dsi_generic_write_seq() when
> looping through the table.

Even more similar discussion:

https://lore.kernel.org/r/CAD=3DFV=3DUGDbNvAMjzWSOvxybGikQcvW9JsRtbxHVg8_97=
YPEQCA@mail.gmail.com
