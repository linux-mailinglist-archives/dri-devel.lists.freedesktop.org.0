Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F438B1656
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 00:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298CF10E069;
	Wed, 24 Apr 2024 22:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KAOOlzy0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED2E10E069
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 22:43:29 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-78f05b62602so20866085a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 15:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713998607; x=1714603407;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nMrRFrfAkMBHNdCwNPCMk+6Pc/CQ0PrT4pRXz9no6XU=;
 b=KAOOlzy0RpQ03nVVMAew16ZqlLwwp9VaZ77bLNu+NNiQYzWuMeUBJtJeusvrT1vOAh
 zgxQJTnfm3t8Y80vD4M/ER9bD/S/gpJH2yU+PN3QUQ7vztR8jc+jS8ogQat08vFhxKUo
 QKvc/Hbl8lbBZr4qvTILhxmTVJa/Ubk3YUktw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713998607; x=1714603407;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nMrRFrfAkMBHNdCwNPCMk+6Pc/CQ0PrT4pRXz9no6XU=;
 b=W8ie/7aPbOoDRFPMDctUBcyrwH96bsyHVUlh0mmV6MZG85+oQus0UvLj9ntOnA/YuQ
 f/sUx+URVCidWsxyXlWK3yKb0KIgyF+AmZIeaOKV3WsjItI8p+oQlezldJolgYbihB1X
 SjMY3fzHT7xC/3JrPh5nhdPtuJFuzwGXRUUmDvp5pjkma3FQ/CnIySX6S+I8exCHevjP
 MJ7oqSbRVS8mrIVR/Sv3oZKgVGGkcQ68WgQRkvP3NP35cxxnMR6gpL2IUnn+xdxXJ3bn
 Fs2GuuP8Owrkz6CMmPPxJrZ1UpKWYstA+97KWyiEQAPGfG2HYYZx6xgz32UFAfrykolq
 PReQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoV25AKFWZ1JIVFRXBT2Or9fg2OYYggbAhaLBA5GiZbQCMfpxWnE5+juQtryXlv8FqRnESgtyV85HSKgnKfBQn2H0GmKVUfc3+KqYtrRzD
X-Gm-Message-State: AOJu0YxlheULQ4klglUcBpFr4jT2vegek/aLKC3y/WD30haiFTnfYG2S
 CjH3OrYiP0JhvxoDsXhddQiuvQlruZc3J8W+PU01SwNht7cnuRjFBKAJszDkSvyMAgStjItAFvI
 =
X-Google-Smtp-Source: AGHT+IF8xgGrngeCeteJBWr4N8ApA0oUV0dv8xNVloBaXLEAxGHcfmBmXgARWIvNLhJEGst3G3jakQ==
X-Received: by 2002:a05:620a:e15:b0:78d:6e6f:9004 with SMTP id
 y21-20020a05620a0e1500b0078d6e6f9004mr3893300qkm.59.1713998607279; 
 Wed, 24 Apr 2024 15:43:27 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05620a134c00b0078f0ee3fcfbsm6382857qkl.46.2024.04.24.15.43.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 15:43:26 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-436ed871225so60921cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 15:43:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXsdIrax6YFsas3OcWIfIcXk1uRceHlEj9+2RGwgaiDT/ldE8iDX+lKhklOq1H0P7LZ+3G+H0E8wg+po5LsyKxM7YH/hVRWT0DuJxQ9z3wy
X-Received: by 2002:ac8:795a:0:b0:437:b572:6a with SMTP id
 r26-20020ac8795a000000b00437b572006amr43473qtt.23.1713998605986; 
 Wed, 24 Apr 2024 15:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
 <20240422090310.3311429-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=V2O2aFDVn5CjbXfgcOLkmNp-G3ChVqQKouB2mDB+NZug@mail.gmail.com>
 <CAHwB_NJsDsTc=gjP8TJ+6ipo10uMYFLmuf+tKGVgxnznhuAcUQ@mail.gmail.com>
 <CAD=FV=UGDbNvAMjzWSOvxybGikQcvW9JsRtbxHVg8_97YPEQCA@mail.gmail.com>
 <CAHwB_N+e4E8uZe3YpfNyemPyW-Rj1RLR5kKA3SDiBygOPYrmVQ@mail.gmail.com>
In-Reply-To: <CAHwB_N+e4E8uZe3YpfNyemPyW-Rj1RLR5kKA3SDiBygOPYrmVQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 Apr 2024 15:43:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHmkVbU7RqvOPLpknWWTPAMWu_-EApWdcuPRRDMOim8g@mail.gmail.com>
Message-ID: <CAD=FV=XHmkVbU7RqvOPLpknWWTPAMWu_-EApWdcuPRRDMOim8g@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm/panel: himax-hx83102: Break out as separate
 driver
To: cong yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Tue, Apr 23, 2024 at 7:42=E2=80=AFPM cong yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Hi,
>  Thanks reply.
>
> Doug Anderson <dianders@chromium.org> =E4=BA=8E2024=E5=B9=B44=E6=9C=8824=
=E6=97=A5=E5=91=A8=E4=B8=89 00:26=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi,
> >
> > On Tue, Apr 23, 2024 at 2:37=E2=80=AFAM cong yang
> > <yangcong5@huaqin.corp-partner.google.com> wrote:
> > >
> > > > > +static int starry_init_cmd(struct hx83102 *ctx)
> > > > > +{
> > > > > +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> > > > > +
> > > > > +       mipi_dsi_dcs_write_seq(dsi, HX83102_SETEXTC, 0x83, 0x10, =
0x21, 0x55, 0x00);
> > > > > +
> > > > > +       mipi_dsi_dcs_write_seq(dsi, HX83102_SETPOWER, 0x2C, 0xB5,=
 0xB5, 0x31, 0xF1, 0x31, 0xD7, 0x2F,
> > > > > +                                                 0x36, 0x36, 0x3=
6, 0x36, 0x1A, 0x8B, 0x11, 0x65, 0x00, 0x88, 0xFA, 0xFF,
> > > > > +                                                 0xFF, 0x8F, 0xF=
F, 0x08, 0x74, 0x33);
> > > >
> > > > I know this is a sticking point between Linus W. and me, but I'm
> > > > really not a fan of all the hardcoded function calls since it bloat=
s
> > > > the code so much. I think we need to stick with something more tabl=
e
> > > > based at least for the majority of the commands. If I understand
> > > > correctly, Linus was OK w/ something table based as long as it was =
in
> > > > common code [1]. I think he also wanted the "delay" out of the tabl=
e,
> > > > but since those always seem to be at the beginning or the end it se=
ems
> > > > like we could still have the majority of the code as table based. D=
o
> > > > you want to make an attempt at that? If not I can try to find some
> > > > time to write up a patch in the next week or so.
> > >
> > > Do you mean not add "delay" in the table?  However, the delay
> > > required by each panel may be different. How should this be handled?
> >
> > In the case of the "himax-hx83102" driver, it looks as if all the
> > delays are at the beginning or end of the init sequence. That means
> > you could just make those extra parameters that are set per-panel and
> > you're back to having a simple sequence without delays.
>
> Do you mean add msleep  in hx83102_enable()?
>
> @@ -612,12 +604,15 @@ static int hx83102_enable(struct drm_panel *panel)
>         struct device *dev =3D &dsi->dev;
>         int ret;
>
> +       msleep(60);
>         ret =3D ctx->desc->init_cmds(ctx);
>         if (ret) {
>                 dev_err(dev, "Panel init cmds failed: %d\n", ret);
>                 return ret;
>         }
>
> +       msleep(60);
> +
>         ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
>
> >
> > If you had panels that needed delays in a more complicated way, you
> > could keep the per-panel functions but just make the bulk of the
> > function calls apply a sequence. For instance:
> >
> > static int my_panel_init_cmd(...)
> > {
> >   ret =3D mipi_dsi_dcs_write_cmd_seq(dsi, my_panel_init_cmd_seq);
> >   if (ret)
> >     return ret;
> >   mdelay(100);
> >   ret =3D mipi_dsi_dcs_write(dsi, ...);
> >   if (ret)
> >     return ret;
> >   mdelay(50);
> >   ret =3D mipi_dsi_dcs_write_cmd_seq(dsi, ...);
> >   if (ret)
> >     return ret;
> > }
> >
> > The vast majority of the work is still table driven so it doesn't
> > bloat the code, but you don't have the "delay" in the command sequence
> > since Linus didn't like it. I think something like the above would
> > make Linus happy and I'd be OK w/ it as well. Ideally you should still
> > make your command sequence as easy to understand as possible, kind of
> > like how we did with _INIT_SWITCH_PAGE_CMD() in
> > "panel-ilitek-ili9882t.c"
> >
> > As part of this, you'd have to add a patch to create
> > mipi_dsi_dcs_write_cmd_seq(), but hopefully that shouldn't be too
> > complicated?
> >
> >
> > > It would be great if you could help provide a patch. Thank you so muc=
h.
> >
> > Sure, I can, though maybe you want to give it a shot with the above des=
cription?
>
> Sorry, I still don't seem to understand. How to encapsulate the parameter=
s of
> "HX83102_SETDISP, HX83102_SETCYC,....."? Different parameters for each pa=
nel.
> I have sent my V3 but it does not contain the patch you want.

It sounds as if Dmitry has come up with a solution that allows us to
keep using the functions like you've been using but avoid the code
bloat problems. ...so let's go with that. It sounds as if he's going
to send a patch before too long and then it should be pretty easy to
convert your patches over to use his new function.

[1] https://lore.kernel.org/r/CAA8EJprv3qBd1hfdWHrfhY=3DS0w2O70dZnYb6TVsS6A=
GRPxsYdw@mail.gmail.com
