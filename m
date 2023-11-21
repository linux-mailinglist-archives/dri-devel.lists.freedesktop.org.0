Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5502A7F35C7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 19:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC7E10E560;
	Tue, 21 Nov 2023 18:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F82710E560
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 18:15:07 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5484ef5e3d2so6297011a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 10:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700590502; x=1701195302;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k3jeSqyUsXuR0G429BNK/7gdoytWLHrpF12cSBcFFIQ=;
 b=IhJp01o5Vel0ImmEaYJmDdHCoAmgb9NjXPdMZ44inq9U6blXm6PFFwWMfluIIuRW6K
 1JE0sefnEZsERPanbBlm+yHgf7x+GOQc+RtokW2pDFzJfQ4ub09FRYEk03OPbOD4QkNf
 ZOWrWbp2Wl9PX6QG8AQRPetMAT26hVwIwtVn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700590502; x=1701195302;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k3jeSqyUsXuR0G429BNK/7gdoytWLHrpF12cSBcFFIQ=;
 b=YRg0n5hRXwJqeE9ZUtqoIIboqYxH7XG8z03iPUj5z3Xf+ds8haJRAlym/WXNTWBGat
 ijTHpcEtg9TPPL78kqcVgE2+ILSpB0BN7gbdtZ3vRQGGONWePYw00ErlnOLh1HcRDthS
 NTadX/VKH3Ekqfy67iJV8SdEEjSLlfUaLmqm54H6ARCQnYE58kHbdIeIfWH23KO91DXt
 3LkeLNjHgqEQ1VVYDkuTIcK8v0JhpyHMRCdzgRHDwLDjetJJB11CCN/ovf2bCMJzwJqM
 JRhaq+oTgcTOR0suPX1zOqzJsGMm1m2GTDGDNOfHOPi0F77U2fLlb9SVvqIaL3GvA19x
 Wzlg==
X-Gm-Message-State: AOJu0YydRDHNLePLJywldpMG2y6zfwbI48rLCwNNTKO4IeQhiTi2X4kV
 cLvqYl8dl6EdygsRzReKmCrgpyfCTkVnHZMBgG7pn0Ei
X-Google-Smtp-Source: AGHT+IF3JsIZvkWEdVl/9RxG3OkaTggzCojdmV696hbekTA5eLmUL1dIS1B3elQr+fjSxo7irSlWoA==
X-Received: by 2002:a17:906:9c85:b0:9c1:edd8:43c2 with SMTP id
 fj5-20020a1709069c8500b009c1edd843c2mr9928257ejc.42.1700590502228; 
 Tue, 21 Nov 2023 10:15:02 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 cb26-20020a170906a45a00b0099c53c4407dsm5515512ejb.78.2023.11.21.10.15.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 10:15:02 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-408c6ec1fd1so4225e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 10:15:01 -0800 (PST)
X-Received: by 2002:a05:600c:1c1f:b0:3f4:fb7:48d4 with SMTP id
 j31-20020a05600c1c1f00b003f40fb748d4mr3601wms.3.1700590500881; Tue, 21 Nov
 2023 10:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20231120020109.3216343-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=WKMrnAqYNHpcKw4=X75Ts_cCkoXZKQ+b7G1pXstUCMRg@mail.gmail.com>
In-Reply-To: <CAD=FV=WKMrnAqYNHpcKw4=X75Ts_cCkoXZKQ+b7G1pXstUCMRg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 21 Nov 2023 10:14:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UxN9vgWM9e1n_1pqcOJqzhhVtE7H2h+XMf0o_Mo7Jz5g@mail.gmail.com>
Message-ID: <CAD=FV=UxN9vgWM9e1n_1pqcOJqzhhVtE7H2h+XMf0o_Mo7Jz5g@mail.gmail.com>
Subject: Re: [PATCH V3] drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
 panel HFP and HBP
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, zhouruihai@huaqin.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang <hsinyi@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 20, 2023 at 10:05=E2=80=AFAM Doug Anderson <dianders@google.com=
> wrote:
>
> Hi,
>
> On Sun, Nov 19, 2023 at 6:01=E2=80=AFPM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > The refresh reported by modetest is 60.46Hz, and the actual measurement
> > is 60.01Hz, which is outside the expected tolerance. Adjust hporch and
> > pixel clock to fix it. After repair, modetest and actual measurement we=
re
> > all 60.01Hz.
> >
> > Modetest refresh =3D Pixel CLK/ htotal* vtotal, but measurement frame r=
ate
> > is HS->LP cycle time(Vblanking). Measured frame rate is not only affect=
e
> > by Htotal/Vtotal/pixel clock, also affected by Lane-num/PixelBit/LineTi=
me
> > /DSI CLK. Assume that the DSI controller could not make the mode that w=
e
> > requested(presumably it's PLL couldn't generate the exact pixel clock?)=
.
> > If you use a different DSI controller, you may need to readjust these
> > parameters. Now this panel looks like it's only used by me on the MTK
> > platform, so let's change this set of parameters.
> >
> > Fixes: 1bc2ef065f13 ("drm/panel: Support for Starry-himax83102-j02 TDDI=
 MIPI-DSI panel")
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Chage since V2:
> >
> > - Update commit message.
> >
> > V2: https://lore.kernel.org/all/20231117032500.2923624-1-yangcong5@huaq=
in.corp-partner.google.com
> >
> > Chage since V1:
> >
> > - Update commit message.
> >
> > V1: https://lore.kernel.org/all/20231110094553.2361842-1-yangcong5@huaq=
in.corp-partner.google.com
> > ---
> >  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> As per previous discussions, this seems OK to me. I'll give it one
> more day for anyone to speak up and then plan to land it.

Pushed to drm-misc-fixes:

cea7008190ad drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
panel HFP and HBP
