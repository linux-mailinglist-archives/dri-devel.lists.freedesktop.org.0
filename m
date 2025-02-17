Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E866A38792
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 16:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D2F10E276;
	Mon, 17 Feb 2025 15:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="boq/7wfc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9719C10E276
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739806402; x=1771342402;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=k9SCS8Kz65XUmTmIZbWJDltV3+VwU09wE7wIQTHhmjA=;
 b=boq/7wfcxLxvMiR/sgV/pN2HjluMxN2JG0OszJVb7cHfhEEUagK9oPfF
 ZPEinRCJQFaNR1N9MModUleYGCjAh1FAXAVFo618s+nyEsQkzXYPgpn0i
 Dn2Gv/I3IK0l/o6cp0YIh9PreSgyGOStWek0NwWPa+57f/FTxHbYrv4t2
 vlLavQ8rVJDJD8A11UAWC3yymiXuis6URGpCJ8PiDkIw7qkjCy3z1se/I
 pd10KqpIrrehpvkIBCAAz2lGM8U5zWNTD7RFnzxyId3GCGLmjBz5xK2Fs
 gTEb0DCCDg12RYZtgbIkd29UwZmAHgOCR8vOZbAGxQcbdHLqrKGU+76ry g==;
X-CSE-ConnectionGUID: q1SY9fwmSyuETCd7gSuOVA==
X-CSE-MsgGUID: xucVxQxwRauXMEmaHl3CyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="28089870"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="28089870"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 07:33:22 -0800
X-CSE-ConnectionGUID: HHCNZ0zxTHacogilju+K8w==
X-CSE-MsgGUID: NZFVlDVRT7GyHk67Wah1nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="119071148"
Received: from anishsin-mobl1.ger.corp.intel.com (HELO [10.245.114.74])
 ([10.245.114.74])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 07:33:20 -0800
Message-ID: <437dd773-2372-46e7-bb56-6200ec054074@linux.intel.com>
Date: Mon, 17 Feb 2025 16:33:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] accel/ivpu: Prevent runtime suspend during context
 abort work
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
 <20250204084622.2422544-3-jacek.lawrynowicz@linux.intel.com>
 <794746b9-6b17-df7c-24a4-abde7701d041@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <794746b9-6b17-df7c-24a4-abde7701d041@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/14/2025 5:49 PM, Jeffrey Hugo wrote:
> On 2/4/2025 1:46 AM, Jacek Lawrynowicz wrote:
>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>
>> Increment the runtime PM counter when entering
>> ivpu_context_abort_work_fn() to prevent the device
>> from suspending while the function is executing.
> 
> Why should suspend be prevented during the abort fn?

ivpu_context_abort_work_fn() executes a pair of reset/resume engine IPC commands that always have to be paired.
Suspend/resume between them cases related FW state to be lost and resume engine then fails.

Jacek
