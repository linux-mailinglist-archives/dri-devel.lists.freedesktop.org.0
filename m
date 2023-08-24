Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 993BE7877B8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 20:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FF410E5AA;
	Thu, 24 Aug 2023 18:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C2210E5AA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 18:23:44 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52a250aa012so252801a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 11:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692901423; x=1693506223;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rPas7Wif5nIjow68vkOqqHoz5PSF9sPjZXPo/r5vhhg=;
 b=j+AgbByUUAC9roKaDemGIW88Oo3tXcPvIeqn5W51zml3S2IcmMzABuYFuQLnHRvE4H
 DB2YTf1MCbrsxa3njCa9k0iQAoiJrfl13mCvCG07zqfD7t20rtZF18348aR05P2qdoi8
 FCnT1YXKnydDMKwHfU/SLL0Ows4xHVbUiovoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692901423; x=1693506223;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rPas7Wif5nIjow68vkOqqHoz5PSF9sPjZXPo/r5vhhg=;
 b=EJutDcT/J5Q4dskAwlIMsT/cYsuG4XTzdv0Loir4KQnkYsfQZLmMhm7vJ6RoMAPsUQ
 XlPEb3Vbbvng6JI4YU6YRKUzJn0QgyDUPhfLX2/fbx0ER8F8WQb6s1CQ3YPrrHgXkEKa
 qhPvY7LEmzkqDuPp+gYWDl3Ur/86Gy62uoOK1Be9aJ5yYiXlSI8UrIXGWMBTLD5ZA92V
 mKsdAJprpuHz2PHrOd+EDo9GihR5idbPUn0W8LcCBP/XjP0lNlcVUKFq16gY2v+SBck0
 rlEFTS4/ZYMukW0L5f3LivUDeJJmw/ZN3Ye7ZWMqDqQ0hSdtUt00BPr+xRdIyqp4LQ4R
 7PNA==
X-Gm-Message-State: AOJu0YznpZGrzbyF2WL0OKVcRK3nKiiJPnS/szKQozwjq3gFeScuXcGx
 bDCNwd+swWV5abDVJNb6eU4FzSE24qgPnAZnPiTS+w4h
X-Google-Smtp-Source: AGHT+IG/iXs7GTx37MxQeuzpQDsiZtbcPMvlvh8o9LluHkkNkJpAPUd/ZYa3YUFJwydWP9OpBZgffw==
X-Received: by 2002:a05:6402:1610:b0:525:5886:2f69 with SMTP id
 f16-20020a056402161000b0052558862f69mr13830550edv.36.1692901422810; 
 Thu, 24 Aug 2023 11:23:42 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 be20-20020a0564021a3400b0052a1d98618bsm35975edb.54.2023.08.24.11.23.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 11:23:42 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-3fef2fafee2so14745e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 11:23:42 -0700 (PDT)
X-Received: by 2002:a50:a6d4:0:b0:525:573c:6444 with SMTP id
 f20-20020a50a6d4000000b00525573c6444mr12956edc.1.1692901047044; Thu, 24 Aug
 2023 11:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230824181546.391796-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230824181546.391796-1-biju.das.jz@bp.renesas.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 24 Aug 2023 11:17:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W20En+k_FhakGVEFQTSPAUujJhB-UE0SyEK67nLgVVWg@mail.gmail.com>
Message-ID: <CAD=FV=W20En+k_FhakGVEFQTSPAUujJhB-UE0SyEK67nLgVVWg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge/analogix/anx78xx: Drop ID table
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Guenter Roeck <groeck@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Aug 24, 2023 at 11:15=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> The driver has an ID table, but it uses the wrong API for retrieving matc=
h
> data and that will lead to a crash, if it is instantiated by user space o=
r
> using ID. From this, there is no user for the ID table and let's drop it
> from the driver as it saves some memory.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Updated commit header.
> v1->v2:
>  * Dropped ID table support.
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 7 -------
>  1 file changed, 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Unless there are objections, I'm happy to apply this late next week to
drm-misc-next.

-Doug
