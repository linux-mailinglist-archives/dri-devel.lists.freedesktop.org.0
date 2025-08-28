Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC4BB3AE94
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 01:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE37310EB02;
	Thu, 28 Aug 2025 23:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lUM2trqD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B871610EB02
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:50:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 53CFC45084
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED55C4CEFA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756425014;
 bh=zsWCFAyMsxiaMzTEC3Gr3yuzGPTx6B+vy48OAuN/rqM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lUM2trqD6QlWxEbRGcHnWfAT2Dw6TF/vTGWJnBm3Lnj48ttau7a9jzrHNOqTDhcjd
 z0sB8EwOiczyD7iNgthyhi+Omu58xYralkqysW54YfQUTMuDqO0gi4j3uDXLV7e9mQ
 FbKlQ3XrVF/6gGwwfiZ644bMQa8Oic2wG/g1Tli3VZN7dnZo8Gu//4PtFB4tKfKJQp
 GZmG92gVtfuLoaQ61eXYr1rAjQyOuOlM1DjxMw7CWiyTciFXlf1Jxu7lP/0h0TJPKQ
 EVtNBY9OIA/EIuO9l5ZsrmiXSoyeQID06KOCFP8BQj6VWd3urFpHeywTWuGvXNF6pa
 10ECT7tdBeZSw==
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-323267872f3so1421997a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 16:50:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVzpro36jqdi/HKrTX3L9M7OTpxvga3/16iLw8ICrwM+xU4KjHt1ehgBawXit4nWKE8gEPd4AsLrv0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHF9Q1iAkHTqahfT+WxUmaKABtscZ5pcEDMim/npWSM7L9b4zB
 MwCfgjV6rZwqChCD4sw8QTdoXBQE21i7ua8V/HcyORyCrx22v0F73P+E4cutPiRDOPekItSKYP5
 1oEXywdbVVOBtBIMOvb45Ad2EbVqeEQ==
X-Google-Smtp-Source: AGHT+IEyPrn2mauZsphfR5LkJf3knFAASu6dleEuuWgWtdTpwoFH8h3V5JmRW8ZSNdzaXyzRk8Y/2ADMz9Ym8II8Udk=
X-Received: by 2002:a17:90b:384c:b0:325:57fc:87ce with SMTP id
 98e67ed59e1d1-32557fc89damr26677996a91.9.1756425013709; Thu, 28 Aug 2025
 16:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250722092722.425-1-johan@kernel.org>
 <aK7VCJ9yOKntjgKX@hovoldconsulting.com>
In-Reply-To: <aK7VCJ9yOKntjgKX@hovoldconsulting.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 29 Aug 2025 07:51:23 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-CijzQqrRUf_=cQbTUSybN3GT46q0vx1139mmZub_OfQ@mail.gmail.com>
X-Gm-Features: Ac12FXy2kPL9Itx_6-_TK8BzHuWR2wBjPXyw4so4ACn3LaV_swD9vLFI7S9ZLJk
Message-ID: <CAAOTY_-CijzQqrRUf_=cQbTUSybN3GT46q0vx1139mmZub_OfQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: fix device leaks at bind
To: Johan Hovold <johan@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 "Nancy.Lin" <nancy.lin@mediatek.com>
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

Hi, Johan:

Johan Hovold <johan@kernel.org> =E6=96=BC 2025=E5=B9=B48=E6=9C=8827=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Jul 22, 2025 at 11:27:22AM +0200, Johan Hovold wrote:
> > Make sure to drop the references to the sibling platform devices and
> > their child drm devices taken by of_find_device_by_node() and
> > device_find_child() when initialising the driver data during bind().
> >
> > Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 mult=
i mmsys support")
> > Cc: stable@vger.kernel.org    # 6.4
> > Cc: Nancy.Lin <nancy.lin@mediatek.com>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
>
> Can this one be picked up?

Ma Ke has sent a similar patch [1] before you. And that patch fix more thin=
gs.
I've already pick up the final version [2].

[1] https://patchwork.kernel.org/project/dri-devel/patch/20250718033226.339=
0054-1-make24@iscas.ac.cn/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
commit/?h=3Dmediatek-drm-fixes-20250825&id=3D1f403699c40f0806a707a9a6eed3b8=
904224021a

Regards,
Chun-Kuang.

>
> Johan
