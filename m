Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E3F7C77E4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 22:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9FF10E553;
	Thu, 12 Oct 2023 20:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C65A10E02F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 20:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697142469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kN82Bv6AzS+6BIfg6C34ptuB1mXgXD7jYJ7UO25RWqU=;
 b=SHt1uaGrA4lPLrWu4h2rzwSBJAscbZXV2pUztvGEAW9zKNESo0FN0boVvwYt01XcijFMWO
 EUqnOHjEMC0BKSNwtCPiHmAFbUq/7QM8S2DFPnJtqo/MTOT/P8HY9jENdJ2VsrhrUKCrdV
 UYMktPDt8rKZKueVfNGgL9GD+bCVA/U=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-aihAhDTUP5qzeB4eHy8U3A-1; Thu, 12 Oct 2023 16:27:47 -0400
X-MC-Unique: aihAhDTUP5qzeB4eHy8U3A-1
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-d9a3e0f8872so1821479276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 13:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697142467; x=1697747267;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h7MhDUaGiq9G+tWNP9KfebmzehEOtMMS/KoW8Kay4rM=;
 b=wLFE90icZ9Cd/d6jYpKEM7SPKsFlyK7ouQoOITC75d/HGxQDODvSH1zgpBc2YM8lbK
 b08BMWDtkSFaJjQHTGyGdM4q9MbA3V5IrYU2zN9DEKxQq8JLdxgzhKPc0tm+wDNkwh8j
 w4i4q10RB84tQUpkajHt3IfEhgus3Dg3W9Y1shmXEknh32c7xZY2K6ZJoCkGWM6NCwOT
 KpSIbkxbvOCtSXDFyRJ5x1y0Fg8Lt7KzzkJXhrqjYez5WGCE+PcoaaQ3rMwoeXp1gZTP
 kllzMzXnfCZCpMkQwcXizacbomfP0Nl5IK5icMDIPxFdNTGRk+86bXulrQDJGLYDfKIf
 75Bw==
X-Gm-Message-State: AOJu0YzZwMiOher7qzOowlJbPyvZXFVANzticNnBCncO4j1agLefg29n
 NCmOQ+UOut7yIQf5dF3+0+m18YRurw/W/83BqHaCZTNfFRFLkhcwfR6UCy3GXOZbLufsCcQWcOz
 zTpmn5iYJGktwugkT3q9l1wVvSgZL
X-Received: by 2002:a25:2109:0:b0:d90:a7a4:7093 with SMTP id
 h9-20020a252109000000b00d90a7a47093mr22970358ybh.55.1697142466871; 
 Thu, 12 Oct 2023 13:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVZ5AlehRoD4uy/fEcf9fxDTMrdIb0t8hzbkAHLfVUYwOfQMOlVAmfNUNBfHCGsp/kHBKgMA==
X-Received: by 2002:a25:2109:0:b0:d90:a7a4:7093 with SMTP id
 h9-20020a252109000000b00d90a7a47093mr22970345ybh.55.1697142466567; 
 Thu, 12 Oct 2023 13:27:46 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 dl15-20020ad44e0f000000b0066d1540f9ecsm69669qvb.77.2023.10.12.13.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 13:27:45 -0700 (PDT)
Message-ID: <bd20306461d67f1c6aaadb3fe6a3d596fc70e13e.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: fix DP capable DSM connectors
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Date: Thu, 12 Oct 2023 16:27:38 -0400
In-Reply-To: <20231011114134.861818-1-kherbst@redhat.com>
References: <20231011114134.861818-1-kherbst@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
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
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2023-10-11 at 13:41 +0200, Karol Herbst wrote:
> Just special case DP DSM connectors until we properly figure out how to
> deal with this.
>=20
> This resolves user regressions on GPUs with such connectors without
> reverting the original fix.
>=20
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: stable@vger.kernel.org # 6.4+
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/255
> Fixes: 2b5d1c29f6c4 ("drm/nouveau/disp: PIOR DP uses GPIO for HPD, not PM=
GR AUX interrupts")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/disp/uconn.c
> index 46b057fe1412e..3249e5c1c8930 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
> @@ -62,6 +62,18 @@ nvkm_uconn_uevent_gpio(struct nvkm_object *object, u64=
 token, u32 bits)
>  =09return object->client->event(token, &args, sizeof(args.v0));
>  }
> =20
> +static bool
> +nvkm_connector_is_dp_dms(u8 type)
> +{
> +=09switch (type) {
> +=09case DCB_CONNECTOR_DMS59_DP0:
> +=09case DCB_CONNECTOR_DMS59_DP1:
> +=09=09return true;
> +=09default:
> +=09=09return false;
> +=09}
> +}
> +
>  static int
>  nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, stru=
ct nvkm_uevent *uevent)
>  {
> @@ -101,7 +113,7 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *a=
rgv, u32 argc, struct nvkm_
>  =09if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |=3D NVKM_GPIO_L=
O;
>  =09if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ) {
>  =09=09/* TODO: support DP IRQ on ANX9805 and remove this hack. */
> -=09=09if (!outp->info.location)
> +=09=09if (!outp->info.location && !nvkm_connector_is_dp_dms(conn->info.t=
ype))
>  =09=09=09return -EINVAL;
>  =09}
> =20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

