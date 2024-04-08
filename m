Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 969A689BB4B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4617B11232A;
	Mon,  8 Apr 2024 09:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ng+noZhq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7CF11232A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 09:12:13 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-690bd329df2so20408416d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 02:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712567532; x=1713172332;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BQ7k7b7gOG5IXFP+GFgEExqu4kGvcRryxWmlkgqGSi4=;
 b=ng+noZhqL7w1hHb5aMmTDSjgdjIv4HheqGcoVLH7YOB8kjnlG9k7hmKl9HYutnmp8l
 ShjWkkt76HW+CMxfYtARSJEdhKNtWO0Bq4NL2OxlYsi92QdoGRy2g0qcSfnPsL1ilGid
 ZVlW6MwcUfWKu6v3FgJLctsdYNQBmZwem/42M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712567532; x=1713172332;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BQ7k7b7gOG5IXFP+GFgEExqu4kGvcRryxWmlkgqGSi4=;
 b=CKxRAYo/ZffVwYdKj4unmqXpsDgYWq1ao4i5MbeYG8ZHM6EN91ZbUljDEt+GnkQIV0
 8u1r5MiGAdpI3fkzU74PQsDGI94q60TShZt0UOyNVH4lQI8QJT1vm7J8KTZURpbDEd7w
 wGG339BJkGmEj6CB/bGKkNakLYbnE+JnjQmQpYQ2lmQYexE4hH4xonHBI8HlzeRqoi4M
 m1F+JVHtO+lsJaRzVe95FSmXM5cRcSvzgv8jnrkcg2rQxC3dVyFToOrLI0tYM9r0xoxr
 2+zJfmpCw2FZMpZLpC7o4CA9HIZNPRO2RW7je1z6arI9KbCWgUgkUWxF6FSvtmHKfFoi
 9QEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYVk7XOk8J9y+LGunLDk3THycrr5U/Cc1xkrA3apebHTKfK0hWK6uXRXao/TWiV9mCqq3HmnChEbveTRo0UgbtGB/0x1UrISuxyZrVhbwV
X-Gm-Message-State: AOJu0YzTDwnqymoyBzzREyUEzxRbgOgX+TgFunQSjO3sV/4rxQMczf6t
 RiRC/2jjajPj7OeIUdZkpTdqPx7QK+/JlVWZwg4LX3r3dLFRjEOLzYYHRqAhE+HTXgx34Pb3ioT
 n8w==
X-Google-Smtp-Source: AGHT+IGqdQmJA/CKfdaO3gjJvfR8KpTplj3hLlFskD3z25iJlq2L1Wz8D4u5q0Il4FvuSdFyk558Qg==
X-Received: by 2002:a05:6214:400e:b0:699:3883:5474 with SMTP id
 kd14-20020a056214400e00b0069938835474mr9829239qvb.33.1712567531877; 
 Mon, 08 Apr 2024 02:12:11 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 dd17-20020ad45811000000b0069b1e63a79esm616051qvb.61.2024.04.08.02.12.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 02:12:10 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4348110e888so219621cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 02:12:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWTao1twvC51M7BUm/0wDsDEJ9DKse/9aVMT2oAo2tyXNOIWf1TR0euTxx0iXn+U7GFHj02f5XHFDwvcbx89tfdG8Hq7hxLli60dJ0vxAEi
X-Received: by 2002:a05:622a:6085:b0:431:5aa3:313f with SMTP id
 hf5-20020a05622a608500b004315aa3313fmr266078qtb.11.1712567529634; Mon, 08 Apr
 2024 02:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240327085250.3427496-1-wenst@chromium.org>
 <171156080808.3681700.13600868771478432605.robh@kernel.org>
In-Reply-To: <171156080808.3681700.13600868771478432605.robh@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Apr 2024 02:11:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XqHwS9csZaY7fa1p55gFPBbdq7tcf6exjp+qjLGb32RQ@mail.gmail.com>
Message-ID: <CAD=FV=XqHwS9csZaY7fa1p55gFPBbdq7tcf6exjp+qjLGb32RQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: bridge: it6505: Add
 #sound-dai-cells
To: Rob Herring <robh@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Robert Foss <rfoss@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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

On Wed, Mar 27, 2024 at 10:33=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
>
> On Wed, 27 Mar 2024 16:52:48 +0800, Chen-Yu Tsai wrote:
> > The ITE IT6505 display bridge can take one I2S input and transmit it
> > over the DisplayPort link.
> >
> > Add #sound-dai-cells (=3D 0) to the binding for it.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1 [1]:
> > - Reference /schemas/sound/dai-common.yaml
> > - Change "additionalProperties: false" to "unevaluatedProperties: false=
"
> >
> > The driver side changes [2] are still being worked on.
> >
> > [1] https://lore.kernel.org/dri-devel/20240126073511.2708574-1-wenst@ch=
romium.org/
> > [2] https://lore.kernel.org/linux-arm-kernel/20230730180803.22570-4-jia=
xin.yu@mediatek.com/
> > ---
> >  .../devicetree/bindings/display/bridge/ite,it6505.yaml    | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Pushed to drm-misc-next:

325af1bef5b9 dt-bindings: display: bridge: it6505: Add #sound-dai-cells
