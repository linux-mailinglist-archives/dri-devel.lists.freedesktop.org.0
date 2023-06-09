Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 763FA729910
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9988010E697;
	Fri,  9 Jun 2023 12:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E78810E697
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 12:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686312529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhTsvnKWHMyANiF+ypBvF6dWV6TA3YEIeRPL9ez0lTg=;
 b=RjRJbiYwx6weEXtvPb3EETzTV8JV19kj9GV3kXkx/WuBFBd1RYnjBtrHe/Ui0i22YtnpY7
 jbc02eXRdoSKQ3r2kOv5IPA5TvVYtzS8UmelxBVym3dRu14trnE32Lr1ehg3PMjWYl6+Ig
 eBwIiO+Jb8uY6S0fZ4eMqWb9RlHzT1o=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-v5ShaQ2PO2W-KBn6h4dHhQ-1; Fri, 09 Jun 2023 08:08:48 -0400
X-MC-Unique: v5ShaQ2PO2W-KBn6h4dHhQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b04d5ed394so1909331fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 05:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686312527; x=1688904527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bhTsvnKWHMyANiF+ypBvF6dWV6TA3YEIeRPL9ez0lTg=;
 b=ZkHMuRHmx0+GkArzzIlEmThd/BVywkA9W91miAlIemN8lycwGDzG9M/c6NoE7x/qWL
 MpnBHetBbtDre1Y7volMPIiGXtiJaNyQb/UYoqZ4CPOtQXAxGWSMyIbmfdlW/cnuglPN
 XwTwJ5DYS2ve8ziGkmtuLmFzvTOKw4Vbs2Ay4LCS3xZkPkB9XxQnG0EfO83hEho24zxi
 TUIZYkiv9GdDR/jh91J5Jd/BLNINvVk5arUcYaM60g+lgDptMhs7ZwF3XxlhMIakEb3q
 ziOODsOPLD9WAlj4FouVL/S1waOg3kK2uveS2d8+WQcl6Uo97cEByy12H7w3FInxcBrG
 fKZg==
X-Gm-Message-State: AC+VfDzzWPH5LJRC0MSqDP641D7PLeskWlTMvsl06GisteixtSg7cXZu
 0z655kicvBhgwZkDXD0mMHlnFHJoDDMTSdXYIkM8+imIIToQ+beJugfqyKN9OnfVYd/reC+5yG4
 YysCpqdrveXP/r/HIu9FmYRPrapfswvUZIU/2pqmmZnTd
X-Received: by 2002:a2e:a60a:0:b0:2b2:84:fae6 with SMTP id
 v10-20020a2ea60a000000b002b20084fae6mr840254ljp.5.1686312526806; 
 Fri, 09 Jun 2023 05:08:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5/u83dgJO9ijfmv0l+OO9YcGJ/L6qBK50cyPbNLbgarvaR6qFwIZEoR0L+ekfQ6ZkypevTiTMqJhUVw0mWglg=
X-Received: by 2002:a2e:a60a:0:b0:2b2:84:fae6 with SMTP id
 v10-20020a2ea60a000000b002b20084fae6mr840247ljp.5.1686312526573; 
 Fri, 09 Jun 2023 05:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230609081732.3842341-1-lee@kernel.org>
 <20230609081732.3842341-7-lee@kernel.org>
In-Reply-To: <20230609081732.3842341-7-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 9 Jun 2023 14:08:35 +0200
Message-ID: <CACO55ttQa-M3amPtFTG2JCC=wnJ7y6=JvZ9ak93tW-WtfXYUxg@mail.gmail.com>
Subject: Re: [RESEND 06/15] drm/nouveau/nvkm/subdev/acr/lsfw: Remove unused
 variable 'loc'
To: Lee Jones <lee@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 9, 2023 at 10:18=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c: In function =E2=80=98nvk=
m_acr_lsfw_load_sig_image_desc_v2=E2=80=99:
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:21: warning: variable=
 =E2=80=98loc=E2=80=99 set but not used [-Wunused-but-set-variable]
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Gourav Samaiya <gsamaiya@nvidia.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/acr/lsfw.c
> index f36a359d4531c..bd104a030243a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> @@ -218,7 +218,7 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subd=
ev *subdev,
>                 const struct firmware *hsbl;
>                 const struct nvfw_ls_hsbl_bin_hdr *hdr;
>                 const struct nvfw_ls_hsbl_hdr *hshdr;
> -               u32 loc, sig, cnt, *meta;
> +               u32 sig, cnt, *meta;
>
>                 ret =3D nvkm_firmware_load_name(subdev, path, "hs_bl_sig"=
, ver, &hsbl);
>                 if (ret)
> @@ -227,7 +227,6 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subd=
ev *subdev,
>                 hdr =3D nvfw_ls_hsbl_bin_hdr(subdev, hsbl->data);
>                 hshdr =3D nvfw_ls_hsbl_hdr(subdev, hsbl->data + hdr->head=
er_offset);
>                 meta =3D (u32 *)(hsbl->data + hshdr->meta_data_offset);
> -               loc =3D *(u32 *)(hsbl->data + hshdr->patch_loc);

Ben: should we do anything with this value or is it safe to ignore?

>                 sig =3D *(u32 *)(hsbl->data + hshdr->patch_sig);
>                 cnt =3D *(u32 *)(hsbl->data + hshdr->num_sig);
>
> --
> 2.41.0.162.gfafddb0af9-goog
>

