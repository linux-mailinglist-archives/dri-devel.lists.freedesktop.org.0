Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4036C74B86E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 23:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFB710E5E7;
	Fri,  7 Jul 2023 21:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D6F10E1A3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688763831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zm/fftTF7/oyzUiDYwjKxW5aboUQHvMQ91ScEBlmiPg=;
 b=dKep7OoY17F6J2rUgEIo+wn7MjltCiKhE3q4tgiSTJFU5RPDfromYAug9Qr4T13MrTqcBL
 t/O/CLin9t1jwetnBl8LzrFyPVaQd+55AODhaxnqnHhxtQQCVAjC4uGCiuSxHbJtV3pshy
 rJ1Y74ldhymq6acPIzRsNp05OwSuQw0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-nS5GTadnNx6x2xQZdrVlng-1; Fri, 07 Jul 2023 17:03:50 -0400
X-MC-Unique: nS5GTadnNx6x2xQZdrVlng-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7675fc3333eso175236885a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 14:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688763830; x=1691355830;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jyU5zBy/a84oEoWoieA/ffOtOuuHwgqV4ycNSTCevL0=;
 b=E9zJ3izxz9hjx16OhQxoG1h9TGCaYMehoSib2m5hDg8NFSo3za6sBy4flCYLVK+kwx
 9zjfWLmjjE9WNX7GmW3tuIFJdvgm57W91wKwffI1pyXxKrS1cTkBDyHUMdVKlYKNcJEk
 oP3R3kQi9fI57KsPMvfNvkIK3yzOk0qnsvwJRoBTiNwdcEXn3G3B3ROxuVaEIF/5vAkk
 vRR7EVlde41atRToSKVHDb2gaUwhRpV/LLZbQaaOq26U3/wSHhDBXVFoaPSkWTwp2p6Z
 OX9OSZnc91vJH3D6GDavpgkz91g5snklO+ap1Jy6ZcYqHzset+zMA72xji54QyJLOny6
 UQlg==
X-Gm-Message-State: ABy/qLaeI2Rk4BNjmdDwbOeOYaLBGhp4SRHHbrLDZjL6AZqDfJpU21Hw
 VqaQPLWWxF/upGD/tppNgVy5U0EHELNeyztjIONYhcIpNsY/hCK9okX7VTVz7MCMEJDx0aU4n7f
 hyqYOv+3Lwggb68ie4v5zYOMTj0if
X-Received: by 2002:a05:620a:28cc:b0:762:3841:c098 with SMTP id
 l12-20020a05620a28cc00b007623841c098mr11890021qkp.30.1688763829770; 
 Fri, 07 Jul 2023 14:03:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHub679rj9p13wuI63bc+RfomIr/ACWE3AhFx9HYEJTtP2JkglWWuEwG3TTkgaIDBh6fY4VsA==
X-Received: by 2002:a05:620a:28cc:b0:762:3841:c098 with SMTP id
 l12-20020a05620a28cc00b007623841c098mr11889999qkp.30.1688763829506; 
 Fri, 07 Jul 2023 14:03:49 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200:4d3e:bd5a:7e0a:133a?
 ([2600:4040:5c62:8200:4d3e:bd5a:7e0a:133a])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a0cdd06000000b006301ec0d16fsm2493703qvk.0.2023.07.07.14.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 14:03:49 -0700 (PDT)
Message-ID: <14f2b03302c07a62cce1ec272f54727b2ad39721.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp/g94: enable HDMI
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Date: Fri, 07 Jul 2023 17:03:48 -0400
In-Reply-To: <20230630160645.3984596-1-kherbst@redhat.com>
References: <20230630160645.3984596-1-kherbst@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

But seeing as I looked at this + some other patches yesterday I assume ther=
e's
still more to this?

On Fri, 2023-06-30 at 18:06 +0200, Karol Herbst wrote:
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Fixes: f530bc60a30b ("drm/nouveau/disp: move HDMI config into acquire + i=
nfoframe methods")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/disp/g94.c
> index a4853c4e5ee3..67ef889a0c5f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c
> @@ -295,6 +295,7 @@ g94_sor =3D {
>  =09.clock =3D nv50_sor_clock,
>  =09.war_2 =3D g94_sor_war_2,
>  =09.war_3 =3D g94_sor_war_3,
> +=09.hdmi =3D &g84_sor_hdmi,
>  =09.dp =3D &g94_sor_dp,
>  };
> =20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

