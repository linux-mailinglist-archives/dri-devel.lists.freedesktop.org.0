Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0AC7E4BCA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 23:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8A810E0B8;
	Tue,  7 Nov 2023 22:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0530410E0DB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 22:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699396505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qXPnvaStMZ9obE0ABz68AFZgVZDOdhIPxQHI7BcRm1c=;
 b=KkM99DM+uMw3CB9xVYIZ8NHhkKFitE952632+ni3+iuAqDbA0m+C6IU31DrwrBvDcZ3ujH
 PxdsFv3j0VxU+G7AVLTyadME/PFAN3/4seiGT/97Pbu8kkbp1wL2/8Hm4jeQqIe62xDGc7
 YSVCcwKKpaIbqb73dUBkjWlDEzmX9MA=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-sDIIxjlNOxWQJszf-UNzUw-1; Tue, 07 Nov 2023 17:35:04 -0500
X-MC-Unique: sDIIxjlNOxWQJszf-UNzUw-1
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-da033914f7cso7177798276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 14:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699396503; x=1700001303;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bFpB8zIRBXB12Koda6bM8FkIjdCGp8dSifvqkDv0LBM=;
 b=NdO88eCTi/ca7WwprkBOap4Ahg+7wHablebo8bTV2fy2cbCq3wLeLwAmEALtlnqnXy
 ijrX46Qnl0okqzPMLJ+cG03Ncs/q/xxn45zf8MjaC0youwoWPBXAYAmSjU7VTR0n1GyF
 9h56diYB6wL02s8XnuXVX8b+Uilh0GeJG3WCR3ylYVV59TZQ7zetUEauMDEmv3/QacJP
 AZ6WIQSotftcVqj40i7XZZ+oCqAZtDaiY1GIkMQR7bBVUg4U8zJzj7J6QmaSCMLHbw6i
 4hl4QB+IH6tEUFd/sj0mXCV/oZs4Ov1L+7fl4EECTy7bbHY7/o4+VYHa+pROo8Kcbyt/
 LHOQ==
X-Gm-Message-State: AOJu0Yxds/XaW9sN9pyT3pisdoiXFWkIn2gtm8mzRi1VJqvTDvcEMCV/
 j6Fc4hvWqPfldBv+6lHCizTzTkwNI5Kt5cxcyl/n49edi4LA07RwGgwrLOSLU7+Js6oEW4BZ1B0
 FoQzcfp/5shdfw46Z9FLAc0zu/EjvTqReQHxz
X-Received: by 2002:a25:7241:0:b0:c4b:ada8:8b86 with SMTP id
 n62-20020a257241000000b00c4bada88b86mr103573ybc.64.1699396503748; 
 Tue, 07 Nov 2023 14:35:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH96r61CIrmKFAG4AeCvGiiNn64aiW7vluM9Mi2t4NZFpVBO+jkXgLIgIwLpu5UnXBYQE0DUw==
X-Received: by 2002:a25:7241:0:b0:c4b:ada8:8b86 with SMTP id
 n62-20020a257241000000b00c4bada88b86mr103562ybc.64.1699396503489; 
 Tue, 07 Nov 2023 14:35:03 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a0cfc45000000b00674648411b3sm354887qvp.132.2023.11.07.14.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 14:35:03 -0800 (PST)
Message-ID: <05c29ad8ab3cdb0691a8e1f22a25bca47c4ea895.camel@redhat.com>
Subject: Re: [PATCH v4 06/30] drm/dp_mst: Allow DSC in any Synaptics last
 branch device
From: Lyude Paul <lyude@redhat.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 07 Nov 2023 17:35:02 -0500
In-Reply-To: <20231030155843.2251023-7-imre.deak@intel.com>
References: <20231030155843.2251023-1-imre.deak@intel.com>
 <20231030155843.2251023-7-imre.deak@intel.com>
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
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2023-10-30 at 17:58 +0200, Imre Deak wrote:
> The Synaptics MST branch devices support DSC decompression on all their
> output ports, provided that they are last branch devices (with their
> output ports connected to the sinks). The Thinkpad 40B0 TBT dock for
> instance has two such branch devices, a secondary one connected to one
> of the output ports of the primary; hence the decompression needs to be
> enabled in both branch devices to enable decompression for all the
> sinks.
>=20
> Based on the above add support for enabling decompression in last
> Synaptics branch devices.
>=20
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 21 ++++++++++++-------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 5972c93615f18..cc0a8fe84d290 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -5994,6 +5994,7 @@ static bool drm_dp_mst_is_virtual_dpcd(struct drm_d=
p_mst_port *port)
>  struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *p=
ort)
>  {
>  =09struct drm_dp_mst_port *immediate_upstream_port;
> +=09struct drm_dp_aux *immediate_upstream_aux;
>  =09struct drm_dp_mst_port *fec_port;
>  =09struct drm_dp_desc desc =3D {};
>  =09u8 endpoint_fec;
> @@ -6058,21 +6059,25 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(st=
ruct drm_dp_mst_port *port)
>  =09 * - Port is on primary branch device
>  =09 * - Not a VGA adapter (DP_DWN_STRM_PORT_TYPE_ANALOG)
>  =09 */
> -=09if (drm_dp_read_desc(port->mgr->aux, &desc, true))
> +=09if (immediate_upstream_port)
> +=09=09immediate_upstream_aux =3D &immediate_upstream_port->aux;
> +=09else
> +=09=09immediate_upstream_aux =3D port->mgr->aux;
> +
> +=09if (drm_dp_read_desc(immediate_upstream_aux, &desc, true))
>  =09=09return NULL;
> =20
> -=09if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) &=
&
> -=09    port->mgr->dpcd[DP_DPCD_REV] >=3D DP_DPCD_REV_14 &&
> -=09    port->parent =3D=3D port->mgr->mst_primary) {
> +=09if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD)) =
{
>  =09=09u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
> =20
> -=09=09if (drm_dp_read_dpcd_caps(port->mgr->aux, dpcd_ext) < 0)
> +=09=09if (drm_dp_read_dpcd_caps(immediate_upstream_aux, dpcd_ext) < 0)
>  =09=09=09return NULL;
> =20
> -=09=09if ((dpcd_ext[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESEN=
T) &&
> +=09=09if (dpcd_ext[DP_DPCD_REV] >=3D DP_DPCD_REV_14 &&
> +=09=09    ((dpcd_ext[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESE=
NT) &&
>  =09=09    ((dpcd_ext[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_TYPE_=
MASK)
> -=09=09     !=3D DP_DWN_STRM_PORT_TYPE_ANALOG))
> -=09=09=09return port->mgr->aux;
> +=09=09     !=3D DP_DWN_STRM_PORT_TYPE_ANALOG)))
> +=09=09=09return immediate_upstream_aux;
>  =09}
> =20
>  =09/*

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

