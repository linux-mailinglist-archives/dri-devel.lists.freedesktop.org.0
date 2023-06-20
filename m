Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AC373755A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 21:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3070410E380;
	Tue, 20 Jun 2023 19:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DE110E380
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 19:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687290631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nnnokaQoTXYn2lB1qKIyKOaQFMugDXvRLhxLjxtbNBI=;
 b=ZRn14/UbMOAsJf2yVlVAsxLE3hmou2Sz5sMYL1ED1PJR6/WfwwXaSEPBOvvsLjgYhJ6Wn9
 f7l8K0AejEgUfo61xrrURsg0/ov01iLLdjRmHB4Cu2l4H/QT3ir1qAdPNYge+JhjczxYmG
 Ovpe7EQVsv9He+Ci9/sV2okPpaT347o=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-Wo0-mUdeOkKHKt7Pa7hmfg-1; Tue, 20 Jun 2023 15:50:29 -0400
X-MC-Unique: Wo0-mUdeOkKHKt7Pa7hmfg-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-62ff96335b0so51452126d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 12:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687290626; x=1689882626;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+6ucTdIAb48KkpphrkEbKr8Pmm/qOe0nUhjp8QpDWVY=;
 b=MeYjoEG0QU9rZgemDd4uu512yuel3LHn4gw+UwckioCrYUeS2PjJyecsqZfd14m28Y
 FXXSlz3EdTLzsZHkNvcW0JzbqGWRG5MLQYCG6k3UEeLFLVJp+MH4KU3dwmrJNweLlcEP
 0m/ULqA6EJDfvKM1aNVpDlxUjLX3mRdXaaPNs5+BFBvkrmitZMpjPTvQ4jpYC0+3CY+c
 kGfTUD/lFaIZYDqxF04m0H2I/RcKWZ0nRp4M3P2vsC6edcs282bQqECNn31LUyx1aspv
 Wtx8KauPPqs8puqMH0aQnzGs+pl0KH1aNjX2EmMU/oOV/OVO83k05wHBcdnD/CCpDgIC
 MlVQ==
X-Gm-Message-State: AC+VfDzAHLXnYLt3Js7Le++ABdYRjQMUqQqCz0iNRwXZTg6+YfmacyUt
 /uFKH8xaVYXZd3IibTP33W0sz5NTX7Xd1Xa4swiDXDCxhUT2ogfU9C1B8Z7W8zl3EUHQWjLrdoR
 t2pvqhLeTVyxBzlUlQeJhHMGiQJAZ
X-Received: by 2002:a05:6214:21a9:b0:630:1bc8:9c8 with SMTP id
 t9-20020a05621421a900b006301bc809c8mr7356311qvc.13.1687290625895; 
 Tue, 20 Jun 2023 12:50:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6GILEoSu57RIihBnk3ZDC3l1XHJzoGQ53+iPFuodcdHgryd/P+NBe9CAKco3ZkyvbVHMUymw==
X-Received: by 2002:a05:6214:21a9:b0:630:1bc8:9c8 with SMTP id
 t9-20020a05621421a900b006301bc809c8mr7356295qvc.13.1687290625548; 
 Tue, 20 Jun 2023 12:50:25 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a0cb2ce000000b00630173b9a7asm1598177qvf.71.2023.06.20.12.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 12:50:24 -0700 (PDT)
Message-ID: <dd8edd9405049b09cd30ea13e5ae5562a437a2d3.camel@redhat.com>
Subject: Re: [PATCH v2] drm: use mgr->dev in drm_dbg_kms in
 drm_dp_add_payload_part2
From: Lyude Paul <lyude@redhat.com>
To: Jeff Layton <jlayton@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 20 Jun 2023 15:50:24 -0400
In-Reply-To: <4400e47d6555ed773d1e9cab5566c03429d43ae9.camel@kernel.org>
References: <20230419112447.18471-1-jlayton@kernel.org>
 <d0b9654c756069a6f0edcca6f4d410f7af592784.camel@redhat.com>
 <4400e47d6555ed773d1e9cab5566c03429d43ae9.camel@kernel.org>
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

Eek - this might have been a situation where everyone involved assumed some=
one
else would push it, whoops. I'll make sure this is pushed upstream :).

FWIW: You could definitely send an MR to the fedora kernel's gitlab to get
this included earlier. If you don't get to it before me I'll try to do that
today

On Tue, 2023-06-20 at 07:18 -0400, Jeff Layton wrote:
> I've noticed that this patch is not included in linux-next currently.
>=20
> Can I get some confirmation that this is going to be included in v6.5?
> Currently, I've been having to rebuild Fedora kernels to avoid this
> panic, and I'd like to know there is a light at the end of that tunnel.
>=20
> Thanks,
> Jeff
>=20
> On Wed, 2023-04-19 at 16:54 -0400, Lyude Paul wrote:
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> >=20
> > Thanks!
> >=20
> > On Wed, 2023-04-19 at 07:24 -0400, Jeff Layton wrote:
> > > I've been experiencing some intermittent crashes down in the display
> > > driver code. The symptoms are ususally a line like this in dmesg:
> > >=20
> > >     amdgpu 0000:30:00.0: [drm] Failed to create MST payload for port =
000000006d3a3885: -5
> > >=20
> > > ...followed by an Oops due to a NULL pointer dereference.
> > >=20
> > > Switch to using mgr->dev instead of state->dev since "state" can be
> > > NULL in some cases.
> > >=20
> > > Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2184855
> > > Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > ---
> > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > I've been running this patch for a couple of days, but the problem
> > > hasn't occurred again as of yet. It seems sane though as long as we c=
an
> > > assume that mgr->dev will be valid even when "state" is a NULL pointe=
r.
> > >=20
> > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/=
gpu/drm/display/drm_dp_mst_topology.c
> > > index 38dab76ae69e..e2e21ce79510 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > @@ -3404,7 +3404,7 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_=
topology_mgr *mgr,
> > > =20
> > >  =09/* Skip failed payloads */
> > >  =09if (payload->vc_start_slot =3D=3D -1) {
> > > -=09=09drm_dbg_kms(state->dev, "Part 1 of payload creation for %s fai=
led, skipping part 2\n",
> > > +=09=09drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s faile=
d, skipping part 2\n",
> > >  =09=09=09    payload->port->connector->name);
> > >  =09=09return -EIO;
> > >  =09}
> >=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

