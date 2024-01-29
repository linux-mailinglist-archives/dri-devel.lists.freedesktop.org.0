Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353C1840C17
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 17:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BA71129FC;
	Mon, 29 Jan 2024 16:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A93510E0F8;
 Mon, 29 Jan 2024 16:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706546819; x=1738082819;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=44NsvH+KQdpWMlSBMIAtXvkxIIBjDimdakKzD/tf1eI=;
 b=QrnE2akdGyIduhwwJEsbN9EhA/qorkHplQTco1ZU/rI4MBX5uf5XrQa9
 JmGkRQUhNSHvL+gCnvCEM64I161wnW/mcEgaNjThXi3yDGlifrkeX6GVl
 1GUt/Etoc/dfMHgPxIbeYTT9/qlqlQ2EH3aHx5TCf6T5fKG1BGj11yrM+
 z0N+HHflzxb7AfjKK5/HZKl5QAi6Us2zY3N3iFKT4jtwI9BuzaGIVSJ4w
 pgxi6ukn6IFja2ZwmtCpybbwcHMoVGwvZlI8mBDJcThDj0BBfvGvD2E6E
 71t5qD3bRIqnmXX6/jIbrc9pSAOlVpDIIr+NYR6esRMsIGtUatCzTzJ9r A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="467262304"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="467262304"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 08:46:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3423587"
Received: from hbrandbe-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.53])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 08:46:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] drm/amd: Fetch the EDID from _DDC if available for eDP
In-Reply-To: <63c60424-1b2d-4912-81b2-7c7ead4c8289@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240126184639.8187-1-mario.limonciello@amd.com>
 <20240126184639.8187-3-mario.limonciello@amd.com>
 <87le88jx63.fsf@intel.com> <63c60424-1b2d-4912-81b2-7c7ead4c8289@amd.com>
Date: Mon, 29 Jan 2024 18:46:49 +0200
Message-ID: <87cytkjddy.fsf@intel.com>
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
Cc: Melissa Wen <mwen@igalia.com>, "open
 list:ACPI" <linux-acpi@vger.kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Jan 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
> On 1/29/2024 03:39, Jani Nikula wrote:
>> On Fri, 26 Jan 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
>>> index 9caba10315a8..c7e1563a46d3 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
>>> @@ -278,6 +278,11 @@ static void amdgpu_connector_get_edid(struct drm_connector *connector)
>>>   	struct amdgpu_device *adev = drm_to_adev(dev);
>>>   	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
>>>   
>>> +	if (amdgpu_connector->edid)
>>> +		return;
>>> +
>>> +	/* if the BIOS specifies the EDID via _DDC, prefer this */
>>> +	amdgpu_connector->edid = amdgpu_acpi_edid(adev, connector);
>> 
>> Imagine the EDID returned by acpi_video_get_edid() has edid->extensions
>> bigger than 4. Of course it should not, but you have no guarantees, and
>> it originates outside of the kernel.
>> 
>> The real fix is to have the function return a struct drm_edid which
>> tracks the allocation size separately. Unfortunately, it requires a
>> bunch of changes along the way. We've mostly done it in i915, and I've
>> sent a series to do this in drm/bridge [1].

Looking at it again, perhaps the ACPI code should just return a blob,
and the drm code should have a helper to wrap that around struct
drm_edid, so that the ACPI code does not have to depend on drm. Basic
idea remains.

>> Bottom line, we should stop using struct edid in drivers. They'll all
>> parse the info differently, and from what I've seen, often wrong.
>> 
>> 
>
> Thanks for the feedback.  In that case this specific change should 
> probably rebase on the Melissa's work 
> https://lore.kernel.org/amd-gfx/20240126163429.56714-1-mwen@igalia.com/ 
> after she takes into account the feedback.
>
> Let me ask you this though - do you think that after that's done should 
> we let all drivers get EDID from BIOS as a priority?  Or would you 
> prefer that this is unique to amdgpu?

If the reason for having this is that the panel EDID contains some
garbage, that's certainly not unique to amdgpu... :p

> Something like:
>
> 1) If user specifies on kernel command line and puts an EDID in 
> /lib/firmware use that.
> 2) If BIOS has EDID in _DDC and it's eDP panel, use that.

I think we should also look into this. We currently don't do this, and
it might help with some machines. However, gut feeling says it's
probably better to keep this as a per driver decision instead of trying
to bolt it into drm helpers.

BR,
Jani.


> 3) Get panel EDID.
>

-- 
Jani Nikula, Intel
