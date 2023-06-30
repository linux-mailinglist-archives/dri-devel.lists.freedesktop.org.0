Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5CD743670
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 10:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F67310E19A;
	Fri, 30 Jun 2023 08:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AF310E19A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 08:05:02 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-57040e313c5so23637557b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 01:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688112302; x=1690704302;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pOdCefwt7Ax9Hfvkk8Lveq+Ut2f18HISZZW5KXVicfQ=;
 b=kbBM1+oxUiXvU2/QQFm7kB6GyiMo7U1iOTgdHUVThD4ymFZhGi/+nIX9hb984D/xvh
 30cJBDNZXVKpVfTZYvtdZjQAlUHrdL3tcXVzFTX6le+fj7HMu2t//8PLwZbkuP3afiK+
 2bSz1dvdgQ07H9PimEwNYDR44LMTPO0YIMVqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688112302; x=1690704302;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pOdCefwt7Ax9Hfvkk8Lveq+Ut2f18HISZZW5KXVicfQ=;
 b=ZaxSlntk7qJCkrdHkiTnGfnWM5MjvnEt/LxBvG6hYa4qMZX9GB4dlTYHOLw212a+gB
 ASmMrx78DngepTKJF2/BkHPlVSfViuFfd6L/tpZb6i2BSMNwVeOhqq5j7vQXefUL8NFR
 xuinPmiW+/+F7KCHfiuTy0LJYNuigEo8BM2sQIvvLVCRzi4yb66cv8wMDeG0eCKkaZOI
 RiITsl/cOBzVK9Qp/arx6ylr3zA9OPk21Ws63w7KjFzHy1BLTbvCaOll0Kjwk0KKkjI5
 ED11krjIy8fnw3dcma1LLTQWpgZL2/iH9YVaVVEuSft2kuS4vtFxhosIF/B9w8WkcEqZ
 ZAEg==
X-Gm-Message-State: ABy/qLY0bfp5DXfwpAC3pS9afhTt78CbA3ZCl9MCugv28HaKAAAv/MDX
 WbWkG3uhegeOMrSoJ6XuDCdQznHPta9Fda2D+n3SjQ==
X-Google-Smtp-Source: APBJJlGfwrmUqIda2skUGU7hqigqtdnfU9GNaAVk+AXsXmSBI2V2PRXoa6/XQ30k0k0b7dVMI7HqfKm1hGeUq+R4sf4=
X-Received: by 2002:a0d:ea4e:0:b0:56d:a5a:3c00 with SMTP id
 t75-20020a0dea4e000000b0056d0a5a3c00mr2168518ywe.17.1688112301984; Fri, 30
 Jun 2023 01:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230615201511.565923-1-marex@denx.de>
In-Reply-To: <20230615201511.565923-1-marex@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 30 Jun 2023 13:34:50 +0530
Message-ID: <CAMty3ZCkYUc1Cgrom=D-UyR8OF+ihfxQEpgHSDYu7tmZNaRi_Q@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Drain command transfer FIFO
 before transfer
To: Marek Vasut <marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 16, 2023 at 1:45=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> Wait until the command transfer FIFO is empty before loading in the next
> command. The previous behavior where the code waited until command transf=
er
> FIFO was not full suffered from transfer corruption, where the last comma=
nd
> in the FIFO could be overwritten in case the FIFO indicates not full, but
> also does not have enough space to store another transfer yet.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # imx8mm-icore
