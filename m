Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F92D9AF421
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 22:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E0210E9A1;
	Thu, 24 Oct 2024 20:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="j9HGgmTH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280D810E9A1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 20:54:06 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a9acafdb745so271270866b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 13:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729803244; x=1730408044;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MylHOwKXaTo3xQDXg/sSZOBifyCTeLdawXaFYKq87vU=;
 b=j9HGgmTHtT4UiJe+M9idSCMnfN6KBEoXtSws4gWiIjKvoPKElpAn+D3jjIkzgleSHD
 5Ou1stv8Ll7BIDF2iUQa5fYBbsUzZLv91EoV0zn3PBas/S2OcAtclog9gFxsMIGsgTkf
 XvMsib3vCJhpEAzVFeB7kW1Ha7w+SRqYm7SGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729803244; x=1730408044;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MylHOwKXaTo3xQDXg/sSZOBifyCTeLdawXaFYKq87vU=;
 b=aK/pDHDV5z3/yzwVs6ReFkwScFDMtgAb2Y14MWUxYJu3OgNCsefXmkshmk72FuZeLS
 LznF/g3UGnF+jqWFv0IwYdWnEXDb2t0Mew5MbYrGcJTpA66h4JZYLVVxgzQONt92B6gL
 Sxu+uBIC1I/kaQOf3qZRNyHSZ3RxAcENKvoY1PLQJNid6oWJlztPYJhUb7CGFIbGm/mf
 9VDrarYnXJ4bFtHb7f/zdpenSBRRrDAozgDVT7gORz5rpBvg3uX1xJf2W/KMhzQs9L4O
 Hu8uJKkgq3kA5u21vhHlUi2Fjf5zIJO9wM+WdNHMjaqfiQAJ5wuD6Q69uDxnI79SNEQR
 woIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhYsEOFCq/RFkiPrRCtM7/FFBFFyESa7Wb+MZMzoAMhTbuGFnsieG7OSGBtP9nRlgoCM+6zUDDZgA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5y+OidRE7SIvZ89O/Ss/ZIz6ysTw9/ClYQ55f2b/AimZiAsWK
 V8iwTp4atAnkmPIvMSIlCg8Bu3bJcTtX4+zHmu9Q5hIrZan93OycjdjD0eXHKRNAx2zI3Ptvl1N
 zxZDb
X-Google-Smtp-Source: AGHT+IHOXC1Houijj4N5qp2pJXNJ/5uTQMIeW4Q+6NGDsxf50oeuQIJ3gMwG44KQvazXPpq3HbhizQ==
X-Received: by 2002:a17:907:9343:b0:a9a:a3a:6c48 with SMTP id
 a640c23a62f3a-a9ad197af17mr347793966b.2.1729803243527; 
 Thu, 24 Oct 2024 13:54:03 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91370ff9sm661710966b.113.2024.10.24.13.54.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2024 13:54:03 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so2758357a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 13:54:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUVjE/InXxGCTsN9rMvN7Yv8TWBxoKX0mhnT/c1Cu1V3Yzv5zUetPFCeaG0SHcZz96jfDCOcV8NwRk=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3b8e:b0:53b:205c:e9ac with SMTP id
 2adb3069b0e04-53b2374a94fmr1177376e87.20.1729802881828; Thu, 24 Oct 2024
 13:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
 <20240620-igt-v3-8-a9d62d2e2c7e@mediatek.com>
In-Reply-To: <20240620-igt-v3-8-a9d62d2e2c7e@mediatek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 24 Oct 2024 13:47:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTsPBQ7Qp_oQmBXkNY==KQWZdN7VYbuVPoBTHhMvzjUQ@mail.gmail.com>
Message-ID: <CAD=FV=XTsPBQ7Qp_oQmBXkNY==KQWZdN7VYbuVPoBTHhMvzjUQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation
 property
To: shawn.sung@mediatek.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, 
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, 
 Mao Huang <littlecvr@chromium.org>, "Nancy.Lin" <nancy.lin@mediatek.com>, 
 YT Shen <yt.shen@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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

On Wed, Jun 19, 2024 at 9:39=E2=80=AFAM Hsiao Chien Sung via B4 Relay
<devnull+shawn.sung.mediatek.com@kernel.org> wrote:
>
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
>
> Always add DRM_MODE_ROTATE_0 to rotation property to meet
> IGT's (Intel GPU Tools) requirement.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  6 +++++-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 17 +++++------------
>  drivers/gpu/drm/mediatek/mtk_plane.c    |  2 +-
>  3 files changed, 11 insertions(+), 14 deletions(-)

FWIW, this patch got into ChromeOS's 5.15 branch via stable merge and
apparently broke things. As a short term fix we've reverted it there:

https://crrev.com/c/5960799

...apparently the patch is fine on newer kernels so maybe there is a
missing dependency? Hopefully someone on this list can dig into this
and either post the revert to stable 5.15 kernels or suggest
additional backports.


-Doug
