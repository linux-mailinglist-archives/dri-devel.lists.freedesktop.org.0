Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564F39629F1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 16:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C013610E530;
	Wed, 28 Aug 2024 14:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fSVgpczg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D8C10E530
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 14:12:18 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6bf705959f1so6454286d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 07:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724854337; x=1725459137;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BuabzWElUzzHdL1Mbm0egMjDIW45P3GOeFaGyaG57xY=;
 b=fSVgpczgpb5+2ezpvakRZn+ssx+6i5TVvUaH/UIlAt6fBWNVppjgyQkN35ytEIjK3a
 8ggb5Yl/TgtbwoD9JO6qQE266H7cl/U6A/D9dM0cb+d6Sbw39ZZLA0M/Cl5ZAdDrlSkd
 HM9AZ/xhOfYqnSiI5ZbiuDq98hEUKgyEJNWg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724854337; x=1725459137;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BuabzWElUzzHdL1Mbm0egMjDIW45P3GOeFaGyaG57xY=;
 b=PQhbbFcIwLWJCLR2IG7huB5YynvomU1FLNHQaCXQWAih/cwZDCBh4tphAAwhn9bXiN
 GtYK2V1nJKEqaMgstgxuhjFuaDE9etob3cXRdOSqMsbR8dfLzZcxUskIwt/ODtNxLcHp
 WctM0Vy8NTf8hbrKC3r4hUK2cI/dFEg1jySsNK9EX9tmmcEP7czIUtrQkdNmf7d7u5tT
 U0OsNnZsy3wT90HKJ6EAVz4aG2Am4NAY61xrD0dPX82dCUWZ2RxJhjGPnkWUFuqrBvEA
 TwljnEoESXTPQjuU6RfBeZ/dhma+p1UVcx3nOKT5dPDlH6sADgfkkrv0rjbrFsUnE7Nb
 XESA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJclX52/AFQYksN2QJBow3XQ9icoPelG/Y1D1bScdD0DjUyYCHrgtbxpO/21gjWD7uYcDT3ElIIFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpLUNafvQ3UuZtid+tRFUlsFfkaISvZN9Vj1Fv5czFNzvJVwpQ
 wYXlunlJ1E1GblE8YHb6hQVeYlxa6aMSQDacAr0fq+W3VEj4b+WDgMYrf+9JJQivLnW8uK4RyOg
 =
X-Google-Smtp-Source: AGHT+IHbiqR/3C7RrlMCkwrHJFgcBgHv5CthWr++Ta0rwEMP1TOyrFlxb8jkt0TNmzFcQNa13GLW2g==
X-Received: by 2002:a05:6214:4286:b0:6c1:6b38:2f9f with SMTP id
 6a1803df08f44-6c335dca438mr39992016d6.28.1724854336561; 
 Wed, 28 Aug 2024 07:12:16 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com.
 [209.85.219.53]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162d6548csm64931086d6.68.2024.08.28.07.12.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 07:12:15 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6bf7a2035d9so6330546d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 07:12:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVw3EdTR4EURuT/igUvgkLMTvp1PFg8IN4Y/a7vcoX+Qal8GSDQtUbf4DrSU/ItHF33EEUr7742L9M=@lists.freedesktop.org
X-Received: by 2002:ad4:5147:0:b0:6c1:80d3:8d2b with SMTP id
 6a1803df08f44-6c335d62c8bmr34636536d6.18.1724854335299; Wed, 28 Aug 2024
 07:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240828-topic-sdm450-upstream-tbx605f-panel-v2-0-0a039d064e13@linaro.org>
 <20240828-topic-sdm450-upstream-tbx605f-panel-v2-2-0a039d064e13@linaro.org>
In-Reply-To: <20240828-topic-sdm450-upstream-tbx605f-panel-v2-2-0a039d064e13@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Aug 2024 07:11:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WqmdjrM3jgpGEX=DqrJLYySpgQ9w+zK0mR=os_5wA35g@mail.gmail.com>
Message-ID: <CAD=FV=WqmdjrM3jgpGEX=DqrJLYySpgQ9w+zK0mR=os_5wA35g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: add BOE tv101wum-ll2 panel driver
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Wed, Aug 28, 2024 at 2:22=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> +static int boe_tv101wum_ll2_off(struct boe_tv101wum_ll2 *ctx)
> +{
> +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> +
> +       dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> +
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +
> +       mipi_dsi_msleep(&dsi_ctx, 70);
> +
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +
> +       mipi_dsi_msleep(&dsi_ctx, 20);
> +
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x5a);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x5a);
> +
> +       mipi_dsi_msleep(&dsi_ctx, 150);
> +
> +       return dsi_ctx.accum_err;
> +}

optional nit: now that the single caller of this function isn't
looking at the error code, you could make boe_tv101wum_ll2_off()
return "void".

In any case, this looks good.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
