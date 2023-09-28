Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CA37B15C4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 10:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77AE10E5DE;
	Thu, 28 Sep 2023 08:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEBE10E5E5;
 Thu, 28 Sep 2023 08:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695888744; x=1727424744;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iXWZVbW+sYo7yzhFUm/mVxrbVhbAVFveXGexUefxWQM=;
 b=iNl99srcvybs8YItnN9cJM7dWk5GxuA+ERHHV1WJ+S9fV82gKhgot8Lp
 H8NqU3dci7fP9lIjzqvDM3UOdjq6EyD+8ZUa3zyo20z0kWeMR5qJA310h
 l8FrL8eiBYP90vwuGegaXEaeHriXLgDYIKWGk+1o9PQe85OD6jWOKzNzU
 lvGX65XJZfv44ASmRazGjhDXmaxD4vFiapVfxyGW1i4+IYCen3E11x654
 Iftnt2dj/OYXtUa4yP56h1xSvoQiSTK5Z8uo9WRGsUtrvss56uPaRGM9v
 so7i86rmjMv29fjVD1VlnYXQgH7/6hvOuoofwx48+QXAxZ7xhFllsE+H1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="361383359"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="361383359"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 01:12:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="923123955"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="923123955"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 01:12:23 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 01:12:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 01:12:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 01:12:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgNfoKGUzXbV0id4mUKj6TrOgeJVa2sd0p9JTtULWJzjK2crmfHYN26los7kogv2RFJnJCCgqSMnABNCm2rOjFRGja6ZQkouP0HjyLDGBXyjmarxVTyiEha1Id88bawP52K+NzC2lyz1PBPbNIn+v4klrtuBsw9yKJQdRLfttmPBg78+kXYVokdUFY2G5knFdlXBBagVsb8dC98f/mRpay3acALJV/uOu4x8DbO7QryB+kNKQW2I5pm55KVVBOAwLtUuA0AAsB60ftsNv270gdLL39ygXjHFeM421H+t+W7zrb/DPpGBIsiTx4CuM3YiJP+2F93wVf1yoyxDwizx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MXVvCkELF2EHM/Qr/PfngmnMcMmpQiOSl1s1S9Wsdc=;
 b=GzPkR6cmBsA8XHXAeB0qqMENDyhT3T2Myr2Ri/wU3kFiTBQPiI0tdsmxhAYFE+VFB/OPVAV6WK6qZC9GjI2km2sxeIQK87Mm7foGly3rhufQWqxZXr52P8/StbUy3VDZCyTbhEt3QthS7yLRgveQCDP5DmJh4mGWmVM+lUhmNjrQf3aKCZmwfvx66diRTn4M0u4anziCVWYOyy/EDtKRjqPeSuFhKLXU/8TwL2i3FkyVgoN6axtY5crEvR9ntu7A7CDt+RNsJ0OFMCqZawCTt7L8axs/p88Fd2H5t8pwbBiHLwUS5QHUXnugTIIjfoKBBa5Z3ahlRIsco687IUrqBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.25; Thu, 28 Sep
 2023 08:12:16 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d%6]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 08:12:16 +0000
Message-ID: <cd2a314a-a98a-fe20-3852-d12ae6979d3b@intel.com>
Date: Thu, 28 Sep 2023 10:12:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 3/4] drm/i915: Reset steer semaphore for media GT on
 resume
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230927210357.17461-1-nirmoy.das@intel.com>
 <20230927210357.17461-3-nirmoy.das@intel.com>
 <ZRUpDcKowRXpWjD9@ashyti-mobl2.lan>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZRUpDcKowRXpWjD9@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::11) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|IA1PR11MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: e3801b65-f160-4934-7030-08dbbffaa087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XPTSHFMjCeCUv3ZahyK8CicqK71yuxgdJc8FoquYbvYCa3iOmloOqMhOT7f5JZNsI5gEXPBWp/NSS7br+EN+8PXva40h5GkKl2FHbAtBzhcGLi6S2rNYSDLYcum1VXge98XoAJW7ELUOIKAr7eOzlltRBK3PcclqzVT6c+O4gfsxjUVzR0Lbr5ZEBOnuaBewHlTMjZkBO5iLMB1Xp3oDQwR79Y/FO7H/bUpzv2L2t4nvz4YeNIYSD1SxMuVs9JVxXR7nfVjNSrC0xljxmPDz7M59QVu2o7G6DhIIHAs0fj/RQjGw2wxK/mIUimi0HSRjCT5QScWOwsTYz46zGBpRG6uXnce5onWE8I4L7MsnXWEL9V5ab4wwxCKKCIFtuFbPAWXHIwqxw95CskNXOSHHSdIl5vBLGFh2eu8eb02Ky79uIrnVdnRg1OZGaZKaFuFvVMEjYmADjfKhKhpVk2icguwrk5c12rLJAyeUA+u/xwHvkbBui2qytxwl5eJbcPqRokFJQpeM4kl//arl00yUNs+Fo9ocB0UDsW+pjHkh+gpc3LoGhFS9qRqNMGdd5CUV6GA5qgijN9ruKk6RbHOZTLQKjC0850eKzNecbAgJPMjzEVtXehTVCV09h6TwdFntOd84MSPoEC8RAX76r8qqNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6486002)(316002)(82960400001)(38100700002)(66476007)(4326008)(66946007)(6666004)(2616005)(53546011)(26005)(6512007)(6916009)(6506007)(41300700001)(2906002)(31696002)(8936002)(5660300002)(44832011)(83380400001)(86362001)(66556008)(8676002)(478600001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkVuM3lHZGtkSHVsMjROdEU3VWtScU1kQjhBUzNYaWJUZmJDMjN3Wi9IMjhC?=
 =?utf-8?B?VkxKNHVzcFBNNTRRT0V5MmM3SnpxRk95RVZEU0dTLzJGUTZyV3p0eUdXSE1Q?=
 =?utf-8?B?ZWtPV3Q1NU9lR2g2MHhLRVdUeENlWHNRUm9Pa2FJblYyaWFjMDRGOTlEWTN1?=
 =?utf-8?B?cWRsTVFmWFY1cW92TGpmMTlLUTR4UWk1UFNPRkV6NVJyREVpN3RBMlRtYUZR?=
 =?utf-8?B?c3pBSVJRQ1V3VTRtdXV1UkljQ2NueFlXbk95dFFvb3k3c0pPSGIyeU0reXJL?=
 =?utf-8?B?VHlTTlVKNW40ZVlESjQ0RHlXM0Vnek1VZHkyQ1JVSXNvUE9SU1dqOVNqeEh2?=
 =?utf-8?B?Tk5ydFptTFcwcy9EVnNLblp4N3RKWDJaY0xMKzg3dUVzNU5mTHJvdXhJSUo3?=
 =?utf-8?B?TXdKLzhxaXkzUW04TjNxaFlKcjZjVm5oT3RCeU9hZDNGQlhFejJPTVhXVWZI?=
 =?utf-8?B?TFB0NXVURTJ2eFJ6ZXlEQ0JLRE1DRGVybGZjeko4Y3htbVY2T3pUeVRYZSs3?=
 =?utf-8?B?VXlQVVNFQm5nbUVCY1daakJhcHdObW84aDNBTHlza1RJeVZjSzBQTzFCRjFQ?=
 =?utf-8?B?d3VJSVcyMWJyZHV6REZJelpXS0dKckNZSmYzbWczVkZXT0JhTFpqMXhSZjEv?=
 =?utf-8?B?K0RWNWQ2RFVsOXF0aHBwSHExRjlMcHNkd003V1ZYRUdnR1JVQkl4MFlpUXZS?=
 =?utf-8?B?ZXE4VndzMWkvTkVIVjR5ejFoY3JYZjR5c0RCY2MvUzkrUWlwWDJmYkdmdUJk?=
 =?utf-8?B?d2I2eGZIM1VuNi9TMEQ3QTF1anNFNUc3cUtZamNnR3k4MHVVQ2Z5dFBZYm5Q?=
 =?utf-8?B?ZXY3a3grMjdTZlhlYmZhUnhkbGJ4d3dkOXVEUnFHSG9sdFpza0F6WHYwQmVq?=
 =?utf-8?B?WnU4MUd3NTdNbCtJclBibVRtQ3FyUDNYc3lacE1vb0ZvMUlqNUVvamxEWUR3?=
 =?utf-8?B?SmNwd2pBMlQ5YTk2MVZqU1pWMERuYjJqUURYM2d0cHROMnl6OWlOUE1TeCtm?=
 =?utf-8?B?V0hoaDdNWG1PVktTaHM4ckF2Vi83SklsQ2JIaEtYcitEajlSVzlYN3NUUnJm?=
 =?utf-8?B?M2IwSWI5WitXbVBKNjBmdG5rbG40NHRSeURLOHkwL20zaHRjSm9HOVhDV2x6?=
 =?utf-8?B?L2JVamlLemtLRVBGVUIwVkZtd1d3N3NkbFA3NmR4RHZHeWVoeGRldGpYTFN1?=
 =?utf-8?B?UHR4NTF5d3oyVy90WERqbmZUNGduR2JLNjJ6WWt6MzlZbVk5aXJCK0hnRW9i?=
 =?utf-8?B?V0lReWpabm4rcVVjY1Yxa2c4VWZkSUgwd2pzRFhlOE40M2hqNVNtTnJkckVs?=
 =?utf-8?B?VWpON2hXOGhyaFdGRFNHcjhxL2pXYTVYQmV3ZGZGZFFISHRUc1h6bHN5aEJZ?=
 =?utf-8?B?VzJuQ1FDaUMrZXR4ak50UTY1TUpmdzNMTUViSGJ0aXZraW8zdlNTdFlxQTBB?=
 =?utf-8?B?eVhYVFhidlMyUFhPc1FKUVlDa2hvbWtmR2RialFVVG9Ick5wSi9SdUVXRWJr?=
 =?utf-8?B?MExIckh0RVRzcWlxWU9RN3FnMW8vQStsaVBUQzAyZm5vVUd0czYvZmFOU2lX?=
 =?utf-8?B?NEQ4c0s2RGNjdUZWRjYzWU42TEJpeVlDVUUwbU9TcjNyK0lORFozeFY4K1p6?=
 =?utf-8?B?WWVxVDFyV202QkVoQ1Z3YmdLNDNEcHQyM1Vva21hUW80bEpxQWpETmdiQ25v?=
 =?utf-8?B?Z29ia2VFRmhiV0Q0aGlCeGxGemFyR0cxQ2RPV01oYldUUVh2WUV4Yy92dFdu?=
 =?utf-8?B?VjNzRkpleU5ERHdOa0lHTlh3Mklpby9TdUhrWnJzak5YSkJUUW9oRk1CdXcx?=
 =?utf-8?B?MnNhNnd0NlhUc3AzWm1xZlJJN21KeUZVd1ZvMytEYzN3L0JYc2g1UFlMZElH?=
 =?utf-8?B?Z3ppcEovZWdHWlFIOXV6MUl3ZXJwVDFrZm1wMDJvTEUxUWpCbkg1NkRZRHRL?=
 =?utf-8?B?NnljOCtPeThNMlZxRkF2NjJkNitLOVBIL0tPQWIwa2lEQlpvOGxWbEt4Y01m?=
 =?utf-8?B?VmIxaTRWVkR5Qms5N1dPblVzNXowVmdKeUo0cHFvNWsxZDliY05MYmQ0aVkx?=
 =?utf-8?B?S0J4akh1ekhrUjhnSWI2SVVaZ3A4K3VpOGphNXdkMjU3OFVyQk51aWQ3OGlJ?=
 =?utf-8?Q?4Rz9fxoQBOSn+OjskEkZFJ4M7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3801b65-f160-4934-7030-08dbbffaa087
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 08:12:16.2192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDrz2HDCFq/2YIX3uokunxcWOKLbz4+th9PQN+DW3Bw6k5MyevI3zjB6j7KWZ28fl8ilRYp3EAeWhvobnMjLNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/28/2023 9:19 AM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Wed, Sep 27, 2023 at 11:03:56PM +0200, Nirmoy Das wrote:
>> During resume, the steer semaphore on GT1 was observed to be held. The
>> hardware team has confirmed the safety of clearing the steer semaphore
>> during driver load/resume, as no lock acquisitions can occur in this
>> process by other agents.
>>
>> v2: reset on resume not in intel_gt_init().
>> v3: do the reset on intel_gt_resume_early()
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> In the previous version I added my r-b here.
I moved code to different function so wanted to be sure :)
>   Please consider it
> for the next version:
>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>
> Even though there are still some quesions coming from Matt.

I will make it generic for all GT in the next version.


Thanks,

Nirmoy

>
> Thanks,
> Andi
>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_pm.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> index dab73980c9f1..59cebf205b72 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> @@ -13,6 +13,7 @@
>>   #include "intel_engine_pm.h"
>>   #include "intel_gt.h"
>>   #include "intel_gt_clock_utils.h"
>> +#include "intel_gt_mcr.h"
>>   #include "intel_gt_pm.h"
>>   #include "intel_gt_print.h"
>>   #include "intel_gt_requests.h"
>> @@ -218,6 +219,17 @@ void intel_gt_pm_fini(struct intel_gt *gt)
>>   
>>   void intel_gt_resume_early(struct intel_gt *gt)
>>   {
>> +	/*
>> +	 * Reset the steer semaphore on GT1, as we have observed it
>> +	 * remaining held after a suspend operation. Confirmation
>> +	 * from the hardware team ensures the safety of resetting
>> +	 * the steer semaphore during driver load/resume, as there
>> +	 * are no lock acquisitions during this process by other
>> +	 * agents.
>> +	 */
>> +	if (MEDIA_VER(gt->i915) >= 13 && gt->type == GT_MEDIA)
>> +		intel_gt_mcr_lock_reset(gt);
>> +
>>   	intel_uncore_resume_early(gt->uncore);
>>   	intel_gt_check_and_clear_faults(gt);
>>   }
>> -- 
>> 2.41.0
