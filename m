Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458EE8A7E17
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 10:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC101132BE;
	Wed, 17 Apr 2024 08:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJnCgPOS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2804A1132BA;
 Wed, 17 Apr 2024 08:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713342124; x=1744878124;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ToIXFLsalA81kqrXe5Pngmqo3hSzK5CiSqKl/FIsk4s=;
 b=cJnCgPOSx8mG32IRRhYUqQaLw9thFc7AYGiiEr+g8wAAw+dkgVFOGlmw
 EK6zZXl/IW8wLD4gBji2Qe7jRfzmi2LGzOcAsfwD700p3P8yCBvpwhEqe
 Qtfqzb5EoaSdZrdauothCG0ZXuF04NvbB4Qq3TGlgwUr6r56SKsRoeC1g
 TpBE2PEDAP+4sbi5kkzrefydQDMZjwrjucN2YTHuIniynId+aanvIUZeK
 VtrOxra17Jx1Q0gpcVMf4MdGZcuNdCq75HQhLOuYVKPAN8NfUX+XI8Jmq
 IEU1jQdxWxclJWnt/ek0ke/t9KJDUPZ45gKr1fvoOlAU2d83PBjPHZw5w g==;
X-CSE-ConnectionGUID: c9sQ3xHVR5G41QrHGL0zNA==
X-CSE-MsgGUID: Wl1y3YC0QtOnp2pBMpWaCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="31303045"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="31303045"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 01:22:03 -0700
X-CSE-ConnectionGUID: 69GeIadEQBW73U1TI1YO6Q==
X-CSE-MsgGUID: rmCNWOpPSTSf54qTXkhwxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="22418633"
Received: from vpus-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.45.164])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 01:22:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [REBASE 7/7] drm/edid: make drm_edid_are_equal() more
 convenient for its single user
In-Reply-To: <deb7918d-03dd-49f4-8a5d-3470ed05800e@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1713259151.git.jani.nikula@intel.com>
 <1011a285d30babce3aabd8218abb7ece7dcf58a2.1713259151.git.jani.nikula@intel.com>
 <a2e36f83-0e5c-4a57-bf31-37665f8ece71@suse.de> <87h6g1ze42.fsf@intel.com>
 <deb7918d-03dd-49f4-8a5d-3470ed05800e@suse.de>
Date: Wed, 17 Apr 2024 11:21:58 +0300
Message-ID: <878r1cz9eh.fsf@intel.com>
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

On Tue, 16 Apr 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 16.04.24 um 14:27 schrieb Jani Nikula:
>> On Tue, 16 Apr 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> Hi
>>>
>>> Am 16.04.24 um 11:20 schrieb Jani Nikula:
>>>> Repurpose drm_edid_are_equal() to be more helpful for its single user,
>>>> and rename drm_edid_eq(). Functionally deduce the length from the blob
>>>> size, not the blob data, making it more robust against any errors.
>>> Could be squashed into patch 6.
>> Ack.
>>
>> Thanks for the review. I'll hold of on resending these until there are
>> some R-b's... I've send them a few times already with no comments. :(
>
> Feel free to add
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> to the series.

Many thanks! Just to double check, do you want me to move patch 5
earlier and squash patches 6&7?

BR,
Jani.


-- 
Jani Nikula, Intel
