Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFE3A4C10B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 13:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CEF10E1DD;
	Mon,  3 Mar 2025 12:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FV9xelpT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B650A10E1DD
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 12:56:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 091585C58CF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 12:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFBAC4CEE6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 12:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741006602;
 bh=UX3HfbY9NrbOd9tpd2P7hFNQCeHdeWclU4P4j4yWbwI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FV9xelpTeEOVh2F9LLHt7cZEamR97RqTHhg+X8WoBEYkAdzKYDoMPFGtFf8M90C3D
 TKgWlwqQHfV9WGMud0bBw2UL2qbO5ucIGnrIH98qUmbbmVpcNd09anXw7cMKWrYT9C
 xgsT0eOnRDvogmt97w/5hTiDGDBb4QDrgD0AcjuZD2W2vQV8Zt5itjsBOfSVnOEkDz
 u1V0SEBZvaUbFO0watcpspU5ainokC0giq5omDV1ZcV20THn1iLL/F1LeXjaAyJt+M
 8VCklBlAsyFYjeFHSOAowTLy2dqy+W20cxyVfJkhIw1AKmlvdPpprIuf32RtQgeEJB
 MXlpfnsRQml6A==
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2fee05829edso3230952a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 04:56:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX5ATJ9PhoB1PfXM70/1xhKrPYVLfJbePgCNjzpERtVKf5IdDhHU4lxCcdEgJkYP4Rqgp1J0RGIlo8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs4BD/01X4ZBUzK/1zPESz1cPN/OVMgIkVOxrKGNDqIpwVAbpR
 NArcNGJ9Cgdp7OJXXt1TaaqFXkOtSEibZF0wImYAd7bDB9VSsPpbcHAGV2jERb9sLOT3e7KNMJa
 i6XGB6134+UIi8zxZs6Ts5urPWw==
X-Google-Smtp-Source: AGHT+IGSSgSzh55HSnQ1lVjwMdzp28MHDOUOnEh8kdGeJHmMnwiYf8Q6NzYRnemJliLplJUfJXLVhNNZXMjP1z0RvT8=
X-Received: by 2002:a17:90b:3511:b0:2ee:8427:4b02 with SMTP id
 98e67ed59e1d1-2febabd9c82mr19809852a91.28.1741006602131; Mon, 03 Mar 2025
 04:56:42 -0800 (PST)
MIME-Version: 1.0
References: <20250224051301.3538484-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20250224051301.3538484-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Mar 2025 20:57:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8cGVEYV2v6oAHHnVqfjk3jp_a1QtaYJRqDf1Hg4vY0UA@mail.gmail.com>
X-Gm-Features: AQ5f1Jred4c1pw-7JgOxVG6xQG08SC8yxuC59gWdugp16YcFov8bdecIzf41xyo
Message-ID: <CAAOTY_8cGVEYV2v6oAHHnVqfjk3jp_a1QtaYJRqDf1Hg4vY0UA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix config_updating flag never false when
 no mbox channel
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, 
 Xavier Chang <xavier.chang@mediatek.com>, Fei Shao <fshao@chromium.org>, 
 Chen-yu Tsai <wenst@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
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

Hi, Jason:

Jason-JH Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2025=E5=B9=B42=E6=9C=882=
4=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=881:13=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> When CONFIG_MTK_CMDQ is enabled, if the display is controlled by the CPU
> while other hardware is controlled by the GCE, the display will encounter
> a mbox request channel failure.
> However, it will still enter the CONFIG_MTK_CMDQ statement, causing the
> config_updating flag to never be set to false. As a result, no page flip
> event is sent back to user space, and the screen does not update.

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: da03801ad08f ("drm/mediatek: Move mtk_crtc_finish_page_flip() to d=
dp_cmdq_cb()")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 5674f5707cca..cfc4867296b8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -620,13 +620,14 @@ static void mtk_crtc_update_config(struct mtk_crtc =
*mtk_crtc, bool needs_vblank)
>
>                 mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle=
);
>                 mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
> +               goto update_config_out;
>         }
> -#else
> +#endif
>         spin_lock_irqsave(&mtk_crtc->config_lock, flags);
>         mtk_crtc->config_updating =3D false;
>         spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
> -#endif
>
> +update_config_out:
>         mutex_unlock(&mtk_crtc->hw_lock);
>  }
>
> --
> 2.43.0
>
