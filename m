Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1069531AA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 15:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A824310E3E1;
	Thu, 15 Aug 2024 13:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DaPmhwBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A0B10E3E1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 13:56:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E3F64CE1C8D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 13:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28EEC4AF13
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 13:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723730215;
 bh=pNzAuHuhw5vFj0MfUJcfnnwgyE2OQGAdmeyHX+UNaD4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DaPmhwBlEUrM/uGlSuvQkk2mh69hNGpN3oP0zLSuu4YAZAzR4D8aC2ZIcAvzlNQLr
 TKegh9YnwSlgdfXVJXTVxMs/EDzX6qV4Ssxp2LMUz4bgwuKfoNmvcczsng8Na4ZpGJ
 LYncOTQnQp7swLnA6FCPHVtRBkq1LSxkehOTEI61CKit6QLrxbEgrE6AhMhs2ET97Q
 NwlTi/+tj10fBRStqSZv3MnAIGe4CM2S1h2kOKMCEprJjcAbtiKWPpnuO+RB0u8LZa
 0F0BPI2p8oxY/tShm1OCxw6z9kRmx4reVienSJTiRThdFZaarVJCtLlJDZhqZlLnPL
 9/YiktCVJGk+A==
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2cb53da06a9so640577a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 06:56:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXmWJ4nXc5Jrev8NXHMHja/P/FiSyFG7Q60dPIwsu2HIDyeog/FJHQDFvB1Wxi2zAu4u7ysET7TBo3YTsHY9JI0jm5JrzE84PAxWepEyWsv
X-Gm-Message-State: AOJu0YzCZPlybyMVIc8kWajb3WLGLACQFQpyctqns/ppV6ik94fOrBBy
 Q0FrHx4ketiXwQyI6IaPHTnxefuWMjEd57LRF4K1Owc+ELk6XbromoJNaecuhW5Z6whpPUz2Vxp
 1aKcAMvxIkk4rgzS5YsMghgoyqg==
X-Google-Smtp-Source: AGHT+IHF8lihSFvFy146V9RFDKmET4UMbp4dFKkjYWDYSa8MfftqgIMB+sTB/uU6Rl3c42kHJSnavDM+yFIZjN3/ZEk=
X-Received: by 2002:a17:90b:230d:b0:2d3:ad41:4d7a with SMTP id
 98e67ed59e1d1-2d3c391157dmr4796664a91.4.1723730215112; Thu, 15 Aug 2024
 06:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
In-Reply-To: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 15 Aug 2024 21:57:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY__EAW-Tj93oSnN1TTB0sH3VMnHwwRaVv-Nm7cEGBeuvcQ@mail.gmail.com>
Message-ID: <CAAOTY__EAW-Tj93oSnN1TTB0sH3VMnHwwRaVv-Nm7cEGBeuvcQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/mediatek: fixes for ovl_adaptor
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
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

Hi, Javier:

Javier Carrasco <javier.carrasco.cruz@gmail.com> =E6=96=BC 2024=E5=B9=B46=
=E6=9C=8825=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8812:44=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> The main fix is a possible memory leak on an early exit in the
> for_each_child_of_node() loop. That fix has been divided into a patch
> that can be backported (a simple of_node_put()), and another one that
> uses the scoped variant of the macro, removing the need for any
> of_node_put(). That prevents mistakes if new break/return instructions
> are added, but the macro might not be available in older kernels.
>
> When at it, an unused header has been dropped.

For this series, applied to mediatek-drm-next [1], thanks.

Regards,
CK

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Javier Carrasco (3):
>       drm/mediatek: ovl_adaptor: drop unused mtk_crtc.h header
>       drm/mediatek: ovl_adaptor: add missing of_node_put()
>       drm/mediatek: ovl_adaptor: use scoped variant of for_each_child_of_=
node()
>
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> ---
> base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
> change-id: 20240624-mtk_disp_ovl_adaptor_scoped-0702a6b23443
>
> Best regards,
> --
> Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
