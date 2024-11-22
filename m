Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13B79D5BE1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 10:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6398610EB20;
	Fri, 22 Nov 2024 09:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAQKhnad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FF010E21D;
 Fri, 22 Nov 2024 09:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732267558; x=1763803558;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yw4x0hQe3k9KPm6YYncbQCpHw7cJuBKLSWGSHbEBsHs=;
 b=JAQKhnadGmqZPSGQhXwPJAUvXpxCMEKI8VyULRWm72J/zwqHdwdx6AaQ
 5QRMeuMv5pVJiuQr9YwWCOSTZY5gqRJrSEzfdd7D+71MTLY+pxGrL4bX5
 8/aOjDh8OBVvJd0vqxGGcaQfDvDzuxCueZWz1jlRgnuz8pJgbsAMdxo1R
 pJRp0dSNJZwnPvkr6r2JUfDS6GKtM0as9xxD/h9VSa5VebQvqABcNWxlb
 ErDDEB2HXRxt3nd6xmtKJoikqDwQ0Byx6Wz5G3XK5AzgjKHEvR+9+m/ze
 XqmURx/MQxmtTK+aKf8NJQqEiGP02olw4RJXcccsRFA8CEAiX7r8geuYJ A==;
X-CSE-ConnectionGUID: isWgrgSsRr+KJmlH5+PP6A==
X-CSE-MsgGUID: bBnTWqO+T9SRWtrE7oyxkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="57817075"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="57817075"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 01:25:57 -0800
X-CSE-ConnectionGUID: iRs4PElvSq27OQWPHXMhZQ==
X-CSE-MsgGUID: ssuPJiiZQxW13OWSVi9r9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="95610690"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.157])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 01:25:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "imre.deak@intel.com" <imre.deak@intel.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: RE: [PATCH v4 0/2] Refactor MST DSC Determination Policy
In-Reply-To: <IA1PR12MB90631D65960DEFFCE3CFD4C0E5222@IA1PR12MB9063.namprd12.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241108174439.141418-1-Jerry.Zuo@amd.com>
 <IA1PR12MB90631D65960DEFFCE3CFD4C0E5222@IA1PR12MB9063.namprd12.prod.outlook.com>
Date: Fri, 22 Nov 2024 11:25:46 +0200
Message-ID: <87jzcvzkkl.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Nov 2024, "Zuo, Jerry" <Jerry.Zuo@amd.com> wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Hi Lyude, Jani, Imre, Simona:
>
>      Please kindly review the patch series at your convenient
>      time. Thanks.

There's still way too much going on in one patch. It's too hard to do
proper detailed review on this. I don't have that kind of time to spend.

If you were to get a regression report on this maybe a year down the
line when it hits major distros, what are your chances of pinpointing
what went wrong? What are your chances of quickly debugging and fixing
it? I'm thinking slim.

MST is too complicated to trap ourselves in that scenario.

Please find a way to do incremental refactoring first to support your
functional changes.

BR,
Jani.


>
> Regards,
> Jerry
>
>> -----Original Message-----
>> From: Fangzhi Zuo <Jerry.Zuo@amd.com>
>> Sent: Friday, November 8, 2024 12:42 PM
>> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-
>> gfx@lists.freedesktop.org; lyude@redhat.com; jani.nikula@intel.com;
>> imre.deak@intel.com; simona@ffwll.ch; Lin, Wayne <Wayne.Lin@amd.com>
>> Cc: Wentland, Harry <Harry.Wentland@amd.com>; Siqueira, Rodrigo
>> <Rodrigo.Siqueira@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
>> Subject: [PATCH v4 0/2] Refactor MST DSC Determination Policy
>>
>> The patch series is to refactor existing dsc determination policy for dsc
>> decompression and dsc passthrough given a mst output port.
>>
>> Original routine was written based on different peer device types which is not
>> accurate and shows difficulty when expanding support of products that do not fully
>> comply with DP specs.
>>
>> To make the routine more accurate and generic, the series includes below changes:
>> 1. Refactor MST DSC determination policy solely based on
>>    topology connection status and dsc dpcd capability info.
>> 2. Dependency changes required for each vendor due to interface change.
>>
>> v2: split original single patch into two
>> v3: rebase against the latest code
>> v4: fix a ci issue
>>
>> Fangzhi Zuo (2):
>>   drm/display/dsc: Refactor DRM MST DSC Determination Policy
>>   drm/display/dsc: MST DSC Interface Change
>>
>>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |   2 +-
>>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  20 +-
>>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  28 +-
>>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 261 ++++++++----------
>>  drivers/gpu/drm/i915/display/intel_dp.c       |   2 +-
>>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +-
>>  include/drm/display/drm_dp_mst_helper.h       |   9 +-
>>  7 files changed, 147 insertions(+), 178 deletions(-)
>>
>> --
>> 2.43.0
>

-- 
Jani Nikula, Intel
