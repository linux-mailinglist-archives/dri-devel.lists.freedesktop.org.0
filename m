Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A03357E9B33
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028F610E34F;
	Mon, 13 Nov 2023 11:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AA010E34F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 11:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699874907; x=1731410907;
 h=message-id:date:mime-version:from:subject:to:references:
 in-reply-to:content-transfer-encoding;
 bh=3LDsJmnrx8nVkWKua6V7G3FPbgcBShEfF0bdX9hlfPw=;
 b=CmC2yipajg4MVshOtyoxOzud7pwULgkiQybKHfCilw62uwZvQ/j7kIHC
 RUX1jPzOoekBRi0ruQmwmNJmw1Ormrn6vkQzr81bOCpICSmIfwTHk0kW8
 O4MiaHw2OtLw40y72YHXb8LLbOLWSFXJgMmKbvP2jDVLwn5VTi+1orgxJ
 cTjyGK/Y6mHvubL5W/RjQpdk8HzeWlrr3zIazE59COihwnsYSp3bE4zNN
 lisA+rvrpTmNOrs7x7v4pXdWMo1TzM6aHG+mTMnYAYFDAS3DPvieb7vbh
 jgV3GZOE0a1VAyp9ePz85Sh+QWD0ZQIQqGlGWSDriaJ93ZnekxELenNaQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="394317740"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="394317740"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 03:28:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="854939603"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="854939603"
Received: from unknown (HELO [10.217.160.78]) ([10.217.160.78])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 03:28:26 -0800
Message-ID: <6e8ff67c-bc85-46f5-b891-f91524f04cfa@linux.intel.com>
Date: Mon, 13 Nov 2023 12:28:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: Re: [PATCH 4/5] accel/ivpu: Use dedicated work for job timeout
 detection
To: dri-devel@lists.freedesktop.org
References: <20231107123514.2218850-1-jacek.lawrynowicz@linux.intel.com>
 <20231107123514.2218850-5-jacek.lawrynowicz@linux.intel.com>
 <d9ab8eba-51d0-4126-12f4-27b5dd717276@quicinc.com>
Content-Language: en-US
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <d9ab8eba-51d0-4126-12f4-27b5dd717276@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

On 10.11.2023 05:35, Jeffrey Hugo wrote:
> On 11/7/2023 5:35 AM, Jacek Lawrynowicz wrote:
>> From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>>
>> Change to use work for timeout detection. Needed for thread_irq
>> conversion.
>>
>> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> 
> Missing SOB.

Yeah, I've missed it. I will add SOB to the whole patchset in v2.

>>     void ivpu_pm_cancel_recovery(struct ivpu_device *vdev)
>>   {
>> +    drm_WARN_ON(&vdev->drm, delayed_work_pending(&vdev->pm->job_timeout_work));
> 
> This seems odd.  Looks like this function is only called from the dev_fini.  It's a non-fatal error to tear down the device (hotplug? fatal error?) if a job is pending?
This check is used to detect driver bug where recovery is started just after ivpu_pm_cancel_recovery() was called (job_timeout_work schedules recovery_work).
Jobs should all be done/cancelled at this stage. It is more an assert()-like thing then an error that should be reported to the user. 

Regards,
Jacek
