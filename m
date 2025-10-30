Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDC3C1F2C9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 10:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6DA10E117;
	Thu, 30 Oct 2025 09:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihoKHaKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1151510E117
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761815073; x=1793351073;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mABODOVNJ0ZDCnvCpf8ik8ymUdAkafpyo15sjath2WM=;
 b=ihoKHaKVhmDdeaiFbOsT0yDKeI3R/8/09oOGyXfiG4uE2f5sxWHh/9Xu
 FTVsgtaC4fAHqCxPYZIHrmuy5KDSkOyWrEAfw1A+MHNbj75+Ti03Lfdks
 PEwhaF61TCH7vsj0j1QTPhTklceVrG2jZ2AII85Vg6ptsz1LAUji+AWZy
 cGwoH9vXhmHNIMsFeen8O32b3JMZY7egDMgwNKm8/zE9RzOgUdbN2d5dV
 j68qg5cMGeyZI1A27JgMDv0KMXsq7umjvfBcKj85crvfRqTopB+kaq0ao
 yf6wd0E1d5R6wu2JlRw9Cgqoy4Cy9uhm1ijZPtKcGpTULRJ/6BU3n7Z/k A==;
X-CSE-ConnectionGUID: emh2kpFARoCt/XNwu3nndQ==
X-CSE-MsgGUID: 6GZfesTnQyq6YUOqsbfLhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63983207"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="63983207"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 02:04:33 -0700
X-CSE-ConnectionGUID: BmQKZY1nRECXL3yqD6l8Rg==
X-CSE-MsgGUID: YHKfPZhITNmUtqSVsiySoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="190235897"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.246.16.226])
 ([10.246.16.226])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 02:04:31 -0700
Message-ID: <ed574e3c-61d8-4dfd-81f2-5a7fc00df224@linux.intel.com>
Date: Thu, 30 Oct 2025 10:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Wait for CDYN de-assertion during power down
 sequence
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com
References: <20251028070642.135166-1-karol.wachowski@linux.intel.com>
 <dd579486-efbf-41a4-8523-a804c8f7e68f@oss.qualcomm.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <dd579486-efbf-41a4-8523-a804c8f7e68f@oss.qualcomm.com>
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

On 10/29/2025 4:47 PM, Jeff Hugo wrote:
> On 10/28/2025 1:06 AM, Karol Wachowski wrote:
>> During power down, pending DVFS operations may still be in progress
>> when the NPU reset is asserted after CDYN=0 is set. Since the READY
>> bit may already be deasserted at this point, checking only the READY
>> bit is insufficient to ensure all transactions have completed.
>>
>> Add an explicit check for CDYN de-assertion after the READY bit check
>> to guarantee no outstanding transactions remain before proceeding.
>
> Is it worthwhile to mention what can break if transactions are pending
> while we proceed? Is there something that the user will see?
>
> I'm guessing that proceeding with active transactions is bad, but its
> unclear to me if this is just a best practice, or actually fixes some
> kind of issue that will actually impact the user.  If there is actual
> user impact that this addresses, should we consider a fixes tag?
>
> -Jeff 
Hi
Jeff,                                                                                                                                           

This is primarily a best practice to avoid potential issues on NPU6,
where pending transactions can cause issues with power down transition. 
While it doesn't fix user-visible bugs on existing platforms, it ensures
unified power down sequence across all platforms that support this
register, making the code clearer than conditional handling just for NPU6.

You're right about the Fixes tag, since NPU6 support is already
upstream, I'll add one.

-Karol
