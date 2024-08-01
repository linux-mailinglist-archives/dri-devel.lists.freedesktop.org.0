Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C510944B63
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 14:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50E910E949;
	Thu,  1 Aug 2024 12:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKxV2cj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B660310E941;
 Thu,  1 Aug 2024 12:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722515637; x=1754051637;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FRflVe16On00+1DaqFpNLjtQUOuip+Xqpb96kuVda0I=;
 b=SKxV2cj/vhgK32k7p9XB+hpChs9bLAmty60aoJTyWmC/6eUfGYNgjS5U
 sTkpiXeCP55k5tyy6oDOWOFtbfwRszGdjRA4QdlrE80DESrvzLpkUtARn
 3AuAYxJ2ttDRGLYK1LkoCn72E93U268olIIzQi/s+YJqoJRfVKf/HDGrv
 1wJmVWAbcKBmB/Ie2KMb/YXa/BhkXFPTcYkNHjcTFK3TUi8sbxPE9+Th5
 3SCQJpuWlnaOc3tXntrmGCVJE78B6bhrLCxYFNb5kBvU5qDMW/6j2Kgsi
 0Z/+LUgwaq06DbzEvQHXg671JeruVDAUCfuptPBVS7bmG1hcuzbqK4pyu g==;
X-CSE-ConnectionGUID: OWWG+6n+S6K+G7pv4pF31w==
X-CSE-MsgGUID: BfUotcOBSCigca8gTAJ1ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20407617"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20407617"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:33:47 -0700
X-CSE-ConnectionGUID: WMcvAEc1Rbme2YucJeXXPg==
X-CSE-MsgGUID: cFBYC76HQwWDxPD5fVQMtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="54931976"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:33:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Xaver Hugl <xaver.hugl@gmail.com>, Mario Limonciello
 <mario.limonciello@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org, Simon Ser
 <contact@emersion.fr>, Harry Wentland <Harry.Wentland@amd.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@google.com>
Subject: Re: [PATCH v3 2/2] drm/amd: Add power_saving_policy drm property to
 eDP connectors
In-Reply-To: <CAFZQkGz8DeoiVX2MohoBoTMxraJk1Ou41N_wKP3GkqRrPg_6sg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240606020404.210989-1-mario.limonciello@amd.com>
 <20240606020404.210989-3-mario.limonciello@amd.com>
 <bc1d81ef-d9d0-4440-b63f-ecfb735ef783@amd.com>
 <d637d3c2-34f7-42f8-acbb-6a1730d3fc3c@amd.com>
 <CAFZQkGy0xuuUw73HQvS8Ce92sUi2rVrRnX25pi1KdNmyQbtBZA@mail.gmail.com>
 <CAFZQkGz8DeoiVX2MohoBoTMxraJk1Ou41N_wKP3GkqRrPg_6sg@mail.gmail.com>
Date: Thu, 01 Aug 2024 15:33:40 +0300
Message-ID: <87wml0v2vv.fsf@intel.com>
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

On Mon, 01 Jul 2024, Xaver Hugl <xaver.hugl@gmail.com> wrote:
> Am Do., 20. Juni 2024 um 22:22 Uhr schrieb Xaver Hugl <xaver.hugl@gmail.com>:
>> Merging can only happen once a real world userspace application has
>> implemented support for it. I'll try to do that sometime next week in
>> KWin
>
> Here's the promised implementation:
> https://invent.kde.org/plasma/kwin/-/merge_requests/6028

The requirement is that the userspace patches must be reviewed and ready
for merging into a suitable and canonical upstream project.

Are they?


BR,
Jani.


>
> In testing with the patches on top of kernel 6.9.6, setting the
> property to `Require color accuracy` makes the sysfs file correctly
> report "Device or resource busy" when trying to change the power
> saving level, but setting the property to zero doesn't really work.
> Once KWin sets the property to zero, changing the power saving level
> "works" but the screen blanks for a moment (might just be a single
> frame) and reading from the file returns zero again, with the visuals
> and backlight level unchanged as well.

-- 
Jani Nikula, Intel
