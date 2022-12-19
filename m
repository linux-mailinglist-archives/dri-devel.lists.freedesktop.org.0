Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE03650A82
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 12:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD4310E22E;
	Mon, 19 Dec 2022 11:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7E510E22E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 11:00:28 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id a16so12276766edb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 03:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iuCRAFVT/WKlH/y5prSBpJD3SqynK7xQGXEcEcRTyec=;
 b=Bl+FBOtkl3TIJreEdb1w5tp9wF7vjZAEZN2mCn8qBr6bOR7eYJSh7G/1tL/e5C757l
 +By4uVqs9vRPMrTwxcKs6clHXPr4H53i4ILsMV2qdduSiJrp5gCN8V3cNTYQNOFaEsr0
 aA5oveWy4U2XBiqyEhtfUfGGOKm2lc4gWTVkk0FKWHxy7nKtsjFWb8on+rH/oxlGP6Uv
 nHei7CBOJKphzTStw2wi2vT+E/+11Sin7ItVJfjS1kA8ZR/1RGl2ilPeI8zZzmw+3aNR
 R3HYK6/iX9sYWHOYWElZLiy/m0HvAR9qPPQ8K7W1pus0ETAKy+Qsi14txsICXBMfuDMl
 ceXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iuCRAFVT/WKlH/y5prSBpJD3SqynK7xQGXEcEcRTyec=;
 b=rvX+BOAnXvfWy6sVX6MzXFTLiMvccJwCNcZ6RPQBFXqyajrBiNegLRrALlcVP+2kxl
 d3Pqwq4eFc2RYH6ET9q8fdlGrQ6TnnRmjwEhupLzrbQGhwN1IKqrEd08KQwjcAPgPBN6
 yJmTrH2PEE+sGoY6CLVxPzbZKrsmM2fmgnLrGAGI5u9Gyf4U3E4DNB2HwNZA4sur7f4p
 sQv6XKSaMoFvSOFrt0pMin2bl0cz6A3ktRSn1u/omhTYMg0ExAeLzihVV/8enxa7y3/Y
 AXNY285xuKV6qQYvhzXXhldDGgwUJtEhB9Sxsdfy3btwKUYuuXHqiKg2LQi6CMEpDm4k
 EpiQ==
X-Gm-Message-State: ANoB5pn8goXMJ9enhiG5F8ulXVPM7d0axgWWKEhYUPV/XPFN6IpvgRT3
 ASp9HTvQRUR/Kt5GmVUuoQWHbtW1CEKVSKX3eY4834mKKU4=
X-Google-Smtp-Source: AA0mqf4PgOFZhk8kk0KOvHCW2ZZP8Y019U4xA8Etf86NHLJZ6BISof2bR97ocHW80jvc1aiWRPU+HPdZW+4EhHZeqmY=
X-Received: by 2002:aa7:c38d:0:b0:46c:fa25:f03d with SMTP id
 k13-20020aa7c38d000000b0046cfa25f03dmr16124267edq.291.1671447626791; Mon, 19
 Dec 2022 03:00:26 -0800 (PST)
MIME-Version: 1.0
References: <20221216-afbc_s905x-v1-0-033bebf780d9@baylibre.com>
In-Reply-To: <20221216-afbc_s905x-v1-0-033bebf780d9@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Dec 2022 12:00:15 +0100
Message-ID: <CAFBinCAfF-=776E3k=NnhaG+rMCp3b=WbjkN=RKGG8vM3Cn-3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: Reduce the FIFO lines held when AFBC is not
 used
To: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Carlo,

On Mon, Dec 19, 2022 at 9:43 AM Carlo Caione <ccaione@baylibre.com> wrote:
>
> Having a bigger number of FIFO lines held after vsync is only useful to
> SoCs using AFBC to give time to the AFBC decoder to be reset, configured
> and enabled again.
>
> For SoCs not using AFBC this, on the contrary, is causing on some
> displays issues and a few pixels vertical offset in the displayed image.
On the 32-bit SoCs (for which VPU support is not upstream yet) it has
caused screen tearing instead of shifting the image.

> Conditionally increase the number of lines held after vsync only for
> SoCs using AFBC, leaving the default value for all the others.
That was also my approach (for a not-yet-upstream patch).
Since it's affecting already supported SoCs I suggest adding
"Fixed-by: 24e0d4058eff ..." (maybe Neil can do so when he agrees and
is applying the patch).

Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
