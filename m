Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36418BA74B
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 08:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CC210ED87;
	Fri,  3 May 2024 06:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="AUPTouY1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEFD10ED87
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 06:58:56 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a599a298990so17669266b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 23:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714719534; x=1715324334;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXjaL+il8Ez+7d6ytrKawnux38fevS26j1EU1z2Rw38=;
 b=AUPTouY1RxW81Ly+DMwcsCQOCdKGEsvsPOXsOfzvjWORKmWHldqfJP0uqXV+q4mmE2
 Miw2Z2C6UqNXdGqb9WOCQa9xnhJkrUFeBjdJzBr6xAsJDvaBz9XN2zf+EOSTSq/rnKCF
 ocMFygNqR9CP7KuYiyanKzri3Mlg2sfaeyXoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714719534; x=1715324334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXjaL+il8Ez+7d6ytrKawnux38fevS26j1EU1z2Rw38=;
 b=iFQD8GU/q4qaKy7AJgPZvYc6PkI/SbOasuHdGqQsG6M+fA6Avu675ph+jrF00XqAJH
 oAgc2l0/S4kvCZ51IZFdshNUd1Jk/cEES6g6/jOTCUBbtuqgELGtPUZQxxelJNBQG7EU
 BV5EJrynKhzRcFMgIsezYMQW0uXEyIPptVgf7ePX2G6reSqNwVvkGrwuH+eJEYZoSazs
 BxsJng5dswvUsVFttYJly4X1lUdyRyKgXSbZSmfLHINNgZ3KXJzdRPhbR81obYPyOmEA
 94W6JtPHmM/EdfuG3P9r9iR2u5IE9+6U1k7kWaIxYDptcTqTiI4gFpYbOcUU8w/V2gB2
 XZyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWZ7A9Qa3UT1Sn2riaZ55qXEJcldcbysHR2D/TVUmRVfXzHDhiJ3a6y8BCjPGbw3k8kYhsUxaFgNwJnxzQNzYb0Aig9mPlmxZBz+nAawUA
X-Gm-Message-State: AOJu0Ywgic1MxVg+6NN078lRFSTNFcQr0bcGV5EGucj9OPkVZQdolLM9
 XdskirHjX4tjfxvScg3+d8lPws5DYwXQY76NaFMSvOFI5cvzPUPQweqMRBTw3LxZIaC5BGqJGuh
 GFQ==
X-Google-Smtp-Source: AGHT+IEcGGfwsfhxCuQO46V533/3ImD6K2G4oR1Tj+ac8O8Jadc0vUHxMR5BKJDd8fiZIChgxxV+eQ==
X-Received: by 2002:a50:bb42:0:b0:570:3b4:53ff with SMTP id
 y60-20020a50bb42000000b0057003b453ffmr960153ede.6.1714719533836; 
 Thu, 02 May 2024 23:58:53 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 h25-20020a0564020e9900b00572cfb37bd6sm543948eda.8.2024.05.02.23.58.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 23:58:53 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a58eb9a42d9so920232766b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 23:58:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUUeVChcDlqo8ndSCZjunO+QYwc0Uc+i6lUH2yrRdA5wQDSqQ0Y6rCFjo1dk4N3/AMmrFGglVa0BABbrbQOCCpdSIt1ZlGsCHXC1hqJWotp
X-Received: by 2002:a17:906:dc04:b0:a52:2d83:1483 with SMTP id
 yy4-20020a170906dc0400b00a522d831483mr990970ejb.53.1714719532753; Thu, 02 May
 2024 23:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240502-anx-tdm-v1-0-894a9f634f44@chromium.org>
 <20240502-anx-tdm-v1-1-894a9f634f44@chromium.org>
 <20240502-sheath-share-eac9afc24da9@spud>
In-Reply-To: <20240502-sheath-share-eac9afc24da9@spud>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 3 May 2024 14:58:16 +0800
X-Gmail-Original-Message-ID: <CAHc4DN+mCbBuB3D9kB2x8HYj9iaX7t6Q4Qjj7hotH3u=eAHJSg@mail.gmail.com>
Message-ID: <CAHc4DN+mCbBuB3D9kB2x8HYj9iaX7t6Q4Qjj7hotH3u=eAHJSg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: anx7625: Add a perporty to
 change TDM setting
To: Conor Dooley <conor@kernel.org>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, May 2, 2024 at 10:47=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, May 02, 2024 at 09:03:31AM +0000, Hsin-Te Yuan wrote:
> > Add a perporty to indicate whether anx7625 should shift the first audio
> > data bit. The default TDM setting is to shift the first audio data bit.
> >
> > Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> > ---
> >  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml          =
| 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,=
anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,an=
x7625.yaml
> > index a1ed1004651b9..915d5d54a2160 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625=
.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625=
.yaml
> > @@ -82,6 +82,10 @@ properties:
> >      type: boolean
> >      description: let the driver enable audio HDMI codec function or no=
t.
> >
> > +  no-shift-audio-data:
> > +    type: boolean
> > +    description: Disable the first audio data bit shift in the TDM set=
tings.
>
> This just looks like software policy, since there's no mention in the
> commit message or description as to what property of the hardware causes
> this to be required. Can you please explain why this property is needed?
>
> You're also missing a vendor prefix.
>
> Thanks,
> Conor.
>
> > +
> >    aux-bus:
> >      $ref: /schemas/display/dp-aux-bus.yaml#
> >
> >
> > --
> > 2.45.0.rc1.225.g2a3ae87e7f-goog
> >

Sorry, I found this feature in the datasheet originally, but after
deeper investigation, it seems that this feature should be used to
support i2s dsp mode b instead of being used this way. Note that the
difference between i2s dsp mode a and b is whether or not to shift the
audio data by 1 clock cycle.

Regards,
Hsin-Te
