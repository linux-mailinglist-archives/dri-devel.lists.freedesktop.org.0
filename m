Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DE44C1213
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 13:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6282410E875;
	Wed, 23 Feb 2022 12:00:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB5810E69B;
 Wed, 23 Feb 2022 12:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645617622; x=1677153622;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=adixlrNztqZ7xloyBEesbJO8itBcd5a2vOZGYJd313g=;
 b=dQPAfDWznkszfM9IweSJfRYdgxmNMhGO4KRb7CLubxfwI5bSibaKyhPV
 +srKGbGOT9fhXYjMDoddcTdTcw+ZznJJMcCg2kc5F531wJfTS1DkKGg8J
 FHo4TW0J3sPVU/XB1yEwpBAp6PLCx7z4AzR3u4NFLBZYpLTTjzQ6f93lc
 BjLmrgtJ6bDLQ8NIoO9UlFOc3NupX0e5bTg9UZ1KssfBGYGqLq3zxNNn9
 AegwpOwRIZW/GNmnXlvtczxEz7y6F4BwoaDxBODE7p8Azm5NL+97C4Tqx
 7scEro9CeKHa2w2HNg3A9wJThTqgSXYTjn37VZq16Di+23FzI73Qs3mlb w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="252139330"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="252139330"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 04:00:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="707005766"
Received: from lportx-mobl3.ger.corp.intel.com (HELO [10.213.242.198])
 ([10.213.242.198])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 04:00:21 -0800
Message-ID: <ccc8d37f-2bcc-b258-4969-430c609c11d0@linux.intel.com>
Date: Wed, 23 Feb 2022 12:00:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 0/3] Improve anti-pre-emption w/a for compute
 workloads
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <647b611a-d159-3a6f-2e3a-c8039a9503ec@linux.intel.com>
 <7ceb4723-7ebf-3762-ddb7-b16e48e804d3@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <7ceb4723-7ebf-3762-ddb7-b16e48e804d3@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23/02/2022 02:22, John Harrison wrote:
> On 2/22/2022 01:53, Tvrtko Ursulin wrote:
>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> Compute workloads are inherently not pre-emptible on current hardware.
>>> Thus the pre-emption timeout was disabled as a workaround to prevent
>>> unwanted resets. Instead, the hang detection was left to the heartbeat
>>> and its (longer) timeout. This is undesirable with GuC submission as
>>> the heartbeat is a full GT reset rather than a per engine reset and so
>>> is much more destructive. Instead, just bump the pre-emption timeout
>>
>> Can we have a feature request to allow asking GuC for an engine reset?
> For what purpose?

To allow "stopped heartbeat" to reset the engine, however..

> GuC manages the scheduling of contexts across engines. With virtual 
> engines, the KMD has no knowledge of which engine a context might be 
> executing on. Even without virtual engines, the KMD still has no 
> knowledge of which context is currently executing on any given engine at 
> any given time.
> 
> There is a reason why hang detection should be left to the entity that 
> is doing the scheduling. Any other entity is second guessing at best.
> 
> The reason for keeping the heartbeat around even when GuC submission is 
> enabled is for the case where the KMD/GuC have got out of sync with 
> either other somehow or GuC itself has just crashed. I.e. when no 
> submission at all is working and we need to reset the GuC itself and 
> start over.

.. I wasn't really up to speed to know/remember heartbeats are nerfed 
already in GuC mode.

I am not sure it was the best way since full reset penalizes everyone 
for one hanging engine. Better question would be why leave heartbeats 
around to start with with GuC? If you want to use it to health check 
GuC, as you say, maybe just send a CT message and expect replies? Then 
full reset would make sense. It also achieves the goal of not seconding 
guessing the submission backend you raise.

Like it is now, and the need for this series demonstrates it, the whole 
thing has a pretty poor "impedance" match. Not even sure what 
intel_guc_find_hung_context is doing in intel_engine_hearbeat.c - why is 
that not in intel_gt_handle_error at least? Why is hearbeat code special 
and other callers of intel_gt_handle_error don't need it?

Regards,

Tvrtko
