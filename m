Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B8D8C3EA2
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 12:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0858910E093;
	Mon, 13 May 2024 10:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CvX0xPhf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA8510E093
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 10:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715595017; x=1747131017;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6OpbpkBu9Jg1cmnWCv22rfrF9CaO4SjdM8G/iaWDs3w=;
 b=CvX0xPhfNz3TxHJCEjIUWMnj5yfNzpOV86Mt9/CE0ZSQgBo/m5fbxbXG
 Ek176QVzAaNMEPLDXI1Oi1d/AnkUCaLZCYfx+KNis77LhDUkhZ5BaX7GT
 AJNJzWP7FqIUa/OhsNfxAe3ek5xv6vLoi9YZYNkzg3VwmWJVN153e7NCp
 NEPpPbUs/T02Q34YiWsM6rWWFu6GO9ZjkdjtGd1yK7PQyzVaiCZUK7kPs
 vA3ZbnGFfgJHk+rvhR20oOqxWgUrNQBF5zLvrKniq10i2UEbmcg61NxbQ
 nljfF0qNDDTOGBN3eCJgVhIr6IiGbK3Mfy5pjcB5X9/dK42AFoVXlro+9 A==;
X-CSE-ConnectionGUID: iJX6v482SOiJMRgSR0fAUg==
X-CSE-MsgGUID: 26wK6qF5SMaD7DzlGTEgpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11356148"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11356148"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:10:17 -0700
X-CSE-ConnectionGUID: leA24JzLQDeVSXR67xgbBw==
X-CSE-MsgGUID: ovfn1LKJRbCHvyWFpILODg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30276277"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.246.3.118])
 ([10.246.3.118])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:10:15 -0700
Message-ID: <3f0389d2-8cee-4258-bf38-ba6427515dde@linux.intel.com>
Date: Mon, 13 May 2024 12:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] accel/ivpu: Implement support for hardware scheduler
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, "Wachowski, Karol" <karol.wachowski@intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
 <20240508132106.2387464-7-jacek.lawrynowicz@linux.intel.com>
 <bc64b7c8-745b-1617-035c-b32f44ad0323@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <bc64b7c8-745b-1617-035c-b32f44ad0323@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10.05.2024 18:41, Jeffrey Hugo wrote:
> On 5/8/2024 7:21 AM, Jacek Lawrynowicz wrote:
>> +#define IVPU_FOCUS_PRESENT_TIMER_MS 1000
>> +
>>   static char *ivpu_firmware;
>>   module_param_named_unsafe(firmware, ivpu_firmware, charp, 0644);
>>   MODULE_PARM_DESC(firmware, "NPU firmware binary in /lib/firmware/..");
>> @@ -467,6 +469,10 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
>>            boot_params->punit_telemetry_sram_size);
>>       ivpu_dbg(vdev, FW_BOOT, "boot_params.vpu_telemetry_enable = 0x%x\n",
>>            boot_params->vpu_telemetry_enable);
>> +    ivpu_dbg(vdev, FW_BOOT, "boot_params.vpu_scheduling_mode = 0x%x\n",
>> +         boot_params->vpu_scheduling_mode);
>> +    ivpu_dbg(vdev, FW_BOOT, "boot_params.vpu_focus_present_timer_ms = %u\n",
>> +         boot_params->vpu_focus_present_timer_ms);
> 
> The timer value is hard coded.  Does that not make this log message redundant?

Yes, I will remove it.
