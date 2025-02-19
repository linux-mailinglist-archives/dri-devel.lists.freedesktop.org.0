Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4F5A3C888
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 20:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C3F10E87F;
	Wed, 19 Feb 2025 19:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AfWlH0Yy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9532410E890
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 19:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739993102; x=1771529102;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4xkjxsKSnDG+ejxVEfbphpK/6goWvTkMshFWpmtRGeA=;
 b=AfWlH0Yy/0ATkeCpT0QnDs32D9SEmgudTLtbdP2yPiELmcAMMu9rF/bf
 DZpm+oE/DFX8YoR7DSzX5dRI2ruXdr0vCR55loeE8+z/WtHH18J/ttOfU
 Qvjav+uZv3XPb1B3WI5qBHg91dA2yjbQw7SdPAilUYGFZ6wE2uPoQ2DK7
 zB4HPK8YNsgc1aj3do6Qip1sBP54SZgjN1ToRbbFFA4wKuExZQbPrawYj
 ZgsXiYiuFQT+rGoa9G38TcflyyKN7EyGJxlv14NYizZBT3rquSKG0K/jc
 zQrM/K/VbIO4gzG2kE+Mg+KUdWxMh0f+CrOekRSBDOdU6qkgscQwUHOqD A==;
X-CSE-ConnectionGUID: uxt+iBjbR1q2PIWZl2FDDQ==
X-CSE-MsgGUID: em8coL3EQEeCLT899Kflrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40604682"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="40604682"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 11:25:00 -0800
X-CSE-ConnectionGUID: sT6FCgk1RDag9ulyZnQRTg==
X-CSE-MsgGUID: v13zxD0XTXmGo28FPVA9pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="114791542"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.160])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 10:55:18 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jim Qu <Jim.Qu@amd.com>, Lukas Wunner <lukas@wunner.de>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Takashi Iwai
 <tiwai@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Su Hui
 <suhui@nfschina.com>
Subject: Re: [PATCH] vgaswitcheroo: Fix error checking in
 vga_switcheroo_register_audio_client()
In-Reply-To: <f608a3b5-320a-4194-bd03-cf08be04c317@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ae24cd32-1e78-4656-b983-051ed22d86b9@stanley.mountain>
 <87zfiim09n.fsf@intel.com>
 <f608a3b5-320a-4194-bd03-cf08be04c317@stanley.mountain>
Date: Wed, 19 Feb 2025 20:54:41 +0200
Message-ID: <87r03tn4su.fsf@intel.com>
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

On Wed, 19 Feb 2025, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> On Wed, Feb 19, 2025 at 05:17:56PM +0200, Jani Nikula wrote:
>> On Wed, 19 Feb 2025, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>> > The "id" variable is an enum and in this context it's treated as an
>> > unsigned int so the error handling can never trigger.
>> 
>> When would that be true with GCC?
>
> The C standard give compilers a lot of flexibility with regards to enums.

This I did know.

> But in terms of GCC/Clang then enums default to unsigned int, if you
> declare one as negative then they become signed int.  If they don't fit
> in int, then they become u64 etc.

But somehow I'd failed to appreciate GCC/Clang actually do use unsigned
and signed on a case by case basis. I thought they defaulted to signed
int. TIL.

And I still consider myself a rather experienced C coder. There must be
something wrong with either C or me. Or possibly both.


Thanks,
Jani.

>
> enum u32_values {
> 	zero,
> };
>
> enum s32_values {
> 	minus_one = -1,
> 	zero,
> };
>
> enum u64_values {
> 	big = 0xfffffffffUL;
> };
>
> regards,
> dan carpenter
>

-- 
Jani Nikula, Intel
