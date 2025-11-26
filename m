Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629BCC8A55F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E9410E63B;
	Wed, 26 Nov 2025 14:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLhkKeM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A4810E63A;
 Wed, 26 Nov 2025 14:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764167372; x=1795703372;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/LlqH9UbhyiWV5v/QUURxbvTmHPfX45iCRn7T7U7q6o=;
 b=SLhkKeM9tn8W5WJPKDgZ4d+A5ZvMZVfiHSeP6QMtJ4gQg2wHVfQt3wPe
 7neCkBnPrP43N/fVQMp+gmFX2/uwuh+087iV3iYnEVKzHSBMP9ijK8GH8
 eY/OJbNpZhbqEehdy5lVgDrBwSlrPT+r4cVZ0hm+2iJZ3mzBjUTMeMtqv
 5PIXD1RfHwBmKXRxbQpXHLzPHCZFvLRA+w3d1c/gbeG73Joli0QJ3wfeC
 XNGDgELra+2EimMSJfzQe4mdaiqXsumil2SREihY1+ENQpSDbggxoqB6B
 mOd0Jy+DHVmY7EKcjaIxKXiLq7kMhfiWcmLSYcwR6Of7nJ2VVe49O/WWG A==;
X-CSE-ConnectionGUID: oxD2tDHvSS+pYcwcPNZLHw==
X-CSE-MsgGUID: AAnLo6BiQiaH8e/45NdGuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66093052"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66093052"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:29:31 -0800
X-CSE-ConnectionGUID: 4kGuRhgaQeyOIYLcD0bsQQ==
X-CSE-MsgGUID: 9GkMVfUwR6G56ywLFwghBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="193049839"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.1])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:29:23 -0800
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
In-Reply-To: <41fbf5af-559a-4810-82c1-5c2e8a497e5b@0la.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251126065126.54016-1-iam@lach.pw>
 <20251126065126.54016-3-iam@lach.pw>
 <68c55e772424f8e001898cdd1edcf4856820461e@intel.com>
 <41fbf5af-559a-4810-82c1-5c2e8a497e5b@0la.ch>
Date: Wed, 26 Nov 2025 16:29:19 +0200
Message-ID: <493bcd10bdfc8a3123323b77eead3dacadc08e3c@intel.com>
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
> On 2025-11-26 10:13, Jani Nikula wrote:
>> On Wed, 26 Nov 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
>>> Current VESA vendor-specific block parsing expects real block size to be
>>> the same as the defined struct size, use real offsets in conditionals
>>> instead to add struct fields in future commits.
>>>
>>> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
>> 
>> I think this is something we want to backport, since MSO would break
>> with bigger vendor-specific blocks, and that leads to black screens on
>> MSO displays.
>> 
>
> Not sure why would we want to backport that if we don't backport the 
> other changes, old kernels will just have the broken implementation, 
> which in reality affects almost no body, given that there were no bug 
> reports

The failure mode is: Someone buys a new shiny laptop with eDP MSO, with
bigger vendor block, and won't get a picture on screen.

BR,
Jani.


-- 
Jani Nikula, Intel
