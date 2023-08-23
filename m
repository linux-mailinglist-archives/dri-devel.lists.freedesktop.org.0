Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5C1785237
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 10:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C02910E3E1;
	Wed, 23 Aug 2023 08:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A74210E3E0;
 Wed, 23 Aug 2023 08:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692777827; x=1724313827;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=J5pwxIqhxccelyL5wgOSHZKK5EXQ9zy48An0bu5ksWs=;
 b=JLnz1B78X3pQb17+offc+HyznKYJ9T3RAqRu1qLsbFqOl2E3lF3u4hGd
 2B8zV1ocrpLGWsahAq9wuhy4M0/aud4JJERcG++VIRUEHnWZYjrQuECKI
 T7cIcwuYyH+CZFSwe8r3RoXKT4PMhtxGdeeKwrhzJxLY3JU731f2fEfPM
 NjlZbXUPNRtmLCxbjZ7LJ9azueXiQmdiY8/7M91wlDqnp6eY92FDDSgGP
 376L3yg0PMkhFLEYmWaFKh0mwfeuCDpWxQJtatYMaORLOTjpSgVy9sKmY
 7MYms5XqQ0LaJHPezo+0D/Rzsy5/94WIktIH4vmLuFjFiSeTTOe/ue8oD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="364274559"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="364274559"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 01:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="730118020"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="730118020"
Received: from vrohpcvpnmu01.ger.corp.intel.com (HELO localhost)
 ([10.252.55.114])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 01:03:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
In-Reply-To: <788721f6-afff-e0b2-db7c-32ab2dd075a9@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1692705543.git.jani.nikula@intel.com>
 <788721f6-afff-e0b2-db7c-32ab2dd075a9@amd.com>
Date: Wed, 23 Aug 2023 11:03:32 +0300
Message-ID: <87il965gob.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Chao-kai Wang <Stylon.Wang@amd.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Wenchieh Chien <wenchieh.chien@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
> On 2023-08-22 06:01, Jani Nikula wrote:
>> Over the past years I've been trying to unify the override and firmware
>> EDID handling as well as EDID property updates. It won't work if drivers
>> do their own random things.
> Let's check how to replace these references by appropriate ones or fork 
> the function as reverting these patches causes regressions.

I think the fundamental problem you have is conflating connector forcing
with EDID override. They're orthogonal. The .force callback has no
business basing the decisions on connector->edid_override. Force is
force, override is override.

The driver isn't even supposed to know or care if the EDID originates
from the firmware loader or override EDID debugfs. drm_get_edid() will
handle that for you transparently. It'll return the EDID, and you
shouldn't look at connector->edid_blob_ptr either. Using that will make
future work in drm_edid.c harder.

You can't fix that with minor tweaks. I think you'll be better off
starting from scratch.

Also, connector->edid_override is debugfs. You actually can change the
behaviour. If your userspace, whatever it is, has been written to assume
connector forcing if EDID override is set, you *do* have to fix that,
and set both.

BR,
Jani.


>
> Cheers,
> Alex
>
>> 
>> BR,
>> Jani.
>> 
>> 
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Alex Hung <alex.hung@amd.com>
>> Cc: Chao-kai Wang <Stylon.Wang@amd.com>
>> Cc: Daniel Wheeler <daniel.wheeler@amd.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Hersen Wu <hersenxs.wu@amd.com>
>> Cc: Leo Li <sunpeng.li@amd.com>
>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>> Cc: Wenchieh Chien <wenchieh.chien@amd.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> 
>> Jani Nikula (4):
>>    Revert "drm/amd/display: drop unused count variable in
>>      create_eml_sink()"
>>    Revert "drm/amd/display: assign edid_blob_ptr with edid from debugfs"
>>    Revert "drm/amd/display: mark amdgpu_dm_connector_funcs_force static"
>>    Revert "drm/amd/display: implement force function in
>>      amdgpu_dm_connector_funcs"
>> 
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 44 +++----------------
>>   1 file changed, 5 insertions(+), 39 deletions(-)
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
