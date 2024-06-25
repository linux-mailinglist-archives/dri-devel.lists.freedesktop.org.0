Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2399170F2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 21:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F6710E208;
	Tue, 25 Jun 2024 19:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XLBS7EF7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7BC10E208
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 19:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719342704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TISZFcFFlJSHtzF3Lvd3aa+SXIMQfFk1YIjzZcVKkqA=;
 b=XLBS7EF7ieuCZsPL2O2U5rsaH/c5Vw8rsnQU4NXvUEVilpl3QL26mR2/CD3jYLQLqAvntV
 yq6dBAQsTiiHcNKi25QUwdP8Pzj5kl8EyM+ORbWJQJz0IUd1cJk0HGe6D79ywnN1XsPeKn
 /Hsdpd5h2KLbPonqsG0OVp0EQUlTtbQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-nhBLCgYHOfSbaT-wk8oIEA-1; Tue, 25 Jun 2024 15:11:43 -0400
X-MC-Unique: nhBLCgYHOfSbaT-wk8oIEA-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-797f78dc5aaso1196861585a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 12:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719342703; x=1719947503;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e13YfLxrx9QBTn7/Lh+rajM0bGrTVztbpsgKXAwM4ag=;
 b=xEFBysuIVD/zxKRhW7pTmiucJ+xKRCJYCfRBPk+ueyqKkqw9rYTSjvdwGwqfF5gQIo
 rYD0gn6qkGCPA+HJzuj8MHkbhSxJCtEEvEFzLLj5KLeeGgqGgCgU8aKg10Wblij6sUjR
 67H91UbIsrymixdra5zwh1GcWIG12mRMITiF3R+CkS2pHb6QpR0rcCSqX2vJv5JZsBD9
 CWBe1y5HbiblKmjrSeFMQHWC0EY+HGPC9GnjyocpuXpO+7Zz9ENlN205WLZh0aKrYCw4
 eXzq+VsWYz0O0wEsdWCw/HEYWysdKt+O5we2nRh8ho4X7DGjQC72Azq+1xht6EepNskd
 GPZw==
X-Gm-Message-State: AOJu0Yy+pnU4eWi1PZ9S7cPmXKQd5+c3+233/n/F2BSeQW3UhH4sgpKM
 mX7NVVpx4vy2FfKLzLJEQc6N954asDR+3XfOtTkvbyhwJ92xh8MRX2PvLWXrpcSwMl6U3g0S9mM
 LExSkY14EynYrLWg7Fy4IgMM9RB4ftJKu2/ROplrSgmeLnpTYjYJquO4m7w+9+h/r5A==
X-Received: by 2002:a05:620a:4002:b0:794:8de6:505f with SMTP id
 af79cd13be357-79be701fe22mr779119785a.65.1719342702850; 
 Tue, 25 Jun 2024 12:11:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhdICv2itjqoD37ZGNl0mT+EALkdSduHpGzBvI0THMGz2Iv/iOD7HGal7FR551LXjasudQPQ==
X-Received: by 2002:a05:620a:4002:b0:794:8de6:505f with SMTP id
 af79cd13be357-79be701fe22mr779118085a.65.1719342702478; 
 Tue, 25 Jun 2024 12:11:42 -0700 (PDT)
Received: from chopper.lyude.net ([2600:4040:5c4c:a000::789])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce8b1917sm433317085a.38.2024.06.25.12.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 12:11:42 -0700 (PDT)
Message-ID: <30a2ae4b3ac161012168a6d03cd28c616829eb22.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/dispnv04: fix null pointer dereference in
 nv17_tv_get_hd_modes
From: Lyude Paul <lyude@redhat.com>
To: Ma Ke <make24@iscas.ac.cn>, kherbst@redhat.com, dakr@redhat.com, 
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Tue, 25 Jun 2024 15:11:41 -0400
In-Reply-To: <20240625081029.2619437-1-make24@iscas.ac.cn>
References: <20240625081029.2619437-1-make24@iscas.ac.cn>
Organization: Red Hat Inc.
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

I will push this and the other patch that you sent upstream in just a
moment, thanks!

On Tue, 2024-06-25 at 16:10 +0800, Ma Ke wrote:
> In nv17_tv_get_hd_modes(), the return value of drm_mode_duplicate()
> is
> assigned to mode, which will lead to a possible NULL pointer
> dereference
> on failure of drm_mode_duplicate(). The same applies to
> drm_cvt_mode().
> Add a check to avoid null pointer dereference.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> =C2=A0drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> index 670c9739e5e1..9c3dc9a5bb46 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> @@ -258,6 +258,8 @@ static int nv17_tv_get_hd_modes(struct
> drm_encoder *encoder,
> =C2=A0=09=09if (modes[i].hdisplay =3D=3D output_mode->hdisplay &&
> =C2=A0=09=09=C2=A0=C2=A0=C2=A0 modes[i].vdisplay =3D=3D output_mode->vdis=
play) {
> =C2=A0=09=09=09mode =3D drm_mode_duplicate(encoder->dev,
> output_mode);
> +=09=09=09if (!mode)
> +=09=09=09=09continue;
> =C2=A0=09=09=09mode->type |=3D DRM_MODE_TYPE_PREFERRED;
> =C2=A0
> =C2=A0=09=09} else {
> @@ -265,6 +267,8 @@ static int nv17_tv_get_hd_modes(struct
> drm_encoder *encoder,
> =C2=A0=09=09=09=09=09=C2=A0=C2=A0=C2=A0 modes[i].vdisplay, 60,
> false,
> =C2=A0=09=09=09=09=09=C2=A0=C2=A0=C2=A0 (output_mode->flags &
> =C2=A0=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0
> DRM_MODE_FLAG_INTERLACE), false);
> +=09=09=09if (!mode)
> +=09=09=09=09continue;
> =C2=A0=09=09}
> =C2=A0
> =C2=A0=09=09/* CVT modes are sometimes unsuitable... */

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

