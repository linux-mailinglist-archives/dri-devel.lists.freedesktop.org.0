Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C677C8A6CF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B954810E64B;
	Wed, 26 Nov 2025 14:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8VaW5H/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D5410E649;
 Wed, 26 Nov 2025 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764168464; x=1795704464;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XnIiipcU35AAy1EjsCEeubzLMfSPg89dVBgMlxNprj4=;
 b=T8VaW5H/pFYUOdVSe7lsJa2GoIolVns/LKjlBei1F1F8OsSybFAuJX9q
 PZgdfJBP3GNOMvKootVaSCq5H2FFkpPPjF30Q720SyKI99EpRX1zjJSui
 Ml/vMS+E1xXxGxj4JTII4RW278CaBXltpObfjrpI6aSas9BG7Lglo9tV7
 p6H8E+ntdv1MVLkisgsCM3q/+KoDUbaH4C6qo3bvWzDJMK2IAQWfwQCrR
 OSy78bdB79Nv+A0w7ZMdU3DLpKcgL4PXimw1Z7d2ridchqKVH/gLMtC2a
 djJdL/9NlXQ6TrmST0lJpylEJU0ouVDcPli5qTT3kkffNMBgpmy8Gi9aR A==;
X-CSE-ConnectionGUID: UT5prK03SoKsJxqChiPAyw==
X-CSE-MsgGUID: 9qNIgEsESNStY9Oh7BTbHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76892065"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="76892065"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:47:43 -0800
X-CSE-ConnectionGUID: XusfCZKORQam3kbzRNmv9Q==
X-CSE-MsgGUID: ofXgK9yESTGwX/uKLM56lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192091183"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.1])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:47:38 -0800
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
In-Reply-To: <2f847ef3-9fb9-46a1-b5bd-38d8498b7772@0la.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251126065126.54016-1-iam@lach.pw>
 <20251126065126.54016-3-iam@lach.pw>
 <68c55e772424f8e001898cdd1edcf4856820461e@intel.com>
 <41fbf5af-559a-4810-82c1-5c2e8a497e5b@0la.ch>
 <493bcd10bdfc8a3123323b77eead3dacadc08e3c@intel.com>
 <2f847ef3-9fb9-46a1-b5bd-38d8498b7772@0la.ch>
Date: Wed, 26 Nov 2025 16:47:34 +0200
Message-ID: <afb3d6b3788ad3f8ece48399be7e8e195a62b8b6@intel.com>
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
> On 2025-11-26 15:29, Jani Nikula wrote:
>> On Wed, 26 Nov 2025, Yaroslav <iam@0la.ch> wrote:
>> The failure mode is: Someone buys a new shiny laptop with eDP MSO, with
>> bigger vendor block, and won't get a picture on screen.
>
> I understand that, I'm only confused because this does seem to be as 
> suitable for backport as this fixed DSC bpp thing is:
>
> Someone buys a VR headset with fixed DSC bpp (Bigscreen Beyond/Bigscreen 
> Beyond 2/Vive Pro 2), and the system is unable to detect them.
>
> Unless eDP MSO with vendor specific data block extended with unset fixed 
> DSC bpp value is much more popular in the wild, that is. I have however 
> failed to discover any devices which have this value present other than 
> the three mentioned VR headsets.

The difference is between an existing and enabled feature working vs. a
new feature working. eDP MSO is expected to work. Also, IIUC you can
still use the VR headsets albeit with a lower resolution. For eDP MSO
you simply get nothing, and even beginning to debug the issue is
problematic, since that is quite possibly the only display on the
device.


BR,
Jani.


-- 
Jani Nikula, Intel
