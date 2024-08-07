Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB9794B342
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 00:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A015710E5FC;
	Wed,  7 Aug 2024 22:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KiKus4pm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799B710E5FC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 22:54:11 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7a1df0a9281so24468885a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 15:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723071248; x=1723676048;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hK3hwGrnj/zKkxZtckbcBC2CUlwS0OkjbgptQLHblIw=;
 b=KiKus4pmHLHMmII5LNy0MVQpvCR9UPsjznEAiYZ/B9DYcVaZ1J0NkR1Q/qRAqaZfaJ
 icO2nUSQnvJonLncgYh3Occba+ndvm/K7CjlK/EUsFWzyR8J854TIB7lk34hAm2z1Ugv
 2/70+rFIe/8g6vohKNDt9LAd1O/B+ufNX876I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723071248; x=1723676048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hK3hwGrnj/zKkxZtckbcBC2CUlwS0OkjbgptQLHblIw=;
 b=jcxItWNvK/ivPRIHQ8qt0PDkxC2Gx+iSLCen3OmwfsowgU17NmkB6OXRHM6LWQD/Dv
 H8Pww6lnsC0YOoiAGIPH4N4uHN8zYCAxWHj5uAJh5UHl40oUOHHDNcMkMkMqoqL9hUG0
 xQRV5+XMyZ7i4sHE/bR1vqRJ0Z55r7MsCTvwpTPsmY4XO+NG+e8brG/6MQQpy+yMQOrY
 7Jnbt0RIiSVOk3Isr8DHUtd9u71UrXTh55rbMGUeLgDSYdJjuN6TIu766udAextqvcjY
 X6TloL0PhaIf8JMMjLYruvkr3QKP5qz+p3nvmPP5OxrYr7n5rCZEvdGvNG/f+qd0cRtR
 UhTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBNGGFX9t2gpe9q9shStTyofhb2AKFwS+31eX5JNU5ZwJhPx6FWOTyn3LXfLYu6BhAZMz5u0BWF1YNRc9iBFdQwgTWxnryFq/R5NE76LNI
X-Gm-Message-State: AOJu0YxB7pHa09n29oLbiTjdpJIzPRIMx2kfdQNiSE+Y1tWyC4lO7f8N
 a9QMfUVem08gfoAEFUQEQQV9p4wQNXHErscUCzLgyHLrGe2p0zEP/wyx3/4LjFHDxrNP7OGFSzK
 +LA==
X-Google-Smtp-Source: AGHT+IG/uZ+9D58/lVenpP7ECImvJ3w+yt2Mxbv69ZmdhvRuF2EUQYNttYdEkFQZIDoyV3yaIUc8ZA==
X-Received: by 2002:a05:620a:29cf:b0:79f:13b7:2a46 with SMTP id
 af79cd13be357-7a3818c06a9mr6211285a.64.1723071248091; 
 Wed, 07 Aug 2024 15:54:08 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com.
 [209.85.160.177]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a3784ca5fasm101705385a.0.2024.08.07.15.54.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 15:54:07 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-44fdc70e695so176651cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 15:54:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW21SUBE1iCWCkdl6Q08D9Tp5DNcNL8EebafqqBydrY9/w3rWrAkEo6VbutBVop7usNPZUZ4JRwGWmrGppA/jyvIBA1/cy+EI7BIBNj73HJ
X-Received: by 2002:a05:622a:652:b0:447:eaaa:c852 with SMTP id
 d75a77b69052e-451d384a4d7mr540481cf.23.1723071246934; Wed, 07 Aug 2024
 15:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240806135949.468636-1-tejasvipin76@gmail.com>
 <20240806135949.468636-2-tejasvipin76@gmail.com>
In-Reply-To: <20240806135949.468636-2-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Aug 2024 15:53:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vh6J9nHFpvy8Tj0OWj9fYWuuRSy=P-t+SzvyAN21Agmg@mail.gmail.com>
Message-ID: <CAD=FV=Vh6J9nHFpvy8Tj0OWj9fYWuuRSy=P-t+SzvyAN21Agmg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/mipi-dsi: add more multi functions for better
 error handling
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Aug 6, 2024 at 7:00=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> Add more functions that can benefit from being multi style and mark
> older variants as deprecated to eventually convert all mipi_dsi functions
> to multi style.
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 194 +++++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     |  10 ++
>  2 files changed, 204 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

If nobody else has any comments, I'll plan to apply this midway
through next week.
