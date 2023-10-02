Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358017B5A9E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 20:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC8B10E227;
	Mon,  2 Oct 2023 18:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C2410E21F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 18:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696273108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EGNa1xr9dVJClNC/hmiFO6gNvSEzJS7L4kJGy1CQbyA=;
 b=fD3qgYUjNwZUe0PMZsTOwvAfH8igTQkktAEkr1wsyDUU67lHW9Zo9GXXe/tMbfiuQtY1S3
 fDzuowgbwCPLk685kXI4M7SrlLp4S9cGD2ffd8gqz/LjsLLjIKNSovxO0auAk4Aa9PUzFp
 4SqcI98jhw+jrRiNtDSozxX7agDoes0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-E_87DbhjPBO1zedmnmd3Mw-1; Mon, 02 Oct 2023 14:58:26 -0400
X-MC-Unique: E_87DbhjPBO1zedmnmd3Mw-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7740c0e88ffso18833485a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 11:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696273106; x=1696877906;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TPjWE/fwf7KsUGXjjsz0HVK1W6Mzf4sfbKxCMUto/gU=;
 b=b3XdxVXanoo/qTKtd8JzS8AeGuOlrKt4SLh8lFyQ3aP8sLEM/C+tE7nOPaxJrDpLYj
 aRg+epmbyikfnBHDjpkL7bc81Zxv0PMApYH0lEeOdjNJ/DNNy3oluIz0/A3/yfSsaNdh
 a4XJpRya4zrqr+DtCtiFK6Xa1IV6AOhKa6TL8FOmS+JkJYprC8quJxAwe07krGChmf93
 1kBmX+CRhw/CHTqxk8Php1iE1uqyeztD+YXqczl2g8cv0PztZFa4/rUCx3RcnCQ35LMF
 Im4YQe95Br7ChQYmJHIWE50fyXrYUaDqRvpsVvJm737DMXgasqEBuWvYRvgrL/oEXSOw
 blBA==
X-Gm-Message-State: AOJu0YwlmbpDFy408fMt4TN3xt/mv55F+vrCzuwJMGKle340n5neMhjC
 N4B7EQG/Lm/3GZNqafFlQeH3MVBa0wlkgSe8i8uFsehlhxKSQ8tccQJqgDgypDsmUaRYOURcZC6
 K902PhfyFvNnjTb6h7enmV/gIlh05
X-Received: by 2002:a05:620a:2099:b0:775:7339:68f8 with SMTP id
 e25-20020a05620a209900b00775733968f8mr11843377qka.57.1696273106044; 
 Mon, 02 Oct 2023 11:58:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzC8D2AZ9hblHwHu6cd6XI9ESJtzXDAnBlh/+KUDLaB/humaF4Fj/v770LkQU4U4z4B7OJtw==
X-Received: by 2002:a05:620a:2099:b0:775:7339:68f8 with SMTP id
 e25-20020a05620a209900b00775733968f8mr11843360qka.57.1696273105746; 
 Mon, 02 Oct 2023 11:58:25 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a05620a038900b0076cb1eff83csm3635903qkm.5.2023.10.02.11.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 11:58:24 -0700 (PDT)
Message-ID: <8e78b86a8f3201a943a333fedc5f282cd0f46fc4.camel@redhat.com>
Subject: Re: [PATCH v2 1/3] drm/nouveau: chan: use struct nvif_mclass
From: Lyude Paul <lyude@redhat.com>
To: Danilo Krummrich <dakr@redhat.com>, nouveau@lists.freedesktop.org, 
 faith@gfxstrand.net
Date: Mon, 02 Oct 2023 14:58:22 -0400
In-Reply-To: <20231002135008.10651-1-dakr@redhat.com>
References: <20231002135008.10651-1-dakr@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, kherbst@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2023-10-02 at 15:46 +0200, Danilo Krummrich wrote:
> Use actual struct nvif_mclass instead of identical anonymous struct.
>=20
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_chan.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nou=
veau/nouveau_chan.c
> index 1fd5ccf41128..dffbee59be6a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> @@ -259,10 +259,7 @@ static int
>  nouveau_channel_ctor(struct nouveau_drm *drm, struct nvif_device *device=
, bool priv, u64 runm,
>  =09=09     struct nouveau_channel **pchan)
>  {
> -=09static const struct {
> -=09=09s32 oclass;
> -=09=09int version;
> -=09} hosts[] =3D {
> +=09const struct nvif_mclass hosts[] =3D {
>  =09=09{  AMPERE_CHANNEL_GPFIFO_B, 0 },
>  =09=09{  AMPERE_CHANNEL_GPFIFO_A, 0 },
>  =09=09{  TURING_CHANNEL_GPFIFO_A, 0 },

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

