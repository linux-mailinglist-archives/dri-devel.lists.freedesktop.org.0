Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A39D787784
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 20:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA2010E5A0;
	Thu, 24 Aug 2023 18:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE6B10E5A0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 18:12:27 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-5298e43bb67so382606a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 11:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692900746; x=1693505546;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4GfcWh6x1HosL+RT76H/1NldrglLzyYkGU3K8IIi0sw=;
 b=LFMmB3x6GpZhoXO3l4UK8HbKWPgd4a25QooY6DfBV0Tvz0PnaAwbkL8OPLq1a+0xU8
 c8KqCNTMj8dkfFb+t1J7ODDalfGZss18kG/fTWU7Wtl08NBQG43zWcEsaY3h4LMQHhbM
 BMmV2qqUb0TQbmlVl6xy7FeNT3ZeufAr4Nh9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692900746; x=1693505546;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4GfcWh6x1HosL+RT76H/1NldrglLzyYkGU3K8IIi0sw=;
 b=Guo0l1CqZZXMkufhbliqowY5M9szECJb3l/9eI6/bhU3hFKQi51o6Nw6OcRzyVENsO
 x/uLLQkzclfYBdbwZKATfc8ybs4rdkC1SlX10o8PaHVX4uweBF2UFNOD6kxyFTAw2bQ3
 bBMxer5BqeX80Saw8gWI1/50Mz8rLjGE733B7KzZKZWdfVHmwmaKUI/FGGQibBGglauv
 yIdGfq19uk+mPKhYeL8qGjzTDyHKLIhKYhSJg8blotD8H1i4SkG2ErggJ0VWlwuGKgSU
 EiLk7LHTnTJHb/CsgO6lFoAKELk2Ge4NJ75llY9U5FAz7DyASFSLGdSvdoZLhfh28JUi
 cwrQ==
X-Gm-Message-State: AOJu0Yxymjx4dhSVxsrUOg/LtB9LGrXBF/wIEqeBNgixzbIXrz20k3Va
 UaZ/XstFlTWaG3iew7w7c9zrU/qt+yZt9fZiyO3UbIBNcj0=
X-Google-Smtp-Source: AGHT+IHcDDsGhlK6kMznzIljUBpa+xOY3qfsoKVbLNIVvlTy3jUis2sPgCLNR45dzQal80gDBssUXg==
X-Received: by 2002:a05:6402:40c8:b0:529:d147:e9f3 with SMTP id
 z8-20020a05640240c800b00529d147e9f3mr19379211edb.5.1692900746183; 
 Thu, 24 Aug 2023 11:12:26 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 a18-20020aa7d752000000b005233f2635fbsm25873eds.21.2023.08.24.11.12.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 11:12:26 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4009fdc224dso11675e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 11:12:26 -0700 (PDT)
X-Received: by 2002:a05:600c:3b02:b0:400:46db:1bf2 with SMTP id
 m2-20020a05600c3b0200b0040046db1bf2mr18583wms.2.1692900745735; Thu, 24 Aug
 2023 11:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230824181030.389643-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230824181030.389643-1-biju.das.jz@bp.renesas.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 24 Aug 2023 11:12:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XcNwHyhgq1wYqtSXnq05JXp6dw_MD2rhEPH3FxR+0=hw@mail.gmail.com>
Message-ID: <CAD=FV=XcNwHyhgq1wYqtSXnq05JXp6dw_MD2rhEPH3FxR+0=hw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
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

On Thu, Aug 24, 2023 at 11:10=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
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
> v1->v2:
>  * Dropped ID table support.
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 7 -------
>  1 file changed, 7 deletions(-)

Patch ${SUBJECT} needs to be updated to match the change from v1 to v2.
