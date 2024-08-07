Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D5E94B340
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 00:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6749A10E600;
	Wed,  7 Aug 2024 22:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OHE34ndC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E2B10E5FC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 22:54:08 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f025b94e07so3723251fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 15:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723071244; x=1723676044;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hK3hwGrnj/zKkxZtckbcBC2CUlwS0OkjbgptQLHblIw=;
 b=OHE34ndCYAb+JOIxiNTKPTarXU642mwac9WXShLjqXE0vi87saInvKn2EvW/2zwX+t
 aa2Fe4GTmw4+zITW0yDmSVdeW+PjHkQVgkveK3hKenH/jwjHTL0N+FHAAlW9d4Uh+ASM
 QEbFeqreeKgiHJcHVnaLS9tEaIr22IPdiZmZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723071244; x=1723676044;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hK3hwGrnj/zKkxZtckbcBC2CUlwS0OkjbgptQLHblIw=;
 b=Gch/M9OocLCbF2uXn4n2dPRplSOGmgtfXgNzKs3HIRXP0C9odVR497k9snqe1NK1b7
 Yqa7U0sSZYgtnFrkMFPFT1rdSUZj46Hixu3olDXN7yOn8lQ8PTqter0dEygxnM22BGlv
 MBiW8jl3owV+Fs3J5Se/znGtZRnqrGFwjtX1ssLUzko9waIvimxKrizacLlJK/Iraprm
 aZYxR8FHKxCgLcNHWGy2Skoxqm2fAO12AAYbrbTYFttaFQgiwwifaXD3hHouZtMFCF46
 ZT8FhxPtF1wLODPuBCOvW1bb0yMHJfnloO6AaAl6lvzgxaWRmSBB2BsZHGBn69GmMRIq
 cHTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCOavCY/aQ1zX33OZcOfte6bIG7NRMAEwM5a5wKnSPj/QpTKAkNMFgZd8JeQ1Yn+K27AfYbPUakfhssClcaqmcqrM0nQzaEQkhgUP8A2J3
X-Gm-Message-State: AOJu0YykhyI5hrS6gJFRFMDJllKq9esvKtU4K0+DLOERawvKqPDTR77A
 t4dmCPOQLg3B8yDuPSxcz5JhjHbFjWESlrGZYIBNOYaDcnjpBnH2hzf8Xnyu5D44cWM0gQG9FL3
 Mjw==
X-Google-Smtp-Source: AGHT+IFq1C6bF7o7Eon8KKJxWJZCIxEocrqJwBiVzAN6ZT1Rfmx0Lxw14pggvgOm5SzfUgRihUQ+nA==
X-Received: by 2002:a05:6512:3989:b0:51a:f689:b4df with SMTP id
 2adb3069b0e04-530e58760c8mr18775e87.44.1723071243309; 
 Wed, 07 Aug 2024 15:54:03 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3bccsm684885766b.16.2024.08.07.15.54.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 15:54:03 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-428e12f6e56so26945e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 15:54:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWTDIFs6i3nbYslNICqv8JeYKWux76oL8IGHiHIoL7njK+oz3myh1BuR0XLoqbS4nZIQ8/QW+0NnmjBx31GCDAFuHth690Lgp9zTEFNqcHu
X-Received: by 2002:a05:600c:3d09:b0:424:898b:522b with SMTP id
 5b1f17b1804b1-4290aa7b8f8mr276815e9.1.1723071241590; Wed, 07 Aug 2024
 15:54:01 -0700 (PDT)
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
