Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7489AC2C504
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 15:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6255110E1F2;
	Mon,  3 Nov 2025 14:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PjvqzKPy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A698A10E1F2
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 14:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762178682; x=1793714682;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=G6pAeAlCKuNq2xblYKDHz5nUlrK8DDpUghsD7UXGCVM=;
 b=PjvqzKPyxeH+CkiYs+hDyuA3J0W9Uhc6tFGsCJpU7EaORguD1CK59+0D
 BEbsgHQ8mkSS1/o5l3hKzLOvVJhb6QiqrF/5l5DWqa9hwEDE6rWYDI0Uh
 IiojuKXEkaRpIrKT27OW154kkWS3H8IuZM7/4Jn0kAgQtMV0Vn6elNhoi
 WkopVFAtjFBSCdzHHfuM9qDWLRNxEZ0wQlREC6N1oWghjMcLoqz9H5NWe
 7w72ZkQZtia0yfzwppSiiw6QS5Tq+YChKnnaEA0JzBy7ubKUd1B6OKQy0
 9WBMKvVd7i7+rRdcseXqBVzGE7I1SMV8GmEOn6gtOfJUcKMd3Kffke8gz Q==;
X-CSE-ConnectionGUID: 8tuxlkVJT4WUMS4NjLOBWg==
X-CSE-MsgGUID: jYv6cBIlRhir8HsuCZ2xpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74544141"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="74544141"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 06:04:42 -0800
X-CSE-ConnectionGUID: IdxUDLxfTu6OGtciIlC2ng==
X-CSE-MsgGUID: Mgaue0q4SVOg2cY+//E6Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="217696708"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.127])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 06:04:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 0/2] drm: fix fallout from drm_print.h include cleanups
In-Reply-To: <f2df4aa4-6c80-4f76-9539-47800b5166d9@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1762161597.git.jani.nikula@intel.com>
 <f2df4aa4-6c80-4f76-9539-47800b5166d9@suse.de>
Date: Mon, 03 Nov 2025 16:04:36 +0200
Message-ID: <6fa3e821fdab9ecc83c1ef1241be71c3e10cf37e@intel.com>
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

On Mon, 03 Nov 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 03.11.25 um 10:22 schrieb Jani Nikula:
>> Fix some (I guess inevitable) fallout from the drm_print.h cleanups.
>>
>> Note: I'm setting Fixes: f6e8dc9edf96 ("drm: include drm_print.h where
>> needed") instead of the ones removing drm_print.h includes, because that
>> was the one that was supposed to have them all.
>>
>> Jani Nikula (2):
>>    drm/renesas: include drm_print.h where needed
>>    drm/rockchip: include drm_print.h where needed
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> for the series.

Thanks, pushed to drm-misc-next.

BR,
Jani.

>
>>
>>   drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 1 +
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 1 +
>>   2 files changed, 2 insertions(+)
>>

-- 
Jani Nikula, Intel
