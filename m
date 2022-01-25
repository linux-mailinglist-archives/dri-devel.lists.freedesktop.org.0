Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0794949B8E1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 17:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB91F10E16C;
	Tue, 25 Jan 2022 16:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD0F10E16C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 16:37:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2F066B818DD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 16:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF657C340E0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643128667;
 bh=0SbnCeCphRYqlsxXfeUWz/qWyG7bTyCBGzOjbuAH5Dc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kas93vxnomB9K/mg8TyNMZBdnWE9JvAlLbUL8hFQcRMAj7o3cLGdcgCkIbeB+jaKB
 go6AyfxNQshDfsuQs6d5ADtxp3NOI73ejOYZIRgI85jY/JZyPKo9WRXLnxft0LOBJb
 ioHbT13aDkONdbxaDyYFYOhtvGpnwCuSRfyljQvv1jUzo7uBIFsIEyG/NZVNPeNS5J
 cbhU9VJTHvFPxtqmNRqFReSnScVKgr6dNftPn2iunNDv8G3+AjZPaFeWs9VBOhetnS
 oiV6BkrB8p5KxHXfVl0gQiDnNud16x675MTAYaJ0FvuGcrxi9qDyza9R1PsCpLjHIw
 0nF0HVIiuENag==
Received: by mail-ej1-f43.google.com with SMTP id jx6so31759442ejb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 08:37:47 -0800 (PST)
X-Gm-Message-State: AOAM530aeqYF432JjrraikOp8L1XB5lbe1ClouwbV+pgByW3jivYEjHP
 5j/FlFqP1KKF/Fbd0eFBKbcoz/iru54I+NIG5w==
X-Google-Smtp-Source: ABdhPJxyyAYvHJMTL8SDODd9IBTgr3px6W8UcKYtqPJCptQLpuAelZlyNXECnWKkBdpovGOEJAhz1LMK0H+6WpZ6lAM=
X-Received: by 2002:a17:906:6c1:: with SMTP id
 v1mr16523116ejb.638.1643128666268; 
 Tue, 25 Jan 2022 08:37:46 -0800 (PST)
MIME-Version: 1.0
References: <20220118133759.112458-1-angelogioacchino.delregno@collabora.com>
 <20220118133759.112458-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220118133759.112458-2-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 26 Jan 2022 00:37:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9PTK1HoHruvX_6n010aADA5_Rd72TFTMsn4hrH8dts=A@mail.gmail.com>
Message-ID: <CAAOTY_9PTK1HoHruvX_6n010aADA5_Rd72TFTMsn4hrH8dts=A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: mediatek: mtk_drm_crtc: Use kmalloc in
 mtk_drm_crtc_duplicate_state
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

Hi, AngeloGioacchino:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2022=E5=B9=B41=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:4=
1=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Optimize mtk_drm_crtc_duplicate_state() by switching from kzalloc() to
> kmalloc(): the only variable of this struct that gets checked in other
> functions is `pending_config`, but if that's set to false, then all of
> the remaining variables will only ever be set, but not read - so, also
> set `pending_config` to false.
> This saves us some small overhead.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 09fc9ad02c7a..f536a0a927e4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -185,7 +185,7 @@ static struct drm_crtc_state *mtk_drm_crtc_duplicate_=
state(struct drm_crtc *crtc
>  {
>         struct mtk_crtc_state *state;
>
> -       state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> +       state =3D kmalloc(sizeof(*state), GFP_KERNEL);
>         if (!state)
>                 return NULL;
>
> @@ -193,6 +193,7 @@ static struct drm_crtc_state *mtk_drm_crtc_duplicate_=
state(struct drm_crtc *crtc
>
>         WARN_ON(state->base.crtc !=3D crtc);
>         state->base.crtc =3D crtc;
> +       state->pending_config =3D false;
>
>         return &state->base;
>  }
> --
> 2.33.1
>
