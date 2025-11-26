Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127CEC8A742
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAA310E64C;
	Wed, 26 Nov 2025 14:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlFr5g7p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CC410E64C;
 Wed, 26 Nov 2025 14:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764168752; x=1795704752;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=X45ZDWDBTw1wxXtkxfMlyBa4vvDgq0JXkYBWXwJNuFY=;
 b=ZlFr5g7pTWGbzxPKI2TC2dR9m/ehnl3JFYqeO02uWhpPckJRXGXq7MDR
 n+UlfGVl4DppxHup16goF87AX6T72UrSYpZ5gonLbJ5pau57+UqPt09hz
 7ZnxvtTvkseiWdbXbqDH5T+mbvOgZi6TVVPiXjOLelwYHThVR5Ff1TxWU
 8n7PgXhI5UUlhzAVx+0aa52A/3w57nsS4Gu1nnZtAj042qIE7KnY87oB3
 s3v/WG95dlkQzND6B1Kx5yJRZ3Ct72jtIB9FkMwamY7pfMoWb2yEZbDyn
 tcP+U3HHsi1dkDtNRZz4G01nB+qugwKUMvdyZ91md0socc2Yq5tJdILqH g==;
X-CSE-ConnectionGUID: iMRePlDwTwy6r0M1mI/IvQ==
X-CSE-MsgGUID: Xjzoe3B1QROS3QVpXz9gGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="68798471"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="68798471"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:52:32 -0800
X-CSE-ConnectionGUID: mEkr9s6eTiqjyMLUyXKzoQ==
X-CSE-MsgGUID: ESymxlEkQ0eJE/dZN3E3eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="197286295"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.1])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:52:26 -0800
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
Subject: Re: [PATCH v6 4/7] drm/edid: parse DSC DPP passthru support flag
 for mode VII timings
In-Reply-To: <c32eb9e4-41fa-4d17-a214-d7f594f34d82@0la.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251126065126.54016-1-iam@lach.pw>
 <20251126065126.54016-5-iam@lach.pw>
 <6f88c0111ce7f2a74010ff43a77bdd03f669ffb6@intel.com>
 <c32eb9e4-41fa-4d17-a214-d7f594f34d82@0la.ch>
Date: Wed, 26 Nov 2025 16:52:23 +0200
Message-ID: <17f7e5e7d45bab4324968e352231f739bbdf7366@intel.com>
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
> On 2025-11-26 15:19, Jani Nikula wrote:
>> On Wed, 26 Nov 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
>>> +	if (type_7 && FIELD_GET(DISPLAYID_BLOCK_REV, block->rev) >= 1)
>>> +		mode->dsc_passthrough_timings_support =
>>> +			!!(block->rev & DISPLAYID_BLOCK_PASSTHROUGH_TIMINGS_SUPPORT);
>> 
>> The !! and parentheses are superfluous.
>> 
>
> Most of the other instances of bitflag parsing logic in kernel seem to 
> cast integers to booleans explicitly this way.
>
> I'm fine with simplifying that, I was only doing what everyone else does.

I get that, but such habits originate from the days before std bool. !!
normalizes ints to 0 and 1, but assigning to bool does the same for you.

BR,
Jani.


-- 
Jani Nikula, Intel
