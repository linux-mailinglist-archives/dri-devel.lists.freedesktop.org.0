Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7561849DE31
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 10:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699D410E496;
	Thu, 27 Jan 2022 09:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3606610E496;
 Thu, 27 Jan 2022 09:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id F22253F6A1;
 Thu, 27 Jan 2022 10:38:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HV0cfcZUN293; Thu, 27 Jan 2022 10:37:59 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id CD9B13F636;
 Thu, 27 Jan 2022 10:37:57 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.55.54.50])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D6B953626A5;
 Thu, 27 Jan 2022 10:37:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1643276277; bh=T0bnNFvqHkTrNJF5LWMl+KiCnilYvzbUtJvNeImUEEk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kFJ4XKzuXOQC0TqVyxd9+200cUOqF0fpOQc+cIWPB9f8pDi92dAI8UaAl+LftpA0v
 FgO4ULBJxdhBdRUm/DTLJZMXkPkylDIfQuduMVrRJcWOO5xtK9Dn1M7MBQa9D59KaK
 9aJaqv2K4c/kusNguko16tV8oCOWfaIMbCMzXQgc=
Message-ID: <ce91e091-0df1-5c4d-a070-7b82d74d3f42@shipmail.org>
Date: Thu, 27 Jan 2022 10:37:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v5 1/5] drm/i915: add needs_compact_pt flag
Content-Language: en-US
To: Robert Beckett <bob.beckett@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220125193530.3272386-1-bob.beckett@collabora.com>
 <20220125193530.3272386-2-bob.beckett@collabora.com>
 <6d0a57e7-daf7-6436-e806-7cc8794c2d50@shipmail.org>
 <19bf8290-9308-b5c6-eb73-4020fa81aa66@collabora.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <19bf8290-9308-b5c6-eb73-4020fa81aa66@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/26/22 18:11, Robert Beckett wrote:
>
>
> On 26/01/2022 13:49, Thomas Hellström (Intel) wrote:
>>
>> On 1/25/22 20:35, Robert Beckett wrote:
>>> From: Ramalingam C <ramalingam.c@intel.com>
>>>
>>> Add a new platform flag, needs_compact_pt, to mark the requirement of
>>> compact pt layout support for the ppGTT when using 64K GTT pages.
>>>
>>> With this flag has_64k_pages will only indicate requirement of 64K
>>> GTT page sizes or larger for device local memory access.
>>>
>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>>> ---
>>>   drivers/gpu/drm/i915/i915_drv.h          | 10 +++++++---
>>>   drivers/gpu/drm/i915/i915_pci.c          |  2 ++
>>>   drivers/gpu/drm/i915/intel_device_info.h |  1 +
>>>   3 files changed, 10 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
>>> b/drivers/gpu/drm/i915/i915_drv.h
>>> index 44c1f98144b4..1258b7779705 100644
>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>> @@ -1512,12 +1512,16 @@ IS_SUBPLATFORM(const struct drm_i915_private 
>>> *i915,
>>>   /*
>>>    * Set this flag, when platform requires 64K GTT page sizes or 
>>> larger for
>>> - * device local memory access. Also this flag implies that we 
>>> require or
>>> - * at least support the compact PT layout for the ppGTT when using 
>>> the 64K
>>> - * GTT pages.
>>
>> Why do we remove these comment lines?
> Because HAS_64K_PAGES now means just 64K page, it no longer means also 
> requires compact pt.
> This is to support other products that will have 64K but not have the 
> PDE non-sharing restriction in future.
>
> Those lines moved to the next change NEEDS_COMPACT_PT, which is now 
> separate.

Yes, NEEDS_COMPACT_PT indicates that compact is *required* but does 
"HAS_64K_PAGES" still mean compact is supported? That information is lost.

/Thomas


