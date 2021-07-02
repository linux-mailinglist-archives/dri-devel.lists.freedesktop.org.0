Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2BE3BA0E8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 15:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0763B6E17B;
	Fri,  2 Jul 2021 13:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACAF6E176;
 Fri,  2 Jul 2021 13:06:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="205721414"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="205721414"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 06:06:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="559035941"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga004.jf.intel.com with ESMTP; 02 Jul 2021 06:06:36 -0700
Received: from [10.249.132.69] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.132.69])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 162D6ZWh032744; Fri, 2 Jul 2021 14:06:35 +0100
Subject: Re: [PATCH 47/47] drm/i915/guc: Unblock GuC submission on Gen11+
To: Martin Peres <martin.peres@free.fr>,
 Matthew Brost <matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-48-matthew.brost@intel.com>
 <88cbe963-7188-f4ae-5acf-01a80bd2fe25@free.fr>
 <20210630180052.GA8283@sdutt-i7>
 <7c3e1d46-74eb-6f2d-53ca-d73ce9e61c03@free.fr>
 <d9e31651-dd97-fb39-0045-7cd62650bd03@free.fr>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <2d649c1a-82fc-cced-4020-f7d9d96c3bc4@intel.com>
Date: Fri, 2 Jul 2021 15:06:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d9e31651-dd97-fb39-0045-7cd62650bd03@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 john.c.harrison@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 02.07.2021 10:13, Martin Peres wrote:
> On 01/07/2021 21:24, Martin Peres wrote:
> [...]
>>>
>>>>
>>>>> +        i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    /* Default: enable HuC authentication and GuC submission */
>>>>> +    i915->params.enable_guc = ENABLE_GUC_LOAD_HUC |
>>>>> ENABLE_GUC_SUBMISSION;
>>>>
>>>> This seems to be in contradiction with the GuC submission plan which
>>>> states:
>>>>
>>>> "Not enabled by default on any current platforms but can be enabled via
>>>> modparam enable_guc".
>>>>
>>>
>>> I don't believe any current platform gets this point where GuC
>>> submission would be enabled by default. The first would be ADL-P which
>>> isn't out yet.
>>
>> Isn't that exactly what the line above does?
> 
> In case you missed this crucial part of the review. Please answer the
> above question.

I guess there is some misunderstanding here, and I must admit I had
similar doubt, but if you look beyond patch diff and check function code
you will find that the very condition is:

	/* Don't enable GuC/HuC on pre-Gen12 */
	if (GRAPHICS_VER(i915) < 12) {
		i915->params.enable_guc = 0;
		return;
	}

so all pre-Gen12 platforms will continue to have GuC/HuC disabled.

Thanks,
Michal
