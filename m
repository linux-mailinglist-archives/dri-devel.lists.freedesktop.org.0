Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689E753F983
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E9D12AF0F;
	Tue,  7 Jun 2022 09:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1656B12AF03;
 Tue,  7 Jun 2022 09:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654593655; x=1686129655;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mRI5uWrUY3BcdWvSJLioGLwL3ooYZl30VQBy6/1yEiw=;
 b=ZtyJ0ZWDP+mBorUfMLnEUeEYJH6fwvISEPWsaSIsyJMx9OWAIYazVdmB
 MVRZCRlqGsWf1UBzq+9XurjLClk827SqERfjUkH4lhHHQXjVFq66F9or4
 yIWQZUwyo3sl3Xcuiery/uoaZ2j8KBQ1W/DO31VDEQHp5MgW8CgciaoIo
 LR//E+AIQEP4QZ90iKbTW5aCivMDbuSy71ReHTfR9N46lwsv5hjs2Q+kU
 8+1LdvewvpnM1O4OCFAjN/5ZlhOcQQa5zaM833jCoP82rpC+jp6jFODQc
 XZtKWG0PPvWuvGS683QjZv6Dfy+BAgM+JpAMtwSEy995WQ2TVML2oNxcS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="256551166"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="256551166"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 02:20:54 -0700
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="636045181"
Received: from bdgardin-mobl1.ger.corp.intel.com (HELO [10.213.217.225])
 ([10.213.217.225])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 02:20:53 -0700
Message-ID: <2fd8b3c5-de0e-19fd-a500-1faf5d5bdb4b@linux.intel.com>
Date: Tue, 7 Jun 2022 10:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/i915/dg2: Catch and log more unexpected values in
 DG1_MSTR_TILE_INTR
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20220524094339.1692212-1-tvrtko.ursulin@linux.intel.com>
 <Yo0bBxHBH8cZcnN4@mdroper-desk1.amr.corp.intel.com>
 <f37468b3-1066-ee4b-fb5b-7664fd180fd6@linux.intel.com>
 <Yo5v7/pLw4eF8xxw@mdroper-desk1.amr.corp.intel.com>
 <53ebd108-c9db-0673-f2c8-5a237dbf354a@linux.intel.com>
 <YpEbfVS5y+yYUddP@mdroper-desk1.amr.corp.intel.com>
 <68da9005-f741-0068-05ce-fbc6674469eb@linux.intel.com>
 <Yp4bblojY+tq66VD@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Yp4bblojY+tq66VD@mdroper-desk1.amr.corp.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/06/2022 16:21, Matt Roper wrote:
> On Mon, Jun 06, 2022 at 12:55:20PM +0100, Tvrtko Ursulin wrote:
>>
>> On 27/05/2022 19:42, Matt Roper wrote:
>>> On Thu, May 26, 2022 at 11:18:17AM +0100, Tvrtko Ursulin wrote:
>>>> On 25/05/2022 19:05, Matt Roper wrote:
>>>>> On Wed, May 25, 2022 at 05:03:13PM +0100, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> On 24/05/2022 18:51, Matt Roper wrote:
>>>>>>> On Tue, May 24, 2022 at 10:43:39AM +0100, Tvrtko Ursulin wrote:
>>>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>>>
>>>>>>>> Catch and log any garbage in the register, including no tiles marked, or
>>>>>>>> multiple tiles marked.
>>>>>>>>
>>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>>>>> ---
>>>>>>>> We caught garbage in DG1_MSTR_TILE_INTR with DG2 (actual value 0xF9D2C008)
>>>>>>>> during glmark and more badness. So I thought lets log all possible failure
>>>>>>>> modes from here and also use per device logging.
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/i915/i915_irq.c | 33 ++++++++++++++++++++++-----------
>>>>>>>>      drivers/gpu/drm/i915/i915_reg.h |  1 +
>>>>>>>>      2 files changed, 23 insertions(+), 11 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
>>>>>>>> index 73cebc6aa650..79853d3fc1ed 100644
>>>>>>>> --- a/drivers/gpu/drm/i915/i915_irq.c
>>>>>>>> +++ b/drivers/gpu/drm/i915/i915_irq.c
>>>>>>>> @@ -2778,24 +2778,30 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>>>>>>>>      	u32 gu_misc_iir;
>>>>>>>>      	if (!intel_irqs_enabled(i915))
>>>>>>>> -		return IRQ_NONE;
>>>>>>>> +		goto none;
>>>>>>>>      	master_tile_ctl = dg1_master_intr_disable(regs);
>>>>>>>> -	if (!master_tile_ctl) {
>>>>>>>> -		dg1_master_intr_enable(regs);
>>>>>>>> -		return IRQ_NONE;
>>>>>>>> +	if (!master_tile_ctl)
>>>>>>>> +		goto enable_none;
>>>>>>>> +
>>>>>>>> +	if (master_tile_ctl & ~(DG1_MSTR_IRQ | DG1_MSTR_TILE_MASK)) {
>>>>>>>> +		drm_warn(&i915->drm, "Garbage in master_tile_ctl: 0x%08x!\n",
>>>>>>>> +			 master_tile_ctl);
>>>>>>>
>>>>>>> I know we have a bunch of them already, but shouldn't we be avoiding
>>>>>>> printk-based stuff like this inside interrupt handlers?  Should we be
>>>>>>> migrating all these error messages over to trace_printk or something
>>>>>>> similar that's safer to use?
>>>>>>
>>>>>> Not sure - I kind of think some really unexpected and worrying situations
>>>>>> should be loud and on by default. Risk is then spam if not ratelimited.
>>>>>> Maybe we should instead ratelimit most errors/warnings coming for irq
>>>>>> handlers?
>>>>>
>>>>> It's not the risk of spam that's the problem, but rather that
>>>>> printk-based stuff eventually calls into the console code to flush its
>>>>> buffers.  That's way more overhead than you want in an interrupt handler
>>>>> so it's bad on its own, but if you're using something slow like a serial
>>>>> console, it becomes even more of a problem.
>>>>
>>>> Is it a problem for messages which we never expect to see?
>>>
>>> Kind of.  While not as catastrophic, it's the same argument for why we
>>> don't use BUG() anymore...when the impossible does manage to happen
>>> there's unnecessary collateral damage on things outside of graphics.  If
>>> we're adding huge delays inside an interrupt handler (while other
>>> interrupts are disabled) that impacts the system-wide usability, not
>>> just our own driver.
>>>
>>> I'd also argue that these messages actually are semi-expected.  Random
>>> bits being set shouldn't happen, but in the world of dgpu's, we do
>>> occasionally see cases where the PCI link itself goes down for reasons
>>> outside our control and then all registers read back as 0xFFFFFFFF,
>>> which will probably trigger error messages here (as well as a bunch of
>>> other places).
>>
>> Could you expand a bit on what is semi-expected and when? I mean the
>> circumstances of PCI link going down. We certainly don't have any code to
>> survive that.
> 
> Yeah, I'm referring to the "Lost access to MMIO BAR" errors; in the past
> most of them have ultimately been tracked down to bugs in early
> firmware, so flashing an updated IFWI/BIOS onto the device usually
> solved the problems.  Generally those buggy firmwares are an internal
> problem that never make it into the wild, but I think we have also seen
> cases where they get triggered by physical/electrical problems on a
> specific part; that can potentially happen to anyone who's unlucky
> enough to get a defective/damaged unit.
> 
> Basically "hardware returns all F's" happens because the CPU initiates
> an MMIO transaction with the hardware, the hardware fails to produce any
> response (possibly due to failing hardware, possibly due to
> firmware/BIOS bugs), so 0xFFFFFFFF gets returned as an autocompletion to
> prevent the CPU core from hanging.
> 
> It looks like we still have a few open here:
> https://gitlab.freedesktop.org/search?search=%22Lost+access+to+MMIO+BAR%22&group_id=2642&project_id=4519&scope=issues&search_code=false&snippets=false&repository_ref=&nav_source=navbar
> 
> and there are some features on specific platforms we haven't turned on
> yet because they also trigger these failures (which is still under
> debug).
> 
> We don't/can't really do much to handle these problems in i915 today
> except printing the 'lost access' error so that we know to ignore
> whatever kinds of bogus errors we get after that point (usually lots of
> messages about forcewake failing to clear, engine/GuC reset failing to
> complete, etc.).  But aside from i915 being broken, the rest of the
> platform should generally continue to work, so you can still access the
> machine over the network, save logs to disk, etc.

Interesting, I missed the addition of 29b6f88d60dd ("drm/i915: Try to 
detect sudden loss of MMIO access"), thanks!

In case of my "Garbage in master_tile_ctl" or "Unexpected irq from 
tile.." messages, in case of lost PCI link they should happen only once. 
I don't think hardware will keep raising interrupts if driver cannot 
talk to it. But it does seem prudent to go with the rate-limiting 
flavour just in case.

Regards,

Tvrtko
