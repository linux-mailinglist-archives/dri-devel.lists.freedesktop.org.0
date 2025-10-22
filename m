Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07CDBFC414
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 15:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E8910E78B;
	Wed, 22 Oct 2025 13:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WvqXYva6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DF810E78B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 13:48:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3C3B648265
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 13:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22225C4CEF5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 13:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761140883;
 bh=jbBJWUa2D5mD4FO+YopVcu+7lzL7qETV1oQuE65ZYas=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WvqXYva6pkQEoRMq5LvT+1+kG7B1Kz3PS02C1kUmogBm+k2sURFt38z6U9PPVW78p
 eDhGToTKrnnX79xe4DaP20mVy0Q0HozDY+D6ackoKN/oJg8N7w+BOkoUbOpE02PrCj
 go3SZVQq44RBgnGlCmKuFWNhqXWMmS/yzSePWuvXIvcxPE8XyNlGI8JS9cStg1O72W
 D3VWhcUPE5mDtWalOrZEfvMuUsBfb8u/+vSZvv8weiP9E6zyiaJeVjgYXvpzum49V8
 yIPutGD06uxQzesDA77BHQ4Uj0fUPOX9wYv4n9ycS0vsk61OthhucDnBKJHUqtUw01
 NJHEw1hLMo9VA==
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-33082c95fd0so6932787a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 06:48:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW6AkW/5I/maDC7OELoU9xprsHnugWx0koKLbs3gLXFqrKNLGEGAIUJ9OIBAAAcTO9JHkTLy5C8ADs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+DCtov12c4vxqG3aI6fUnQs1yKE/3yxdeHubfxRl4Lgv08cZA
 pG7Si5o0tEUIVsUs0/F7BWqz4upSXYrvL+D5qGVxi+YzcUQFy3OADzIPReTy/8Yh7ekuKhktV+3
 g6xZsJLI6PfVg1FvGYTb8wzKuxo9gVQ==
X-Google-Smtp-Source: AGHT+IFy1XRD8bUn3Ht+foWFb4onBy3I0BzeduV4i7PqazihqftsGN1m+bW8yLWYlxF6eUIqhNEGG1eW7HknFBsv3Jk=
X-Received: by 2002:a17:902:f552:b0:290:6b30:fb3 with SMTP id
 d9443c01a7336-290c9ca32eemr287339455ad.16.1761140882431; Wed, 22 Oct 2025
 06:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250808-mediatek-drm-hdmi-v2-v10-0-21ea82eec1f6@collabora.com>
 <20250808-mediatek-drm-hdmi-v2-v10-4-21ea82eec1f6@collabora.com>
In-Reply-To: <20250808-mediatek-drm-hdmi-v2-v10-4-21ea82eec1f6@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 22 Oct 2025 13:47:50 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8-W8XRsTFDKH69BRA=hurgZ2KOHeBDnixL-LgHObqhXQ@mail.gmail.com>
X-Gm-Features: AS18NWDLymwzfszmU7JKmhTu0CgDInQdk-IxVHYP20sloO1fgKFGR0uo2gWdNLY
Message-ID: <CAAOTY_8-W8XRsTFDKH69BRA=hurgZ2KOHeBDnixL-LgHObqhXQ@mail.gmail.com>
Subject: Re: [PATCH v10 04/10] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
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

Hi, Louis:

When I apply this patch, conflicts happen.
Please rebase this series base on latest kernel and resend these patches.

Regards,
Chun-Kuang.

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=B9=
=B48=E6=9C=888=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8810:13=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com=
>
>
> In preparation for adding a new driver for the HDMI TX v2 IP,
> split out the functions that will be common between the already
> present mtk_hdmi (v1) driver and the new one.
>
> Since the probe flow for both drivers is 90% similar, add a common
> probe function that will be called from each driver's .probe()
> callback, avoiding lots of code duplication.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/Kconfig           |  11 +-
>  drivers/gpu/drm/mediatek/Makefile          |   1 +
>  drivers/gpu/drm/mediatek/mtk_hdmi.c        | 539 +----------------------=
------
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 428 +++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 188 ++++++++++
>  5 files changed, 633 insertions(+), 534 deletions(-)
>
