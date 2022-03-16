Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC60E4DB483
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 16:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BFA10E64C;
	Wed, 16 Mar 2022 15:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E05F10E647
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 15:12:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D934615E1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 15:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1B2C36AE3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 15:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647443571;
 bh=VE2DXOOKaALNyxqEYAqcoNhJQKuXktb8DsEEEWfPm7o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oCX68D9wEM8MvGW4hb57YAovriw4woglHyo8ypN2hogZPfIM1X5BLPhsyEHQrIe/C
 4oZtCtKADSf9WH4hvAIfqOzVjBYeHqxZvFU9UWGE8l+g/bXCQ9dHrKETZScv1VkC/P
 um5J0EsF6Y3zm7N9yXa6S1JWFUlnQa0BDTxRSyHpUqp1TlNkG96k65QCJD/TUPPNEl
 rRVWGzcRlNiId83N21mAe8ABvO/J+fmtjubV2rWW9i2iJS4lKIDFZA+pUsoKq/Ld2Y
 9EYN8PooW9ZNlBjk1I+Zc8mkLDhm/7GTQzt5Y8XV9P5BbJgA0ET5lE0EdZzqTcHb4N
 4HT/BIVJR75Rw==
Received: by mail-ej1-f46.google.com with SMTP id bg10so4881012ejb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 08:12:51 -0700 (PDT)
X-Gm-Message-State: AOAM53355CQ2TJySL7xk3rJuPUtAtbxsl2MXEijA6r68vLmcqIA5ZBvm
 84ybgEN8ZT5ZZgzqB+rHv/P6txzrz8lHqDPOEg==
X-Google-Smtp-Source: ABdhPJxH6AKaRwRhd04EuZiQxCRbgcOf0ZjvjbnJCf4qreX1Iy/cGxh/T+kaHO+5f78cTLXQ26lxsW6xxxAaU5Wqgzo=
X-Received: by 2002:a17:906:3583:b0:6d1:c07:fac0 with SMTP id
 o3-20020a170906358300b006d10c07fac0mr312656ejb.749.1647443569882; Wed, 16 Mar
 2022 08:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220118133759.112458-1-angelogioacchino.delregno@collabora.com>
 <CAAOTY__59-tYZNAQqFytdZgAYs+hmFxHUrF1FAj4zphiguv12g@mail.gmail.com>
 <e4b16e67-ccb5-78d1-bbbb-a4a7f82b7c11@collabora.com>
In-Reply-To: <e4b16e67-ccb5-78d1-bbbb-a4a7f82b7c11@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 16 Mar 2022 23:12:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-3zZvu32gWeactYOfDX4i3O6HhPcZp1XHCvAPDZU1a+A@mail.gmail.com>
Message-ID: <CAAOTY_-3zZvu32gWeactYOfDX4i3O6HhPcZp1XHCvAPDZU1a+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: mediatek: mtk_drm_plane: Use kmalloc in
 mtk_plane_duplicate_state
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2022=E5=B9=B43=E6=9C=8816=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:4=
0=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 25/01/22 17:36, Chun-Kuang Hu ha scritto:
> > Hi, AngeloGioacchino:
> >
> > AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =
=E6=96=BC
> > 2022=E5=B9=B41=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=
=889:38=E5=AF=AB=E9=81=93=EF=BC=9A
> >>
> >> There is no need to zero out the newly allocated memory because we are
> >> duplicating all members of struct mtk_plane_state: switch to kmalloc
> >> to save some overhead.
> >
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> >
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >> ---
> >>   drivers/gpu/drm/mediatek/mtk_drm_plane.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
>
> Hello,
>
> this series was sent and reviewed two months ago, but it hasn't been pick=
ed
> in any maintainer tree.
>
> This is a friendly ping to not let these two patches to be lost and forgo=
tten.

For this series, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Cheers,
> Angelo
