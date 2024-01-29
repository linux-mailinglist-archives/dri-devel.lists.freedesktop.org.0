Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6F8840197
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 10:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FD81127C9;
	Mon, 29 Jan 2024 09:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFAB1127C9;
 Mon, 29 Jan 2024 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706520613; x=1738056613;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=y4HS+uVRW9WTygboGvo9yA3ZMYqEE+/M8DxBQGlLi/4=;
 b=ncEdJQwiFZi8VaAp0lLOXyvRzJaSJDngdAiZh+Ixbg0srmsSRs0QzfiA
 9gfPQ4WUwUUy/Bvx09p9uFigqZaRjvDMpBluYOa22cRcFAG5S8jzsvZ6L
 gF1oUc9YqBtabw/netmf0UL4rwHVuex62jTLbmwwk9Rvh3zwMzv4y0eEF
 W8k408kFDDKRRIm9dH6i0MxzQwv9+0CKRaB5lnhIkj09NiTz3hRwPzpcZ
 TJ8OLAdB5SYU/62lBqDd/ElPmzoCjEYjnQzg+ZlzYd0vF4p0QsYXWSSG6
 kLa29/BekG+rTBRRhV5/td1sLUHOUaUSe8bu0McAjbOm7XztlqkSq0lYx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="21431513"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="21431513"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 01:30:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="29726648"
Received: from hbrandbe-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.53])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 01:30:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>, Melissa Wen
 <mwen@igalia.com>, airlied@gmail.com, alexander.deucher@amd.com,
 alex.hung@amd.com, christian.koenig@amd.com, daniel@ffwll.ch,
 harry.wentland@amd.com, Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com
Subject: Re: [RFC PATCH 0/2] drm/amd/display: switch amdgpu_dm_connector to
In-Reply-To: <5fdad82b-3f14-4bb4-9f49-b8397419204d@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240126163429.56714-1-mwen@igalia.com>
 <5fdad82b-3f14-4bb4-9f49-b8397419204d@amd.com>
Date: Mon, 29 Jan 2024 11:30:00 +0200
Message-ID: <87o7d4jxlz.fsf@intel.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Jan 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
> On 1/26/2024 10:28, Melissa Wen wrote:
>> Hi,
>> 
>> I'm debugging a null-pointer dereference when running
>> igt@kms_connector_force_edid and the way I found to solve the bug is to
>> stop using raw edid handler in amdgpu_connector_funcs_force and
>> create_eml_sink in favor of managing resouces via sruct drm_edid helpers
>> (Patch 1). The proper solution seems to be switch amdgpu_dm_connector
>> from struct edid to struct drm_edid and avoid the usage of different
>> approaches in the driver (Patch 2). However, doing it implies a good
>> amount of work and validation, therefore I decided to send this RFC
>> first to collect opinions and check if there is any parallel work on
>> this side. It's a working in progress.
>> 
>> The null-pointer error trigger by the igt@kms_connector_force_edid test
>> was introduced by:
>> - e54ed41620f ("drm/amd/display: Remove unwanted drm edid references")
>> 
>> You can check the error trace in the first patch.
>> 
>> This series was tested with kms_hdmi_inject and kms_force_connector. No
>> null-pointer error, kms_hdmi_inject is successul and kms_force_connector
>> is sucessful after the second execution - the force-edid subtest
>> still fails in the first run (I'm still investigating).
>> 
>> There is also a couple of cast warnings to be addressed - I'm looking
>> for the best replacement.
>> 
>> I appreciate any feedback and testing.
>
> So I'm actually a little bit worried by hardcoding EDID_LENGTH in this 
> series.
>
> I have some other patches that I'm posting later on that let you get the 
> EDID from _DDC BIOS method too.  My observation was that the EDID can be 
> anywhere up to 512 bytes according to the ACPI spec.
>
> An earlier version of my patch was using EDID_LENGTH when fetching it 
> and the EDID checksum failed.
>
> I'll CC you on the post, we probably want to get your changes and mine 
> merged together.

One of the main points of struct drm_edid is that it tracks the
allocation size separately.

We should simply not trust edid->extensions, because most of the time it
originates from outside the kernel.

Using drm_edid and immediately drm_edid_raw() falls short. That function
should only be used during migration to help. And yeah, it also means
EDID parsing should be done in drm_edid.c, and not spread out all over
the subsystem.


BR,
Jani.


>
>> 
>> Melissa
>> 
>> Melissa Wen (2):
>>    drm/amd/display: fix null-pointer dereference on edid reading
>>    drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
>> 
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 78 ++++++++++---------
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  4 +-
>>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  9 ++-
>>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 23 +++---
>>   4 files changed, 60 insertions(+), 54 deletions(-)
>> 
>

-- 
Jani Nikula, Intel
