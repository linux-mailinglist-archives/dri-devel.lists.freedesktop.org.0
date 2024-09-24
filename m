Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8639849E5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 18:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C410910E72F;
	Tue, 24 Sep 2024 16:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BOZyYujq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB1A10E72F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 16:43:20 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2f75129b3a3so58958651fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 09:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727196196; x=1727800996;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oDJg0Z3yMGG86SOrzW7+HRJsv8BrsQ6fZkBLLbiSg1k=;
 b=BOZyYujqs/Ikkg5M++GRsFBRwBvff+++FNLdRnbjuIhhvYdaOKGZwaAcGGpB0yEUdD
 YWORHnLlj/0ZoKNEZySjJbKdpaUlnelIWVV6Ag+0ncXAnIk0k1vSprnL/0fyjwxMOxYm
 /TTw6ivShbm2i1hzGMCljGGCSOYuuA52bEJII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727196196; x=1727800996;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oDJg0Z3yMGG86SOrzW7+HRJsv8BrsQ6fZkBLLbiSg1k=;
 b=lVZuKXJV2hyvnFQq3B+pb+rQMzTi2SuQ0Fn50zruOjo2VEHsEm+HRZY9ATIufMs8hQ
 CKkYwiTSWmFr9Jgu99QFXApDwq88YD6ox81A8OM/cEfIzSX7XCtxghs8FwNWAhzTwRhO
 FmjlAZaFpcIx9VC/3n0AkEDx6E/7m2d4CkrhcEsnZn+AtBqxDw+fFt/euShoqtxuY1g1
 2d/Ym3bm4S3+YL3P3qejJfcklChP69yKIrL9eR5mvt8mzlTcX25rDK0XBSkJR5lp2VwD
 kWIyLQDPhNfA19y9U6dRrJFgPcdvV7zT+aC4kK4s0BAwKCOZE/HnJCyY9mlUu7NtGHSA
 EKhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGImBKEyvQY7N2ZGlO6a+9Z4zEgn2XD6SCUna/3wX9OvpgmBSRXDgCfrDSF6WwFyqLX7hR2Wo6+Ss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxpw3HPBSX0yzRSmBMasxP/Bvx4wjXpLFsHb5XSzBE6u1FQo1+2
 NqY+xrdPjvBDXuRNqpUGT/fHxJ4mbyV67PHk6ggLgi28GxOtzA7BMLUh7OwlH+EyjFaLli6yLUb
 CDbPP
X-Google-Smtp-Source: AGHT+IFHbcK3G+yuA1fkoBrfuYaeKcoHFgZvnzPyS+0hBMdx2iw8bC3B24C5aKWK94Fo6E9DNmeZ+g==
X-Received: by 2002:a2e:be1b:0:b0:2ef:2638:48cd with SMTP id
 38308e7fff4ca-2f91ca42720mr37911fa.30.1727196196048; 
 Tue, 24 Sep 2024 09:43:16 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d289b710sm2812081fa.114.2024.09.24.09.43.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 09:43:15 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5365aec6fc1so6323783e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 09:43:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUuvXYr6wPCDQo9xk9ir1A9FWZzh51V/69rJ1GVvJUBeuiEMsSVbscdgM7gqX5Zx1bmx/zBpDsf27A=@lists.freedesktop.org
X-Received: by 2002:a05:6512:138b:b0:52f:c833:861a with SMTP id
 2adb3069b0e04-536ac3400b5mr8400144e87.51.1727196193748; Tue, 24 Sep 2024
 09:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240924035231.1163670-1-treapking@chromium.org>
 <20240924035231.1163670-2-treapking@chromium.org>
In-Reply-To: <20240924035231.1163670-2-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 Sep 2024 09:42:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VEMkociw5gyVOtVCPmCyf1b0G7owsAm=o-LxB33YUnjg@mail.gmail.com>
Message-ID: <CAD=FV=VEMkociw5gyVOtVCPmCyf1b0G7owsAm=o-LxB33YUnjg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: anx7625: Drop EDID cache on bridge power
 off
To: Pin-yen Lin <treapking@chromium.org>
Cc: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
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

On Mon, Sep 23, 2024 at 8:53=E2=80=AFPM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> The bridge might miss the display change events when it's powered off.
> This happens when a user changes the external monitor when the system
> is suspended and the embedded controller doesn't not wake AP up.
>
> It's also observed that one DP-to-HDMI bridge doesn't work correctly
> when there is no EDID read after it is powered on.
>
> Drop the cache to force an EDID read after system resume to fix this.
>
> Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP=
")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
>  1 file changed, 1 insertion(+)

I'm not totally sure if it matters, but I wonder if you should change
this to only delete the EDID cache if you're in DP mode and not eDP
mode? For eDP mode the panel is not allowed to change and re-reading
it needlessly seems like it would slow down things like
suspend/resume. I think this would only matter if someone were using
eDP panels in the "old" way (not under the aux-bus) because we don't
set the "DRM_BRIDGE_OP_EDID" when we see "aux-bus", so maybe we don't
care that much but still...

Other than that, I know that there have been discussions in the past
about EDID caches but I can't quite remember all the details. I know
that panel-edp.c still caches it, so we must have concluded that it's
at least fine/reasonable for panels. I don't remember whether caching
is encouraged / suggested for external displays, though. Do you happen
to know if it even makes a difference there (in other words, do you
actually see multiple calls to read the EDID when you plug in a DP
display)?

-Doug
