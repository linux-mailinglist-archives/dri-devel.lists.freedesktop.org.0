Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADE73CAF0A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 00:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BF96E364;
	Thu, 15 Jul 2021 22:16:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969966E334;
 Thu, 15 Jul 2021 22:16:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="207615174"
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="207615174"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 15:16:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="653109746"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga006.fm.intel.com with ESMTP; 15 Jul 2021 15:16:15 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 15 Jul 2021 15:16:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 15 Jul 2021 15:16:15 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 15 Jul 2021 15:16:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2mLm+hCSMElTDd3Aj7raNiuTqszSA8xGoiwjdie0cgugUWj1nUfc+QPQgWyOfHqSwIUvWvyX4g5FVWTL5PG66oEJSyPmYFfH7zMNtIur/O7RVBSktqfffQxocAJrOrmgwFkcHa4LGFTvhOIOVI0MjDi9tP9+0aAHGALm26zKcXqzBlFq2tWZVm4XTN5wB7d54Iw3UDCb499583EwrNYOtxt2i+jnCrfy6kfwts6hj3NcgYA+q+WWjZky0TPJiXqvt8de8uWC2Izojn5RWvFDEB15sJteqHdFX0pJQM98VJ6FnpeNXjEg06+iBk27JEogMdde5rWUcGeFlOXAFtfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A93LdbgDXWc4Slb3B65RP8SYWXASoeYcHMlDx7o+xlQ=;
 b=QJYQM1BuvH+HofU8Z7plu+UjirLlk0ZiI6AqKPhrOqE3SCsjuc/LoCGPi4sdDSIrU7/UXf2rESvfTgtnZlk51Ab+vjh8kcdlxVkNGdPFVkFeNUeTwo0EH9GiyWRwoHmKOIrN2z19dJxOdGUM5jClo+C+//frNrJT4Gq+tOgV26F5oUyzQJMaW/l+f+u7B3w5fZ5IloqH7DFuq1gQB2FHgfxPyLIuNsv1HfX++c3TyZ/fIqJgk0y96BxjdCMgD8xbcrNN4emA2xQYL6d1jF6Atufoe/KMA7egOx68oLpx1sU9FZxV+gd//QWdRcvN95X4kJJVUTGDxaO4T9d+ui1ZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A93LdbgDXWc4Slb3B65RP8SYWXASoeYcHMlDx7o+xlQ=;
 b=tQXDwZAalSzUDt/1KHBUFX4j9bstvncsyFIq7r8uQ/h+IVdbUUAEH0dsYBklQQAWLmcg9mVGHsbv9lN75cBODqY6p46eTwjvtfKkYwJFZSjH7O5bdpk5MFZ45nbjBSYLS6iuHFavphN704Aww4KFL9h3oCg0huZ5AJ7Z5x2NEsE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5580.namprd11.prod.outlook.com (2603:10b6:510:e5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Thu, 15 Jul
 2021 22:16:12 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.024; Thu, 15 Jul 2021
 22:16:12 +0000
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/uapi: Add query for L3 bank count
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210610204626.2995262-1-John.C.Harrison@Intel.com>
 <20210610204626.2995262-4-John.C.Harrison@Intel.com>
 <CAKMK7uGO8U9a8yq73MV=xSbTA+tCQi5nqiZSD9Hwbi==fZ=R5A@mail.gmail.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <84e44807-6cbb-b156-0a13-ef7715bad66b@intel.com>
Date: Thu, 15 Jul 2021 15:16:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uGO8U9a8yq73MV=xSbTA+tCQi5nqiZSD9Hwbi==fZ=R5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:303:2b::9) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MW3PR05CA0004.namprd05.prod.outlook.com (2603:10b6:303:2b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.9 via Frontend Transport; Thu, 15 Jul 2021 22:16:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a3e859f-62ca-4f82-e0b5-08d947de2765
X-MS-TrafficTypeDiagnostic: PH0PR11MB5580:
X-Microsoft-Antispam-PRVS: <PH0PR11MB5580F4DA375C750B2E18B801BD129@PH0PR11MB5580.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Rg9kwGLxyMAd4lO5cwgetGG25yffQALnfkx+S6TERT+Wn502BIKKv64hPoZjT/XxgQWlhLnCd0vHxfeywBlUYbjJGpk4YUkNifB7Pt6GjKXCrQ6wb7XLdBArQoAGjbCzyDg6R/VVafHSauMe79biVxvuNhDS2klXswcvr1eD119LxbeOD3gioQ76xuIP05FwY06fIYl/o+4QkFxg6IOor2xZuCy9Ua5lpyZPjVCte19Udb+ZgwEaFYOaJaTaEw/k6Kh1u6XV2JNgAQ6l3CnOJ8199SxYMqHWPHtEbKJ+QrFi/9pqpnJD/n+Y4GdhpQLWJCFNUSI5sJAfXMbPW0c6k7EF6mFxAUCcoCv9hanDBZJAx3yEKFRRHIk1zZhK5sLTbcVKbhniwqLr5+Bc1XVAafuo20slZzrexBT+yXd/yCCns6dTdRzT6FqDs3syOhHaDmKKXczuQW9Id7j3lzLyccJgbcWUsEl5CXcNo95AxF2qu3LyE+n77dzLUY3HvtWpo5+GqbEmu2yDsIf/7hggsQebVR8g8zwQt4LLvzNHGt3gl2bSHAs+pnxSwOaPHXX4QPdTKdHmMUdqzyisFIUa8fjl5LiihZ/PmqNnpHv6KfX8F20dtOxQDXFnHAHL4ZwlfPqnSNalwkheRaxW7YISJl5EBmFLK1ReWAYMK8CGsINgDugeKZsQPzQK3ebIirIYhqceMfjzjhI11TFqP2Q7TeMBOwu+728E1j/YPmnM7EeFcK91gubvzkxzMrqAM1w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(86362001)(53546011)(16576012)(6916009)(956004)(2616005)(316002)(6486002)(31686004)(26005)(186003)(2906002)(66556008)(54906003)(5660300002)(38100700002)(66476007)(66946007)(8676002)(31696002)(36756003)(83380400001)(478600001)(966005)(8936002)(4326008)(6666004)(15650500001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ty9zcTllN0w2UlpiTDg5THJpZklYNkhwc0tzU3VuVFJKaHA0SnhKMFZjb0Zl?=
 =?utf-8?B?TzN0bGJ1ZzNNN0F2N29oT2lQZkRGdE5yeitJTFhaQVNhNUFjR0hSd1ZCZWg2?=
 =?utf-8?B?cU5ZU3p2MTB5MEJWUnR0SzJGcDJEOW03Q3FCQzliUTVlY2ZlNmt2cHhoaXlt?=
 =?utf-8?B?K2duZW9EbDMxbkJXbkhVY2xpR0RXYS9neHlBcHR1L0dvL2Y0NTRFM3FISk1Y?=
 =?utf-8?B?ZnlzeG40ZnNhMFhyTnJVWTN1SG5LOXoyNzhsT0dERTN1bTdaS2o2OTRBdCtB?=
 =?utf-8?B?UGZyT2RSbXUrZHVuSUxKUzN3MzlBVFBtZFBneXhxME9WL0crWlVNTnRTYnpj?=
 =?utf-8?B?a1ZMaDRsTDZaOFQrSWdqdi9jd0Jqd2RFa1VMZ3pveDIrUkd2MlV4ZTdmN2hY?=
 =?utf-8?B?c0IyWGtzbFZQVzV0MjdDbVN5YTJnKzNxWXNURjg3UkF4NjRYSzB1UnJqd1ZU?=
 =?utf-8?B?NTJ2UVZVNnEva1VIM2NSM1BxeHdBcWxLVnJLbTI1TmpjSm45Y2F5ZzNCT0lR?=
 =?utf-8?B?NjlmSFp3UXVVdnFETlFqeWE3Y050VU9EVytOVjhwa0FxNXpYU2JPNWVVTmdI?=
 =?utf-8?B?Z2RwMjFTeE5WOFRMa2s4eEFmZURGanhHRTlURGxOTC9OVDVZd2htdWlKYlFw?=
 =?utf-8?B?V1VSajFDaityRTNLMXVrMTB6TlhWRDgxYUFwNFNoSjBXZ09zaGNBRUhyT2w5?=
 =?utf-8?B?QUVISXJCeCtZMDIvUGhNWUxiUWRmWGhWbU1Hb3hVWEhIMGwrSWZGWDc4RVRy?=
 =?utf-8?B?QldDUGM3T3VyellCVkVZMjFKbGJ6WnFSRU8xcnJoRnRMOFh1SjNLMVhvcVpu?=
 =?utf-8?B?M1dFS3AyM3FZMWJrU3oxRzMzcnZMTkpxTElIenVpNytVTUJiQ2dMYkM5RjhY?=
 =?utf-8?B?TmdBUUEvUDJZSlVEOS9ZSW0ycHVNSVdDZDJaVS9tckZDbVRMM3c3YXM2R1Nr?=
 =?utf-8?B?ajl2dkhYa1ZCaG9Vb3RnTDl5WjBqSWN6ZmovaU00VTNEZjVvdVVQQ1BJblE5?=
 =?utf-8?B?djNWang2c0ZRSmtVUzA3VGM4alhVcHNKMGdoYkM5cmZiaUdoc1N5aE0zZUx4?=
 =?utf-8?B?NHVNaFczaDVDRGZYZERSaG92U2I3dDljRkZGTEJ6TUNSbnlCVnhOYUVMSzlh?=
 =?utf-8?B?S2ppOVArc05IYURFNEVmYnFzYmUzc0J0TFpFeVppM3lsSHJHWmxONFRVOEFM?=
 =?utf-8?B?cW5FaVQyZFV6cjExSWVZTjB5c1Evb1VZeE0xdnRrVTArditKQjRPeUE2NlFQ?=
 =?utf-8?B?ZFVpdVVCYXR0UWRMWDV1eExNN0YwMU5TeURwQnF5VXk5Z001NlZLZE9pR3VK?=
 =?utf-8?B?SFJBSWcxajFPSjF6Mis5bTJob1czblFtaThJQUFxWFZ4NHgzUkFMNHZmeTh5?=
 =?utf-8?B?My93VDdTZERWUVl0aWJXdnFPbnlMTE5BY3dFQVlKYTE5Q2NQc1pFeHJaTlpJ?=
 =?utf-8?B?SWJILzgyd2taZWtyUlhvc2QydFNKV3dmeXhuV0FmUHRMVkMycHN0MWhKSEVT?=
 =?utf-8?B?aFJMMVlTYkZiUUIxZG52SjRMY3Y2U2pBeGR1VGEzQklVcUs1T1Fzb2xielRU?=
 =?utf-8?B?VWdCMGYvZ2RTdzg0a1h6MHFTb1lVRE84bE1VTitZUGJsRTdwVHFjQTJXb05u?=
 =?utf-8?B?a0h3RU1KWTVSR21NdUxJS25MZUhyK2xvSVN3OHlEaE1SVW83M3R1OUphbllQ?=
 =?utf-8?B?eDlCTnhqRmZXNTlQMGdwRlR2bkQ5ZStqY293RUVLcXRzNm1HQ0trcjFBVUtP?=
 =?utf-8?Q?EnSZ/FYBszRHRLn5h8dTtregWkD4kglyX8aFv4s?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3e859f-62ca-4f82-e0b5-08d947de2765
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 22:16:12.0180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDRgffgqESqWezQhjo+lvD/GRtSBu1lJb9V9W5aVfU4IT3AuFcSfm/YoYx2L3DnwaJUuburIg9RNCRTenlka5z7kZT4YoceNZ+x92+lxpmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5580
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
Cc: intel-gfx <Intel-GFX@lists.freedesktop.org>,
 dri-devel <DRI-Devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/16/2021 03:25, Daniel Vetter wrote:
> On Thu, Jun 10, 2021 at 10:46 PM <John.C.Harrison@intel.com> wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Various UMDs need to know the L3 bank count. So add a query API for it.
> Please link to both the igt test submission for this (there's not even
> a Test-with: on the cover letter)
Is there a wiki page that describes all such tags? That is not one I was 
aware of and I can't find anything in the Kernel patch submission wiki 
or DRM maintainers wiki that mentions it.


>   and the merge requests for the
> various UMD which uses new uapi.
Is there a particular tag to use for this?

John.

>   Also as other mentioned, full uapi
> kerneldoc is needed too. Please fill in any gaps in the existing docs
> that relate to your addition directly (like we've e.g. done for the
> extension chaining when adding lmem support).
>
> Thanks, Daniel
>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt.c | 15 +++++++++++++++
>>   drivers/gpu/drm/i915/gt/intel_gt.h |  1 +
>>   drivers/gpu/drm/i915/i915_query.c  | 22 ++++++++++++++++++++++
>>   drivers/gpu/drm/i915/i915_reg.h    |  1 +
>>   include/uapi/drm/i915_drm.h        |  1 +
>>   5 files changed, 40 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index 2161bf01ef8b..708bb3581d83 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -704,3 +704,18 @@ void intel_gt_info_print(const struct intel_gt_info *info,
>>
>>          intel_sseu_dump(&info->sseu, p);
>>   }
>> +
>> +int intel_gt_get_l3bank_count(struct intel_gt *gt)
>> +{
>> +       struct drm_i915_private *i915 = gt->i915;
>> +       intel_wakeref_t wakeref;
>> +       u32 fuse3;
>> +
>> +       if (GRAPHICS_VER(i915) < 12)
>> +               return -ENODEV;
>> +
>> +       with_intel_runtime_pm(gt->uncore->rpm, wakeref)
>> +               fuse3 = intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3);
>> +
>> +       return hweight32(REG_FIELD_GET(GEN12_GT_L3_MODE_MASK, ~fuse3));
>> +}
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
>> index 7ec395cace69..46aa1cf4cf30 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
>> @@ -77,6 +77,7 @@ static inline bool intel_gt_is_wedged(const struct intel_gt *gt)
>>
>>   void intel_gt_info_print(const struct intel_gt_info *info,
>>                           struct drm_printer *p);
>> +int intel_gt_get_l3bank_count(struct intel_gt *gt);
>>
>>   void intel_gt_watchdog_work(struct work_struct *work);
>>
>> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
>> index 96bd8fb3e895..0e92bb2d21b2 100644
>> --- a/drivers/gpu/drm/i915/i915_query.c
>> +++ b/drivers/gpu/drm/i915/i915_query.c
>> @@ -10,6 +10,7 @@
>>   #include "i915_perf.h"
>>   #include "i915_query.h"
>>   #include <uapi/drm/i915_drm.h>
>> +#include "gt/intel_gt.h"
>>
>>   static int copy_query_item(void *query_hdr, size_t query_sz,
>>                             u32 total_length,
>> @@ -502,6 +503,26 @@ static int query_hwconfig_table(struct drm_i915_private *i915,
>>          return hwconfig->size;
>>   }
>>
>> +static int query_l3banks(struct drm_i915_private *i915,
>> +                        struct drm_i915_query_item *query_item)
>> +{
>> +       u32 banks;
>> +
>> +       if (query_item->length == 0)
>> +               return sizeof(banks);
>> +
>> +       if (query_item->length < sizeof(banks))
>> +               return -EINVAL;
>> +
>> +       banks = intel_gt_get_l3bank_count(&i915->gt);
>> +
>> +       if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
>> +                        &banks, sizeof(banks)))
>> +               return -EFAULT;
>> +
>> +       return sizeof(banks);
>> +}
>> +
>>   static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>>                                          struct drm_i915_query_item *query_item) = {
>>          query_topology_info,
>> @@ -509,6 +530,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>>          query_perf_config,
>>          query_memregion_info,
>>          query_hwconfig_table,
>> +       query_l3banks,
>>   };
>>
>>   int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index eb13c601d680..e9ba88fe3db7 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -3099,6 +3099,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>>   #define        GEN10_MIRROR_FUSE3              _MMIO(0x9118)
>>   #define GEN10_L3BANK_PAIR_COUNT     4
>>   #define GEN10_L3BANK_MASK   0x0F
>> +#define GEN12_GT_L3_MODE_MASK 0xFF
>>
>>   #define GEN8_EU_DISABLE0               _MMIO(0x9134)
>>   #define   GEN8_EU_DIS0_S0_MASK         0xffffff
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 87d369cae22a..20d18cca5066 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -2234,6 +2234,7 @@ struct drm_i915_query_item {
>>   #define DRM_I915_QUERY_PERF_CONFIG      3
>>   #define DRM_I915_QUERY_MEMORY_REGIONS   4
>>   #define DRM_I915_QUERY_HWCONFIG_TABLE   5
>> +#define DRM_I915_QUERY_L3_BANK_COUNT    6
>>   /* Must be kept compact -- no holes and well documented */
>>
>>          /**
>> --
>> 2.25.1
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>
>

