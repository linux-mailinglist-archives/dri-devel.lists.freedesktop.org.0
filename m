Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F997689C26
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 15:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0CE10E7C1;
	Fri,  3 Feb 2023 14:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853DA10E4BD;
 Fri,  3 Feb 2023 09:48:15 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id d2so832071pjd.5;
 Fri, 03 Feb 2023 01:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Di8uxwcyossGWtUe28ylNS6d/iqeqZOSW9Fc0lEwyw=;
 b=KY708oCojclC3sfqe2XOlsqg3+dwwINyrrxL9hMltB4CcVqSut1fgMFdNtDqQAYVEh
 64i/bR69PHgUrKoomqzp+Nr3rmyW6EU7OryjXeUUfm/5XX+MC5U50xmrxd54z2VuvDDs
 7KepZNi/7MXiyJwHz6PXtTgbXQHF3k13x/tsgIHtC1BpH/7FM9a7Q7D0jCAKTImBJcmi
 aJRU+yI3wRDU4cy/xJKCW7acAlre2COvtr+yuCH6hQZMrCoxX6/Dj+4JsdHeW0NESyBr
 cATKTf9uSeeS8cjEm82XyG1VA3kBGwPjC+jlLf6xpvta7dHngmM11NI1CbqbLvNOYJml
 KKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Di8uxwcyossGWtUe28ylNS6d/iqeqZOSW9Fc0lEwyw=;
 b=qhX3QntSoGaFxmRKLtKHQPUOTJ499Zt9XNNSGvj/dZ4CYjoE+6EwuttIhi4F4AXlOV
 atNxDoT7VxMVgth9XlbAc21As15jqu8E3HIiAmLq44MGfD7nHnFa+UATtm6rEm3lshIP
 QKi9PR8+FGCh0ZBbsaMBqnvue1YuFXuwLNjncDCDIHi8RRAqsLUfaNO78U/gr/uYMMyN
 mvcHDFuFTQuSnZxkgXzXwIRVSDFmSNbtG82OBlPkxBFM1IiV3an2PBc6Y/Gn11FvCeJB
 y/jnplA25Yeq+nO7jRQn1Vm1/fsCNTCLhMqhObdPZ/hXzsq7ipI9fzUxTKTkBJ6YQ7Eg
 ZJrg==
X-Gm-Message-State: AO0yUKVe4q7xjeM2ln4He1otsoy83cnb5Dbnt3gkIF5+9OFsk52CBD3R
 ujshiB5LmR9rxXSlwpLGVzkQ7rih7yDNYW502gk=
X-Google-Smtp-Source: AK7set/aUCqTMuYIbzquzupIRAG3f/VdfWUi7+s1FzynLXy3OY5FGKjIPYfCqrLUG/v3GlF+0QqP2M4IchizYN0jVnA=
X-Received: by 2002:a17:90a:74c4:b0:22b:f34a:1f52 with SMTP id
 p4-20020a17090a74c400b0022bf34a1f52mr1141397pjl.76.1675417695053; Fri, 03 Feb
 2023 01:48:15 -0800 (PST)
MIME-Version: 1.0
References: <20230112071842.819123-1-korantwork@gmail.com>
In-Reply-To: <20230112071842.819123-1-korantwork@gmail.com>
From: Xinghui Li <korantwork@gmail.com>
Date: Fri, 3 Feb 2023 17:49:09 +0800
Message-ID: <CAEm4hYX3Db4NW+zkuwPep5CF3=ojXxKHPrEB+erOeA+o8d+4FQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/mmu: Fix an UAF issue in NVKM
To: bskeggs@redhat.com, kherbst@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 03 Feb 2023 14:48:53 +0000
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
Cc: nouveau@lists.freedesktop.org, loydlv <loydlv@tencent.com>,
 Xinghui Li <korantli@tencent.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi all
friendly ping...

<korantwork@gmail.com> =E4=BA=8E2023=E5=B9=B41=E6=9C=8812=E6=97=A5=E5=91=A8=
=E5=9B=9B 15:18=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Xinghui Li <korantli@tencent.com>
>
> In nvkm_mem_new_host, the mem is be alloced. And mem->memory is
> assigned to pmemory. During this process, the mem will be free if
> the error occurs. But the *pmemory still points to the &mem->memory
> which has been relased.Laterly, the nvkm_memory_unref will put the
> memory which points to the pmemory again.So, we set the *pmemory to
> NULL to avoid UAF issue.
>
> Reported-by: loydlv <loydlv@tencent.com>
> Signed-off-by: Xinghui Li <korantli@tencent.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mem.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mem.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/mmu/mem.c
> index 92e363dbbc5a..ab30eb1fc0a3 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mem.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/mem.c
> @@ -185,6 +185,7 @@ nvkm_mem_new_host(struct nvkm_mmu *mmu, int type, u8 =
page, u64 size,
>         } else
>         if ( (ret =3D nvif_unvers(ret, &argv, &argc, args->vn))) {
>                 kfree(mem);
> +               *pmemory =3D NULL;
>                 return ret;
>         }
>
> --
> 2.31.1
>
