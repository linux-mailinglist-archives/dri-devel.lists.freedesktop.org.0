Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA3C459F18
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 10:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7FB6E118;
	Tue, 23 Nov 2021 09:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466676E131;
 Tue, 23 Nov 2021 09:17:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="222209993"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; d="scan'208";a="222209993"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 01:17:07 -0800
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; d="scan'208";a="552903938"
Received: from clei4-mobl.ccr.corp.intel.com (HELO [10.209.177.32])
 ([10.209.177.32])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 01:17:05 -0800
Message-ID: <54ceb734-7b9b-d655-b8b5-39c656f8022e@linux.intel.com>
Date: Tue, 23 Nov 2021 09:17:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 3/3] drm/i915/gt: Improve "race-to-idle" at low frequencies
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
References: <20211117224955.28999-1-vinay.belgaumkar@intel.com>
 <20211117224955.28999-4-vinay.belgaumkar@intel.com>
 <YZvk8HDtluq0i5e5@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <YZvk8HDtluq0i5e5@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/11/2021 18:44, Rodrigo Vivi wrote:
> On Wed, Nov 17, 2021 at 02:49:55PM -0800, Vinay Belgaumkar wrote:
>> From: Chris Wilson <chris@chris-wilson.co.uk>
>>
>> While the power consumption is proportional to the frequency, there is
>> also a static draw for active gates. The longer we are able to powergate
>> (rc6), the lower the static draw. Thus there is a sweetspot in the
>> frequency/power curve where we run at higher frequency in order to sleep
>> longer, aka race-to-idle. This is more evident at lower frequencies, so
>> let's look to bump the frequency if we think we will benefit by sleeping
>> longer at the higher frequency and so conserving power.
>>
>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> 
> Please let's not increase the complexity here, unless we have a very good
> and documented reason.
> 
> Before trying to implement anything smart like this in the driver I'd like
> to see data, power and performance results in different platforms and with
> different workloads.

Who has such test suite and test farm which isn't focused to workloads 
from a single customer? ;(

Regards,

Tvrtko
