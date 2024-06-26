Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072EA918731
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 18:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7C410E940;
	Wed, 26 Jun 2024 16:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NsU5qx/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675B310E955
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719418836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9PywJRmVRO51IecRdCJVp7jzEo8Dz719xyLPPSvHBI=;
 b=NsU5qx/d5lLyBy1ajfgIoxDi320KSQ0WvkZi5evEY61mpmWk03lx+dCrpPCS4LuFKiJUIO
 6j4PaJ+zg1s7nzYgab+S+JfgRBoROD/8ycnstTxi5dpe0mfugw6G/GUb003YBUMpps0QZR
 zHZBXFp1W47H8FRSODTmFIbpZOGfe4I=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-fxMP7vl3PI6ovm2VT21D9A-1; Wed, 26 Jun 2024 12:20:33 -0400
X-MC-Unique: fxMP7vl3PI6ovm2VT21D9A-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-440647edfeaso109262271cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719418832; x=1720023632;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CyeK3GRLaHegaYbR5xPpklmA5OzN7TqqvirmtcOmEwo=;
 b=oTVHZmUc5VPZX7GZ6NlgjkCRQX1OVdx4pOyYTX7I6QfXfiRoFJJGD50yq29PdSXUMa
 zjJxbMhuh6/SgyeX632Dca5rACfXc9Xxc+YA4F6VDR3Ub9Hs7ajtWxXW3gmSqQtV+2Nk
 mTCNW+Jos1BM90mSfD+0VlPzsGmLknmSwAt1O9UCku453yEUFSxBitt0TByJwZUsdu/I
 jHgzKWWq24vPbXze/4uZ41IHz7ePisdgdjA6p7+kQG3X9xFgsRNe5nQQR8zn9XAsHJkj
 D/1ELmh1xZSkrKB9Gny6zvhcn/qkv3pBeYjKMgAe/PQVF6Fn57LvF80SLjmZeBLrau+j
 a4GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG1ptNtnEh55T2txJvqWwYMr7aeubzxJti8pXpOFzL5sSIkIaURHwmYetkuXQHY97BIt6Af4ew2YK3zjsmMIoKTmXu0MHrIn918/I37q8f
X-Gm-Message-State: AOJu0YxuFHaA6CUYs3vCWpMW0R/jsBG9CWkdroo0ss86Skpb3ySYNAv6
 N67k61EMPa8CDQgQh2riFySBA2RhQIy/YNQiHt69W3LWRLl66pgPhK7vNqG7AO9kymSyrc2xaoO
 CYEILS/m/isaa2vqv/+MUKag/k1Hm86WKSG+2v8FKtcS3rTN/hipqaAFdrl3KLxe+8Q==
X-Received: by 2002:a05:622a:1650:b0:43a:f8d3:f4c4 with SMTP id
 d75a77b69052e-444d91a95ebmr127274581cf.21.1719418832505; 
 Wed, 26 Jun 2024 09:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl/6pjwXh3eYxhUg1LhHOVVuXrCojU6GizTbxNkS/2KKtWyqteg6noR/crxypzcYyciERgnQ==
X-Received: by 2002:a05:622a:1650:b0:43a:f8d3:f4c4 with SMTP id
 d75a77b69052e-444d91a95ebmr127274311cf.21.1719418832193; 
 Wed, 26 Jun 2024 09:20:32 -0700 (PDT)
Received: from chopper.lyude.net ([2600:4040:5c4c:a000::789])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44504b1b0f7sm11151541cf.19.2024.06.26.09.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:20:31 -0700 (PDT)
Message-ID: <7da3ccf156a858c1a7d2691fbedfa7aa2ceccdf7.camel@redhat.com>
Subject: Re: [PATCH 2/3] drm/dp_mst: Skip CSN if topology probing is not
 done yet
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, imre.deak@intel.com, daniel@ffwll.ch, 
 Harry.Wentland@amd.com, jerry.zuo@amd.com, Harry Wentland
 <hwentlan@amd.com>,  stable@vger.kernel.org
Date: Wed, 26 Jun 2024 12:20:30 -0400
In-Reply-To: <20240626084825.878565-3-Wayne.Lin@amd.com>
References: <20240626084825.878565-1-Wayne.Lin@amd.com>
 <20240626084825.878565-3-Wayne.Lin@amd.com>
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

Some comments down below:

On Wed, 2024-06-26 at 16:48 +0800, Wayne Lin wrote:
> [Why]
> During resume, observe that we receive CSN event before we start
> topology
> probing. Handling CSN at this moment based on uncertain topology is
> unnecessary.
>=20
> [How]
> Add checking condition in drm_dp_mst_handle_up_req() to skip handling
> CSN
> if the topology is yet to be probed.
>=20
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Harry Wentland <hwentlan@amd.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: stable@vger.kernel.org
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> ---
> =C2=A0drivers/gpu/drm/display/drm_dp_mst_topology.c | 11 +++++++++++
> =C2=A01 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 68831f4e502a..fc2ceae61db2 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4069,6 +4069,7 @@ static int drm_dp_mst_handle_up_req(struct
> drm_dp_mst_topology_mgr *mgr)
> =C2=A0=09if (up_req->msg.req_type =3D=3D DP_CONNECTION_STATUS_NOTIFY) {
> =C2=A0=09=09const struct drm_dp_connection_status_notify
> *conn_stat =3D
> =C2=A0=09=09=09&up_req->msg.u.conn_stat;
> +=09=09bool handle_csn;
> =C2=A0
> =C2=A0=09=09drm_dbg_kms(mgr->dev, "Got CSN: pn: %d ldps:%d ddps:
> %d mcs: %d ip: %d pdt: %d\n",
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0 conn_stat->port_number,
> @@ -4077,6 +4078,16 @@ static int drm_dp_mst_handle_up_req(struct
> drm_dp_mst_topology_mgr *mgr)
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0 conn_stat->message_capability_status,
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0 conn_stat->input_port,
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0 conn_stat->peer_device_type);
> +
> +=09=09mutex_lock(&mgr->probe_lock);
> +=09=09handle_csn =3D mgr->mst_primary->link_address_sent;
> +=09=09mutex_unlock(&mgr->probe_lock);
> +
> +=09=09if (!handle_csn) {
> +=09=09=09drm_dbg_kms(mgr->dev, "Got CSN before finish
> topology probing. Skip it.");
> +=09=09=09kfree(up_req);
> +=09=09=09goto out;
> +=09=09}

Hm. I think you're definitely on the right track here with not handling
CSNs immediately after resume. My one question though is whether
dropping the event entirely here is a good idea? In theory, we could
receive a CSN at any time during the probe - including receiving a CSN
for a connector that we've already probed in the initial post-resume
process, which could result in us missing CSNs coming out of resume and
still having an outdated topology layout.

I'm not totally sure about the solution I'm going to suggest but it
seems like it would certainly be worth trying: what if we added a flag
to drm_dp_mst_topology_mgr called something like "csn_during_resume"
and simply set it to true in response to getting a CSN before we've
finished reprobing? Then we at the end of the reprobe, we can simply
restart the reprobing process if csn_during_resume gets set - which
should still ensure we're up to date with reality.

> =C2=A0=09} else if (up_req->msg.req_type =3D=3D
> DP_RESOURCE_STATUS_NOTIFY) {
> =C2=A0=09=09const struct drm_dp_resource_status_notify *res_stat
> =3D
> =C2=A0=09=09=09&up_req->msg.u.resource_stat;

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

