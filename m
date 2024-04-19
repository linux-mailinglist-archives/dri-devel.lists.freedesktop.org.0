Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CEC8AAAC5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 10:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BC110E5CC;
	Fri, 19 Apr 2024 08:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZqMwKJq0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B65510E436;
 Fri, 19 Apr 2024 08:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713516311; x=1745052311;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b8ZbRFcxxAFRytJYsk4HUacXdCYtiKhI6hff8qAR25I=;
 b=ZqMwKJq0JQnKgTxfWvkng7Zvw4USMGOCfx/L9Blsw1InQcYXytlaQyIt
 IquTGJleKA67LJHHhJ8rIKhXpzYR8pLCMH3mTtOAVwsnuiO6sOf5YbO6F
 8vnitu5KURmsLT51VzR2X2MOefcUFRnJn7khh3tqEn72w2gMUE2mywbZ4
 E1QulUc3vo7KmaDwgD/VA9mxLfKQlAUadln9zz75kVjqwzh+2uhBqoZnl
 bRHS2olbCbC4NMFQ3ndfJqY8mGdZYILvKK8omna8FEDQDiagwfbxpRGOz
 St8pR8IWeQPeB+t5B+OXXo1Hk8DbrsExm2n2kzYfM1rFBuDVZtv8QLBdD g==;
X-CSE-ConnectionGUID: EZWBmWcsQbuCv/gXet2TVg==
X-CSE-MsgGUID: /Ah9lTihRhauAy/ojR17CA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20533000"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="20533000"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 01:45:10 -0700
X-CSE-ConnectionGUID: lD5xzterTqGiVUDSsgEctg==
X-CSE-MsgGUID: heGxBgWbSPOiDsqLj7VQtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="27726313"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 01:45:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 01:45:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 01:45:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 01:45:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=An+m6XOL796+zyrO7llKONlN8SBb8M/Jo40CWiDKpM1QT2K6GqYG0+0WQeyrfKkTAFls6Z7SfuCBr6Pd7nGmllXTFYPRzYOqGrnT8hHPFVPDNF5wiAEL4ftDcislXjRD/btfTQ8D9klnq8+xz89YvZlKJu+XMabOCIzdiOx5q4IHu3zFGOC12QcdTcmGdpCf9d6VgUnnMQJ9lzTcjyIYSL7w6c5mi7thtfXR65tZDCtqKAgNg8BeDCVEKZRKIW/OKSYcBgc4Ekn4e8SgHgs6xZu+oI7WLbBL6Yk3NtnM4EQy5VylhNM5FZ8fmEhJ8pY6CIdCpDyz2bR1svtaNFfE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHFrYmITKvCa98e5SAw1Nlwk5PeCtYT90qO9z8oEli0=;
 b=ftm7tKJTQDvTVWBq3sMlV4F/MOnaiQ9/qxUh5Z27HROx7HVO+ruNi1e+VC1X3MiZdz+isrMiVAAAViD6dh6R37O+C42TYsBTNXNkUOO8P3+azn9ue9T3j5y0U0QgbOo7qo/ULA8wUrQIUHqijqyFIrlf+15xpvdKhTP8B/HvCYg3Z6aA/wVYKCHNVR3FybQ9uxThjSbwe+Zt4cpVriNMgktTDzdSHPjgkOJD5yt/MoMFfHaYZONIIMcpgRedWqWqie5lkzqt9pZlAZ1QIfQOkWM2B6ewq1szhO/RII60hzXJMuFgpPSz0R5HpvEWzMyRp53QLU3qgKVP9eakczTfFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SN7PR11MB7042.namprd11.prod.outlook.com (2603:10b6:806:299::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.37; Fri, 19 Apr 2024 08:45:03 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%7]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 08:45:03 +0000
Message-ID: <c734e80c-ec34-453d-aaf4-954668ad03cf@intel.com>
Date: Fri, 19 Apr 2024 10:44:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/i915: Refactor confusing __intel_gt_reset()
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240418171055.31371-1-nirmoy.das@intel.com>
 <df2b36db-5f16-4e93-9ba1-23f3720d24ad@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <df2b36db-5f16-4e93-9ba1-23f3720d24ad@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::13) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SN7PR11MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: df6606d7-4308-4b8b-99ba-08dc604d00f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cyVIjdYePH+k4mtNUVjM39RHCaz/YMlLPU6ariRPMGgpwWxI4JWx/kS6INre8jP1PAvsyC2LzYc55OmhWvK3ZHaMABXiz6QinSuiF5oxEDhxQOXmB1cTI8xaaLog+s7mdiCro+/QxZnY9dFaSWfWT4NDrgwMsaWRgzMbQj9g6m7zNvy2lABAZs0w1tCSs88VK2hpST2vDiYHDgXfsnvjtF1NAvS3QKZ4TjjbNoCpvfnVZya+bmaBL0/5+Dh2S6DKSCmAz/4bJOcNCRQON7GiduJueNW8juuSmxFD6Du0DmMkOfNNaZjdEEIOTHNByrmx6gv2o5HJc8TP5CdD3yqwQ9tXaFe5VztMiKOSc+55+c3OCb24f6hmdvcpjq3Nyq18/XE4F6IDf7SdwR3U21rG7N1yC8GFi60qcmCiCRDoDUBjjsIkoxpUoIZbxdZJwzMTFPz14fERQw1wm99q7OqEQc8Ifwcl1c2I72NR0fgghiJ3ZSstWbMeku02RawuUM4mn73yaru6AxzCYFDwJxiNaKzu7PhMiTqGbbZQFP0d+PvPQKFcPPEvQmpVVAZc7kTyyK57YLOVW9QqJkSU8UBd7/jLZFeONNHOYMrElWrGib8ANpDF/rVn2qFtvm6WDi/wnBgrX4AgYQFg6nSLyH3lXNNNhjVJ0RKedBCSmf3P1bw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dStRallIUkdQNjV0VnEyK016M2tVYWptcnNwa3Z0Q2JGZHc0eXNEYVF6TVFP?=
 =?utf-8?B?UTlBcE1QVEpoZXpOaEZzdy9CRVRrN0xhT3plYldDSXI1VG45Tk5kc01odEpK?=
 =?utf-8?B?RnU4bWxyWnV6OFE1NEQ5V1oydmUyeGU5U3Q3WG1VNnVGRjNmenZGdDNCRWFs?=
 =?utf-8?B?LzhmOUFJVXZGUEZ3OFJDY0d1RmJ3N01hRVlhTHpNQVkxMDBHZUVaTG1iaWF0?=
 =?utf-8?B?enVKOHl5QkVleG5aY2ZlQ296a3hmZ0ZYbjJ5QldrdmFpeVdsR2NMYWJIZ3JZ?=
 =?utf-8?B?MlFRb2tkUVdGUzJQRHp4ZkR1aHhleGFmVUoxMTFqbUZqUnpJbWRqTlo1NTVm?=
 =?utf-8?B?cHpLSmh1U0pMWXhQUjIvcXJBWFJxejI3blF3MFRwbEptZjZQMExFdWwwWi9K?=
 =?utf-8?B?WjBlSmcwR2tYNWJJVE5JaHN3YVZPaWgvbzhTN0IxS0duTXRGWktyOEJVTzZp?=
 =?utf-8?B?NlVJQXY3OXFmSDlwbGhLUUhTaGxxN1B2YWxYTi9pVDBvTk9UWTFpYUJxNWt0?=
 =?utf-8?B?YjBjZkhtQXY3VDVmckc0eVJhK1FBMHNuWXpub0JHc3llejNkQnZtdy8xVU11?=
 =?utf-8?B?dExWMG5oSEIzcHdTTXdLYmdpY3lKRHlNUDdReTNMajBRQ3ZPcS8zZ1kwRFU5?=
 =?utf-8?B?elB5cjlsRFFVR1hsRGptckgyeGxpcGhmTzZOYzNzTCthT2pMV1VlcWxSeGp6?=
 =?utf-8?B?cFRwWWlzTzVVZStld1lKTXVjN3M5ZVJCZUZXSE9uVDFqRHRGNlNvWXlqSTNE?=
 =?utf-8?B?STZublFYOXhwc0lpdDhmelVyZjVDYloyYUx3UitjUjJVUENZME5McXYySFdG?=
 =?utf-8?B?WkFLZzZFbXY4Sjg1dUIvUDU4RXdWS3BjbW0ydDc4a01ZWWFjUUlqMUJWbVBL?=
 =?utf-8?B?RXVnYTEyQjV2TlEzVkdnSGFVM0x0RVlIbUdFQ0tGM1d6RjdLL0Z5ZmFqN2NH?=
 =?utf-8?B?SUlUL20yWVM2NGdoUmlRamdYNlFZSkVmRlZPRlNuUVl6SnZFTUd0MUJ3QzJM?=
 =?utf-8?B?QkhOV292RUovM2QwdHFhQUZDbzJkKzRCSUk1eUNUOXZabFRReGlGZGN4T2Jy?=
 =?utf-8?B?NzFkeUs2RmhqU1BiRGpGSVp2QVEvWUEwT3YrY0NoUmw5dUIzWEpuaE9CMk9P?=
 =?utf-8?B?dUJzREJrQ1ZPMHRBUTlqZVUwSDNNTTB5VllYK2o3Qk1TWHRKZVpla2h2c2hK?=
 =?utf-8?B?SXJTcW9VME1RNEdUZ000YUZPMDdIdGR0RWhCakNTaDJ5ZmJWQVBQKzEvdVVs?=
 =?utf-8?B?UDl3MXl5eXBOQVpwSU1hekQ3bElDaTBXYkV1U1ZqU0NsNzVQSUdMK2lzQjBZ?=
 =?utf-8?B?K0lYLzZFOXQzblE4MzdHMUI3anAxcmhSL2FDaE5Pd2VKUEJnMTBQVUtNQXdN?=
 =?utf-8?B?aEt6bTh3UE5xc2RybHptQkFaMGxrMXRtSHYxK2hkMVY0Mkl1NVMrVTI0bkhm?=
 =?utf-8?B?TkVMSzNMa2t2Qy9BN2pRdmNZZENzaWUyN2hWTGQ2NGs4ZTBremMvbG9xYWlz?=
 =?utf-8?B?bWlSeU9vQ1puUWliUUt2YWFOdHBjOEo3T1NSZnloclk5M214ZFd4K3pLUUlC?=
 =?utf-8?B?WDNSZWhiYXN1U1JqUEE3ZlQ4WDNpYVUyUnVCTm9JSTFrVEMvOEhDM3pFOGFx?=
 =?utf-8?B?ZEJhQk94Mm01UVZNTGh2Q3cwbTZSaEVURTJHdjBtWHNGdzB6NjZMTVVCNFU4?=
 =?utf-8?B?d1R5alRXNUg2WUJsNy9leUR0S1d4N0tIek5nV2lWczNMSFdxWWU4cEc2OGZM?=
 =?utf-8?B?ek9Bby8xUkFsZDFWVGkwNFMzc254SDVyZU1aUS9kZDI0T1JLWGRGVzUzcTRj?=
 =?utf-8?B?aGQ5UnpJRUFQT1Y3WXZEVjlOYTNhQnJHS2ptdCtkN3ZENEJEcVVDSk5BcUNz?=
 =?utf-8?B?WEs4RWN1Qm5Ob0tSUnVEam9qbFJSeTRocDBab21qWmR1L3d5Ly9sYzNha0Zh?=
 =?utf-8?B?SVkvUWF3V0ZkSzE2OTE1NGZLc2V2UUZxRlpEbjBIU2FvMTJ5RzFRbnFhbVpj?=
 =?utf-8?B?Wk9xVjdrell6enBZMHpiKzZKdVBJbmUxdmQwQXZDRnlwSDd3VGVFZW1PbXZR?=
 =?utf-8?B?YlZVVG10Q1B2UGdsYmo2M2xkMHFCMTFtdG53SVhUVXA3bjFpMU1udVhzVE42?=
 =?utf-8?Q?N0NVnO+wafSYdSMCefcS+NhLo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df6606d7-4308-4b8b-99ba-08dc604d00f7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 08:45:02.6911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0FBGNS7AZ0G+kEoVMjolMar61nU7BhGbiArETdrDZ0I961r4O53RCHxUGd91rCaAHkqgtfxIkQG72IfC/s3CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7042
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John.

On 4/19/2024 1:27 AM, John Harrison wrote:
> On 4/18/2024 10:10, Nirmoy Das wrote:
>> __intel_gt_reset() is really for resetting engines though
>> the name might suggest something else. So add two helper functions
>> to remove confusions with no functional changes.
> Technically you only added one and just moved the other :). It already 
> existed, it just wasn't being used everywhere that it could be!

I did have one more helper functions but I removed it in favor of 
intel_gt_reset_engine() but didn't change the commit message :/

Thanks for catching it. I will fix it.

>
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
>>   .../drm/i915/gt/intel_execlists_submission.c  |  2 +-
>>   drivers/gpu/drm/i915/gt/intel_gt.c            |  2 +-
>>   drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  2 +-
>>   drivers/gpu/drm/i915/gt/intel_reset.c         | 43 ++++++++++++++-----
>>   drivers/gpu/drm/i915/gt/intel_reset.h         |  3 +-
>>   drivers/gpu/drm/i915/gt/selftest_reset.c      |  2 +-
>>   drivers/gpu/drm/i915/i915_driver.c            |  2 +-
>>   8 files changed, 41 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index 8c44af1c3451..5c8e9ee3b008 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -678,7 +678,7 @@ void intel_engines_release(struct intel_gt *gt)
>>        */
>>       GEM_BUG_ON(intel_gt_pm_is_awake(gt));
>>       if (!INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
>> -        __intel_gt_reset(gt, ALL_ENGINES);
>> +        intel_gt_reset_all_engines(gt);
>>         /* Decouple the backend; but keep the layout for late GPU 
>> resets */
>>       for_each_engine(engine, gt, id) {
>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c 
>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> index 355aab5b38ba..21829439e686 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> @@ -2898,7 +2898,7 @@ static void enable_error_interrupt(struct 
>> intel_engine_cs *engine)
>>           drm_err(&engine->i915->drm,
>>               "engine '%s' resumed still in error: %08x\n",
>>               engine->name, status);
>> -        __intel_gt_reset(engine->gt, engine->mask);
>> +        intel_gt_reset_engine(engine);
>>       }
>>         /*
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c 
>> b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index 580b5141ce1e..626b166e67ef 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -832,7 +832,7 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
>>         /* Scrub all HW state upon release */
>>       with_intel_runtime_pm(gt->uncore->rpm, wakeref)
>> -        __intel_gt_reset(gt, ALL_ENGINES);
>> +        intel_gt_reset_all_engines(gt);
>>   }
>>     void intel_gt_driver_release(struct intel_gt *gt)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c 
>> b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> index 220ac4f92edf..c08fdb65cc69 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> @@ -159,7 +159,7 @@ static bool reset_engines(struct intel_gt *gt)
>>       if (INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
>>           return false;
>>   -    return __intel_gt_reset(gt, ALL_ENGINES) == 0;
>> +    return intel_gt_reset_all_engines(gt) == 0;
>>   }
>>     static void gt_sanitize(struct intel_gt *gt, bool force)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>> index c8e9aa41fdea..b825daace58e 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>> @@ -764,7 +764,7 @@ wa_14015076503_end(struct intel_gt *gt, 
>> intel_engine_mask_t engine_mask)
>>                HECI_H_GS1_ER_PREP, 0);
>>   }
>>   -int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t 
>> engine_mask)
>> +static int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t 
>> engine_mask)
>>   {
>>       const int retries = engine_mask == ALL_ENGINES ? 
>> RESET_MAX_RETRIES : 1;
>>       reset_func reset;
>> @@ -795,6 +795,34 @@ int __intel_gt_reset(struct intel_gt *gt, 
>> intel_engine_mask_t engine_mask)
>>       return ret;
>>   }
>>   +/**
>> + * intel_gt_reset_all_engines() - Reset all engines in the given gt.
>> + * @gt: the GT to reset all engines for.
>> + *
>> + * This function resets all engines within the given gt.
>> + *
>> + * Returns:
>> + * Zero on success, negative error code on failure.
>> + */
>> +int intel_gt_reset_all_engines(struct intel_gt *gt)
>> +{
>> +    return __intel_gt_reset(gt, ALL_ENGINES);
>> +}
>> +
>> +/**
>> + * intel_gt_reset_engine() - Reset a specific engine within a gt.
>> + * @engine: engine to be reset.
>> + *
>> + * This function resets the specified engine within a gt.
>> + *
>> + * Returns:
>> + * Zero on success, negative error code on failure.
>> + */
>> +int intel_gt_reset_engine(struct intel_engine_cs *engine)
>> +{
>> +    return __intel_gt_reset(engine->gt, engine->mask);
>> +}
>> +
> You could have just dropped the 'static' from the existing copy of 
> this function and added the new version next to it. That would make 
> the diff simpler and therefore clearer. Unless you think there is a 
> good reason to move the code up here?

Yes, make sense, I will do that.


Thanks,

Nirmoy

>
> John.
>
>>   bool intel_has_gpu_reset(const struct intel_gt *gt)
>>   {
>>       if (!gt->i915->params.reset)
>> @@ -978,7 +1006,7 @@ static void __intel_gt_set_wedged(struct 
>> intel_gt *gt)
>>         /* Even if the GPU reset fails, it should still stop the 
>> engines */
>>       if (!INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
>> -        __intel_gt_reset(gt, ALL_ENGINES);
>> +        intel_gt_reset_all_engines(gt);
>>         for_each_engine(engine, gt, id)
>>           engine->submit_request = nop_submit_request;
>> @@ -1089,7 +1117,7 @@ static bool __intel_gt_unset_wedged(struct 
>> intel_gt *gt)
>>       /* We must reset pending GPU events before restoring our 
>> submission */
>>       ok = !HAS_EXECLISTS(gt->i915); /* XXX better agnosticism 
>> desired */
>>       if (!INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
>> -        ok = __intel_gt_reset(gt, ALL_ENGINES) == 0;
>> +        ok = intel_gt_reset_all_engines(gt) == 0;
>>       if (!ok) {
>>           /*
>>            * Warn CI about the unrecoverable wedged condition.
>> @@ -1133,10 +1161,10 @@ static int do_reset(struct intel_gt *gt, 
>> intel_engine_mask_t stalled_mask)
>>   {
>>       int err, i;
>>   -    err = __intel_gt_reset(gt, ALL_ENGINES);
>> +    err = intel_gt_reset_all_engines(gt);
>>       for (i = 0; err && i < RESET_MAX_RETRIES; i++) {
>>           msleep(10 * (i + 1));
>> -        err = __intel_gt_reset(gt, ALL_ENGINES);
>> +        err = intel_gt_reset_all_engines(gt);
>>       }
>>       if (err)
>>           return err;
>> @@ -1270,11 +1298,6 @@ void intel_gt_reset(struct intel_gt *gt,
>>       goto finish;
>>   }
>>   -static int intel_gt_reset_engine(struct intel_engine_cs *engine)
>> -{
>> -    return __intel_gt_reset(engine->gt, engine->mask);
>> -}
>> -
>>   int __intel_engine_reset_bh(struct intel_engine_cs *engine, const 
>> char *msg)
>>   {
>>       struct intel_gt *gt = engine->gt;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.h 
>> b/drivers/gpu/drm/i915/gt/intel_reset.h
>> index f615b30b81c5..c00de353075c 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.h
>> @@ -54,7 +54,8 @@ int intel_gt_terminally_wedged(struct intel_gt *gt);
>>   void intel_gt_set_wedged_on_init(struct intel_gt *gt);
>>   void intel_gt_set_wedged_on_fini(struct intel_gt *gt);
>>   -int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t 
>> engine_mask);
>> +int intel_gt_reset_engine(struct intel_engine_cs *engine);
>> +int intel_gt_reset_all_engines(struct intel_gt *gt);
>>     int intel_reset_guc(struct intel_gt *gt);
>>   diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c 
>> b/drivers/gpu/drm/i915/gt/selftest_reset.c
>> index f40de408cd3a..2cfc23c58e90 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
>> @@ -281,7 +281,7 @@ static int igt_atomic_reset(void *arg)
>>           awake = reset_prepare(gt);
>>           p->critical_section_begin();
>>   -        err = __intel_gt_reset(gt, ALL_ENGINES);
>> +        err = intel_gt_reset_all_engines(gt);
>>             p->critical_section_end();
>>           reset_finish(gt, awake);
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c 
>> b/drivers/gpu/drm/i915/i915_driver.c
>> index 4b9233c07a22..622a24305bc2 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -202,7 +202,7 @@ static void sanitize_gpu(struct drm_i915_private 
>> *i915)
>>           unsigned int i;
>>             for_each_gt(gt, i915, i)
>> -            __intel_gt_reset(gt, ALL_ENGINES);
>> +            intel_gt_reset_all_engines(gt);
>>       }
>>   }
>
