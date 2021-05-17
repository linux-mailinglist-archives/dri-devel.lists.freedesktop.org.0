Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F52E382EA7
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C596E977;
	Mon, 17 May 2021 14:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8BA6E973
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:09:24 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 t10-20020a05683022eab0290304ed8bc759so5615138otc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m8lGamoXZT49QKE/imaW8zwVZCyRhbcu8DL/pIBgY04=;
 b=OmfhFoo2wBaoNKhhx2e7Jpj4+zotxHFuYqBi5VXa014u/lkvPRTLkXGcQxWzmSgSF5
 t4YsvnAHvy/78KaIDLnFSq0i1RXv0XNRmgbLJWRkFdYEcWRL+w3v/FSqooTMciyJ9H0W
 5WcmonZP4VA5WKFa8EwOGviQw4vBluz4f5ygMM24Bvc2fs+R8dlsfWPX1HE8CEIhduyL
 n9N0uyD3zQDxrR769hU0skYS3z5AXcduOOLq2fnpj4xeqIiM03wOKqnL+9uFLX6HfVhd
 95Kp/aRZLs1znVrCPSWSOj/iF1tgZH4C2DjdqspTby1/ximYvEp3l8zyIMMHHgipulrP
 eegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m8lGamoXZT49QKE/imaW8zwVZCyRhbcu8DL/pIBgY04=;
 b=shOIyQoXvx4fVMPh92gPg52rJVPV7NMbjHoKD9lksH05YhxLe3gmBP2RQ9BSyRsV4b
 FL92yIGWa2B149Ywu8EgkEp1h2pWkiNY3bgxaarSDVyBuMdpwqiYHDig0n37FG08Gcey
 cIOnz7OqVPlTlEwUL5Un5thSWUWCGIRU54uELw0qfaLutbitigbsruuhRu9nPGeT9BFz
 g5fSvrQkUp2+U/qNMqVPA9uYe59vk2J+OCsQ0RxSkiZbdPcKNb+krEUWsOD6ziibQ2Pd
 EUufj5RX0SYtCbD/E7QQhU5ZDUx8s89v+w+ZxpiJirg9i4SCgpwbDIXeKQPXj0OFKdOU
 Gckw==
X-Gm-Message-State: AOAM531zoRPVEG3UvE5twEUvDKwWAnBazKKHtsQ+l+ljuEhVOVHZNK2A
 4XJV1a+h6wnBVDL4QZHgPFcEWeQxEAtxgAdKDFXBABcZ
X-Google-Smtp-Source: ABdhPJzrxX37Fj6bi2woH0zE9KOZsMlAmaoSWYXdKvFSlz3mozXG2kCmhMhVcnN/wBKmZMSsJ5XYRFjUFGyBZqcCI1E=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr48304764oti.23.1621260564177; 
 Mon, 17 May 2021 07:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210517115705.2141-1-christian.koenig@amd.com>
In-Reply-To: <20210517115705.2141-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 May 2021 10:09:13 -0400
Message-ID: <CADnq5_O7EBT7tdsuq00K-T2j=HEq34hLEpsbME4157wcGZyTBg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: fix unintended pin/unpin warnings
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 7:57 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> DMA-buf internal users call the pin/unpin functions without having a
> dynamic attachment. Avoid the warning and backtrace in the logs.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Bugs: https://gitlab.freedesktop.org/drm/intel/-/issues/3481
> Fixes: c545781e1c55 ("dma-buf: doc polish for pin/unpin")
> CC: stable@kernel.org

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/dma-buf/dma-buf.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index f264b70c383e..eadd1eaa2fb5 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -760,7 +760,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct=
 device *dev,
>
>                 if (dma_buf_is_dynamic(attach->dmabuf)) {
>                         dma_resv_lock(attach->dmabuf->resv, NULL);
> -                       ret =3D dma_buf_pin(attach);
> +                       ret =3D dmabuf->ops->pin(attach);
>                         if (ret)
>                                 goto err_unlock;
>                 }
> @@ -786,7 +786,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct=
 device *dev,
>
>  err_unpin:
>         if (dma_buf_is_dynamic(attach->dmabuf))
> -               dma_buf_unpin(attach);
> +               dmabuf->ops->unpin(attach);
>
>  err_unlock:
>         if (dma_buf_is_dynamic(attach->dmabuf))
> @@ -843,7 +843,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dm=
a_buf_attachment *attach)
>                 __unmap_dma_buf(attach, attach->sgt, attach->dir);
>
>                 if (dma_buf_is_dynamic(attach->dmabuf)) {
> -                       dma_buf_unpin(attach);
> +                       dmabuf->ops->unpin(attach);
>                         dma_resv_unlock(attach->dmabuf->resv);
>                 }
>         }
> @@ -956,7 +956,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_bu=
f_attachment *attach,
>         if (dma_buf_is_dynamic(attach->dmabuf)) {
>                 dma_resv_assert_held(attach->dmabuf->resv);
>                 if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
> -                       r =3D dma_buf_pin(attach);
> +                       r =3D attach->dmabuf->ops->pin(attach);
>                         if (r)
>                                 return ERR_PTR(r);
>                 }
> @@ -968,7 +968,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_bu=
f_attachment *attach,
>
>         if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
>              !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> -               dma_buf_unpin(attach);
> +               attach->dmabuf->ops->unpin(attach);
>
>         if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) =
{
>                 attach->sgt =3D sg_table;
> --
> 2.25.1
>
