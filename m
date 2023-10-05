Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C89357BA9AD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 21:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFC610E480;
	Thu,  5 Oct 2023 19:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018A910E480
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 19:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696532717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m3RHiQOi8vSHd3GhOyllnYGuVMmO9/kDaKlLaLnriao=;
 b=TvsU+18m0B0tLhw13k4J5tQMz2ExP2IrVYvmruvBCWIzloglNPSPX2njMiq9TlCQoijCWr
 X7haNpHzKmf0i9XfBocp2W/CLySxD4IT+ATiQQjpuDL3QKEJdgZJGplHclG1LvRMCDe0S+
 /hFVQdsNe/gyH0i0NTIv+NZ0BHnWrnQ=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-9gvzqU2mNdOkLkS968c32g-1; Thu, 05 Oct 2023 15:05:16 -0400
X-MC-Unique: 9gvzqU2mNdOkLkS968c32g-1
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3ae4cefdee5so2193913b6e.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 12:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696532716; x=1697137516;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ubCYaKHia2FG51niBaO92zuboGWFZpjPXq8/tly3EBw=;
 b=fzLmr2A7zN2G8DIRYAw44OFjZBejT7j6jsvnRY/snid+4Dk47vlhtI2vL1mTXVlwjQ
 1zboJk1M5ASEkocYJPSdkLGnSaRRuO6mgvmGgT8Shf24ghufvuwo3ZYU8LBxzTZkvTD0
 CSeRa7inPcs+BWTJkd46azJiPOJhlGMIdh/nxAhzoMbdVrPj8bnW1SVPg+7HF5/roFHt
 rhJF9+oZaT8HZ5lGuoPZ5JzkPPFxXRhe6SzOEdnG39n+w20kgIRqwzjsOq6NjGRSc9rR
 EcrYyYqtinHqNDOwFsz4KfwQlL/PX5JqyN1YMpCsmyDDOAuipy2i/VI4+A0INXhj141R
 Oduw==
X-Gm-Message-State: AOJu0YzNDWoaJq2wmtOMfQlE3AnbSyLc3atRC6vwlfO+tHOvvbt6AW4H
 aIjzC5Al8onkNkQ7OsAwwDbrbMJj7Wtrrjep+JBd+FutwJqjiv7WwhAOa7+m/BG05GDvK8xcjlq
 3KhvU2yqraS3u2yVjrJcuo+pFSrRj
X-Received: by 2002:a05:6808:210c:b0:3ac:aae1:6d64 with SMTP id
 r12-20020a056808210c00b003acaae16d64mr7268939oiw.2.1696532715875; 
 Thu, 05 Oct 2023 12:05:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3Jq7fb0tJELcnl5xyrFVzSFNpqXv3kK6SW6AZNMANILqOas3p5vwogT3zchQwRTl0a36e4A==
X-Received: by 2002:a05:6808:210c:b0:3ac:aae1:6d64 with SMTP id
 r12-20020a056808210c00b003acaae16d64mr7268923oiw.2.1696532715609; 
 Thu, 05 Oct 2023 12:05:15 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 o17-20020ac85551000000b00419b6567ed6sm682289qtr.55.2023.10.05.12.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 12:05:15 -0700 (PDT)
Message-ID: <8719554fccb599d77bdc27fa202eac69c7ea5d08.camel@redhat.com>
Subject: Re: [PATCH] drm/atomic-helper: relax unregistered connector check
From: Lyude Paul <lyude@redhat.com>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Date: Thu, 05 Oct 2023 15:05:14 -0400
In-Reply-To: <20231005131623.114379-1-contact@emersion.fr>
References: <20231005131623.114379-1-contact@emersion.fr>
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This seems like a very good solution to the problem :)

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2023-10-05 at 13:16 +0000, Simon Ser wrote:
> The driver might pull connectors which weren't submitted by
> user-space into the atomic state. For instance,
> intel_dp_mst_atomic_master_trans_check() pulls in connectors
> sharing the same DP-MST stream. However, if the connector is
> unregistered, this later fails with:
>=20
>     [  559.425658] i915 0000:00:02.0: [drm:drm_atomic_helper_check_modese=
t] [CONNECTOR:378:DP-7] is not registered
>=20
> Skip the unregistered connector check to allow user-space to turn
> off connectors one-by-one.
>=20
> See this wlroots issue:
> https://gitlab.freedesktop.org/wlroots/wlroots/-/issues/3407
>=20
> Previous discussion:
> https://lore.kernel.org/intel-gfx/Y6GX7z17WmDSKwta@ideak-desk.fi.intel.co=
m/
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index 71d399397107..c9b8343eaa20 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -290,7 +290,8 @@ static int
>  update_connector_routing(struct drm_atomic_state *state,
>  =09=09=09 struct drm_connector *connector,
>  =09=09=09 struct drm_connector_state *old_connector_state,
> -=09=09=09 struct drm_connector_state *new_connector_state)
> +=09=09=09 struct drm_connector_state *new_connector_state,
> +=09=09=09 bool added_by_user)
>  {
>  =09const struct drm_connector_helper_funcs *funcs;
>  =09struct drm_encoder *new_encoder;
> @@ -339,9 +340,13 @@ update_connector_routing(struct drm_atomic_state *st=
ate,
>  =09 * there's a chance the connector may have been destroyed during the
>  =09 * process, but it's better to ignore that then cause
>  =09 * drm_atomic_helper_resume() to fail.
> +=09 *
> +=09 * Last, we want to ignore connector registration when the connector
> +=09 * was not pulled in the atomic state by user-space (ie, was pulled
> +=09 * in by the driver, e.g. when updating a DP-MST stream).
>  =09 */
>  =09if (!state->duplicated && drm_connector_is_unregistered(connector) &&
> -=09    crtc_state->active) {
> +=09    added_by_user && crtc_state->active) {
>  =09=09drm_dbg_atomic(connector->dev,
>  =09=09=09       "[CONNECTOR:%d:%s] is not registered\n",
>  =09=09=09       connector->base.id, connector->name);
> @@ -620,7 +625,10 @@ drm_atomic_helper_check_modeset(struct drm_device *d=
ev,
>  =09struct drm_connector *connector;
>  =09struct drm_connector_state *old_connector_state, *new_connector_state=
;
>  =09int i, ret;
> -=09unsigned int connectors_mask =3D 0;
> +=09unsigned int connectors_mask =3D 0, user_connectors_mask =3D 0;
> +
> +=09for_each_oldnew_connector_in_state(state, connector, old_connector_st=
ate, new_connector_state, i)
> +=09=09user_connectors_mask |=3D BIT(i);
> =20
>  =09for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_s=
tate, i) {
>  =09=09bool has_connectors =3D
> @@ -685,7 +693,8 @@ drm_atomic_helper_check_modeset(struct drm_device *de=
v,
>  =09=09 */
>  =09=09ret =3D update_connector_routing(state, connector,
>  =09=09=09=09=09       old_connector_state,
> -=09=09=09=09=09       new_connector_state);
> +=09=09=09=09=09       new_connector_state,
> +=09=09=09=09=09=09   BIT(i) & user_connectors_mask);
>  =09=09if (ret)
>  =09=09=09return ret;
>  =09=09if (old_connector_state->crtc) {

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

