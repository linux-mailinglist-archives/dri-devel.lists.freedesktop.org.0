Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8FD76EE38
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 17:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2152B10E61B;
	Thu,  3 Aug 2023 15:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D0610E61D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 15:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691076899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GAn60s5VL8+3FWf4gqWswaZZmaZpliVGHrn8c7NwxLc=;
 b=XMko2/FTpWk3uF8HQK3qtdMgGvWeTrVlKKy22Ks5Z+16RfEDvFT47iqoLWNbMjXedLoDFO
 RNJogvQTRzr+ohBY34VhxHHO0m+eC5M9gZPVc1iNBA6PzdwquI9uJilo+vNMH8AEE4onRo
 f0Tan4IfCrQAXqJ4sYQ2ufuSkhBX5q0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-_6ZwvazcOnCfz_dRfhF7BQ-1; Thu, 03 Aug 2023 11:34:56 -0400
X-MC-Unique: _6ZwvazcOnCfz_dRfhF7BQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4fe56825815so87891e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 08:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691076894; x=1691681694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GAn60s5VL8+3FWf4gqWswaZZmaZpliVGHrn8c7NwxLc=;
 b=gmh5XXreTdx5ZmHS2aIkFtsE9OyELuUnlVwiMZT/x8g0BB5bF4GHHaSrehLqA5IHJE
 CJKOZNJP9KxEQReM/YNd9kxFmgA728COkOTOrJmsPK39OXkv3LmIlPXztAo/8Xdf2wiJ
 fEuIVKdNe0EOt1Ncl5gxgL9ORLwS7QInspOALrOKFe22Kc3z2TiTKbzgwGg5bIT0fQRd
 mzr3Ysxq66CbXnOoIawVfMYsGohdekkIrQ7kXgPIirNkyGWEy6OCptKvMZUX657rfQk6
 in9uw4HslMaQsg0NbgDHL+qhRAIKZQhq7ReS9JRl2ec7DrsuLqBeBlsHCLCOB1MLzLXk
 qG1A==
X-Gm-Message-State: ABy/qLYdPa3hJ4WWIk8MaAW3ZY2vxqeywzqLp6BepFvGppXZ/c5QNbhl
 DPcHIjQDtBJoEDxgyfLJB1+U8XbgaGji7lSqfzdIK/4P+ixYu8dN2CvTQUGLN2DIRJJ/h+p8yZS
 MsHQQLH2eEP6EvxK7/+bvmL8tAuVIqjucOSgdcXvOJzQj
X-Received: by 2002:a2e:a7cf:0:b0:2b6:9969:d0ab with SMTP id
 x15-20020a2ea7cf000000b002b69969d0abmr12388651ljp.4.1691076894708; 
 Thu, 03 Aug 2023 08:34:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEz/wDErpCcQsXauXulvVlKBxx8fIp7/uctE6vRdS4DBK25r+JCF/5qhcGyR21XS9Fl91S59IuTEBpqIWDsIHQ=
X-Received: by 2002:a2e:a7cf:0:b0:2b6:9969:d0ab with SMTP id
 x15-20020a2ea7cf000000b002b69969d0abmr12388632ljp.4.1691076894406; Thu, 03
 Aug 2023 08:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230803143358.13563-1-arnd@kernel.org>
In-Reply-To: <20230803143358.13563-1-arnd@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 3 Aug 2023 17:34:43 +0200
Message-ID: <CACO55tskNHHpEjQK-+wBR+nVgz+Fq31U0_FKmNGSL2JDCMnJUA@mail.gmail.com>
Subject: Re: [PATCH] [RESEND] drm/nouveau: remove unused tu102_gr_load()
 function
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 3, 2023 at 4:34=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> tu102_gr_load() is completely unused and can be removed to address
> this warning:
>
> drivers/gpu/drm/nouveau/dispnv50/disp.c:2517:1: error: no previous protot=
ype for 'nv50_display_create'
>
> Another patch was sent in the meantime to mark the function static but
> that would just cause a different warning about an unused function.
>
> Fixes: 1cd97b5490c8 ("drm/nouveau/gr/tu102-: use sw_veid_bundle_init from=
 firmware")
> Link: https://lore.kernel.org/all/CACO55tuaNOYphHyB9+ygi9AnXVuF49etsW7x2X=
5K5iEtFNAAyw@mail.gmail.com/
> Link: https://lore.kernel.org/all/20230417210310.2443152-1-arnd@kernel.or=
g/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I send this one back in April, and Lee Jones sent a similar patch in May.
> Please apply so we can enable the warning by default.
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/gr/tu102.c
> index 3b6c8100a242..a7775aa18541 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> @@ -206,19 +206,6 @@ tu102_gr_av_to_init_veid(struct nvkm_blob *blob, str=
uct gf100_gr_pack **ppack)
>         return gk20a_gr_av_to_init_(blob, 64, 0x00100000, ppack);
>  }
>
> -int
> -tu102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *=
fwif)
> -{
> -       int ret;
> -
> -       ret =3D gm200_gr_load(gr, ver, fwif);
> -       if (ret)
> -               return ret;
> -
> -       return gk20a_gr_load_net(gr, "gr/", "sw_veid_bundle_init", ver, t=
u102_gr_av_to_init_veid,
> -                                &gr->bundle_veid);
> -}
> -
>  static const struct gf100_gr_fwif
>  tu102_gr_fwif[] =3D {
>         {  0, gm200_gr_load, &tu102_gr, &gp108_gr_fecs_acr, &gp108_gr_gpc=
cs_acr },
> --
> 2.39.2
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

Will push to drm-misc in a sec

