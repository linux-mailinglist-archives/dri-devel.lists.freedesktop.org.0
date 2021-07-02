Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CE53BA1F9
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 16:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6DF89DC9;
	Fri,  2 Jul 2021 14:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6B089DC9;
 Fri,  2 Jul 2021 14:08:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="206912978"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="206912978"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 07:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="409322413"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga006.jf.intel.com with ESMTP; 02 Jul 2021 07:08:38 -0700
Received: from [10.249.132.69] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.132.69])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 162E8bWs017763; Fri, 2 Jul 2021 15:08:37 +0100
Subject: Re: [PATCH 47/47] drm/i915/guc: Unblock GuC submission on Gen11+
To: Martin Peres <martin.peres@free.fr>,
 Matthew Brost <matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-48-matthew.brost@intel.com>
 <88cbe963-7188-f4ae-5acf-01a80bd2fe25@free.fr>
 <20210630180052.GA8283@sdutt-i7>
 <7c3e1d46-74eb-6f2d-53ca-d73ce9e61c03@free.fr>
 <d9e31651-dd97-fb39-0045-7cd62650bd03@free.fr>
 <2d649c1a-82fc-cced-4020-f7d9d96c3bc4@intel.com>
 <040272cf-cbd5-73ef-c763-71948474be82@free.fr>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <9a9dbff8-6d92-fc92-4cf3-26679f2cb27c@intel.com>
Date: Fri, 2 Jul 2021 16:08:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <040272cf-cbd5-73ef-c763-71948474be82@free.fr>
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



On 02.07.2021 15:12, Martin Peres wrote:
> On 02/07/2021 16:06, Michal Wajdeczko wrote:
>>
>>
>> On 02.07.2021 10:13, Martin Peres wrote:
>>> On 01/07/2021 21:24, Martin Peres wrote:
>>> [...]
>>>>>
>>>>>>
>>>>>>> +        i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
>>>>>>> +        return;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    /* Default: enable HuC authentication and GuC submission */
>>>>>>> +    i915->params.enable_guc = ENABLE_GUC_LOAD_HUC |
>>>>>>> ENABLE_GUC_SUBMISSION;
>>>>>>
>>>>>> This seems to be in contradiction with the GuC submission plan which
>>>>>> states:
>>>>>>
>>>>>> "Not enabled by default on any current platforms but can be
>>>>>> enabled via
>>>>>> modparam enable_guc".
>>>>>>
>>>>>
>>>>> I don't believe any current platform gets this point where GuC
>>>>> submission would be enabled by default. The first would be ADL-P which
>>>>> isn't out yet.
>>>>
>>>> Isn't that exactly what the line above does?
>>>
>>> In case you missed this crucial part of the review. Please answer the
>>> above question.
>>
>> I guess there is some misunderstanding here, and I must admit I had
>> similar doubt, but if you look beyond patch diff and check function code
>> you will find that the very condition is:
>>
>>     /* Don't enable GuC/HuC on pre-Gen12 */
>>     if (GRAPHICS_VER(i915) < 12) {
>>         i915->params.enable_guc = 0;
>>         return;
>>     }
>>
>> so all pre-Gen12 platforms will continue to have GuC/HuC disabled.
> 
> Thanks Michal, but then the problem is the other way: how can one enable
> it on gen11?

this code here converts default GuC auto mode (enable_guc=-1) into per
platform desired (tested) GuC/HuC enables.

to override that default, you may still use enable_guc=1 to explicitly
enable GuC submission and since we also have this code:

+static bool __guc_submission_supported(struct intel_guc *guc)
+{
+	/* GuC submission is unavailable for pre-Gen11 */
+	return intel_guc_is_supported(guc) &&
+	       INTEL_GEN(guc_to_gt(guc)->i915) >= 11;
+}

it should work on any Gen11+.

Michal

> 
> I like what Daniele was going for here: separating the capability from
> the user-requested value, but then it seems the patch stopped half way.
> How about never touching the parameter, and having a AND between the two
> values to get the effective enable_guc?
> 
> Right now, the code is really confusing :s
> 
> Thanks,
> Martin
> 
>>
>> Thanks,
>> Michal
>>
