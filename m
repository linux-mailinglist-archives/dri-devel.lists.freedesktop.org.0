Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 776934CBAD6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 10:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522A010EA8C;
	Thu,  3 Mar 2022 09:55:36 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4192410EA8C;
 Thu,  3 Mar 2022 09:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646301335; x=1677837335;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n9/PariFFp5/KQ2RFM9KgICu8QRiePc7gKDISjJ67QE=;
 b=FjAdOIKYzRN9ivxNtzm7DPWBwHsITbeNp9xvYkzc47KYTHowlJDYciIc
 OEWuqoSbvNBKGDDA23/ris1RoKuMN/Vu0BYZtUGvXkBBx19LxSudCNaSw
 fnDCr42zELKRQyUuJTNSS40sAu/SJmrgv+lZssX+RxXq5LV2iIL6vQyWy
 uwQ50hO+hQCTgbFzU+PIA7VtTUdBvWeIhMs7PkIPgQJ41lBP30sWGrzrl
 CB/4GywGLADHtYPtiJTpspbxWU3If52xfxE+ygKgaso+cGISVjbSDuS3e
 SR1XHxea2noTaIwrYmbgXvw7Nq0vjeBEgWMprzhdLsrPManM5MCAI0NS9 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="241051425"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="241051425"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 01:55:34 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="508532375"
Received: from gerar12x-mobl1.ger.corp.intel.com (HELO [10.213.222.145])
 ([10.213.222.145])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 01:55:33 -0800
Message-ID: <f9daab55-6bda-b359-352d-8e585bce899c@linux.intel.com>
Date: Thu, 3 Mar 2022 09:55:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/gt: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
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
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <389c16df-f579-81df-8405-376fcf8ce613@intel.com>
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



On 02/03/2022 17:55, John Harrison wrote:

>> I was assuming 2.5s tP is enough and basing all calculation on that. 
>> Heartbeat or timeslicing regardless. I thought we established neither 
>> of us knows how long is enough.
>>
>> Are you now saying 2.5s is definitely not enough? How is that usable 
>> for a default out of the box desktop?
> Show me your proof that 2.5s is enough.
> 
> 7.5s is what we have been using internally for a very long time. It has 
> approval from all relevant parties. If you wish to pick a new random 
> number then please provide data to back it up along with buy in from all 
> UMD teams and project management.

And upstream disabled preemption has acks from compute. "Internally" is 
as far away from out of the box desktop experiences we have been arguing 
about. In fact you have argued compute disables the hearbeat anyway.

Lets jump to the end of this reply please for actions.

>> And I don't have a problem with extending the last pulse. It is 
>> fundamentally correct to do regardless of the backend. I just raised 
>> the question of whether to extend all heartbeats to account for 
>> preemption (and scheduling delays). (What is the point of bumping 
>> their priority and re-scheduling if we didn't give enough time to the 
>> engine to react? So opposite of the question you raise.)
> The point is that it we are giving enough time to react. Raising the 
> priority of a pre-emption that has already been triggered will have no 
> effect. So as long as the total time from when the pre-emption is 
> triggered (prio becomes sufficiently high) to the point when the reset 
> is decided is longer than the pre-emption timeout then it works. Given 
> that, it is unnecessary to increase the intermediate periods. It has no 
> advantage and has the disadvantage of making the total time unreasonably 
> long.
> 
> So again, what is the point of making every period longer? What benefit 
> does it *actually* give?

Less special casing and pointless prio bumps ahead of giving time to 
engine to even react. You wouldn't have to have the last pulse 2 * tP 
but normal tH + tP. So again, it is nicer for me to derive all heartbeat 
pulses from the same input parameters.

The whole "it is very long" argument is IMO moot because now proposed 
7.5s preempt period is I suspect wholly impractical for desktop. 
Combined with the argument that real compute disables heartbeats anyway 
even extra so.

> Fine. "tP(RCS) = 7500;" can I merge the patch now?
I could live with setting preempt timeout to 7.5s. The downside is 
slower time to restoring frozen desktops. Worst case today 5 * 2.5s, 
with changes 4 * 2.5s + 2 * 7.5s; so from 12.5s to 25s, doubling..

Actions:

1)
Get a number from compute/OpenCL people for what they say is minimum 
preempt timeout for default out of the box Linux desktop experience.

This does not mean them running some tests and can't be bothered to 
setup up the machine for the extreme use cases, but workloads average 
users can realistically be expected to run.

Say for instance some image manipulation software which is OpenCL 
accelerated or similar. How long unpreemptable sections are expected 
there. Or similar. I am not familiar what all OpenCL accelerated use 
cases there are on Linux.

And this number should be purely about minimum preempt timeout, not 
considering heartbeats. This is because preempt timeout may kick in 
sooner than stopped heartbeat if the user workload is low priority.

2)
Commit message should explain the effect on the worst case time until 
engine reset.

3)
OpenCL/compute should ack the change publicly as well since they acked 
the disabling of preemption.

4)
I really want overflows_type in the first patch.

My position is that with the above satisfied it is okay to merge.

Regards,

Tvrtko
