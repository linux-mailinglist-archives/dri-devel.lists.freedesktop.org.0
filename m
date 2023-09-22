Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F256B7AB9C1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 21:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2968910E6FA;
	Fri, 22 Sep 2023 19:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B97110E6FA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 19:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695409349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kR78thXwOMXcy8IZuuvmvdIb1X14/0E6tKnj10S0NBg=;
 b=JPjPEhty5KnWetREfjEz1gRDA8g24lspgYlXaVe2rW09ru8oaB+SdNoZXzkV3zggb8nLM2
 lbL3x/i6XF29CNZe0O/elf21EDM/Xg4SUxxgmLYdk9eGCzVmfJ5TY3lrz82mH9sBfrN0DQ
 PZcS0d8xBhqGkSfTEWfI5QktgGaBIDM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-gRpbwOyoN0ywv0Oq-0O4ZQ-1; Fri, 22 Sep 2023 15:02:26 -0400
X-MC-Unique: gRpbwOyoN0ywv0Oq-0O4ZQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-412eee4b64cso28034621cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 12:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695409345; x=1696014145;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LHmkUSGxPrlIaYw9c6LuofpUkFimHOYZxkrmsFQmPvA=;
 b=iNIlyy+fzh71hS6Pb94dICZaYsB1zt7sr+wwcNFwiqcSC8/4HhE6eIM1VK4clt26iF
 Jqupcn8G3hP/Zd8wA4I8TqdCFo8dyCrqFF9uRl00WLjr92ujia/xyPObjvQ4lC0syqf1
 GsS3PEwicCaOHc2NNy9CVlfwxX4nOVPRRWLIV8FDVXTQvLvKL8hNqYShC+BbGsGWktl+
 eJ5mLDspCIfbtSO/reClViPGforj+rV3MSE94OyfEQEgH6qnpeULA/K7BGVVyiY5mT2M
 RUKMmtJNpWVKVojPQEjKQ7h4V6r8nJq+YrFxOfaYH1HmERbx5vg7MtRdqDPQLXq91Dlr
 Vg7w==
X-Gm-Message-State: AOJu0Yyt07tY4EtNWWScXU4pjkQsi22RHNAZmHO85JqGCNpaZV8hrrAS
 O2/PPvAxLNi4teUFKWcS1xTW5Z8kjzp45+AyaNtUY6Qr/pT+Jet0BJ9hUx3sf8wDtIFqr5F3Kt2
 sL/wP6ju0kR0PUwbp25uZMR1DRrXw
X-Received: by 2002:a05:622a:3d4:b0:403:b4da:6e53 with SMTP id
 k20-20020a05622a03d400b00403b4da6e53mr341912qtx.44.1695409345033; 
 Fri, 22 Sep 2023 12:02:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbV18P7x/XW/4COmPd32jER+IQbq9RzSsi1dKKADvcR9PdhwtZSP7a81sT/HUxE8JXfLwHug==
X-Received: by 2002:a05:622a:3d4:b0:403:b4da:6e53 with SMTP id
 k20-20020a05622a03d400b00403b4da6e53mr341894qtx.44.1695409344797; 
 Fri, 22 Sep 2023 12:02:24 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 x7-20020ac87ec7000000b0041096c33d02sm639550qtj.17.2023.09.22.12.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 12:02:24 -0700 (PDT)
Message-ID: <19ce2cd9abfd3bdf3ea91f9bceb43206e4740c2e.camel@redhat.com>
Subject: Re: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST port
 detect
From: Lyude Paul <lyude@redhat.com>
To: Ramya SR <quic_rsr@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>, Jani Nikula
 <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jeff Layton <jlayton@kernel.org>,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Fri, 22 Sep 2023 15:02:23 -0400
In-Reply-To: <1694753689-29782-1-git-send-email-quic_rsr@quicinc.com>
References: <1694753689-29782-1-git-send-email-quic_rsr@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Oh! wow thank you for catching this:

Reviewed-by: Lyude Paul <lyude@redhat.com>

I will go and push this to drm-misc-next in just a moment

On Fri, 2023-09-15 at 10:24 +0530, Ramya SR wrote:
> Modeset mutex unlock is missing in drm_dp_mst_detect_port function.
> This will lead to deadlock if calling the function multiple times in
> an atomic operation, for example, getting imultiple MST ports status
> for a DP MST bonding scenario.
>=20
> Signed-off-by: Ramya SR <quic_rsr@quicinc.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index ed96cfc..d6512c4 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4154,7 +4154,7 @@ drm_dp_mst_detect_port(struct drm_connector *connec=
tor,
> =20
>  =09ret =3D drm_modeset_lock(&mgr->base.lock, ctx);
>  =09if (ret)
> -=09=09goto out;
> +=09=09goto fail;
> =20
>  =09ret =3D connector_status_disconnected;
> =20
> @@ -4181,6 +4181,8 @@ drm_dp_mst_detect_port(struct drm_connector *connec=
tor,
>  =09=09break;
>  =09}
>  out:
> +=09drm_modeset_unlock(&mgr->base.lock);
> +fail:
>  =09drm_dp_mst_topology_put_port(port);
>  =09return ret;
>  }

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

