Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A57C82CFC9
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jan 2024 06:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8649A10E09E;
	Sun, 14 Jan 2024 05:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB6010E09E;
 Sun, 14 Jan 2024 05:07:09 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7831aacdaffso743344385a.3; 
 Sat, 13 Jan 2024 21:07:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705208828; x=1705813628;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yq9djxkqePz8twBh/vN/dnk4+5rr8wHwV6ZmU8Sznfo=;
 b=bq0thiwUmRHy1i6OLBjFXmFmepO++pccYhprZaojFPWgnkpPwTuulVjHZ7klZw+NFD
 UeBKPc+zXaQ/yEhFIKKk2/9GZnkF+6MCVymBRy8Xpx7IG7a6RO993FPPoLfhBJ98aylc
 3DGZ48vtHLrw7Ed1XEYV+ElCCn7IZUXSBsxTs1K9pA4D8z2e2cZa13yKf6tH6bk6g8Sp
 IwSdR5twZroBLbksJf5DNxGQsophe3DReUoTJ5Xdeg2QPwrTwIwsliOAGvCdRcnsy5l7
 Fdj8W7aAwZzgeqzYRGUry59XGukG9ghJibBo8zzYnwGuFh1Vi747lNI2Nr02H75rf2bJ
 drJw==
X-Gm-Message-State: AOJu0YzC6Jx2nZiGJTVvZnfUY5QBHUaMCA3CpGTtitVRhk+nFUWJHG7k
 Dw5rY6y0dgRLROwEKpbJ8oHEKU/JRaTe/7ZRQaA=
X-Google-Smtp-Source: AGHT+IHgpmYZnJyG6vOhrfNT/VP3x81CwUxuKWlB1b/sPch1mxDly3QPXGNRPulcGO+SyWhccIh0xPDCc68XFQ7jYJA=
X-Received: by 2002:a05:620a:f12:b0:783:4a7f:9049 with SMTP id
 v18-20020a05620a0f1200b007834a7f9049mr4312316qkl.68.1705208828383; Sat, 13
 Jan 2024 21:07:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1705078136.git.jani.nikula@intel.com>
 <924db0d9debec057fe15e820bc470a966a3401b0.1705078136.git.jani.nikula@intel.com>
In-Reply-To: <924db0d9debec057fe15e820bc470a966a3401b0.1705078136.git.jani.nikula@intel.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 14 Jan 2024 00:06:57 -0500
Message-ID: <CAKb7Uvh17nJUO2a1pD25Rpq5tX4TMV0S4P++TKinOGUQnZsdRg@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/nouveau: convert to using is_hdmi and has_audio
 from display info
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 11:50=E2=80=AFAM Jani Nikula <jani.nikula@intel.com=
> wrote:
>
> Prefer the parsed results for is_hdmi and has_audio in display info over
> calling drm_detect_hdmi_monitor() and drm_detect_monitor_audio(),
> respectively.
>
> Conveniently, this also removes the need to use edid_blob_ptr.
>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c     | 8 ++++----
>  drivers/gpu/drm/nouveau/dispnv50/head.c     | 8 +-------
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
>  3 files changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index 8d37a694b772..908b1042669c 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -750,7 +750,7 @@ nv50_audio_enable(struct drm_encoder *encoder, struct=
 nouveau_crtc *nv_crtc,
>         struct nouveau_encoder *nv_encoder =3D nouveau_encoder(encoder);
>         struct nvif_outp *outp =3D &nv_encoder->outp;
>
> -       if (!nv50_audio_supported(encoder) || !drm_detect_monitor_audio(n=
v_connector->edid))
> +       if (!nv50_audio_supported(encoder) || !nv_connector->base.display=
_info.has_audio)
>                 return;
>
>         mutex_lock(&drm->audio.lock);
> @@ -1764,7 +1764,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder,=
 struct drm_atomic_state *sta
>         if ((disp->disp->object.oclass =3D=3D GT214_DISP ||
>              disp->disp->object.oclass >=3D GF110_DISP) &&
>             nv_encoder->dcb->type !=3D DCB_OUTPUT_LVDS &&
> -           drm_detect_monitor_audio(nv_connector->edid))
> +           nv_connector->base.display_info.has_audio)
>                 hda =3D true;
>
>         if (!nvif_outp_acquired(outp))
> @@ -1773,7 +1773,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder,=
 struct drm_atomic_state *sta
>         switch (nv_encoder->dcb->type) {
>         case DCB_OUTPUT_TMDS:
>                 if (disp->disp->object.oclass !=3D NV50_DISP &&
> -                   drm_detect_hdmi_monitor(nv_connector->edid))
> +                   !nv_connector->base.display_info.is_hdmi)

This is backwards, no?

>                         nv50_hdmi_enable(encoder, nv_crtc, nv_connector, =
state, mode, hda);
>
>                 if (nv_encoder->outp.or.link & 1) {
> @@ -1786,7 +1786,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder,=
 struct drm_atomic_state *sta
>                          */
>                         if (mode->clock >=3D 165000 &&
>                             nv_encoder->dcb->duallink_possible &&
> -                           !drm_detect_hdmi_monitor(nv_connector->edid))
> +                           !nv_connector->base.display_info.is_hdmi)
>                                 proto =3D NV507D_SOR_SET_CONTROL_PROTOCOL=
_DUAL_TMDS;
>                 } else {
>                         proto =3D NV507D_SOR_SET_CONTROL_PROTOCOL_SINGLE_=
TMDS_B;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/no=
uveau/dispnv50/head.c
> index 83355dbc15ee..d7c74cc43ba5 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
> @@ -127,14 +127,8 @@ nv50_head_atomic_check_view(struct nv50_head_atom *a=
rmh,
>         struct drm_display_mode *omode =3D &asyh->state.adjusted_mode;
>         struct drm_display_mode *umode =3D &asyh->state.mode;
>         int mode =3D asyc->scaler.mode;
> -       struct edid *edid;
>         int umode_vdisplay, omode_hdisplay, omode_vdisplay;
>
> -       if (connector->edid_blob_ptr)
> -               edid =3D (struct edid *)connector->edid_blob_ptr->data;
> -       else
> -               edid =3D NULL;
> -
>         if (!asyc->scaler.full) {
>                 if (mode =3D=3D DRM_MODE_SCALE_NONE)
>                         omode =3D umode;
> @@ -162,7 +156,7 @@ nv50_head_atomic_check_view(struct nv50_head_atom *ar=
mh,
>          */
>         if ((asyc->scaler.underscan.mode =3D=3D UNDERSCAN_ON ||
>             (asyc->scaler.underscan.mode =3D=3D UNDERSCAN_AUTO &&
> -            drm_detect_hdmi_monitor(edid)))) {
> +            connector->display_info.is_hdmi))) {
>                 u32 bX =3D asyc->scaler.underscan.hborder;
>                 u32 bY =3D asyc->scaler.underscan.vborder;
>                 u32 r =3D (asyh->view.oH << 19) / asyh->view.oW;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
> index 856b3ef5edb8..938832a6af15 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1034,7 +1034,7 @@ get_tmds_link_bandwidth(struct drm_connector *conne=
ctor)
>         unsigned duallink_scale =3D
>                 nouveau_duallink && nv_encoder->dcb->duallink_possible ? =
2 : 1;
>
> -       if (drm_detect_hdmi_monitor(nv_connector->edid)) {
> +       if (nv_connector->base.display_info.is_hdmi) {
>                 info =3D &nv_connector->base.display_info;
>                 duallink_scale =3D 1;
>         }
> --
> 2.39.2
>
