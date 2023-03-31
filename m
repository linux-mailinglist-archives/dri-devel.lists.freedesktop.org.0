Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE7B6D1AC6
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 10:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE11610F141;
	Fri, 31 Mar 2023 08:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021D110F141;
 Fri, 31 Mar 2023 08:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680252615; x=1711788615;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=BYf6gcQ+8pBQ3J2IfyMIsvJoZJhrstWGkrCjW+23ZyU=;
 b=SouLsEO2q2j2FCeoS+H0gkkqW8cIDNsdFHAUILIUFUd1j0Ul3GF5zvTx
 J3UViHSG6K34F7DC4hmtftBL36dTN9eUazKcZGhtFqw+JHr7P3cILnx4P
 UfTsC7ddgF6fyaZnRFXnH2mlGd6pwXRuENPYQqRkff4yJvmKLDXjN/Cwa
 YQS0+vQ1m1+kJNMf5n8fBjhZCukIPHnA+kzBMtk3Qb90+mErpiuudJo76
 DofMhaL6IU7VWks00Bqz+mFLQ9Cwb4xlKLIqXksZ3jxCIMlRTJMsaEN+U
 9SNDAKFDlwCFjDLXxX4i4IhZeq2XTMG54VsfkS8TdetYRI+m684H9x2z7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="341412790"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="341412790"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 01:50:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="754334060"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="754334060"
Received: from bachaue1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.41.110])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 01:50:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 04/12] drm/radeon: remove radeon_connector_edid() and
 stop using edid_blob_ptr
In-Reply-To: <e4cb7b0c7217511429e69c1c78729f0e864c5b24.1680190534.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1680190534.git.jani.nikula@intel.com>
 <e4cb7b0c7217511429e69c1c78729f0e864c5b24.1680190534.git.jani.nikula@intel.com>
Date: Fri, 31 Mar 2023 11:50:09 +0300
Message-ID: <87a5zt2tku.fsf@intel.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> radeon_connector_edid() copies the EDID from edid_blob_ptr as a side
> effect if radeon_connector->edid isn't initialized. However, everywhere
> that the returned EDID is used, the EDID should have been set
> beforehands.
>
> Only the EDID code and sysfs should look at the EDID property, anyway,
> so stop using it.

Never mind this, I need to fix my config to actually build
this. *facepalm*

>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/radeon/radeon_audio.c      |  5 ++---
>  drivers/gpu/drm/radeon/radeon_connectors.c | 15 ---------------
>  drivers/gpu/drm/radeon/radeon_mode.h       |  2 --
>  3 files changed, 2 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/rade=
on/radeon_audio.c
> index 947de91e13f6..759b5dfaca15 100644
> --- a/drivers/gpu/drm/radeon/radeon_audio.c
> +++ b/drivers/gpu/drm/radeon/radeon_audio.c
> @@ -309,7 +309,7 @@ static void radeon_audio_write_sad_regs(struct drm_en=
coder *encoder)
>  	if (!connector)
>  		return;
>=20=20
> -	sad_count =3D drm_edid_to_sad(radeon_connector_edid(connector), &sads);
> +	sad_count =3D drm_edid_to_sad(radeon_connector->edid, &sads);
>  	if (sad_count < 0)
>  		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
>  	if (sad_count <=3D 0)
> @@ -332,8 +332,7 @@ static void radeon_audio_write_speaker_allocation(str=
uct drm_encoder *encoder)
>  	if (!connector)
>  		return;
>=20=20
> -	sad_count =3D drm_edid_to_speaker_allocation(radeon_connector_edid(conn=
ector),
> -						   &sadb);
> +	sad_count =3D drm_edid_to_speaker_allocation(radeon_connector->edid, &s=
adb);
>  	if (sad_count < 0) {
>  		DRM_DEBUG("Couldn't read Speaker Allocation Data Block: %d\n",
>  			  sad_count);
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm=
/radeon/radeon_connectors.c
> index adebf8e9d2bd..99e8f387fe21 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -256,21 +256,6 @@ static struct drm_encoder *radeon_find_encoder(struc=
t drm_connector *connector,
>  	return NULL;
>  }
>=20=20
> -struct edid *radeon_connector_edid(struct drm_connector *connector)
> -{
> -	struct radeon_connector *radeon_connector =3D to_radeon_connector(conne=
ctor);
> -	struct drm_property_blob *edid_blob =3D connector->edid_blob_ptr;
> -
> -	if (radeon_connector->edid) {
> -		return radeon_connector->edid;
> -	} else if (edid_blob) {
> -		struct edid *edid =3D kmemdup(edid_blob->data, edid_blob->length, GFP_=
KERNEL);
> -		if (edid)
> -			radeon_connector->edid =3D edid;
> -	}
> -	return radeon_connector->edid;
> -}
> -
>  static void radeon_connector_get_edid(struct drm_connector *connector)
>  {
>  	struct drm_device *dev =3D connector->dev;
> diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeo=
n/radeon_mode.h
> index 3a59d016e8cd..ab71a744d2b2 100644
> --- a/drivers/gpu/drm/radeon/radeon_mode.h
> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> @@ -708,8 +708,6 @@ extern u16 radeon_connector_encoder_get_dp_bridge_enc=
oder_id(struct drm_connecto
>  extern bool radeon_connector_is_dp12_capable(struct drm_connector *conne=
ctor);
>  extern int radeon_get_monitor_bpc(struct drm_connector *connector);
>=20=20
> -extern struct edid *radeon_connector_edid(struct drm_connector *connecto=
r);
> -
>  extern void radeon_connector_hotplug(struct drm_connector *connector);
>  extern int radeon_dp_mode_valid_helper(struct drm_connector *connector,
>  				       struct drm_display_mode *mode);

--=20
Jani Nikula, Intel Open Source Graphics Center
