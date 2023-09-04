Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BD67915D2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 12:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCB510E0A4;
	Mon,  4 Sep 2023 10:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E267310E0A4;
 Mon,  4 Sep 2023 10:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693824370; x=1725360370;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=KHt/4SPdEa/K4jl/PT53mORoq02pMuDNtQWlBAw3LlA=;
 b=cHG9rLvT6jFOH1rg9GUt8RgfGOKTDgnw9gETe78XWGDpAay9Ul0NlOLM
 Sqaoo82FnQKuNcFWHsfBmSeYsdaUe4IMjMhxXLLFpU/p5NRL6VtanVyfX
 POCUrH1YegYEixB+ce4oHh+kELBRtSHxSvyNLiL0ImpQbY/Z08gM1LWV7
 nA5J7QDyl+XqeWbay138XJPTft9lsS5TLtKxr1NyccYcQ/GWMoEOV6+ye
 1/b/Oda0jV24R/qSUP5HlSFl6p0fsEEl8seUDutqfsKd7gcaFm752YrDV
 X75PQ5gt+m1bkJnFMYI0BHBkv8J0CEUk+xYQ0yz+R4vfM+6fNABJdOGRz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="356891442"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="356891442"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 03:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="740717566"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="740717566"
Received: from rapetroa-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.79])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 03:43:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 1/6] drm/edid: add drm_edid_is_digital()
In-Reply-To: <CADnq5_OVm2HsLwDuDEU4npLJiZdTUL+_XnbqaoDS50a1LRWXfA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1692884619.git.jani.nikula@intel.com>
 <4bdb407bf189fd922be022eb2f9564692377c81d.1692884619.git.jani.nikula@intel.com>
 <CADnq5_OVm2HsLwDuDEU4npLJiZdTUL+_XnbqaoDS50a1LRWXfA@mail.gmail.com>
Date: Mon, 04 Sep 2023 13:43:45 +0300
Message-ID: <87a5u2i5ge.fsf@intel.com>
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 01 Sep 2023, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Thu, Aug 24, 2023 at 9:46=E2=80=AFAM Jani Nikula <jani.nikula@intel.co=
m> wrote:
>>
>> Checking edid->input & DRM_EDID_INPUT_DIGITAL is common enough to
>> deserve a helper that also lets us abstract the raw EDID a bit better.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Thanks; I'm afraid this got merged already.

> Seems to be a few additional users of this that could be converted:
>
> drivers/gpu/drm/i915/display/intel_sdvo.c:        if (edid &&
> edid->input & DRM_EDID_INPUT_DIGITAL)
> drivers/gpu/drm/i915/display/intel_sdvo.c:    bool monitor_is_digital
> =3D !!(edid->input & DRM_EDID_INPUT_DIGITAL);
> drivers/gpu/drm/i915/display/intel_crt.c:        bool is_digital =3D
> edid->input & DRM_EDID_INPUT_DIGITAL;
> drivers/gpu/drm/i915/display/intel_hdmi.c:    if (edid && edid->input
> & DRM_EDID_INPUT_DIGITAL) {

The next patch takes care of these.

> drivers/gpu/drm/gma500/psb_intel_sdvo.c:        if (edid->input &
> DRM_EDID_INPUT_DIGITAL) {
> drivers/gpu/drm/gma500/psb_intel_sdvo.c:            if (edid->input &
> DRM_EDID_INPUT_DIGITAL)
> drivers/gpu/drm/gma500/psb_intel_sdvo.c:        bool
> monitor_is_digital =3D !!(edid->input & DRM_EDID_INPUT_DIGITAL);
> drivers/gpu/drm/gma500/psb_intel_sdvo.c:    if (edid !=3D NULL &&
> edid->input & DRM_EDID_INPUT_DIGITAL)
> drivers/gpu/drm/gma500/cdv_intel_hdmi.c:        if (edid->input &
> DRM_EDID_INPUT_DIGITAL) {
> drivers/gpu/drm/display/drm_dp_helper.c:        edid->input &
> DRM_EDID_INPUT_DIGITAL &&
> drivers/gpu/drm/nouveau/nouveau_connector.c:            if
> (nv_connector->edid->input & DRM_EDID_INPUT_DIGITAL)
> drivers/gpu/drm/radeon/radeon_connectors.c:
> !!(radeon_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
> drivers/gpu/drm/radeon/radeon_connectors.c:
> !!(radeon_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
> drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c:
> !!(amdgpu_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
> drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c:
> !!(amdgpu_connector->edid->input & DRM_EDID_INPUT_DIGITAL);

drm_edid_is_digital() operates on struct drm_edid.

The drivers would first need to be converted to use struct drm_edid
instead of struct edid, and I'm not really taking that on.

IMO adding helpers to operate on struct edid would be
counter-productive.

BR,
Jani.

>
>
>
>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 17 +++++++++++++++--
>>  include/drm/drm_edid.h     |  1 +
>>  2 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 340da8257b51..1dbb15439468 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -3110,7 +3110,7 @@ drm_monitor_supports_rb(const struct drm_edid *drm=
_edid)
>>                 return ret;
>>         }
>>
>> -       return ((drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL) !=3D 0);
>> +       return drm_edid_is_digital(drm_edid);
>>  }
>>
>>  static void
>> @@ -6519,7 +6519,7 @@ static void update_display_info(struct drm_connect=
or *connector,
>>         if (edid->revision < 3)
>>                 goto out;
>>
>> -       if (!(edid->input & DRM_EDID_INPUT_DIGITAL))
>> +       if (!drm_edid_is_digital(drm_edid))
>>                 goto out;
>>
>>         info->color_formats |=3D DRM_COLOR_FORMAT_RGB444;
>> @@ -7335,3 +7335,16 @@ static void _drm_update_tile_info(struct drm_conn=
ector *connector,
>>                 connector->tile_group =3D NULL;
>>         }
>>  }
>> +
>> +/**
>> + * drm_edid_is_digital - is digital?
>> + * @drm_edid: The EDID
>> + *
>> + * Return true if input is digital.
>> + */
>> +bool drm_edid_is_digital(const struct drm_edid *drm_edid)
>> +{
>> +       return drm_edid && drm_edid->edid &&
>> +               drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL;
>> +}
>> +EXPORT_SYMBOL(drm_edid_is_digital);
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> index 48e93f909ef6..882d2638708e 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -612,6 +612,7 @@ const struct drm_edid *drm_edid_read_switcheroo(stru=
ct drm_connector *connector,
>>  int drm_edid_connector_update(struct drm_connector *connector,
>>                               const struct drm_edid *edid);
>>  int drm_edid_connector_add_modes(struct drm_connector *connector);
>> +bool drm_edid_is_digital(const struct drm_edid *drm_edid);
>>
>>  const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>>                                   int ext_id, int *ext_index);
>> --
>> 2.39.2
>>

--=20
Jani Nikula, Intel Open Source Graphics Center
