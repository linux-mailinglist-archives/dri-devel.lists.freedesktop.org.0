Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730E68BB186
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 19:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496F611291A;
	Fri,  3 May 2024 17:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FcoqB+zP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC5C112918
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 17:13:04 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-572baf393ddso3811158a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714756383; x=1715361183;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bFDUxR30IPwZt3hzDUBu2ztG3pGTqmkwZJ0uw0kvNMs=;
 b=FcoqB+zPOvP6j3PppKxDHl85Q2p8ENayM5+FVyC8qOUozZ5pKK+9Sni9CYagcdsHTX
 sY5uhANFz+cgBE1u00ONidoqvaL+g0wTFgSIYHSUp4quErk4lRv5iMPoRq69yHPk5dN/
 s3PPp0h8leia9lIuc65Fbee+nIl68aSjW16FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714756383; x=1715361183;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bFDUxR30IPwZt3hzDUBu2ztG3pGTqmkwZJ0uw0kvNMs=;
 b=nVDnNq3a+xEiPRWFaqxJpIGLB+JV8LIMTjoc9TxZW2u2WDzWiM/r/Sb+4PzYhLqWZp
 TwzkhIvZCKGGWwmFZW/TJYKlj/4wQSofZXf1blKujoZCw/msdD/QZW4sEfsTIUdEnmzl
 yXFC7m7BGUK9Wj2Gvn0uUyHveybQof9nKn08v6I0paZjunFqpe7wa7adV6NB98Yfdxkj
 A/wdb8geEzQQR+ymM1Fdxm7NIsI3weujzzCYpu3va2fgpq+XFpVk7PlhUrDYvRTnHafv
 aercZH5bzQT3XT7PK8aTVfWptE/0IjCOScYo6UyoL1qvWkYb1DkSuu/nBZoSmGp2SGJ8
 KW7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbqPZ774HMLRB4MlQ+wW6jopJZcQAZmjlKQKKIqqTPOUuFrTFd0RnJC3EuphsAu2YLtdb34ak7xqKf09UqZAQNXg9Lf/JmwWcz6+nUaooe
X-Gm-Message-State: AOJu0YyTpQ6anPEYJ6Ejv+udsXXEN9n5FWvCfEDf+IKMoyB5jK1XuEiO
 eLXL7JcxDCNyCF0K3iXdrUZW8EzaZ1KspbO4nX4FkrlH7nVrY+rr2GJcDfEovsJzvXhZ7+nhLCF
 OXw==
X-Google-Smtp-Source: AGHT+IEDYMfG/rVoP1KF12aekY5lXMW2/34anCsYQklrI9dJ5MPMB4obZMKWR4hw/p0+K0iShH7jQQ==
X-Received: by 2002:a17:906:5591:b0:a55:b785:7b47 with SMTP id
 y17-20020a170906559100b00a55b7857b47mr3066583ejp.7.1714756382698; 
 Fri, 03 May 2024 10:13:02 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51]) by smtp.gmail.com with ESMTPSA id
 r6-20020a17090638c600b00a4e03823107sm1873266ejd.210.2024.05.03.10.13.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 10:13:02 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a5557e3ebcaso554497866b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 10:13:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXuDDLeh67DEjTPumiT28QPdy/if/ZX8JBFTIz0sLSNwLiuvbYcDLbEnacGgNiudkz9mbYK8ooDDxDoVEOUhMimjsAjnJs+Qy74zes2Bk72
X-Received: by 2002:a17:906:bcda:b0:a58:7172:1ab0 with SMTP id
 lw26-20020a170906bcda00b00a5871721ab0mr2748595ejb.16.1714756382125; Fri, 03
 May 2024 10:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240502-anx-tdm-v1-0-894a9f634f44@chromium.org>
 <20240502-anx-tdm-v1-1-894a9f634f44@chromium.org>
 <20240502-sheath-share-eac9afc24da9@spud>
 <CAHc4DN+mCbBuB3D9kB2x8HYj9iaX7t6Q4Qjj7hotH3u=eAHJSg@mail.gmail.com>
 <20240503-footrest-gladly-c0ed7d92d816@spud>
In-Reply-To: <20240503-footrest-gladly-c0ed7d92d816@spud>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Sat, 4 May 2024 01:12:25 +0800
X-Gmail-Original-Message-ID: <CAHc4DNKL-eX8mOWGB+VN52eefMEccx69d6RSgXbw+9VBvN6V4Q@mail.gmail.com>
Message-ID: <CAHc4DNKL-eX8mOWGB+VN52eefMEccx69d6RSgXbw+9VBvN6V4Q@mail.gmail.com>
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

On Sat, May 4, 2024 at 12:45=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Fri, May 03, 2024 at 02:58:16PM +0800, Hsin-Te Yuan wrote:
> > On Thu, May 2, 2024 at 10:47=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Thu, May 02, 2024 at 09:03:31AM +0000, Hsin-Te Yuan wrote:
> > > > Add a perporty to indicate whether anx7625 should shift the first a=
udio
> > > > data bit. The default TDM setting is to shift the first audio data =
bit.
> > > >
> > > > Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> > > > ---
> > > >  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml      =
    | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/analo=
gix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogi=
x,anx7625.yaml
> > > > index a1ed1004651b9..915d5d54a2160 100644
> > > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx=
7625.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx=
7625.yaml
> > > > @@ -82,6 +82,10 @@ properties:
> > > >      type: boolean
> > > >      description: let the driver enable audio HDMI codec function o=
r not.
> > > >
> > > > +  no-shift-audio-data:
> > > > +    type: boolean
> > > > +    description: Disable the first audio data bit shift in the TDM=
 settings.
> > >
> > > This just looks like software policy, since there's no mention in the
> > > commit message or description as to what property of the hardware cau=
ses
> > > this to be required. Can you please explain why this property is need=
ed?
> > >
> > > You're also missing a vendor prefix.
> >
> > Sorry, I found this feature in the datasheet originally, but after
> > deeper investigation, it seems that this feature should be used to
> > support i2s dsp mode b instead of being used this way. Note that the
> > difference between i2s dsp mode a and b is whether or not to shift the
> > audio data by 1 clock cycle.
>
> Are you trying to say that this patch is not needed? I'm not really
> sure.

Yes!

Regards,
Hsin-Te
