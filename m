Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C7442A800
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 17:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5956089D61;
	Tue, 12 Oct 2021 15:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F6489D61;
 Tue, 12 Oct 2021 15:13:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="227463348"
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="227463348"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 08:12:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="441907173"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga003.jf.intel.com with ESMTP; 12 Oct 2021 08:12:47 -0700
Received: from [10.252.61.52] (mwajdecz-MOBL.ger.corp.intel.com [10.252.61.52])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 19CFCjhW027256; Tue, 12 Oct 2021 16:12:46 +0100
Message-ID: <c5db2912-bfb8-746e-2421-eb0ae0d6a29c@intel.com>
Date: Tue, 12 Oct 2021 17:12:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.0
Subject: Re: [PATCH 4/4] drm/i915/guc: Inject probe errors for CT send
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>,
 Thanneeru Srinivasulu <thanneeru.srinivasulu@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20211011152106.3424810-1-thanneeru.srinivasulu@intel.com>
 <20211011152106.3424810-5-thanneeru.srinivasulu@intel.com>
 <20211011180050.GA29821@jons-linux-dev-box>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20211011180050.GA29821@jons-linux-dev-box>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11.10.2021 20:00, Matthew Brost wrote:
> On Mon, Oct 11, 2021 at 08:51:06PM +0530, Thanneeru Srinivasulu wrote:
>> Inject probe errors -ENXIO, -EBUSY for CT send.
>>
>> Signed-off-by: Thanneeru Srinivasulu <thanneeru.srinivasulu@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> index 83764db0fd6d..8ffef3abd3da 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> @@ -765,6 +765,14 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
>>  	u32 status = ~0; /* undefined */
>>  	int ret;
>>  
>> +	ret = i915_inject_probe_error(ct_to_i915(ct), -ENXIO);
>> +	if (ret)
>> +		return ret;
>> +
> 
> I don't see where -ENXIO is returned during an error that we handle
> unless I am missing something. If we don't return -ENXIO anywhere else I
> don't think we need to inject this error.

but the point of this exercise is not to handle such error but to
gracefully abort probe without panic or leaks. note that we are already
using -ENXIO in many other injected failure points (mostly in uc code)

thus for me above change is also fine and the whole series is:

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

-Michal

> 
> Matt 
> 
>> +	ret = i915_inject_probe_error(ct_to_i915(ct), -EBUSY);
>> +	if (ret)
>> +		return ret;
>> +
>>  	if (unlikely(!ct->enabled)) {
>>  		struct intel_guc *guc = ct_to_guc(ct);
>>  		struct intel_uc *uc = container_of(guc, struct intel_uc, guc);
>> -- 
>> 2.25.1
>>
