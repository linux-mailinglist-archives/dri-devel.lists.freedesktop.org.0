Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DA982D46C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 08:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2E710E203;
	Mon, 15 Jan 2024 07:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A8910E0FD;
 Mon, 15 Jan 2024 07:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705302369; x=1736838369;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=u3JPWnGBTFSEOVl318U9z12NSUhutBTG1/QIh7RZ2Bw=;
 b=jE47S4Gxl/g09Ixt5fV+LT5dqxOqhDHTMnW7uV2wdYbCL/VJGSr3lphB
 rd6nL55+NFBz215e1KPxwWDQrabtMFBA0F7xxNdPyomvM+olxtywJjauh
 tFz57PNMh8Wzdd8W9TCuQmqPZa1lnSMa8zLtttlNcxSylAzRD/9vfcYws
 FoKXVCNvSRnxQ3VKL2tnGr+xbFX2bGhItfDpysNa73pEnFYjitY8nVmd1
 sizArannpW/Dp/it1h3js8agbWA3/lG2b5fmrYT/nVQLYlB+1gSBnxVeZ
 f+E2Pa9Bezz25L9/gXtIkOP9BaouH0P7UC8Ci6i0ltdqiWHNDf2zsFgrY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="13028561"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="13028561"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2024 23:06:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="25697907"
Received: from nrseife-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2024 23:06:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 1/6] drm/nouveau: convert to using is_hdmi and has_audio
 from display info
In-Reply-To: <CAKb7Uvh17nJUO2a1pD25Rpq5tX4TMV0S4P++TKinOGUQnZsdRg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1705078136.git.jani.nikula@intel.com>
 <924db0d9debec057fe15e820bc470a966a3401b0.1705078136.git.jani.nikula@intel.com>
 <CAKb7Uvh17nJUO2a1pD25Rpq5tX4TMV0S4P++TKinOGUQnZsdRg@mail.gmail.com>
Date: Mon, 15 Jan 2024 09:06:01 +0200
Message-ID: <87ply3rs86.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Sun, 14 Jan 2024, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> On Fri, Jan 12, 2024 at 11:50=E2=80=AFAM Jani Nikula <jani.nikula@intel.c=
om> wrote:
>>
>> Prefer the parsed results for is_hdmi and has_audio in display info over
>> calling drm_detect_hdmi_monitor() and drm_detect_monitor_audio(),
>> respectively.
>>
>> Conveniently, this also removes the need to use edid_blob_ptr.
>>
>> Cc: Karol Herbst <kherbst@redhat.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: nouveau@lists.freedesktop.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/nouveau/dispnv50/disp.c     | 8 ++++----
>>  drivers/gpu/drm/nouveau/dispnv50/head.c     | 8 +-------
>>  drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
>>  3 files changed, 6 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/n=
ouveau/dispnv50/disp.c
>> index 8d37a694b772..908b1042669c 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> @@ -750,7 +750,7 @@ nv50_audio_enable(struct drm_encoder *encoder, struc=
t nouveau_crtc *nv_crtc,
>>         struct nouveau_encoder *nv_encoder =3D nouveau_encoder(encoder);
>>         struct nvif_outp *outp =3D &nv_encoder->outp;
>>
>> -       if (!nv50_audio_supported(encoder) || !drm_detect_monitor_audio(=
nv_connector->edid))
>> +       if (!nv50_audio_supported(encoder) || !nv_connector->base.displa=
y_info.has_audio)
>>                 return;
>>
>>         mutex_lock(&drm->audio.lock);
>> @@ -1764,7 +1764,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder=
, struct drm_atomic_state *sta
>>         if ((disp->disp->object.oclass =3D=3D GT214_DISP ||
>>              disp->disp->object.oclass >=3D GF110_DISP) &&
>>             nv_encoder->dcb->type !=3D DCB_OUTPUT_LVDS &&
>> -           drm_detect_monitor_audio(nv_connector->edid))
>> +           nv_connector->base.display_info.has_audio)
>>                 hda =3D true;
>>
>>         if (!nvif_outp_acquired(outp))
>> @@ -1773,7 +1773,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder=
, struct drm_atomic_state *sta
>>         switch (nv_encoder->dcb->type) {
>>         case DCB_OUTPUT_TMDS:
>>                 if (disp->disp->object.oclass !=3D NV50_DISP &&
>> -                   drm_detect_hdmi_monitor(nv_connector->edid))
>> +                   !nv_connector->base.display_info.is_hdmi)
>
> This is backwards, no?

Good catch, thanks!

BR,
Jani.

>
>>                         nv50_hdmi_enable(encoder, nv_crtc, nv_connector,=
 state, mode, hda);
>>
>>                 if (nv_encoder->outp.or.link & 1) {
>> @@ -1786,7 +1786,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder=
, struct drm_atomic_state *sta
>>                          */
>>                         if (mode->clock >=3D 165000 &&
>>                             nv_encoder->dcb->duallink_possible &&
>> -                           !drm_detect_hdmi_monitor(nv_connector->edid))
>> +                           !nv_connector->base.display_info.is_hdmi)
>>                                 proto =3D NV507D_SOR_SET_CONTROL_PROTOCO=
L_DUAL_TMDS;
>>                 } else {
>>                         proto =3D NV507D_SOR_SET_CONTROL_PROTOCOL_SINGLE=
_TMDS_B;
>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/n=
ouveau/dispnv50/head.c
>> index 83355dbc15ee..d7c74cc43ba5 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
>> @@ -127,14 +127,8 @@ nv50_head_atomic_check_view(struct nv50_head_atom *=
armh,
>>         struct drm_display_mode *omode =3D &asyh->state.adjusted_mode;
>>         struct drm_display_mode *umode =3D &asyh->state.mode;
>>         int mode =3D asyc->scaler.mode;
>> -       struct edid *edid;
>>         int umode_vdisplay, omode_hdisplay, omode_vdisplay;
>>
>> -       if (connector->edid_blob_ptr)
>> -               edid =3D (struct edid *)connector->edid_blob_ptr->data;
>> -       else
>> -               edid =3D NULL;
>> -
>>         if (!asyc->scaler.full) {
>>                 if (mode =3D=3D DRM_MODE_SCALE_NONE)
>>                         omode =3D umode;
>> @@ -162,7 +156,7 @@ nv50_head_atomic_check_view(struct nv50_head_atom *a=
rmh,
>>          */
>>         if ((asyc->scaler.underscan.mode =3D=3D UNDERSCAN_ON ||
>>             (asyc->scaler.underscan.mode =3D=3D UNDERSCAN_AUTO &&
>> -            drm_detect_hdmi_monitor(edid)))) {
>> +            connector->display_info.is_hdmi))) {
>>                 u32 bX =3D asyc->scaler.underscan.hborder;
>>                 u32 bY =3D asyc->scaler.underscan.vborder;
>>                 u32 r =3D (asyh->view.oH << 19) / asyh->view.oW;
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/d=
rm/nouveau/nouveau_connector.c
>> index 856b3ef5edb8..938832a6af15 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
>> @@ -1034,7 +1034,7 @@ get_tmds_link_bandwidth(struct drm_connector *conn=
ector)
>>         unsigned duallink_scale =3D
>>                 nouveau_duallink && nv_encoder->dcb->duallink_possible ?=
 2 : 1;
>>
>> -       if (drm_detect_hdmi_monitor(nv_connector->edid)) {
>> +       if (nv_connector->base.display_info.is_hdmi) {
>>                 info =3D &nv_connector->base.display_info;
>>                 duallink_scale =3D 1;
>>         }
>> --
>> 2.39.2
>>

--=20
Jani Nikula, Intel
