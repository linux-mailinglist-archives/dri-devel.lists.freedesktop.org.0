Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CD27CDB1A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 13:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D40810E0BD;
	Wed, 18 Oct 2023 11:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E4610E067;
 Wed, 18 Oct 2023 11:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697630298; x=1729166298;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EXS+cAUV3j0Z4MHXUwmccjUAF194E0f0gwrqg/vbUXQ=;
 b=YMbnJnxtZ+pv8rsviXRYc3L6ydbh9DSaipfgZ5U36ib1Dm14mWlnX6VB
 tNDACIKFw0qyowY0N7an6AdHq1VSBL96MiRTLeqMIA9NxeduWbStjsPiR
 wUJm+Wh2b+8SbADtdnyCFZrIZ4AEQ/tq9Dl1TtvzT/MIKKSVxpuuhS32o
 HheoGwVLsyRo57qPp2oaNxYWGypUZtgq9p7Q62fldt3iGD81IYVgtCk34
 BSAcRrFHKSCeX1Zbe3zHvBtXXqC27SBF6NPnyzFnuYYh1uHrlGpHij0ko
 b+ycgiQ2NZiyzL7QFzYPJhBmdOYtXWopDEaUVqjsoIckRgmyZkdjyL//c g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="388860107"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="388860107"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 04:58:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="4355928"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.39.1])
 ([10.249.39.1])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 04:57:08 -0700
Message-ID: <36c0e644-4013-f2f8-a0a7-9b9c3d8423c9@linux.intel.com>
Date: Wed, 18 Oct 2023 13:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] drm/i915: Flush WC GGTT only on required platforms
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20231018093815.1349-1-nirmoy.das@intel.com>
 <ZS/GZ0U7rOuuD0Kw@ashyti-mobl2.lan>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZS/GZ0U7rOuuD0Kw@ashyti-mobl2.lan>
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
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

On 10/18/2023 1:49 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Wed, Oct 18, 2023 at 11:38:15AM +0200, Nirmoy Das wrote:
>> gen8_ggtt_invalidate() is only needed for limited set of platforms
>> where GGTT is mapped as WC. This was added as way to fix WC based GGTT in
>> commit 0f9b91c754b7 ("drm/i915: flush system agent TLBs on SNB") and
>> there are no reference in HW docs that forces us to use this on non-WC
>> backed GGTT.
>>
>> This can also cause unwanted side-effects on XE_HP platforms where
>> GFX_FLSH_CNTL_GEN6 is not valid anymore.
>>
>> v2: Add a func to detect wc ggtt detection (Ville)
>> v3: Improve commit log and add reference commit (Daniel)
>>
>> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> I'm wondering if this is the right Fixes, though. Should this
> rather be:
>
> Fixes: 6266992cf105 ("drm/i915/gt: remove GRAPHICS_VER == 10")

Hard to find a real Fixes for this. I just want to backport this to dg2 
where we can have unwanted side-effects.


Regards,

Nirmoy

>
> ?
>
> Andi
