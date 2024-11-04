Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2635D9BB4C6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 13:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6213C89A72;
	Mon,  4 Nov 2024 12:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DhzBv4Qw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C0B89A72
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 12:39:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 197D75C4918
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 12:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956F9C4CECE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 12:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730723947;
 bh=3sKt0pKQ7l+ewl3dj/n8AiM7yxbEFq3qr76uue5LlSQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DhzBv4Qw/jRz2kLqJWnrL9AmrJDBvFX8zXP/vfElrDZdHWrzLB/ZnpbWxlmcKkDe8
 ZQYaMAjrvvMq4vAHlEoZs022vT3TInz6dt/Ha+fkPV1iOa6yaZ0RovvTDIYKdgWjDx
 QViQePlDTW1N/RBNcbcIHAmITMxXQPLWesx6udR4quGbaHqHaAujho6HgX5NqZMV9b
 ohjRnGyzc4v+5QWxcxBRmmJIkNYYDjUxwwtvNpWp88nJSzzGnlbL+ReLlYXdOi9ebv
 IF3Id1AaO29eVzPmbJLeG1znJzo03xDRBcbe7yhG3z0QPhIug1IVlHZkottVQvcYhu
 ubk3a/LfbDVRQ==
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2e2cc47f1d7so2884215a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 04:39:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXAtQA7Y+h69xFeHkjmus6RtQScir2AHbaUjH2EdjsAsQzQ9NUxMokzFacuY4LFeY06x2Bq/jyewuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMJyliikgi/ZaKWhp4CProx+KrwoT90I/aJ246lkKullJBXXfb
 HhYt7SaCEjEJWwoAwfPQytT0+StIv5piTT2UPI/NkJs49yYyXFHZJxpBWtQPCYIQf/YX+/j6z4z
 3Tzjf2jEXGeNUF8lM4bp4EUGqCw==
X-Google-Smtp-Source: AGHT+IGp3PoghnDPsbTvX2ld6cnOJBapqXb+5hbUeZVa3jcTQkcnfw8QcLHobq/Oeep5/JnK90IvUmtv0dEY2fr3tnQ=
X-Received: by 2002:a17:90b:38ca:b0:2d8:3f7a:edf2 with SMTP id
 98e67ed59e1d1-2e94bdfdeadmr19464472a91.12.1730723947190; Mon, 04 Nov 2024
 04:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 4 Nov 2024 20:39:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8Vf3_BCOd6t2G=e-rU-cKZTdGbqEChPi5vipY6yR02eg@mail.gmail.com>
Message-ID: <CAAOTY_8Vf3_BCOd6t2G=e-rU-cKZTdGbqEChPi5vipY6yR02eg@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/mediatek: Fix child node refcount handling and
 use scoped macro
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
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

Javier Carrasco <javier.carrasco.cruz@gmail.com> =E6=96=BC 2024=E5=B9=B410=
=E6=9C=8812=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=883:22=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> This series fixes a wrong handling of the child node within the
> for_each_child_of_node() by adding the missing call to of_node_put() to
> make it compatible with stable kernels that don't provide the scoped
> variant of the macro, which is more secure and was introduced early this
> year.

For this series, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Javier Carrasco (2):
>       drm/mediatek: Fix child node refcount handling in early exit
>       drm/mediatek: Switch to for_each_child_of_node_scoped()
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> ---
> base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
> change-id: 20241011-mtk_drm_drv_memleak-5e8b8e45ed1c
>
> Best regards,
> --
> Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
