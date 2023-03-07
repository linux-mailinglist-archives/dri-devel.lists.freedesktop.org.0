Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F16EF6AF91C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 23:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A163510E561;
	Tue,  7 Mar 2023 22:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F6910E561
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 22:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678228991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bBISRmWtyk5b0q7tO/ZlpLIwLMdyIaEEvwZMNTD2oyo=;
 b=LnhD8ZopbZZz6e9Rn9+o+e3d+qD1qJNluPe3gkNt0xwI5PeCpDF/vDrBcDmhuALu0s8iuy
 gJH+ogCO9ro4ZUSahvmWP4X5TKf8lVWRyu++5NY4KKE2MVwIcep6NXGITo4oD3wTff+tqF
 Ogvk4/WOmL6N3FGLLR0hSaN//xL56xA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-CdG-QbbzOHqMdJOgLoxaFg-1; Tue, 07 Mar 2023 17:43:10 -0500
X-MC-Unique: CdG-QbbzOHqMdJOgLoxaFg-1
Received: by mail-qv1-f71.google.com with SMTP id
 x10-20020ad440ca000000b005800220da38so7148248qvp.14
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 14:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678228990;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bBISRmWtyk5b0q7tO/ZlpLIwLMdyIaEEvwZMNTD2oyo=;
 b=gAXew6khLlI8yaNkKWv/wOcYz5m4x3q4FSiKbBmSomnM9JkSvnMwAYC9FNRIb1g4nu
 gMqkNDSIoysj6G+ab8Ns9LlLzuWlSW7pb/cor7R62CihjIZgT8AksSxPw8XyR3WXpMic
 S0wUyZmrsSke6RdvpzYNwyGobTi8V4YdtikzeaBGQF79loVO9twNWS/ak+NBru8X4F4H
 mSoBEr8GlvBkh1YHFvLGWqdt7KFXaSqbgSEySPfLpMfOHt/deO82m2fXfsKGt8RJ2Vma
 YXBY7jHQB1NeS4/C2Z1xGeTgkJN59BXxr+0UMXl9exUBjDBOFGbZJiyhEhQsOHH+wcxh
 4A2g==
X-Gm-Message-State: AO0yUKWjM55oixSbA+wo0P416wcJos3fDekDOaqKvfj0JRAW4kYPexyK
 mibcuqNyYFdg2jLpcfLpf3294ij6lh/MOl9N10I29Mhvtcex2k/qHZ6AXcHwdGIrzTjiNtqSawJ
 tHqNKI2PX45lDuqMqSINqtIWA9d8r
X-Received: by 2002:ac8:5c02:0:b0:3b8:525e:15ec with SMTP id
 i2-20020ac85c02000000b003b8525e15ecmr30590754qti.27.1678228989823; 
 Tue, 07 Mar 2023 14:43:09 -0800 (PST)
X-Google-Smtp-Source: AK7set+Me9bTPhI1hFsGeGjWpMBd7fZ9BKtiTY5Thb2DH2wKRapu1088yY+WA0JY2Qyr92U3nNacYw==
X-Received: by 2002:ac8:5c02:0:b0:3b8:525e:15ec with SMTP id
 i2-20020ac85c02000000b003b8525e15ecmr30590731qti.27.1678228989586; 
 Tue, 07 Mar 2023 14:43:09 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a37ab18000000b006fa16fe93bbsm10313451qke.15.2023.03.07.14.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 14:43:09 -0800 (PST)
Message-ID: <2732d141a82c0f9410d001fe656d30c5e32311de.camel@redhat.com>
Subject: Re: [PATCH 0/2] drm/nouveau: avoid usage of list iterator after loop
From: Lyude Paul <lyude@redhat.com>
To: Jakob Koschel <jkl820.git@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Tue, 07 Mar 2023 17:43:07 -0500
In-Reply-To: <20230301-drm-nouveau-avoid-iter-after-loop-v1-0-0702ec23f970@gmail.com>
References: <20230301-drm-nouveau-avoid-iter-after-loop-v1-0-0702ec23f970@gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
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
Cc: nouveau@lists.freedesktop.org, Pietro Borrello <borrello@diag.uniroma1.it>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push upstream in just a moment

On Wed, 2023-03-01 at 18:25 +0100, Jakob Koschel wrote:
> This patch set includes two instances where the list iterator variable
> 'pstate' is implicitly assumed to be valid after the iterator loop.
> While in pratice that is most likely the case (if
> 'pstatei'/'args->v0.state' is <=3D the elements in clk->states), we shoul=
d
> explicitly only allow 'pstate' to always point to correct 'nvkm_pstate'
> structs.
>=20
> That allows catching potential bugs with BUG_ON(!pstate) that otherwise
> would be completely undetectable.
>=20
> It also helps the greater mission to hopefully move the list iterator
> variable into the iterating macro directly [1].
>=20
> Link: https://lore.kernel.org/all/CAHk-=3DwgRr_D8CB-D9Kg-c=3DEHreAsk5SqXP=
wr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
> Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
> ---
> Jakob Koschel (2):
>       drm/nouveau/device: avoid usage of list iterator after loop
>       drm/nouveau/clk: avoid usage of list iterator after loop
>=20
>  drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 9 ++++++---
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c    | 9 ++++++---
>  2 files changed, 12 insertions(+), 6 deletions(-)
> ---
> base-commit: c0927a7a5391f7d8e593e5e50ead7505a23cadf9
> change-id: 20230301-drm-nouveau-avoid-iter-after-loop-4bff97166efa
>=20
> Best regards,

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

