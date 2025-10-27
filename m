Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB11C0CF68
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 11:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAE110E437;
	Mon, 27 Oct 2025 10:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ch2ZIpl9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5847F10E437
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:30:40 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id
 a640c23a62f3a-b3e7cc84b82so645562566b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 03:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761561039; x=1762165839; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r+t/oTmZjxhzW3SWsg5D/3k7ryEIEHaxHipwLWpbI60=;
 b=ch2ZIpl9IUV33N2/Fht1FWnIj9eV281fMTd4kUJaIaCWXrDTjwEmdaz1xhCIMdM+Bx
 MrpCefAIbcywsL6SetPEzc2nG17cgEo+l57IwRwY3DVPKIxjKJ2lf1ZEcZuvIlx+1NPF
 biwc6m4oMXeYrSky8H19w6e3LooSZkSw2Lll5tfZE1gy//qJ3sYcligc494sn6/dATKR
 i9SjSV6qdxak8/A1r5ksxiRb+ulkXvVeumbjrkRTCvJXg2ctw0SjJuy+rr/0QofaHpJq
 wT6qVRhuJJxmoUcySnZArPidKmzBa3vMAzS4p8cAdcOZncs4pikWN32Mjlx/X/94jxUo
 0fAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761561039; x=1762165839;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r+t/oTmZjxhzW3SWsg5D/3k7ryEIEHaxHipwLWpbI60=;
 b=k0QQ72np+7ZXTTTfeeO2dKz4NHcrofzBIA1bpNyM1+6Z1c26z/b3MnYePm2FLYQSqZ
 2HQMWnYJ98NMYlOYKt1HpRzfYwWkWHGPNEIu1UCLN12iVoqzBz7YFyYGLQfOQmVXOMh2
 zE/mopXuqqyv5P0QSwfzG0LBqR4KsMYQttog2Dbhm/9u7kh5cK+8LKlyzOPxAgPkn2gl
 LmuWqnTY7pF8BXOHas3bPKujdH7LW1+n6997nkl2eT6bx+hcnaPdvXUE/q7xt+8NIcB7
 RHewZ2Opa2bCMeV7hYhSIh4jyVN/LrnAovUiTToRwmHtlx1uWIaKItm1u64vy+PPoP/X
 1dzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPaG+FwbFK/BM7TYfyJ5cnrfMDTR6xkG0Pj1nG/OUGFlwdnQFDHflt1v80mShK5zIWG2fIoggvNFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyl4Q94ZW9dvaz3/mbqBUDT4fSEQn0nIeBO6Wo4zWHHuduHdZxm
 ZcLOLuydMrFJ4BTdleLloBpZ2pgQn1ujIc+Xn8bMctxzApAqXKLiSCwmWmEHGqPVr3LPuDO/nK5
 58qjWyft3IVHd9y8UWk8cdkqO5xdkubs=
X-Gm-Gg: ASbGncuCFV6mSy1tV/lvJUOjWdFMundMfLnxX0rhVCS45/ddzBKWPy4FH7+vasd6Cda
 Srlm7pI3yP31Cdf+pkmAzfH2Xmdj6jgZLgLmTUCEaJnjs2TEmBgfhYW0N8pSvqOv1NShxYlGhky
 5+0gDAphhiI3hSOaFaZBPx5Z3NiXOnaVX+KRNte4R27ldD9cwBoP9/nV3KKnrOFgXywKYbYM9tq
 21Ycw2dOzEutsUSKx7fvw4z7jqg3QUhch9sGpRTc32/fAxkAZktkfN8UUPSLcksXGrvb3c=
X-Google-Smtp-Source: AGHT+IHLxFJ3SPEDNoyMay98zhNlSRUKkyfFmuSirmfTIVuYNM52PHBBa3Zie8g2ZOnRY/ZMCMowauQRHmA5eHcm2CY=
X-Received: by 2002:a17:907:9448:b0:b04:626e:f43d with SMTP id
 a640c23a62f3a-b64751284f6mr3751346266b.47.1761561038573; Mon, 27 Oct 2025
 03:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20251026123923.1531727-1-caojunjie650@gmail.com>
 <20251026123923.1531727-2-caojunjie650@gmail.com>
 <c17c10d4-cc1f-46fd-8719-e7bb9ffa91ba@kernel.org>
 <CAK6c68gqHMR-FpH3MY9E_9R+V0J75V9zOii=x81e+bRcnBYOig@mail.gmail.com>
 <c32970a8-c1d1-4130-839b-981bca5373f3@kernel.org>
In-Reply-To: <c32970a8-c1d1-4130-839b-981bca5373f3@kernel.org>
From: Junjie Cao <caojunjie650@gmail.com>
Date: Mon, 27 Oct 2025 18:29:01 +0800
X-Gm-Features: AWmQ_bmSyDTyEE0NzC1P6-5KqVAikLVF9X2J_Ed-gcKZn6A6nKVOVFcs4LVP9Cc
Message-ID: <CAK6c68iV2qUFEp_ujWwKYFmgt261rvQNK8Jo5Wjt-dCRbG_BVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: Add Awinic AW99706
 backlight
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org
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

On Mon, Oct 27, 2025 at 4:38=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/10/2025 07:58, Junjie Cao wrote:
> > On Sun, Oct 26, 2025 at 9:48=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 26/10/2025 13:39, Junjie Cao wrote:
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  enable-gpios:
> >>> +    description: GPIO to use to enable/disable the backlight (HWEN p=
in).
> >>> +    maxItems: 1
> >>> +
> >>> +  awinic,dim-mode:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: >
> >>> +      Select dimming mode of the device.
> >>> +        0 =3D Bypass mode.
> >>> +        1 =3D DC mode.
> >>> +        2 =3D MIX mode.
> >>> +        3 =3D MIX-26k.
> >>> +    enum: [0, 1, 2, 3]
> >>> +    default: 1
> >>> +
> >>> +  awinic,sw-freq:
> >>
> >> Please use proper units, see:
> >> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas=
/property-units.yaml
> >> and other examples
> >>
> >> Same everywhere else.
> >>
> >
> > ACK
> >
> >>
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Boost switching frequency in kHz.
> >>> +    enum: [300, 400, 500, 600, 660, 750, 850, 1000, 1200, 1330, 1500=
, 1700]
> >>> +    default: 750
> >>> +
> >>> +  awinic,sw-ilmt:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Switching current limitation in mA.
> >>> +    enum: [1500, 2000, 2500, 3000]
> >>> +    default: 3000
> >>> +
> >>> +  awinic,iled-max:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Maximum LED current setting in uA.
> >>> +    minimum: 5000
> >>> +    maximum: 50000
> >>> +    multipleOf: 500
> >>> +    default: 20000
> >>> +
> >>> +  awinic,uvlo-thres:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: UVLO(Under Voltage Lock Out) in mV.
> >>> +    enum: [2200, 5000]
> >>> +    default: 2200
> >>> +
> >>> +  awinic,fade-time:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Fade In/Out Time(per step) in us.
> >>> +    enum: [8, 16, 32, 64, 128, 256, 512, 1024]
> >>
> >> Why would this be fixed setting? This really looks like runtime, drop.
> >>
> >
> > Yes, it is fixed. I am quoting this from the datasheet.
>
> Fixed per board.
>
>
> > AW99706B provides Fade in/out mode to transform backlight from one brig=
htness
> > to another or turn on/off backlight with a fixed slope. Writing 0b00 in=
to
> > RAMP_CTR (CFG 0x06) to enter Fade in/out mode, and the the slope of cur=
rent
> > transition can be set in FADE_TIME (CFG 0x06).
> >
> >>> +    default: 16
> >>> +
> >>> +  awinic,slope-time:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Slope time in ms.
> >>
> >> Slope of what?
> >>
> >
> > Ramp time in slope mode, it is retained from downstream drivers, it wil=
l
> > be more clear in the next version.
> >
> >>> +    enum: [8, 24, 48, 96, 200, 300, 400, 500]
> >>> +    default: 300
> >>> +
> >>> +  awinic,ramp-ctl:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: >
> >>> +      Select ramp control and filter of the device.
> >>> +        0 =3D Fade in/fade out.
> >>> +        1 =3D Light filter.
> >>> +        2 =3D Medium filter.
> >>> +        3 =3D Heavy filter.
> >>> +    enum: [0, 1, 2, 3]
> >>> +    default: 2
> >>> +
> >>> +  awinic,brt-mode:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: >
> >>> +      Select brightness control of the device.
> >>> +        0 =3D PWM.
> >>> +        1 =3D IIC.
> >>> +        2 =3D IIC x PWM.
> >>> +        3 =3D IIC x PWM(P-ramp).
> >>> +    enum: [0, 1, 2, 3]
> >>> +    default: 1
> >>> +
> >>> +  awinic,onoff-time:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Turn on/off time(per step) in ns.
> >>> +    enum: [250, 500, 1000, 2000, 4000, 8000, 16000]
> >>
> >> Not a DT property.
> >>
> >
> > It is mandatory in the downstream driver, I keep it.
>
> Huh? I don't care about downstream driver. Again, not a DT property. You
> cannot add here runtime properties and when, we tell you that, you just
> ignore our review.
>
> NAK
>

My apologies for the misunderstanding and my poorly worded previous
comment. I absolutely did not intend to ignore your review.

I mentioned the "downstream driver" only to explain why I had originally
included the property.

I now understand your point clearly. I will remove them in the next
version.

Thanks for your fast reviews and for clarifying this principle for me.

>
> >
> > The following is the description about it,
> >
> > If the value in ONOFF_CTR(CFG 0x08 [4:3]) is 0b00, the turning on/off r=
amp of
> > AW99706B is soft start and fast end. In this mode, the ramp time can be
> > programmed by ONOFF_TIME (CFG 0x08 [2:0]).
> >
> >>> +    default: 2000
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - enable-gpios
> >>> +
> >>> +unevaluatedProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    #include <dt-bindings/gpio/gpio.h>
> >>> +
> >>> +    i2c {
> >>> +        #address-cells =3D <1>;
> >>> +        #size-cells =3D <0>;
> >>> +
> >>> +        aw99706@76 {
> >>> +            compatible =3D "awinic,aw99706";
> >>> +            reg =3D <0x76>;
> >>> +            enable-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> >>
> >> Where are other properties from common.yaml? Looks like you re-invente=
d
> >> some parts.
> >>
> >
> > Sorry, I forgot it, when writing the bindings, I used ktz8866.yaml as a
> > template. I  should have dropped the common.yaml. This driver does
> > not require other properties in common.yaml.
>
>
> I don't care about driver much, but anyway it should use common.yaml.
> Please read the feedback very carefully.
>

ACK

Regards,
Junjie
