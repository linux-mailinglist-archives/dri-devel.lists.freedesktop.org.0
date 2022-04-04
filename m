Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD664F1346
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 12:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A9B10EEEB;
	Mon,  4 Apr 2022 10:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6B810EEB0;
 Mon,  4 Apr 2022 10:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649069191; x=1680605191;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=IAWZ6QL3SqaCdeA4GnM8wFmdjMcm0DfPeYPVHyxzJTk=;
 b=TeCjsKvk3nRrp759z+V6fxoTRs5gy76ROIb+8vc/WSValoSwRGuBQ1Hs
 fx29/C+0UHvyVP88YncvivNga6lTrt3PMbom1srrKLoCmYg0U/bypvEbq
 +5F3PPpzT1EzTU0AehtXgJFCOlrYlioRtDOSy0lK+eaQ47dFLgrkHXrhI
 NLHjGo7tG1bd6eQd8f/LdRp35Ih6mrt2MIJhM3lKrjpUFIfULbgOi2hfX
 cMPA1pAGu7cxK14zvryD3wYCP4IeFEwBG8WuBh56ZaG/TG+sQf45ue4q1
 N6ofqjAt9aA9jdPK6YOXZijr0XmvgWTXL1GOSnlM6upwez3HphnxaZptE g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10306"; a="241073987"
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="241073987"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 03:46:30 -0700
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="548605937"
Received: from tszumski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.141.89])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 03:46:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display/debugfs: Add connector
 debugfs for "output_bpc"
In-Reply-To: <b5041da6-9a2b-c687-5dc9-c587eb6230b4@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220328075020.708022-1-bhanuprakash.modem@intel.com>
 <20220329060731.785476-1-bhanuprakash.modem@intel.com>
 <877d897z90.fsf@intel.com>
 <b5041da6-9a2b-c687-5dc9-c587eb6230b4@intel.com>
Date: Mon, 04 Apr 2022 13:46:23 +0300
Message-ID: <87fsmt6s8w.fsf@intel.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Arkadiusz Hiler <arek@hiler.eu>,
 airlied@linux.ie, Petri Latvala <petri.latvala@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 04 Apr 2022, "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com> w=
rote:
> On Fri-01-04-2022 06:10 pm, Jani Nikula wrote:
>> On Tue, 29 Mar 2022, Bhanuprakash Modem <bhanuprakash.modem@intel.com> w=
rote:
>>> This new debugfs will expose the connector's max supported bpc
>>> and the bpc currently using. It is very useful for verifying
>>> whether we enter the correct output color depth from IGT.
>>>
>>> Example:
>>> cat /sys/kernel/debug/dri/0/DP-1/output_bpc
>>> Current: 8
>>> Maximum: 10
>>>
>>> V2: Add connector's max bpc to i915_display_info
>>>
>>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>> Cc: Uma Shankar <uma.shankar@intel.com>
>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>> ---
>>>   .../drm/i915/display/intel_display_debugfs.c  | 46 +++++++++++++++++++
>>>   1 file changed, 46 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/dri=
vers/gpu/drm/i915/display/intel_display_debugfs.c
>>> index c1e74a13a0828..694d27f3b109c 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>>> @@ -663,6 +663,8 @@ static void intel_connector_info(struct seq_file *m,
>>>   	seq_puts(m, "\tHDCP version: ");
>>>   	intel_hdcp_info(m, intel_connector);
>>>=20=20=20
>>> +	seq_printf(m, "\tmax bpc: %u\n", connector->display_info.bpc);
>>> +
>>>   	intel_panel_info(m, intel_connector);
>>>=20=20=20
>>>   	seq_printf(m, "\tmodes:\n");
>>> @@ -2275,6 +2277,47 @@ static const struct file_operations i915_dsc_bpp=
_fops =3D {
>>>   	.write =3D i915_dsc_bpp_write
>>>   };
>>>=20=20=20
>>> +/*
>>> + * Returns the maximum output bpc for the connector.
>>> + * Example usage: cat /sys/kernel/debug/dri/0/DP-1/output_bpc
>>> + */
>>> +static int output_bpc_show(struct seq_file *m, void *data)
>>> +{
>>> +	struct drm_connector *connector =3D m->private;
>>> +	struct drm_device *dev =3D connector->dev;
>>> +	struct drm_crtc *crtc;
>>> +	struct intel_crtc_state *crtc_state;
>>> +	struct intel_encoder *encoder =3D intel_attached_encoder(to_intel_con=
nector(connector));
>>> +	int res;
>>> +
>>> +	if (!encoder)
>>> +		return -ENODEV;
>>> +
>>> +	res =3D drm_modeset_lock_single_interruptible(&dev->mode_config.conne=
ction_mutex);
>>> +	if (res)
>>> +		return res;
>>> +
>>> +	crtc =3D connector->state->crtc;
>>> +	if (connector->status !=3D connector_status_connected || !crtc) {
>>> +		res =3D -ENODEV;
>>> +		goto unlock;
>>> +	}
>>> +
>>> +	crtc_state =3D to_intel_crtc_state(crtc->state);
>>> +	if (!crtc_state->hw.active)
>>> +		goto unlock;
>>> +
>>> +	seq_printf(m, "Current: %u\n", crtc_state->pipe_bpp / 3);
>>> +	seq_printf(m, "Maximum: %u\n", connector->display_info.bpc);
>>> +	res =3D 0;
>>> +
>>> +unlock:
>>> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
>>> +
>>> +	return res;
>>> +}
>>> +DEFINE_SHOW_ATTRIBUTE(output_bpc);
>>=20
>> Looks like an excessive amount of code for a single value.
>
> Yeah, but these values are very helpful in many IGT tests like=20
> kms_color, kms_hdr, kms_dither, kms_dsc etc..
>
> Otherwise IGT needs to request the kernel to get the EDID, and parse=20
> that EDID to get the "Maximum" value which is redundant (Kernel is=20
> already doing the same) and not recommended in IGT.
>
> And there is no way to get the "Current" value except reading it from=20
> i915_display_info which is again not recommended in IGT (As=20
> i915_display_info is Intel specific).

Note how we have intel_connector_debugfs_add() for connector debugfs and
intel_crtc_debugfs_add() for crtc debugfs, and how this patch just mixes
up the two by looking up crtc and state from the connector debugfs.

> This debugfs is already introduced & using by AMD:=20
> https://patchwork.freedesktop.org/patch/308586

Wait, what?

Both amd and i915 adding the name "output_bpc" is *not* the way to
roll. We only add i915_ prefixed debugfs files from i915.ko.

If you need this to be a standard interface across drivers, IMO it
should be added in common drm code, not sprinkled around in drivers.

I see that amd is already using this in what is basically drm core
debugfs namespace, and there's amd specific IGT built on top.

Adding a bunch of Cc's to get some clarity on drm debugfs naming and
usage.


BR,
Jani.


>
> - Bhanu
>
>>=20
>> BR,
>> Jani.
>>=20
>>> +
>>>   /**
>>>    * intel_connector_debugfs_add - add i915 specific connector debugfs =
files
>>>    * @connector: pointer to a registered drm_connector
>>> @@ -2330,6 +2373,9 @@ void intel_connector_debugfs_add(struct intel_con=
nector *intel_connector)
>>>   	    connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB)
>>>   		debugfs_create_file("i915_lpsp_capability", 0444, root,
>>>   				    connector, &i915_lpsp_capability_fops);
>>> +
>>> +	debugfs_create_file("output_bpc", 0444, root,
>>> +			    connector, &output_bpc_fops);
>>>   }
>>>=20=20=20
>>>   /**
>>=20
>

--=20
Jani Nikula, Intel Open Source Graphics Center
