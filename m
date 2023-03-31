Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D43146D29AA
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 22:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADD710E261;
	Fri, 31 Mar 2023 20:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310B010E562
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 20:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680295923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KDH3L7DwZn1vZBwS1na4+1Vi8gh6jhDOuuWvh5vp39o=;
 b=VgiTf3WGVx+uJA6veldeJruWxnIp3Swpsc4wqKTwlX76ST9yX5X9X5MS9DSV4ozNqGe24J
 l67nmaJadvEsZeL0n+9a4HBhgYzcEstXDi6F1FqRQfIojslVSFdTCK1IhAlsDrtDeQuGpH
 IJhEF+YrrPf1oH5SBqmHJsQlFo79gls=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-7hd-nOuFOE6LgYOoxkND2A-1; Fri, 31 Mar 2023 16:52:02 -0400
X-MC-Unique: 7hd-nOuFOE6LgYOoxkND2A-1
Received: by mail-qv1-f72.google.com with SMTP id
 p14-20020a0cc3ce000000b005e14204a86bso2230859qvi.10
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 13:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680295921;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TExCraw6m8qeEuU/cKmvx3BPZJEqqAr20GEIk47fq4k=;
 b=YsLCkuWIKjtF0mrgw7gaPqIfePVHaUhCwkFtBr2x5FydnQLzL5OaSgsB7+ENkH1C46
 V5SU6Q7rQGQU7A94DMLFtGUgfJMsMZ+S7X4XqkiQX1SYpI33VVUF8/jygBuaVnTiHCo/
 2znc2CAestAo7jaXfEYUNFhemTLW1e1DHNU4gw/BwOtwBAWjtzc6C9ajnC8AeijoPJHj
 QbzZu4tPYyBSzv4XavgabvegEVHc+j4lNUCFpfEOmatBCepaILCpD7tF+VX1Lqb2jCd9
 WO2O4ljSa6SmGzhTfExalevYXBV6KC0LxHx4w5NNFbjLx8duK8shc/+rFpkp6EY4I1Rn
 utmA==
X-Gm-Message-State: AAQBX9fladxyIiUnctreUFs0H1Dv05Iu/9qAOSP8O/iwELbKxcp2yQBF
 MGpiqoETK6pJlJdnlJ1oHrfREJvLA3kSaqefughpfYtPpezV7GMWPikyik+jCjDNazw2m0X8kgx
 ztfiYIrrAerCzYn6aq2s7iNzVSOiN
X-Received: by 2002:ad4:5de2:0:b0:5b5:a816:6b27 with SMTP id
 jn2-20020ad45de2000000b005b5a8166b27mr46860469qvb.8.1680295921459; 
 Fri, 31 Mar 2023 13:52:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350a4BujdGcJ2iPES2jo4+UFcgXVDnbMTbMhCNXJcZZp/TV6Ekdjl4SHquQYXB/2xAlFP8ZOBGQ==
X-Received: by 2002:ad4:5de2:0:b0:5b5:a816:6b27 with SMTP id
 jn2-20020ad45de2000000b005b5a8166b27mr46860448qvb.8.1680295921187; 
 Fri, 31 Mar 2023 13:52:01 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c57:b700::feb? ([2600:4040:5c57:b700::feb])
 by smtp.gmail.com with ESMTPSA id
 bm20-20020a05620a199400b007435a646354sm939211qkb.0.2023.03.31.13.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 13:52:00 -0700 (PDT)
Message-ID: <286e8ae9c2bddf332e917b72178e0d4e82ab63cb.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: Support more modes by checking with
 lower bpc
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Date: Fri, 31 Mar 2023 16:51:59 -0400
In-Reply-To: <20230330223938.4025569-1-kherbst@redhat.com>
References: <20230330223938.4025569-1-kherbst@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2023-03-31 at 00:39 +0200, Karol Herbst wrote:
> This allows us to advertise more modes especially on HDR displays.
>=20
> Fixes using 4K@60 modes on my TV and main display both using a HDMI to DP
> adapter. Also fixes similiar issues for users running into this.
>=20
> Cc: stable@vger.kernel.org # 5.10+
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 32 +++++++++++++++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_dp.c    |  8 ++++---
>  2 files changed, 37 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index ed9d374147b8d..f28e47c161dd9 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -363,6 +363,35 @@ nv50_outp_atomic_check_view(struct drm_encoder *enco=
der,
>  =09return 0;
>  }
> =20
> +static void
> +nv50_outp_atomic_fix_depth(struct drm_encoder *encoder, struct drm_crtc_=
state *crtc_state)
> +{
> +=09struct nv50_head_atom *asyh =3D nv50_head_atom(crtc_state);
> +=09struct nouveau_encoder *nv_encoder =3D nouveau_encoder(encoder);
> +=09struct drm_display_mode *mode =3D &asyh->state.adjusted_mode;
> +=09unsigned int max_rate, mode_rate;
> +
> +=09switch (nv_encoder->dcb->type) {
> +=09case DCB_OUTPUT_DP:
> +=09=09max_rate =3D nv_encoder->dp.link_nr * nv_encoder->dp.link_bw;
> +
> +                /* we don't support more than 10 anyway */
> +=09=09asyh->or.bpc =3D max_t(u8, asyh->or.bpc, 10);
> +
> +=09=09/* reduce the bpc until it works out */
> +=09=09while (asyh->or.bpc > 6) {
> +=09=09=09mode_rate =3D DIV_ROUND_UP(mode->clock * asyh->or.bpc * 3, 8);
> +=09=09=09if (mode_rate <=3D max_rate)
> +=09=09=09=09break;
> +
> +=09=09=09asyh->or.bpc -=3D 2;
> +=09=09}
> +=09=09break;
> +=09default:
> +=09=09break;
> +=09}
> +}
> +
>  static int
>  nv50_outp_atomic_check(struct drm_encoder *encoder,
>  =09=09       struct drm_crtc_state *crtc_state,
> @@ -381,6 +410,9 @@ nv50_outp_atomic_check(struct drm_encoder *encoder,
>  =09if (crtc_state->mode_changed || crtc_state->connectors_changed)
>  =09=09asyh->or.bpc =3D connector->display_info.bpc;
> =20
> +=09/* We might have to reduce the bpc */
> +=09nv50_outp_atomic_fix_depth(encoder, crtc_state);
> +
>  =09return 0;
>  }
> =20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouve=
au/nouveau_dp.c
> index e00876f92aeea..d49b4875fc3c9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -263,8 +263,6 @@ nouveau_dp_irq(struct work_struct *work)
>  }
> =20
>  /* TODO:
> - * - Use the minimum possible BPC here, once we add support for the max =
bpc
> - *   property.
>   * - Validate against the DP caps advertised by the GPU (we don't check =
these
>   *   yet)
>   */
> @@ -276,7 +274,11 @@ nv50_dp_mode_valid(struct drm_connector *connector,
>  {
>  =09const unsigned int min_clock =3D 25000;
>  =09unsigned int max_rate, mode_rate, ds_max_dotclock, clock =3D mode->cl=
ock;
> -=09const u8 bpp =3D connector->display_info.bpc * 3;
> +=09/* Check with the minmum bpc always, so we can advertise better modes=
.
> +=09 * In particlar not doing this causes modes to be dropped on HDR
> +=09 * displays as we might check with a bpc of 16 even.
> +=09 */
> +=09const u8 bpp =3D 6 * 3;
> =20
>  =09if (mode->flags & DRM_MODE_FLAG_INTERLACE && !outp->caps.dp_interlace=
)
>  =09=09return MODE_NO_INTERLACE;

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

