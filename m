Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D8A67DA63
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 01:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F2B10E0D4;
	Fri, 27 Jan 2023 00:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9722110E0D4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 00:13:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E1822619C5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 00:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E51C4339E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 00:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674778381;
 bh=Dy2e0MZ3sBbbfQ1uJYMvKeZWrpufgehg6WjJ7Pz8zps=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y7VWTZHhu/NF7whDsrUsV7nhgna6BF9j9//ltrDZmUOizcuCspsdmQYYxA1ffKS3v
 1w5lJ/nimN3bp3F+uqjfNahY+wAv3Qt07i/Zahr+2PG6ZkdyrbP2KHL3FgNlr8SevZ
 /0xzOTNvuLNkkV06cnPRnJB7oIhnjhROzH4qa+LnBj8zZEw/gESXjB0UO9rIpwPoQg
 Gv+DVI/5wVA8QHALuuKmx/0ul2wjOEx40B3UlCmdgY69InTvfNA0SOklowRcWgDI+l
 mkVKMhXdWYcmLs27UT22/UtS79SInCkjhx/KtUd+dfucIvAb99EBu/Sd6iaapYm4of
 nzZMP1vfP9a9w==
Received: by mail-lj1-f172.google.com with SMTP id y9so3853838lji.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 16:13:01 -0800 (PST)
X-Gm-Message-State: AFqh2kpRxYnXjeyNnafraYHcV/3VS0l1nWOhDW3aE9+oz3EdMBOJNtu5
 J+w7V++AveCA7NgxPWSuG3YBO3bDyMa5T3vVsA==
X-Google-Smtp-Source: AMrXdXu3+25tG1AX0tTAw3NUXePsMdfOctSjTiPoTIR7dx8NyyD2yH5l7oUNVibnGbCskGPI5hLrYcA5NRyzuh0kmsg=
X-Received: by 2002:a2e:bd13:0:b0:287:4eeb:53dc with SMTP id
 n19-20020a2ebd13000000b002874eeb53dcmr2191832ljq.27.1674778379356; Thu, 26
 Jan 2023 16:12:59 -0800 (PST)
MIME-Version: 1.0
References: <1673330093-6771-1-git-send-email-xinlei.lee@mediatek.com>
 <1673330093-6771-2-git-send-email-xinlei.lee@mediatek.com>
In-Reply-To: <1673330093-6771-2-git-send-email-xinlei.lee@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 27 Jan 2023 08:12:47 +0800
X-Gmail-Original-Message-ID: <CAAOTY__wuHgZmPKGxKPceHTcupUqKyxPb0CrG=ZB1c47T+Dohg@mail.gmail.com>
Message-ID: <CAAOTY__wuHgZmPKGxKPceHTcupUqKyxPb0CrG=ZB1c47T+Dohg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/mediatek: dsi: Reduce the time of dsi from
 LP11 to sending cmd
To: xinlei.lee@mediatek.com
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, thierry.reding@gmail.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, sam@ravnborg.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Xinlei:

<xinlei.lee@mediatek.com> =E6=96=BC 2023=E5=B9=B41=E6=9C=8810=E6=97=A5 =E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=881:55=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Xinlei Lee <xinlei.lee@mediatek.com>
>
> According to Figure 16 Turnaround Procedure on page 36 in [1], you
> can see the status of LP-00 -> LP10 -> LP11. This state can correspond
> to the state of DSI from LP00 -> LP11 in mtk_dsi_lane_ready function
> in mtk_dsi.c.
>
> LP-00 -> LP10 -> LP11 takes about 2*TLPX time (refer to [1] page 51
> to see that TLPX is 50ns)
>
> The delay at the end of the mtk_dsi_lane_ready function should be
> greater than the 2*TLPX specified by the DSI spec, and less than
> the time specified by the DSI_RX (generally 6ms to 40ms), to avoid
> problems caused by the RX specification

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> [1]:mipi_D-PHY_specification_v1-1
>
> Fixes: 39e8d062b03c ("drm/mediatek: Keep dsi as LP00 before dcs cmds tran=
sfer")
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 3b7d13028fb6..9e1363c9fcdb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -721,7 +721,7 @@ static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
>                 mtk_dsi_clk_ulp_mode_leave(dsi);
>                 mtk_dsi_lane0_ulp_mode_leave(dsi);
>                 mtk_dsi_clk_hs_mode(dsi, 0);
> -               msleep(20);
> +               usleep_range(1000, 3000);
>                 /* The reaction time after pulling up the mipi signal for=
 dsi_rx */
>         }
>  }
> --
> 2.18.0
>
