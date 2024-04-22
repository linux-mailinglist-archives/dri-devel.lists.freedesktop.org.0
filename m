Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6565C8AD670
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 23:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A179B10F01E;
	Mon, 22 Apr 2024 21:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bJOQ2ohE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64AE10F01E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 21:17:43 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2dd6c14d000so21582681fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 14:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713820658; x=1714425458;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y2m/l3tOuUABljidnIMWozMhmQuiJxyH3dIJhKQ/b+4=;
 b=bJOQ2ohEOzma08aPBYMiHrkUGe7SE2sjtxB1dq9G2UmDmmQ6l4TPTpjwN3k3yjcw4Z
 lEWZOqmrzFwnVFPCNq1oJy73xRpyTLUBDKlptc30vvWWz9puUI+N3F6clF5sblvFl7zq
 7WcZaHEvflAzA7OlUZUft4Vvaj5hl55Qio1tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713820658; x=1714425458;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y2m/l3tOuUABljidnIMWozMhmQuiJxyH3dIJhKQ/b+4=;
 b=GB//ES2Q6HyGAzBwcHurNJ+viEyDc33k/ZMR7+B0H1OoS008inAwtEX63eBxJaJUDN
 XvMjVnLiO3wE1lt9m30YbeHq0rOU8fHHCdsPdOYF7I/wii90lb6w88Hmtgfg+5jZk6OJ
 fnLalkkLddE+m84ncEeXxe+dFIcD8rFM9Wj722DedTgm2ejxjMUh5PhIQiPc8i7XiNuB
 7dspkLZPWDgo7RWdttmn4YrL8sbFuPdnrLNiYyC2V1lyUqR26yWD5sSvei2tVJmuMva4
 /Ozr3jWUSXu2XvvKRtZ5nut9RNrckPU9xNHopipnvyBYjeKMz3+2iPvwoNMuwS3XZqlU
 p6Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8+UN/4VHhz/OrY/kPJ+Oq86Sa7eDoEaFduzslVpobA0zR6Kb2cyt+Ye7p9dSXqnIVmb4jDWQ05hcqf6OiyWsBhSxbiad845we9mmL5mAC
X-Gm-Message-State: AOJu0YyBS7g4yWLmhU4wr0Xcaeh2JzLKFWwgC28XQdGGKPaRcO5B57/r
 2ByiedRO+1QqXTR2RnrgDW4G818gBklGpXwgRjc7eJn1SxSoDddCAn10hDchhtyXAuEMu2xrqa/
 aqzfm
X-Google-Smtp-Source: AGHT+IEV72A/oHLOaJUwOuY4AnrcgdA8Bga5IKLvnlf49t3WwsYW8O8yqYzA0aTV4SZ9UDa55s5kpw==
X-Received: by 2002:a05:6512:3b11:b0:51a:f2eb:b4c9 with SMTP id
 f17-20020a0565123b1100b0051af2ebb4c9mr7182380lfv.1.1713820658451; 
 Mon, 22 Apr 2024 14:17:38 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 d3-20020a50f683000000b0056e59d747b0sm6223419edn.40.2024.04.22.14.17.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 14:17:37 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-418820e6effso25085e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 14:17:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWWaIRNxu5elMdvS96ekz2fZwqM+ie6WIBs8ePAvjoM+a9NGq2rsO6pXyb5IXtU0EuvqMqHhkVa6eQr0N3GZUtA/P9a227E0tjJk61htPnr
X-Received: by 2002:a05:600c:1d28:b0:41a:4331:89c with SMTP id
 l40-20020a05600c1d2800b0041a4331089cmr55545wms.2.1713820656705; Mon, 22 Apr
 2024 14:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
 <20240422090310.3311429-4-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240422090310.3311429-4-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Apr 2024 14:17:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XWNf6-Qtf91EkDZhLzD0J_SpSEmm=APjuaqV099QDj+w@mail.gmail.com>
Message-ID: <CAD=FV=XWNf6-Qtf91EkDZhLzD0J_SpSEmm=APjuaqV099QDj+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] arm64: defconfig: Enable HIMAX_HX83102 panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
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

On Mon, Apr 22, 2024 at 2:03=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> DRM_PANEL_HIMAX_HX83102 is being split out from DRM_PANEL_BOE_TV101WUM_NL=
6.
> Since the arm64 defconfig had the BOE panel driver enabled, let's also
> enable the himax driver.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
