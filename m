Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 664487B044E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 14:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A001910E502;
	Wed, 27 Sep 2023 12:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7757A89C49;
 Wed, 27 Sep 2023 12:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695818214; x=1727354214;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Uo7hle6LXvvQm7sx6789nbDNPwvrJxdQtILA5XBEL8A=;
 b=a+PEAVvmHB11/kOyBZ51v48SIvdFkvPGEmmSJLt+wIC/JR22rtB4+xtG
 lxbfSBoLC+9Z7iywmrgjQPNuuOSc4FZosZLAR1DKHmoSZLdk0uFUD9fse
 YulGyGnpgCCBYyI1CQYkiNKCH1ziUbesc2nlDaZqzcEmjUiwHdrwkeF9H
 osRgbRGWKDzHbibrxUOyQl2qHfY9VO8dggSZg9q6Gs7TCiN4TMEp/vFeL
 wRtSd/afm8byQpNskUN/0C3G8BxkSw2GT0eb46aWEsSRV7/uu5UJdt2JU
 I8BJ6qtpKBwbJL8oJvH8IXRG2WuqdzReXF33+aytQdl6zaXbZJNGYXv6q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372156668"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="372156668"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:36:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892585076"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="892585076"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.53.87])
 ([10.252.53.87])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:35:44 -0700
Message-ID: <e410789d-869d-41d0-5187-1c1647fc4be6@linux.intel.com>
Date: Wed, 27 Sep 2023 14:36:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] drm/i915: Introduce intel_gt_mcr_lock_reset()
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20230927102237.30773-1-nirmoy.das@intel.com>
 <ZRQT+OcS5v2yB5jx@ashyti-mobl2.lan>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZRQT+OcS5v2yB5jx@ashyti-mobl2.lan>
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

On 9/27/2023 1:37 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
> [...]
>
>> +void intel_gt_mcr_lock_reset(struct intel_gt *gt)
>> +{
>> +	unsigned long __flags;
>> +
>> +	lockdep_assert_not_held(&gt->uncore->lock);
>> +
>> +	spin_lock_irqsave(&gt->mcr_lock, __flags);
>> +
>> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
>> +		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
>> +
>> +	spin_unlock_irqrestore(&gt->mcr_lock, __flags);
> As we discussed offline, I don't think spinlocks are needed here.
> I don't expect the gt to be holding the lock somewhere else.

I can add a assert but I think it make sense to have the lock just to be 
100% safe ?


Regards,

Nirmoy

>
> Andi
>
>> +}
