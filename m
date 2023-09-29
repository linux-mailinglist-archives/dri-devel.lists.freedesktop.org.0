Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608B97B3B39
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 22:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D318310E133;
	Fri, 29 Sep 2023 20:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327CD10E133
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 20:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696019063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ewZiFHUKmV9xtcbcuN23GQRTu/CBTIx2ARUrFl0HY20=;
 b=QalgCQB/SqnObkPb0I9fzOK1aOu9LvyZf+VovywgoWH5iCqOxst+jYtKeFBtccbfhv9EQt
 WrzbjogUwaRQ0xW/NdxVsO5n8sJrRToh5qOcZgg4ZbRPAMVAJegA6CVwMLYrVe9COcKPsg
 qus7aWdo3ESTqhYLtHznWJKtAxF/KLg=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-jH0f9WoFMOeB5JtmVe0Nnw-1; Fri, 29 Sep 2023 16:24:21 -0400
X-MC-Unique: jH0f9WoFMOeB5JtmVe0Nnw-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-1dcdb642868so27822631fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 13:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696019061; x=1696623861;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6AMpb+2gDgq7RlPrOwXqsC5rvICGHGcOSn62cpzrOUk=;
 b=dpOuG9/P09fUcgKHb9YIk35e5GPKbscJEMsz+K8+rw2/L/Os5nkWlUWMFkyKW+qPkx
 LuJhBtDpLNBq/xBwGS3WZrYT54FPrskwg4N+3vJzBO2WPSBkzLI81njGBrEWK5XzwHfA
 dcBOcZX1jAA8MMATzwFZfVcyeiFZzGQTRyPbGnUhlaQ8c7O26b2sD5zb+aD+e0/+Qwfw
 SmsPcLj19MfZ8Xuu4b+HmzRRdbW/n8wfm7m9J8E9g/F/rEUm7ugXS53h+dKT+KQ6Ld0D
 horBu53xNWcggxqLo6m/NdtBCZipqent1Sq2x4CkVZ5V/JtkC5sWm7dA+sy3yVjZxxAP
 iqpA==
X-Gm-Message-State: AOJu0Yz8YI0HOVwwRMAj/Tu/hTdeyPTYuCYho06Qjal43s9sD+Vz+e9r
 /4Bib+qBDIoZyZS+BiV5dnSzFmdMDrr7tmXQDqFhH8J02r4C8cWQnZj7DlGDaEkTSL19NwK+N/g
 fQdc6LWzXUU1XTA+3tTA+KHAuZNlFOFEoiT1W
X-Received: by 2002:a05:6870:b507:b0:1c0:d0e8:8fda with SMTP id
 v7-20020a056870b50700b001c0d0e88fdamr6227164oap.16.1696019060835; 
 Fri, 29 Sep 2023 13:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvm09Ewxw9lUjDhCKZhnPdCxi8jwKEnZc5hS6eklkvEm8RJG8FijD4Ce7C0XS6xgeA7v/m9A==
X-Received: by 2002:a05:6870:b507:b0:1c0:d0e8:8fda with SMTP id
 v7-20020a056870b50700b001c0d0e88fdamr6227152oap.16.1696019060595; 
 Fri, 29 Sep 2023 13:24:20 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 vu4-20020a05620a560400b00774309d3e89sm4398580qkn.7.2023.09.29.13.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 13:24:20 -0700 (PDT)
Message-ID: <9e699068d5cb644201a8b9be113a94a90299ac39.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: fence: fix type cast warning in
 nouveau_fence_emit()
From: Lyude Paul <lyude@redhat.com>
To: Danilo Krummrich <dakr@redhat.com>, nouveau@lists.freedesktop.org
Date: Fri, 29 Sep 2023 16:24:19 -0400
In-Reply-To: <20230916011501.15813-1-dakr@redhat.com>
References: <20230916011501.15813-1-dakr@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, kherbst@redhat.com,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sat, 2023-09-16 at 03:14 +0200, Danilo Krummrich wrote:
> Fix the following warning.
>=20
>   drivers/gpu/drm/nouveau/nouveau_fence.c:210:45: sparse: sparse:
>   incorrect type in initializer (different address spaces)
>   @@     expected struct nouveau_channel *chan
>   @@     got struct nouveau_channel [noderef] __rcu *channel
>=20
> We're just about to emit the fence, there is nothing to protect against
> yet, hence it is safe to just cast __rcu away.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309140340.BwKXzaDx-lkp@i=
ntel.com/
> Fixes: 978474dc8278 ("drm/nouveau: fence: fix undefined fence state after=
 emit")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/no=
uveau/nouveau_fence.c
> index 61d9e70da9fd..ca762ea55413 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -207,7 +207,7 @@ nouveau_fence_context_new(struct nouveau_channel *cha=
n, struct nouveau_fence_cha
>  int
>  nouveau_fence_emit(struct nouveau_fence *fence)
>  {
> -=09struct nouveau_channel *chan =3D fence->channel;
> +=09struct nouveau_channel *chan =3D unrcu_pointer(fence->channel);
>  =09struct nouveau_fence_chan *fctx =3D chan->fence;
>  =09struct nouveau_fence_priv *priv =3D (void*)chan->drm->fence;
>  =09int ret;

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

