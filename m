Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD22672A26
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 22:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869EF10E842;
	Wed, 18 Jan 2023 21:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4789C10E842
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674076515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RhtAeT2esZ1BGmhaTzW/+LOxjLKC5QJx+oLGoid9/jY=;
 b=Ac8aktbuh89uXn2WHE3aN5vUqB46QCi+a3UFVKpM1VkjRzN9P0mQoXSxfYaZ1FENN9F0wC
 Au3ZFOoTdE+yVHo80Wnfh442rdEzlYrh91GG7wfRpMT/xlfMA03l27OeKvjKa/jebAlFnO
 QxXCzwOsbN2KLOg3NNdY7jC+HU3Jxvg=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-297-i46IaG-1M1CiWsfuUS56IA-1; Wed, 18 Jan 2023 16:15:14 -0500
X-MC-Unique: i46IaG-1M1CiWsfuUS56IA-1
Received: by mail-vk1-f199.google.com with SMTP id
 t6-20020a1faa06000000b003e17e0a18b8so2798318vke.23
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 13:15:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kj6mRVygT6QUP/wvKSN21DvH9DAAlDmgJyA5Hyjx0vM=;
 b=aAUXBfpQ6YKeYwaoz9qBJE6Xie6SL2RSXViwFGjh2MnXg0w5pb/MMr2ML9PLULYdKi
 GP7QGO2P3lXj+AA1/4cDRm+bxie4z86gJ9U1AwVUS2TAyWXyIdz5bUcEzN0+A7x+fuxr
 g60zB+pkqiLvxoERvlGvYyRU0qlX6VpvEqO3JgwfWUXDIyss0sjFDYolA4OMpbUqoggS
 C3fE+faX30H8zoqM2GUQX1xAA5ochTsBVQjE/Oo7nUsSEKo5KbnQXQSc6UdlRfjUn4I9
 TgGq2VScNirrwPCPZkksFEGKlOvmbFbrXysY46nB3K/RjPaaULvIOjG8YRBvNxQRKtwR
 rOmQ==
X-Gm-Message-State: AFqh2kqBzud/9mRcY6nUThiktHC3VMqzIuqk2DFRTFowI5kztfUGliBF
 0z9YcB/0S7uV5g1myqN3cKHE9LcgCN95kgZQ2lmvd2uQ4Sg84lgmiebiVQ7I4k/tlS2jPCsPQeg
 Jn4+dVcUpKPtJCEkMLD71A/0xdRGL
X-Received: by 2002:a05:6102:440d:b0:3d3:ef7b:811 with SMTP id
 df13-20020a056102440d00b003d3ef7b0811mr5834888vsb.3.1674076513659; 
 Wed, 18 Jan 2023 13:15:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvlvAYX7NMH3LENEC6NgBFUsaiWOj+2yarTbefQvzZCnX3XRyFmfyDZlj5ag9c4D8dDBW50qw==
X-Received: by 2002:a05:6102:440d:b0:3d3:ef7b:811 with SMTP id
 df13-20020a056102440d00b003d3ef7b0811mr5834875vsb.3.1674076513438; 
 Wed, 18 Jan 2023 13:15:13 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 bj3-20020a05620a190300b00705975d0054sm23124440qkb.19.2023.01.18.13.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 13:15:13 -0800 (PST)
Message-ID: <c532ea34f7854217064e0fe1a2b6444f878e9c67.camel@redhat.com>
Subject: Re: [RESEND][PATCH] drm/nouveau/fb/ga102: Replace zero-length array
 of trailing structs with flex-array
From: Lyude Paul <lyude@redhat.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook
 <keescook@chromium.org>
Date: Wed, 18 Jan 2023 16:15:11 -0500
In-Reply-To: <Y7TNtQqunHIW8her@work>
References: <20230103234835.never.378-kees@kernel.org> <Y7TNtQqunHIW8her@work>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi! Sorry for the late response, I've had my head buried in some regression=
s
from AMD for a while now and am now just catching up on my email.

Does this still need to be pushed upstream?

On Tue, 2023-01-03 at 18:52 -0600, Gustavo A. R. Silva wrote:
> On Tue, Jan 03, 2023 at 03:48:36PM -0800, Kees Cook wrote:
> > Zero-length arrays are deprecated[1] and are being replaced with
> > flexible array members in support of the ongoing efforts to tighten the
> > FORTIFY_SOURCE routines on memcpy(), correctly instrument array indexin=
g
> > with UBSAN_BOUNDS, and to globally enable -fstrict-flex-arrays=3D3.
> >=20
> > Replace zero-length array with flexible-array member.
> >=20
> > This results in no differences in binary output.
> >=20
> > [1] https://github.com/KSPP/linux/issues/78
> >=20
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Karol Herbst <kherbst@redhat.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Gourav Samaiya <gsamaiya@nvidia.com>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: nouveau@lists.freedesktop.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
>=20
> Here is my RB again:
>=20
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>=20
> Thanks!
> --
> Gustavo
>=20
> > ---
> > Sent before as: https://lore.kernel.org/all/20221118211207.never.039-ke=
es@kernel.org/
> > ---
> >  drivers/gpu/drm/nouveau/include/nvfw/hs.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/include/nvfw/hs.h b/drivers/gpu/dr=
m/nouveau/include/nvfw/hs.h
> > index 8c4cd08a7b5f..8b58b668fc0c 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> > @@ -52,7 +52,7 @@ struct nvfw_hs_load_header_v2 {
> >  =09struct {
> >  =09=09u32 offset;
> >  =09=09u32 size;
> > -=09} app[0];
> > +=09} app[];
> >  };
> > =20
> >  const struct nvfw_hs_load_header_v2 *nvfw_hs_load_header_v2(struct nvk=
m_subdev *, const void *);
> > --=20
> > 2.34.1
> >=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

