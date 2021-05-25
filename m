Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F14A838FF4A
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 12:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA22E6E9ED;
	Tue, 25 May 2021 10:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB586E9EC;
 Tue, 25 May 2021 10:32:31 +0000 (UTC)
IronPort-SDR: dj7L1qsjNBFNc9rlgS/oMf10aVd/S7jK8W297GTR89/UGTyZ76JMA3kcTu5efaGi8WGy1HaNPd
 j4srPS6poSDw==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="266054214"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="266054214"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 03:32:30 -0700
IronPort-SDR: dljw8lQu8hm3WLXTxXlwGNJAsyrMPJHRhpqL0McpjP9zAvSzxidKXg4AUrIwHFpykKYb2Bg0x5
 9hfGW0XRik+Q==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="442485669"
Received: from tomeara-mobl.ger.corp.intel.com (HELO [10.213.211.66])
 ([10.213.211.66])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 03:32:29 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 00/97] Basic GuC submission support in the
 i915
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210506191451.77768-1-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <de3965d8-d997-5685-0399-646d8823a27f@linux.intel.com>
Date: Tue, 25 May 2021 11:32:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/05/2021 20:13, Matthew Brost wrote:
> Basic GuC submission support. This is the first bullet point in the
> upstreaming plan covered in the following RFC [1].
> 
> At a very high level the GuC is a piece of firmware which sits between
> the i915 and the GPU. It offloads some of the scheduling of contexts
> from the i915 and programs the GPU to submit contexts. The i915
> communicates with the GuC and the GuC communicates with the GPU.
> 
> GuC submission will be disabled by default on all current upstream
> platforms behind a module parameter - enable_guc. A value of 3 will
> enable submission and HuC loading via the GuC. GuC submission should
> work on all gen11+ platforms assuming the GuC firmware is present.
> 
> This is a huge series and it is completely unrealistic to merge all of
> these patches at once. Fortunately I believe we can break down the
> series into different merges:
> 
> 1. Merge Chris Wilson's patches. These have already been reviewed
> upstream and I fully agree with these patches as a precursor to GuC
> submission.
> 
> 2. Update to GuC 60.1.2. These are largely Michal's patches.
> 
> 3. Turn on GuC/HuC auto mode by default.
> 
> 4. Additional patches needed to support GuC submission. This is any
> patch not covered by 1-3 in the first 34 patches. e.g. 'Engine relative
> MMIO'
> 
> 5. GuC submission support. Patches number 35+. These all don't have to
> merge at once though as we don't actually allow GuC submission until the
> last patch of this series.

For the GuC backend/submission part only - it seems to me none of my 
review comments I made in December 2019 have been implemented. At that 
point I stated, and this was all internally at the time mind you, that I 
do not think the series is ready and there were several high level 
issues that would need to be sorted out. I don't think I gave my ack or 
r-b back then and the promise was a few things would be worked on post 
(internal) merge. That was supposed to include upstream refactoring to 
enable GuC better slotting in as a backed. Fast forward a year and a 
half later and the only progress we had in this area has been deleted.

 From the top of my head, and having glanced the series as posted:

  * Self-churn factor in the series is too high.
  * Patch ordering issues.
  * GuC context state machine is way too dodgy to have any confidence it 
can be read and race conditions understood.
  * Context pinning code with it's magical two adds, subtract and 
cmpxchg is dodgy as well.
  * Kludgy way of interfacing with rest of the driver instead of 
refactoring to fit (idling, breadcrumbs, scheduler, tasklets, ...).

Now perhaps the latest plan is to ignore all these issues and still 
merge, then follow up with throwing it away, mostly or at least largely, 
in which case there isn't any point really to review the current state 
yet again. But it is sad that we got to this state. So just for the 
record - all this was reviewed in Nov/Dec 2019. By me among other folks 
and I at least deemed it not ready in this form.

Regards,

Tvrtko
