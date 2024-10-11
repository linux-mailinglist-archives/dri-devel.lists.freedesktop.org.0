Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B1599A628
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 16:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3D610EAF5;
	Fri, 11 Oct 2024 14:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Uu0glk68";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE32710EAF3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 14:20:29 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5398e4ae9efso2815582e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 07:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728656426; x=1729261226;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mvzCEOHylQFKpOsQ3b4jdnej7dL8ckuDevHyY8WxVL4=;
 b=Uu0glk68Z8Q33d20gQ+Y39mhd+34cASaB6/Ma21C+tHVe612zs9FQI6EQfFF4qc9sR
 7mZp5dwt/5wKhMHmLAKtmvEjnKcF0XtwklJTFf8Zzre4/VNbodm8tzXfA6BX44zjO4IY
 iU+LJFOosgB6nvzQ0hYNib+J5VFobvglOiAxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728656426; x=1729261226;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvzCEOHylQFKpOsQ3b4jdnej7dL8ckuDevHyY8WxVL4=;
 b=td0JUSrhD+1VLiL1hyQiRKJ/T6USxA89csIL/0QrP5/WXYjLGC5qiBSP9Nu/L3ZTvg
 T9u+GtOiakBl/4eaFWhXLsUkCEqMO+KX610wW3pcIhapjGZHjvDKWWH36AVMDPhHgDkk
 MOcgPjzrAYIR/hAWCb5WGcee5xxdR67c1PusGIZAf6LkpqnoekpI98lae3beFzKLjIdN
 XuRW5gwjsZENkbVN+QKTevBY639SpgBxK0hBL35kNNuXRrSF8NB/6hFHfX8aQT/gh7Mb
 8ibH6ncqgOjQhB6DjCNwZqXYn3zkF3YC6OOLjD0nTBXbaI2UJOog4UN+i9EhuRanNciW
 grVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgqHvp1vFWlAG0RhqqealSrWzL6KC21eK/DkZkfmUfu/6la7d7Wfve0XQZjTOxxcjZSgZc4MfTHi4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2wroW1FQM89cve2dPD8/tl34oSyRYRdFJwxqAvult7JfSyuRQ
 DJx+2laT1elvaFFRr4YZaBqIFMDPj2ILQU0mGZcqYfH//myWVjpzM3CdpTmnHOtGm2+b2swbFbL
 NMnux
X-Google-Smtp-Source: AGHT+IEKQ0DP4I31Vor1Ao96Ky+52QIDuY4aw5t3QK+ELb+ZLp5KAe/W9/jLhf6IklBo5Z929Xlp7A==
X-Received: by 2002:a05:6512:1089:b0:539:9457:e70 with SMTP id
 2adb3069b0e04-539da4cd088mr1843577e87.32.1728656425842; 
 Fri, 11 Oct 2024 07:20:25 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539d2fa66eesm344276e87.6.2024.10.11.07.20.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2024 07:20:25 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5398e4ae9efso2815493e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 07:20:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVCxfIykqJahpj2fyxg4x2SP0JAgVTwVTGGCSlyofFfOzJZs5BDZjGFzA2oGEInb8rV/QVfkucRTKM=@lists.freedesktop.org
X-Received: by 2002:a05:6512:2302:b0:52e:9b9e:a6cb with SMTP id
 2adb3069b0e04-539da3c649dmr1856067e87.15.1728656423759; Fri, 11 Oct 2024
 07:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20241011020819.1254157-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20241011020819.1254157-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 11 Oct 2024 07:20:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XfHtdc9RpEwAtVHNYwBGJGhHUAoHaJhP+ZPWuUHAASFQ@mail.gmail.com>
Message-ID: <CAD=FV=XfHtdc9RpEwAtVHNYwBGJGhHUAoHaJhP+ZPWuUHAASFQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: himax-hx83102: Adjust power and gamma to
 optimize brightness
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, linus.walleij@linaro.org, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

Hi,

On Thu, Oct 10, 2024 at 7:08=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The current panel brightness is only 360 nit. Adjust the power and gamma =
to
> optimize the panel brightness. The brightness after adjustment is 390 nit=
.
>
> Fixes: 3179338750d8 ("drm/panel: Support for IVO t109nw41 MIPI-DSI panel"=
)
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

No objection on my part. This is just modification of some constants,
is well described, and is to a panel that you added so I don't think
it needs a long bake time on the list. I'll plan to apply this on
Monday unless there are comments or someone beats me to applying.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


Thanks!

-Doug
