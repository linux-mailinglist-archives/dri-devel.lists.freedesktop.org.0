Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493BAA80CB7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 15:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A1110E6A9;
	Tue,  8 Apr 2025 13:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kBzA5GCO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72D110E6A9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 13:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744119883; x=1775655883;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lX0pIzOE6xn7y8oUMpUCvkkt3P0Jc65RairfyqZv//Y=;
 b=kBzA5GCODSaQC5D/eUaUhYAuj8Abtm9WJGkWKMQFQeCwbP/qWhAD6Pl0
 W5vPUEbxCHbI3zRbhkwvC97nK+lWXnYsSw2SBEzGVy3yACGQHubunW/dL
 cEN0zRa7BcVEWuncL0d6XuxZFO607FCuWkRrY+rNMb1B8+9qqK0lMPqGL
 /rhzBEMhwvez0zJvCcQ8FCFYuk1f1DEmnk6lXLF6Hs1N4xoFp5lsIXJgx
 D/5JN6LD4PZEE+t8hGDp7DTAAAU+ckaSbcHMcbdlaL4bQOMuX8X8BjNDC
 HmWUktbGod1ZXgv+LF94yrC2vua6BH7vRBuxi2ZfE/b5uGVMO16G6p3Dg A==;
X-CSE-ConnectionGUID: DG7K+K8PReWhDJOIrst0Ow==
X-CSE-MsgGUID: abSeyeOeQ6Cckd+0yvVWtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49397305"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="49397305"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 06:44:43 -0700
X-CSE-ConnectionGUID: BNm7oigUQIS10VdWuwGFYQ==
X-CSE-MsgGUID: 1KHuuWiuQw6k4jCTg/M+Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128005936"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.121.109])
 ([10.245.121.109])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 06:44:41 -0700
Message-ID: <3a22799a-bb02-4d79-b2e0-40f88a222b96@linux.intel.com>
Date: Tue, 8 Apr 2025 15:44:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Flush pending jobs of device's workqueues
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com, lizhi.hou@amd.com
References: <20250401155755.4049156-1-maciej.falkowski@linux.intel.com>
 <d1c263de-bece-44f1-bfb0-c5f00404abe4@oss.qualcomm.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <d1c263de-bece-44f1-bfb0-c5f00404abe4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 4/4/2025 5:00 PM, Jeff Hugo wrote:

> On 4/1/2025 9:57 AM, Maciej Falkowski wrote:
>> Use flush_work() instead of cancel_work_sync() for driver
>> workqueues to guarantee that remaining pending work
>> will be handled.
>>
>> Fixes: bc3e5f48b7ee ("accel/ivpu: Use workqueue for IRQ handling")
>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> The fixes tag suggests that this is a bug fix, but the commit text 
> doesn't really tell me why cancel_work_sync() is bad.  Does it leave 
> the driver in some incomplete state that prevents later recovery?
>
> Put another way, "why is it necessary for the pending work to be 
> handled?" appears unanswered.

You are right, thank you for pointing this out. FYI I will include the 
following explanation in the patch message:

This will resolve two issues that were encountered where a driver was 
left in an incomplete state as the bottom-half was canceled:
a) Cancelling context-abort of a job that is still executing and is 
causing translation faults which is going to cause additional TDRs,
b) Cancelling bottom-half of a DCT (duty-cycle throttling) request which 
will cause a device to not be adjusted to an external frequency request.

Best regards,
Maciej

>
> With that
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
