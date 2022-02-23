Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F16244C1504
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 15:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC3110E70C;
	Wed, 23 Feb 2022 14:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902B010E182;
 Wed, 23 Feb 2022 14:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645625042; x=1677161042;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HSthDVuz1QFzikPFHjUDIUAZbUOucQYS6wZC2DwU9g4=;
 b=X3u2Yua4RbxKcIZxArdkC0XELuwAM1276BTTKYa9oZjh5+DljtCoBfKr
 XCWQgsMWcPwk4F7LybMrZiRS5hucSaYfS6JvAdCXIYxdZS8pJjVp/YhqC
 WuQBFdG4A8djU8R5AEbZKt6e/wkb4zE/4azSPNYfR1JZ3BlWlXYT6EsmQ
 0lfLxA4+UDnmHC4Swrm0aSuBhgnRvj4QU2R/rNEpQBZ9EsKHiUFeo1aLA
 iBZZHCvvVHCbaDlcv4MJOsXV4ySizFc7eE4u1GRqWa3BzhAbUoqPOyrp+
 8yy5q5j1QCMfFl8bfQaTjRnXy8lrnvLuziAuIwWZgq3HVHfKQEYKdDwSX A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="276587572"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="276587572"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 06:04:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="707039919"
Received: from lportx-mobl3.ger.corp.intel.com (HELO [10.213.242.198])
 ([10.213.242.198])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 06:04:00 -0800
Message-ID: <8a892190-73ce-fc7d-9c93-e17a929df78e@linux.intel.com>
Date: Wed, 23 Feb 2022 14:03:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] drm/mm: Ensure that the entry is not NULL before
 extracting rb_node
Content-Language: en-US
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20220217075014.922605-1-vivek.kasireddy@intel.com>
 <20220217075014.922605-2-vivek.kasireddy@intel.com>
 <a37a0c45-615e-e731-e124-7db18bc06e1f@linux.intel.com>
 <20f0acb8260a4f18aeadbcc73847e06f@intel.com>
 <242fada2-dc13-c272-787a-3a0cd4efd52b@linux.intel.com>
 <a4fd740802ec4ab98bf8480f069e5ebf@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <a4fd740802ec4ab98bf8480f069e5ebf@intel.com>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/02/2022 04:35, Kasireddy, Vivek wrote:
> Hi Tvrtko,
> 
>>
>> On 18/02/2022 03:47, Kasireddy, Vivek wrote:
>>> Hi Tvrtko,
>>>
>>>>
>>>> On 17/02/2022 07:50, Vivek Kasireddy wrote:
>>>>> While looking for next holes suitable for an allocation, although,
>>>>> it is highly unlikely, make sure that the DECLARE_NEXT_HOLE_ADDR
>>>>> macro is using a valid node before it extracts the rb_node from it.
>>>>
>>>> Was the need for this just a consequence of insufficient locking in the
>>>> i915 patch?
>>> [Kasireddy, Vivek] Partly, yes; but I figured since we are anyway doing
>>> if (!entry || ..), it makes sense to dereference entry and extract the rb_node
>>> after this check.
>>
>> Unless I am blind I don't see that it makes a difference.
>> "&entry->rb_hole_addr" is taking an address of, which works "fine" is
> [Kasireddy, Vivek] Ah, didn't realize it was the same thing as offsetof().
> 
>> entry is NULL. And does not get past the !entry check for the actual
>> de-reference via RB_EMPTY_NODE. With your patch you move that after the
>> !entry check but still have it in the RB_EMPTY_NODE macro. Again, unless
>> I am blind, I think just drop this patch.
> [Kasireddy, Vivek] Sure; do you want me to send another version with this
> patch dropped? Or, would you be able to just merge the other two from the
> latest version of this series?

Please send without the first patch so we get clean set of CI results.

You can use "--subject-prefix=CI" with git format-patchs and 
--suppress-cc=all with git send-email to avoid spamming people and let 
readers know the re-send is just for the purpose of getting CI results.

Regards,

Tvrtko
