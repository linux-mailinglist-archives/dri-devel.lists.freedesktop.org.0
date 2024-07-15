Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116829315FC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 15:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7027210E309;
	Mon, 15 Jul 2024 13:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aU+luCxx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8BB10E38A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 13:43:24 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-447d6edc6b1so24374871cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721051000; x=1721655800;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aeGvR/8lk6Nll/J3UVT9i6hjcln5jvzV7Bpthcn/O4s=;
 b=aU+luCxxbKP9VVkqXsyLuBavgUO44hyBB/0WE8rFcwy4ij//45g5kvab5kvEN13MJW
 LIAtJ50Ua0+8RyLYCyBzSjNBPOmz7qlo2HAWOv9Dogd1nvMk/iCMG3WqB9AVuWFpXew5
 wD3MCmkOf7xNPoOZTFTORDOZbvr0wbnMusIhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721051000; x=1721655800;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aeGvR/8lk6Nll/J3UVT9i6hjcln5jvzV7Bpthcn/O4s=;
 b=ds1rLQ4TawLF8NVzBbjDTo0y1pUx3UtymMczyzr8B9TP37Br76A8V/gJ7BrP9yZDnD
 CpdoWc+sLDbaTDeV9uvpXj5hrU4/CwFbaWNLl+V4Sb6I3C0pmX7Lxj071TiQQCCyMyTl
 uez1pU/Sxmw8nAQMRdDVYpSuCKI72ldTolXNAPn1LPXwzl+xPchUum8UBNoGH6Waf46v
 YIzodDJnuqbrlCgfRN2xILONWJIBQXwASKSa/YLl9dYQbjLeMbUkBfSKMjzN7qn3LMo+
 S5KnJSBOTwBof7zAi+iBZGbLBm8jHVesp9Xa/ObCRNGhqd+I1YSsYmGPum2i9xMoMUnW
 Hf7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFl5s7yqHqPw2tEglnpKcBoRuq8iV+F4RSEKGDJNaIkAFbupR8C1OXooF4EtDOFRhtcVuxuMif/hk1fVwodVhDGR7WjqSvOAZc640pYOLH
X-Gm-Message-State: AOJu0YwInnZn2/MDXuxSQ5NtAuI6/Wd5VDQu8hhVqud/+DJZEBe0xjJT
 drbJQMZBWLiQaKDIZ5bKdsju3tItGxbVq61zuw70xPpaneM0wmTn3fmP+RU5/DXQc2eR0VOW+bU
 =
X-Google-Smtp-Source: AGHT+IFB2tH5QLP18kdwwGrx0L6VjlirzrFcNJJGyG3x3g/6pW+wzZFmD8d2tgL+l9sYGK9U5q5WAg==
X-Received: by 2002:ac8:5d06:0:b0:447:f7cf:7022 with SMTP id
 d75a77b69052e-447fa8c9cccmr232633691cf.40.1721051000093; 
 Mon, 15 Jul 2024 06:43:20 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44f5b83e143sm24803681cf.86.2024.07.15.06.43.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 06:43:16 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-447df43324fso489511cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 06:43:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU8GK1Sym3Sja+FX4g7SUmLN1gARr84p7m7QkPklvv2mfQm8DGomGEWQZl3gdQqMCN5N5ff/zCN+jdeCk4bGdxRGeSyH03COyj1SLM5M1g0
X-Received: by 2002:a05:622a:2446:b0:446:64ad:ee91 with SMTP id
 d75a77b69052e-44f5a31ec80mr5833341cf.20.1721050996122; Mon, 15 Jul 2024
 06:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-4-31b7f2f658a3@linaro.org>
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-4-31b7f2f658a3@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Jul 2024 06:43:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WLFohKUUFqsPrpRGCer_TPugoM8_Du6=7YcDywFfUkVg@mail.gmail.com>
Message-ID: <CAD=FV=WLFohKUUFqsPrpRGCer_TPugoM8_Du6=7YcDywFfUkVg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: defconfig: Add
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
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

On Mon, Jul 15, 2024 at 5:16=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> This is needed for the display panel to work on the Qualcomm
> sc7180-trogdor-homestar and x1e80100-crd.
>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

I'd assume that this will go through the Qualcomm tree.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
