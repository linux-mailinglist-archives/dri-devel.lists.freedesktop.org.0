Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E354D57FE4E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 13:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21301964DB;
	Mon, 25 Jul 2022 11:24:19 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21A5964D7;
 Mon, 25 Jul 2022 11:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658748257; x=1690284257;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hxIIKtWWLY+g98mCDhry8GjuEMAFfrgiZPbSW5A6z0Y=;
 b=miZvZBF+Pepej7BYsZGvlMd8NQIagmwO9Cah6EbvUeSSytxrUtdk+mO5
 GKw3BJvROVNcJcH3rvFeelwDwfXRHtssrv5+0kVAXVVTyJExgaZsE5vb+
 BWkQYLm8QDsojOzcchLDTKCfJtDe5rH+dx/NLzSXbUeV5+lN01LkEIufK
 572yqOd5wdp4lJiu0ZPojGMnfDShUZXYEk31/3CGo7e3IShBhRAhcFQXN
 HG055stMEQenz8gWEpgPv+J7fcy9fDupPsBp7O5J9ElSQtLYwBXTiOaxZ
 NMbUs+JIz0IyHryI/iqias21UdlFsUikWfbjt8zLaORCPIUakdtvte5cQ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="288433456"
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="288433456"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 04:24:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="575016126"
Received: from ngobrien-mobl1.ger.corp.intel.com (HELO [10.213.204.5])
 ([10.213.204.5])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 04:24:16 -0700
Message-ID: <3d04906d-87de-1c5b-5139-d32bdbcabc28@linux.intel.com>
Date: Mon, 25 Jul 2022 12:24:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 10/12] drm/i915/guc: Support larger contexts
 on newer hardware
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-11-John.C.Harrison@Intel.com>
 <3c8e8b71-1c74-c50d-7b29-29430a11eb10@linux.intel.com>
 <e7673834-a795-8364-96d9-7075bd407ee6@intel.com>
 <1f306c55-8443-72b3-a419-40f3cb85b76c@linux.intel.com>
 <25f0f1b0-2eb0-4a52-a105-17a82354284c@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <25f0f1b0-2eb0-4a52-a105-17a82354284c@intel.com>
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


On 22/07/2022 20:32, John Harrison wrote:
> On 7/19/2022 02:56, Tvrtko Ursulin wrote:
>> On 19/07/2022 01:13, John Harrison wrote:
>>> On 7/18/2022 05:35, Tvrtko Ursulin wrote:
>>>>
>>>> On 13/07/2022 00:31, John.C.Harrison@Intel.com wrote:
>>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>>
>>>>> The GuC needs a copy of a golden context for implementing watchdog
>>>>> resets (aka media resets). This context is larger on newer platforms.
>>>>> So adjust the size being allocated/copied accordingly.
>>>>
>>>> What were the consequences of this being too small? Media watchdog 
>>>> reset broken impacting userspace? Platforms? Do we have an IGT 
>>>> testcase? Do we need a Fixes: tag? Copy stable?
>>> Yes. Not sure if we have an IGT for the media watchdog. I recall 
>>> writing something a long time back but I don't think it ever got 
>>> merged due to push back that I don't recall right now. And no because 
>>> it only affects DG2 onwards which is still forceprobed.
>>
>> Right, hm, I don't know if the MBD SKU promise for DG2 relies on force 
>> probe removal or not. My impression certainly was that a bunch of uapi 
>> we recently merged made people happy in that respect - that we 
>> satisfied the commit to deliver that support with 5.19. Maybe I am 
>> wrong, or perhaps to err on the side of safety you could add the right 
>> Fixes: tag regardless? Pick some patch which enables GuC for DG2 if 
>> there isn't anything better I guess. Or you could check with James.
> Adding "Fixes: random patch that is actually irrelevant" seems like the 
> wrong thing to do. This is not a bug fix. It is new platform support. 
> And it is not the only thing required to support that new platform that 
> is not currently in 5.19. E.g. DG2 requires at least GuC v70.4.2 to 
> support some hardware w/a's. The guidance for that was to not add Fixes 
> tags but to send a manual pull request once everything is ready.

All I know is that some people were really interested(*) that 5.19 
contains everything needed for DG2. Hence I suggested to err on the side 
of safety, or at least check with folks.

Bottom line is, if you want this fix to be in 5.19, or even 5.20, you 
should add a Fixes: tag. Otherwise it will be in 5.21 at the earliest. 
Your call, I only tried to be helpful and avoid another failure.

Regards,

Tvrtko

*) To the point of actively pining the maintainers to ensure patches do 
not miss the merge window.
