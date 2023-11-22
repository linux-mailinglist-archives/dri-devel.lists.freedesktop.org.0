Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F527F48F7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 15:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AEE10E638;
	Wed, 22 Nov 2023 14:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27F810E638;
 Wed, 22 Nov 2023 14:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700663498; x=1732199498;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=RrCwyVGFk75pPPQKXl6nUmqOg9mIis7+rczuoclH7aA=;
 b=jM5aslGuY8Rfs8cfbuZiI/XpijCyFMQGtp4NnsYe75SYFVXrPkSFPR+3
 YCDKVVqwSyTaIUAdo8qJEPw6NkiW7wakpnF6UeyeL1eza6eMKM3k3yyj8
 NjIDReGzKXzoQvwWZw/8i3OicUu5Q8pQ/pXslnrN6lkwd7znimcV7utcO
 rpH8KhdIIR3sgrSvCyvymuuFvEzuwZtTE0FuKHmkRApafKu9kt5uk8mI/
 g/b0gksyNL5WKNoezKrGM1lcbclTwtnQlRL57MQkrCgwHgEEu5gQO+ENt
 BXO3pH/Ls46tj95v8XXKBS4kS2qHqHf/ruorzxIu0+3ovCavGy9eS2snp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="382459959"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="382459959"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:31:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="15278524"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:31:34 -0800
Message-ID: <07e4bc45-5dcf-4a57-9543-cc981991337d@linux.intel.com>
Date: Wed, 22 Nov 2023 20:04:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 5/5] drm/xe/RAS: send multicast event on occurrence of an
 error
Content-Language: en-US
To: Tomer Tayar <ttayar@habana.ai>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "Hawking.Zhang@amd.com" <Hawking.Zhang@amd.com>,
 "Harish.Kasiviswanathan@amd.com" <Harish.Kasiviswanathan@amd.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "Luben.Tuikov@amd.com" <Luben.Tuikov@amd.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
 <20231020155835.1295524-6-aravind.iddamsetty@linux.intel.com>
 <825661de-922f-459e-b667-b95aa0df7f46@habana.ai>
 <e58e5753-d501-4a5a-86be-4cdebc31a287@habana.ai>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <e58e5753-d501-4a5a-86be-4cdebc31a287@habana.ai>
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


On 11/12/23 20:58, Tomer Tayar wrote:
> On 10/11/2023 14:27, Tomer Tayar wrote:
>> On 20/10/2023 18:58, Aravind Iddamsetty wrote:
>>> Whenever a correctable or an uncorrectable error happens an event is sent
>>> to the corresponding listeners of these groups.
>>>
>>> v2: Rebase
>>>
>>> Signed-off-by: Aravind Iddamsetty<aravind.iddamsetty@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_hw_error.c | 33 ++++++++++++++++++++++++++++++++
>>>    1 file changed, 33 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>>> index bab6d4cf0b69..b0befb5e01cb 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>> @@ -786,6 +786,37 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>>    				(HARDWARE_ERROR_MAX << 1) + 1);
>>>    }
>>>    
>>> +static void
>>> +generate_netlink_event(struct xe_device *xe, const enum hardware_error hw_err)
>>> +{
>>> +	struct sk_buff *msg;
>>> +	void *hdr;
>>> +
>>> +	if (!xe->drm.drm_genl_family.module)
>>> +		return;
>>> +
>>> +	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
>>> +	if (!msg) {
>>> +		drm_dbg_driver(&xe->drm, "couldn't allocate memory for error multicast event\n");
>>> +		return;
>>> +	}
>>> +
>>> +	hdr = genlmsg_put(msg, 0, 0, &xe->drm.drm_genl_family, 0, DRM_RAS_CMD_ERROR_EVENT);
>>> +	if (!hdr) {
>>> +		drm_dbg_driver(&xe->drm, "mutlicast msg buffer is small\n");
>>> +		nlmsg_free(msg);
>>> +		return;
>>> +	}
>>> +
>>> +	genlmsg_end(msg, hdr);
>>> +
>>> +	genlmsg_multicast(&xe->drm.drm_genl_family, msg, 0,
>>> +			  hw_err ?
>>> +			  DRM_GENL_MCAST_UNCORR_ERR
>>> +			  : DRM_GENL_MCAST_CORR_ERR,
>>> +			  GFP_ATOMIC);
>> I agree that hiding/wrapping any netlink/genetlink API/macro with a DRM
>> helper would be sometimes redundant,
>> and that in some cases the specific DRM driver would have to "dirt its
>> hands" and deal with netlink (e.g. fill_error_details() in patch #3).
>> However maybe here a DRM helper would have been useful, so we won't see
>> a copy of this sequence in other DRM drivers?
>>
>> Thanks,
>> Tomer
> After rethinking, it is possible that different DRM drivers will need 
> some flexibility when it comes to calling genlmsg_put(), as they might 
> want to have more of this call in order to attach some data related to 
> the error indication.
> In that case, adding a DRM function that wraps it may me redundant.
> What do you think?
I think we can expose this base level call to every drm driver and if it wants
to add any custom msg would define it own helper that should be ok i believe.


Thanks,
Aravind.
>
>>> +}
>>> +
>>>    static void
>>>    xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>>    {
>>> @@ -849,6 +880,8 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
>>>    	}
>>>    
>>>    	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err), errsrc);
>>> +
>>> +	generate_netlink_event(tile_to_xe(tile), hw_err);
>>>    unlock:
>>>    	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
>>>    }
