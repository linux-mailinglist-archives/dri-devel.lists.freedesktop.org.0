Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DCC53FD1F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 13:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AEF10E13A;
	Tue,  7 Jun 2022 11:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D364810E12A;
 Tue,  7 Jun 2022 11:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654600499; x=1686136499;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Q4DD6Gu/aSRDkzAQ+tgk8rapaBwE5igmzYyTcbz+tGw=;
 b=DnPvdK+4GYhvIxcRFS9alPedcRvIHE7OB1ObvCmr1yTWkNMB/W72tAmJ
 FAWkGjKuFmDXpPCjShZNawVue8NK0/a7ZD9WtxlN/0N0hpXwKOurJsio2
 JTXO5t+pDzxt/2yQsw3N5D4tm5Nn3fFb9mHcFtISx8tqU3ONoKbVeqLZf
 BmB/s7NBtGASOwF/qZFItg0QZbAJw26dGGSSWSjhW69dt8IKlwbo8jhCY
 KXKnU6t0npLFoYhOJZfVEX5UYv0ypVCFKzRAXLlS43uasMEyndZEBWCDB
 M8tvEgBdqf3fYX7Xx8OIES9VTMfwegi+P/PJpSk85PW4FW7fjOpJ+NI7j A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="259463685"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="259463685"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 04:14:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="636081446"
Received: from gknielse-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.57.112])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 04:14:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v1 06/13] drm/probe-helper: make .get_modes() optional,
 add default action
In-Reply-To: <Ypjv3k6tbHjOtGOB@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1653381821.git.jani.nikula@intel.com>
 <a38b2547f43e827a401a4123744edbb402e9f4d7.1653381821.git.jani.nikula@intel.com>
 <Ypjv3k6tbHjOtGOB@intel.com>
Date: Tue, 07 Jun 2022 14:14:54 +0300
Message-ID: <87mteopvwx.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 02 Jun 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, May 24, 2022 at 01:39:28PM +0300, Jani Nikula wrote:
>> Add default action when .get_modes() not set. This also defines what a
>> .get_modes() hook should do.
>>=20
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_probe_helper.c       | 14 +++++++++++++-
>>  include/drm/drm_modeset_helper_vtables.h |  4 ++++
>>  2 files changed, 17 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_pr=
obe_helper.c
>> index 836bcd5b4cb6..9df17f0ae225 100644
>> --- a/drivers/gpu/drm/drm_probe_helper.c
>> +++ b/drivers/gpu/drm/drm_probe_helper.c
>> @@ -360,7 +360,19 @@ static int drm_helper_probe_get_modes(struct drm_co=
nnector *connector)
>>  		connector->helper_private;
>>  	int count;
>>=20=20
>> -	count =3D connector_funcs->get_modes(connector);
>> +	if (connector_funcs->get_modes) {
>> +		count =3D connector_funcs->get_modes(connector);
>> +	} else {
>> +		const struct drm_edid *drm_edid;
>> +
>> +		/* Note: This requires connector->ddc is set */
>> +		drm_edid =3D drm_edid_read(connector);
>> +
>> +		/* Update modes etc. from the EDID */
>> +		count =3D drm_edid_connector_update(connector, drm_edid);
>> +
>> +		drm_edid_free(drm_edid);
>> +	}
>
> Not really a huge fan of this automagic fallback. I think I'd prefer
> to keep it mandatory and just provide this as a helper for drivers to
> plug into the right spot. Otherwise I'm sure I'll forget how this works
> and then I'll be confused when I see a connector withput any apparent
> .get_modes() implementation.

Fair enough.

I'm not sure how useful that is going to be, though, at least not for
i915. If we add a .get_edid hook, where would you bolt that? It doesn't
feel right to set a .get_modes hook to a default function that goes on
to call a .get_edid hook. Or what do you think?

BR,
Jani.

>
>>=20=20
>>  	/*
>>  	 * Fallback for when DDC probe failed in drm_get_edid() and thus skipp=
ed
>> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_=
modeset_helper_vtables.h
>> index fafa70ac1337..b4402bc64e57 100644
>> --- a/include/drm/drm_modeset_helper_vtables.h
>> +++ b/include/drm/drm_modeset_helper_vtables.h
>> @@ -894,6 +894,10 @@ struct drm_connector_helper_funcs {
>>  	 * libraries always call this with the &drm_mode_config.connection_mut=
ex
>>  	 * held. Because of this it's safe to inspect &drm_connector->state.
>>  	 *
>> +	 * This callback is optional. By default, it reads the EDID using
>> +	 * drm_edid_read() and updates the connector display info, modes, and
>> +	 * properties using drm_edid_connector_update().
>> +	 *
>>  	 * RETURNS:
>>  	 *
>>  	 * The number of modes added by calling drm_mode_probed_add().
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
