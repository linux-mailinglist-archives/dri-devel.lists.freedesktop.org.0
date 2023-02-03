Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC91689218
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 09:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2481A10E1EF;
	Fri,  3 Feb 2023 08:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AEB10E757;
 Fri,  3 Feb 2023 08:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675412644; x=1706948644;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=psL7VyjymSkgF3hmLRnrkLFS/tklXysVo0QEhwLM8tU=;
 b=M14+oquLcsHGvSGnaxVZxPZQFydWvEsD8p3xO5wq3JalGyHgt3jiLW22
 clmrtdGoMWWW24qM/HSNZM5Di04rgMc0CM13wKSVjNNP3aThro9OmYa9f
 HnZwGZq8lVVSB4eviqdqOi3g4D5cXCQX/k6zUA+rUtMXO79oBjY2Gu7vi
 Nssu2d/a3b+/Ra9bVc1m3xORfhUyb6qK30eAw3ndcfaj3y/lmKYUFRPaM
 D52UywYIQYhr064YWKm6HTqtDe+9XdlmZyUZw/Br68sMRITBZOB0CpoQy
 XSeu+tEAr8Z6p6vwukl07xZqoxnoYxhaVJ83ruPZiktwlKavuwYJYXyF4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="316687088"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="316687088"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 00:24:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="839520799"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="839520799"
Received: from lhime-mobl1.ger.corp.intel.com (HELO [10.213.220.100])
 ([10.213.220.100])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 00:24:03 -0800
Message-ID: <a56a52dd-7c6b-4d53-57e9-fa0a710223f7@linux.intel.com>
Date: Fri, 3 Feb 2023 08:24:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pxp: limit drm-errors or warnings on
 firmware API failures
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230202081312.404394-1-alan.previn.teres.alexis@intel.com>
 <a459848d-00eb-fbe5-b729-5527a1da6e0f@linux.intel.com>
 <c10f6fb43c64d3b2ea5b2767be7dbca1e8cac0dd.camel@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <c10f6fb43c64d3b2ea5b2767be7dbca1e8cac0dd.camel@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 02/02/2023 17:11, Teres Alexis, Alan Previn wrote:
> On Thu, 2023-02-02 at 08:43 +0000, Tvrtko Ursulin wrote:
>>
>> On 02/02/2023 08:13, Alan Previn wrote:
>>> MESA driver is creating protected context on every driver handle
>>> initialization to query caps bit for app. So when running CI tests,
>>> they are observing hundreds of drm_errors when enabling PXP
>>> in .config but using SOC or BIOS configuration that cannot support
>>> PXP sessions.
>>>
>>> Update error handling codes to be more selective on which errors
>>> are reported as drm_error vs drm_WARN_ONCE vs drm_debug.
>>> Don't completely remove all FW error replies (at least keep them
>>> but use drm_debug) or else cusomers that really needs to know that
>>> content protection failed won't be aware of it when debugging.
>>>
>>> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>>
>> How does this relate to b762787bf767 ("drm/i915/pxp: Use drm_dbg if arb
>> session failed due to fw version") which I thought was already fixing
>> the drm_error spam caused by userspace probing?
>>
> Good question. That previous error was specific to a board that was using
> outdated firmware version that really needed to be upgraded.
> At that point i wasn't aware of the the fact that MESA was seeing
> high frequency of this failure that is tied to platform issues
> (BIOS configuration / SOC fusing). Also, i believe in the prior case
> PXP was not enabled by default the .config in all testing.
> 
> In this latest reported bug (i realized i forgot to include the bug no. for this
> new patch - https://gitlab.freedesktop.org/drm/intel/-/issues/7706#note_1746952),
> i was informed that PXP is being enabled by default and there
> were DUT hardware that was not PXP-capable (SOC fusing / BIOS config).
> 
> So with this patch, i am trying to balance between issues that is critical
> but are root-caused from HW/platform gaps (louder drm-warn - but just ONCE)
> vs other cases where it could also come from hw/sw state machine (which cannot
> be a WARB_ONCE message since it can occur due to runtime operation events).
> 
> One thing to note: i am pushing-for / waiting-on our firmware team to get
> blessing on more fw-error-code to error-string translations that can be allowed
> upstream which is why i added the "pxp_fw_err_to_string" and a single
> "drm_dbg" so that in future, we don't have to keep adding a whole new lines of
> code to multiple functions but just one new error code translation - and instead
> just add the new err-code-to-string entry into a single location.
> 
> note: i will re-rev with the bug id.

Thanks for the details. Yes definitely avoid any drm_warn/err/WARN on 
invalid conditions/usage that can be triggered from userspace.

And given the bug report is about TGL probably try to add a Fixes: tag 
with an appropriate target too, so that there is less bug re-reports 
from the released kernels.

Regards,

Tvrtko
