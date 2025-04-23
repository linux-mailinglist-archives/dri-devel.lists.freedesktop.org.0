Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85181A998A1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 21:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F9910E23F;
	Wed, 23 Apr 2025 19:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CIrdxZCO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AF610E23F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 19:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745436932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FATaLF00yydNEgdc6HTsvoSO0T2k174Kjhtrl2el9HU=;
 b=CIrdxZCOlW3rxQ96zdUi/PZ4mecqwQzFmfSCsC3kPg+w5uSz4RUiVle68tJ5her/hCkWwW
 7wkwS1Q6UEAumbrC80t2h06uR9jJ8qLGeuX3Cy2Uts3NF4cURZOje2WEIIAjIGmLz4hPfG
 39agiJHY+CuHfznqSlgwAxNGfCi3WsM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-btUVvkzeMvShmILCe7R3jg-1; Wed, 23 Apr 2025 15:35:31 -0400
X-MC-Unique: btUVvkzeMvShmILCe7R3jg-1
X-Mimecast-MFC-AGG-ID: btUVvkzeMvShmILCe7R3jg_1745436930
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43947a0919aso1241035e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 12:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745436930; x=1746041730;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mHwM84CGYO+3jNCMTmmYeka00nVSY0LWa8c5ny3yQ7I=;
 b=ZJoBCk/JkqiWqSyLrdcdNrL0/obbvleiGGWfJg2/LgCtbBInqH6Slfa5NeyHKv08ny
 9J/DO7nqs5qXmpUivwQy++vXHSGP4l2ZiNxGbg3Y/U3DcF7Br6dEDy9h6CBbsr/CaZjw
 EuOcu3atQwMuJaPe4AFtBJwM7NGCgYHEvRog5zmkNFP7lvcrhW3rf09Yb0xuKXSfWkv1
 z81Lw/Pta0dPSbNgQ+z4QXdU5LIXDCXDN8l/7/gGJp1IkaRagIqBXX/5DEQJzR4YrQev
 qBIf3rBk1WlHr0A0gVSx+GW7QhjwWOMlxL8cXgYheDX0Es0qF8ONtwPMQtPtjmhB1MkB
 qFog==
X-Gm-Message-State: AOJu0Yz0kE7sOuTaOg4ibRqS+c8YckyIHmt9qkU2UMwQuU0MIQl529Mu
 HBwRqNC7dLlA1sCy+HNTo6CwSw4u/MCWOnnN2/AXl0OSbrg5dA1l69v7KFxh+lur7zFqNgKj5Gj
 mYaRYwCETt5U5ML4nP1GE2Neozs33B9zN4LuRIRuNA53TsZ3lvlna3GQ2GeCYb76Oaw==
X-Gm-Gg: ASbGncs0BBF1NqnqaurVtp/1OkohDf3nlZnjeDQxTpQ8XO4CzbWoHAUPBZ0UikBlAYB
 /UmRBRlqcnmaT7OJ71AHc0c0ANx+k+FutM0usEwn8SrzNr/zvs3m+iy3CnQDuie0ABFueHFpRDb
 XoHi9JsqvlClWkvNnAFwXTT7TgzGVKXXFE3iveZuMircQDlL0fjAVtC1oAEbfgnUPyJdbhZS841
 NaCypWc6K3QlzTR0xMNf7K/aLUg4YNNa4so51eGBbZ+yyEMHdAGGG5uXgifSkw5XxVp8fQBJvFy
 Ex5R4isZYdwEUS29u1VN+tc3NgMMambePa+ES2iwpoZbpJtU8VGFxA2qXAAslVIeEomtsg==
X-Received: by 2002:a05:600c:384b:b0:43d:b85:1831 with SMTP id
 5b1f17b1804b1-4406aa872edmr213880905e9.0.1745436930110; 
 Wed, 23 Apr 2025 12:35:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3o9b9voFidMYGql7TPjF6NJBpEq4Fi6/itjQOx6j+R+KZEPRTl/Eo2lQx2cIZP+I8qEWd0Q==
X-Received: by 2002:a05:600c:384b:b0:43d:b85:1831 with SMTP id
 5b1f17b1804b1-4406aa872edmr213880635e9.0.1745436929653; 
 Wed, 23 Apr 2025 12:35:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa433191sm20045996f8f.31.2025.04.23.12.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 12:35:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v6 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <20250423-st7571-v6-2-e9519e3c4ec4@gmail.com>
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
 <20250423-st7571-v6-2-e9519e3c4ec4@gmail.com>
Date: Wed, 23 Apr 2025 21:35:28 +0200
Message-ID: <87y0vqacxr.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pxtaTew8Y8t21gEemvZVnC8SPiCe54pO_YfjCtKtgqk_1745436930
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

> Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> The controller has a SPI, I2C and 8bit parallel interface, this
> driver is for the I2C interface only.
>
> Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

[...]

> +
> +static void st7571_reset(struct st7571_device *st7571)
> +{
> +=09gpiod_set_value_cansleep(st7571->reset, 1);
> +=09fdelay(20);

There's no fdelay() and this leads to a build failure now:

make -j16 M=3Ddrivers/gpu/drm/tiny/
...
  CC [M]  st7571-i2c.o
st7571-i2c.c: In function =E2=80=98st7571_reset=E2=80=99:
st7571-i2c.c:815:9: error: implicit declaration of function =E2=80=98fdelay=
=E2=80=99; did you mean =E2=80=98ndelay=E2=80=99? [-Wimplicit-function-decl=
aration]
  815 |         fdelay(20);
      |         ^~~~~~
      |         ndelay


but I think you meant fsleep() here (which makes sense to me), so I will ap=
ply
the following fixup to this patch before pushing it:

diff --git a/drivers/gpu/drm/tiny/st7571-i2c.c b/drivers/gpu/drm/tiny/st757=
1-i2c.c
index ba089a7e2b61..dc410ec41baf 100644
--- a/drivers/gpu/drm/tiny/st7571-i2c.c
+++ b/drivers/gpu/drm/tiny/st7571-i2c.c
@@ -812,7 +812,7 @@ static int st7571_parse_dt(struct st7571_device *st7571=
)
 static void st7571_reset(struct st7571_device *st7571)
 {
        gpiod_set_value_cansleep(st7571->reset, 1);
-       fdelay(20);
+       fsleep(20);
        gpiod_set_value_cansleep(st7571->reset, 0);
 }

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

