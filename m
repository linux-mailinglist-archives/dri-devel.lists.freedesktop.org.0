Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9D73C7B21
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 03:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DC46E154;
	Wed, 14 Jul 2021 01:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0A46E153;
 Wed, 14 Jul 2021 01:40:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="197454962"
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; d="scan'208";a="197454962"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 18:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; d="scan'208";a="494004087"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga001.jf.intel.com with ESMTP; 13 Jul 2021 18:40:51 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 13 Jul 2021 18:40:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Tue, 13 Jul 2021 18:40:51 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 13 Jul 2021 18:40:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDRmyuXgDTUBl8THix8k55f0WmJp5VvzV7fdrBDvrYJt+WzQCL+Ttp71SwvIzvL6Y+wAApxo3A4QoCDkJl48nrxOmFC3YLXKrRgH+Y4dU0QBONvY7R89IFevNXC7SpbqEeDf38KugMLHZe736ISlZoYPlOpYa+zk7L8NGObK7Uc9ZXahvJZ6hYKY1473a4pPqB0Yl5Ep0FvmIVgHsOnfR84oe2zaR3eBM/Xh+fEWM3X9pRPDDU0RtR44byFZxlCLPSiELZJNqtDgO5HSW5RSFGjbG2rLmr/OKBY97bQagvrpTzg6/CMWskvZmU+JSD33PQiQTTPwdPMxuhpevc68pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ei/mD/OZt2xniMaDrnBJvC4chNM6m2/4NIyE9+hnh+M=;
 b=FmzT3kU0ws1vl/siRASt+pgYFURz6z8KtSWLyPkxy6N48ZkeYMt0ty8x9lzNz9ezaohhIS5dsJCs9IanBHFUoQU3Nx/d8ugQEW+MJdZaghhTWAkwFfDUO+sy0d3nsYcQgWZyNCbtb0MpJal0kSujGuRqi5d0nbDGdsqrOugFWFyh7IBR0BfQHykZHaUkGT0oWIX/LegChdkaBLSID1RCkIj1re4GDI+CptcOjYbBnPIsONhDdDHSCYx4k/UiTnVNlfyu52qqfudgJKYQ81MeZNhMfJNwgUILm08qjvyIl5bqKXpZDdbYI8L7r83xmkRg5LfHzc8ZPLpV4gxose7UfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ei/mD/OZt2xniMaDrnBJvC4chNM6m2/4NIyE9+hnh+M=;
 b=TeCPsJQyIYrJ+5NbPonq3tCB80QeEU6fI2AqLpHjFGekJphiyOouEs9KZABNmko2iEzlNfXH+kKzO/oe2f/RtmMawTb1eOBGH8goXhMW1uQLSUY6NafxSAW2JTSOuSxjSQ9J0pT5p4O/10uCQa/JuWhIdWuxDwfD47hoT5UTh+Q=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 14 Jul
 2021 01:40:50 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 01:40:50 +0000
Subject: Re: [PATCH 06/16] drm/i915/guc/slpc: Allocate, initialize and release
 slpc
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-7-vinay.belgaumkar@intel.com>
 <d561e568-5e4e-f038-9d99-75d75a43951a@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <e486e152-1327-37a9-3653-d0909044ba21@intel.com>
Date: Tue, 13 Jul 2021 18:40:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <d561e568-5e4e-f038-9d99-75d75a43951a@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR1601CA0015.namprd16.prod.outlook.com
 (2603:10b6:300:da::25) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 MWHPR1601CA0015.namprd16.prod.outlook.com (2603:10b6:300:da::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 14 Jul 2021 01:40:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80eb5255-8348-4e5d-328c-08d9466868d9
X-MS-TrafficTypeDiagnostic: CO6PR11MB5585:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB55851E365CD6B142F071290785139@CO6PR11MB5585.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V+CihIy2C28F/MFos4y6RiCAJow8gvYjABc0+lgSnqNWArMlqcqXATQgMOXGLDAI1lJuZ17rlKoPrIp3t0K3lGnxPyi+ER93FSYbDUQC/uU37eXLrmwqcjIvsygj5QS8myIZpRDH5bE8wBOCiihNcMe8mvX12iuzz7W9sOKknt865buD/3DndjWFZMiVspLzNLFXAzUMzoYxQOhUd0BNxO49vDptwkpOYi39OJN+KBXZ+oXOaiTuxEdPy2Npy/i+tsbjNxQZZMvgQzGdbqHptJ3Q9xKbkb1peeDyo6rW+DOdvGy8C4Hy2U2sFFe7UunM0XMyT9x56ScUIp8ii9CMycQZpDlNH+CQUyYl6eDQ4xIol6XIJMzBEY++z1Y5euGc4inayPcQhaOh3MD6kJN10iLGJP8q7imc+0sx/yQ/jXI0DYN3lCusAWGW6sR1YV51UEwwEeUDD/iwQnhbGovLXvhpvC9CrxEctlaLmnKdnWdXX/9iAzBTqLyLt1eijFNLkd3EprFnYp6/rhnDM3Ebi6qejycXUos/hO3e0SH3KyjE3Mhb08p7OqGTkpFLpEKHCz8xsTRW3tsP2P0pPicDcFL66+Ns06kd015EoP3dQdq8lzZAzjw2gkp/BdwCDf8pzULfK3Q1u5hsA+Gdae1zdrPw2U21h6IWkJ8hjW6ikIROMgeZO0lTeFz+hhOiahBg/oCsFYcW0XKCR6tniylWEgs4xFAnnUqKpq1F0vZ0ZJNBrVZPzKOeHV7BYGEOEc87
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(186003)(6486002)(86362001)(316002)(16576012)(83380400001)(450100002)(8936002)(5660300002)(26005)(4326008)(107886003)(53546011)(31696002)(8676002)(66556008)(2616005)(38100700002)(956004)(36756003)(478600001)(2906002)(31686004)(66946007)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmJlUG5tcnluRSs3THFBUmZ6YTUrTDVMdyt4K2I0Vis4c3RSR1lXZjBVQTZT?=
 =?utf-8?B?ZGhET1lYY3ZmTkR1RHVxMis3RGRIL0N1Q3hibzZ5ZHVvVk4xbVZOaisrKzVo?=
 =?utf-8?B?Y1Nid3FZajBDUG5iZmZ2SGZzRUo2Mkl0ZVg0Z25zMUowUHhvLzNRUWJmSTND?=
 =?utf-8?B?amZjRjZWYlp4UTBDM0VQaXR3VExVazE4dnpML1IvbGZXMnJneTdpV2grRXpY?=
 =?utf-8?B?ZzdSMDFHSkpvUnZ6NXZEczg4YStiejEvTGtVMHdlRGpyT0tHK1ZMbThwZnJT?=
 =?utf-8?B?dFQwdVVveTdiNzVta0lXd09nK3hYanNrd3NWZkpQQURmdVNya1p4cG1WTXlG?=
 =?utf-8?B?dWZ2QlBEOGhod1Jna2dPTldGOGxoOGE0WERpeDE4aWV2ZlBvdWhMS1ZGcGNs?=
 =?utf-8?B?L0VRUXJUeG0rQU5SdE51OFFnQkZCMEQ3TEQrVXlTRk1FLzdTSnExbERFOTNS?=
 =?utf-8?B?SHd1OEM2SXZWL0NjdlF1ZnAwZEU3QmpOazh3VURJWTAvYzYwS3kzaWMwbU9x?=
 =?utf-8?B?ZmdPcms0Y1gxMW05NUdHY1RKSkE4ZjhRVUxaZzM3QnZaaytJVmgxdE9MQ3Bn?=
 =?utf-8?B?SUNsZ3pPbVJVUmZoSFNYZ0dLNVhuN2UwaGYyMWE0MlhRYnRiSFlLM1lXREJy?=
 =?utf-8?B?dlE3dEFGWXNiQ3I2QWtOLytPak4rT28zeDV0Unc0ZnhMSmRUUkZZTmRkVmRk?=
 =?utf-8?B?MTlHRXRsSCtxWTlYc1NTbVhEZEFjRWl5WVdIckxBbURwTXE5TFR5a2VIMU42?=
 =?utf-8?B?Q05VdjROUURaTm5OVTFzNXdrUkFUZy8xS0lzWDBnOTdaS0tYVmxRc0lJM0Mr?=
 =?utf-8?B?UW56QmVWT1QvZE9YRjlCakZOWlFkUDJ6VzVnRGVPR3EybHRRVnRTemhyTGYw?=
 =?utf-8?B?VHBiOEx3OFNHZEVJNEtwK21OcmtRbitBWlkwemxlRDdKMTNucDZTWlFlMWdl?=
 =?utf-8?B?L0hBZnNxblZJUkJ3SlI4MHBZVDhZSm1JTlkrTkFVbFdoUk1vUU1IVnRVSVow?=
 =?utf-8?B?S2syeWEydGRKRTlON0ZmVXZVQUh2VEFWcnNvRnd4Z2FkU2N6VFI2bFlsM3M3?=
 =?utf-8?B?TklLQzR6b2FmSmtnSXU1QWV1U3F3eG82bXRjNjNnWWhYUlVvZGx0dmx1RGI5?=
 =?utf-8?B?bXVPWmlCWnN4OFNaOUR5My8xdmM5dFQ4dUxTUGJQbGFKTk9rSmRoek5yTWRl?=
 =?utf-8?B?OGltTTlBdGw5RVdCcjUxWVkySUc1a3lSZUhNSmx4anJpS3k3Z0VPUnlod1A5?=
 =?utf-8?B?aDU4c3lESmhZQU5aMXIxQ1RaVHRrMW1reUV2QVdkekZwbWR1UTVuTDl5dzFH?=
 =?utf-8?B?Y2FsTXF4Uk15U0tHMG9yaWczUm43Q0ZaUlJwbnFuZkZWeVRlbWg3MVlCNFBZ?=
 =?utf-8?B?Qk04NzJvNUMvWlZlMkRWU2k3MERwaUJhZXl4eTUzU3h5NWNpeHVzTkp0dTNC?=
 =?utf-8?B?bU1GZVIvZWpxM1ZWam5FdmQzYmQ0aEVVWWdDTmwvb3lBU1l5dklRRkpmRjVB?=
 =?utf-8?B?S0NsUHFad254SjBsRmJiOEtUeWVKVldFMGdQUlowVzFxSDRCaWNIM3JRRmFM?=
 =?utf-8?B?VGJ1clRlSEpuRmhtTDlVd0Q0WTVBNjhkaSt3YVJUcVhxV1NRTk9xZHlwdW15?=
 =?utf-8?B?czN6ajJCb0YxbEVyeFlJekVXMFA2OURmTlZtWTA0dWJ5aXY3dCtybHRJUUV0?=
 =?utf-8?B?REFYMGsvZDl3WHY2ZmY4S1h6eFFkb0ZwN1FCWVpqYi9YRUd2bXNtSjFYaCsy?=
 =?utf-8?Q?kGxWClx9KJji3UkXWccBlf1DD77wmtSUKYC11qt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80eb5255-8348-4e5d-328c-08d9466868d9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 01:40:50.0030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VlnTPUe+4ikWMqnvm072aMVHLO+4BiYSksF9J2rdKv8XV1iACFMuQKZy23wcy3v4+/jC+AAFHB8RnT+KHblFr9/M+sI5RNIXbNFxKPeSbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
X-OriginatorOrg: intel.com
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
Cc: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/10/2021 9:05 AM, Michal Wajdeczko wrote:
> 
> 
> On 10.07.2021 03:20, Vinay Belgaumkar wrote:
>> Allocate data structures for SLPC and functions for
>> initializing on host side.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 11 +++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 36 ++++++++++++++++++++-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h | 20 ++++++++++++
>>   3 files changed, 66 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index 9d61b2d54de4..82863a9bc8e8 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -336,6 +336,12 @@ int intel_guc_init(struct intel_guc *guc)
>>   			goto err_ct;
>>   	}
>>   
>> +	if (intel_guc_slpc_is_used(guc)) {
>> +		ret = intel_guc_slpc_init(&guc->slpc);
>> +		if (ret)
>> +			goto err_submission;
>> +	}
>> +
>>   	/* now that everything is perma-pinned, initialize the parameters */
>>   	guc_init_params(guc);
>>   
>> @@ -346,6 +352,8 @@ int intel_guc_init(struct intel_guc *guc)
>>   
>>   	return 0;
>>   
>> +err_submission:
>> +	intel_guc_submission_fini(guc);
>>   err_ct:
>>   	intel_guc_ct_fini(&guc->ct);
>>   err_ads:
>> @@ -368,6 +376,9 @@ void intel_guc_fini(struct intel_guc *guc)
>>   
>>   	i915_ggtt_disable_guc(gt->ggtt);
>>   
>> +	if (intel_guc_slpc_is_used(guc))
>> +		intel_guc_slpc_fini(&guc->slpc);
>> +
>>   	if (intel_guc_submission_is_used(guc))
>>   		intel_guc_submission_fini(guc);
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index c1f569d2300d..94e2f19951aa 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -4,11 +4,41 @@
>>    * Copyright © 2020 Intel Corporation
>>    */
>>   
>> +#include <asm/msr-index.h>
> 
> hmm, what exactly is needed from this header ?

Was being used in a previous version for MSR reads, removed.

> 
>> +
>> +#include "gt/intel_gt.h"
>> +#include "gt/intel_rps.h"
>> +
>> +#include "i915_drv.h"
>>   #include "intel_guc_slpc.h"
>> +#include "intel_pm.h"
>> +
>> +static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
>> +{
>> +	return container_of(slpc, struct intel_guc, slpc);
>> +}
>> +
>> +static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +	int err;
>> +	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
> 
> move err decl here
> 
>> +
>> +	err = intel_guc_allocate_and_map_vma(guc, size, &slpc->vma, &slpc->vaddr);
>> +	if (unlikely(err)) {
>> +		DRM_ERROR("Failed to allocate slpc struct (err=%d)\n", err);
> 
> s/slpc/SLPC
> 
> and use drm_err instead
> and you may also want to print error as %pe

added.

> 
>> +		i915_vma_unpin_and_release(&slpc->vma, I915_VMA_RELEASE_MAP);
> 
> do you really need this ?

removed.
> 
>> +		return err;
>> +	}
>> +
>> +	return err;
>> +}
>>   
>>   int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>   {
>> -	return 0;
>> +	GEM_BUG_ON(slpc->vma);
>> +
>> +	return slpc_shared_data_init(slpc);
>>   }
>>   
>>   /*
>> @@ -31,4 +61,8 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   
>>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
>>   {
>> +	if (!slpc->vma)
>> +		return;
>> +
>> +	i915_vma_unpin_and_release(&slpc->vma, I915_VMA_RELEASE_MAP);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> index 98036459a1a3..a2643b904165 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -3,12 +3,32 @@
>>    *
>>    * Copyright © 2020 Intel Corporation
>>    */
>> +
> 
> should be fixed in earlier patch
> 
>>   #ifndef _INTEL_GUC_SLPC_H_
>>   #define _INTEL_GUC_SLPC_H_
>>   
>> +#include <linux/mutex.h>
>>   #include "intel_guc_slpc_fwif.h"
>>   
>>   struct intel_guc_slpc {
>> +	/*Protects access to vma and SLPC actions */
> 
> hmm, missing mutex ;)

Removed.

> 
>> +	struct i915_vma *vma;
>> +	void *vaddr;
> 
> no need to be void, define it as ptr to slpc_shared_data
> 
>> +
>> +	/* platform frequency limits */
>> +	u32 min_freq;
>> +	u32 rp0_freq;
>> +	u32 rp1_freq;
>> +
>> +	/* frequency softlimits */
>> +	u32 min_freq_softlimit;
>> +	u32 max_freq_softlimit;
>> +
>> +	struct {
>> +		u32 param_id;
>> +		u32 param_value;
>> +		u32 param_override;
>> +	} debug;
> 
> can you add all these extra fields in patches which will need them?
> 
> Michal

Done.

Thanks,
Vinay.

> 
>>   };
>>   
>>   int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
>>
> 
