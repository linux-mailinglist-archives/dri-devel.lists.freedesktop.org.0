Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198BBC8AFB3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 17:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFF310E687;
	Wed, 26 Nov 2025 16:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftDp0xfj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1821D10E687;
 Wed, 26 Nov 2025 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764174791; x=1795710791;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=fPLw3o4A59qUzWXln0R1Ake/TtcMFQ4a5cuRrKH9Ty0=;
 b=ftDp0xfj2SizyZ9RDzu5lNgDHbkEnk1TqImGTiAxKkpQqN/x+/m9dpsZ
 9EnsDe/5BALKTB0gKGGa9DAynQeI1HJAl68ldxFJI6QKInug2UkF/uRMZ
 BVkTWYAsT0/ky3HuBGehds+eJDIDcWgY0fYHkQI3Rnaziw14K51zsvonD
 lwlYARLVwPCkYjLnjp39TdRM93ocsrYCWNFPU9Wh7D7mpuLT15ko/nW69
 g+RwE5Ozq7lsww3kD/q4Tx+YeRsqQGFop2nLPXGBH7HMgaBVgauHdFsl8
 CX2j52x2WglQv14VLAzp6JgCKF0rxfWIieH3ctOQmxhGRZ2Lakn6hjv6M g==;
X-CSE-ConnectionGUID: SOhzEexeSmC+DtQ4E7hpIQ==
X-CSE-MsgGUID: LpmFDj6vSKujEBl02bbJGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66179250"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66179250"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 08:33:10 -0800
X-CSE-ConnectionGUID: S771fVf6QO+3Jz8/HY5CHg==
X-CSE-MsgGUID: 1FtXyZ4dTQCmJfjfcXTCkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192871076"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.1])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 08:33:02 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yaroslav <iam@0la.ch>, Yaroslav Bolyukin <iam@lach.pw>, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 2/7] drm/edid: prepare for VESA vendor-specific data
 block extension
In-Reply-To: <8a940fa4-ac9a-44b6-9d4a-e5394b0d6bf7@0la.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251126065126.54016-1-iam@lach.pw>
 <20251126065126.54016-3-iam@lach.pw>
 <68c55e772424f8e001898cdd1edcf4856820461e@intel.com>
 <b7191ab7c3030a8be0b149d28ae6fa032b64a4d8@intel.com>
 <ebd974b5-88f4-4fb3-a135-bad3bf7d9b4d@0la.ch>
 <61a482c23a81dc29f1fb793064c7238a98cf0143@intel.com>
 <8455fd94-d95c-4b15-8351-fc1971018e58@0la.ch>
 <8a940fa4-ac9a-44b6-9d4a-e5394b0d6bf7@0la.ch>
Date: Wed, 26 Nov 2025 18:32:59 +0200
Message-ID: <e4caa2026e7cbe7e061175eb1e7a4668c8bcc27f@intel.com>
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

On Wed, 26 Nov 2025, Yaroslav <iam@0la.ch> wrote:
> On 2025-11-26 16:06, Yaroslav wrote:
>> 
>> 
>> On 2025-11-26 15:59, Jani Nikula wrote:
>>> On Wed, 26 Nov 2025, Yaroslav <iam@0la.ch> wrote:
>>>> On 2025-11-26 15:08, Jani Nikula wrote:
>>>>> On Wed, 26 Nov 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>>>>> On Wed, 26 Nov 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
>>>>>>> Current VESA vendor-specific block parsing expects real block size 
>>>>>>> to be
>>>>>>> the same as the defined struct size, use real offsets in conditionals
>>>>>>> instead to add struct fields in future commits.
>>>>>>>
>>>>>>> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
>>>>>>
>>>>>> I think this is something we want to backport, since MSO would break
>>>>>> with bigger vendor-specific blocks, and that leads to black screens on
>>>>>> MSO displays.
>>>>>>
>>>>>> Cc: stable@vger.kernel.org
>>>>>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>>>>
>>>>> Oops, I'll take that back.

Yeah, my bad, I'll take back me taking that back. Original Reviewed-by
stands. Sorry for the noise.

BR,
Jani.


-- 
Jani Nikula, Intel
