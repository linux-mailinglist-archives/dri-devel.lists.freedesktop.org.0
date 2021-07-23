Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4C83D40BB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 21:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CEB6FCF0;
	Fri, 23 Jul 2021 19:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332E06FCED;
 Fri, 23 Jul 2021 19:28:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="211658938"
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; d="scan'208";a="211658938"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 12:28:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; d="scan'208";a="663393497"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jul 2021 12:28:28 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 23 Jul 2021 12:28:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 23 Jul 2021 12:28:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 23 Jul 2021 12:28:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwQZLDgy1O0cM6Cu2ULKZuHxjn19o25fUNC5K0QyZhPxw0c3e7ucVlC8JqGVi/6eJ+JYGdZD/gNrAajPgK4yn7E8hke0/gmUxiRCE3qcyU+Ek9qlO3b375QkFzyuGKwYh03by40wbcrtbEEVSwmUizQ21ZB4GF1RTH9OTGuHhQBrHPYa4e0HtmJweqLIE9ags9IotxrWPNt6L6MxtmFUossrFzOskzU2C1NEZg0DNDpR3cU+fNI6AkDmRK8y4/G8swfBTLhR0Qy9Rp9abwq2pK95lk/DEF3fKP3tqOaZvTv1sHG3Ch0j/Br3vUKDbpYMqIGnhgVp43G0FMsihgqm7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfTCQmxCTAncMGJD0BVxRwG/oaPoD82j+akvpVtl+j8=;
 b=k65AwXqn+2p1Wi1LwXau4NwNQ5fFjV27AYWUbLOCqGX7mzFzZjLRlB7Gkirtq7HTrFlywEkU+2QzvioD3IDpH3jPkAPNTLMVASMCI87xeu2hk/ersXET12/386d4gb72fFFcBkehTfkryxfZq40cQU4zxtbMsel0X+R37C7iNw69hxSNpLlyRn84fpzLwoB+89PY+YGToH0F/9TtvuBEs8SWxDASYNwbvBybK5y1pJn+GusgvstPgEjzNlelC+EUYs8WYj+bEoirShw/AZEHUPqLr+fkc2LktqLIz/1AXir8Ez2OJl246junZUtx8y6xYN1jMMHcbGzpWjd9PXT4Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfTCQmxCTAncMGJD0BVxRwG/oaPoD82j+akvpVtl+j8=;
 b=IFwl2x+6WE6j9AAAnr2yaYAqUjBFnYbwGFMIfJpcbR/RTJxS8F2vRktzqAx0h2ZmICmc2CUys7QEQxibucAoV4gJvJk22GikcaPOM2O5ouppSsmVMwfuUUjkk7T9pmBWqrKzhbnbL9uc+3jRTRSrZw0vBgcf6CrPkwbCFPmy1yw=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5603.namprd11.prod.outlook.com (2603:10b6:5:35c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Fri, 23 Jul
 2021 19:28:26 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 19:28:26 +0000
Subject: Re: [PATCH 06/14] drm/i915/guc/slpc: Enable SLPC and add related H2G
 events
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
 <20210721161120.24610-7-vinay.belgaumkar@intel.com>
 <4f6bbfd1-42a3-a1b6-ca13-f9022bc39fab@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <86aa07c9-92bb-4239-a3ae-77f035ac001d@intel.com>
Date: Fri, 23 Jul 2021 12:28:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <4f6bbfd1-42a3-a1b6-ca13-f9022bc39fab@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:254::20) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 BY3PR05CA0015.namprd05.prod.outlook.com (2603:10b6:a03:254::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend
 Transport; Fri, 23 Jul 2021 19:28:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d24dd4da-25ba-4629-93d6-08d94e100af9
X-MS-TrafficTypeDiagnostic: CO6PR11MB5603:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB56033A28BD7F8767969FE8C185E59@CO6PR11MB5603.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:403;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1efOLItpg4lPDyRoto0FOfb0Z9LgRQQD4qpgGG8vEP/l2ebq0hkMdzuEcX7lzOPOtgTKaO36DQjtYKwhO9JFSZS2rpgZzHX1xwGl9ENV7on+Jr0tR1MbUOKeUwQQzUWl+4tiAeXeTYj36hKZzN4czFxY2w4TW5k/av95Y/GgoCDvQsJj6gEIhAmz6p/x6vKByRMFKWFPz2ri+eqyALzeBfDZ6xkdwiwriNrzzSrQ80V4ejY+8PvrO1eIJ4ddk36S6BycxNVcb+nttMaVQKknNzOBGotmzoEOTN1dSIBzu+1yrBlIuLFPj9p3BPFroCefj9aGcnNthuWQCUjrQTZ5wEGajGCWu+OUMjZWSjyQYbKYavcV8S8MJqtj24hkxAnWnmZez7RP/ZRNt5iV7cA95mitoy9qUhnvsA1GthmQrDobfwDS76ovmd/CZE4T3M7vpc0yaeDAs2+U4sclaJtpQkAIrVZfzXuyuqdzBm33B58rxBe9SK9kQ8gCZPCQSKIrAoHjd4J35vAh0OeLtU5m7YkvXL8zC8mo5XKyizP0nuvAQdwblHHp8rprIUR1XocEDikYTgYA2SZg3hNQpxSWXm8uS3IJVeb6fcygXCWpnxaI6sgOppBIe+q5Zrn/pfr+Xq7Q9nTEb00bH1Q/4dxCpZM+aJpI7UH2ymiwjxOB4iVgKLo8CB0AqccHEBM/COYpgc31hgEgNTik1pH7K/2+KMH/YDBftzYazPor0UmFdHQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(8936002)(107886003)(66556008)(66476007)(4326008)(956004)(450100002)(316002)(2906002)(2616005)(16576012)(186003)(30864003)(53546011)(66946007)(26005)(5660300002)(478600001)(8676002)(6486002)(38100700002)(83380400001)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek5DNFBSNlhPMENCdzZjaHd5N3VBdXMyc21XdmliRW1MMjQ4cXRqQjdjUHlj?=
 =?utf-8?B?WnBUYi83QUlvbGxtMnIzSVRiMlBickE4Y0dBRjVLb1VDc01MVUs4NXpvclVY?=
 =?utf-8?B?UUdBci92dmZ2aUtqSktWMUlvQ3NIaEVqL2lOUU8vUlRiMDM4YVh6OEt2RGtN?=
 =?utf-8?B?amRpMlJpTjIzWXpCRWRvdXFnNTdVMHl4YzBPaG9WZUphVEJlKytpbEd3VHVO?=
 =?utf-8?B?N256UTZ1WkhjWlNiUjVaLzVqK0FmczRObTlVNkRTVkFSZDNXZTJDWG50MGVr?=
 =?utf-8?B?YjRJalV2VTBFMzB3QzZzOUhzZWtzejFtWGJkY3E2L2RqSTdNWGpFQ2I2blN5?=
 =?utf-8?B?SVVtM29YeWladmpsNFlqbk9acnE5RGJiVXBTUlphRW1BcGlmT1lFVmlNS1J5?=
 =?utf-8?B?ejdpMHc5b2VIbG1xMXJHRmkrTzNkWkF0UUtveHRiWFdtUmRFNTZZNSswcWQx?=
 =?utf-8?B?NGVlaFUzV0hGNzBRckI0c3BrSFF2RVRKSEwybUgxM3BjVnM0VzZIN0I5Lzc2?=
 =?utf-8?B?MG1sdk9UVHlySUNpcWozRE1sQldMZjBuTUlsK0lXZjNqOHBzK1JiMEtzdjg0?=
 =?utf-8?B?eVhNbGVsK3kzVkFYNTd1eFZqT1BYL0MzT1JNbjljbERoei9PZ0JFZHFzVnBY?=
 =?utf-8?B?aUZaUWl5ZlVJdS9XOUFsUzJ2cjVLblo5RXAwZDhFUlUvbXBMYjN6eDlwNWJw?=
 =?utf-8?B?V0FOSjhQeWlNVEcrUVRrT3pYSG9pWUgxVmFXR0t2cHlyN1pid1lwTVI3aXNB?=
 =?utf-8?B?REx1QlZzR1U4ZVNMQU5iUmVNUktzNlQ4OHpxVUhmMW5ySW9XWGg0bmUvUGcy?=
 =?utf-8?B?MWlMUEF3cnliV09XVmc4QkdNOGdnUmVLOXY5eTJmV2RLVlZFdmN5MUR0eWI5?=
 =?utf-8?B?NVJPdzFNcGVwak44dmFOVm4vQmxJQWpkT1ZHTnVJRDJ1cFRJUlJvZG1SU2dY?=
 =?utf-8?B?SFF2bkN1cDFhRVFmdHErMkdLSzJtZWF1L2FVeUZzRllpdEQ2bU9zbWJETFov?=
 =?utf-8?B?SFA2RjJ5MkhWUThWa3BCaGsrZzBEdVFIMnVGR25UZHNSVVYzQXZ0UW1QUEV6?=
 =?utf-8?B?ODRRNlM2dTNyalRrMFZVR055N1pjVWdRc0tHaHB0VHRuVERyUldsOHFJc0lS?=
 =?utf-8?B?b1hmak5WSUZhQWZZNFl4b3hzdTA2RWs1bk1Qc0dPUUlpL1lxa2ZvT3BMVGNM?=
 =?utf-8?B?YVhWWmVIdjBtQ01jZjQwbVhTcU42SnlyQWdTaGhSZzZ1L0gwK2ZnMFRoN21v?=
 =?utf-8?B?bWt1TTZYdmEzaSswb0dFUHlnVi9XamtTVk1odTJqN2tPdXovMjM5M1dFc2or?=
 =?utf-8?B?eExOdyt4LzE5b0w0V3drZDUvVllkaHpQMDY4U3AvU1NtdDhIbWRKRVd5TXdF?=
 =?utf-8?B?SEVHejJqaEdPL3JHWk1uaU5JU1M2azcyUGUrSDdrc3ZGMGVJeFFIRFB5MG5h?=
 =?utf-8?B?M2pzd2lyZlNoOHVHZC9vdU9OSGRiS0FGWmxXQ1NidFdxTDcvWHRWcXM1NGEv?=
 =?utf-8?B?S01yWnhHOFoybVFBa3NRNUErOXpLdVp6eUR6SE5SSTNVT1RZN3RZTVpjcW1x?=
 =?utf-8?B?SnZuUDBsRTBlMjhLeXpFbGNWb0V6Y2s1MjlOUjhuQ2Y3Q01JdUVjcXREVEVV?=
 =?utf-8?B?R0xyeit3ckdMc0VyaVlkNk9zbm5RdXBVSDNkdG5qR1hZWllLem5yeWlpVlRr?=
 =?utf-8?B?Q1ZVRUZmanpYS2N3Rk9iNjZCbU1NNWk5NEZwRkx6MkxoN2IyQ1Q1TEE5c0Jz?=
 =?utf-8?Q?pSneLbYH98kLUrDUVvwV+geNmmXbNsRlWPH6XO2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d24dd4da-25ba-4629-93d6-08d94e100af9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 19:28:26.1083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMGUzzUCfbDqIBCbIoeiaFaMXZLvW+IbAYQ/YDpQItZV6/Z42z6SsflQoSNbFPHTe4OCRGRP9a5xzVRppsVM5H7MG5NML8axOcz3fIr2xSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5603
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



On 7/21/2021 10:38 AM, Michal Wajdeczko wrote:
> 
> 
> On 21.07.2021 18:11, Vinay Belgaumkar wrote:
>> Add methods for interacting with GuC for enabling SLPC. Enable
>> SLPC after GuC submission has been established. GuC load will
>> fail if SLPC cannot be successfully initialized. Add various
>> helper methods to set/unset the parameters for SLPC. They can
>> be set using H2G calls or directly setting bits in the shared
>> data structure.
>>
>> This patch also removes the GEM_BUG_ON from guc_submission_disable().
>> The assumption when that was added was there would be no wakerefs
>> when it would be called. However, if we fail to enable slpc, we will
> 
> s/slpc/SLPC

done.
> 
>> still be holding a wakeref.
>>
>> v2: Address several review comments, add new helpers for
>> decoding the slpc min/max frequencies. Use masks instead of hardcoded
>> constants. (Michal W)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 206 ++++++++++++++++++
>>   .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |   2 +
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   4 -
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  10 +
>>   4 files changed, 218 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index a99d727b5bf0..48db2a8f67d1 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -45,6 +45,40 @@ void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc)
>>   	guc->slpc_selected = __guc_slpc_selected(guc);
>>   }
>>   
>> +static void slpc_mem_set_param(struct slpc_shared_data *data,
>> +				u32 id, u32 value)
>> +{
>> +	GEM_BUG_ON(id >= SLPC_MAX_OVERRIDE_PARAMETERS);
>> +	/*
>> +	 * When the flag bit is set, corresponding value will be read
>> +	 * and applied by slpc.
>> +	 */
>> +	data->override_params.bits[id >> 5] |= (1 << (id % 32));
>> +	data->override_params.values[id] = value;
>> +}
>> +
>> +static void slpc_mem_set_enabled(struct slpc_shared_data *data,
>> +				u8 enable_id, u8 disable_id)
>> +{
>> +	/*
>> +	 * Enabling a param involves setting the enable_id
>> +	 * to 1 and disable_id to 0.
>> +	 */
>> +	slpc_mem_set_param(data, enable_id, 1);
>> +	slpc_mem_set_param(data, disable_id, 0);
>> +}
>> +
>> +static void slpc_mem_set_disabled(struct slpc_shared_data *data,
>> +				u8 enable_id, u8 disable_id)
>> +{
>> +	/*
>> +	 * Disabling a param involves setting the enable_id
>> +	 * to 0 and disable_id to 1.
>> +	 */
>> +	slpc_mem_set_param(data, disable_id, 1);
>> +	slpc_mem_set_param(data, enable_id, 0);
>> +}
>> +
>>   static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>>   {
>>   	struct intel_guc *guc = slpc_to_guc(slpc);
>> @@ -63,6 +97,116 @@ static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>>   	return err;
>>   }
>>   
>> +static u32 slpc_get_state(struct intel_guc_slpc *slpc)
>> +{
>> +	struct slpc_shared_data *data;
>> +
>> +	GEM_BUG_ON(!slpc->vma);
>> +
>> +	drm_clflush_virt_range(slpc->vaddr, sizeof(u32));
>> +	data = slpc->vaddr;
>> +
>> +	return data->header.global_state;
>> +}
>> +
>> +static bool slpc_is_running(struct intel_guc_slpc *slpc)
>> +{
>> +	return (slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING);
>> +}
>> +
>> +static int guc_action_slpc_query(struct intel_guc *guc, u32 offset)
>> +{
>> +	u32 request[] = {
>> +		INTEL_GUC_ACTION_SLPC_REQUEST,
>> + 		SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2),
>> +		offset,
>> +		0,
>> +	};
>> +
>> + 	return intel_guc_send(guc, request, ARRAY_SIZE(request));
>> +}
>> +
>> +static int slpc_query_task_state(struct intel_guc_slpc *slpc)
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	u32 shared_data_gtt_offset = intel_guc_ggtt_offset(guc, slpc->vma);
>> +	int ret;
>> +
>> +	ret = guc_action_slpc_query(guc, shared_data_gtt_offset);
>> +	if (ret)
>> +		drm_err(&i915->drm, "Query task state data returned (%pe)\n",
>> +				ERR_PTR(ret));
>> +
>> +	drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
>> +
>> +	return ret;
>> +}
>> +
>> +static const char *slpc_state_string(struct intel_guc_slpc *slpc)
>> +{
>> +	const char *str = NULL;
>> +	u32 state = slpc_get_state(slpc);
>> +
>> +	switch (state) {
>> +	case SLPC_GLOBAL_STATE_NOT_RUNNING:
>> +		str = "not running";
>> +		break;
>> +	case SLPC_GLOBAL_STATE_INITIALIZING:
>> +		str = "initializing";
>> +		break;
>> +	case SLPC_GLOBAL_STATE_RESETTING:
>> +		str = "resetting";
>> +		break;
>> +	case SLPC_GLOBAL_STATE_RUNNING:
>> +		str = "running";
>> +		break;
>> +	case SLPC_GLOBAL_STATE_SHUTTING_DOWN:
>> +		str = "shutting down";
>> +		break;
>> +	case SLPC_GLOBAL_STATE_ERROR:
>> +		str = "error";
>> +		break;
>> +	default:
>> +		str = "unknown";
>> +		break;
>> +	}
> 
> nit: you can split as:
> 
> static const char *
> slpc_global_state_to_string(enum slpc_global_state state)
> {
> 	switch (state) {
> 	case SLPC_GLOBAL_STATE_NOT_RUNNING:
> 		return "not running";
> 	case SLPC_GLOBAL_STATE_INITIALIZING:
> 		return "initializing";
> 	...
> 
> and
> 
> static const char *slpc_get_state_string(struct intel_guc_slpc *slpc)
> {
> 	return slpc_global_state_to_string(slpc_get_state(slpc));
> }

Ok, done.

> 
> 
>> +
>> +	return str;
>> +}
>> +
>> +static int guc_action_slpc_reset(struct intel_guc *guc, u32 offset)
>> +{
>> +	u32 request[] = {
>> +		INTEL_GUC_ACTION_SLPC_REQUEST,
>> +		SLPC_EVENT(SLPC_EVENT_RESET, 2),
>> +		offset,
>> +		0,
>> +	};
>> +
>> + 	return intel_guc_send(guc, request, ARRAY_SIZE(request));
> 
> don't know details of H2G request/response message (btw, maybe you can
> include something in ABI.h) but be aware that guc_send() might return
> non-zero DATA0 so if you don't expect it, return -EPROTO
> 
>> +}
>> +
>> +static int slpc_reset(struct intel_guc_slpc *slpc)
>> +{
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +	u32 shared_data_gtt_offset = intel_guc_ggtt_offset(guc, slpc->vma);
> 
> just "offset" ?

yup.

> 
>> +	int ret;
>> +
>> +	ret = guc_action_slpc_reset(guc, shared_data_gtt_offset);
>> +
>> +	if (!ret) {
> 
> if (unlikely(ret < 0))
> 	return ret;
> 
>> +		if (wait_for(slpc_is_running(slpc), SLPC_RESET_TIMEOUT_MS)) {
>> +			drm_err(&i915->drm, "SLPC not enabled! State = %s\n",
>> +				  slpc_state_string(slpc));
>> +			return -EIO;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>   {
>>   	GEM_BUG_ON(slpc->vma);
>> @@ -70,6 +214,30 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>   	return slpc_shared_data_init(slpc);
>>   }
>>   
>> +u32 slpc_decode_min_freq(struct intel_guc_slpc *slpc)
>> +{
>> +	struct slpc_shared_data *data = slpc->vaddr;
>> +
>> +	GEM_BUG_ON(!slpc->vma);
>> +
>> +	return	DIV_ROUND_CLOSEST(
>> +		REG_FIELD_GET(SLPC_MIN_UNSLICE_FREQ_MASK,
>> +			data->task_state_data.freq) *
>> +		GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
>> +}
>> +
>> +u32 slpc_decode_max_freq(struct intel_guc_slpc *slpc)
>> +{
>> +	struct slpc_shared_data *data = slpc->vaddr;
>> +
>> +	GEM_BUG_ON(!slpc->vma);
>> +
>> +	return	DIV_ROUND_CLOSEST(
>> +		REG_FIELD_GET(SLPC_MAX_UNSLICE_FREQ_MASK,
>> +			data->task_state_data.freq) *
>> +		GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
>> +}
>> +
>>   /*
>>    * intel_guc_slpc_enable() - Start SLPC
>>    * @slpc: pointer to intel_guc_slpc.
>> @@ -85,6 +253,44 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>    */
>>   int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   {
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	struct slpc_shared_data *data;
>> +	int ret;
>> +
>> +	GEM_BUG_ON(!slpc->vma);
>> +
>> +	memset(slpc->vaddr, 0, sizeof(struct slpc_shared_data));
>> +
>> +	data = slpc->vaddr;
>> +	data->header.size = sizeof(struct slpc_shared_data);
>> +
>> +	/* Enable only GTPERF task, disable others */
>> +	slpc_mem_set_enabled(data, SLPC_PARAM_TASK_ENABLE_GTPERF,
>> +				SLPC_PARAM_TASK_DISABLE_GTPERF);
>> +
>> +	slpc_mem_set_disabled(data, SLPC_PARAM_TASK_ENABLE_BALANCER,
>> +				SLPC_PARAM_TASK_DISABLE_BALANCER);
>> +
>> +	slpc_mem_set_disabled(data, SLPC_PARAM_TASK_ENABLE_DCC,
>> +				SLPC_PARAM_TASK_DISABLE_DCC);
>> +
>> +	ret = slpc_reset(slpc);
>> +	if (ret) {
> 
> if (unlikely(ret < 0)) ?

ok.

> 
>> +		drm_err(&i915->drm, "SLPC Reset event returned (%pe)\n",
>> +				ERR_PTR(ret));
>> +		return ret;
>> +	}
>> +
>> +	drm_info(&i915->drm, "SLPC state: %s\n", slpc_state_string(slpc));
> 
> do we expect here something else than "running" ?
No, changed this to enabled instead, fixes the ordering below as well.

> 
>> +
>> +	slpc_query_task_state(slpc);
>> +
>> +	/* min and max frequency limits being used by SLPC */
>> +	drm_info(&i915->drm, "SLPC min freq: %u Mhz, max is %u Mhz\n",
>> +			slpc_decode_min_freq(slpc),
>> +			slpc_decode_max_freq(slpc));
>> +
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> index 214a449e78f2..c417992b1346 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> @@ -9,6 +9,8 @@
>>   #include <linux/types.h>
>>   #include "abi/guc_actions_slpc_abi.h"
>>   
>> +#define SLPC_RESET_TIMEOUT_MS 5
>> +
>>   struct intel_guc_slpc {
>>   
>>   	struct i915_vma *vma;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 9083bd4adb22..142e44dc5bf1 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -2506,10 +2506,6 @@ void intel_guc_submission_enable(struct intel_guc *guc)
>>   
>>   void intel_guc_submission_disable(struct intel_guc *guc)
>>   {
>> -	struct intel_gt *gt = guc_to_gt(guc);
>> -
>> -	GEM_BUG_ON(gt->awake); /* GT should be parked first */
>> ->  	/* Note: By the time we're here, GuC may have already been reset */
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index e6bd9406c7b2..3f2aa83c5c45 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -506,6 +506,14 @@ static int __uc_init_hw(struct intel_uc *uc)
>>   		 "submission",
>>   		 enableddisabled(intel_uc_uses_guc_submission(uc)));
>>   
>> +	if (intel_uc_uses_guc_slpc(uc)) {
>> +		ret = intel_guc_slpc_enable(&guc->slpc);
>> +		if (ret)
>> +			goto err_submission;
>> +		drm_info(&i915->drm, "GuC SLPC %s\n",
>> +			 enableddisabled(intel_uc_uses_guc_slpc(uc)));
> 
> there will be (in this order):
> 
> 	"GuC submission enabled\n"
> 	"SLPC state: running\n"
> 	"SLPC min freq: %u Mhz, max is %u Mhz\n"
> 	"GuC SLPC enabled\n"
> 
> is this what you wanted ?

Fixed now.
Thanks,
Vinay.
> 
> Michal
> 
>> +	}
>> +
>>   	if (intel_uc_uses_huc(uc)) {
>>   		drm_info(&i915->drm, "%s firmware %s version %u.%u %s:%s\n",
>>   			 intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
>> @@ -520,6 +528,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>>   	/*
>>   	 * We've failed to load the firmware :(
>>   	 */
>> +err_submission:
>> +	intel_guc_submission_disable(guc);
>>   err_log_capture:
>>   	__uc_capture_load_err_log(uc);
>>   err_out:
>>
