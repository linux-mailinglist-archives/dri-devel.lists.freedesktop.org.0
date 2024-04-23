Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98A28AF3C4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 18:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D20113483;
	Tue, 23 Apr 2024 16:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RQXJDRRY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3137E113483
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 16:19:49 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-78f04581a66so396061785a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 09:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713889186; x=1714493986;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wanqofR/Nuk2X7+WPgVh3aZdwvGB0rIxPhS4chd4Kfw=;
 b=RQXJDRRYunIx2k05XjPk5RfhxznMyfD5bWf1qZ5ZhVs0cuautE82pn/G21I4OmjlfK
 qXz3BGlqCvTb10nkt2DdVJ1M5m/JuA5DUDA3xAIwuJ81Puu7wnhzuPp97vpy07JTnAgo
 ZDNCkA2fQZ80k/nwOUyheRrl/MTN2LA4UARsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713889186; x=1714493986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wanqofR/Nuk2X7+WPgVh3aZdwvGB0rIxPhS4chd4Kfw=;
 b=vspL6QUMAszU2qZ6Ul+dp/HrU9nQ2bbWl6ecfj1gF/VonDPwEVtEcvVmMLKcyDPpIB
 6UHYFR2uhY1fks55eySbBG58PeookydjPiqiRZGiQviIHdcIQVvFtEQseiRObZuLv7L5
 C5JL4+w5zBYS4O0pGqaa/oHDQW6MgHLWZ0lmsGrM3GaLC+qMS/BLGi8YfoObvpUGP+po
 lvfGrdU6e2copGbl2gvs7KhsMdUZ9gALU03oJZsiZmTIwnce5nTMyxHvdLUM/4WtSPTH
 dcws2ZCcMv8O6iaVK0TBqcXTGQciubAGenG36PcmUQ8zQI1JyANDsYFXITF/3XS39ZQr
 sLKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo672PLenr2S7ChMlhxgiSH5SJodiUlktrfQglhyhbvO8isRynjFaUMiXy0neVA+ucb0mKaHK11ebr8UrED3S6GmkJm12JX6BWSewe+duL
X-Gm-Message-State: AOJu0YxcrDtD1UAzU11A2+rAXY2Ly0iDl2wMjKirs69c1hyoNoNA3B38
 EvaGxKeRhHhuDkIfr5+cdzP5uiBwpsV8aQspXj1t/Bhg3X6MUA1efaU6T8kmkWd6WNlpz80epIz
 FgiMs
X-Google-Smtp-Source: AGHT+IEeZYBNEohgR7UieU4PvXdW+iumfa/cCeKYQ5waQwl4/dYOZzP3IgUpvrYtAzv0wqpDXj755g==
X-Received: by 2002:a05:620a:b0e:b0:790:676e:3bbf with SMTP id
 t14-20020a05620a0b0e00b00790676e3bbfmr10919561qkg.12.1713889186006; 
 Tue, 23 Apr 2024 09:19:46 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com.
 [209.85.160.178]) by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a0a4c00b0078d6120fad0sm5380832qka.108.2024.04.23.09.19.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 09:19:45 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-434ffc2b520so219851cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 09:19:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUsRpuoYhM3a8C86bOeGLPYocS0v4Oy+xpnJd+5/d7IDLAiBcEXvWIKC8PaUc/8xxOuwVpVqiQDnO8GYtwASyYHk5XCg5KGIITAxJJOkHjW
X-Received: by 2002:ac8:4053:0:b0:437:9875:9671 with SMTP id
 j19-20020ac84053000000b0043798759671mr278456qtl.0.1713889184337; Tue, 23 Apr
 2024 09:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
 <20240422090310.3311429-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=V2O2aFDVn5CjbXfgcOLkmNp-G3ChVqQKouB2mDB+NZug@mail.gmail.com>
 <CAHwB_NJsDsTc=gjP8TJ+6ipo10uMYFLmuf+tKGVgxnznhuAcUQ@mail.gmail.com>
In-Reply-To: <CAHwB_NJsDsTc=gjP8TJ+6ipo10uMYFLmuf+tKGVgxnznhuAcUQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Apr 2024 09:19:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UGDbNvAMjzWSOvxybGikQcvW9JsRtbxHVg8_97YPEQCA@mail.gmail.com>
Message-ID: <CAD=FV=UGDbNvAMjzWSOvxybGikQcvW9JsRtbxHVg8_97YPEQCA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm/panel: himax-hx83102: Break out as separate
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

On Tue, Apr 23, 2024 at 2:37=E2=80=AFAM cong yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> > > +static int starry_init_cmd(struct hx83102 *ctx)
> > > +{
> > > +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> > > +
> > > +       mipi_dsi_dcs_write_seq(dsi, HX83102_SETEXTC, 0x83, 0x10, 0x21=
, 0x55, 0x00);
> > > +
> > > +       mipi_dsi_dcs_write_seq(dsi, HX83102_SETPOWER, 0x2C, 0xB5, 0xB=
5, 0x31, 0xF1, 0x31, 0xD7, 0x2F,
> > > +                                                 0x36, 0x36, 0x36, 0=
x36, 0x1A, 0x8B, 0x11, 0x65, 0x00, 0x88, 0xFA, 0xFF,
> > > +                                                 0xFF, 0x8F, 0xFF, 0=
x08, 0x74, 0x33);
> >
> > I know this is a sticking point between Linus W. and me, but I'm
> > really not a fan of all the hardcoded function calls since it bloats
> > the code so much. I think we need to stick with something more table
> > based at least for the majority of the commands. If I understand
> > correctly, Linus was OK w/ something table based as long as it was in
> > common code [1]. I think he also wanted the "delay" out of the table,
> > but since those always seem to be at the beginning or the end it seems
> > like we could still have the majority of the code as table based. Do
> > you want to make an attempt at that? If not I can try to find some
> > time to write up a patch in the next week or so.
>
> Do you mean not add "delay" in the table?  However, the delay
> required by each panel may be different. How should this be handled?

In the case of the "himax-hx83102" driver, it looks as if all the
delays are at the beginning or end of the init sequence. That means
you could just make those extra parameters that are set per-panel and
you're back to having a simple sequence without delays.

If you had panels that needed delays in a more complicated way, you
could keep the per-panel functions but just make the bulk of the
function calls apply a sequence. For instance:

static int my_panel_init_cmd(...)
{
  ret =3D mipi_dsi_dcs_write_cmd_seq(dsi, my_panel_init_cmd_seq);
  if (ret)
    return ret;
  mdelay(100);
  ret =3D mipi_dsi_dcs_write(dsi, ...);
  if (ret)
    return ret;
  mdelay(50);
  ret =3D mipi_dsi_dcs_write_cmd_seq(dsi, ...);
  if (ret)
    return ret;
}

The vast majority of the work is still table driven so it doesn't
bloat the code, but you don't have the "delay" in the command sequence
since Linus didn't like it. I think something like the above would
make Linus happy and I'd be OK w/ it as well. Ideally you should still
make your command sequence as easy to understand as possible, kind of
like how we did with _INIT_SWITCH_PAGE_CMD() in
"panel-ilitek-ili9882t.c"

As part of this, you'd have to add a patch to create
mipi_dsi_dcs_write_cmd_seq(), but hopefully that shouldn't be too
complicated?


> It would be great if you could help provide a patch. Thank you so much.

Sure, I can, though maybe you want to give it a shot with the above descrip=
tion?

-Doug
