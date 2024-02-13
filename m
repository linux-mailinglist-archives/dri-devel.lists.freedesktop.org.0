Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C87B85321D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 14:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EEC10E2B3;
	Tue, 13 Feb 2024 13:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lI7gF50f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200DE10E2B3;
 Tue, 13 Feb 2024 13:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707831746; x=1739367746;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=cxJwDBVrHZhV9tMqmvcoF18iQ5UbYFfdiCgd5u+lZ+A=;
 b=lI7gF50ftDElZKDKw2/gZJvQ0L+z8oxramANgMtXI1PBBT7ssogWXi+K
 2GkKtz3/X/ePuQZn5OG+14yj7sWSAKivmFfSZR2nr7erkC2O0H6+3bVlF
 HPwyCywyJgJXZ2uxQO7FAN8XMwMyph8XudohCz6GFzrE3dScbCsDThimc
 0AN+YOp+RXuVKA+MYJFetZ9xEGLiOUX51jhhaw6fKicQ28yRUNwDwyYVF
 Yv9mg7axq3lxbZ/mWhSrXTSNk4+UGv8rsHgV/AoEqiM0GTXSbfe3SpJm8
 frNFjsa9SNvDZj1oBYz7PuZlprilNAmG6FDYW4m0vpjeyqwk+P5egs1QV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1692632"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1692632"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 05:42:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="911788379"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="911788379"
Received: from snasibli-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.44.50])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 05:42:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v2 1/6] drm/mst: read sideband messaging cap
In-Reply-To: <IA0PR11MB7307E7130A93748F85E2CBB8BA4F2@IA0PR11MB7307.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1707823736.git.jani.nikula@intel.com>
 <507901114b7e4f0e4149747c8052747a22fe8ead.1707823736.git.jani.nikula@intel.com>
 <IA0PR11MB7307E7130A93748F85E2CBB8BA4F2@IA0PR11MB7307.namprd11.prod.outlook.com>
Date: Tue, 13 Feb 2024 15:42:19 +0200
Message-ID: <87cyt08oqs.fsf@intel.com>
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

On Tue, 13 Feb 2024, "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
>> -----Original Message-----
>> From: Nikula, Jani <jani.nikula@intel.com>
>> Sent: Tuesday, February 13, 2024 5:01 PM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Nik=
ula, Jani
>> <jani.nikula@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>; Ville
>> Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Subject: [PATCH v2 1/6] drm/mst: read sideband messaging cap
>>
>> Amend drm_dp_read_mst_cap() to return an enum, indicating "SST", "SST wi=
th
>> sideband messaging", or "MST". Modify all call sites to take the new ret=
urn
>> value into account.
>>
>> v2:
>> - Rename enumerators (Ville)
>>
>> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 20 ++++++++++------
>>  drivers/gpu/drm/i915/display/intel_dp.c       |  4 ++--
>>  drivers/gpu/drm/nouveau/nouveau_dp.c          |  2 +-
>>  include/drm/display/drm_dp_mst_helper.h       | 23 ++++++++++++++++++-
>>  4 files changed, 38 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> index 03d528209426..c193be3577f7 100644
>> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> @@ -3608,24 +3608,30 @@ fixed20_12 drm_dp_get_vc_payload_bw(const
>> struct drm_dp_mst_topology_mgr *mgr,
>> EXPORT_SYMBOL(drm_dp_get_vc_payload_bw);
>>
>>  /**
>> - * drm_dp_read_mst_cap() - check whether or not a sink supports MST
>> + * drm_dp_read_mst_cap() - Read the sink's MST mode capability
>>   * @aux: The DP AUX channel to use
>>   * @dpcd: A cached copy of the DPCD capabilities for this sink
>>   *
>> - * Returns: %True if the sink supports MST, %false otherwise
>> + * Returns: enum drm_dp_mst_mode to indicate MST mode capability
>>   */
>> -bool drm_dp_read_mst_cap(struct drm_dp_aux *aux,
>> -                      const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>> +enum drm_dp_mst_mode drm_dp_read_mst_cap(struct drm_dp_aux *aux,
>> +                                      const u8
>> dpcd[DP_RECEIVER_CAP_SIZE])
>>  {
>>       u8 mstm_cap;
>>
>>       if (dpcd[DP_DPCD_REV] < DP_DPCD_REV_12)
>> -             return false;
>> +             return DRM_DP_SST;
>>
>>       if (drm_dp_dpcd_readb(aux, DP_MSTM_CAP, &mstm_cap) !=3D 1)
>> -             return false;
>> +             return DRM_DP_SST;
>> +
>> +     if (mstm_cap & DP_MST_CAP)
>> +             return DRM_DP_MST;
>> +
>> +     if (mstm_cap & DP_SINGLE_STREAM_SIDEBAND_MSG)
>> +             return DRM_DP_SST_SIDEBAND_MSG;
> Bit[1] of MSTM_CAP indicates sideband messaging is supported or not
> and nothing to do with MST/SST. So would it make more sense to have it
> as DRM_DP_SIDEBAND_MSG?

Bit 1 is literally described as SINGLE_STREAM_SIDEBAND_MSG_SUPPORT in
the spec, "Supports Sideband MSG while not supporting multi-stream
transport".

Bit 1 is also only valid when bit 0 says, "Does not support MST mode".


BR,
Jani.


>
> Thanks and Regards,
> Arun R Murthy
> --------------------
>>
>> -     return mstm_cap & DP_MST_CAP;
>> +     return DRM_DP_SST;
>>  }
>>  EXPORT_SYMBOL(drm_dp_read_mst_cap);
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>> b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 5045c34a16be..a1c304f451bd 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -4014,7 +4014,7 @@ intel_dp_can_mst(struct intel_dp *intel_dp)
>>
>>       return i915->display.params.enable_dp_mst &&
>>               intel_dp_mst_source_support(intel_dp) &&
>> -             drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
>> +             drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) =3D=3D
>> DRM_DP_MST;
>>  }
>>
>>  static void
>> @@ -4023,7 +4023,7 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
>>       struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>>       struct intel_encoder *encoder =3D
>>               &dp_to_dig_port(intel_dp)->base;
>> -     bool sink_can_mst =3D drm_dp_read_mst_cap(&intel_dp->aux, intel_dp-
>> >dpcd);
>> +     bool sink_can_mst =3D drm_dp_read_mst_cap(&intel_dp->aux,
>> +intel_dp->dpcd) =3D=3D DRM_DP_MST;
>>
>>       drm_dbg_kms(&i915->drm,
>>                   "[ENCODER:%d:%s] MST support: port: %s, sink: %s,
>> modparam: %s\n", diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c
>> b/drivers/gpu/drm/nouveau/nouveau_dp.c
>> index 7de7707ec6a8..fb06ee17d9e5 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
>> @@ -181,7 +181,7 @@ nouveau_dp_probe_dpcd(struct nouveau_connector
>> *nv_connector,
>>       if (nouveau_mst) {
>>               mstm =3D outp->dp.mstm;
>>               if (mstm)
>> -                     mstm->can_mst =3D drm_dp_read_mst_cap(aux, dpcd);
>> +                     mstm->can_mst =3D drm_dp_read_mst_cap(aux, dpcd)
>> =3D=3D DRM_DP_MST;
>>       }
>>
>>       if (nouveau_dp_has_sink_count(connector, outp)) { diff --git
>> a/include/drm/display/drm_dp_mst_helper.h
>> b/include/drm/display/drm_dp_mst_helper.h
>> index 9b19d8bd520a..3c9e128c444a 100644
>> --- a/include/drm/display/drm_dp_mst_helper.h
>> +++ b/include/drm/display/drm_dp_mst_helper.h
>> @@ -818,7 +818,28 @@ int drm_dp_mst_topology_mgr_init(struct
>> drm_dp_mst_topology_mgr *mgr,
>>
>>  void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr
>> *mgr);
>>
>> -bool drm_dp_read_mst_cap(struct drm_dp_aux *aux, const u8
>> dpcd[DP_RECEIVER_CAP_SIZE]);
>> +/**
>> + * enum drm_dp_mst_mode - sink's MST mode capability  */ enum
>> +drm_dp_mst_mode {
>> +     /**
>> +      * @DRM_DP_SST: The sink does not support MST nor single stream
>> sideband
>> +      * messaging.
>> +      */
>> +     DRM_DP_SST,
>> +     /**
>> +      * @DRM_DP_MST: Sink supports MST, more than one stream and
>> single
>> +      * stream sideband messaging.
>> +      */
>> +     DRM_DP_MST,
>> +     /**
>> +      * @DRM_DP_SST_SIDEBAND_MSG: Sink supports only one stream and
>> single
>> +      * stream sideband messaging.
>> +      */
>> +     DRM_DP_SST_SIDEBAND_MSG,
>> +};
>> +
>> +enum drm_dp_mst_mode drm_dp_read_mst_cap(struct drm_dp_aux *aux,
>> const
>> +u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>>  int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr
>> *mgr, bool mst_state);
>>
>>  int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr
>> *mgr,
>> --
>> 2.39.2
>

--=20
Jani Nikula, Intel
