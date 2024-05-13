Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCC28C3ECB
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 12:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EB510E576;
	Mon, 13 May 2024 10:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWKlOwnG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC3110E576
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 10:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715595773; x=1747131773;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BR323XSRREkXE4NxAw14TASzLK8c1FyjewU3K/BgDGA=;
 b=PWKlOwnGNcpo2OY7c+LCYGmgrYBUaSJPSMc0nwWxh3/6C63Sfw5p8fZb
 hA/EqHR1pQhMAHGNqowMENXkU3o9vbgIGhn5BMzU3KjBrJZTo+2hh4KXp
 JNh2fpnLvbsWr2Hoocir1WZSIdtj0aoCCtO7yF9zxlzhjMSuVW4mT5u3w
 0tdaQ3VMhEMUvXxJWXpG7zLkIhMkdH/u19aSipdMuByyT9AsonLSg3tK4
 SQhONYwKqdRUFkMhmrkl9cOGGrvKXBYmhP/QO2P7K+muxZFs+RKGJw6bR
 4/nDeTuLhDH73SQAP1fu9BEtA2Pfl0Dw5empSGrTYU6oQgAeiyBlEvHe6 w==;
X-CSE-ConnectionGUID: z+rkz3YdRRqeRFnHXgxjCQ==
X-CSE-MsgGUID: XsNJhke1SSmnL1Uui2VHOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22122357"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22122357"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:22:52 -0700
X-CSE-ConnectionGUID: F+/WUeZ0R0u2GwHAt31SwA==
X-CSE-MsgGUID: OqWbd0BgRrqNhw/x6fnAjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30249380"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.246.3.118])
 ([10.246.3.118])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:22:47 -0700
Message-ID: <dbd2e32c-a75e-4d8a-9653-6f23cc494924@linux.intel.com>
Date: Mon, 13 May 2024 12:22:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] accel/ivpu: Share NPU busy time in sysfs
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
 <20240508132931.2388996-1-jacek.lawrynowicz@linux.intel.com>
 <aad0fac7-279a-0b40-569e-73acf8b77db2@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <aad0fac7-279a-0b40-569e-73acf8b77db2@quicinc.com>
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

On 10.05.2024 18:55, Jeffrey Hugo wrote:
> On 5/8/2024 7:29 AM, Jacek Lawrynowicz wrote:
>> From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
>>
>> The driver tracks the time spent by NPU executing jobs
>> and shares it through sysfs `npu_busy_time_us` file.
>> It can be then used by user space applications to monitor device
>> utilization.
>>
>> NPU is considered 'busy' starting with a first job submitted
>> to firmware and ending when there is no more jobs pending/executing.
>>
>> Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> This feels like something that would normally be handled by perf. Why not use that mechanism?

Yeah, probably but we had several request to provide easy to use interface for this metric that
could be integrated in various user space apps/tools that do not use ftrace.

