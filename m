Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A0E8B4304
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 02:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87CE10E56B;
	Sat, 27 Apr 2024 00:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QywPv66L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E9510E56B
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 00:09:09 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-de462f3d992so3011975276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 17:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714176548; x=1714781348;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9qkev+9t48kVKKfN+OMtp3Q7S6ESNoKoLQUe43MCWOA=;
 b=QywPv66LbhS15PsBc4zCCLYZBCVkVKoRXS1UvtxOSOdFQQnv0ZIIHo5CxslEetmdBN
 EAOqFU/vMDzuRGdDkaplfgHqpFDLXOKDfZWiV/47ZaBOVOvoir4IFOZ2CQvzNdTKlLKR
 eNDPO9faUsuCwzgR84r4RQc+hQ5NRqEPIE2f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714176548; x=1714781348;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9qkev+9t48kVKKfN+OMtp3Q7S6ESNoKoLQUe43MCWOA=;
 b=aBffNmZfRIsUgl/LtKBa5ZNtIZtjRwfiCeBVQqmiFiVuuIXJwUB0UPi4iWz/YhhYKT
 BM138kF/CHUsBd69jWy7zvY30maHemB9BcvU6W0PN1ZTvv2rkDFdd1ET2Tt+djwZDLgR
 mXvPbr/qliCDIxooWGvuKvPFuhj0lth07nC1nNSn9dbRBzF9esaqhb5gZz4dOh9F7Tmc
 zDxMbOzCYHzXMHbHKWil18LOEO/BRK4gKplJWdWDoECnh0/1lY0yowHx8dCsXtQKgI9H
 hyRkgJ5Op2x24z4Rz7ClI1cMPTb08MPdldDpD7WwRsBSTndWnO80nn6rFLIU5DzScpw4
 UFqg==
X-Gm-Message-State: AOJu0YyqQ+HvSGYcgvjVblSxPoUa5KPgfeHQYiNrMHA/gxA2zA0Dvrnp
 qI/6ZEpGfCqYI/Mtguv7046t06P5MV6xyjf+3WC8ImjjCwbWmjAhyCbPDaij9JcyFpZ8ExG+Hyo
 =
X-Google-Smtp-Source: AGHT+IHvHHw2w/nJtUjShMe2lv99MwtbzcYAC35K5RXLZarZVxm/uQswRhMzj5r0eJY6QlxY5Cuikw==
X-Received: by 2002:a25:b944:0:b0:dcd:3663:b5e5 with SMTP id
 s4-20020a25b944000000b00dcd3663b5e5mr1117057ybm.25.1714176548006; 
 Fri, 26 Apr 2024 17:09:08 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com.
 [209.85.160.178]) by smtp.gmail.com with ESMTPSA id
 i15-20020ac8488f000000b00436a8ee913csm8365492qtq.41.2024.04.26.17.09.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 17:09:07 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-436ed871225so62101cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 17:09:06 -0700 (PDT)
X-Received: by 2002:ac8:5a92:0:b0:43a:5f02:bbe2 with SMTP id
 c18-20020ac85a92000000b0043a5f02bbe2mr116908qtc.24.1714176097206; Fri, 26 Apr
 2024 17:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240424172017.1.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
 <87pludq2g0.fsf@intel.com>
 <CAD=FV=W+Pcr+voBkcfeE_UC+ukN_hLXgoqMk0watROWRXe_2dg@mail.gmail.com>
 <8734r85tcf.fsf@intel.com>
 <CAD=FV=XNbRauayNFNOODm-aaaLy2_vJk8OW-mR_XmLv505RtGA@mail.gmail.com>
In-Reply-To: <CAD=FV=XNbRauayNFNOODm-aaaLy2_vJk8OW-mR_XmLv505RtGA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 Apr 2024 17:01:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4DAUGEapnre1C0HJ80ooHJU=7fy+JESbRtnJEiL3gCA@mail.gmail.com>
Message-ID: <CAD=FV=V4DAUGEapnre1C0HJ80ooHJU=7fy+JESbRtnJEiL3gCA@mail.gmail.com>
Subject: Re: [PATCH] drm/mipi-dsi: Reduce driver bloat of
 mipi_dsi_*_write_seq()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linus.walleij@linaro.org, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 lvzhaoxiong@huaqin.corp-partner.google.com, Hsin-Yi Wang <hsinyi@google.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

On Fri, Apr 26, 2024 at 8:28=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > I don't find this unintuitive, but if it helps, you could conceivably
> > add a context parameter:
> >
> >         struct mipi_dsi_seq_context context =3D {
> >                 .dsi =3D dsi,
> >         };
> >
> >         mipi_dsi_dcs_write_seq(&context, HX83102_SETSPCCMD, 0xcd);
> >         ...
> >
> >         if (context.ret)
> >                 ...
> >
> > And even have further control in the context whether to log or keep
> > going or whatever.
>
> I agree there are some benefits of adding the extra "context"
> abstraction and we can go that way if you want, but I lean towards the
> simplicity of just passing in the accumulated return value like I did
> in my example.
>
>
> I'll try to write up patches and see if I can post them later today.

FWIW, I went with your "context" idea. In the end, I liked how it
looked and the icing on the cake was that it generated even smaller
code! :-)

My v2 series (now 8 patches long) is at:

https://lore.kernel.org/r/20240426235857.3870424-1-dianders@chromium.org


-Doug
