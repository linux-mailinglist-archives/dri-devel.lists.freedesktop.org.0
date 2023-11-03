Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9F27E0610
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 17:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7876D10EA2C;
	Fri,  3 Nov 2023 16:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C123110EA37
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 16:02:24 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c6b30acacdso30132511fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699027341; x=1699632141;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Ol6GV8EiIMu1rs0jqnxJjaaICGPgFzAznUYX0oUGW0=;
 b=TZEF2+iD/zwjzRbw/d/0PkELIdsf/AXqC1xNSF/LhAZEqt1PKYwUx0LgmVhAmqnTBv
 saz1PfCg3FM4JPL0tEp2xNSHBiAXScHnoWASXXAQk4gqrLKXF0wjbDCm6ckdjwKCfgGV
 8o8p6BwH1qqXgHFqp9wjc+PI6Wd7yTg/eH3Fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699027341; x=1699632141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Ol6GV8EiIMu1rs0jqnxJjaaICGPgFzAznUYX0oUGW0=;
 b=K3nQvJfoJnS8fdRLIHGfXdUBV7P2VQRXifLgFx6ZfPsrBEwq/LnOUl8bVXs/L8Gxlh
 W/fp46yX5DYSXQZZvlFHdZ6VEkYJ5l1V/+llnukeFAFt1dpCW1zoVfliEj9rZJ1QWB8b
 +OhYZ4FwD+btTTds5aFdUT57Kl2TsP7ru3AryyF1kfUoEaVG3YDvmc6+gCE3TLObmE7/
 a2/7ofkvBMOC4x9Tdl1hEeySa4CvS4yrEhuLWN53rmHVFaHjkVvATHdUgc+dl2yOIgKT
 nQRmM695M1eCQdjDpx6rC+CQAOrXwvCDVwkB8d8DnauFpcwFTxZvDZLedF51qYv399gR
 Gr5g==
X-Gm-Message-State: AOJu0YzFkeoYcB+aXnJolvQY2TC5ry08PionOHsCpZqXcgJu7t9KB7WN
 0vdzUHfW4cpF7f0Eeq6mqpnq08ku6b2l4D88/ZmGfEov
X-Google-Smtp-Source: AGHT+IFXbaY38mKjS/BcmB/oV/aVEHOPHuBlDthBOzgyIP7IT5Eb0MTB84tzQjHFvsRwq42ZpPEL+g==
X-Received: by 2002:a19:6d1b:0:b0:507:95ea:1e72 with SMTP id
 i27-20020a196d1b000000b0050795ea1e72mr14589702lfc.22.1699027340618; 
 Fri, 03 Nov 2023 09:02:20 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 e13-20020a50a68d000000b0052e1783ab25sm1117452edc.70.2023.11.03.09.02.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Nov 2023 09:02:20 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-53eeb28e8e5so12205a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 09:02:19 -0700 (PDT)
X-Received: by 2002:a50:d50f:0:b0:542:d737:dc7e with SMTP id
 u15-20020a50d50f000000b00542d737dc7emr242196edi.0.1699027339321; Fri, 03 Nov
 2023 09:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231102221309.1971910-1-hsinyi@chromium.org>
 <20231102221309.1971910-2-hsinyi@chromium.org>
In-Reply-To: <20231102221309.1971910-2-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 3 Nov 2023 09:02:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Unv+PtHd=QoFOgY_4tjxPGWeU7-hzp3YHfc2DjWu3wcQ@mail.gmail.com>
Message-ID: <CAD=FV=Unv+PtHd=QoFOgY_4tjxPGWeU7-hzp3YHfc2DjWu3wcQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/panel-edp: Add several AUO/BOE panels
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
> Add a few generic edp panels used by mt8186 chromebooks.
> Besides, modify the following panel:
> - AUO 0x235c B116XTN02 renamed to B116XTN02.3.
> - AUO 0x405c B116XAK01 adjust the timing of auo_b116xak01. According
> to the datasheet: T3=3D200, T12=3D500, T7_max =3D 50.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v1->v2: Address comments: update delay for auo_b116xak01, sort entries.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 57 +++++++++++++++++++++++++++++--
>  1 file changed, 55 insertions(+), 2 deletions(-)

This seems good to me now. I guess a tiny nit is that the ${SUBJECT}
mentions AUO/BOE panels but a few other model panels are also added,
but it's not a huge issue for me.

Normally I apply patches to this table near-instantly, but since it's
Friday and this touches a lot of panels, I'll probably wait until
sometime next week.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
