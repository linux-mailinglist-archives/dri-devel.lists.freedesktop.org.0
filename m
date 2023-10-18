Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5207CDE3D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 16:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8787B10E0ED;
	Wed, 18 Oct 2023 14:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D7510E090;
 Wed, 18 Oct 2023 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697637845; x=1729173845;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=f4Zq33cofTRUoDj4rxlYFHVD2+ecpwiue6b3v8VzX9o=;
 b=MctV8Ha63bLcqQ0d9O5BsIKk3HToL9vjzNrvdRQ30OiaAwzqRIjOikbf
 khmBueXDmr2CiX+q7cFLdEr8Ba/hN9UKzXGNPl9+tlSt4u6ipEvSXQ/UG
 tTtc6TYfB5BBLmtZKGeJ+QlYxOi/bWOM+dAK/Mhi7nRp5fxvpS1bygOH2
 0EVlgdJChK/aJ8T3MrwKSrQamL2dZ6J48UBaOmHvF2UqirFjmzyZWkkvr
 WHAqUEKRhfQavhSDIRYZOwstL0JrXj5Gg3dxognwRLqi4cPGUKEu/eXrz
 jY8fndrPQa7GVJT6vBRLIFEL57eghFS+wav3ESQiKlKrPfTDjcUd++LmP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="384898156"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="384898156"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 07:04:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="847278877"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="847278877"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.39.1])
 ([10.249.39.1])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 07:04:02 -0700
Message-ID: <3887c6f2-687e-01d0-71c9-b2354a0df9c7@linux.intel.com>
Date: Wed, 18 Oct 2023 16:04:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] drm/i915: Flush WC GGTT only on required platforms
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231018093815.1349-1-nirmoy.das@intel.com>
 <ZS/GZ0U7rOuuD0Kw@ashyti-mobl2.lan>
 <36c0e644-4013-f2f8-a0a7-9b9c3d8423c9@linux.intel.com>
 <ZS/W6obrW/g8WuS4@ashyti-mobl2.lan>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZS/W6obrW/g8WuS4@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <john.c.harrison@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/18/2023 3:00 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
>>>> gen8_ggtt_invalidate() is only needed for limited set of platforms
>>>> where GGTT is mapped as WC. This was added as way to fix WC based GGTT in
>>>> commit 0f9b91c754b7 ("drm/i915: flush system agent TLBs on SNB") and
>>>> there are no reference in HW docs that forces us to use this on non-WC
>>>> backed GGTT.
>>>>
>>>> This can also cause unwanted side-effects on XE_HP platforms where
>>>> GFX_FLSH_CNTL_GEN6 is not valid anymore.
>>>>
>>>> v2: Add a func to detect wc ggtt detection (Ville)
>>>> v3: Improve commit log and add reference commit (Daniel)
>>>>
>>>> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
>>> I'm wondering if this is the right Fixes, though. Should this
>>> rather be:
>>>
>>> Fixes: 6266992cf105 ("drm/i915/gt: remove GRAPHICS_VER == 10")
>> Hard to find a real Fixes for this. I just want to backport this to dg2
>> where we can have unwanted side-effects.
> yes, this piece of code has moved around enough so to make it
> diffuclt to track its origin.
>
> I think the one I found should be the correct one,

That just removes a graphics ver, not related to WC GGTT map or XE_HP.

>   but the dg2
> force probe removeal can also become a placeholder for DG2 fixes.

Yes, I have no better ideas too.


Regards,

Nirmoy

>
> I won't complain.
>
> Andi
