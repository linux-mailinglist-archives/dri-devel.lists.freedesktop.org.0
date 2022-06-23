Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500DC5573F1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 09:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B6C113667;
	Thu, 23 Jun 2022 07:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D930A1135CA;
 Thu, 23 Jun 2022 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655969362; x=1687505362;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=0f1dTo8dB9OkSfVJdcZfxfgoc3g/LTiRisEYj+qGTe4=;
 b=CGeW0g/DfNtBYCkrdDXAiQuhsIiRc5ZFWv7LSX7O64xzKqxc66al/to1
 6eBuZttJ+Hk/IvWDABkZ5ujLAFpACqhWHUXiwBoqa1My35nzATAcu+S+x
 y4EGm98dqXYTkN57r8OeDSlpDRm6ZM+NXvNp/2Lel9QVlj9dy2U1+CYN5
 lxeCNs3xUAipHhb8SBXzkRgEQHb7v3E3CGAK2q93xTdWPVkzl+wzhJ668
 ka7t2iBUVRjvQkAd4YFyoyyGr5/6YbpbSXktXwTX43NCjFryG+XhdCe2/
 PQoOK0fkcn0Th4tPnb5VDQk7I4+Jioj5JPJiHi4JQYMHT4VrxBanr8v1p w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="281728136"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="281728136"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 00:29:22 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="834514257"
Received: from gknielse-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.61.112])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 00:29:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 08/13] drm/i915/edid: convert DP, HDMI and LVDS to
 drm_edid
In-Reply-To: <YrMvwZZ/gKKf9sKK@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1655895388.git.jani.nikula@intel.com>
 <944e7c45ca5a59f421926e94e6b12abccff78f92.1655895388.git.jani.nikula@intel.com>
 <YrMvwZZ/gKKf9sKK@intel.com>
Date: Thu, 23 Jun 2022 10:29:18 +0300
Message-ID: <87tu8brg6p.fsf@intel.com>
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

On Wed, 22 Jun 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Jun 22, 2022 at 01:59:22PM +0300, Jani Nikula wrote:
>> @@ -948,27 +948,30 @@ void intel_lvds_init(struct drm_i915_private *dev_=
priv)
>>  	 * preferred mode is the right one.
>>  	 */
>>  	mutex_lock(&dev->mode_config.mutex);
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
>> -			kfree(edid);
>> -			edid =3D ERR_PTR(-EINVAL);
>> +					       intel_gmbus_get_adapter(dev_priv, pin));
>> +		if (edid)
>> +			drm_edid =3D drm_edid_alloc(edid, (edid->extensions + 1) * EDID_LENG=
TH);
>
> This one still seems to leak.

Damn, only fixed the DP one. Thanks! New patch in-reply.

BR,
Jani.


>
>> +	} else {
>> +		drm_edid =3D drm_edid_read_ddc(connector,
>> +					     intel_gmbus_get_adapter(dev_priv, pin));
>> +	}
>> +	if (drm_edid) {
>> +		if (!drm_edid_connector_update(connector, drm_edid)) {
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
>>  	intel_bios_init_panel(dev_priv, &intel_connector->panel, NULL,
>> -			      IS_ERR(edid) ? NULL : edid);
>> +			      IS_ERR_OR_NULL(drm_edid) ? NULL : drm_edid_raw(drm_edid));
>>=20=20
>>  	/* Try EDID first */
>>  	intel_panel_add_edid_fixed_modes(intel_connector,
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
