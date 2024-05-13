Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306FD8C408A
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACCF10E737;
	Mon, 13 May 2024 12:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqcoCq1Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE7D10E24A;
 Mon, 13 May 2024 12:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715602701; x=1747138701;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=OrLOdhd20Ww2EGzQMmlcnwLGgqvEGB5twHwF2grXkmY=;
 b=aqcoCq1YEKss7e7ttYAotDBuJBtaSJaqQ+B4eOGvDU4SbtvrU+iGv105
 U61gYn5e2XBXCFbtvJYzlcFbi4I0mFHppBW6HyfVx4Ys58ZX0LYmvac12
 AMohDvYGJ7xdIKuZJ+lv148hLV6LKp1wH5XkPUQBWzblrjfyWcZRkJvqk
 zXE2kf3kyi3Pv2aXH19+iNHgzhU1KIExxMjS1JJbi3kc8dIqq/4JveHdA
 pB7Etnl5RkW4t+opzP+QjUo3wbmTCsPnT7xzfWMAmnbRNEDfjVgQ3cKyO
 eC7N1x2ECHc8L+4mp3fle/EpV8Ta+j0izMKA6h0sDXmYwBYEGcb+GriN0 g==;
X-CSE-ConnectionGUID: MQmaicq7TOq0r7FC4F09+g==
X-CSE-MsgGUID: cew5/9T5RH6yBhAM2HrEqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="29022753"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="29022753"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:18:12 -0700
X-CSE-ConnectionGUID: UiHs0f4tRlK4JOMklVbdgg==
X-CSE-MsgGUID: TBJF+nUzRw6nsyWPIgfIKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="34877366"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:18:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>, Danilo
 Krummrich <dakr@redhat.com>
Subject: Re: [RESEND 1/6] drm/nouveau: convert to using is_hdmi and
 has_audio from display info
In-Reply-To: <b23e6de23a1c1d997fa5e9e9bef8c88672774d01.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1715353572.git.jani.nikula@intel.com>
 <aa45875200705205ae101c409fc2bba03b631a5e.1715353572.git.jani.nikula@intel.com>
 <b23e6de23a1c1d997fa5e9e9bef8c88672774d01.camel@redhat.com>
Date: Mon, 13 May 2024 15:18:06 +0300
Message-ID: <87v83hewht.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 May 2024, Lyude Paul <lyude@redhat.com> wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks, how do you want to handle merging this?

BR,
Jani.


>
> On Fri, 2024-05-10 at 18:08 +0300, Jani Nikula wrote:
>> Prefer the parsed results for is_hdmi and has_audio in display info
>> over
>> calling drm_detect_hdmi_monitor() and drm_detect_monitor_audio(),
>> respectively.
>>=20
>> Conveniently, this also removes the need to use edid_blob_ptr.
>>=20
>> v2: Reverse a backwards if condition (Ilia)
>>=20
>> Cc: Karol Herbst <kherbst@redhat.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: nouveau@lists.freedesktop.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>> =C2=A0drivers/gpu/drm/nouveau/dispnv50/disp.c=C2=A0=C2=A0=C2=A0=C2=A0 | =
8 ++++----
>> =C2=A0drivers/gpu/drm/nouveau/dispnv50/head.c=C2=A0=C2=A0=C2=A0=C2=A0 | =
8 +-------
>> =C2=A0drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
>> =C2=A03 files changed, 6 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> index 0c3d88ad0b0e..168c27213287 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
>> @@ -751,7 +751,7 @@ nv50_audio_enable(struct drm_encoder *encoder,
>> struct nouveau_crtc *nv_crtc,
>> =C2=A0	struct nouveau_encoder *nv_encoder =3D
>> nouveau_encoder(encoder);
>> =C2=A0	struct nvif_outp *outp =3D &nv_encoder->outp;
>> =C2=A0
>> -	if (!nv50_audio_supported(encoder) ||
>> !drm_detect_monitor_audio(nv_connector->edid))
>> +	if (!nv50_audio_supported(encoder) || !nv_connector-
>> >base.display_info.has_audio)
>> =C2=A0		return;
>> =C2=A0
>> =C2=A0	mutex_lock(&drm->audio.lock);
>> @@ -1765,7 +1765,7 @@ nv50_sor_atomic_enable(struct drm_encoder
>> *encoder, struct drm_atomic_state *sta
>> =C2=A0	if ((disp->disp->object.oclass =3D=3D GT214_DISP ||
>> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 disp->disp->object.oclass >=3D GF110_DIS=
P) &&
>> =C2=A0	=C2=A0=C2=A0=C2=A0 nv_encoder->dcb->type !=3D DCB_OUTPUT_LVDS &&
>> -	=C2=A0=C2=A0=C2=A0 drm_detect_monitor_audio(nv_connector->edid))
>> +	=C2=A0=C2=A0=C2=A0 nv_connector->base.display_info.has_audio)
>> =C2=A0		hda =3D true;
>> =C2=A0
>> =C2=A0	if (!nvif_outp_acquired(outp))
>> @@ -1774,7 +1774,7 @@ nv50_sor_atomic_enable(struct drm_encoder
>> *encoder, struct drm_atomic_state *sta
>> =C2=A0	switch (nv_encoder->dcb->type) {
>> =C2=A0	case DCB_OUTPUT_TMDS:
>> =C2=A0		if (disp->disp->object.oclass !=3D NV50_DISP &&
>> -		=C2=A0=C2=A0=C2=A0 drm_detect_hdmi_monitor(nv_connector->edid))
>> +		=C2=A0=C2=A0=C2=A0 nv_connector->base.display_info.is_hdmi)
>> =C2=A0			nv50_hdmi_enable(encoder, nv_crtc,
>> nv_connector, state, mode, hda);
>> =C2=A0
>> =C2=A0		if (nv_encoder->outp.or.link & 1) {
>> @@ -1787,7 +1787,7 @@ nv50_sor_atomic_enable(struct drm_encoder
>> *encoder, struct drm_atomic_state *sta
>> =C2=A0			 */
>> =C2=A0			if (mode->clock >=3D 165000 &&
>> =C2=A0			=C2=A0=C2=A0=C2=A0 nv_encoder->dcb->duallink_possible &&
>> -			=C2=A0=C2=A0=C2=A0 !drm_detect_hdmi_monitor(nv_connector-
>> >edid))
>> +			=C2=A0=C2=A0=C2=A0 !nv_connector-
>> >base.display_info.is_hdmi)
>> =C2=A0				proto =3D
>> NV507D_SOR_SET_CONTROL_PROTOCOL_DUAL_TMDS;
>> =C2=A0		} else {
>> =C2=A0			proto =3D
>> NV507D_SOR_SET_CONTROL_PROTOCOL_SINGLE_TMDS_B;
>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c
>> b/drivers/gpu/drm/nouveau/dispnv50/head.c
>> index 83355dbc15ee..d7c74cc43ba5 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
>> @@ -127,14 +127,8 @@ nv50_head_atomic_check_view(struct
>> nv50_head_atom *armh,
>> =C2=A0	struct drm_display_mode *omode =3D &asyh->state.adjusted_mode;
>> =C2=A0	struct drm_display_mode *umode =3D &asyh->state.mode;
>> =C2=A0	int mode =3D asyc->scaler.mode;
>> -	struct edid *edid;
>> =C2=A0	int umode_vdisplay, omode_hdisplay, omode_vdisplay;
>> =C2=A0
>> -	if (connector->edid_blob_ptr)
>> -		edid =3D (struct edid *)connector->edid_blob_ptr-
>> >data;
>> -	else
>> -		edid =3D NULL;
>> -
>> =C2=A0	if (!asyc->scaler.full) {
>> =C2=A0		if (mode =3D=3D DRM_MODE_SCALE_NONE)
>> =C2=A0			omode =3D umode;
>> @@ -162,7 +156,7 @@ nv50_head_atomic_check_view(struct nv50_head_atom
>> *armh,
>> =C2=A0	 */
>> =C2=A0	if ((asyc->scaler.underscan.mode =3D=3D UNDERSCAN_ON ||
>> =C2=A0	=C2=A0=C2=A0=C2=A0 (asyc->scaler.underscan.mode =3D=3D UNDERSCAN_=
AUTO &&
>> -	=C2=A0=C2=A0=C2=A0=C2=A0 drm_detect_hdmi_monitor(edid)))) {
>> +	=C2=A0=C2=A0=C2=A0=C2=A0 connector->display_info.is_hdmi))) {
>> =C2=A0		u32 bX =3D asyc->scaler.underscan.hborder;
>> =C2=A0		u32 bY =3D asyc->scaler.underscan.vborder;
>> =C2=A0		u32 r =3D (asyh->view.oH << 19) / asyh->view.oW;
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c
>> b/drivers/gpu/drm/nouveau/nouveau_connector.c
>> index 856b3ef5edb8..938832a6af15 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
>> @@ -1034,7 +1034,7 @@ get_tmds_link_bandwidth(struct drm_connector
>> *connector)
>> =C2=A0	unsigned duallink_scale =3D
>> =C2=A0		nouveau_duallink && nv_encoder->dcb-
>> >duallink_possible ? 2 : 1;
>> =C2=A0
>> -	if (drm_detect_hdmi_monitor(nv_connector->edid)) {
>> +	if (nv_connector->base.display_info.is_hdmi) {
>> =C2=A0		info =3D &nv_connector->base.display_info;
>> =C2=A0		duallink_scale =3D 1;
>> =C2=A0	}

--=20
Jani Nikula, Intel
