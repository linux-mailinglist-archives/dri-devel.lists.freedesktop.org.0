Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0207CDD24
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 15:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7295C10E3D9;
	Wed, 18 Oct 2023 13:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE1710E3D9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 13:25:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DDD8CCE2528
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 13:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21664C433C9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697635498;
 bh=y7R3Xc7b/dDNyN2IeFpAjUBAw7DegSFH5XvMPARiVk4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HqRRQnvPK9Llpsr83E0oTzhy/MdvDrNQkXWi1wfdt0swbneeg0G4qXpRNX0H2YOU8
 2s/GzaMVN5v/JizxnGYjamOybkFMBWCSqMvH1s0EJKOBdkW0BIVnuibasbKNkxp2r1
 Iwxr32Ep7jAMWk7Ii3r6oIFRubLOCdh50Mf2Bosg/+LM93+ZMNIQipIqrP4OpQuQVB
 YQyqyXkE6wzhg/dconNrBQ1Mq6EzoUgRspIbWiMlvHn+DTtkk3XDou8f58qRH3rApf
 FyJxSaDGH60zhVh5e+mCRFTEy1EmvbeeNGHgX7nXeq0waUYlQmVvdYKcmnHdCOhX0X
 mdU01qZUKbTJw==
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2c54c8934abso3002361fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 06:24:58 -0700 (PDT)
X-Gm-Message-State: AOJu0YyqOiGwUVtHVZKiSZq3iEXQjOZj3h1wuw+A+hf8nMeC9yb8LSgz
 DiLfGswjo3X/F9BGIAEIaQjcUQbwzIZ0qmNJ2A==
X-Google-Smtp-Source: AGHT+IE2erweQk78p2WZGcYNeJzi7UyNstiTigaugME3+3bf0yEm/om0FbaNsQp91jAtR+tU1eTO2SwDaQRNiTjDk+0=
X-Received: by 2002:a2e:9457:0:b0:2b9:4b2e:5420 with SMTP id
 o23-20020a2e9457000000b002b94b2e5420mr3825894ljh.52.1697635496365; Wed, 18
 Oct 2023 06:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
 <20230915101124.283232-1-mwalle@kernel.org>
 <54a04d22-7ec1-473b-ab57-f6339b2cc782@collabora.com>
In-Reply-To: <54a04d22-7ec1-473b-ab57-f6339b2cc782@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 18 Oct 2023 21:24:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_85g9bvVDUqK3ePd+7cWvqmVU4zRb=f4QxU_=A9eZaEpw@mail.gmail.com>
Message-ID: <CAAOTY_85g9bvVDUqK3ePd+7cWvqmVU4zRb=f4QxU_=A9eZaEpw@mail.gmail.com>
Subject: Re: [PATCH] drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET
 settings/handling
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
Cc: chunkuang.hu@kernel.org, Michael Walle <mwalle@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 jitao.shi@mediatek.com, shaoming.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2023=E5=B9=B410=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:=
21=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 15/09/23 12:11, Michael Walle ha scritto:
> >> Due to the initial confusion about MIPI_DSI_MODE_EOT_PACKET, properly
> >> renamed to MIPI_DSI_MODE_NO_EOT_PACKET, reflecting its actual meaning,
> >> both the DSI_TXRX_CON register setting for bit (HSTX_)DIS_EOT and the
> >> later calculation for horizontal sync-active (HSA), back (HBP) and
> >> front (HFP) porches got incorrect due to the logic being inverted.
> >>
> >> This means that a number of settings were wrong because....:
> >>   - DSI_TXRX_CON register setting: bit (HSTX_)DIS_EOT should be
> >>     set in order to disable the End of Transmission packet;
> >>   - Horizontal Sync and Back/Front porches: The delta used to
> >>     calculate all of HSA, HBP and HFP should account for the
> >>     additional EOT packet.
> >>
> >> Before this change...
> >>   - Bit (HSTX_)DIS_EOT was being set when EOT packet was enabled;
> >>   - For HSA/HBP/HFP delta... all three were wrong, as words were
> >>     added when EOT disabled, instead of when EOT packet enabled!
> >>
> >> Invert the logic around flag MIPI_DSI_MODE_NO_EOT_PACKET in the
> >> MediaTek DSI driver to fix the aforementioned issues.
> >>
> >> Fixes: 8b2b99fd7931 ("drm/mediatek: dsi: Fine tune the line time cause=
d by EOTp")
> >> Fixes: 2d52bfba09d1 ("drm/mediatek: add non-continuous clock mode and =
EOT packet control")
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >
>
> Hello CK,
>
> can you please pick this fix?

Applied with the changing

Fixes: 2d52bfba09d1 ("drm/mediatek: add non-continuous clock mode and
EOT packet control")

to

Fixes: c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register definition=
")

Regards,
Chun-Kuang.

>
> Thanks,
> Angelo
>
