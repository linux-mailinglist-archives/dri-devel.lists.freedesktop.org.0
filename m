Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD5E976501
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 10:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0784F10E208;
	Thu, 12 Sep 2024 08:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cR9twx6i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FEF10E208
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 08:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726131416; x=1757667416;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=6Tkzbnot1aUNPoidsetbIWb7Ad8rBiS0quVwLz7P/Po=;
 b=cR9twx6iojyD4gYwgM1R++IuP846MPOdWspEtnS1JKZDYd8Dp4HKEqP8
 SVd5WBII9SfJXssAGI6a5TvbaLVsHyUqzokcETxKym53r4TdkGJRDd4wb
 /opEZDcejYI8ceVZHtFzCfLPn/Yfbpymx7RAilawhVTliWTmvT+mbsDpj
 1TmhdeBYZPHnPy/hz0c3ImwFnsqlKmF8YmEBCG9O31hok8R15Gp1DeTEJ
 qnQyKZXN4G0jnWw3ymGwVJIb9rN9TCx+L74S6IJ8rW1KbeHDUxGZ1xHse
 bWhYHL6n7uz4K0p6FtyU3T7m9owi58L/57dhYnnF5FsBUY++hqlmik+sp A==;
X-CSE-ConnectionGUID: lmGvrZPmQCeOoE19dh40Hg==
X-CSE-MsgGUID: 0/DPwKMFQbeDnkYOay++wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24848398"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="24848398"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 01:56:55 -0700
X-CSE-ConnectionGUID: g45qTTtXQNOT4npoaH3hZQ==
X-CSE-MsgGUID: 5BsJJWrgRkKAYy+a/eL33g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="68426878"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.253])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 01:56:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Tejas Vipin
 <tejasvipin76@gmail.com>, Laurent.pinchart@ideasonboard.com,
 patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/gma500: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
In-Reply-To: <87o74ti7g5.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240911180650.820598-1-tejasvipin76@gmail.com>
 <b0f77fcc-5d84-4727-9a17-9d1f1e2c5b76@suse.de> <87o74ti7g5.fsf@intel.com>
Date: Thu, 12 Sep 2024 11:56:47 +0300
Message-ID: <87ldzxi71s.fsf@intel.com>
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

On Thu, 12 Sep 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 12 Sep 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 11.09.24 um 20:06 schrieb Tejas Vipin:
>>> Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi since
>>> monitor HDMI information is available after EDID is parsed. Additionally
>>> rewrite the code the code to have fewer indentation levels.
>>
>> The problem is that the entire logic is outdated. The content=20
>> of=C2=A0cdv_hdmi_detect() should go into cdv_hdmi_get_modes(), the detec=
t_ctx=20
>> callback should be set to drm_connector_helper_detect_from_ddc() and=20
>> cdv_hdmi_detect() should be deleted. The result is that ->detect_ctx=20
>> will detect the presence of a display and ->get_modes will update EDID=20
>> and other properties.
>
> I guess I didn't get the memo on this one.
>
> What's the problem with reading the EDID at detect? The subsequent
> drm_edid_connector_add_modes() called from .get_modes() does not need to
> read the EDID again.

Moreover, in this case .detect() only detects digital displays as
reported by EDID. If you postpone that to .get_modes(), the probe helper
will still report connected, and invent non-EDID fallback modes. The
behaviour changes.

> I think it should be fine to do incremental refactors like the patch at
> hand (modulo some issues I mention below).

Another issue in the patch is that it should also change .get_modes() to
not read the EDID again, but just call drm_edid_connector_add_modes().

BR,
Jani.

>
> BR,
> Jani.
>
>
>>
>> Do you have=C2=A0 a device for testing such a change?
>>
>> Best regards
>> Thomas
>>
>>>
>>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>>> ---
>>> Changes in v2:
>>>      - Use drm_edid instead of edid
>>>
>>> Link to v1: https://lore.kernel.org/all/20240910051856.700210-1-tejasvi=
pin76@gmail.com/
>>> ---
>>>   drivers/gpu/drm/gma500/cdv_intel_hdmi.c | 24 +++++++++++++-----------
>>>   1 file changed, 13 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/=
gma500/cdv_intel_hdmi.c
>>> index 2d95e0471291..701f8bbd5f2b 100644
>>> --- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
>>> +++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
>>> @@ -128,23 +128,25 @@ static enum drm_connector_status cdv_hdmi_detect(
>>>   {
>>>   	struct gma_encoder *gma_encoder =3D gma_attached_encoder(connector);
>>>   	struct mid_intel_hdmi_priv *hdmi_priv =3D gma_encoder->dev_priv;
>>> -	struct edid *edid =3D NULL;
>>> +	const struct drm_edid *drm_edid;
>>> +	int ret;
>>>   	enum drm_connector_status status =3D connector_status_disconnected;
>>>=20=20=20
>>> -	edid =3D drm_get_edid(connector, connector->ddc);
>>> +	drm_edid =3D drm_edid_read_ddc(connector, connector->ddc);
>
> Just drm_edid_read() is enough when you're using connector->ddc.
>
>>> +	ret =3D drm_edid_connector_update(connector, drm_edid);
>>>=20=20=20
>>>   	hdmi_priv->has_hdmi_sink =3D false;
>>>   	hdmi_priv->has_hdmi_audio =3D false;
>>> -	if (edid) {
>>> -		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
>>> -			status =3D connector_status_connected;
>>> -			hdmi_priv->has_hdmi_sink =3D
>>> -						drm_detect_hdmi_monitor(edid);
>>> -			hdmi_priv->has_hdmi_audio =3D
>>> -						drm_detect_monitor_audio(edid);
>>> -		}
>>> -		kfree(edid);
>>> +	if (ret)
>
> This error path leaks the EDID.
>
>>> +		return status;
>>> +
>>> +	if (drm_edid_is_digital(drm_edid)) {
>>> +		status =3D connector_status_connected;
>>> +		hdmi_priv->has_hdmi_sink =3D connector->display_info.is_hdmi;
>>> +		hdmi_priv->has_hdmi_audio =3D connector->display_info.has_audio;
>>>   	}
>>> +	drm_edid_free(drm_edid);
>>> +
>>>   	return status;
>>>   }
>>>=20=20=20

--=20
Jani Nikula, Intel
