Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7627A11F9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 01:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DE710E5AE;
	Thu, 14 Sep 2023 23:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785F510E5AE
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 23:43:22 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b962c226ceso24387641fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 16:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694735000; x=1695339800;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ffsw5m1PXl5CYPaF5hVOzi1zPkWams0dilWKJC5stN8=;
 b=A2RJl2IWh6gAcpFY1rwhMvZ0j3i2sOQcfaELrqu8j9zjgMLJNBsf5tYcpC+4DCVg3v
 4bxDQqh9MuhwdFuiXyWLaqLF5QzLoFzQTjUuNz43LnFJWgUmZNrx8cGY7CbWBYQJE05x
 Ic8JJSsRrDVr9CDTHlxDcmc/LA3ykYuGKf1Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694735000; x=1695339800;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ffsw5m1PXl5CYPaF5hVOzi1zPkWams0dilWKJC5stN8=;
 b=ZleLTGlyAfF9yp3ehgOxQvst53eem49MZEx7+95XbnS3uObPXm8rvg4Th5gdUfr9ZE
 TpySRDo0KHQQ0l6xLll9V96E66RHtoHs9BhixAKuuAutxrOfwaEjF+F+yQRkyeY+2VMA
 b4EdpUR5JWMXjBEQKcwuRwPw1eRpnSAFag8265xdpRvMTsRXfj63AndMPC6yLUXqZFw7
 dOaYD6Zw0HfG7wSyi7H/7WG43I5vgnNecXcLRHajbK9pQ1OwSt9YHWo9k5jSMLmmuZsG
 IFrG27A2gpdgrpinZ46b+hMDNubUHAi4to5LyB+iF7Spbz7OymUiY/Qt0sDjAmmfOsZ9
 T+Fw==
X-Gm-Message-State: AOJu0YyedQ40XZ8n6LYcDpmZa9SlV1oT+c9O0aYwMaj9ib1DboQXzWtj
 b2smAMBd2H1EWwVX7GPcFNKJmevc/kCi1vT/u0kkDxOI
X-Google-Smtp-Source: AGHT+IHLdDtGyVwouAnNeBSBJjCn4C2GOju7ZcGoId3267f/yTAowItjSst02F+i3kxDU7rYMW9uZw==
X-Received: by 2002:ac2:505c:0:b0:500:9026:a290 with SMTP id
 a28-20020ac2505c000000b005009026a290mr133650lfm.9.1694735000220; 
 Thu, 14 Sep 2023 16:43:20 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 fy20-20020a170906b7d400b009ada9f7217asm1636231ejb.88.2023.09.14.16.43.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 16:43:20 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-52fa364f276so3208a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 16:43:20 -0700 (PDT)
X-Received: by 2002:a05:600c:1daa:b0:3fe:f32f:c57f with SMTP id
 p42-20020a05600c1daa00b003fef32fc57fmr70422wms.0.1694734979632; Thu, 14 Sep
 2023 16:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230727171750.633410-1-dianders@chromium.org>
 <20230727101636.v4.11.Ia06c340e3482563e6bfd3106ecd0d3139f173ca4@changeid>
In-Reply-To: <20230727101636.v4.11.Ia06c340e3482563e6bfd3106ecd0d3139f173ca4@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Sep 2023 16:42:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ued9suf95ub1-rftO2Ffx_Rwv7XvAf7yX-s7djO889+Q@mail.gmail.com>
Message-ID: <CAD=FV=Ued9suf95ub1-rftO2Ffx_Rwv7XvAf7yX-s7djO889+Q@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] arm64: dts: qcom: sc7180: Link trogdor
 touchscreens to the panels
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 27, 2023 at 10:19=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> Let's provide the proper link from the touchscreen to the panel on
> trogdor devices where the touchscreen support it. This allows the OS
> to power sequence the touchscreen more properly.
>
> For the most part, this is just expected to marginally improve power
> consumption while the screen is off. However, in at least one trogdor
> model (wormdingler) it's suspected that this will fix some behavorial
> corner cases when the panel power cycles (like for a modeset) without
> the touchscreen power cycling.
>
> NOTE: some trogdor variants use touchscreens that don't (yet) support
> linking the touchscreen and the panel. Those variants are left alone.
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi        | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi      | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi         | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi        | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi   | 1 +
>  6 files changed, 6 insertions(+)

FWIW, this old patch could land any time. All the earlier patches in
the series have landed.

-Doug
