Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37D7828646
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 13:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7962A10E19A;
	Tue,  9 Jan 2024 12:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5618710E19A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 12:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704804666; x=1736340666;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NJ1Kjt4oVGmddjGzTpkyMq2lV27bWd76c6H+FpYySgw=;
 b=jGomGryVxQ+qbriiP1ZO0C4B5DH7syUgJHLzHNwH8tUW6k7G8cQZAoEr
 JaidEofNrlYemxIlaZQFHmdK5ZFrjdzPqGZrO3vyf5mf2Hwj2V8fMLljp
 BPwNNm8DcwQGwFdnNFTGp/lO4CejLRRlF0IWAhs6rvZIJeRe3PsgfB103
 aZO5GD5w+O7oSt+YMhWf+wtI1RsZkAeKr3PGdHViQHHEDS9mUzhw9Mplx
 reDibHKaSOwcyO5oB0VHJxl0B6TdcmcBaNP7ngJN6xgl/aykdlDe0jXQI
 B5mNAaHNCLLt3yWTsSHFZ0bLHWA/s/lZCDHqolmhTNOGtb7cOx2+LWaxi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11672658"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="11672658"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 04:51:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="872232054"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="872232054"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.217.160.86])
 ([10.217.160.86])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 04:50:44 -0800
Message-ID: <55a27434-7de7-41af-a86f-4991e51de2c4@linux.intel.com>
Date: Tue, 9 Jan 2024 13:50:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] accel/ivpu: Add debug prints for MMU map/unmap
 operations
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
 <20240105112218.351265-4-jacek.lawrynowicz@linux.intel.com>
 <c1817603-e789-35e6-d1f0-ae243f71af24@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <c1817603-e789-35e6-d1f0-ae243f71af24@quicinc.com>
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
Cc: "Wachowski, Karol" <karol.wachowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05.01.2024 16:32, Jeffrey Hugo wrote:
> On 1/5/2024 4:22 AM, Jacek Lawrynowicz wrote:
>> From: "Wachowski, Karol" <karol.wachowski@intel.com>
>>
>> It is common need to be able to  see IOVA/physical to VPU addresses
> 
> Errant double space between "to" and "see"

Sure

>> mappings. Especially when debugging different kind of memory related
>> issues. Lack of such logs forces user to modify and recompile KMD manually.
>>
>> This commit adds those logs under MMU debug mask which can be turned on
>> dynamically with module param during KMD load.
> As far as I understand, the preference is to not expose any kind of raw addresses as it is seen as a security issue, and usually the addresses don't have any real value to someone reading logs, etc.  I beleive I picked this up from GregKH.
> 
> However, this commit text suggests there is value, and I see that one needs to be root to enable this which could probably be considered a sufficent gate to avoiding the data getting into the wrong hands.
> 
> Is it possible to provide more details as a justification for this? Perhaps an example of a past issue where this data was necessary for debug?

There were multiple occasions were these messages were useful:
  - Debugging IOMMU issues on pre-production hardware
  - Enabling DevTLB cache on a functional simulator
  - Debugging performance issues with fragmented buffers

There is always some security tradeoff when enabling debug features but in this case it seems to be worth it.


