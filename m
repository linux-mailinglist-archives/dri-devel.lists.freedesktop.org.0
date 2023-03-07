Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B956AF928
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 23:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140C810E071;
	Tue,  7 Mar 2023 22:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908FD10E071
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 22:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678229208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D+lMV0jdd+rVbHQRucIl145VMEMkgnli2TmhEhYF6aE=;
 b=N1eBZkRCyy+8lq3a5tWstwejp5m8lXwtjhUe+S2Emc9lkWM1V2rgtvowHqYq+OxJ0ROlvr
 sMlE9YBFoXsjCy1bmAgqh6BW24BVeVind5/A0RDsJicD93yUR2KD2U4Z7TK581Pd6OoAVO
 fr3a57pAc5OkvLnH4VHQ5qoRA2Bzzz8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-5ntDpWz9OEevXO31qeNy0w-1; Tue, 07 Mar 2023 17:46:47 -0500
X-MC-Unique: 5ntDpWz9OEevXO31qeNy0w-1
Received: by mail-qk1-f198.google.com with SMTP id
 x14-20020ae9e90e000000b007429af46d5eso8249872qkf.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 14:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678229207;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D+lMV0jdd+rVbHQRucIl145VMEMkgnli2TmhEhYF6aE=;
 b=dwrXPMunPB1vuOq1PlUl8BVQUWSbLWMwsIADo7IByudnwGVQF5awamxKngHZzRIQNw
 GxebycihOAcPgtaDRZvh4znJeDgxTEfWZo6FKGeJuJQXUJNaAEgKmy8yy/BHTOJzRm2K
 z7zUyP+pwHqvaRK0w5YNh9v/puazlqpkDCVwsM9oEJN8/AJYN7QG5XYISCerxg1ZFTif
 WSXG7W7b+uQEqMUowtxRV4c+yeZyrFV4/c0h8PkyF5T34FXH14GGLdhEDUesLQKs8Yxg
 jSXLKa7HQW7lA2dfvVlF9isKDQVAgCNvt76lpCbBPjWqkZcXIPYq9u+nOXxhiuEyrKUG
 Wc7Q==
X-Gm-Message-State: AO0yUKXgPXQgFqSNLs4n0nfmWibO9e7T40grFPfJXiI3tu4+/YKX3MgZ
 BKSVEHx/2jkQKWcF23ydf+kf9MMkrSLB3EYbSpdrZOuVRHunP7u5a6+C83QIu56itP10fDxeDW0
 xEiXjqNPa3M1SUMnncwUZWRmgDs55
X-Received: by 2002:a05:622a:24c:b0:3bf:d07e:ee17 with SMTP id
 c12-20020a05622a024c00b003bfd07eee17mr27703396qtx.39.1678229207428; 
 Tue, 07 Mar 2023 14:46:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8P1yL5WfXGleyVYacQ3ibXaMhN21P0MtcWzIXGgZJYC6emze48ZF0Sor8oqXZOxb/jcDhmSA==
X-Received: by 2002:a05:622a:24c:b0:3bf:d07e:ee17 with SMTP id
 c12-20020a05622a024c00b003bfd07eee17mr27703371qtx.39.1678229207119; 
 Tue, 07 Mar 2023 14:46:47 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 w19-20020ac843d3000000b003bfbf3afe51sm10369764qtn.93.2023.03.07.14.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 14:46:46 -0800 (PST)
Message-ID: <160cbdb25510df6f2e3194c6dd4a2c47a4ee70b7.camel@redhat.com>
Subject: Re: [PATCH 0/2] drm/nouveau: avoid usage of list iterator after loop
From: Lyude Paul <lyude@redhat.com>
To: Jakob Koschel <jkl820.git@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Tue, 07 Mar 2023 17:46:45 -0500
In-Reply-To: <2732d141a82c0f9410d001fe656d30c5e32311de.camel@redhat.com>
References: <20230301-drm-nouveau-avoid-iter-after-loop-v1-0-0702ec23f970@gmail.com>
 <2732d141a82c0f9410d001fe656d30c5e32311de.camel@redhat.com>
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

Actually hm, dim is warning me about this and making me realize there's
probably a better way to handle this, going to revoke the previous r-b I ga=
ve
and respond inline

On Tue, 2023-03-07 at 17:43 -0500, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>=20
> Will push upstream in just a moment
>=20
> On Wed, 2023-03-01 at 18:25 +0100, Jakob Koschel wrote:
> > This patch set includes two instances where the list iterator variable
> > 'pstate' is implicitly assumed to be valid after the iterator loop.
> > While in pratice that is most likely the case (if
> > 'pstatei'/'args->v0.state' is <=3D the elements in clk->states), we sho=
uld
> > explicitly only allow 'pstate' to always point to correct 'nvkm_pstate'
> > structs.
> >=20
> > That allows catching potential bugs with BUG_ON(!pstate) that otherwise
> > would be completely undetectable.
> >=20
> > It also helps the greater mission to hopefully move the list iterator
> > variable into the iterating macro directly [1].
> >=20
> > Link: https://lore.kernel.org/all/CAHk-=3DwgRr_D8CB-D9Kg-c=3DEHreAsk5Sq=
XPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
> > Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
> > ---
> > Jakob Koschel (2):
> >       drm/nouveau/device: avoid usage of list iterator after loop
> >       drm/nouveau/clk: avoid usage of list iterator after loop
> >=20
> >  drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 9 ++++++---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c    | 9 ++++++---
> >  2 files changed, 12 insertions(+), 6 deletions(-)
> > ---
> > base-commit: c0927a7a5391f7d8e593e5e50ead7505a23cadf9
> > change-id: 20230301-drm-nouveau-avoid-iter-after-loop-4bff97166efa
> >=20
> > Best regards,
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

