Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AAF6699F5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 15:21:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493C510EA01;
	Fri, 13 Jan 2023 14:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A90F10E9FD;
 Fri, 13 Jan 2023 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673619681; x=1705155681;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3okXM4x6oZMOlzLg+ynr2lGRZPjxPP8WQcjMssh0H2w=;
 b=mStp7Wn7HrZwdUTwuMVdVTHWotcITPse/yXf10NKzgxDO8x0lnvqyS61
 EztNEI/8MvZSBFb+Ro6Z7zvrTn8KoMEe5FB+U9ym3HEFagRmG+97GqRtx
 a4kv8wTn46/fPix0qSn8cw/NoMn6vADPNvD6lWrT7GYLGjEjTJ6dOr12L
 hlVJC6+MyRklbpTWK47GdpYTyhMCKbWDXb59M05tipflYT/7UfTr9oOBq
 c5QbncKamywGxP6rJzdMBUxoZUz8Y6CTZTC3u8aRPughwH+u/rFmfYo8y
 JMqLMrF/ha0roygmy3hIXjmHGNGvdMUavGJE3/Apq7ryas/o7iMCyWcQX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="324058919"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="324058919"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 06:21:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="608180891"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="608180891"
Received: from skenned1-mobl.ger.corp.intel.com (HELO [10.213.196.186])
 ([10.213.196.186])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 06:21:19 -0800
Message-ID: <8cccd992-1e5d-7121-c4cb-fb845b33128e@linux.intel.com>
Date: Fri, 13 Jan 2023 14:21:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Connect root sysfs entries to
 GT0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
References: <20230113022752.3151066-1-vinay.belgaumkar@intel.com>
 <874jsvazvi.wl-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <874jsvazvi.wl-ashutosh.dixit@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/01/2023 03:15, Dixit, Ashutosh wrote:
> On Thu, 12 Jan 2023 18:27:52 -0800, Vinay Belgaumkar wrote:
>>
>> Reading current root sysfs entries gives a min/max of all
>> GTs. Updating this so we return default (GT0) values when root
>> level sysfs entries are accessed, instead of min/max for the card.
>> Tests that are not multi GT capable will read incorrect sysfs
>> values without this change on multi-GT platforms like MTL.
>>
>> Fixes: a8a4f0467d70 ("drm/i915: Fix CFI violations in gt_sysfs")
> 
> We seem to be proposing to change the previous sysfs ABI with this patch?
> But even then it doesn't seem correct to use gt0 values for device level
> sysfs. Actually I received the following comment about using max freq
> across gt's for device level freq's (gt_act_freq_mhz etc.) from one of our
> users:
> 
> -----
> On Sun, 06 Nov 2022 08:54:04 -0800, Lawson, Lowren H wrote:
> 
> Why show maximum? Wouldn’t average be more accurate to the user experience?
> 
> As a user, I expect the ‘card’ frequency to be relatively accurate to the
> entire card. If I see 1.6GHz, but the card is behaving as if it’s running a
> 1.0 & 1.6GHz on the different compute tiles, I’m going to see a massive
> decrease in compute workload performance while at ‘maximum’ frequency.
> -----
> 
> So I am not sure why max/min were previously chosen. Why not the average?

I think we still have time to just either stop exposing the global files 
on multi-tile platforms (all are under force probe), or return some 
error from them.

IMO it's not kernel's job to provide any representation here - be in 
min, max, sum or average (different "blending" methods were discussed 
for different files) - all of them have some potential to be misleading 
from different angles.

Regards,

Tvrtko
