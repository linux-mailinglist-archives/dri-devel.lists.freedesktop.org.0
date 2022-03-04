Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A7F4CD455
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 13:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDAB10F41F;
	Fri,  4 Mar 2022 12:36:07 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BFF10F41C;
 Fri,  4 Mar 2022 12:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646397366; x=1677933366;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=k+cnuyWjviu4fuZkZwhrH1DYuCOS9KVIJvi92JFhiHk=;
 b=Y+X9WML/uf/Dtq94fhshetka4JaX05jFEBtNB4xEN8/DE94MJ6Kctqp+
 y0NOUHp7id4oIwRalkrhCu3eACPV7nQ1BLONpniOr+q49tlQusuwnpeeZ
 xC4PlZx4ZkV3nMn915PEu+ijK1d/hKTuf90/HkTtyfR6ZFBTQlYVmZCk6
 k8tZkZT80D86GeLqQ7Gk5fJ1XDAtt+0TVpMTzStUW6G0LbCHlKLZZ7/So
 Diya8ZIMhovGO8RLWB8VdEMmSGJhbDZmdDBg7BAPW481b8tDbCq/kAA2R
 rD23ZTXjmtuGICzOw1KLh7ZOwO4IOBi0LfLSm/r1SKzEWHwyHvMioo3kJ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="340397315"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="340397315"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 04:36:05 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="536265582"
Received: from dlalwani-mobl.ger.corp.intel.com (HELO [10.213.223.211])
 ([10.213.223.211])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 04:36:04 -0800
Message-ID: <2bb1563f-83b6-495e-db8f-63b870744bf3@linux.intel.com>
Date: Fri, 4 Mar 2022 12:36:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/gt: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Intel-GFX@Lists.FreeDesktop.Org, "Bloomfield, Jon"
 <jon.bloomfield@intel.com>, "Ewins, Jon" <jon.ewins@intel.com>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-3-John.C.Harrison@Intel.com>
 <2a486991-1bfd-9b23-0b43-9173d17b7e13@linux.intel.com>
 <e95e8710-8410-2869-dec1-7f7a9e9a74fb@intel.com>
 <18205069-1210-745f-3bcc-2eddb0d17da1@linux.intel.com>
 <94e9889d-d71a-1428-516d-2928807cbf43@intel.com>
 <6ee75384-2cf0-6b34-ed54-3c7dc9ca31a3@linux.intel.com>
 <d6624800-87b0-f992-bc83-868744e2839c@intel.com>
 <ed505a8e-2d2b-135b-aaab-7e4a0befd5ba@linux.intel.com>
 <f6c70184-121e-9a2b-6bbc-54a67af293cc@intel.com>
 <96b7ce40-12f1-9ca0-1c5a-323d63dd8153@linux.intel.com>
 <9df22764-db87-a2d2-2b03-52b4d4c6da9c@intel.com>
 <9bd316d8-004c-621a-916c-2ebad5c31b43@linux.intel.com>
 <8fb0a3a7-7968-79cb-9ea1-e31b0593acaa@intel.com>
 <42b114a7-04ea-71eb-7cd6-507fb4fb1655@linux.intel.com>
 <389c16df-f579-81df-8405-376fcf8ce613@intel.com>
 <f9daab55-6bda-b359-352d-8e585bce899c@linux.intel.com>
 <711fbb74-e6fd-c78b-5c01-9cb1d1b6d624@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <711fbb74-e6fd-c78b-5c01-9cb1d1b6d624@intel.com>
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


On 03/03/2022 19:09, John Harrison wrote:

>> Actions:
>>
>> 1)
>> Get a number from compute/OpenCL people for what they say is minimum 
>> preempt timeout for default out of the box Linux desktop experience.
> That would be the one that has been agreed upon by both linux software 
> arch and all UMD teams and has been in use for the past year or more in 
> the internal tree.

What has been used in the internal tree is irrelevant when UMD ack is needed for changes which affect upstream shipping platforms like Tigerlake.

>> This does not mean them running some tests and can't be bothered to 
>> setup up the machine for the extreme use cases, but workloads average 
>> users can realistically be expected to run.
>>
>> Say for instance some image manipulation software which is OpenCL 
>> accelerated or similar. How long unpreemptable sections are expected 
>> there. Or similar. I am not familiar what all OpenCL accelerated use 
>> cases there are on Linux.
>>
>> And this number should be purely about minimum preempt timeout, not 
>> considering heartbeats. This is because preempt timeout may kick in 
>> sooner than stopped heartbeat if the user workload is low priority.
>>
> And driver is simply hosed in the intervening six months or more that it 
> takes for the right people to find the time to do this.

What is hosed? Driver currently contains a patch which was acked by the compute UMD to disable preemption. If it takes six months for compute UMD to give us a different number which works for the open source stack and typical use cases then what can we do.

> Right now, it is broken. This patch set improves things. Actual numbers 
> can be refined later as/when some random use case that we hadn't 
> previously thought of pops up. But not fixing the basic problem at all 
> until we have an absolutely perfect for all parties solution is 
> pointless. Not least because there is no perfect solution. No matter 
> what number you pick it is going to be wrong for someone.
> 
> 2.5s, 7.5s, X.Ys, I really don't care. 2.5s is a number you seem to have 
> picked out of the air totally at random, or maybe based on it being the 
> heartbeat period (except that you keep arguing that basing tP on tH is 
> wrong). 7.5s is a number that has been in active use for a lot of 
> testing for quite some time - KMD CI, UMD CI, E2E, etc. But either way, 
> the initial number is almost irrelevant as long as it is not zero. So 
> can we please just get something merged now as a starting point?
> 
> 
>> 2)
>> Commit message should explain the effect on the worst case time until 
>> engine reset.
>>
>> 3)
>> OpenCL/compute should ack the change publicly as well since they acked 
>> the disabling of preemption.
> This patch set has already been publicly acked by the compute team. See 
> the 'acked-by' tag.

I can't find the reply which contained the ack on the mailing list - do you have a msg-id or an archive link?

Also, ack needs to be against the the fixed timeout patch and not one dependent on the heartbeat interval.

>> 4)
>> I really want overflows_type in the first patch.
> In the final GuC assignment? Only if it is a BUG_ON. If we get a failure 
> there it is an internal driver error and cannot be corrected for. It is 
> too late for any plausible range check action.

If you can find a test which exercises setting insane values to the relevant timeouts and so would hit the problem in our CI then BUG_ON is fine. Otherwise I think BUG_ON is too anti-social and prefer drm_warn or drm_WARN_ON. I don't think adding a test is strictly necessary, if we don't already have one, given how unlikely this is too be hit, but if you insist on a BUG_ON instead of a flavour of a warn then I think we need one so we can catch in CI 100% of the time.
  
> And if you mean in the the actual helper function with the rest of the 
> clamping then you are bleeding internal GuC API structure details into 
> non-GuC code. Plus the test would be right next to the 'if (size < 

In my other reply I exactly described that would be a downside and that I prefer checks at the assignment sites.

Also regarding this comment in the relevant patch:

+	/*
+	 * NB: The GuC API only supports 32bit values. However, the limit is further
+	 * reduced due to internal calculations which would otherwise overflow.
+	 */

I would suggest clarifying this as "The GuC API only supports timeouts up to U32_MAX micro-seconds. However, ...". Given the function at hand deals in milliseconds explicitly calling out that additional scaling factor makes sense I think.

Big picture - it's really still very simple. Public ack for a fixed number and a warn on is not really a lot to ask.

Regards,

Tvrtko
