Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58E98C454B
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 18:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C7710E89A;
	Mon, 13 May 2024 16:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TUd5nD38";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8F210E8AC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:49:57 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-6f054c567e2so3034285a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715618995; x=1716223795;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1OM85BfQlIgcnJ/1dV+4zfpQvFXRIYFAfmerK9P8RRU=;
 b=TUd5nD38Ha70SVuA3OQ6aNLu88AW8rgeSCTQwj5d9VwM5rkYamTV8QXfxQJvAtOJPH
 AzdWAhuYlunU9lQjIMEtsaOQNl5cubvEjhyLxnioFpf+uL0fdX3joZr2E67Osd1CSSrS
 +x0nuN0K6D/LGeSv5tEUr3QfMkQFvfgg3Ydns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715618995; x=1716223795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1OM85BfQlIgcnJ/1dV+4zfpQvFXRIYFAfmerK9P8RRU=;
 b=KvuQZJYIOE53iOdJMnKHhrLz6dLnv50tNnNst1haqIu+PtT4+fYoxhz3j0+3mUhJHA
 dZsrcdBLQTrwBeJkrG9PFYKRLXicvbL9/jxRcJBFEeUY71St6RiTKUvIjcShb8/06zCG
 wQvKjiiN+T5WWzz/2we6/jKyucLjw90nYZVT9F63b2tlDtXlGVKDMbtmICLq/ezyGcda
 izGfvw3TlVHGxJjRhDii4xedVbpAjNMdDq9XsZu9wpxMCDk8fLPcygvlGrre+foCMgEY
 BpVRw9SMSSdpYkvxwFwnbYlvIw9ZUj1tGE8nhcSWnw2vg+U0/cWHILQDu6J3+nwu0oqa
 hAPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7jlVFf+hmUDn3ms6c/hPbE7y+rE8+Sb34nTkgplrB7bbCnj5sjAMLVBB+lYJqwTByUN3zqkg1nhONGT8jGg4pLIZYTDXBDTbkWY/MNM0K
X-Gm-Message-State: AOJu0YxWLPE+r3wuVrLw07uZ9mM+4fIvGAwNFz1lv90C00NQFI0caOU5
 y8n8o/B/F/gTlEDukqS+tRrxfiQHG/XvvOLb4XPk88Sqit8A1EeA5QGyXjav2xj4DE7K10PLiYA
 =
X-Google-Smtp-Source: AGHT+IHHV1hv1A3d1sfC2mULeH6oi5OS8VQhIcAcdLDup8zdskqXujCP7/mGgfSzWB5vA4f2rBfH2g==
X-Received: by 2002:a05:6830:1e75:b0:6f0:7635:54f7 with SMTP id
 46e09a7af769-6f0e929a4a8mr12331590a34.24.1715618994362; 
 Mon, 13 May 2024 09:49:54 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf2a11casm469979685a.60.2024.05.13.09.49.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 09:49:52 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-43df9ac3ebcso766951cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:49:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXAx531oxv2yq2paSMnTBA3/L08OQKo4F5IXCRbAAVo7kU3cqQfXhY2Fe2B/1VGTpMV6z38LTE/7omEW4UkJ0FyMAj53zu0hEuIMkSXXKSK
X-Received: by 2002:ac8:6f0d:0:b0:43b:43c:2e05 with SMTP id
 d75a77b69052e-43e0a223775mr4615311cf.19.1715618991681; Mon, 13 May 2024
 09:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
 <20240511021326.288728-6-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240511021326.288728-6-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 May 2024 09:49:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XrmxSV1O2S+Z2_n11=sh7WACvg24xiAquGTMMFFGDEPg@mail.gmail.com>
Message-ID: <CAD=FV=XrmxSV1O2S+Z2_n11=sh7WACvg24xiAquGTMMFFGDEPg@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] drm/panel: himax-hx83102: Support for BOE
 nv110wum-l60 MIPI-DSI panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xuxinxiong@huaqin.corp-partner.google.com
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

On Fri, May 10, 2024 at 7:13=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The BOE nv110wum-l60 is a 11.0" WUXGA TFT LCD panel, use hx83102 controll=
er
> which fits in nicely with the existing panel-himax-hx83102 driver. Hence,
> we add a new compatible with panel specific config.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
> Chage since V6:
>
> - No change.
>
> V5: https://lore.kernel.org/all/20240509015207.3271370-6-yangcong5@huaqin=
.corp-partner.google.com
>
> Chage since V5:
>
> - Adjust inital cmds indentation and check accum_err before calling mdela=
y in init()..
>
> V4: https://lore.kernel.org/all/20240507135234.1356855-6-yangcong5@huaqin=
.corp-partner.google.com
>
> Chage since V4:
>
> - Depend Dous'series [1].
> [1]: https://lore.kernel.org/all/20240501154251.3302887-1-dianders@chromi=
um.org
>
> V3: https://lore.kernel.org/all/20240424023010.2099949-6-yangcong5@huaqin=
.corp-partner.google.com
>
> Chage since V3:
>
> - inital cmds use lowercasehex.
>
> V2: https://lore.kernel.org/all/20240422090310.3311429-6-yangcong5@huaqin=
.corp-partner.google.com
>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 133 ++++++++++++++++++++
>  1 file changed, 133 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
