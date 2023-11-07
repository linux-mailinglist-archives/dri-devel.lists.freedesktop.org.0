Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DED7E47A4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 18:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0ECD10E636;
	Tue,  7 Nov 2023 17:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3299F10E636
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 17:56:23 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5435336ab0bso10331726a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 09:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699379781; x=1699984581;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8StncZh/iw8rVTbFpbMeIoiTuJSwCnvKTl9QP94ClOw=;
 b=KEzitH3ZpA4XiDHpENtB6kjo30R16Yv0GtN356h/7FdbRl6X+WD9ReMSfGuRL5ILSz
 G3NNVrApiOFqhS670waK0l9TzIekm8PoAV10Taiq11BaH5M1ybzbyndxbieIjGSYyaYf
 CI+9hRgAI8JrnmfC3FxtI3ako4mG3euAI2pSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699379781; x=1699984581;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8StncZh/iw8rVTbFpbMeIoiTuJSwCnvKTl9QP94ClOw=;
 b=dwh1wfD7kmAkYY5e3pmV2SflNxP+U3ZWqWisxJuUpnNP8Im8iSLQ+HtUeLu8BEab1s
 /wVIPNeAr+pM5Xs2PNrqupt1+k7qMjpbelFTsZn2bPS0VGlHcumUKAZTuRrcuz//Aoiv
 7xhUvtFytOqPcQ92fw/F6x0e3+hz1nTzz5mwwgG5i+GvbL85ZeJ8BvGeJ5OjPjwkZpPR
 8trpQ6B/BYiaNpRDrbJxRS4Mp9iXbaoom2mwe8jmHNdTt6JDfQrV5zMIvvlMiejhNkt3
 8Mxgfbiwjj6fMHHXi1skn4fZidJA64y7Zjaqu5lUq9yFGyhpwmDsRdVasFLR/wgaQT2k
 Jr5w==
X-Gm-Message-State: AOJu0YyTFLA+gJdZyFlIl1Ra/PksR6IhQeIcn/Kv2ZxZtTn+VLN0eYHi
 hR9uag6BQ8GEyc/xV6pYZxEfZow2w5Jb1ymtPXa7GhDi
X-Google-Smtp-Source: AGHT+IEv9R73V1Trv+q/B46mX2iq4EwJwYGwj2/NFJvjVWXt0kAEKmDBxLMAlZwnGDPiocGg5zSc+w==
X-Received: by 2002:aa7:c2cb:0:b0:53d:fe98:fd48 with SMTP id
 m11-20020aa7c2cb000000b0053dfe98fd48mr26364198edp.3.1699379780910; 
 Tue, 07 Nov 2023 09:56:20 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 t26-20020a056402241a00b00543597cd190sm5618289eda.47.2023.11.07.09.56.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 09:56:20 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-53eeb28e8e5so319a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 09:56:20 -0800 (PST)
X-Received: by 2002:a50:d68b:0:b0:543:fb17:1a8 with SMTP id
 r11-20020a50d68b000000b00543fb1701a8mr120839edi.3.1699379780027; Tue, 07 Nov
 2023 09:56:20 -0800 (PST)
MIME-Version: 1.0
References: <20231107000023.2928195-1-hsinyi@chromium.org>
 <20231107000023.2928195-2-hsinyi@chromium.org>
In-Reply-To: <20231107000023.2928195-2-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Nov 2023 09:56:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XdVnFqbF9UZ-W1OWMVWSxk=CxP9WAb3q4rT7S+ryxXWA@mail.gmail.com>
Message-ID: <CAD=FV=XdVnFqbF9UZ-W1OWMVWSxk=CxP9WAb3q4rT7S+ryxXWA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] drm/panel-edp: drm/panel-edp: Fix AUO B116XTN02,
 B116XAK01 name and timing
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
 Jessica Zhang <quic_jesszhan@quicinc.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 6, 2023 at 4:00=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> w=
rote:
>
> According to decoding edid and datahseet:
> - Rename AUO 0x235c B116XTN02 to B116XTN02.3
> - Rename AUO 0x405c B116XAK01 to B116XAK01.0 and adjust the timing of
> auo_b116xak01: T3=3D200, T12=3D500, T7_max =3D 50.
>
> Fixes: 3db2420422a5 ("drm/panel-edp: Add AUO B116XTN02, BOE NT116WHM-N21,=
836X2, NV116WHM-N49 V8.0")
> Fixes: da458286a5e2 ("drm/panel: Add support for AUO B116XAK01 panel")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> v4->v5: separate fixes patch.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

I hate to be a hassle since I don't think this will have any
meaningful impact on anyone, but given that it's now split out as a
fix it should probably be split into two separate patches (one for
each fix). That will save time for anyone dealing with the stable
channel.

-Doug
