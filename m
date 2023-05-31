Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FA571725F
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 02:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4FD10E454;
	Wed, 31 May 2023 00:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05FC10E454;
 Wed, 31 May 2023 00:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685492654; x=1717028654;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KNRU8CSpuN5Ue18gtcC5mMzGrKGHiUceHdS9r0ACazw=;
 b=VTStzw4Y08WkkZjqJBj57q2Ow5IP304f3hjoJHr+Y02RLYFVHNKTc3Aj
 kW+yYV5LIrH+cim3umxNoKhSl26I94/BHbKmaSpFi5yW+GalklmJgnUbZ
 XGhMTPQ8FsJWFTcJEni/vkrhpp4qnyeCDGWE+LvgxpHaNDXCUqxpYKx9Y
 tDbFFSCE1Cn/OiwUVJhbctVdGH6ACMb5Lt2J79uqB66N/oImtgF0Zo2Dy
 BqM73KB41YFSPF84zUJQ5kcpZfcOe0FdPwKKgnpXb6kGz0L3QBzMhs6r/
 xTuO7Hql0cXDFybV2EwiczD0k51y4YOKT7vxaY1EZhLOLKWLIk2Nc2/j0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="344590445"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="344590445"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 17:24:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="796468627"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="796468627"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 30 May 2023 17:24:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 17:24:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 17:24:13 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 17:24:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVaVmYA9LnnLc6QqRetfElwXeHgwqZbmU+Lfj5kY6/BVZkuQGvyQSE3fjxI/ssdANzfUiLrXnneJFUUTIQuN4MEB0sK6F69FbNU5Znc2PHqNy8AJmN8APG322opjCkdyzX5SBMNcVHjhsXuhtSzmFDUdZXCVjz3Nd1F8IZZ1xOSOJppGr6WK7SZjNq6w0QpwycgZEroPEbVeqfmftCkAP1slnyRAX2hMMLkcCHl8QSv1ndNLOCo1diIN79QEEnLmiFS5/fkCEjkM9f/n9QFlEboh6AI0b/A5eDPWUsWYMsTNXWcZmzPsj+wiF1tBFDd+G31JLlz8dGWlXNmsNwdzhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zopoc/lA1GYfTu/rCrXkJX4pLVMGX69/FrAK7m5Q8tE=;
 b=IDbzwEWDxF9qldldhcXAlZCL4QxU+/B45HVbLOSJjMjZVDT40sonnBBpP0Fij763GaRoSuDQJ0Ka2armF4TUSmogLZUFuuakFGFx+8juMK1BGXkpMxpwA7g83KzM/Qx/TRZKSTUrvhD5KrWnPr+3rnziNB0tfuBmf/8l3Jr6aJOUBgPxddVxH/F3T3aAVe+tQgK5rqoZYdR4xMU23AG0UFxDR75LzX9JiDFFbpk1L1Aj06BN5m+z580T8fvvfmioLMTmuBP8fD/Ozs2nTjg45xvzvOq7HIETfEM45YAQNaEesRiZ/DPtvhCv5dgB9GGV2nnkESBE3Y+Jh1dA0k+y9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CO1PR11MB4770.namprd11.prod.outlook.com (2603:10b6:303:94::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Wed, 31 May
 2023 00:24:10 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 00:24:10 +0000
Message-ID: <2839f185-c643-c8e9-0518-10c5df030982@intel.com>
Date: Tue, 30 May 2023 17:24:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH v4] drm/i915/huc: differentiate the 2 steps of the MTL HuC
 auth flow
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230527005242.1346093-5-daniele.ceraolospurio@intel.com>
 <20230530152958.1384061-1-daniele.ceraolospurio@intel.com>
 <7e6f34eb-cb4a-6de0-3e8f-83172b4a035c@intel.com>
 <83ba1ff3-604f-00cb-d8f3-9e544d58fdde@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <83ba1ff3-604f-00cb-d8f3-9e544d58fdde@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0059.prod.exchangelabs.com (2603:10b6:a03:94::36)
 To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CO1PR11MB4770:EE_
X-MS-Office365-Filtering-Correlation-Id: 2278a447-899a-41fa-f49a-08db616d5a6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fb2XRxkSTLM45LBAPeTFCqcBWt0bGFhZujubz/5eqnWkHoON+HuvA+39b4jZRLugjcGyE/pmFPHS9SXkpEq7It2W/mM3T8g4Iyl0EU0LvzOpH8ZCRJe3ryTXNGuE58CcibCaiZTmJVJ36ZASMbqHVGepGZlTJRYZa/THmQm92BXBI2g9nOqjunyG1mBIpAUXvRFaKOHsGkrgHYt13pesARFwGxhQLK1GBf1sJQANzPdfBtlyvrb7iOXRXxI/+gxQppfwrstjl76z6VgLuJE2MfAvcadhCdqNH7A3DfgPButxH0Swcxy8tO1zfHyrpR0z5rAHvpwRn+NVb3wXutZu1BytwFerzewfYFm4EuYCemSsLmXQpQaYB4DyC9KF/YWKsjJU8pxuFJwQtjq5Xik6D0z0YWBEJuAo93wPOqbgNWnETCc2p3GlHJAjQE6PlpXTb+s3p5oMrkPnoKBV1ubVK1E7wSNiqeab61Fa/TrLkFQcQfDeox2vP/QdSsROy1ozger6KET9MREX0KQlVoG6qwgD7k6RzEgnaP2ut1urpVoX5JvfPFzuO4D4bsu6OfD5I2byk9NbL/wMua8uCuPf7ADjgoxmNCs2QB8i1HWdGGSBZJAjgu67IZxDAf2haGoYE4nvJCvII7kGFGDW0LaLgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199021)(82960400001)(31686004)(38100700002)(478600001)(86362001)(66946007)(66556008)(83380400001)(2616005)(66476007)(450100002)(4326008)(31696002)(30864003)(2906002)(6666004)(53546011)(6486002)(186003)(26005)(316002)(6506007)(6512007)(41300700001)(36756003)(107886003)(5660300002)(8676002)(966005)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3U4UTV4cHpQZEJTdEJqMHVBd1MvUXN5K0dHRVAvenBVeXVpeHZQNER6WWtK?=
 =?utf-8?B?N0tjc3NSOWVkSXVsRWRiVzNZS2JScEhMTElNeVNCZ3hmQXROZmdBMUF2aU9G?=
 =?utf-8?B?V2l5L2dkY0FhelF6ZGpkS2hQVTFMUHhzQzhnWGlaZVVNaWhaN0lzR2w2ZzRo?=
 =?utf-8?B?L2U1cXNBT3ZFWDAyWi9TZ0JwVUtOTjlJTjJyTlFsbDR5YjRiNTYzaG10d0h0?=
 =?utf-8?B?d1l4dmpMeGdzbkhhVmE0Q1ZzVGdsUVJVUmY1azd0aHFjUlZIdktRVU5GVGh2?=
 =?utf-8?B?TGFFV2N4UjlRTVJxQUZwNEtpVXVCR1JtRFdrdzJLR0VKNGg5aTlHczBmMEJT?=
 =?utf-8?B?NmlxeXBjaFI3Rm15Q3FuT3R4SFpKbzY2KzV5R09EbGJnWTFXUGpJR0R6ODhT?=
 =?utf-8?B?Qkt6ZGkzdEkrWUJoWVN6VkNUMHBHSG5Ic0FRSjA3akdkMlM1R3lkZlhmS1Fz?=
 =?utf-8?B?QUxKR0JrNDJuMUlRb3c0ZkxGbk5GMWlHTzhFMWpMbjNDMERLUGFGQnptSzZk?=
 =?utf-8?B?RStjWTZ4Wmw2OHowVzZDNjMyamFGMFRrNnF4UHRoV3JIYklJb2VSbVJ6VXFU?=
 =?utf-8?B?QTczSlMrcmpENmZ0OFY5OWZlalpHS3R2M2RtSlJGNTh6VUVoZSs5cWRJK25D?=
 =?utf-8?B?MlpYUWZyRUxyN3Q0YjdJYnZ1d2tJK0t5d2VKVnVUNmxUOWg3RG40N0xqRndY?=
 =?utf-8?B?MWhaZzlHeVR6MEVEdGpNUmszN1A0TFZ0QzJ5bWxBN1VhMEs4NHZlSnVBNHBC?=
 =?utf-8?B?QjBvSzVtVXJRaEZseDhCUG1QOEFpc21BUkJtVWpzS0VEK0Z0SFhLcVNKVXlW?=
 =?utf-8?B?T1Z2OEFFSUliLzMrQVpnYnJrRnFoU1hIYlZKUE9RYkVSdTZvQnFSM0JWM1gv?=
 =?utf-8?B?TSthSmZVRnhGcmxLTzJLMUszL2pjNzZyUzJHcmp1Mk9vM1BHU2RyUW83b3Fj?=
 =?utf-8?B?ZEtud21tRkRZb204VWMvNDVtZHB3eG9QUzJqRUFiZnJydm05Rkkxa0Q1R3Va?=
 =?utf-8?B?RlpVYlJLdE9BSFMvazZyZjBsMGNaQVgzdjczNUtrYlhWaEcvK3pWN1l5S0lp?=
 =?utf-8?B?d1FFWEVGeThwdnB1NWtBMk5QU1FrbGc2d2dsV0RULzFQZnQ5YkFOOHJsN2Q0?=
 =?utf-8?B?TFBKT1ZUUUcxVVJvc0FLWXhmVTVieWJvR3UzVmpMZUZYVHM1NjgxUWZOUEp4?=
 =?utf-8?B?UFZyS2NWRHVTY0R1NWliSE5penNkR2VSZkR0cUVLdVlXRnVFSXhsNldMT2l3?=
 =?utf-8?B?VzlYejdFR1RsanR6K09UUXJOejlxbGZEeGZmalZLeVhsVzlZNUcrOUI3R1k4?=
 =?utf-8?B?ZHJjM2E4SDE3cHZLVDdxQmJ0QnVrR3hGaVdRdXZiSFkwMGhBcmM4Mmh0ZTVP?=
 =?utf-8?B?QTY5aGRRZkJvZlIxL1BWRURPSnZHQjVVeU9GY1NCMTd6TWswUTBxZG1tSUpn?=
 =?utf-8?B?a3BHdENudzNwMXA5MXNJaUlkdVNIVnU5cVdTZ1JKd00vRXpGQnAyNTIwUU9S?=
 =?utf-8?B?cVF6S1JsTlRnbEkrSXIzbjNQeWY2VVJVQm4wbzU1Vzd5Tko3ZEdqU3NqOGQ2?=
 =?utf-8?B?RDB6OGNrYUtNckRWY1VqYlR1V1JETWU2OE9PTzZPb3VYcmd6VDcyNW92bnlW?=
 =?utf-8?B?NzZISDdSbEI3N2VxSjhyemNzTllwRGJRNFluNVlUSm9URmpLZVM0a1lsUnhl?=
 =?utf-8?B?RzZjS2JxbllrVDA5L2VpdXZWMDRhMTFCQk16L29hQVhtWkNFemc4K1Q3c1ZV?=
 =?utf-8?B?S0dHTkswSml5aGoxRi83Q3JYZklXR2JzUkU1Slp6ZHg5dG9OeEs4TDFCWmM1?=
 =?utf-8?B?MjBmNDkvaGJJR205VUhzRTlXeEg3Q2daOTRIZ0tUNkxIYXBqU2IxUHozZ25w?=
 =?utf-8?B?aC9DSEY0VG1yckJ5eEczcmY5TVhtY3R6ZkZQUlFMb3h5cmJ4NFJKa0hVYjBh?=
 =?utf-8?B?aGFDdlpwRUNRWkhHN0dkaHhHOGtldjU4Y2JhdUpUbUp1eWtabWM3eEF6MjlX?=
 =?utf-8?B?cmR2cGdVbUY0bkR5OWc4S0dMUW1lMXpTVmFoSXkzT2R4dVNzaDZxUWE1blU1?=
 =?utf-8?B?dzRsQ0hvMUUwdm5BQm5NQzluVUhDVjdTc05jMXdSSlU2SGlQZXNndmxPZkRt?=
 =?utf-8?B?dEV5OVF2eEdoNWFQZTdkYkRIWEs0bEQvYlpEU0dDRVdZcFBxZGl5OXdMcmlF?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2278a447-899a-41fa-f49a-08db616d5a6c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 00:24:10.1451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7Ygl/eIjYKOS4GO6f0naf9N2ZRnyKiVK11QdkgfTAW0oiXBYH62/9/DwIrosNby9wLOrvoJC1iji5oMJdU8BndmN5JDdzPd5ITWemo7W6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4770
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/30/2023 17:14, Ceraolo Spurio, Daniele wrote:
> On 5/30/2023 5:01 PM, John Harrison wrote:
>> On 5/30/2023 08:29, Daniele Ceraolo Spurio wrote:
>>> Before we add the second step of the MTL HuC auth (via GSC), we need to
>>> have the ability to differentiate between them. To do so, the huc
>>> authentication check is duplicated for GuC and GSC auth, with meu
>> meu?
>
> leftover from the meu drop. Will reword.
>
>>
>>> binaries being considered fully authenticated only after the GSC auth
>>> step.
>>>
>>> To report the difference between the 2 auth steps, a new case is added
>>> to the HuC getparam. This way, the clear media driver can start
>>> submitting before full auth, as partial auth is enough for those
>>> workloads.
>>>
>>> v2: fix authentication status check for DG2
>>>
>>> v3: add a better comment at the top of the HuC file to explain the
>>>      different approaches to load and auth (John)
>>>
>>> v4: update call to intel_huc_is_authenticated in the pxp code to check
>>> for GSC authentication
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com> #v2
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c     | 111 
>>> ++++++++++++++++-----
>>>   drivers/gpu/drm/i915/gt/uc/intel_huc.h     |  16 ++-
>>>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c  |   4 +-
>>>   drivers/gpu/drm/i915/i915_reg.h            |   3 +
>>>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c |   2 +-
>>>   include/uapi/drm/i915_drm.h                |   3 +-
>>>   6 files changed, 104 insertions(+), 35 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> index 37c6a8ca5c71..ab5246ae3979 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> @@ -10,6 +10,7 @@
>>>   #include "intel_huc.h"
>>>   #include "intel_huc_print.h"
>>>   #include "i915_drv.h"
>>> +#include "i915_reg.h"
>>>     #include <linux/device/bus.h>
>>>   #include <linux/mei_aux.h>
>>> @@ -22,15 +23,23 @@
>>>    * capabilities by adding HuC specific commands to batch buffers.
>>>    *
>>>    * The kernel driver is only responsible for loading the HuC 
>>> firmware and
>>> - * triggering its security authentication, which is performed by 
>>> the GuC on
>>> - * older platforms and by the GSC on newer ones. For the GuC to 
>>> correctly
>>> - * perform the authentication, the HuC binary must be loaded before 
>>> the GuC one.
>>> + * triggering its security authentication. This is done differently 
>>> depending
>>> + * on the platform:
>>> + * - older platforms (from Gen9 to most Gen12s): the load is 
>>> performed via DMA
>>> + *   and the authentication via GuC
>>> + * - DG2: load and authentication are both performed via GSC.
>>> + * - MTL and newer platforms: the load is performed via DMA (same 
>>> as with
>>> + *   not-DG2 older platforms), while the authentication is done in 
>>> 2-steps,
>>> + *   a first auth for clear-media workloads via GuC and a second 
>>> one for all
>>> + *   workloads via GSC.
>>> + * On platforms where the GuC does the authentication, to correctly 
>>> do so the
>>> + * HuC binary must be loaded before the GuC one.
>>>    * Loading the HuC is optional; however, not using the HuC might 
>>> negatively
>>>    * impact power usage and/or performance of media workloads, 
>>> depending on the
>>>    * use-cases.
>>>    * HuC must be reloaded on events that cause the WOPCM to lose its 
>>> contents
>>> - * (S3/S4, FLR); GuC-authenticated HuC must also be reloaded on 
>>> GuC/GT reset,
>>> - * while GSC-managed HuC will survive that.
>>> + * (S3/S4, FLR); on older platforms the HuC must also be reloaded 
>>> on GuC/GT
>>> + * reset, while on newer ones it will survive that.
>>>    *
>>>    * See https://github.com/intel/media-driver for the latest 
>>> details on HuC
>>>    * functionality.
>>> @@ -106,7 +115,7 @@ static enum hrtimer_restart 
>>> huc_delayed_load_timer_callback(struct hrtimer *hrti
>>>   {
>>>       struct intel_huc *huc = container_of(hrtimer, struct 
>>> intel_huc, delayed_load.timer);
>>>   -    if (!intel_huc_is_authenticated(huc)) {
>>> +    if (!intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC)) {
>>>           if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
>>>               huc_notice(huc, "timed out waiting for MEI GSC\n");
>>>           else if (huc->delayed_load.status == 
>>> INTEL_HUC_WAITING_ON_PXP)
>>> @@ -124,7 +133,7 @@ static void huc_delayed_load_start(struct 
>>> intel_huc *huc)
>>>   {
>>>       ktime_t delay;
>>>   -    GEM_BUG_ON(intel_huc_is_authenticated(huc));
>>> +    GEM_BUG_ON(intel_huc_is_authenticated(huc, 
>>> INTEL_HUC_AUTH_BY_GSC));
>>>         /*
>>>        * On resume we don't have to wait for MEI-GSC to be 
>>> re-probed, but we
>>> @@ -284,13 +293,23 @@ void intel_huc_init_early(struct intel_huc *huc)
>>>       }
>>>         if (GRAPHICS_VER(i915) >= 11) {
>>> -        huc->status.reg = GEN11_HUC_KERNEL_LOAD_INFO;
>>> -        huc->status.mask = HUC_LOAD_SUCCESSFUL;
>>> -        huc->status.value = HUC_LOAD_SUCCESSFUL;
>>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].reg = 
>>> GEN11_HUC_KERNEL_LOAD_INFO;
>>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].mask = HUC_LOAD_SUCCESSFUL;
>>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].value = 
>>> HUC_LOAD_SUCCESSFUL;
>>>       } else {
>>> -        huc->status.reg = HUC_STATUS2;
>>> -        huc->status.mask = HUC_FW_VERIFIED;
>>> -        huc->status.value = HUC_FW_VERIFIED;
>>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].reg = HUC_STATUS2;
>>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].mask = HUC_FW_VERIFIED;
>>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].value = HUC_FW_VERIFIED;
>>> +    }
>>> +
>>> +    if (IS_DG2(i915)) {
>>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].reg = 
>>> GEN11_HUC_KERNEL_LOAD_INFO;
>>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].mask = HUC_LOAD_SUCCESSFUL;
>>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].value = 
>>> HUC_LOAD_SUCCESSFUL;
>>> +    } else {
>>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].reg = 
>>> HECI_FWSTS5(MTL_GSC_HECI1_BASE);
>>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].mask = 
>>> HECI_FWSTS5_HUC_AUTH_DONE;
>>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].value = 
>>> HECI_FWSTS5_HUC_AUTH_DONE;
>>>       }
>>>   }
>>>   @@ -381,28 +400,38 @@ void intel_huc_suspend(struct intel_huc *huc)
>>>       delayed_huc_load_complete(huc);
>>>   }
>>>   -int intel_huc_wait_for_auth_complete(struct intel_huc *huc)
>>> +static const char *auth_mode_string(struct intel_huc *huc,
>>> +                    enum intel_huc_authentication_type type)
>>> +{
>>> +    bool partial = huc->fw.has_gsc_headers && type == 
>>> INTEL_HUC_AUTH_BY_GUC;
>>> +
>>> +    return partial ? "clear media" : "all workloads";
>>> +}
>>> +
>>> +int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
>>> +                     enum intel_huc_authentication_type type)
>>>   {
>>>       struct intel_gt *gt = huc_to_gt(huc);
>>>       int ret;
>>>         ret = __intel_wait_for_register(gt->uncore,
>>> -                    huc->status.reg,
>>> -                    huc->status.mask,
>>> -                    huc->status.value,
>>> +                    huc->status[type].reg,
>>> +                    huc->status[type].mask,
>>> +                    huc->status[type].value,
>>>                       2, 50, NULL);
>>>         /* mark the load process as complete even if the wait failed */
>>>       delayed_huc_load_complete(huc);
>>>         if (ret) {
>>> -        huc_err(huc, "firmware not verified %pe\n", ERR_PTR(ret));
>>> +        huc_err(huc, "firmware not verified for %s: %pe\n",
>>> +            auth_mode_string(huc, type), ERR_PTR(ret));
>>>           intel_uc_fw_change_status(&huc->fw, 
>>> INTEL_UC_FIRMWARE_LOAD_FAIL);
>>>           return ret;
>>>       }
>>>         intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
>>> -    huc_info(huc, "authenticated!\n");
>>> +    huc_info(huc, "authenticated for %s!\n", auth_mode_string(huc, 
>>> type));
>> Not a blocker but should this have an exclamation? It sort of implies 
>> the authentication is unexpected.
>
> I can drop it. I just left it because it was already there.
Indeed. I'm just wondering if you know if there was a good reason for it 
being added in the original message?

Hmm, it looks like Michal added it as part of the drm_info -> huc_info 
update. Maybe check with him? But to me an exclamation implies an error 
or other exceptional circumstance. So I would drop it myself.

John.


>
>>
>>>       return 0;
>>>   }
>>>   @@ -442,7 +471,7 @@ int intel_huc_auth(struct intel_huc *huc)
>>>       }
>>>         /* Check authentication status, it should be done by now */
>>> -    ret = intel_huc_wait_for_auth_complete(huc);
>>> +    ret = intel_huc_wait_for_auth_complete(huc, 
>>> INTEL_HUC_AUTH_BY_GUC);
>>>       if (ret)
>>>           goto fail;
>>>   @@ -453,16 +482,29 @@ int intel_huc_auth(struct intel_huc *huc)
>>>       return ret;
>>>   }
>>>   -bool intel_huc_is_authenticated(struct intel_huc *huc)
>>> +bool intel_huc_is_authenticated(struct intel_huc *huc,
>>> +                enum intel_huc_authentication_type type)
>>>   {
>>>       struct intel_gt *gt = huc_to_gt(huc);
>>>       intel_wakeref_t wakeref;
>>>       u32 status = 0;
>>>         with_intel_runtime_pm(gt->uncore->rpm, wakeref)
>>> -        status = intel_uncore_read(gt->uncore, huc->status.reg);
>>> +        status = intel_uncore_read(gt->uncore, huc->status[type].reg);
>>>   -    return (status & huc->status.mask) == huc->status.value;
>>> +    return (status & huc->status[type].mask) == 
>>> huc->status[type].value;
>>> +}
>>> +
>>> +static bool huc_is_fully_authenticated(struct intel_huc *huc)
>>> +{
>>> +    struct intel_uc_fw *huc_fw = &huc->fw;
>>> +
>>> +    if (!huc_fw->has_gsc_headers)
>>> +        return intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GUC);
>>> +    else if (intel_huc_is_loaded_by_gsc(huc) || 
>>> HAS_ENGINE(huc_to_gt(huc), GSC0))
>>> +        return intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC);
>>> +    else
>>> +        return false;
>>>   }
>>>     /**
>>> @@ -477,7 +519,9 @@ bool intel_huc_is_authenticated(struct intel_huc 
>>> *huc)
>>>    */
>>>   int intel_huc_check_status(struct intel_huc *huc)
>>>   {
>>> -    switch (__intel_uc_fw_status(&huc->fw)) {
>>> +    struct intel_uc_fw *huc_fw = &huc->fw;
>>> +
>>> +    switch (__intel_uc_fw_status(huc_fw)) {
>>>       case INTEL_UC_FIRMWARE_NOT_SUPPORTED:
>>>           return -ENODEV;
>>>       case INTEL_UC_FIRMWARE_DISABLED:
>>> @@ -494,7 +538,17 @@ int intel_huc_check_status(struct intel_huc *huc)
>>>           break;
>>>       }
>>>   -    return intel_huc_is_authenticated(huc);
>>> +    /*
>>> +     * meu binaries loaded by GuC are first partially authenticated 
>>> by GuC
>> meu?
>>
>
> Same as the other one, will fix.
>
> Daniele
>
>> John.
>>
>>
>>> +     * and then fully authenticated by GSC
>>> +     */
>>> +    if (huc_is_fully_authenticated(huc))
>>> +        return 1; /* full auth */
>>> +    else if (huc_fw->has_gsc_headers && 
>>> !intel_huc_is_loaded_by_gsc(huc) &&
>>> +         intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GUC))
>>> +        return 2; /* clear media only */
>>> +    else
>>> +        return 0;
>>>   }
>>>     static bool huc_has_delayed_load(struct intel_huc *huc)
>>> @@ -508,7 +562,10 @@ void intel_huc_update_auth_status(struct 
>>> intel_huc *huc)
>>>       if (!intel_uc_fw_is_loadable(&huc->fw))
>>>           return;
>>>   -    if (intel_huc_is_authenticated(huc))
>>> +    if (!huc->fw.has_gsc_headers)
>>> +        return;
>>> +
>>> +    if (huc_is_fully_authenticated(huc))
>>>           intel_uc_fw_change_status(&huc->fw,
>>>                         INTEL_UC_FIRMWARE_RUNNING);
>>>       else if (huc_has_delayed_load(huc))
>>> @@ -541,5 +598,5 @@ void intel_huc_load_status(struct intel_huc 
>>> *huc, struct drm_printer *p)
>>>         with_intel_runtime_pm(gt->uncore->rpm, wakeref)
>>>           drm_printf(p, "HuC status: 0x%08x\n",
>>> -               intel_uncore_read(gt->uncore, huc->status.reg));
>>> +               intel_uncore_read(gt->uncore, 
>>> huc->status[INTEL_HUC_AUTH_BY_GUC].reg));
>>>   }
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>>> index 112f0dce4702..3f6aa7c37abc 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>>> @@ -22,6 +22,12 @@ enum intel_huc_delayed_load_status {
>>>       INTEL_HUC_DELAYED_LOAD_ERROR,
>>>   };
>>>   +enum intel_huc_authentication_type {
>>> +    INTEL_HUC_AUTH_BY_GUC = 0,
>>> +    INTEL_HUC_AUTH_BY_GSC,
>>> +    INTEL_HUC_AUTH_MAX_MODES
>>> +};
>>> +
>>>   struct intel_huc {
>>>       /* Generic uC firmware management */
>>>       struct intel_uc_fw fw;
>>> @@ -31,7 +37,7 @@ struct intel_huc {
>>>           i915_reg_t reg;
>>>           u32 mask;
>>>           u32 value;
>>> -    } status;
>>> +    } status[INTEL_HUC_AUTH_MAX_MODES];
>>>         struct {
>>>           struct i915_sw_fence fence;
>>> @@ -49,10 +55,12 @@ int intel_huc_init(struct intel_huc *huc);
>>>   void intel_huc_fini(struct intel_huc *huc);
>>>   void intel_huc_suspend(struct intel_huc *huc);
>>>   int intel_huc_auth(struct intel_huc *huc);
>>> -int intel_huc_wait_for_auth_complete(struct intel_huc *huc);
>>> +int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
>>> +                     enum intel_huc_authentication_type type);
>>> +bool intel_huc_is_authenticated(struct intel_huc *huc,
>>> +                enum intel_huc_authentication_type type);
>>>   int intel_huc_check_status(struct intel_huc *huc);
>>>   void intel_huc_update_auth_status(struct intel_huc *huc);
>>> -bool intel_huc_is_authenticated(struct intel_huc *huc);
>>>     void intel_huc_register_gsc_notifier(struct intel_huc *huc, 
>>> const struct bus_type *bus);
>>>   void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, 
>>> const struct bus_type *bus);
>>> @@ -81,7 +89,7 @@ static inline bool 
>>> intel_huc_is_loaded_by_gsc(const struct intel_huc *huc)
>>>   static inline bool intel_huc_wait_required(struct intel_huc *huc)
>>>   {
>>>       return intel_huc_is_used(huc) && 
>>> intel_huc_is_loaded_by_gsc(huc) &&
>>> -           !intel_huc_is_authenticated(huc);
>>> +           !intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC);
>>>   }
>>>     void intel_huc_load_status(struct intel_huc *huc, struct 
>>> drm_printer *p);
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>>> index 3355dc1e2bc6..d2b4176c81d6 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>>> @@ -160,7 +160,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct 
>>> intel_huc *huc)
>>>        * component gets re-bound and this function called again. If 
>>> so, just
>>>        * mark the HuC as loaded.
>>>        */
>>> -    if (intel_huc_is_authenticated(huc)) {
>>> +    if (intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC)) {
>>>           intel_uc_fw_change_status(&huc->fw, 
>>> INTEL_UC_FIRMWARE_RUNNING);
>>>           return 0;
>>>       }
>>> @@ -173,7 +173,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct 
>>> intel_huc *huc)
>>>         intel_uc_fw_change_status(&huc->fw, 
>>> INTEL_UC_FIRMWARE_TRANSFERRED);
>>>   -    return intel_huc_wait_for_auth_complete(huc);
>>> +    return intel_huc_wait_for_auth_complete(huc, 
>>> INTEL_HUC_AUTH_BY_GSC);
>>>   }
>>>     /**
>>> diff --git a/drivers/gpu/drm/i915/i915_reg.h 
>>> b/drivers/gpu/drm/i915/i915_reg.h
>>> index 0523418129c5..c14433795c91 100644
>>> --- a/drivers/gpu/drm/i915/i915_reg.h
>>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>>> @@ -941,6 +941,9 @@
>>>   #define HECI_H_GS1(base)    _MMIO((base) + 0xc4c)
>>>   #define   HECI_H_GS1_ER_PREP    REG_BIT(0)
>>>   +#define HECI_FWSTS5(base)        _MMIO(base + 0xc68)
>>> +#define   HECI_FWSTS5_HUC_AUTH_DONE    (1 << 19)
>>> +
>>>   #define HSW_GTT_CACHE_EN    _MMIO(0x4024)
>>>   #define   GTT_CACHE_EN_ALL    0xF0007FFF
>>>   #define GEN7_WR_WATERMARK    _MMIO(0x4028)
>>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c 
>>> b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
>>> index 8dc41de3f6f7..016bd8fad89d 100644
>>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
>>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
>>> @@ -196,7 +196,7 @@ bool 
>>> intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp)
>>>        * gsc-proxy init flow (the last set of dependencies that
>>>        * are out of order) will suffice.
>>>        */
>>> -    if (intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc) &&
>>> +    if (intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc, 
>>> INTEL_HUC_AUTH_BY_GSC) &&
>>> intel_gsc_uc_fw_proxy_init_done(&pxp->ctrl_gt->uc.gsc))
>>>           return true;
>>>   diff --git a/include/uapi/drm/i915_drm.h 
>>> b/include/uapi/drm/i915_drm.h
>>> index f31dfacde601..a1848e806059 100644
>>> --- a/include/uapi/drm/i915_drm.h
>>> +++ b/include/uapi/drm/i915_drm.h
>>> @@ -674,7 +674,8 @@ typedef struct drm_i915_irq_wait {
>>>    * If the IOCTL is successful, the returned parameter will be set 
>>> to one of the
>>>    * following values:
>>>    *  * 0 if HuC firmware load is not complete,
>>> - *  * 1 if HuC firmware is authenticated and running.
>>> + *  * 1 if HuC firmware is loaded and fully authenticated,
>>> + *  * 2 if HuC firmware is loaded and authenticated for clear media 
>>> only
>>>    */
>>>   #define I915_PARAM_HUC_STATUS         42
>>
>

