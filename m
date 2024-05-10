Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A718C2C0F
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 23:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF7E10E2A2;
	Fri, 10 May 2024 21:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HjOTkXD2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C4410E2A2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 21:46:42 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-69b47833dc5so11949396d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715377598; x=1715982398;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6d1FNJJ0J0NTz+lnDF9EyOouM1r5fViFb+y/0QDXvNM=;
 b=HjOTkXD20936aCDt0699wY4jBgRE1ziLjJVNcVqJ85iY56fc40gQD4ZSn1Hsr9jMNT
 0/XM1DW20n6dyiKu39Ulp66DGoytaFT65kdcffNjglAnK0BKMvxCg9YyDrDGftKQou/M
 tjvFBbIZVs0js9EywyhUTYWorCxLah3N/DK90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715377598; x=1715982398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6d1FNJJ0J0NTz+lnDF9EyOouM1r5fViFb+y/0QDXvNM=;
 b=NGLe4v3NKNmRCao0xO3bGW6Tl+PE1HOgQz3YIBXID2lnYHoh8xzlR5kTQmpXWpyWlD
 /yKZ0Y8JALHgwPfoH6W69oEWzaeSzhbKxtYFP7YHFCyHh4QOWHw2y1db+nZhBzrcbaw1
 LqKROzP6RVT77hTDlD9VRxFvUw3Cs8ZtMj7+ZLefX5CviN9DrCLPXLN9Q8Y7AHQquuGA
 k7uUM+wGry5QDlMMt2ZWR0bntRhhS66ApJxkSBVns7l13r6ZepsHJM4fq7uZ6MvS/hf7
 NyzPthWkWFIZWyJS1RDb6urwSXFbxCo4IPY/e7rYO2KEfZOx3kLwsw0lOl7bFhWMbEhE
 aGlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5e21IHTTwjx1kjQnyGlmnDX/FfdfPeqWaFghqLt4qOAp8qUqxt+SVp8WybP48fhXAhUb85Xz8A4YkC58LDM/S9UwehbY7sLMToIIvTGk5
X-Gm-Message-State: AOJu0YzAQ3qc9utHoHDbrv6GFub5PsduzYHqbG0AriVmtgLOnkI9GRDQ
 +BCoKSGsXLF3zkFz1B8WVM7ROruIBEcCmcPU7QtfwYeWiE1IJLYcOiiYLfStXyIkJQSiDMWzmyM
 =
X-Google-Smtp-Source: AGHT+IFunuKEYMfbaPXIBiAn6FmAP26pCaaWcbxrfKXwS8fToFGKx00IyGqbVefUf4LJyNtcWFBCTQ==
X-Received: by 2002:a05:6214:4984:b0:6a0:d713:9b1e with SMTP id
 6a1803df08f44-6a1681bc173mr49492466d6.34.1715377598638; 
 Fri, 10 May 2024 14:46:38 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1ce896sm20799206d6.92.2024.05.10.14.46.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 14:46:34 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-439b1c72676so41871cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:46:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVkKN6q/p1TlocHN194MBAJnP4hkXCfxw7le95gADw0R4tkkHwsNsIRD/lSPK/uLIHvuv7ZV5gS53u+o9aP3ODKKzygRerKrCMHObyAGbzW
X-Received: by 2002:a05:622a:4808:b0:43a:c9a0:6dae with SMTP id
 d75a77b69052e-43e0a1d2690mr272721cf.13.1715377594210; Fri, 10 May 2024
 14:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
 <20240510-dsi-panels-upd-api-v1-4-317c78a0dcc8@linaro.org>
In-Reply-To: <20240510-dsi-panels-upd-api-v1-4-317c78a0dcc8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 May 2024 14:46:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ud3ocRYyGPPUvv4V8KN2pBTFPZey1vYTvBSNL6ty-knw@mail.gmail.com>
Message-ID: <CAD=FV=Ud3ocRYyGPPUvv4V8KN2pBTFPZey1vYTvBSNL6ty-knw@mail.gmail.com>
Subject: Re: [PATCH RFC 4/7] drm/panel: innolux-p079zca: use
 mipi_dsi_dcs_nop_multi()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org, 
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

On Thu, May 9, 2024 at 3:37=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Remove conditional code and use mipi_dsi_dcs_nop_multi() wrapper to
> simplify driver code.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-innolux-p079zca.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
