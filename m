Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2CD937BD2
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 19:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D9B10E070;
	Fri, 19 Jul 2024 17:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bojyLjNw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9E810E070
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 17:49:23 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e087264e297so14546276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 10:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721411361; x=1722016161;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nfgwwc2r3y6LJY2+fBZz5scVHiOZDENMtfcc2xc+/L0=;
 b=bojyLjNwmIUiG1W3BqxM3sn9dkrv+D8MaOYGzFdLzYjNX/AcoPpijHXraP6xn+G0ud
 gdQfRCpxkQ4g+WiRkVU4Ot2xeZc5GXIQBzU9vhRLhGIGuKLM1ti8E3VZE4duo+3/Ret5
 pncMwTuZJEO+7+d4PoBs12Kp93CmWp3KeCA78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721411361; x=1722016161;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nfgwwc2r3y6LJY2+fBZz5scVHiOZDENMtfcc2xc+/L0=;
 b=FNd5VL428z/Yq0+FjQZNzVmr3wUjnkcJTUvTMEeJNKr3TXtZ4jjf355TzUyqMvLhqO
 j9A/9iFeqiYKavmW5TUGZ6YGtlApuqZqOpsKNbZSzxJ3ARujb44VT5l7BtZ8daKvDzeW
 HNeGi9o4AV7pG7KQ4b15y9e0wctTBDbdmYA4cE4kKkAM6DHNZlcOgOUyVVJBSKTnTDHD
 cYsALJ0V1M+0acsBHrfFPnbEGhnO/TZaJuVeXpJfRSkuI8ilsOCaPpDsPdqyR9fR9D4/
 UB6DadD6BYniqJnGJDwyScCS35fmj9ahn9rl1OHiIBeU0BC9g70w3MkI69im/8GNJp/F
 hHqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYoUSVXi1wp5ZxfEH/IV4o7dSc+2rDioW+4WwrwODHIyhkZFVlcUQxiRefwwDVdbPG81KsODUH5YNnlRfbo+wwCdxqb+xAA7klUQOznTi1
X-Gm-Message-State: AOJu0YxBr0lq0g4dfcUIyNQuk+5PZyjTTc23dQXBl+J/1n9YT9PmoNM8
 cdCXwR7D/00KPUzkKvzZWzUxALC/VR04KKzquJO2FxlbZGcM3dZ8SoQfjBONKk2223pjHtumOxU
 =
X-Google-Smtp-Source: AGHT+IG2yVUhQJOjOKoC79UTVJ3z3z2+H3UWTTsxHcz227JaOaAjJNv83rbQ4WiBq2w9SLzAEUTqXQ==
X-Received: by 2002:a05:6902:150e:b0:e08:7171:698d with SMTP id
 3f1490d57ef6-e0871716fe2mr226320276.20.1721411360783; 
 Fri, 19 Jul 2024 10:49:20 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b7ae4d71cesm9571066d6.120.2024.07.19.10.49.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 10:49:19 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-44f9d7cb5c5so229501cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 10:49:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUXSaqaqxf6wVnvQdbxH2Du7oHteboBf57y07zdGPThXiIeD/nAs+6EqPGycKD19EUaYxFn5ERKhm2M8GbXjuqA8W6J4biKEJ+lX4LBYa0T
X-Received: by 2002:a05:622a:5509:b0:447:e8a5:fb27 with SMTP id
 d75a77b69052e-44f9c86fd18mr2794581cf.25.1721411359169; Fri, 19 Jul 2024
 10:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240716121112.14435-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240716121112.14435-2-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240716121112.14435-2-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 Jul 2024 10:49:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W1_m0dDXM8+Gbfcv92H8_h1wgh8u13iE03nYOT-tOtYA@mail.gmail.com>
Message-ID: <CAD=FV=W1_m0dDXM8+Gbfcv92H8_h1wgh8u13iE03nYOT-tOtYA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panel: boe-th101mb31ig002 : Fix the way to get
 porch parameters
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com, 
 mripard@kernel.org, hsinyi@google.com, awarnecke002@hotmail.com, 
 quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

On Tue, Jul 16, 2024 at 5:11=E2=80=AFAM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> The current driver can only obtain the porch parameters
> of boe-th101mb31ig002. Modify it to obtain the porch
> parameters of the panel currently being used.
>
> Fixes: 24179ff9a2e4524 ("drm/panel: boe-th101mb31ig002 : Make it compatib=
le with other panel.")
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
> Changes between V2 and V1:
> -  1. No changes, Modify the commit information format.
> v1: https://lore.kernel.org/all/20240715031845.6687-2-lvzhaoxiong@huaqin.=
corp-partner.google.com/
> ---
>  drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I assume we'd want to see a re-post of this series with patch #2
comments addressed before landing? What do others think?
