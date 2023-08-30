Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569DB78D5BE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 14:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EE810E4FF;
	Wed, 30 Aug 2023 12:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF5B10E4FF;
 Wed, 30 Aug 2023 12:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693397088; x=1724933088;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=bNw2HtEuZX0VsQpN4r+ovDzyTBUm0UauimhoZ/W9law=;
 b=gWFIp9UzPy+83cvnEtlNfze/gDxhgbMrg0gCgKrKScsapZb/Ie7XcjMP
 6mKhrJ7BB4edqkeDo8NraKm4G9mQpeu6NFQT8uMDjWlYZJjPj6mcLH+Qv
 ad2szHc4+yiRp8LAlqR/ki94m6jh60YGDV2bQrEM1F9WnmivuwzbB7s4i
 hdPP8LoAHVmYE/ldtXwosS4tSWrp0QEZVfWi9bMbjPCqcnZjXvSnKhJAP
 ldyaISo4I7o+5R1HnF2Z6tOsgXHdzJWIMErUrJXMpkddruVSjjrY2F11Q
 h2Nb8TTpnjCExqDbsaBtF25+/npD7/iNgcaA0yLJK5pKmVeoo7+iljRPs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="379373159"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="379373159"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="862600905"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="862600905"
Received: from ziemtocx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.251])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:04:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 03/12] drm/i915: Call the DDC bus i2c
 adapter "ddc"
In-Reply-To: <878r9s22wp.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
 <20230829113920.13713-4-ville.syrjala@linux.intel.com>
 <878r9s22wp.fsf@intel.com>
Date: Wed, 30 Aug 2023 15:04:44 +0300
Message-ID: <87sf80zqg3.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Aug 2023, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 29 Aug 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> @@ -2452,24 +2447,24 @@ intel_hdmi_set_edid(struct drm_connector *connec=
tor)
>>  {
>>  	struct drm_i915_private *dev_priv =3D to_i915(connector->dev);
>>  	struct intel_hdmi *intel_hdmi =3D intel_attached_hdmi(to_intel_connect=
or(connector));
>> +	struct i2c_adapter *ddc =3D intel_gmbus_get_adapter(dev_priv, intel_hd=
mi->ddc_bus);
>>  	intel_wakeref_t wakeref;
>>  	const struct drm_edid *drm_edid;
>>  	const struct edid *edid;
>>  	bool connected =3D false;
>> -	struct i2c_adapter *i2c;
>>=20=20
>>  	wakeref =3D intel_display_power_get(dev_priv, POWER_DOMAIN_GMBUS);
>>=20=20
>> -	i2c =3D intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus);
>> +	edid =3D drm_get_edid(connector, ddc);
>
> Must be a rebase fail.

With this + line dropped, everything else is

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> BR,
> Jani.
>
>>=20=20
>> -	drm_edid =3D drm_edid_read_ddc(connector, i2c);
>> +	drm_edid =3D drm_edid_read_ddc(connector, ddc);
>>=20=20
>> -	if (!drm_edid && !intel_gmbus_is_forced_bit(i2c)) {
>> +	if (!drm_edid && !intel_gmbus_is_forced_bit(ddc)) {
>>  		drm_dbg_kms(&dev_priv->drm,
>>  			    "HDMI GMBUS EDID read failed, retry using GPIO bit-banging\n");
>> -		intel_gmbus_force_bit(i2c, true);
>> -		drm_edid =3D drm_edid_read_ddc(connector, i2c);
>> -		intel_gmbus_force_bit(i2c, false);
>> +		intel_gmbus_force_bit(ddc, true);
>> +		drm_edid =3D drm_edid_read_ddc(connector, ddc);
>> +		intel_gmbus_force_bit(ddc, false);
>>  	}
>>=20=20
>>  	/* Below we depend on display info having been updated */
>> @@ -2561,8 +2556,8 @@ intel_hdmi_get_i2c_adapter(struct drm_connector *c=
onnector)
>>  static void intel_hdmi_create_i2c_symlink(struct drm_connector *connect=
or)
>>  {
>>  	struct drm_i915_private *i915 =3D to_i915(connector->dev);
>> -	struct i2c_adapter *adapter =3D intel_hdmi_get_i2c_adapter(connector);
>> -	struct kobject *i2c_kobj =3D &adapter->dev.kobj;
>> +	struct i2c_adapter *ddc =3D intel_hdmi_get_i2c_adapter(connector);
>> +	struct kobject *i2c_kobj =3D &ddc->dev.kobj;
>>  	struct kobject *connector_kobj =3D &connector->kdev->kobj;
>>  	int ret;
>>=20=20
>> @@ -2573,8 +2568,8 @@ static void intel_hdmi_create_i2c_symlink(struct d=
rm_connector *connector)
>>=20=20
>>  static void intel_hdmi_remove_i2c_symlink(struct drm_connector *connect=
or)
>>  {
>> -	struct i2c_adapter *adapter =3D intel_hdmi_get_i2c_adapter(connector);
>> -	struct kobject *i2c_kobj =3D &adapter->dev.kobj;
>> +	struct i2c_adapter *ddc =3D intel_hdmi_get_i2c_adapter(connector);
>> +	struct kobject *i2c_kobj =3D &ddc->dev.kobj;
>>  	struct kobject *connector_kobj =3D &connector->kdev->kobj;
>>=20=20
>>  	sysfs_remove_link(connector_kobj, i2c_kobj->name);
>> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/d=
rm/i915/display/intel_lspcon.c
>> index bb3b5355a0d9..152a22a8ffd2 100644
>> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
>> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
>> @@ -144,9 +144,9 @@ static enum drm_lspcon_mode lspcon_get_current_mode(=
struct intel_lspcon *lspcon)
>>  	struct intel_dp *intel_dp =3D lspcon_to_intel_dp(lspcon);
>>  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>>  	enum drm_lspcon_mode current_mode;
>> -	struct i2c_adapter *adapter =3D &intel_dp->aux.ddc;
>> +	struct i2c_adapter *ddc =3D &intel_dp->aux.ddc;
>>=20=20
>> -	if (drm_lspcon_get_mode(intel_dp->aux.drm_dev, adapter, &current_mode)=
) {
>> +	if (drm_lspcon_get_mode(intel_dp->aux.drm_dev, ddc, &current_mode)) {
>>  		drm_dbg_kms(&i915->drm, "Error reading LSPCON mode\n");
>>  		return DRM_LSPCON_MODE_INVALID;
>>  	}
>> @@ -185,9 +185,9 @@ static int lspcon_change_mode(struct intel_lspcon *l=
spcon,
>>  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>>  	int err;
>>  	enum drm_lspcon_mode current_mode;
>> -	struct i2c_adapter *adapter =3D &intel_dp->aux.ddc;
>> +	struct i2c_adapter *ddc =3D &intel_dp->aux.ddc;
>>=20=20
>> -	err =3D drm_lspcon_get_mode(intel_dp->aux.drm_dev, adapter, &current_m=
ode);
>> +	err =3D drm_lspcon_get_mode(intel_dp->aux.drm_dev, ddc, &current_mode);
>>  	if (err) {
>>  		drm_err(&i915->drm, "Error reading LSPCON mode\n");
>>  		return err;
>> @@ -198,7 +198,7 @@ static int lspcon_change_mode(struct intel_lspcon *l=
spcon,
>>  		return 0;
>>  	}
>>=20=20
>> -	err =3D drm_lspcon_set_mode(intel_dp->aux.drm_dev, adapter, mode);
>> +	err =3D drm_lspcon_set_mode(intel_dp->aux.drm_dev, ddc, mode);
>>  	if (err < 0) {
>>  		drm_err(&i915->drm, "LSPCON mode change failed\n");
>>  		return err;
>> @@ -233,7 +233,7 @@ static bool lspcon_probe(struct intel_lspcon *lspcon)
>>  	enum drm_dp_dual_mode_type adaptor_type;
>>  	struct intel_dp *intel_dp =3D lspcon_to_intel_dp(lspcon);
>>  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>> -	struct i2c_adapter *adapter =3D &intel_dp->aux.ddc;
>> +	struct i2c_adapter *ddc =3D &intel_dp->aux.ddc;
>>  	enum drm_lspcon_mode expected_mode;
>>=20=20
>>  	expected_mode =3D lspcon_wake_native_aux_ch(lspcon) ?
>> @@ -244,7 +244,7 @@ static bool lspcon_probe(struct intel_lspcon *lspcon)
>>  		if (retry)
>>  			usleep_range(500, 1000);
>>=20=20
>> -		adaptor_type =3D drm_dp_dual_mode_detect(intel_dp->aux.drm_dev, adapt=
er);
>> +		adaptor_type =3D drm_dp_dual_mode_detect(intel_dp->aux.drm_dev, ddc);
>>  		if (adaptor_type =3D=3D DRM_DP_DUAL_MODE_LSPCON)
>>  			break;
>>  	}

--=20
Jani Nikula, Intel Open Source Graphics Center
