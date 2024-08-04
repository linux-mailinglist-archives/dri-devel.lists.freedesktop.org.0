Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DAF946F18
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 15:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342C010E09A;
	Sun,  4 Aug 2024 13:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dbleNP7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0222010E09A
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 13:45:56 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5af51684d52so11321212a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2024 06:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1722779155; x=1723383955;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ReIkVircpSdP0oI3Y1azB/Q/+VoBYCB5Sci10Cxi1X8=;
 b=dbleNP7vA5BMkC6U5pwQu6i4MXSvjuxEfdE1J4VSMu+mMx8PobQYOSEPQARmLPRPzA
 QuWq5OnGMtwYt2tdTHV+JzHgH6SYQw1NOmkcsAFEGh69vzdyv+yqS30jGNA6wF0LNXra
 4m+nlBtOLawWq+VhO6xt0Pcxajq110+sgiuKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722779155; x=1723383955;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ReIkVircpSdP0oI3Y1azB/Q/+VoBYCB5Sci10Cxi1X8=;
 b=EtQr8LlN0yxrZckTfS7HxHnEuy/oxz16F4SZIAbtlv8HnSADDFkSTdKIwqxlliycmd
 BYUv795+MwB1CgX+x+Tgsk3Jajb6BsPKETXNEzHyiwbQoccTYmC45uhcrMt6UxiwU9wI
 bStO7cIZ0ovBssyi9bQE6Q0W+GzU8gBVFSwtJXcwhVNYiCDjWH/S66z8SNDv1tPuh12c
 1HIU2uHw2CHWq8c6vTtzAi9o9VU31Q08ri7DbURu+OuWTC4N05e0PdEt+/nDGT93cDDR
 EBts/61+V7ULvrEiEHfnnzpTeib0l88950jbD2xgKgTWg0AFFFu1jfJDG/nnTEa1JyW6
 kX5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV29cyu9Qw8ZCVEfvbLgZIVbbvVr1hrJKPiPzxpI2viXiooOaKVR/ZsYWAlPjSESHCwc2u+Mzg4lqMUdeX+HcmoQtVNZRK1NExbVr0GaJf
X-Gm-Message-State: AOJu0Yw257e+P+Jzsl+9XzUsg3KgH9obkNas+/U+m0iey4GzRn8bJmVH
 OUQa9C61ybnHX2ix3nFoLd3ZESvsan9kbENAVGU3sIt6VV7rC0OrOddd3F0/dZ3NCv8rjamGF1F
 2XYo4k9OaxiSexMJEorVWzgFciMJ8RCyiWIL/
X-Google-Smtp-Source: AGHT+IHE4tai69TalBII7mKzKksl1jv0KQhKhe6HuyKzpinE/9cv+dKEH9/B6P2pLw5rbJ4JrEY3YTKGp0sRO+4Bhno=
X-Received: by 2002:a17:907:9492:b0:a7d:3ce8:131c with SMTP id
 a640c23a62f3a-a7dc50fd837mr511726366b.62.1722779155045; Sun, 04 Aug 2024
 06:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240722165503.2084999-1-imre.deak@intel.com>
 <20240722165503.2084999-4-imre.deak@intel.com>
In-Reply-To: <20240722165503.2084999-4-imre.deak@intel.com>
From: Manasi Navare <navaremanasi@chromium.org>
Date: Sun, 4 Aug 2024 06:45:43 -0700
Message-ID: <CAE72mNkg06wZGuwrhfGazP+=1yE4ufaXZJe8chVkGV9nw_oF1g@mail.gmail.com>
Subject: Re: [PATCH 03/14] drm/dp_mst: Simplify the condition when to
 enumerate path resources
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>, 
 dri-devel@lists.freedesktop.org
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

On Mon, Jul 22, 2024 at 9:55=E2=80=AFAM Imre Deak <imre.deak@intel.com> wro=
te:
>
> In the
>         if (old_ddps !=3D port->ddps || !created)
>                 if (port->ddps && !port->input)
>                         ret =3D drm_dp_send_enum_path_resources();
>
> sequence the first if's condition is true if the port exists already
> (!created) or the port was created anew (hence old_ddps=3D=3D0) and it wa=
s
> in the plugged state (port->ddps=3D=3D1). The second if's condition is tr=
ue
> for output ports in the plugged state. So the function is called for an
> output port in the plugged state, regardless if it already existed or
> not and regardless of the old plugged state. In all other cases
> port->full_pbn can be zeroed as the port is either an input for which
> full_pbn is never set, or an output in the unplugged state for which
> full_pbn was already zeroed previously or the port was just created
> (with port->full_pbn=3D=3D0).
>
> Simplify the condition, making it clear that the path resources are
> always enumerated for an output port in the plugged state.

Would this take care of the cases where a branch device is present
between source and the sink and
its properly allocating the resources and advertising UHBR capability
from branch to sink. This was a bug earlier
with UHBR on branch device/ MST hub

Manasi

>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 70e4bfc3532e0..bcc5bbed9bd04 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -2339,7 +2339,7 @@ drm_dp_mst_handle_link_address_port(struct drm_dp_m=
st_branch *mstb,
>  {
>         struct drm_dp_mst_topology_mgr *mgr =3D mstb->mgr;
>         struct drm_dp_mst_port *port;
> -       int old_ddps =3D 0, ret;
> +       int ret;
>         u8 new_pdt =3D DP_PEER_DEVICE_NONE;
>         bool new_mcs =3D 0;
>         bool created =3D false, send_link_addr =3D false, changed =3D fal=
se;
> @@ -2372,7 +2372,6 @@ drm_dp_mst_handle_link_address_port(struct drm_dp_m=
st_branch *mstb,
>                  */
>                 drm_modeset_lock(&mgr->base.lock, NULL);
>
> -               old_ddps =3D port->ddps;
>                 changed =3D port->ddps !=3D port_msg->ddps ||
>                         (port->ddps &&
>                          (port->ldps !=3D port_msg->legacy_device_plug_st=
atus ||
> @@ -2407,15 +2406,13 @@ drm_dp_mst_handle_link_address_port(struct drm_dp=
_mst_branch *mstb,
>          * Reprobe PBN caps on both hotplug, and when re-probing the link
>          * for our parent mstb
>          */
> -       if (old_ddps !=3D port->ddps || !created) {
> -               if (port->ddps && !port->input) {
> -                       ret =3D drm_dp_send_enum_path_resources(mgr, mstb=
,
> -                                                             port);
> -                       if (ret =3D=3D 1)
> -                               changed =3D true;
> -               } else {
> -                       port->full_pbn =3D 0;
> -               }
> +       if (port->ddps && !port->input) {
> +               ret =3D drm_dp_send_enum_path_resources(mgr, mstb,
> +                                                     port);
> +               if (ret =3D=3D 1)
> +                       changed =3D true;
> +       } else {
> +               port->full_pbn =3D 0;
>         }
>
>         ret =3D drm_dp_port_set_pdt(port, new_pdt, new_mcs);
> --
> 2.44.2
>
