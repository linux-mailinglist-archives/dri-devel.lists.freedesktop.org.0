Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 908B77E061B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 17:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380CB10EA24;
	Fri,  3 Nov 2023 16:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B487D10EA25
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 16:03:13 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9d267605ceeso330001866b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 09:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699027389; x=1699632189;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ihGdFd0nqrzmFvEDZxhHQ2+8zpelaN2AcwyF1dKV48M=;
 b=mePme2KvQVOfRutQiNeMQgDN3U8q+8lS+A0UdKN/1GoVP5fyTU74gFnY0/0yQGL9ws
 hCpUXiz09M5QHbyerWwKwZvqnU3dY809Iwvib//IeYSG0C2uo/QrgyC8cCgMg9K0TVOb
 hRUGsSBwssTcYWjAH7O/+AUTJZS6Eek0oUAns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699027389; x=1699632189;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ihGdFd0nqrzmFvEDZxhHQ2+8zpelaN2AcwyF1dKV48M=;
 b=BMK3K+NmYSPJBCm05bCtOzih2cIRa/8FrStGIxwJGDYlyp3HEczRjQ9T9ggR+2QrBN
 4NGn5xdbi7Gxpj/pRMvAmnx6U1oKZqYrhROQ2i+x1mxmKadK23VnpHwZ9PEXeprshXW1
 IVwKqI/2z4GOnTY4B4VrxyEU7IglHDg4I09ch5ChmgOYqdPtHQerocYBHhpnavaKcrrS
 pJn3FJpZf+nfM6jZF7r0BXvbfeoHahDiH7oKIAjXohUjFrCB0IJrt8v035uw8K5v3S9B
 O/gOPDhw/tp+G8jtJUdjyKjsF8/SBsaI8pawkMvdcdSpN0NdTRokHytxbYss3vvWDNYp
 iiBA==
X-Gm-Message-State: AOJu0YwR7SYUEMYYa3q8B3IuLTHSpMXZeDlq9Bs84I30y6CMeioEmnaW
 UcAT0Rb1/0Kd3TZMdwJioGUs0uJsndnxP0crNngtEfz5
X-Google-Smtp-Source: AGHT+IGQMSBtci4Q6Aw/qWXCfVujhRy0O1SQ9UveC4dscX+yVTVTVwVvCfkR0NBft/35ktRnm+6e6Q==
X-Received: by 2002:a17:907:96a5:b0:9c7:5a01:ffe7 with SMTP id
 hd37-20020a17090796a500b009c75a01ffe7mr7101964ejc.12.1699027389604; 
 Fri, 03 Nov 2023 09:03:09 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 dc25-20020a170906c7d900b009cc6323fe5asm1044455ejb.134.2023.11.03.09.03.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Nov 2023 09:03:08 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-54366bb1c02so11883a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 09:03:08 -0700 (PDT)
X-Received: by 2002:a05:6402:254b:b0:543:faac:e135 with SMTP id
 l11-20020a056402254b00b00543faace135mr229008edb.3.1699027387964; Fri, 03 Nov
 2023 09:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231102221309.1971910-1-hsinyi@chromium.org>
 <20231102221309.1971910-5-hsinyi@chromium.org>
In-Reply-To: <20231102221309.1971910-5-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 3 Nov 2023 09:02:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XEnk1TuWsJB6W5PGisg3_0A3HZMGpxEUrtcDxXK=Z+Eg@mail.gmail.com>
Message-ID: <CAD=FV=XEnk1TuWsJB6W5PGisg3_0A3HZMGpxEUrtcDxXK=Z+Eg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/panel-edp: Choose correct preferred mode
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 2, 2023 at 3:13=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> w=
rote:
>
> If a non generic edp-panel is under aux-bus, the mode read from edid woul=
d
> still be selected as preferred and results in multiple preferred modes,
> which is ambiguous.
>
> If a hard-coded mode is present, unset the preferred bit of the modes rea=
d
> from edid.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v1->v2: split patches from drm_modes.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Do you think this should have a "Fixes?" As per discussion on V1 [1],
this has probably been a bit broken from the beginning, though I guess
it only became a big deal after the AUX bus made it so that the panel
driver commonly had the EDID...

[1] https://lore.kernel.org/r/CAD=3DFV=3DWHzCdiYumsxUm_am+ALqq9SOOrjf=3DJYH=
qJuiKFB+Dnsw@mail.gmail.com
