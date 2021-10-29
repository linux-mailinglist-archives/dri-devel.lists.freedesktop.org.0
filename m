Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8215143F72C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 08:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536216E9EB;
	Fri, 29 Oct 2021 06:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543026E9F0;
 Fri, 29 Oct 2021 06:31:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="217784492"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="217784492"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:31:29 -0700
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="495636644"
Received: from ekolpasx-mobl.ccr.corp.intel.com (HELO [10.249.254.219])
 ([10.249.254.219])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:31:28 -0700
Message-ID: <6371ae79-6dd8-7375-e6ab-16cd98690f2f@linux.intel.com>
Date: Fri, 29 Oct 2021 08:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 2/3] drm/i915: Update error capture code to avoid using
 the current vma state
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, matthew.auld@intel.com
References: <20211028120128.13490-1-thomas.hellstrom@linux.intel.com>
 <20211028120128.13490-3-thomas.hellstrom@linux.intel.com>
 <20211028225535.GA32750@jons-linux-dev-box>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211028225535.GA32750@jons-linux-dev-box>
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


On 10/29/21 00:55, Matthew Brost wrote:
> On Thu, Oct 28, 2021 at 02:01:27PM +0200, Thomas Hellström wrote:
>> With asynchronous migrations, the vma state may be several migrations
>> ahead of the state that matches the request we're capturing.
>> Address that by introducing an i915_vma_snapshot structure that
>> can be used to snapshot relevant state at request submission.
>> In order to make sure we access the correct memory, the snapshots take
>> references on relevant sg-tables and memory regions.
>>
>> Also move the capture list allocation out of the fence signaling
>> critical path and use the CONFIG_DRM_I915_CAPTURE_ERROR define to
>> avoid compiling in members and functions used for error capture
>> when they're not used.
>>
>> Finally, correct lockdep annotation would reveal that error capture is
>> typically done in the fence signalling critical path. Alter the
>> error capture memory allocation mode accordingly.
>>
> I've seen this as well:
> https://patchwork.freedesktop.org/patch/451415/?series=93704&rev=5
>
> John Harrison and Daniele feeling was if a NOWAIT memory allocation
> context was used if the system was under any amount of memory pressure
> the error capture is likely to fail due to the size of the objects being
> allocated. Daniel's Vetter has purposed another solution - basically
> allocate a page at the NOWAIT context which is a larger rework.
>
> We have Jira for this. I'll dig this up and send it over off the list if
> you want to join that discussion.
>
> Matt
>
Please do, I basically agree with John and Daniele error capture may 
fail under memory pressure, but I couldn't see how we could avoid that 
short of exposing us to dma-fence deadlocks.

I figure basically we'd have to pin all vmas, reset, retire the request 
and *then* do the allocating parts of the capture.

I'll ping Daniel about the best course of action meanwhile for the above 
series.

/Thomas


