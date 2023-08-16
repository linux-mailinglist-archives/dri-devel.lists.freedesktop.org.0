Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9F477EAFB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 22:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A65310E3BB;
	Wed, 16 Aug 2023 20:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE5310E3BB
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 20:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692218836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lp/ElRMpuHX0ZQF1pFmv/A7hZ/+TiJdwRTSI4ctDg4Q=;
 b=U9V03XlWWEGYWMhiGJgZUsnvasy4jWLY3pHVUhZKtA6Vz+lfnlPYNEZ03pikNnr+vQghXz
 gPW8eATEH2/2rY+Bfi1yoyt26n8/9lnLtEdcPsw+43NtheMt5QZbkvcm5HyirXsZVg/GRT
 H/c5WyGBgjU+45HHeaHiHfhJhaNer10=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-YWz-moblOHOSrSSyXI0GTQ-1; Wed, 16 Aug 2023 16:47:14 -0400
X-MC-Unique: YWz-moblOHOSrSSyXI0GTQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-40eedfd4119so73630161cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 13:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692218834; x=1692823634;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e3IvmL0y1viiHXLAUyfip1yCYlhOkZ7NLyhRvcY+CDk=;
 b=Y/JIrSLwgPAdGts8qhiT2EaoxbYuUlNyxLlvKQNnHgyb6qFf5UugLfJvOOjRVi7P0G
 WtNxzpN/wl0+d81lF5AJJnthaeNqr6JmW0asmweXP+C1RZ/kDE0o7LmltgzGxvvRhlT8
 kf36j1A87iidcqzFxDIsEcHw/vJ+vGqHtsPeIgaUsunfgaeQh64x3ArWmMruiCLDLPNN
 KgpAMKWpfeER2jKnb5QMoL55IE3CMm8nAmizlTWeP/xiyQRhQo1q8gM7ApdSwmJBLJ3s
 ujVp7Jr/ufX6GdPSWHvnqeWRamcyv+qxNAxj0nRT3D9NcArOz4+eEGNL2lSYHRek61UF
 J8cg==
X-Gm-Message-State: AOJu0YzqH3gYR9i7v/qgDoBhhNXUpPUrV5VxIN59I5i8Ki5bBs4+qSZH
 x+z9SDymEHxGI1vewJtTIXEAr2MxIT7iTgItGA10oasj7Wrb8N84XmODhgOQdK87btlZuvRkS54
 a9TyfXt839ueBeWbT2oLlvCamJTol
X-Received: by 2002:a05:622a:1210:b0:403:e895:155b with SMTP id
 y16-20020a05622a121000b00403e895155bmr3853833qtx.34.1692218834031; 
 Wed, 16 Aug 2023 13:47:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEey1QVl493qQLI7bMS4KR7ZC4Pq5U6vCDQZyZMtY+jGAPCQ+P+AzAMGob1aMDWpaV//+fi6g==
X-Received: by 2002:a05:622a:1210:b0:403:e895:155b with SMTP id
 y16-20020a05622a121000b00403e895155bmr3853816qtx.34.1692218833802; 
 Wed, 16 Aug 2023 13:47:13 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c7d:5f00::feb? ([2600:4040:5c7d:5f00::feb])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac84d08000000b0040b8ba13701sm4735297qtv.52.2023.08.16.13.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 13:47:13 -0700 (PDT)
Message-ID: <a612e9d4560aa3827114339b1ea92f0181550eca.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: fix use-after-free in error handling
 of nouveau_connector_create
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Date: Wed, 16 Aug 2023 16:47:12 -0400
In-Reply-To: <20230814144933.3956959-1-kherbst@redhat.com>
References: <20230814144933.3956959-1-kherbst@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2023-08-14 at 16:49 +0200, Karol Herbst wrote:
> We can't simply free the connector after calling drm_connector_init on it=
.
> We need to clean up the drm side first.
>=20
> It might not fix all regressions from 2b5d1c29f6c4 ("drm/nouveau/disp:
> PIOR DP uses GPIO for HPD, not PMGR AUX interrupts"), but at least it
> fixes a memory corruption in error handling related to that commit.
>=20
> Link: https://lore.kernel.org/lkml/20230806213107.GFZNARG6moWpFuSJ9W@fat_=
crate.local/
> Fixes: 95983aea8003 ("drm/nouveau/disp: add connector class")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
> index a2e0033e8a260..622f6eb9a8bfd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1408,8 +1408,7 @@ nouveau_connector_create(struct drm_device *dev,
>  =09=09ret =3D nvif_conn_ctor(&disp->disp, nv_connector->base.name, nv_co=
nnector->index,
>  =09=09=09=09     &nv_connector->conn);
>  =09=09if (ret) {
> -=09=09=09kfree(nv_connector);
> -=09=09=09return ERR_PTR(ret);
> +=09=09=09goto drm_conn_err;
>  =09=09}
> =20
>  =09=09ret =3D nvif_conn_event_ctor(&nv_connector->conn, "kmsHotplug",
> @@ -1426,8 +1425,7 @@ nouveau_connector_create(struct drm_device *dev,
>  =09=09=09if (ret) {
>  =09=09=09=09nvif_event_dtor(&nv_connector->hpd);
>  =09=09=09=09nvif_conn_dtor(&nv_connector->conn);
> -=09=09=09=09kfree(nv_connector);
> -=09=09=09=09return ERR_PTR(ret);
> +=09=09=09=09goto drm_conn_err;
>  =09=09=09}
>  =09=09}
>  =09}
> @@ -1475,4 +1473,9 @@ nouveau_connector_create(struct drm_device *dev,
> =20
>  =09drm_connector_register(connector);
>  =09return connector;
> +
> +drm_conn_err:
> +=09drm_connector_cleanup(connector);
> +=09kfree(nv_connector);
> +=09return ERR_PTR(ret);
>  }

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

