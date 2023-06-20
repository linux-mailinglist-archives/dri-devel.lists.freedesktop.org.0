Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59228737576
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 21:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F78410E383;
	Tue, 20 Jun 2023 19:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463EE10E383
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 19:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687291176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V0qCc6Jn9ofU40VH52Y/qN92eudmJABfwHsG1VA+hGI=;
 b=fpDIyCyN0K4ScJLQfGK+8XEffE+9AouW5S+5b4ufdmx0KNS+nMPw1K+2jjC7l209aWzZbG
 uAyMvZdBqbcjLWPSZ1tPNbRwKdOhSDbENp0IKh+6XelfNX5RH9QSK+joaC/2HIv4YAVc4d
 QVHQ4m+7sTZJDkZn53HjyZV2cKS1Obo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-Fj-_ynvLNsuIZIOXonsDdg-1; Tue, 20 Jun 2023 15:59:34 -0400
X-MC-Unique: Fj-_ynvLNsuIZIOXonsDdg-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-62ff0c52cdcso64797756d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 12:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687291166; x=1689883166;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8nDkX/u4zkhYkl8D9Eltwlq6VfSNd8Ak1NeiW21WxpE=;
 b=Ek2KyF0N99fxATug4Zm/3FGWeR7BhVIg/ShyGiJLHxk7HvgIVnhpHLMkzSK8xN/p+6
 3hN9gXfVs+gcgfZutsA+EIHROLm7+XB6UsbVwZwwjRCe4meyjN/7YiCjF3cgUEsdzsBG
 j/w/VkAtxptQMseeOrvaZKWYfFL+vX4bCHnAD3wW4bVfXFTfYarMHGxQoKFa1fdKlXT0
 UKGnycfwCGRL7mRqSGpd3h96ErvMgqME3dZ9a2NIajmaA5BcbsKqr6rxNbcCkP0DiP4N
 kAxGdH/aNaPuEwEdlzrcAWzMg3VQbB1NeYhs6Ch9SpK1x5cMZDMk2u2Yf71VfKPmAHqg
 SXvQ==
X-Gm-Message-State: AC+VfDw5AvS4e2PhjhjrqgZvLsAk3mrXORIf0mmpgdsmCuqQQuAd7E7U
 WWeLLBt8ZmOAmPbEThr/inRob2JCB9MMsGP5jJ/OczwCTOyEILlc9Msvg17CnZJRie2fbCpKTl2
 P9++wzZ8HQOJH5Es46Yx4EpMsccLk
X-Received: by 2002:a05:6214:f01:b0:62f:ef74:a304 with SMTP id
 gw1-20020a0562140f0100b0062fef74a304mr18705157qvb.8.1687291166195; 
 Tue, 20 Jun 2023 12:59:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ55Mx2TzRMVHfHKAyGs/tY2KtKOTOfrkOmTeeVyvfrBXj5Ae2gO6QDSWX3vIRrBM2lq/om3Sw==
X-Received: by 2002:a05:6214:f01:b0:62f:ef74:a304 with SMTP id
 gw1-20020a0562140f0100b0062fef74a304mr18705150qvb.8.1687291165967; 
 Tue, 20 Jun 2023 12:59:25 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a0cf310000000b006301bc80875sm1591652qvl.60.2023.06.20.12.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 12:59:25 -0700 (PDT)
Message-ID: <3d47da79a59817b69d5ed7cdaf4fbec227be00d9.camel@redhat.com>
Subject: Re: [PATCH v2] drm: use mgr->dev in drm_dbg_kms in
 drm_dp_add_payload_part2
From: Lyude Paul <lyude@redhat.com>
To: Jeff Layton <jlayton@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 20 Jun 2023 15:59:24 -0400
In-Reply-To: <dd8edd9405049b09cd30ea13e5ae5562a437a2d3.camel@redhat.com>
References: <20230419112447.18471-1-jlayton@kernel.org>
 <d0b9654c756069a6f0edcca6f4d410f7af592784.camel@redhat.com>
 <4400e47d6555ed773d1e9cab5566c03429d43ae9.camel@kernel.org>
 <dd8edd9405049b09cd30ea13e5ae5562a437a2d3.camel@redhat.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wayne.Lin@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also since I forgot, so patchwork picks this up:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2023-06-20 at 15:50 -0400, Lyude Paul wrote:
> Eek - this might have been a situation where everyone involved assumed so=
meone
> else would push it, whoops. I'll make sure this is pushed upstream :).
>=20
> FWIW: You could definitely send an MR to the fedora kernel's gitlab to ge=
t
> this included earlier. If you don't get to it before me I'll try to do th=
at
> today
>=20
> On Tue, 2023-06-20 at 07:18 -0400, Jeff Layton wrote:
> > I've noticed that this patch is not included in linux-next currently.
> >=20
> > Can I get some confirmation that this is going to be included in v6.5?
> > Currently, I've been having to rebuild Fedora kernels to avoid this
> > panic, and I'd like to know there is a light at the end of that tunnel.
> >=20
> > Thanks,
> > Jeff
> >=20
> > On Wed, 2023-04-19 at 16:54 -0400, Lyude Paul wrote:
> > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > >=20
> > > Thanks!
> > >=20
> > > On Wed, 2023-04-19 at 07:24 -0400, Jeff Layton wrote:
> > > > I've been experiencing some intermittent crashes down in the displa=
y
> > > > driver code. The symptoms are ususally a line like this in dmesg:
> > > >=20
> > > >     amdgpu 0000:30:00.0: [drm] Failed to create MST payload for por=
t 000000006d3a3885: -5
> > > >=20
> > > > ...followed by an Oops due to a NULL pointer dereference.
> > > >=20
> > > > Switch to using mgr->dev instead of state->dev since "state" can be
> > > > NULL in some cases.
> > > >=20
> > > > Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2184855
> > > > Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> > > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > > ---
> > > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > I've been running this patch for a couple of days, but the problem
> > > > hasn't occurred again as of yet. It seems sane though as long as we=
 can
> > > > assume that mgr->dev will be valid even when "state" is a NULL poin=
ter.
> > > >=20
> > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/driver=
s/gpu/drm/display/drm_dp_mst_topology.c
> > > > index 38dab76ae69e..e2e21ce79510 100644
> > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > @@ -3404,7 +3404,7 @@ int drm_dp_add_payload_part2(struct drm_dp_ms=
t_topology_mgr *mgr,
> > > > =20
> > > >  =09/* Skip failed payloads */
> > > >  =09if (payload->vc_start_slot =3D=3D -1) {
> > > > -=09=09drm_dbg_kms(state->dev, "Part 1 of payload creation for %s f=
ailed, skipping part 2\n",
> > > > +=09=09drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s fai=
led, skipping part 2\n",
> > > >  =09=09=09    payload->port->connector->name);
> > > >  =09=09return -EIO;
> > > >  =09}
> > >=20
> >=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

