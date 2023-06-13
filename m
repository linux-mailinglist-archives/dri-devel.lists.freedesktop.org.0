Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9C172ED58
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 22:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A825710E040;
	Tue, 13 Jun 2023 20:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B315C10E148
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 20:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686689549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PDZ1SRHCdVyO9JIKWhDNpmsLuu+i8lvzcGKJyYcIIyU=;
 b=OiE3ryrufVP7v17g2DCNCME9jBgnRrTHyPW7VsOgaLhZ4RxUWMJyLGRqD1z/Mo9swiFPwB
 1eGV39Sd3vNsNsX6rDB9EQqbHufurD6TBDwGJwvUv0AgVwTicKcDodoTnce8VE58i/Ivob
 vgo9+iNgmAsdQxu8VPtA5Cl1v4v3tys=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-EzBWUbdMO-68hCSlOCDCog-1; Tue, 13 Jun 2023 16:52:27 -0400
X-MC-Unique: EzBWUbdMO-68hCSlOCDCog-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-62dec6b082bso15636596d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 13:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686689547; x=1689281547;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kIa77HRSdBKT6S16d75u879eapT8fSGaZYoI3I+WbCE=;
 b=GI7z0Yng0R9uwBd6D3izZQPXJoF7WeElftAa0y1WRCgZsd2VVnpt/jBK0dfmZqu3cL
 gUfamK+fZfjk3QUjr8fhueLDh2g7r5beS0ZNuRScggq1bHtwJH820lsEtaYQFX0tPmVz
 5T3bHcYTFHbC0oxxSvKknD36BCeaJaFB2QCXhjH7PWaPShPcrl+9+zvcl0LpC/dhSs/2
 BYCKavYwob3fIjhvnz5L95AxCGurpuUjcXeTtYXFkKXBljUaPuo5veZaUg8jgI+DvEyo
 8XPiJV6OgOzwnII3EqYB1672jFTVdPNXtY0FbaFuPSynl1XxmUoqlIbqIzPl0IzgKZ0h
 ysHg==
X-Gm-Message-State: AC+VfDwhgv3Yzh1lVcVYFC87pgFdG/mPj2ZFdvMMGVo8U554U3Uv/95E
 HZ10SSKLPDmXaEQzuwm4jrZXe9JmWpvb6CkKjQNpADcpzNF7pcanvW9/jgytgFScXLNbrkviEdd
 F5KGyE8q4DOa5pD0+ZSOD4C033Knj9IyOlGJn
X-Received: by 2002:a05:6214:2a83:b0:626:2e70:1f9e with SMTP id
 jr3-20020a0562142a8300b006262e701f9emr16080877qvb.43.1686689546860; 
 Tue, 13 Jun 2023 13:52:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6xxfS+KO1lw43/6Kbo4gkehjnOBVC8nzu65iDFeRMbZNF7mPkkUq+0dV4/GDawuKv+9xBzcw==
X-Received: by 2002:a05:6214:2a83:b0:626:2e70:1f9e with SMTP id
 jr3-20020a0562142a8300b006262e701f9emr16080866qvb.43.1686689546580; 
 Tue, 13 Jun 2023 13:52:26 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a05620a135000b0075aff6f835bsm3876799qkl.19.2023.06.13.13.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:52:26 -0700 (PDT)
Message-ID: <602351ea7a1addf1b1349536fa8d23435d2862ad.camel@redhat.com>
Subject: Re: [PATCH] nouveau_connector: add nv_encoder pointer check for NULL
From: Lyude Paul <lyude@redhat.com>
To: Natalia Petrova <n.petrova@fintech.ru>, Ben Skeggs <bskeggs@redhat.com>
Date: Tue, 13 Jun 2023 16:52:25 -0400
In-Reply-To: <20230512103320.82234-1-n.petrova@fintech.ru>
References: <20230512103320.82234-1-n.petrova@fintech.ru>
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
Cc: lvc-project@linuxtesting.org, Karol Herbst <kherbst@redhat.com>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nice catch!

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push upstream

On Fri, 2023-05-12 at 13:33 +0300, Natalia Petrova wrote:
> Pointer nv_encoder could be dereferenced at nouveau_connector.c
> in case it's equal to NULL by jumping to goto label.
> This patch adds a NULL-check to avoid it.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: 3195c5f9784a ("drm/nouveau: set encoder for lvds")
> Signed-off-by: Natalia Petrova <n.petrova@fintech.ru>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
> index 43a9d1e1cf71..90ba6d0a9c80 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -729,7 +729,8 @@ nouveau_connector_detect_lvds(struct drm_connector *c=
onnector, bool force)
>  #endif
> =20
>  =09nouveau_connector_set_edid(nv_connector, edid);
> -=09nouveau_connector_set_encoder(connector, nv_encoder);
> +=09if (nv_encoder)
> +=09=09nouveau_connector_set_encoder(connector, nv_encoder);
>  =09return status;
>  }
> =20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

