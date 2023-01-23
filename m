Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665F76778DD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 11:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4C210E339;
	Mon, 23 Jan 2023 10:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CC910E338;
 Mon, 23 Jan 2023 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674468909; x=1706004909;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=R7TjPoZS7bYWLfmGcXeg4TEAsY/s78qaT2VAILgGV7c=;
 b=UOnKIrgzLvEQResEGw0FgSVq8npr0+9IF+icV4An2BfIstsaWmiS0v5T
 Kj52VMux3+IAoOw8G+r24Fbja0e5rJHOLY/FWA8LbGfFgcj0XIPbQ+Qap
 b1S7PHb08YF9g6ZNnU5OAMb3rnn2wK7L4i9tWCL+oSjxY6Iqracm+y3tt
 S76+hbcaPaLCHPZves31XeDJDukscybxI6X9R3WBkbmMzhyh38jXBDAwD
 Cpwhv6kFkBb+xxypWR8Nik6z5Oe698tpzPzJHQhOMYzkUJkXuSZMgVm0+
 eFiCgYoiRk7gWysGpcS5dZAAw7m1bqhbZZ+gjlvDNoGXKwtPPk1RnS0mL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="390511844"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="390511844"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 02:15:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="730127102"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="730127102"
Received: from possola-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.57.125])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 02:15:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v8 5/8] drm/i915/edid: convert DP, HDMI and LVDS to
 drm_edid
In-Reply-To: <Y8riBdt+O6zDVlFz@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1674144945.git.jani.nikula@intel.com>
 <b58b4c5ea31943e6c816ba0f6f4efa48bd9e5ab6.1674144945.git.jani.nikula@intel.com>
 <Y8riBdt+O6zDVlFz@intel.com>
Date: Mon, 23 Jan 2023 12:15:04 +0200
Message-ID: <87o7qp8slz.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Jan 2023, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Jan 19, 2023 at 06:18:58PM +0200, Jani Nikula wrote:
>> diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm=
/i915/display/intel_lvds.c
>> index aecec992cd0d..6a98787edf48 100644
>> --- a/drivers/gpu/drm/i915/display/intel_lvds.c
>> +++ b/drivers/gpu/drm/i915/display/intel_lvds.c
>> @@ -479,8 +479,11 @@ static int intel_lvds_get_modes(struct drm_connecto=
r *connector)
>>  	struct intel_connector *intel_connector =3D to_intel_connector(connect=
or);
>>=20=20
>>  	/* use cached edid if we have one */
>> -	if (!IS_ERR_OR_NULL(intel_connector->edid))
>> -		return drm_add_edid_modes(connector, intel_connector->edid);
>> +	if (!IS_ERR_OR_NULL(intel_connector->edid)) {
>> +		drm_edid_connector_update(connector, intel_connector->edid);
>
> Isn't this update redundant?

Maybe far fetched, but if the user does connector force disable via
debugfs, drm_helper_probe_single_connector_modes() will clear the EDID
property and display info. And after that, nobody's going to do the
connector update again unless we do it here.

BR,
Jani.



>
>> +
>> +		return drm_edid_connector_add_modes(connector);
>> +	}
>>=20=20
>>  	return intel_panel_get_modes(intel_connector);
>>  }
>> @@ -834,7 +837,7 @@ void intel_lvds_init(struct drm_i915_private *dev_pr=
iv)
>>  	struct intel_connector *intel_connector;
>>  	struct drm_connector *connector;
>>  	struct drm_encoder *encoder;
>> -	struct edid *edid;
>> +	const struct drm_edid *drm_edid;
>>  	i915_reg_t lvds_reg;
>>  	u32 lvds;
>>  	u8 pin;
>> @@ -945,27 +948,36 @@ void intel_lvds_init(struct drm_i915_private *dev_=
priv)
>>  	 * preferred mode is the right one.
>>  	 */
>>  	mutex_lock(&dev_priv->drm.mode_config.mutex);
>> -	if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC)
>> +	if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC) {
>> +		const struct edid *edid;
>> +
>> +		/* FIXME: Make drm_get_edid_switcheroo() return drm_edid */
>>  		edid =3D drm_get_edid_switcheroo(connector,
>> -				    intel_gmbus_get_adapter(dev_priv, pin));
>> -	else
>> -		edid =3D drm_get_edid(connector,
>> -				    intel_gmbus_get_adapter(dev_priv, pin));
>> -	if (edid) {
>> -		if (drm_add_edid_modes(connector, edid)) {
>> -			drm_connector_update_edid_property(connector,
>> -								edid);
>> -		} else {
>> +					       intel_gmbus_get_adapter(dev_priv, pin));
>> +		if (edid) {
>> +			drm_edid =3D drm_edid_alloc(edid, (edid->extensions + 1) * EDID_LENG=
TH);
>>  			kfree(edid);
>> -			edid =3D ERR_PTR(-EINVAL);
>> +		} else {
>> +			drm_edid =3D NULL;
>> +		}
>> +	} else {
>> +		drm_edid =3D drm_edid_read_ddc(connector,
>> +					     intel_gmbus_get_adapter(dev_priv, pin));
>> +	}
>> +	if (drm_edid) {
>> +		if (drm_edid_connector_update(connector, drm_edid) ||
>> +		    !drm_edid_connector_add_modes(connector)) {
>> +			drm_edid_connector_update(connector, NULL);
>> +			drm_edid_free(drm_edid);
>> +			drm_edid =3D ERR_PTR(-EINVAL);
>>  		}
>>  	} else {
>> -		edid =3D ERR_PTR(-ENOENT);
>> +		drm_edid =3D ERR_PTR(-ENOENT);
>>  	}
>> -	intel_connector->edid =3D edid;
>> +	intel_connector->edid =3D drm_edid;
>>=20=20
>>  	intel_bios_init_panel_late(dev_priv, &intel_connector->panel, NULL,
>> -				   IS_ERR(edid) ? NULL : edid);
>> +				   IS_ERR_OR_NULL(drm_edid) ? NULL : drm_edid_raw(drm_edid));
>>=20=20
>>  	/* Try EDID first */
>>  	intel_panel_add_edid_fixed_modes(intel_connector, true);
>> --=20
>> 2.34.1

--=20
Jani Nikula, Intel Open Source Graphics Center
