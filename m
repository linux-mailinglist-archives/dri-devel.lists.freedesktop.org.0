Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FA06E9558
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 15:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73DD10E2C0;
	Thu, 20 Apr 2023 13:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A73710E2DA;
 Thu, 20 Apr 2023 13:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681995984; x=1713531984;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dx+hSc4y4Po59ySqejFBUBgm0lp+shols/fjl2VKt14=;
 b=jDpwgLvLqcr7FBYXDTPgC1afCyVJJT4cXS/cJJodW7VlX+qzy9R9jwzH
 msC6ZzeIN9RMTS1yDUAohfWAXXWXkPGiUWcNieCU2y/2R839SreBWKsG4
 68E7nYPHE6mdPfHKVYdEAKs4S0bwGP3HOnBjlvrklyn9msyTojUHdmsgx
 ynOPesAJtq6UeaeQD70+2B3PaC5mEd64uN3Wag4Adi/wKdM0y48ci3Fuv
 342nyctXt17SOh664C5b4DIduavUeHAlm1dcYZlJX0WHntQn4V/cA9QoU
 yydxKiTo+bdgHtIsnXT+yXGFi3UJSId508itnu/pnmCEBIQKEgwBajVaG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="408640830"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="408640830"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 06:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="691913992"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="691913992"
Received: from gbyrne6x-mobl1.ger.corp.intel.com (HELO [10.213.221.188])
 ([10.213.221.188])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 06:06:05 -0700
Message-ID: <471addf7-1670-32cd-9d2e-3f94d6825eab@linux.intel.com>
Date: Thu, 20 Apr 2023 14:06:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH 8/8] drm/i915: Allow user to set cache at BO
 creation
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, fei.yang@intel.com
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-9-fei.yang@intel.com>
 <ZEEkV3XOdmtYWnMv@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZEEkV3XOdmtYWnMv@ashyti-mobl2.lan>
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/04/2023 12:39, Andi Shyti wrote:
> Hi Fei,
> 
>> To comply with the design that buffer objects shall have immutable
>> cache setting through out their life cycle, {set, get}_caching ioctl's
>> are no longer supported from MTL onward. With that change caching
>> policy can only be set at object creation time. The current code
>> applies a default (platform dependent) cache setting for all objects.
>> However this is not optimal for performance tuning. The patch extends
>> the existing gem_create uAPI to let user set PAT index for the object
>> at creation time.
>> The new extension is platform independent, so UMD's can switch to using
>> this extension for older platforms as well, while {set, get}_caching are
>> still supported on these legacy paltforms for compatibility reason.
>>
>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> because this is an API change, we need some more information
> here.
> 
> First of all you need to CC the userspace guys that have been
> working on top of your series and get their ack's.

Yes, and a link to a Mesa merge request which uses the uapi should be 
included.

IGTs should be ready to before we can merge. I glanced over igt-dev but 
did not spot anything.

Regards,

Tvrtko

> 
> I also believe that this series has also been tested on a
> separate repository, would you link it in the commit message?
> 
> Thanks,
> Andi
