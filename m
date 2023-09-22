Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F817ABA00
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 21:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F50F10E6A3;
	Fri, 22 Sep 2023 19:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD8010E6A3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 19:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695410636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Myq5gs/1XCs/PqjHMRv+ab8S1OzWmMnEjiAT6nrryik=;
 b=MJDmDs1T2tu/xI07Sm5MDscjswwdzZeiZRqVNsuyQQ9Lmxlvnn4D3sk0kMUqQeBjlGy2d9
 yQh3KDjvsSMuzEG2kTGA/0TyD9qGg0VzG9QP6jrhbq93k8v5KYY78LvM/l06LYtflSgOG6
 SoI3ns1WnjYHYzPw/KrB0Ek4Efbr19A=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-3XFjF3TLOGGlsdhS88ULLA-1; Fri, 22 Sep 2023 15:23:55 -0400
X-MC-Unique: 3XFjF3TLOGGlsdhS88ULLA-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3adbc8aaf29so3753856b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 12:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695410634; x=1696015434;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FWz2594PebN6/sZ7Xi+2z+TcUg7W+ur8FNaCU/72PSU=;
 b=kJb6ofE8nxIvIubb9zdGx8Lyy9pWHJitAi7YA3KZ8IMnV7OiFrMiIB2ftVLy44RQcx
 K0afg4rClaoRMJe8ZzL4Eit907Ek3oO3GHhga/vf4hCVuvLAZwi0nPuk99L+6ZO+toEs
 cLkwqQr6jepEJllsRcx4Qoqo2sC5n4G1SMlCMMYDhf1Eh+esVkpMkQqRSVMAIZkgQ+Zu
 jnoNWIm4s52PuvcJTPmQeeh+DQ0yWdjU19OaS3vrmuS0EHRpZVk5jUfZRVF7FGLBIShz
 98LP+0FS0iSeDPR7xAEaWGff0WU0JB5qmDG1KzXPb/ALxkHyN5jOtu3q3r0JzVEELHVU
 ismQ==
X-Gm-Message-State: AOJu0YysN4+Txnq62Meri5gIOKoHbnHM2Wj5mwl8a+pcvJvHpOttlou2
 WWkDwmM3DtNwilcs5EwkYewdZ0fZRqS1kn4vSWeuQu/dwup3xbt0fPEnZy2ftEriQGAq4albKli
 KYwkD73WzpPC+3+bq8ZnoVlRdKjSB
X-Received: by 2002:a05:6808:f0b:b0:3a7:6385:28ac with SMTP id
 m11-20020a0568080f0b00b003a7638528acmr776353oiw.4.1695410634475; 
 Fri, 22 Sep 2023 12:23:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7i3t/aNow9fEg4WVwOXQACcWlQdpl28s/1sD0IP5eE9lXMGuH+nE1i0GSI+4FI9Z5yq196Q==
X-Received: by 2002:a05:6808:f0b:b0:3a7:6385:28ac with SMTP id
 m11-20020a0568080f0b00b003a7638528acmr776333oiw.4.1695410634158; 
 Fri, 22 Sep 2023 12:23:54 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 a27-20020ac844bb000000b004035843ec96sm1681935qto.89.2023.09.22.12.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 12:23:53 -0700 (PDT)
Message-ID: <b9d52ce542021b88fe602bdd93434d0ddaa188e5.camel@redhat.com>
Subject: Re: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST port
 detect
From: Lyude Paul <lyude@redhat.com>
To: imre.deak@intel.com
Date: Fri, 22 Sep 2023 15:23:52 -0400
In-Reply-To: <ZQ3pbVHRXMiLfUCf@ideak-desk.fi.intel.com>
References: <1694753689-29782-1-git-send-email-quic_rsr@quicinc.com>
 <19ce2cd9abfd3bdf3ea91f9bceb43206e4740c2e.camel@redhat.com>
 <ZQ3pbVHRXMiLfUCf@ideak-desk.fi.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Ramya SR <quic_rsr@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=E2=80=A6ugh, thanks for catching that :|

yes you're completely right - NAK on this patch then

On Fri, 2023-09-22 at 22:22 +0300, Imre Deak wrote:
> On Fri, Sep 22, 2023 at 03:02:23PM -0400, Lyude Paul wrote:
> >=20
> > Oh! wow thank you for catching this:
> >=20
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> >=20
> > I will go and push this to drm-misc-next in just a moment
> >=20
> > On Fri, 2023-09-15 at 10:24 +0530, Ramya SR wrote:
> > > Modeset mutex unlock is missing in drm_dp_mst_detect_port function.
> > > This will lead to deadlock if calling the function multiple times in
> > > an atomic operation, for example, getting imultiple MST ports status
> > > for a DP MST bonding scenario.
> > >=20
> > > Signed-off-by: Ramya SR <quic_rsr@quicinc.com>
> > > ---
> > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/=
gpu/drm/display/drm_dp_mst_topology.c
> > > index ed96cfc..d6512c4 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > @@ -4154,7 +4154,7 @@ drm_dp_mst_detect_port(struct drm_connector *co=
nnector,
> > > =20
> > >  =09ret =3D drm_modeset_lock(&mgr->base.lock, ctx);
> > >  =09if (ret)
> > > -=09=09goto out;
> > > +=09=09goto fail;
> > > =20
> > >  =09ret =3D connector_status_disconnected;
> > > =20
> > > @@ -4181,6 +4181,8 @@ drm_dp_mst_detect_port(struct drm_connector *co=
nnector,
> > >  =09=09break;
> > >  =09}
> > >  out:
> > > +=09drm_modeset_unlock(&mgr->base.lock);
>=20
> Isn't this supposed to be unlocked only by drm_helper_probe_detect_ctx()
> / drm_helper_probe_detect() ?
>=20
> > > +fail:
> > >  =09drm_dp_mst_topology_put_port(port);
> > >  =09return ret;
> > >  }
> >=20
> > --=20
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> >=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

