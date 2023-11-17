Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D94E7EF6C3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 18:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB28910E2F7;
	Fri, 17 Nov 2023 17:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F086710E2F7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 17:11:38 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9d242846194so316195866b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 09:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700241095; x=1700845895;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hDNnd6/aPHHekufZp74kyH5A3dFam5hx1vRv3RYwbhI=;
 b=kJIfqMLh+nNSww4i1T1VEfBTjhfbom+RpKNsYhsl3CbCYEGZI502WTXkiKQSQy8Ul1
 7l/a5rLwurkbPxJYiGMAq6gy9humTc8k0YhWPD2dm80A12GUCyV3faKf3aD1eSae/doc
 sUEdrHcedmp7IP8lwnA7YKyc5ehal16Pvgi+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700241095; x=1700845895;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hDNnd6/aPHHekufZp74kyH5A3dFam5hx1vRv3RYwbhI=;
 b=p0ZZD/hbK43mlqy3erZTIOdjkJBH5eLADgn/E+yETMsu1iK+xUWyMpy6glqM+68EXI
 84+iiHG8yHW2oaW7H0D+GyEUiIruXWE1zH5zM/JvoPbviUpUdPcYpNhzhi8A5Th4UhNL
 SnDhDO0SphrmjryPR4K/UhsQZvRvVWbpRdBZ3s7oFughTAqDOpLUWY/C30mcCaXjMYxX
 XcN7guZZkC1FrGZ5R2iazMpLSVkNbHAZaVPqUU5o/tFK1dkOO6srFR5NwY6g9Mcou6Fd
 ZbNP2F1BqN5mJ+ZSIAi6/ST45BcD1FNm8TQptA5+Bk5KHRLy2v+MIouD/8c0r4beivpz
 K8kA==
X-Gm-Message-State: AOJu0Yx7nl30v91+ApUF/01MSFRuoRJYfKTKAt/CouOtwqK/2ImRU/we
 hg7cjeWL779Ln363Jf+IpLh/avSiLKCz3njvYW+KUg==
X-Google-Smtp-Source: AGHT+IEKck/9En6qsHVB54sDpzMM73b1oRZYsWx729GIIXlTON0x0HBjaOLvUIkIGvfVkWcMtEOSxQ==
X-Received: by 2002:a17:907:36c5:b0:9e7:c1cd:a4dc with SMTP id
 bj5-20020a17090736c500b009e7c1cda4dcmr14855831ejc.6.1700241095333; 
 Fri, 17 Nov 2023 09:11:35 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 c5-20020a170906694500b009e6624afecbsm978277ejs.63.2023.11.17.09.11.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Nov 2023 09:11:34 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4078fe6a063so72575e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 09:11:33 -0800 (PST)
X-Received: by 2002:a1c:7504:0:b0:404:74f8:f47c with SMTP id
 o4-20020a1c7504000000b0040474f8f47cmr7198wmc.5.1700241093083; Fri, 17 Nov
 2023 09:11:33 -0800 (PST)
MIME-Version: 1.0
References: <20231117032500.2923624-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20231117032500.2923624-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Nov 2023 09:11:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WAPAhMfK5jgkMS=m3grxaUtrDoZnQs3rmbLpLX84+j1w@mail.gmail.com>
Message-ID: <CAD=FV=WAPAhMfK5jgkMS=m3grxaUtrDoZnQs3rmbLpLX84+j1w@mail.gmail.com>
Subject: Re: [PATCH V2] drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
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

On Thu, Nov 16, 2023 at 7:25=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The refresh reported by modetest is 60.46Hz, and the actual measurement
> is 60.01Hz, which is outside the expected tolerance.

Presumably you've swapped the numbers above? The value reported by
modetest is 60.01Hz and the actual measurement is 60.46Hz?

> Adjust hporch and
> pixel clock to fix it. After repair, modetest and actual measurement were
> all 60.01Hz.
>
> Modetest refresh =3D Pixel CLK/ htotal* vtotal, but measurement frame rat=
e
> is HS->LP cycle time(Vblanking). Measured frame rate is not only affected
> by Htotal/Vtotal/pixel clock, also affecte by Lane-num/PixelBit/LineTime

s/affecte/affected

For me, the important part would be to explain the reason for the
difference. I assume that the DSI controller could not make the mode
that we requested exactly (presumably it's PLL couldn't generate the
exact pixel clock?). This new mode was picked to be achievable by the
DSI controller on the system that the panel is used on.


> /DSI CLK. If you use a different SOC platform mipi controller, you may
> need to readjust these parameters. Now this panel looks like it's only us=
ed
> by me on the MTK platform, so let's change this set of parameters.
>
> Fixes: 1bc2ef065f13 ("drm/panel: Support for Starry-himax83102-j02 TDDI M=
IPI-DSI panel")
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
> Chage since V1:
>
> - Update commit message.
>
> V1: https://lore.kernel.org/all/20231110094553.2361842-1-yangcong5@huaqin=
.corp-partner.google.com
> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

As per discussion in V1, I'm OK with this.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll probably give it at least another week before applying in case
anyone else wants to speak up. It would be nice if you could send a V3
with a few more touchups to the commit message, especially since the
60.01 and 60.46 numbers were backward (unless I'm mistaken).


-Doug
