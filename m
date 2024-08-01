Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA39944BCC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 14:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5C910E23B;
	Thu,  1 Aug 2024 12:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S350bHDL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286C210E159;
 Thu,  1 Aug 2024 12:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722517002; x=1754053002;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cCXdHEpMz9c2bBq26e32ONp/13OtXkPy15MjuY9WCkY=;
 b=S350bHDLCALibHu806Ki72S3tMPy9uH9x0sR5jJs1bUAoIkdbfIuIKaD
 JhZt1D2CMwk7Krydhc8jFnyW4VxgiSKXc93TUsrw2VxJn30HgJeyUypVT
 n+5Nj/VxGxfNbRlRNum+Ej6X6aaRdeLAma3+Ov/cmqXIcO7Q3M6KKVERk
 IoDwkL+CuxANL9FBIzdfwvO4+t/6+PK6L0s4CZzdQrYmH8eTUZ2ID7pV8
 vEozyNKxFMSpNvFMpVlOru7wgn2Cs7vGcNPrIUBGBiItAERffSoGnF48p
 GPz524CaawXrhdg+vtSUOK83tepVVq9ZVtzGY3r9QZAD5hA59ZJn/oq12 g==;
X-CSE-ConnectionGUID: aTc+9iRDTJ2i46att0oLHA==
X-CSE-MsgGUID: VPMsPkPNQyOYFflPwi5YUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20587016"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20587016"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:56:28 -0700
X-CSE-ConnectionGUID: g/fx4tHuQmCjbMW5J9x36A==
X-CSE-MsgGUID: fy/vpjVBR5ybMhSyxQ4pqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="92554780"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:56:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Xaver Hugl
 <xaver.hugl@gmail.com>, Mario Limonciello <mario.limonciello@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org, Simon Ser
 <contact@emersion.fr>, Harry Wentland <Harry.Wentland@amd.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@google.com>
Subject: Re: [PATCH v3 2/2] drm/amd: Add power_saving_policy drm property to
 eDP connectors
In-Reply-To: <d302cdd3-acb5-4043-8f36-7c3e02e77eeb@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240606020404.210989-1-mario.limonciello@amd.com>
 <20240606020404.210989-3-mario.limonciello@amd.com>
 <bc1d81ef-d9d0-4440-b63f-ecfb735ef783@amd.com>
 <d637d3c2-34f7-42f8-acbb-6a1730d3fc3c@amd.com>
 <CAFZQkGy0xuuUw73HQvS8Ce92sUi2rVrRnX25pi1KdNmyQbtBZA@mail.gmail.com>
 <CAFZQkGz8DeoiVX2MohoBoTMxraJk1Ou41N_wKP3GkqRrPg_6sg@mail.gmail.com>
 <87wml0v2vv.fsf@intel.com> <d302cdd3-acb5-4043-8f36-7c3e02e77eeb@suse.de>
Date: Thu, 01 Aug 2024 15:56:21 +0300
Message-ID: <87r0b8v1u2.fsf@intel.com>
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

On Thu, 01 Aug 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 01.08.24 um 14:33 schrieb Jani Nikula:
>> On Mon, 01 Jul 2024, Xaver Hugl <xaver.hugl@gmail.com> wrote:
>>> Am Do., 20. Juni 2024 um 22:22 Uhr schrieb Xaver Hugl <xaver.hugl@gmail.com>:
>>>> Merging can only happen once a real world userspace application has
>>>> implemented support for it. I'll try to do that sometime next week in
>>>> KWin
>>> Here's the promised implementation:
>>> https://invent.kde.org/plasma/kwin/-/merge_requests/6028
>> The requirement is that the userspace patches must be reviewed and ready
>> for merging into a suitable and canonical upstream project.
>>
>> Are they?
>
> I already saw this series in today's PR for drm-misc-next. :/

Exactly what triggered the question!

BR,
Jani.


>
> Best regards
> Thomas
>
>>
>>
>> BR,
>> Jani.
>>
>>
>>> In testing with the patches on top of kernel 6.9.6, setting the
>>> property to `Require color accuracy` makes the sysfs file correctly
>>> report "Device or resource busy" when trying to change the power
>>> saving level, but setting the property to zero doesn't really work.
>>> Once KWin sets the property to zero, changing the power saving level
>>> "works" but the screen blanks for a moment (might just be a single
>>> frame) and reading from the file returns zero again, with the visuals
>>> and backlight level unchanged as well.

-- 
Jani Nikula, Intel
