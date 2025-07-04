Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8705AF8A70
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 10:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5171310E988;
	Fri,  4 Jul 2025 08:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="N1qb1pAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C6C10E988
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 08:01:18 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-553bcf41440so810843e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 01:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751616077; x=1752220877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=;
 b=N1qb1pAiOKAtdV90y2HUzI83l2jnrqqri0c4jrpmn0Bo6MMLPRmtUbV5ZqfcoQ0G78
 S0OzDbFR+s6p57Rprb7WXDixrJjQmo1jqKmCbuE+aInpj+sk1aR+PKOjc20OEJiVYgDW
 mOXjPoVLJHySzIRy5AqQhxDJJA/UPKao1s7GCh/3UP/MErLesvbLxfPOwLZ/wip/yFMk
 WI/QhIIwYkvWXKFzh/62D3IDMB8P2WDcpN7UXXR4XXKQyxDtKozPb7zXxOw+rbswtSAl
 U1L+Eq4etf7jwjxE+yU9/pK7xKZFGdac4LhU5A04Mit+Bem8UsgyQgtRsqVAFkbsvkkE
 lpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751616077; x=1752220877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W5hy85hwlDseVRTu07tUllVYOTsjRbqVRAcm6Mv7UyA=;
 b=Z5g6ffhQPtoURTlvBAekDv9lnIjTw3I0LpDjQhhGIJ4LBetD1p8vuF9y3nchG7lVrp
 iOerjyU3/qVndXQgSHySOWI+U+G3yzduXhB0Mk8LAAz4TuHAgo+7E+t34LwOKd0oQYnu
 6lkT5vBaSmqQb2DoJSw5CeoiysnwH5kwgCATz1udZCUWPmCeU99AahXbISuPZ4RcuBKo
 0w1VNpTvBuWUP2dF6Wys/bR/OAGwjXBBtDJLk2UH4Ga7WLfHm9OFQpxzT/x/kOWBG8dk
 pAEKgprUExDplj2kXa2uNT+OojxnODctXjgxOsaa3Nxx2f8S77EYu4z+8oersGvpUUQo
 WwWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh60zT5bi/rHy7dElnOaHyuoK5yd+N44q+lP7Euh9gSriLVkvshRarwe2QUwuJoMmxfdnMeoVZnnY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy3CleUTZfHt54f/f6xdVDFjq5/feZbWEAv9Tlh0hwjcDRWZVM
 tK3XfhBoi0Okpf3f0KSOSOZsrS+WOnTxcsNXojJ+FqgTV020J7tfpS0D1XsgNP3gg5XCMY1s+rS
 eS1txo1cxPBh4/y0HpvThpfqRJ2P9sUOwelKfM3VVTg==
X-Gm-Gg: ASbGncu/bDQOJpMs6tkhQgVy3piInXcYWCCbEoms7udCZE8vAi/fg9rLrGTzYIrBOI0
 0SmG1I7R52Zl6bR0Gr71m2QuxTKuaEw4csZ/MIcg0qYT2GViGycZPNOjBl03vBFFFBTjZljI1r3
 6zIoiVD6QmoTeOSdfCWnnYJDVYOIcZyKzVc6jKmHvirXc=
X-Google-Smtp-Source: AGHT+IE/4XahMx0H5K8e3G6kGLPvEJmDNT+z5yGiSFu4fWzVouleMPU8+EMqNIa7ZAvHuQVSQceFfXnXHQe0peqw8UY=
X-Received: by 2002:a05:6512:b26:b0:553:36b7:7b14 with SMTP id
 2adb3069b0e04-556f1f62c4amr441161e87.37.1751616076829; Fri, 04 Jul 2025
 01:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250701201124.812882-1-paulk@sys-base.io>
 <20250701201124.812882-2-paulk@sys-base.io>
In-Reply-To: <20250701201124.812882-2-paulk@sys-base.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:01:04 +0200
X-Gm-Features: Ac12FXztT7uc15QsZMvB3fPDcO72_tN7xc565ddgY25DgxMR-aqghVzmCalro_g
Message-ID: <CACRpkdanKtZBkH90yAOjm2+7+dcNri+j7wV5AFL7NHSXHi+bSQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: v3s: Fix wrong comment about UART2
 pinmux
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
 Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Icenowy Zheng <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>
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

On Tue, Jul 1, 2025 at 10:13=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:

> The original comment doesn't match the pin attribution, probably due
> to a hasty copy/paste.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

This patch 1/5 applied to the pin control tree.

Yours,
Linus Walleij
