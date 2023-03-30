Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065BE6D049E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFF310EDF2;
	Thu, 30 Mar 2023 12:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3360610EDF2;
 Thu, 30 Mar 2023 12:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680179145; x=1711715145;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iZUO1YgFvwrZtsBgRZmepjELOFI2+IRpVmBFFV/2pag=;
 b=chxFjFdnVNeVd9qQQkXCgSwCFExqy8l1kODw2wJJzzUp3rK5BAyhAaxB
 c5nCkF8uT07d+za7urFEfaplCIw45BinTh/5J87vf8eyAPhuscLwkUkQq
 i4kL5ehKsnQwk9+PXXRsDWXJma5unUkcPiVGtfpF+Em3nPyT8pEIWt62j
 TXSQo3EOXw90DyI/8hEPRbj8SGJ0PA6nugfsS/4OfZunEpaFdQOrf4KN2
 LulO5J/Txwc1mpTJZB9T96cRxAo04i339ELLTDTGzJOpG74xhopYS5cEF
 AhiZWlWJjxKBgfONbs6N9P+5y5/v8KVNhemUkNliWMBjuznz+NiGqamnE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="320803164"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="320803164"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 05:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="858899221"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="858899221"
Received: from bjmcgrat-mobl.amr.corp.intel.com (HELO [10.213.215.205])
 ([10.213.215.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 05:25:39 -0700
Message-ID: <36548877-5352-8ff3-6e87-410089470a4b@linux.intel.com>
Date: Thu, 30 Mar 2023 13:25:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH v6 5/8] drm/i915/pxp: Add ARB session creation
 and cleanup
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-6-alan.previn.teres.alexis@intel.com>
 <fabe4123-53cc-005e-e0af-7683e0d45896@intel.com>
 <3b8091c51677878b968d1d275b9b16e5088d913d.camel@intel.com>
 <ZCAqDlUIp0YmCkyu@intel.com> <fef256a6-3027-8beb-0ef8-fddf972db441@intel.com>
 <cf63d62b-3e2d-f8fe-82b6-95e71e376cc2@linux.intel.com>
 <3359c9d371a25710891352061693637b37679734.camel@intel.com>
 <ZCMpXMj7GwDIp6Ll@intel.com>
 <118981ef-260d-4c1a-5ca5-ad435d5edbc7@linux.intel.com>
 <f87c39a243d84e53d6c292c63d032b30c89adb3e.camel@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <f87c39a243d84e53d6c292c63d032b30c89adb3e.camel@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Lahtinen,
 Joonas" <joonas.lahtinen@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Harrison,
 John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 30/03/2023 01:10, Teres Alexis, Alan Previn wrote:
> 
> On Wed, 2023-03-29 at 08:43 +0100, Tvrtko Ursulin wrote:
>> On 28/03/2023 18:52, Rodrigo Vivi wrote:
>>> On Tue, Mar 28, 2023 at 05:01:36PM +0000, Teres Alexis, Alan Previn wrote:
>>>> On Mon, 2023-03-27 at 17:15 +0100, Tvrtko Ursulin wrote:
>>>>
> alan:snip
>> How will the context create path look like on those platforms:
>>
>> 1. Block, then potentially error out if the full initialization failed.
>> 2. Error out "in progress" while initializing, error out "something
>> else" if initialization failed.
>>
> alan:i was thinking of taking a page from huc-authentication's get-param where we could return different values based on startup progress - in all cases we never block:

If context create never blocks then the only added value of new getparam 
is just granularity of reported statuses, versus potential overload of 
errnos from context create?

>   1. we dont support it in hw/kernel (i.e. not pxp in device-info or not enough CONFIG_foo - reusing intel_pxp_is_supported?)
>   2. we support it in kernel but internal dependencies are still in progress (i.e. we have not yet completed huc-loading/huc-authen/proxy-init - UAPI spec should include how many
> max seconds delay per platform)
>   3. we support it in kernel but internal dependencies failed (i.e. we know huc-load/authent. failed ... or we know proxy-init failed).
>   4. we support it in kernel but platform has no support (at this stage we actually attempt to create a PXP context or create the arb-session from inside i915-get-param but we ended
> up a PXP fw error indicating select list of failures such as fusing / BIOS-config / wrong-version.
>   0. we support it completely i.e. step 4's attempt to create active PXP session succeeded
> 
> I want to differentiate 3 and 4 (as opposed to return x-means-ENODEV) because i have am sure it will save debug time when facing customer issues.
> Ofc we will have to optimize the checking sequences above but at #4, we would be creating a session which might take up to ~200 milisecs for the round trip response from fw.

Not sure I get this. If getparam is trying to set this up, which is 
possibly questionable in itself, where it needs to block for 200ms 
(max?), and nothing else blocks, then where is the missing max delay 
mentioned as a starting point for the discussion? Is it expected to 
elapse while userspace is repeatedly calling getparam and it is getting 
some "in progress" value?

> We could store a flag in i915-pxp-internal-struct to indicate if we ever did succeed a pxp creation after a fresh boot ... intel_pxp_is_ready_for_active()?
> ... true only if we ever did allocate a slot successfully at least once since boot.
> This also ensure mesa init will return almost immediately except at the first time when hitting #4.

Even 200ms is possibly not good enough since boot time targets (to UI 
AFAIR) are pretty tight. Don't know... Maybe I'd need a timeline diagram 
showing the involved components to understand this properly.

But intuitively I thought that what Mesa wants is a no-cost getparam 
which would somewhat reliably tell it if the feature is supposed to be 
there and context create at a later stage, with the protected flag set, 
is supposed to work. AFAIU it can still fail at that point or probably 
block until the required setup is done.

Regards,

Tvrtko
