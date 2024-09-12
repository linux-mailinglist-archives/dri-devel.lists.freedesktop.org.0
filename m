Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B3F976590
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 11:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF1010EB2D;
	Thu, 12 Sep 2024 09:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="haQjlYfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3C410E204
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 09:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726133420; x=1757669420;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=eTXQ/tFOYhg01ItOOaN/NpclcjdWXR+sBh8CckiY2ks=;
 b=haQjlYfs+kOKOmskM6Zq+dvVE84U60zc8/Y+bMi8NiJBW35TMrYYGeXI
 c8EVtfOjxbgWfPOiKrFqRHBqaoW0baOHiPoHIMk0Qc+v3bNCa3r7rLlKz
 zE6qmp/8hA4nBBykhZ3dByenrTkFOrJA1X2HB8A/UJivLh5VaopJwrF8j
 2XCrirBWMMs5L+sgh6XQq3uSpD1SBQ4toYjXdYKug4Dwig25gEG60lEek
 mvH2jz6QvREcDmj3RETLg0EmET/MTEPD8Hv6JuAEMDOmue56PH4fV7pTg
 l8FbK6Iyz2YpN+tlUUTxRDT1652aPxqgeDAk+dLGuq4fIKFTCQ2W1Pv4i w==;
X-CSE-ConnectionGUID: MDOe7dDwQAWmG6K701kX7g==
X-CSE-MsgGUID: J58HXEkVR6e5RvC7nknz+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24459323"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="24459323"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 02:30:20 -0700
X-CSE-ConnectionGUID: 3mxAsib4QXuet0SOybub6Q==
X-CSE-MsgGUID: ZoLdkyEbRWarwpYP20DlGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="67571662"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.253])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 02:30:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Tejas Vipin
 <tejasvipin76@gmail.com>, Laurent.pinchart@ideasonboard.com,
 patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/gma500: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
In-Reply-To: <42b27020-a68e-4c43-800e-61977324be78@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240911180650.820598-1-tejasvipin76@gmail.com>
 <b0f77fcc-5d84-4727-9a17-9d1f1e2c5b76@suse.de> <87o74ti7g5.fsf@intel.com>
 <42b27020-a68e-4c43-800e-61977324be78@suse.de>
Date: Thu, 12 Sep 2024 12:30:12 +0300
Message-ID: <871q1pi5i3.fsf@intel.com>
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

On Thu, 12 Sep 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 12.09.24 um 10:48 schrieb Jani Nikula:
>> On Thu, 12 Sep 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> Hi
>>>
>>> Am 11.09.24 um 20:06 schrieb Tejas Vipin:
>>>> Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi since
>>>> monitor HDMI information is available after EDID is parsed. Additional=
ly
>>>> rewrite the code the code to have fewer indentation levels.
>>> The problem is that the entire logic is outdated. The content
>>> of=C2=A0cdv_hdmi_detect() should go into cdv_hdmi_get_modes(), the dete=
ct_ctx
>>> callback should be set to drm_connector_helper_detect_from_ddc() and
>>> cdv_hdmi_detect() should be deleted. The result is that ->detect_ctx
>>> will detect the presence of a display and ->get_modes will update EDID
>>> and other properties.
>> I guess I didn't get the memo on this one.
>>
>> What's the problem with reading the EDID at detect? The subsequent
>> drm_edid_connector_add_modes() called from .get_modes() does not need to
>> read the EDID again.
>
> With drm_connector_helper_detect_from_ddc() there is already a helper=20
> for detection. It makes sense to use it. And if we continue to update=20
> the properties in detect (instead of get_modes), what is the correct=20
> connector_status on errors? Right now and with the patch applied, detect=
=20
> returns status_disconnected on errors. But this isn't correct if there=20
> actually is a display. By separating detect and get_modes cleanly, we=20
> can detect the display reliably, but also handle errors better than we=20
> currently do in gma500. Get_modes is already expected to update the EDID=
=20
> property, [1] for detect it's not so clear AFAICT. I think that from a=20
> design perspective, it makes sense to have a read-only function that=20
> only detects the physical state of the connector and a read-write=20
> function that updates the connector's properties. Best regards Thomas=20
> [1]=20
> https://elixir.bootlin.com/linux/v6.10.9/source/include/drm/drm_modeset_h=
elper_vtables.h#L865=20

So what if you can probe DDC but can't actually read an EDID of any
kind? IMO that's a detect failure.

Or how about things like CEC attach? Seems natural to do it at
.detect(). Doing it at .get_modes() just seems wrong. However, it needs
the EDID for physical address.

I just don't think one size fits all here.

BR,
Jani.


>
>>
>> I think it should be fine to do incremental refactors like the patch at
>> hand (modulo some issues I mention below).
>>
>> BR,
>> Jani.
>>
>>
>>> Do you have=C2=A0 a device for testing such a change?
>>>
>>> Best regards
>>> Thomas
>>>
>>>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>>>> ---
>>>> Changes in v2:
>>>>       - Use drm_edid instead of edid
>>>>
>>>> Link to v1: https://lore.kernel.org/all/20240910051856.700210-1-tejasv=
ipin76@gmail.com/
>>>> ---
>>>>    drivers/gpu/drm/gma500/cdv_intel_hdmi.c | 24 +++++++++++++---------=
--
>>>>    1 file changed, 13 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm=
/gma500/cdv_intel_hdmi.c
>>>> index 2d95e0471291..701f8bbd5f2b 100644
>>>> --- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
>>>> +++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
>>>> @@ -128,23 +128,25 @@ static enum drm_connector_status cdv_hdmi_detect(
>>>>    {
>>>>    	struct gma_encoder *gma_encoder =3D gma_attached_encoder(connector=
);
>>>>    	struct mid_intel_hdmi_priv *hdmi_priv =3D gma_encoder->dev_priv;
>>>> -	struct edid *edid =3D NULL;
>>>> +	const struct drm_edid *drm_edid;
>>>> +	int ret;
>>>>    	enum drm_connector_status status =3D connector_status_disconnected;
>>>>=20=20=20=20
>>>> -	edid =3D drm_get_edid(connector, connector->ddc);
>>>> +	drm_edid =3D drm_edid_read_ddc(connector, connector->ddc);
>> Just drm_edid_read() is enough when you're using connector->ddc.
>>
>>>> +	ret =3D drm_edid_connector_update(connector, drm_edid);
>>>>=20=20=20=20
>>>>    	hdmi_priv->has_hdmi_sink =3D false;
>>>>    	hdmi_priv->has_hdmi_audio =3D false;
>>>> -	if (edid) {
>>>> -		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
>>>> -			status =3D connector_status_connected;
>>>> -			hdmi_priv->has_hdmi_sink =3D
>>>> -						drm_detect_hdmi_monitor(edid);
>>>> -			hdmi_priv->has_hdmi_audio =3D
>>>> -						drm_detect_monitor_audio(edid);
>>>> -		}
>>>> -		kfree(edid);
>>>> +	if (ret)
>> This error path leaks the EDID.
>>
>>>> +		return status;
>>>> +
>>>> +	if (drm_edid_is_digital(drm_edid)) {
>>>> +		status =3D connector_status_connected;
>>>> +		hdmi_priv->has_hdmi_sink =3D connector->display_info.is_hdmi;
>>>> +		hdmi_priv->has_hdmi_audio =3D connector->display_info.has_audio;
>>>>    	}
>>>> +	drm_edid_free(drm_edid);
>>>> +
>>>>    	return status;
>>>>    }
>>>>=20=20=20=20

--=20
Jani Nikula, Intel
