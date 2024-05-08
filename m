Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BC38C030A
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 19:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A79113137;
	Wed,  8 May 2024 17:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dXjk2eg0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C99113137
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 17:25:05 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-78f049ddd7dso358843285a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 10:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715189103; x=1715793903;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+VKTM4P5eufJalRCrDbHQ7nMVvva4ngXjaL2EQ5cWU=;
 b=dXjk2eg0vwQ9Mh2D2AWipHgYwWgGcFdg09j61VrI7CR1h00EYCnAFdbJa1531LRj5Y
 tiGF7TficEbBVw7JMbZvRRgBAClZhgamZoWuqnazBovZ8W/f6eSXGaMb4kjzqflMZzA/
 AlO0Fa/bN8jwxjeM+IVHG7MHgIqXAqWzAthLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715189103; x=1715793903;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+VKTM4P5eufJalRCrDbHQ7nMVvva4ngXjaL2EQ5cWU=;
 b=uaZJAPDf7SgKEIccerwgvoUfk8+ciuyEmkVvAwBDHgTvmQih223P/JUC9HOmTzAcvN
 0mOn2lOHjsZpmw7amBx8wrrLMUUtC9FxLVP5VP/7X0RP/N8x0Zn7IrscSn9RGRANKOvd
 9ifTphPiirt14Ck1s5NlNRNGlTaNBENpBxIjO54+mKHNMfFjtz5pqc3/JXQ7SWeG9zCt
 HoMOI11JfSjuaBZMy7hHtE3dxmwp8MvbuB7T3mUjCudMFW7+iyVL1qO7rkr8s/CUEUhd
 KpPmr0FA7Q6rMPZnx6a9sYMPXC1KvtKoD3tQhvb3Y7Wi5U0A/iyOurlQ19CD2HDxoBXZ
 7Nzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG/FczO4q85RVCUS6Rn1dwBSEYD6iL/Q+OP5cL4knt5/gjAmou5I7PxcbaIyQLT+oEIpNS/M/wHCULnpfcx18p6rrdqv8/Xbt8OCgre0nB
X-Gm-Message-State: AOJu0YwCB8Qm6HZBGxiBxdaTr6wa+SSghf73GZ171JotiSWpIHLIU9J3
 483bB1b465wNSJjRBk6vXKIzDjuJ4PIkYfC5BQzCA3Srgb6PclDiHSoSsc0wUNpELg5ZpONvA5I
 =
X-Google-Smtp-Source: AGHT+IFdq6fiz/gyOKlisbi4UfECLFvuxOic/7/VR+xsD06MlsLeAoCsOCt4HmVq6igRpU3grimEHQ==
X-Received: by 2002:a05:620a:2446:b0:792:776e:8a46 with SMTP id
 af79cd13be357-792b285c3b2mr454871985a.47.1715189103270; 
 Wed, 08 May 2024 10:25:03 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 j10-20020a05620a410a00b0079297c6be3esm3314111qko.66.2024.05.08.10.25.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 10:25:01 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-439b1c72676so30991cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 10:25:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVJC1wov9TPGvQqIFRDImZFsY8AewVFkg/kU9dSjNg2qMYcmM6vWZ6nqGTGUIZ/uesloInjgN75XPwM1jMA/C1N/R3rWosbFNaxGzL4f1OQ
X-Received: by 2002:a05:622a:4e0a:b0:43d:db04:45d1 with SMTP id
 d75a77b69052e-43ddb044c2fmr2760251cf.1.1715189101210; Wed, 08 May 2024
 10:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240507135234.1356855-1-yangcong5@huaqin.corp-partner.google.com>
 <20240507135234.1356855-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=Wj5WKcVbNGHQ_BbZa_fsVJkpYb2C8TE8bjhvJvx+N_hw@mail.gmail.com>
 <CAHwB_NKPswAvE5TjRxWMR8LLV5sNuMmymXr4nhDc3r_AdRKr8A@mail.gmail.com>
In-Reply-To: <CAHwB_NKPswAvE5TjRxWMR8LLV5sNuMmymXr4nhDc3r_AdRKr8A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 May 2024 10:24:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UJkmAPB1h87o0m+6HSbVg7ehr0Xd+JFpuF+vuezof-hg@mail.gmail.com>
Message-ID: <CAD=FV=UJkmAPB1h87o0m+6HSbVg7ehr0Xd+JFpuF+vuezof-hg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] drm/panel: himax-hx83102: Break out as separate
 driver
To: cong yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
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

On Wed, May 8, 2024 at 4:52=E2=80=AFAM cong yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> > > +static int starry_himax83102_j02_init(struct hx83102 *ctx)
> > > +{
> > > +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi=
 };
> > > +
> > > +       hx83102_enable_extended_cmds(ctx, true);
> > > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2c=
, 0xb5, 0xb5, 0x31, 0xf1,
> > > +                                        0x31, 0xd7, 0x2f, 0x36, 0x36=
, 0x36, 0x36, 0x1a, 0x8b, 0x11,
> > > +                                        0x65, 0x00, 0x88, 0xfa, 0xff=
, 0xff, 0x8f, 0xff, 0x08, 0x74,
> > > +                                        0x33);
> >
> > The indentation is still off here. You have 5 tabs followed by a
> > space. To make things line up with the opening brace I think it should
> > be 4 tabs followed by 5 spaces.
>
> Sorry, my  editor 'Visual Studio Code' It seems that the correct indentat=
ion
> is not recognized. I have checked it through the 'vim' editor in the V4 v=
ersion.
> Thanks.

FWIW, I use VS Code and it looks fine to me. Maybe check your VS Code
settings? Tab size should be 8.


> > > +static int hx83102_enable(struct drm_panel *panel)
> > > +{
> > > +       struct hx83102 *ctx =3D panel_to_hx83102(panel);
> > > +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> > > +       struct device *dev =3D &dsi->dev;
> > > +       int ret;
> > > +
> > > +       ret =3D ctx->desc->init(ctx);
> > > +       if (ret)
> > > +               return ret;
> >
> > You're still changing behavior here. In the old boe-tv101wum-nl6
> > driver the init() function was invoked at the end of prepare(). Now
> > you've got it at the beginning of enable(). If this change is
> > important it should be in a separate commit and explained.
> >
> >
> > > +       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> > > +       if (ret) {
> > > +               dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> > > +               return ret;
> > > +       }
> > > +
> > > +       msleep(120);
> > > +
> > > +       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> > > +       if (ret) {
> > > +               dev_err(dev, "Failed to turn on the display: %d\n", r=
et);
> > > +       }
> >
> > The old boe-tv101wum-nl6 driver didn't call
> > mipi_dsi_dcs_exit_sleep_mode() nor mipi_dsi_dcs_set_display_on() in
> > its enable routine, did it? If this change is important please put it
> > in a separate change and justify it.
>
> In the old boe-tv101wum-nl6 driver inital cmds was invoked at the end of
> prepare() function , and call 0x11 and 0x29 at end of inital. For
> himax-hx83102 driver, we move inital cmds invoked at enable() function.
> For panel timing, I think there is no much difference. They are
> all initial cmds executed after meeting the power-on sequence.
> I will update these in the v4 commit message.

Ah, I see! So the mipi_dsi_dcs_exit_sleep_mode() was the 0x11 in the
old code and the mipi_dsi_dcs_set_display_on() was the 0x29 in the old
code. OK, I agree that it's better like you've done it where those
functions are moved out of the "->init()" function and into the
caller, so please keep that as you have it.

The only thing I would request is to keep the ->init() call to be made
at the end of prepare() instead of the beginning of enable(). It may
not matter too much, but in that case I'd rather keep it how it was or
make it an explicit change and not an implicit part of the refactor.

-Doug
