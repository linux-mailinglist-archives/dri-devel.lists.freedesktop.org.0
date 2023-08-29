Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CD878C290
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 12:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9E110E1FC;
	Tue, 29 Aug 2023 10:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C759710E1FC;
 Tue, 29 Aug 2023 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693306116; x=1724842116;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bDEGGQkkaPNNQt4YaWAstSx3Ze++jxSiM+4PPflfPZw=;
 b=k7r5u6I8P7Lbfj6uE3kyHqAkwgG7EK4xB8Kn3EFozPwuTA4vTwd+Ml2M
 TiRSnKE9MeUsKguHYs5oI6L6E5HvSavzxaEBgG9G7PRTfTeaMmOgfwt4s
 S9G1+AR8n5CZpmsVVyeFfpO0UtcfrwlWzNX8IwwEf6AgpvPNZSuSAvFQk
 gvNws5qZRmS6kxAtk//GSgRMrGdWQSVtL22YkS1UG1BY0/pAC1WOoS9c7
 ggICE3Y4nh6wb2FOEB5gGqci4DN5v2jQ2kCJJ7xsSO5mUutyzGW0IAwvv
 u9Ci6sAr8Qc1QLfzb0x8wtrIF2l+vsk7fQwxqlHn2tNT2SjL/wM3wfuFL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="375299018"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="375299018"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 03:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="985303912"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="985303912"
Received: from mnefedov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.32.206])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 03:48:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
In-Reply-To: <87il965gob.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1692705543.git.jani.nikula@intel.com>
 <788721f6-afff-e0b2-db7c-32ab2dd075a9@amd.com> <87il965gob.fsf@intel.com>
Date: Tue, 29 Aug 2023 13:48:30 +0300
Message-ID: <871qfm2kg1.fsf@intel.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Wenchieh Chien <wenchieh.chien@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> On Tue, 22 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
>> On 2023-08-22 06:01, Jani Nikula wrote:
>>> Over the past years I've been trying to unify the override and firmware
>>> EDID handling as well as EDID property updates. It won't work if drivers
>>> do their own random things.
>> Let's check how to replace these references by appropriate ones or fork 
>> the function as reverting these patches causes regressions.
>
> I think the fundamental problem you have is conflating connector forcing
> with EDID override. They're orthogonal. The .force callback has no
> business basing the decisions on connector->edid_override. Force is
> force, override is override.
>
> The driver isn't even supposed to know or care if the EDID originates
> from the firmware loader or override EDID debugfs. drm_get_edid() will
> handle that for you transparently. It'll return the EDID, and you
> shouldn't look at connector->edid_blob_ptr either. Using that will make
> future work in drm_edid.c harder.
>
> You can't fix that with minor tweaks. I think you'll be better off
> starting from scratch.
>
> Also, connector->edid_override is debugfs. You actually can change the
> behaviour. If your userspace, whatever it is, has been written to assume
> connector forcing if EDID override is set, you *do* have to fix that,
> and set both.

Any updates on fixing this, or shall we proceed with the reverts?

BR,
Jani.



>
> BR,
> Jani.
>
>
>>
>> Cheers,
>> Alex
>>
>>> 
>>> BR,
>>> Jani.
>>> 
>>> 
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Alex Hung <alex.hung@amd.com>
>>> Cc: Chao-kai Wang <Stylon.Wang@amd.com>
>>> Cc: Daniel Wheeler <daniel.wheeler@amd.com>
>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>> Cc: Hersen Wu <hersenxs.wu@amd.com>
>>> Cc: Leo Li <sunpeng.li@amd.com>
>>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>> Cc: Wenchieh Chien <wenchieh.chien@amd.com>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> 
>>> Jani Nikula (4):
>>>    Revert "drm/amd/display: drop unused count variable in
>>>      create_eml_sink()"
>>>    Revert "drm/amd/display: assign edid_blob_ptr with edid from debugfs"
>>>    Revert "drm/amd/display: mark amdgpu_dm_connector_funcs_force static"
>>>    Revert "drm/amd/display: implement force function in
>>>      amdgpu_dm_connector_funcs"
>>> 
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 44 +++----------------
>>>   1 file changed, 5 insertions(+), 39 deletions(-)
>>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
