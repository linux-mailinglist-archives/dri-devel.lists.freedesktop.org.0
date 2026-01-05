Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E022CCF5871
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 21:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABF510E413;
	Mon,  5 Jan 2026 20:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qc55tR0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655DE10E414
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 20:30:59 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6505d1420daso47063a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 12:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767645058; x=1768249858; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=hVECE95AM8EQn11Eu+Wr1AoXJjdignGWqzA0rD5sR/g=;
 b=Qc55tR0OvuWG3l1ivg7U4MifO2GI2tJMqKMLTgfwwbEC/YuLSzTuL1VvWieLccZZMq
 iDQnwIkRFw/SHGHu6wzqe/zkdyPnWscRk3zLV7AnxYZoBYCE0AtxIU5L+w7VBQ8E7zdr
 32kcaxP2awRx2s3mPZCC9ySt3FPvL6stbpizBA6xkWDdWhgX7NzW3UNBvamSdYhCfenz
 p3SKXRTuWeW1K4hnUWy9LVbXHvOfNlEXalE8L/8wpG/8b8x912SY9bg2yOTCU3DyLayB
 LgGwCKpWX0vE2zbGdUcb8D1AgXeZq+OAZ8CcPvqHakR7xj59Pwju31VfPDCRE2MTNfPK
 nmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767645058; x=1768249858;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hVECE95AM8EQn11Eu+Wr1AoXJjdignGWqzA0rD5sR/g=;
 b=I7zZLSVjBAYW+t1p8JXqfzORVKKbGTIrYYbBayy2LoTxmQRm3TKDQVaVI4VYSUT4H4
 WG8eXCQRhjREHOKn+0atWfSyyU0YiyNCArDlcmrlShDybTdxRR+qYiXDKps/40gCwudr
 28WtpNazfb05YiYn0TWZydeWlqliSWy4cNJKVFKzYto+kQunDWFe4BtzSGc4Ac5nWIxZ
 JxS1dlByc/ovDt9W+/yNF0+HKzl+1ao2CGQEaNMby4FPPFkXL8VShXzWH0DXby7CZQF9
 HiyKwtAH6PbIg9VsjXV1/wEyzh0cTUGcLQiWyv6Tix6WUKJkbCWcQmb3HmjjAjAHDszb
 W0XQ==
X-Gm-Message-State: AOJu0YzKFnPu817v0Eh3UWJ+Y2vYKP5wX8UFrx63sEyAmPk5D2KrhZ+8
 eUmLQHcWsd/Zf77qm+784AIoV7+cHBzeVCd5AYSMtv6Dh7zJi4xdWbHN
X-Gm-Gg: AY/fxX4NzB5XerhjXFxq+Iq4cSN7/MNIRJ62v1sZkumIXiItrRKK/rD2WU1DQjQE06b
 TTOAet54LoQjneE27HYpYEpKl0MFrQigdthYl3nncEmEhBEClPiFroM9GdL0paIDI+0y4ScVU1B
 jvXCAWVouqJOEh2M5I3S8HWdQ0bJ67nZBKykmOQKmC5iB1753/v89TCe0MuDlVtsuYLBZfTioOD
 s0cTvBjSfPFnlCEeZxQ5ixXDc+2epG4l3ked87t0B6YKxJrr2zjkeclunHJZYeHGGAziTThOGHv
 erT/c9XOS+QZEQd8BBPvQCMUBqlqomsNAPPehkSqb6hVwJGR10eYRMHRKbZcZzcRGnptoeIgn1Q
 qa1RHsLiXBI4QlTyGfGnDPybmgOf/jokXzJ6tjq0xU9ePk8+pyuCG9Bwaiz3HF6O8jM1xQXgSvF
 GIALsmXPyWjwvAhEpDE48t75U2Te0/k8Kol7Akpq8LnwJOkXKMHOm/HrO3/pHGcJyOgBwumOs=
X-Google-Smtp-Source: AGHT+IEebwiWuXl1F8QHnnykIpu9467Snh7tcDDZiJH8az6WUjwWW9mBHxH2ppJZkdF+bHqj2P8QOA==
X-Received: by 2002:a05:6402:3513:b0:640:abd5:8646 with SMTP id
 4fb4d7f45d1cf-6507955d2abmr365284a12.4.1767645057730; 
 Mon, 05 Jan 2026 12:30:57 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl.
 [87.205.5.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a4d31e7sm22291166b.42.2026.01.05.12.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 12:30:57 -0800 (PST)
Message-ID: <9213ab090c4aab1bdd134857d3f5a88cff505fc6.camel@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Add VRR support for MST connectors
From: tomasz.pakula.oficjalny@gmail.com
To: =?UTF-8?Q?Micha=C5=82_Bie=C5=82aga?= <mbielaga1@gmail.com>, 
 amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, harry.wentland@amd.com,
 sunpeng.li@amd.com, 	siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Date: Mon, 05 Jan 2026 21:30:56 +0100
In-Reply-To: <20251103100845.12802-1-michal.bielaga@deliveroo.com>
References: <20251103100845.12802-1-michal.bielaga@deliveroo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
MIME-Version: 1.0
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

On Mon, 2025-11-03 at 11:08 +0100, Micha=C5=82 Bie=C5=82aga wrote:
> From: Michal Bielaga <mbielaga1@gmail.com>
>=20
> Variable Refresh Rate (VRR/FreeSync) currently only works with
> Single-Stream Transport (SST) DisplayPort connections. Monitors
> connected via MST hubs cannot utilize VRR even when they support it,
> because the driver only enables VRR for SST connections.
>=20
> This patch enables VRR for DisplayPort MST by:
> - Including SIGNAL_TYPE_DISPLAY_PORT_MST in VRR capability detection
> - Reading VRR range from display EDID instead of MST hub DPCD, since
>   dc_link points to the hub rather than the actual display
> - Fixing call order to parse EDID before checking VRR capabilities,
>   ensuring display_info.monitor_range is populated
> - Properly attaching VRR property to MST connectors by reusing the
>   master connector's property
>=20
> Without this patch, MST displays cannot use VRR even if they support
> it, limiting the user experience for multi-monitor DisplayPort MST
> setups.
>=20
> Signed-off-by: Michal Bielaga <mbielaga1@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c     | 11 +++++++++--
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c   |  9 ++++++---
>  2 files changed, 15 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index ef026143dc1c..ac5b6c22361f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -12644,9 +12644,16 @@ void amdgpu_dm_update_freesync_caps(struct drm_c=
onnector *connector,
>  		parse_edid_displayid_vrr(connector, edid);
> =20
>  	if (edid && (sink->sink_signal =3D=3D SIGNAL_TYPE_DISPLAY_PORT ||
> +		     sink->sink_signal =3D=3D SIGNAL_TYPE_DISPLAY_PORT_MST ||
>  		     sink->sink_signal =3D=3D SIGNAL_TYPE_EDP)) {
> -		if (amdgpu_dm_connector->dc_link &&
> -		    amdgpu_dm_connector->dc_link->dpcd_caps.allow_invalid_MSA_timing_p=
aram) {
> +		/* For MST, check monitor range from EDID directly since the dc_link
> +		 * points to the MST hub, not the actual display
> +		 */
> +		if ((sink->sink_signal =3D=3D SIGNAL_TYPE_DISPLAY_PORT_MST ||
> +		     (amdgpu_dm_connector->dc_link &&
> +		      amdgpu_dm_connector->dc_link->dpcd_caps.allow_invalid_MSA_timing=
_param)) &&
> +		    connector->display_info.monitor_range.min_vfreq &&
> +		    connector->display_info.monitor_range.max_vfreq) {
>  			amdgpu_dm_connector->min_vfreq =3D connector->display_info.monitor_ra=
nge.min_vfreq;
>  			amdgpu_dm_connector->max_vfreq =3D connector->display_info.monitor_ra=
nge.max_vfreq;
>  			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq >=
 10)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 77a9d2c7d318..062259514b3c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -443,6 +443,9 @@ static int dm_dp_mst_get_modes(struct drm_connector *=
connector)
>  			}
>  		}
> =20
> +		/* Update connector with EDID first so display_info.monitor_range is p=
opulated */
> +		drm_edid_connector_update(&aconnector->base, aconnector->drm_edid);
> +
>  		if (aconnector->dc_sink) {
>  			amdgpu_dm_update_freesync_caps(
>  					connector, aconnector->drm_edid);
> @@ -459,8 +462,6 @@ static int dm_dp_mst_get_modes(struct drm_connector *=
connector)
>  		}
>  	}
> =20
> -	drm_edid_connector_update(&aconnector->base, aconnector->drm_edid);
> -
>  	ret =3D drm_edid_connector_add_modes(connector);
> =20
>  	return ret;
> @@ -650,9 +651,11 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_m=
gr *mgr,
>  	if (connector->max_bpc_property)
>  		drm_connector_attach_max_bpc_property(connector, 8, 16);
> =20
> +	/* Reuse VRR property from master connector for MST connectors */
>  	connector->vrr_capable_property =3D master->base.vrr_capable_property;
>  	if (connector->vrr_capable_property)
> -		drm_connector_attach_vrr_capable_property(connector);
> +		drm_object_attach_property(&connector->base,
> +					   connector->vrr_capable_property, 0);
> =20
>  	drm_object_attach_property(
>  		&connector->base,

This doesn't consider if the connected MST device actually supports VRR
pass-through. Unfortunately, this basically breaks display out with my
Thinkpad Universal USB-C dock if VRR is ever toggled. It just can't do
variable signal and immediately drops out.

In current state, this patch sadly breaks more things than it fixes.
